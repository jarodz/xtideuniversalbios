;;;======================================================================
;;;
;;; This file is generated by StringsCompress.pl from source in Strings.asm
;;; DO NOT EDIT DIRECTLY - See the makefile for how to rebuild this file.
;;; This file only needs to be rebuilt if Strings.asm is changed.
;;;
;;;======================================================================

; Project name	:	XTIDE Universal BIOS
; Description	:	Strings and equates for BIOS messages.

%ifdef MODULE_STRINGS_COMPRESSED_PRECOMPRESS
%include "Display.inc"
%endif

; Section containing code
SECTION .text

; The following strings are used by DetectPrint_StartDetectWithMasterOrSlaveStringInAXandIdeVarsInCSBP
; To support an optimization in that code, these strings must start on the same 256 byte page,
; which is checked at assembly time below.
;
g_szDetectStart:
g_szDetectMaster:		; db	"Master",NULL
                 		; db	 4dh,  61h,  73h,  74h,  65h,  72h,  00h    ; uncompressed
                 		  db	 53h,  67h,  79h,  7ah,  6bh, 0b8h          ; compressed

g_szDetectSlave:		; db	"Slave ",NULL
                		; db	 53h,  6ch,  61h,  76h,  65h,  20h,  00h    ; uncompressed
                		  db	 59h,  72h,  67h,  7ch,  6bh,  00h          ; compressed

g_szDetectOuter:		; db	"IDE %s at %s: ",NULL
                		; db	 49h,  44h,  45h,  20h,  25h,  73h,  20h,  61h,  74h,  20h,  25h,  73h,  3ah,  20h,  00h    ; uncompressed
                		  db	 4fh,  4ah, 0cbh,  3eh,  20h,  67h, 0fah,  3eh,  40h,  00h                                  ; compressed

g_szDetectPort:			; db	"%x",NULL					   	; IDE Master at 1F0h:
               			; db	 25h,  78h,  00h    ; uncompressed
               			  db	 19h                ; compressed

g_szDetectCOM:			; db  "COM%c%s",NULL
              			; db   43h,  4fh,  4dh,  25h,  63h,  25h,  73h,  00h    ; uncompressed
              			  db   49h,  55h,  53h,  35h,  1eh                      ; compressed

g_szDetectCOMAuto:		; db	" Auto",NULL
                  		; db	 20h,  41h,  75h,  74h,  6fh,  00h    ; uncompressed
                  		  db	 20h,  47h,  7bh,  7ah, 0b5h          ; compressed

g_szDetectCOMSmall:		; db	"/%u%u00",NULL					; IDE Master at COM1/9600:
                   		; db	 2fh,  25h,  75h,  25h,  75h,  30h,  30h,  00h    ; uncompressed
                   		  db	 2ah,  37h,  37h,  34h,  14h                      ; compressed

g_szDetectEnd:
g_szDetectCOMLarge:		; db	"/%u.%uK",NULL					; IDE Master at COM1/19.2K:
                   		; db	 2fh,  25h,  75h,  2eh,  25h,  75h,  4bh,  00h    ; uncompressed
                   		  db	 2ah,  37h,  29h,  37h,  91h                      ; compressed


%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if ((g_szDetectEnd-$$) & 0xff00) <> ((g_szDetectStart-$$) & 0xff00)
%error "g_szDetect* strings must start on the same 256 byte page, required by DetectPrint_StartDetectWithMasterOrSlaveStringInAXandIdeVarsInCSBP.  Please move this block up or down within strings.asm"
%endif
%endif

; Boot Menu menuitem strings
;
; The following strings are used by BootMenuPrint_* routines.
; To support optimizations in that code, these strings must start on the same 256 byte page,
; which is checked at assembly time below.
;
g_szBootMenuPrintStart:
g_szDriveNum:			; db	"%x %s",NULL
             			; db	 25h,  78h,  20h,  25h,  73h,  00h    ; uncompressed
             			  db	 39h,  20h,  1eh                      ; compressed

g_szDriveNumBOOTNFO:	; db	"%x %z",NULL
                    	; db	 25h,  78h,  20h,  25h,  7ah,  00h    ; uncompressed
                    	  db	 39h,  20h,  1fh                      ; compressed

g_szFloppyDrv:			; db	"Floppy Drive %c",NULL
              			; db	 46h,  6ch,  6fh,  70h,  70h,  79h,  20h,  44h,  72h,  69h,  76h,  65h,  20h,  25h,  63h,  00h    ; uncompressed
              			  db	 4ch,  72h,  75h,  76h,  76h, 0ffh,  4ah,  78h,  6fh,  7ch, 0ebh,  15h                            ; compressed

g_szBootMenuPrintEnd:
g_szForeignHD:			; db	"Foreign Hard Disk",NULL
              			; db	 46h,  6fh,  72h,  65h,  69h,  67h,  6eh,  20h,  48h,  61h,  72h,  64h,  20h,  44h,  69h,  73h,  6bh,  00h    ; uncompressed
              			  db	 4ch,  75h,  78h,  6bh,  6fh,  6dh, 0f4h,  4eh,  67h,  78h, 0eah,  4ah,  6fh,  79h, 0b1h                      ; compressed


%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if ((g_szBootMenuPrintStart-$$) & 0xff00) <> ((g_szBootMenuPrintEnd-$$) & 0xff00)
%error "g_szBootMenuPrint* strings must start on the same 256 byte page, required by the BootMenuPrint_* routines.  Please move this block up or down within strings.asm"
%endif
%endif

; POST drive detection strings
g_szRomAt:		; db	"%s @ %x",LF,CR,NULL
          		; db	 25h,  73h,  20h,  40h,  20h,  25h,  78h,  0ah,  0dh,  00h    ; uncompressed
          		  db	 3eh,  20h, 0c6h,  39h,  1bh                                  ; compressed


; Boot loader strings
g_szTryToBoot:			; db	"Booting from %s %x",ANGLE_QUOTE_RIGHT,"%x",LF,CR,NULL
              			; db	 42h,  6fh,  6fh,  74h,  69h,  6eh,  67h,  20h,  66h,  72h,  6fh,  6dh,  20h,  25h,  73h,  20h,  25h,  78h, 0afh,  25h,  78h,  0ah,  0dh,  00h    ; uncompressed
              			  db	 48h,  75h,  75h,  7ah,  6fh,  74h, 0edh,  6ch,  78h,  75h, 0f3h,  3eh,  20h,  39h,  24h,  39h,  1bh                                              ; compressed

g_szBootSectorNotFound:	; db	"Boot sector "
                       	; db	 42h,  6fh,  6fh,  74h,  20h,  73h,  65h,  63h,  74h,  6fh,  72h,  20h    ; uncompressed
                       	  db	 48h,  75h,  75h, 0fah,  79h,  6bh,  69h,  7ah,  75h, 0f8h                ; compressed

g_szNotFound:			; db	"not found",LF,CR,NULL
             			; db	 6eh,  6fh,  74h,  20h,  66h,  6fh,  75h,  6eh,  64h,  0ah,  0dh,  00h    ; uncompressed
             			  db	 74h,  75h, 0fah,  6ch,  75h,  7bh,  74h,  6ah,  1bh                      ; compressed

g_szReadError:			; db	"Error %x!",LF,CR,NULL
              			; db	 45h,  72h,  72h,  6fh,  72h,  20h,  25h,  78h,  21h,  0ah,  0dh,  00h    ; uncompressed
              			  db	 4bh,  78h,  78h,  75h, 0f8h,  39h,  25h,  1bh                            ; compressed


; Boot menu bottom of screen strings
g_szFDD:		; db	"FDD     ",NULL
        		; db	 46h,  44h,  44h,  20h,  20h,  20h,  20h,  20h,  00h    ; uncompressed
        		  db	 4ch,  4ah, 0cah,  20h,  20h,  20h,  00h                ; compressed

g_szHDD:		; db	"HDD     ",NULL
        		; db	 48h,  44h,  44h,  20h,  20h,  20h,  20h,  20h,  00h    ; uncompressed
        		  db	 4eh,  4ah, 0cah,  20h,  20h,  20h,  00h                ; compressed

g_szRomBoot:	; db	"ROM Boot",NULL
            	; db	 52h,  4fh,  4dh,  20h,  42h,  6fh,  6fh,  74h,  00h    ; uncompressed
            	  db	 58h,  55h, 0d3h,  48h,  75h,  75h, 0bah                ; compressed

g_szHotkey:		; db	"%A%c%c%A%s%A ",NULL
           		; db	 25h,  41h,  25h,  63h,  25h,  63h,  25h,  41h,  25h,  73h,  25h,  41h,  20h,  00h    ; uncompressed
           		  db	 3dh,  35h,  35h,  3dh,  3eh,  3dh,  00h                                              ; compressed


; Boot Menu information strings
g_szCapacity:			; db	"Capacity : %s",NULL
             			; db	 43h,  61h,  70h,  61h,  63h,  69h,  74h,  79h,  20h,  3ah,  20h,  25h,  73h,  00h    ; uncompressed
             			  db	 49h,  67h,  76h,  67h,  69h,  6fh,  7ah, 0ffh, 0c0h,  1eh                            ; compressed

g_szCapacityNum:		; db	"%5-u.%u %ciB",NULL
                		; db	 25h,  35h,  2dh,  75h,  2eh,  25h,  75h,  20h,  25h,  63h,  69h,  42h,  00h    ; uncompressed
                		  db	 38h,  29h,  37h,  20h,  35h,  6fh,  88h                                        ; compressed

g_szInformation:		; db	"%s",LF,CR
                		; db	 25h,  73h,  0ah,  0dh    ; uncompressed
                		  db	 3eh,  3bh                ; compressed

	; db	"Addr.",SINGLE_VERTICAL,"Block",SINGLE_VERTICAL,"Bus",SINGLE_VERTICAL,  "IRQ",SINGLE_VERTICAL,"Reset",LF,CR
	; db	 41h,  64h,  64h,  72h,  2eh, 0b3h,  42h,  6ch,  6fh,  63h,  6bh, 0b3h,  42h,  75h,  73h, 0b3h,  49h,  52h,  51h, 0b3h,  52h,  65h,  73h,  65h,  74h,  0ah,  0dh    ; uncompressed
	  db	 47h,  6ah,  6ah,  78h,  29h,  23h,  48h,  72h,  75h,  69h,  71h,  23h,  48h,  7bh,  79h,  23h,  4fh,  58h,  57h,  23h,  58h,  6bh,  79h,  6bh,  7ah,  3bh          ; compressed

	; db	   "%s",SINGLE_VERTICAL, "%5-u",SINGLE_VERTICAL, "%s",SINGLE_VERTICAL," %2-I",SINGLE_VERTICAL,"%5-x" ,NULL
	; db	    25h,  73h, 0b3h,  25h,  35h,  2dh,  75h, 0b3h,  25h,  73h, 0b3h,  20h,  25h,  32h,  2dh,  49h, 0b3h,  25h,  35h,  2dh,  78h,  00h    ; uncompressed
	  db	    3eh,  23h,  38h,  23h,  3eh,  23h,  20h,  36h,  23h,  1ah                                                                            ; compressed


; Boot Menu Floppy Disk strings
;
; The following strings are used by BootMenuPrint_RefreshInformation
; To support optimizations in that code, these strings must start on the same 256 byte page,
; which is checked at assembly time below.
;
g_szFddStart:
g_szFddUnknown:	; db	"Unknown",NULL
               	; db	 55h,  6eh,  6bh,  6eh,  6fh,  77h,  6eh,  00h    ; uncompressed
               	  db	 5bh,  74h,  71h,  74h,  75h,  7dh, 0b4h          ; compressed

g_szFddSizeOr:	; db	"5",ONE_QUARTER,QUOTATION_MARK," or 3",ONE_HALF,QUOTATION_MARK," DD",NULL
              	; db	 35h, 0ach,  22h,  20h,  6fh,  72h,  20h,  33h, 0abh,  22h,  20h,  44h,  44h,  00h    ; uncompressed
              	  db	 2fh,  21h,  26h,  20h,  75h, 0f8h,  2dh,  22h,  26h,  20h,  4ah,  8ah                ; compressed

g_szFddSize:	; db	"%s",QUOTATION_MARK,", %u kiB",NULL	; 3�", 1440 kiB
            	; db	 25h,  73h,  22h,  2ch,  20h,  25h,  75h,  20h,  6bh,  69h,  42h,  00h    ; uncompressed
            	  db	 3eh,  26h,  27h,  20h,  37h,  20h,  71h,  6fh,  88h                      ; compressed

g_szFddThreeHalf:		; db  "3",ONE_HALF,NULL
                 		; db   33h, 0abh,  00h    ; uncompressed
                 		  db   2dh,  02h          ; compressed

g_szFddEnd:
g_szFddFiveQuarter:		; db  "5",ONE_QUARTER,NULL
                   		; db   35h, 0ach,  00h    ; uncompressed
                   		  db   2fh,  01h          ; compressed


%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if ((g_szFddStart-$$) & 0xff00) <> ((g_szFddEnd-$$) & 0xff00)
%error "g_szFdd* strings must start on the same 256 byte page, required by the BootMenuPrint_RefreshInformation routines for floppy drives.  Please move this block up or down within strings.asm"
%endif
%endif

g_szAddressingModes:
g_szLCHS:		; db	"L-CHS",NULL
         		; db	 4ch,  2dh,  43h,  48h,  53h,  00h    ; uncompressed
         		  db	 52h,  28h,  49h,  4eh,  99h          ; compressed

g_szPCHS:		; db	"P-CHS",NULL
         		; db	 50h,  2dh,  43h,  48h,  53h,  00h    ; uncompressed
         		  db	 56h,  28h,  49h,  4eh,  99h          ; compressed

g_szLBA28:		; db	"LBA28",NULL
          		; db	 4ch,  42h,  41h,  32h,  38h,  00h    ; uncompressed
          		  db	 52h,  48h,  47h,  2ch,  11h          ; compressed

g_szLBA48:		; db	"LBA48",NULL
          		; db	 4ch,  42h,  41h,  34h,  38h,  00h    ; uncompressed
          		  db	 52h,  48h,  47h,  2eh,  11h          ; compressed

g_szAddressingModes_Displacement equ (g_szPCHS - g_szAddressingModes)
;
; Ensure that addressing modes are correctly spaced in memory
;
%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if g_szLCHS <> g_szAddressingModes
%error "g_szAddressingModes Displacement Incorrect 1"
%endif
%if g_szPCHS <> g_szLCHS + g_szAddressingModes_Displacement
%error "g_szAddressingModes Displacement Incorrect 2"
%endif
%if g_szLBA28 <> g_szPCHS + g_szAddressingModes_Displacement
%error "g_szAddressingModes Displacement Incorrect 3"
%endif
%if g_szLBA48 <> g_szLBA28 + g_szAddressingModes_Displacement
%error "g_szAddressingModes Displacement Incorrect 4"
%endif
%endif

g_szBusTypeValues:
g_szBusTypeValues_8Dual:		; db		"D8 ",NULL
                        		; db		 44h,  38h,  20h,  00h    ; uncompressed
                        		  db		 4ah,  31h,  00h          ; compressed

g_szBusTypeValues_8Reversed:	; db		"X8 ",NULL
                            	; db		 58h,  38h,  20h,  00h    ; uncompressed
                            	  db		 5eh,  31h,  00h          ; compressed

g_szBusTypeValues_8Single:		; db		"S8 ",NULL
                          		; db		 53h,  38h,  20h,  00h    ; uncompressed
                          		  db		 59h,  31h,  00h          ; compressed

g_szBusTypeValues_16:			; db		" 16",NULL
                     			; db		 20h,  31h,  36h,  00h    ; uncompressed
                     			  db		 20h,  2bh,  10h          ; compressed

g_szBusTypeValues_32:			; db		" 32",NULL
                     			; db		 20h,  33h,  32h,  00h    ; uncompressed
                     			  db		 20h,  2dh,  0ch          ; compressed

g_szBusTypeValues_Serial:		; db		"SER",NULL
                         		; db		 53h,  45h,  52h,  00h    ; uncompressed
                         		  db		 59h,  4bh,  98h          ; compressed

g_szBusTypeValues_Displacement equ (g_szBusTypeValues_8Reversed - g_szBusTypeValues)
;
; Ensure that bus type strings are correctly spaced in memory
;
%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if g_szBusTypeValues_8Dual <> g_szBusTypeValues
%error "g_szBusTypeValues Displacement Incorrect 1"
%endif
%if g_szBusTypeValues_8Reversed <> g_szBusTypeValues + g_szBusTypeValues_Displacement
%error "g_szBusTypeValues Displacement Incorrect 2"
%endif
%if g_szBusTypeValues_8Single <> g_szBusTypeValues_8Reversed + g_szBusTypeValues_Displacement
%error "g_szBusTypeValues Displacement Incorrect 3"
%endif
%if g_szBusTypeValues_16 <> g_szBusTypeValues_8Single + g_szBusTypeValues_Displacement
%error "g_szBusTypeValues Displacement Incorrect 4"
%endif
%if g_szBusTypeValues_32 <> g_szBusTypeValues_16 + g_szBusTypeValues_Displacement
%error "g_szBusTypeValues Displacement Incorrect 5"
%endif
%if g_szBusTypeValues_Serial <> g_szBusTypeValues_32 + g_szBusTypeValues_Displacement
%error "g_szBusTypeValues Displacement Incorrect 6"
%endif
%endif

g_szSelectionTimeout:	; db		DOUBLE_BOTTOM_LEFT_CORNER,DOUBLE_LEFT_HORIZONTAL_TO_SINGLE_VERTICAL,"%ASelection in %2-u s",NULL
                     	; db		0c8h, 0b5h,  25h,  41h,  53h,  65h,  6ch,  65h,  63h,  74h,  69h,  6fh,  6eh,  20h,  69h,  6eh,  20h,  25h,  32h,  2dh,  75h,  20h,  73h,  00h    ; uncompressed
                     	  db		 32h,  33h,  3dh,  59h,  6bh,  72h,  6bh,  69h,  7ah,  6fh,  75h, 0f4h,  6fh, 0f4h,  3ch,  20h, 0b9h                                              ; compressed


g_szDashForZero:		; db		"- ",NULL
                		; db		 2dh,  20h,  00h    ; uncompressed
                		  db		 28h,  00h          ; compressed



;------------------------------------------------------------------------------------------
;
; Tables for StringsCompress.pl
;
;$translate{ord(' ')} = 0;    [StringsCompress Processed]
;$translate{172}      = 1;     # ONE_QUARTER    [StringsCompress Processed]
;$translate{171}      = 2;     # ONE_HALF    [StringsCompress Processed]
;$translate{179}      = 3;     # SINGLE_VERTICAL    [StringsCompress Processed]
;$translate{175}      = 4;     # ANGLE_QUOTE_RIGHT    [StringsCompress Processed]
;$translate{ord('!')} = 5;    [StringsCompress Processed]
;$translate{ord('"')} = 6;    [StringsCompress Processed]
;$translate{ord(',')} = 7;    [StringsCompress Processed]
;$translate{ord('-')} = 8;    [StringsCompress Processed]
;$translate{ord('.')} = 9;    [StringsCompress Processed]
;$translate{ord('/')} = 10;    [StringsCompress Processed]
;$translate{ord('1')} = 11;    [StringsCompress Processed]
;$translate{ord('2')} = 12;    [StringsCompress Processed]
;$translate{ord('3')} = 13;    [StringsCompress Processed]
;$translate{ord('4')} = 14;    [StringsCompress Processed]
;$translate{ord('5')} = 15;    [StringsCompress Processed]
;$translate{ord('6')} = 16;    [StringsCompress Processed]
;$translate{ord('8')} = 17;    [StringsCompress Processed]
;$translate{200}      = 18;    # DOUBLE_BOTTOM_LEFT_CORNER    [StringsCompress Processed]
;$translate{181}      = 19;    # DOUBLE_LEFT_HORIZONTAL_TO_SINGLE_VERTICAL    [StringsCompress Processed]
;$translate{ord('0')} = 20;    [StringsCompress Processed]
;
; Formats begin immediately after the last Translated character (they are in the same table)
;
;$format_begin = 21;    [StringsCompress Processed]
;
;$format{"c"}   = 21;        # n/a    [StringsCompress Processed]
;$format{"2-I"} = 22;        # must be even    [StringsCompress Processed]
;$format{"u"}   = 23;        # must be odd    [StringsCompress Processed]
;$format{"5-u"} = 24;        # must be even    [StringsCompress Processed]
;$format{"x"}   = 25;        # must be odd    [StringsCompress Processed]
;$format{"5-x"} = 26;        # must be even    [StringsCompress Processed]
;$format{"nl"}  = 27;        # n/a    [StringsCompress Processed]
;$format{"2-u"} = 28;        # must be even    [StringsCompress Processed]
;$format{"A"}   = 29;        # n/a    [StringsCompress Processed]
;$format{"s"}   = 30;        # n/a, normal string from DS    [StringsCompress Processed]
;$format{"z"}   = 31;        # n/a, boot string from BDA    [StringsCompress Processed]
;
; NOTE: The last $format cannot exceed 31 (stored in a 5-bit quantity).
;
; Starting point for the "normal" range, typically around 0x40 to cover upper and lower case
; letters.  If lower case 'z' is not used, 0x3a can be a good choice as it adds ':' to the
; front end.
;
;$normal_base = 0x3a;    [StringsCompress Processed]
;
; End of StringsCompress.pl information
;
;------------------------------------------------------------------------------------------

;;; end of input stream

StringsCompressed_NormalBase     equ   58

StringsCompressed_FormatsBegin   equ   21

StringsCompressed_TranslatesAndFormats: 
        db     32  ; 0
        db     172  ; 1
        db     171  ; 2
        db     179  ; 3
        db     175  ; 4
        db     33  ; 5
        db     34  ; 6
        db     44  ; 7
        db     45  ; 8
        db     46  ; 9
        db     47  ; 10
        db     49  ; 11
        db     50  ; 12
        db     51  ; 13
        db     52  ; 14
        db     53  ; 15
        db     54  ; 16
        db     56  ; 17
        db     200  ; 18
        db     181  ; 19
        db     48  ; 20
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_c)    ; 21
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_I)    ; 22
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_u)    ; 23
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_u)    ; 24
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_x)    ; 25
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_x)    ; 26
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_nl)    ; 27
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_u)    ; 28
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_A)    ; 29
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_s)    ; 30
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_z)    ; 31

%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_c || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_c > 255
%error "DisplayFormatCompressed_Format_c is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_2_I || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_I > 255
%error "DisplayFormatCompressed_Format_2_I is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_u || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_u > 255
%error "DisplayFormatCompressed_Format_u is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_5_u || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_u > 255
%error "DisplayFormatCompressed_Format_5_u is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_x || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_x > 255
%error "DisplayFormatCompressed_Format_x is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_5_x || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_x > 255
%error "DisplayFormatCompressed_Format_5_x is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_nl || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_nl > 255
%error "DisplayFormatCompressed_Format_nl is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_2_u || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_u > 255
%error "DisplayFormatCompressed_Format_2_u is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_A || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_A > 255
%error "DisplayFormatCompressed_Format_A is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_s || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_s > 255
%error "DisplayFormatCompressed_Format_s is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_z || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_z > 255
%error "DisplayFormatCompressed_Format_z is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%endif

;; translated usage stats
;; 33:1
;; 32:30
;; 181:1
;; 53:2
;; 48:2
;; 200:1
;; 46:3
;; 179:8
;; 44:1
;; 50:2
;; 51:3
;; 47:2
;; 52:1
;; 172:2
;; 34:3
;; 49:1
;; 56:5
;; 45:3
;; 175:1
;; 171:2
;; 54:1
;; total translated: 21

;; format usage stats
;; A:4
;; 2-u:1
;; 5-u:2
;; x:7
;; s:12
;; 5-x:1
;; nl:6
;; 2-I:1
;; c:5
;; u:6
;; z:1
;; total format: 11

;; alphabet usage stats
;; 58,::2
;; 59,;:
;; 60,<:
;; 61,=:
;; 62,>:
;; 63,?:
;; 64,@:1
;; 65,A:4
;; 66,B:9
;; 67,C:4
;; 68,D:10
;; 69,E:3
;; 70,F:3
;; 71,G:
;; 72,H:4
;; 73,I:2
;; 74,J:
;; 75,K:1
;; 76,L:3
;; 77,M:3
;; 78,N:
;; 79,O:2
;; 80,P:1
;; 81,Q:1
;; 82,R:4
;; 83,S:6
;; 84,T:
;; 85,U:1
;; 86,V:
;; 87,W:
;; 88,X:1
;; 89,Y:
;; 90,Z:
;; 91,[:
;; 92,\:
;; 93,]:
;; 94,^:
;; 95,_:
;; 96,`:
;; 97,a:6
;; 98,b:
;; 99,c:4
;; 100,d:4
;; 101,e:9
;; 102,f:2
;; 103,g:2
;; 104,h:
;; 105,i:9
;; 106,j:
;; 107,k:4
;; 108,l:4
;; 109,m:1
;; 110,n:9
;; 111,o:18
;; 112,p:3
;; 113,q:
;; 114,r:11
;; 115,s:6
;; 116,t:11
;; 117,u:3
;; 118,v:2
;; 119,w:1
;; 120,x:
;; 121,y:2
;; alphabet used count: 40
