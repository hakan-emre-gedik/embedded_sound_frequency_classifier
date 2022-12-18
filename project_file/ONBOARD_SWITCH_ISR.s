GPIO_PORTF_ISC 		EQU 0x4002541C ; Interrupt Clear
GPIO_PORTF_MIS 		EQU 0x40025418 ; Raw interrupt status 

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	ONBOARD_SWITCH_ISR, READONLY, CODE
			THUMB
			EXPORT 		ONBOARD_SWITCH_ISR
			IMPORT 		STEP_DIR 
				
ONBOARD_SWITCH_ISR_	PROC
			LDR		R1, =GPIO_PORTF_MIS
			LDR		R0, [R1]
			LDR		R2, =GPIO_PORTF_ISC 
			MOV		R3, #0x11 
			STR		R3, [R2]
			ANDS 	R1, R0, #0x01 
			BEQ		sw_2
			BNE 	sw_1
			
sw_1 
			LDR		R1, =STEP_DIR 
			MOV		R0, #0x00
			STR		R0, [R1]
			B		exit 
sw_2 		
			LDR		R1, =STEP_DIR 
			MOV		R0, #0x01
			STR		R0, [R1]
			
			
			
exit 		
			
			BX LR 
			ENDP 