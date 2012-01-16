//======================================================================
//
// Project:     XTIDE Universal BIOS, Serial Port Server
//
// File:        Win32Serial.cpp - Microsoft Windows serial code
//
// Support for the serial port under Win32.
// 

#include <stdio.h>

#include "..\library\library.h"
#include "Win32Serial.h"

COMMTIMEOUTS timeouts;

DCB dcb;

Win32Serial::~Win32Serial()
{
	if( pipe )
		CloseHandle( pipe );

	pipe = NULL;
}

Win32Serial::Win32Serial( char *name, struct baudRate *baudRate ) : Serial( name, baudRate )
{
	char buff1[20], buff2[1024];

	pipe = NULL;
	
	if( !name )
	{
		for( int t = 1; t <= 30 && !name; t++ )
		{
			sprintf( buff1, "COM%d", t );
			if( QueryDosDeviceA( buff1, buff2, sizeof(buff2) ) )
				name = buff1;
		}
		if( !name )
			log( -1, "No physical COM ports found" );
	}

	if( !strcmp( name, "PIPE" ) )
	{
		log( 0, "Opening named pipe %s (simulating %lu baud)", PIPENAME, baudRate->rate );
		
		pipe = CreateNamedPipeA( PIPENAME, PIPE_ACCESS_DUPLEX, PIPE_TYPE_BYTE|PIPE_REJECT_REMOTE_CLIENTS, 2, 1024, 1024, 0, NULL );
		if( !pipe )
			log( -1, "Could not CreateNamedPipe " PIPENAME );
		
		if( !ConnectNamedPipe( pipe, NULL ) )
			log( -1, "Could not ConnectNamedPipe" );

		speedEmulation = 1;
		resetConnection = 1;
	}
	else
	{
		if( QueryDosDeviceA( name, buff2, sizeof(buff2) ) )
		{
			log( 0, "Opening %s (%lu baud)", name, baudRate->rate );
			
			pipe = CreateFileA( name, GENERIC_READ|GENERIC_WRITE, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0 );
			if( !pipe )
				log( -1, "Could not Open \"%s\"", name );
			
			FillMemory(&dcb, sizeof(dcb), 0);
			dcb.DCBlength = sizeof(dcb);
			dcb.BaudRate = baudRate->rate;
			dcb.ByteSize = 8;
			dcb.StopBits = ONESTOPBIT;
			dcb.Parity = NOPARITY;
			if( !SetCommState( pipe, &dcb ) )
				log( -1, "Could not SetCommState" );

			if( !SetCommTimeouts( pipe, &timeouts ) )
				log( -1, "Could not SetCommTimeouts" );
		}
		else
		{
			char logbuff[ 1024 ];
			int found = 0;

			sprintf( logbuff, "serial port '%s' not found, detected COM ports:", name );

			for( int t = 1; t <= 40; t++ )
			{
				sprintf( buff1, "COM%d", t );
				if( QueryDosDeviceA( buff1, buff2, sizeof(buff2) ) )
				{
					strcat( logbuff, "\n    " );
					strcat( logbuff, buff1 );
					found = 1;
				}
			}
			if( !found )
				strcat( logbuff, "\n    (none)" );

			log( -1, logbuff );
		}
	}
}

unsigned long Win32Serial::readCharacters( void *buff, unsigned long len )
{
	unsigned long readLen;
	int ret;
	ret = ReadFile( pipe, buff, len, &readLen, NULL );
	return( ret ? readLen : 0 );
}

unsigned long Win32Serial::writeCharacters( void *buff, unsigned long len )
{
	unsigned long writeLen;
	int ret;
	ret = WriteFile( pipe, buff, len, &writeLen, NULL );
	return( ret ? writeLen : 0 );
}






