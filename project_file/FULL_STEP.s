GPIO_PORTB_DATA		EQU 	0x4000503C ; 
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	FULL_STEP, READONLY, CODE
			THUMB
			EXPORT  	FULL_STEP; Make available
			IMPORT 		STEP_DIR 

FULL_STEP_	PROC
			LDR 	R1, =GPIO_PORTB_DATA 
			LDR 	R0, [R1]
			AND		R0, #0x0F
			LDR		R2, =STEP_DIR
			LDR		R3, [R2]
			CMP		R3, #1
			BEQ		counter_clock_wise 
			BNE		clock_wise
			
clock_wise  
			CMP		R0, #0x01 
			MOVEQ	R0, #0x08
			BEQ		store 
			LSR		R0, #1
			B		store 
counter_clock_wise 
			CMP		R0, #0x08 
			MOVEQ	R0, #0x01 
			BEQ		store 
			LSL		R0, #1 
			B		store
			
store 		STR		R0, [R1]
			BX LR 
ENDP 
END 
