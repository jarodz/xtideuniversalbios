; File name		:	MenuLoop.asm
; Project name	:	Assembly Library
; Created date	:	22.7.2010
; Last update	:	25.11.2010
; Author		:	Tomi Tilli
; Description	:	Menu loop for waiting keystrokes.

; Section containing code
SECTION .text

;--------------------------------------------------------------------
; MenuLoop_Enter
;	Parameters
;		SS:BP:	Ptr to MENU
;	Returns:
;		Nothing
;	Corrupts registers:
;		AX, BX, CX, DX, SI, DI
;--------------------------------------------------------------------
ALIGN JUMP_ALIGN
MenuLoop_Enter:
	call	KeystrokeProcessing
	call	TimeoutProcessing
	call	IdleTimeProcessing
	test	BYTE [bp+MENU.bFlags], FLG_MENU_EXIT
	jz		SHORT MenuLoop_Enter
	ret


;--------------------------------------------------------------------
; IdleTimeProcessing
; TimeoutProcessing
; KeystrokeProcessing
;	Parameters
;		SS:BP:	Ptr to MENU
;	Returns:
;		Nothing
;	Corrupts registers:
;		All, except SS:BP
;--------------------------------------------------------------------
ALIGN JUMP_ALIGN
IdleTimeProcessing:
	jmp		MenuEvent_IdleProcessing		; User idle processing

ALIGN JUMP_ALIGN
TimeoutProcessing:
	call	MenuTime_UpdateSelectionTimeout
	mov		ah, MENU_KEY_ENTER				; Fake ENTER to select item
	jc		SHORT ProcessKeystrokeFromAX	; Process faked ENTER
	ret

ALIGN JUMP_ALIGN
KeystrokeProcessing:
	call	Keyboard_GetKeystrokeToAX
	jnz		SHORT ProcessKeystrokeFromAX
	ret


;--------------------------------------------------------------------
; ProcessKeystrokeFromAX
;	Parameters
;		AL:		ASCII character
;		AH:		BIOS scan code
;		SS:BP:	Ptr to MENU
;	Returns:
;		Nothing	
;	Corrupts registers:
;		AX, BX, CX, DX, SI, DI
;--------------------------------------------------------------------
ALIGN JUMP_ALIGN
ProcessKeystrokeFromAX:
	xchg	cx, ax
	call	MenuTime_StopSelectionTimeout
	xchg	ax, cx
	call	.ProcessMenuSystemKeystrokeFromAX
	jc		SHORT .Return
	jmp		MenuEvent_KeyStrokeInAX
ALIGN JUMP_ALIGN, ret
.Return:
	ret

;--------------------------------------------------------------------
; .ProcessMenuSystemKeystrokeFromAX
;	Parameters
;		AL:		ASCII character
;		AH:		BIOS scan code
;		SS:BP:	Ptr to MENU
;	Returns:
;		CF:		Set if keystroke processed
;				Cleared if keystroke not processed
;		AL:		ASCII character (if CF cleared)
;		AH:		BIOS scan code (if CF cleared)
;	Corrupts registers:
;		BX, CX, DX, SI, DI
;--------------------------------------------------------------------
ALIGN JUMP_ALIGN
.ProcessMenuSystemKeystrokeFromAX:
	cmp		ah, MENU_KEY_ESC
	je		SHORT .LeaveMenuWithoutSelectingItem
	cmp		ah, MENU_KEY_ENTER
	je		SHORT .SelectItem

	test	BYTE [bp+MENU.bFlags], FLG_MENU_USER_HANDLES_SCROLLING
	jz		SHORT MenuLoop_ProcessScrollingKeysFromAX
	clc		; Clear CF since keystroke not processed
	ret

ALIGN JUMP_ALIGN
.LeaveMenuWithoutSelectingItem:
	call	MenuEvent_ExitMenu
	jnc		SHORT .CancelMenuExit
	call	MenuInit_CloseMenuWindow
	mov		WORD [bp+MENUINIT.wHighlightedItem], NO_ITEM_HIGHLIGHTED
.CancelMenuExit:
	stc
	ret

ALIGN JUMP_ALIGN
.SelectItem:
	mov		cx, [bp+MENUINIT.wHighlightedItem]
	call	MenuEvent_ItemSelectedFromCX
	stc
	ret


;--------------------------------------------------------------------
; MenuLoop_ProcessScrollingKeysFromAX
;	Parameters
;		AL:		ASCII character
;		AH:		BIOS scan code
;		SS:BP:	Ptr to MENU
;	Returns:
;		CF:		Set if keystroke processed
;				Cleared if keystroke not processed
;		AL:		ASCII character (if CF cleared)
;		AH:		BIOS scan code (if CF cleared)
;	Corrupts registers:
;		BX, CX, DX, SI, DI
;--------------------------------------------------------------------
ALIGN JUMP_ALIGN
MenuLoop_ProcessScrollingKeysFromAX:
	cmp		ah, MENU_KEY_PGUP
	je		SHORT .ChangeToPreviousPage
	cmp		ah, MENU_KEY_PGDN
	je		SHORT .ChangeToNextPage
	cmp		ah, MENU_KEY_HOME
	je		SHORT .SelectFirstItem
	cmp		ah, MENU_KEY_END
	je		SHORT .SelectLastItem

	cmp		ah, MENU_KEY_UP
	je		SHORT .DecrementSelectedItem
	cmp		ah, MENU_KEY_DOWN
	je		SHORT .IncrementSelectedItem
	clc		; Clear CF since keystroke not processed
	ret

ALIGN JUMP_ALIGN
.ChangeToPreviousPage:
	call	MenuScrollbars_GetMaxVisibleItemsOnPageToCX
	xchg	ax, cx
	neg		ax
	mov		cx, [bp+MENUINIT.wHighlightedItem]
	add		cx, ax
	jge		SHORT .MoveHighlightedItemByAX	; No rotation for PgUp
	; Fall to .SelectFirstItem
ALIGN JUMP_ALIGN
.SelectFirstItem:
	mov		ax, [bp+MENUINIT.wHighlightedItem]
	neg		ax
	jmp		SHORT .MoveHighlightedItemByAX

ALIGN JUMP_ALIGN
.ChangeToNextPage:
	call	MenuScrollbars_GetMaxVisibleItemsOnPageToCX
	xchg	ax, cx
	mov		cx, [bp+MENUINIT.wHighlightedItem]
	add		cx, ax
	cmp		cx, [bp+MENUINIT.wItems]
	jb		SHORT .MoveHighlightedItemByAX	; No rotation for PgDn
	; Fall to .SelectLastItem
ALIGN JUMP_ALIGN
.SelectLastItem:
	mov		ax, [bp+MENUINIT.wItems]
	sub		ax, [bp+MENUINIT.wHighlightedItem]
	dec		ax
	jmp		SHORT .MoveHighlightedItemByAX

ALIGN JUMP_ALIGN
.DecrementSelectedItem:
	mov		ax, -1
	jmp		SHORT .MoveHighlightedItemByAX
ALIGN JUMP_ALIGN
.IncrementSelectedItem:
	mov		ax, 1
ALIGN JUMP_ALIGN
.MoveHighlightedItemByAX:
	call	MenuScrollbars_MoveHighlightedItemByAX
	stc
	ret