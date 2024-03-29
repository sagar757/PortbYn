;
; PB2PDYN.asm
;
; Created: 01-02-2023 09:33:58
; Author : Admin
;


; Replace with your application code
		.INCLUDE "M32DEF.INC"
		CBI DDRB,2		;MAKE PB2 AN INPUT
		LDI R16,0XFF
		OUT DDRD,R16	;MAKE PORTD AN OUTPUT PORT
AGAIN:  SBIS PINB,2		;SKIP NEXT IF PB BIT IS HIGH
		RJMP OVER		;SW IS LOW
		LDI R16, 'Y'	;R16='Y'
		OUT PORTD,R16	;PORTD='Y'
		RJMP AGAIN
OVER :	LDI R16, 'N'	;R16 = 'N'
		OUT PORTD,R16	;PORTD='N'
		CALL DELAY_1S
		RJMP AGAIN
;;;;;***********DELAY 1S**********;;;;;
DELAY_1S:	LDI R20,1			;USE 32 INSTEAD 1 FOR PROPER 1 SEC
L2		:	LDI R21,1			;;USE 200 INSTEAD 1 FOR PROPER 1 SEC
L3		:	LDI R22,1			;;USE 250 INSTEAD 1 FOR PROPER 1 SEC
L4		:	NOP
			NOP
			DEC R22
			BRNE L4
			DEC R21
			BRNE L3
			DEC R20
			BRNE L2
			RET