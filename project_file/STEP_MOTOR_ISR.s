TIMER1_ICR			EQU 0x40031024 ; Timer Interrupt Clear
GPIO_PORTB_DATA		EQU 0x400053FC ; Access ALL

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	STEP_MOTOR_ISR, READONLY, CODE
			THUMB
			EXPORT 		STEP_MOTOR_ISR
			EXTERN		FULL_STEP 
			
STEP_MOTOR_ISR_	PROC
			PUSH {LR}
			BL FULL_STEP 
			POP {LR}
			
			LDR		R1, =TIMER1_ICR 
			MOV		R0, #0x01
			STR		R0, [R1]

			BX LR 
			ENDP 