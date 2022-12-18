; SPI REGISTERS 
SYSCTL_RCGCSSI		EQU		0x400FE61C	
SSI1_BASE			EQU		0x40009000	
SSI1_PRSSI			EQU		0x40009A1C
SSI1_CR1			EQU		0x40009004
SSI1_CPSR			EQU		0x40009010
SSI1_DATA			EQU		0x40009008
SSI1_SR				EQU		0x4000900C
GPIO_PORTD_DATA		EQU 0x400073FC ; Access ALL
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	BITMAP_NOKIA, READONLY, DATA
			THUMB
chars1		DCB 	   0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ; 20
chars2		DCB        0x00, 0x00, 0x5f, 0x00, 0x00, 0x00 ; 21 !
chars3		DCB		   0x14, 0x08, 0x3e, 0x08, 0x14, 0x00 ; 2a *
chars4		DCB        0x08, 0x08, 0x08, 0x08, 0x08, 0x00 ; 2d -
chars5		DCB 	   0x00, 0x60, 0x60, 0x00, 0x00, 0x00 ; 2e .
chars6		DCB        0x3e, 0x51, 0x49, 0x45, 0x3e, 0x00 ; 30 0
chars7		DCB        0x00, 0x42, 0x7f, 0x40, 0x00, 0x00 ; 31 1
chars8		DCB        0x42, 0x61, 0x51, 0x49, 0x46, 0x00 ; 32 2
chars9		DCB        0x21, 0x41, 0x45, 0x4b, 0x31, 0x00 ; 33 3
chars10		DCB        0x18, 0x14, 0x12, 0x7f, 0x10, 0x00 ; 34 4
chars11		DCB        0x27, 0x45, 0x45, 0x45, 0x39, 0x00 ; 35 5
chars12		DCB        0x3c, 0x4a, 0x49, 0x49, 0x30, 0x00 ; 36 6
chars13		DCB        0x01, 0x71, 0x09, 0x05, 0x03, 0x00 ; 37 7
chars14		DCB        0x36, 0x49, 0x49, 0x49, 0x36, 0x00 ; 38 8
chars15		DCB        0x06, 0x49, 0x49, 0x29, 0x1e, 0x00 ; 39 9
chars16		DCB        0x00, 0x36, 0x36, 0x00, 0x00, 0x00 ; 3a :
chars17		DCB        0x14, 0x14, 0x14, 0x14, 0x14, 0x00 ; 3d =
chars18		DCB        0x00, 0x41, 0x22, 0x14, 0x08, 0x00 ; 3e >
chars19		DCB        0x7e, 0x11, 0x11, 0x11, 0x7e, 0x00 ; 41 A
chars20		DCB        0x7f, 0x49, 0x49, 0x49, 0x36, 0x00 ; 42 B
chars21		DCB        0x3e, 0x41, 0x41, 0x41, 0x22, 0x00 ; 43 C
chars22		DCB        0x7f, 0x41, 0x41, 0x22, 0x1c, 0x00 ; 44 D
chars23		DCB        0x7f, 0x49, 0x49, 0x49, 0x41, 0x00 ; 45 E
chars24		DCB        0x7f, 0x09, 0x09, 0x09, 0x01, 0x00 ; 46 F
chars25		DCB        0x3e, 0x41, 0x49, 0x49, 0x7a, 0x00 ; 47 G
chars26		DCB        0x7f, 0x08, 0x08, 0x08, 0x7f, 0x00 ; 48 H
chars27		DCB        0x00, 0x41, 0x7f, 0x41, 0x00, 0x00; 49 I
chars28		DCB        0x20, 0x40, 0x41, 0x3f, 0x01, 0x00 ; 4a J
chars29		DCB        0x7f, 0x08, 0x14, 0x22, 0x41, 0x00 ; 4b K
chars30		DCB        0x7f, 0x40, 0x40, 0x40, 0x40, 0x00 ; 4c L
chars31		DCB        0x7f, 0x02, 0x0c, 0x02, 0x7f, 0x00 ; 4d M
chars32		DCB        0x7f, 0x04, 0x08, 0x10, 0x7f, 0x00 ; 4e N
chars33		DCB        0x3e, 0x41, 0x41, 0x41, 0x3e, 0x00 ; 4f O
chars34		DCB        0x7f, 0x09, 0x09, 0x09, 0x06, 0x00 ; 50 P
chars35		DCB        0x3e, 0x41, 0x51, 0x21, 0x5e, 0x00 ; 51 Q
chars36		DCB		   0x7f, 0x09, 0x19, 0x29, 0x46, 0x00 ; 52 R
chars37		DCB        0x46, 0x49, 0x49, 0x49, 0x31, 0x00 ; 53 S
chars38		DCB        0x01, 0x01, 0x7f, 0x01, 0x01, 0x00 ; 54 T
chars39		DCB		   0x3f, 0x40, 0x40, 0x40, 0x3f, 0x00 ; 55 U
chars40		DCB        0x1f, 0x20, 0x40, 0x20, 0x1f, 0x00 ; 56 V
chars41		DCB        0x3f, 0x40, 0x38, 0x40, 0x3f, 0x00 ; 57 W
chars42		DCB        0x63, 0x14, 0x08, 0x14, 0x63, 0x00 ; 58 X
chars43		DCB        0x07, 0x08, 0x70, 0x08, 0x07, 0x00 ; 59 Y
chars44		DCB        0x61, 0x51, 0x49, 0x45, 0x43, 0x00 ; 5a Z
chars45		DCB        0x20, 0x54, 0x54, 0x54, 0x78, 0x00 ; 61 a
chars46		DCB        0x7f, 0x48, 0x44, 0x44, 0x38, 0x00 ; 62 b
chars47		DCB        0x38, 0x44, 0x44, 0x44, 0x20, 0x00 ; 63 c
chars48		DCB        0x38, 0x44, 0x44, 0x48, 0x7f, 0x00 ; 64 d
chars49		DCB        0x38, 0x54, 0x54, 0x54, 0x18, 0x00 ; 65 e
chars50		DCB        0x08, 0x7e, 0x09, 0x01, 0x02, 0x00 ; 66 f
chars51		DCB        0x0c, 0x52, 0x52, 0x52, 0x3e, 0x00 ; 67 g
chars52		DCB        0x7f, 0x08, 0x04, 0x04, 0x78, 0x00 ; 68 h
chars53		DCB        0x00, 0x44, 0x7d, 0x40, 0x00, 0x00 ; 69 i
chars54		DCB        0x20, 0x40, 0x44, 0x3d, 0x00, 0x00 ; 6a j
chars55		DCB        0x7f, 0x10, 0x28, 0x44, 0x00, 0x00 ; 6b k
chars56		DCB        0x00, 0x41, 0x7f, 0x40, 0x00, 0x00 ; 6c l
chars57		DCB        0x7c, 0x04, 0x18, 0x04, 0x78, 0x00 ; 6d m
chars58		DCB        0x7c, 0x08, 0x04, 0x04, 0x78, 0x00 ; 6e n
chars59		DCB        0x38, 0x44, 0x44, 0x44, 0x38, 0x00 ; 6f o
chars60		DCB        0x7c, 0x14, 0x14, 0x14, 0x08, 0x00 ; 70 p
chars61		DCB        0x08, 0x14, 0x14, 0x18, 0x7c, 0x00 ; 71 q
chars62		DCB        0x7c, 0x08, 0x04, 0x04, 0x08, 0x00 ; 72 r
chars63		DCB        0x48, 0x54, 0x54, 0x54, 0x20, 0x00 ; 73 s
chars64		DCB        0x04, 0x3f, 0x44, 0x40, 0x20, 0x00 ; 74 t
chars65		DCB        0x3c, 0x40, 0x40, 0x20, 0x7c, 0x00 ; 75 u
chars66		DCB        0x1c, 0x20, 0x40, 0x20, 0x1c, 0x00 ; 76 v
chars67		DCB        0x3c, 0x40, 0x30, 0x40, 0x3c, 0x00 ; 77 w
chars68		DCB        0x44, 0x28, 0x10, 0x28, 0x44, 0x00 ; 78 x
chars69		DCB        0x0c, 0x50, 0x50, 0x50, 0x3c, 0x00 ; 79 y
chars70		DCB        0x44, 0x64, 0x54, 0x4c, 0x44, 0x00 ; 7a z


;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	UPDATE_SCREEN, READONLY, CODE
			THUMB
			EXPORT  	UPDATE_SCREEN; Make available
			IMPORT 		HIGH 
			IMPORT		LOW 
			IMPORT		LOW_FREQ_T
			IMPORT		LOW_FREQ_DIGITS
			IMPORT		HIGH_FREQ_T
			IMPORT		HIGH_FREQ_DIGITS
			IMPORT		AMPLITUDE_T
			IMPORT		AMPLITUDE_DIGITS
			IMPORT		DOMINANT_FREQUENCY 
			IMPORT		DOMINANT_MAGNITUDE
			EXTERN		SCREEN_SEND_COMMAND 
			EXTERN		SCREEN_SEND_CHAR
			EXTERN  	SCREEN_FIND_WHICH_NUMBERS
			EXTERN		UPDATE_SCREEN_EXTENDED
			EXTERN		DELAY 
			EXTERN		CONVRT 
			; IN R0, THE FREQUENCY WITH MAXIMUM MAGNITUDE EXISTS, WHERE 
			; R1, THE MAXIMUM MAGNITUDE IS HELD.
UPDATE_SCREEN_ PROC
			; SET CURSOR 
			MOV		R0, #0x40
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_COMMAND
			POP	{R0-R12, LR}
			
			PUSH {R0-R12, LR}
			LDR		R5, =40000
			BL		DELAY
			POP	{R0-R12, LR}
			
			MOV		R0, #0x80
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_COMMAND
			POP	{R0-R12, LR}
			
			PUSH {R0-R12, LR}
			LDR		R5, =40000
			BL		DELAY
			POP	{R0-R12, LR}
			
			LDR		R2, =chars50
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
			
			
			; FIRST LINE DOMINANT FREQUENCY 
loopf		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopf 
			
			LDR		R2, =chars62
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
			
loopr		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopr 
			
			LDR		R2, =chars49
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
			
loope		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loope 
			
			LDR		R2, =chars61
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
			
loopq		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopq 

			LDR		R2, =chars16
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
			
loopdots	LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopdots 
			
			LDR		R1, =DOMINANT_FREQUENCY 
			PUSH {R0-R5, LR}
			BL		SCREEN_FIND_WHICH_NUMBERS
			POP	{R0-R5, LR}
			
			MOV		R3, #6 
fnum0		LDRB	R0, [R6], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum0 
			
			MOV		R3, #6
fnum1		LDRB	R0, [R7], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum1 
			
			MOV		R3, #6
fnum2		LDRB	R0, [R8], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum2 
			
			; NEW LINE 
			MOV		R0, #0x41
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_COMMAND
			POP	{R0-R12, LR}
			
			PUSH {R0-R12, LR}
			LDR		R5, =40000
			BL		DELAY
			POP	{R0-R12, LR}
			
			MOV		R0, #0x80
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_COMMAND
			POP	{R0-R12, LR}
			
			PUSH {R0-R12, LR}
			LDR		R5, =40000
			BL		DELAY
			POP	{R0-R12, LR}
			
			; SECOND LINE DOMINANT MAGNITUDE 

			LDR		R2, =chars45
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
			
loopa		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopa 
			
			LDR		R2, =chars57
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
			
loopm		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopm 
			
			LDR		R2, =chars60 
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
loopp		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopp 
			
	
			LDR		R2, =chars16
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
loopdots2	LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopdots2 
			
			LDR		R1, =DOMINANT_MAGNITUDE
			PUSH {R0-R5, LR}
			BL		SCREEN_FIND_WHICH_NUMBERS
			POP	{R0-R5, LR}
			
			MOV		R3, #6 
fnum10		LDRB	R0, [R6], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum10 
			
			MOV		R3, #6
fnum11		LDRB	R0, [R7], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum11 
			
			MOV		R3, #6
fnum12		LDRB	R0, [R8], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum12 			

			; NEW LINE 
			MOV		R0, #0x42
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_COMMAND
			POP	{R0-R12, LR}
			
			PUSH {R0-R12, LR}
			LDR		R5, =40000
			BL		DELAY
			POP	{R0-R12, LR}
			
			MOV		R0, #0x80
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_COMMAND
			POP	{R0-R12, LR}
			
			PUSH {R0-R12, LR}
			LDR		R5, =40000
			BL		DELAY
			POP	{R0-R12, LR}			
			
			; THIRD LINE
			LDR		R2, =chars56
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
loopl		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopl 
			
			LDR		R2, =chars59
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
loopo		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopo 
			
			LDR		R2, =chars67
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
loopw		LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopw 
			

			LDR		R2, =chars16
			MOV		R3, #6 
			LDR		R1, =SSI1_DATA
loopdots3	LDR		R0, [R2], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	loopdots3 
			
			PUSH {R0-R12, LR}
			LDR		R1, =LOW_FREQ_T
			LDR		R4, [R1]
			LDR		R5, =LOW_FREQ_DIGITS
			BL		CONVRT 
			POP	{R0-R12, LR}
			
			LDR		R1, =LOW_FREQ_DIGITS 
			PUSH {R0-R5, LR}
			BL		SCREEN_FIND_WHICH_NUMBERS
			POP	{R0-R5, LR}
			
			MOV		R3, #6 
fnum20		LDRB	R0, [R6], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum20 
			
			MOV		R3, #6
fnum21		LDRB	R0, [R7], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum21 
			
			MOV		R3, #6
fnum22		LDRB	R0, [R8], #1
			PUSH {R0-R12, LR}
			BL		SCREEN_SEND_CHAR
			POP	{R0-R12, LR}
			SUBS	R3, #1 
			BNE 	fnum22 			
			
			; LITERAL POOL LIMIT EXCEEDED. WE DEFINE A NEW FUNCTION 
			; FOR THE REMAINING LINES AND COPY THE BITMAP TABLE 
			PUSH {LR}
			BL UPDATE_SCREEN_EXTENDED
			POP {LR}

			BX LR 
			ENDP 
			