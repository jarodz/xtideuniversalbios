; Project name	:	XTIDE Universal BIOS
; Description	:	Functions for printing drive detection strings.

; Section containing code
SECTION .text

;--------------------------------------------------------------------
; Prints BIOS name and segment address where it is found.
;
; DetectPrint_RomFoundAtSegment
;	Parameters:
;		Nothing
;	Returns:
;		Nothing
;	Corrupts registers:
;		AX, SI, DI
;--------------------------------------------------------------------
DetectPrint_RomFoundAtSegment:
	push	bp
	mov		bp, sp
	mov		si, g_szRomAt
	ePUSH_T	ax, ROMVARS.szTitle			; Bios title string
	push	cs							; BIOS segment
	jmp		BootMenuPrint_FormatCSSIfromParamsInSSBP


;--------------------------------------------------------------------
; DetectPrint_StartDetectWithMasterOrSlaveStringInAXandIdeVarsInCSBP
;	Parameters:
;		CS:AX:	Ptr to "Master" or "Slave" string
;		CS:BP:	Ptr to IDEVARS
;	Returns:
;		Nothing
;	Corrupts registers:
;		AX, SI, DI
;--------------------------------------------------------------------
DetectPrint_StartDetectWithMasterOrSlaveStringInAXandIdeVarsInCSBP:
	push	bp
	mov		si, [cs:bp+IDEVARS.wPort]
	mov		bp, sp
	push	ax							; Push "Master" or "Slave"
	push	si							; Push port number
	mov		si, g_szDetect
	jmp		BootMenuPrint_FormatCSSIfromParamsInSSBP


;--------------------------------------------------------------------
; DetectPrint_DriveNameFromBootnfoInESBX
;	Parameters:
;		ES:BX:	Ptr to BOOTNFO (if drive found)
;	Returns:
;		Nothing
;	Corrupts registers:
;		AX, SI
;--------------------------------------------------------------------
DetectPrint_DriveNameFromBootnfoInESBX:
	push	di
	push	bx

	lea		si, [bx+BOOTNFO.szDrvName]
	mov		bx, es
	CALL_DISPLAY_LIBRARY PrintNullTerminatedStringFromBXSI
	CALL_DISPLAY_LIBRARY PrintNewlineCharacters

	pop		bx
	pop		di
	ret


;--------------------------------------------------------------------
; DetectPrint_DriveNotFound
;	Parameters:
;		Nothing
;	Returns:
;		Nothing
;	Corrupts registers:
;		AX, SI
;--------------------------------------------------------------------
DetectPrint_DriveNotFound:
	mov		si, g_szNotFound
	jmp		BootMenuPrint_NullTerminatedStringFromCSSIandSetCF