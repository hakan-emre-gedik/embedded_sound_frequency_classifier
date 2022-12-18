GPIO_PORTC_DATA		EQU 	0x400063FC
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	DEBOUNCE_C, READONLY, CODE
			THUMB
			EXPORT  	DEBOUNCE_C ; Make available
			EXTERN 		DELAY 	
			; GET A DEBOUNCED READING 
DEBOUNCE_C_ 	PROC
initialread LDR		R1, =GPIO_PORTC_DATA
			MOV		R5, #5 
			LDR		R0, [R1]
			
			PUSH{R0, R1, R2, R5, LR}
			MOV		R5, #100 
			BL		DELAY 
			POP {R0, R1, R2, R5, LR}
			
otherread	LDR 	R2, [R1]
			CMP 	R0, R2 
			MOVNE	R5, #5 
			BNE 	initialread 
			SUBS	R5, #1 
			BEQ		over
			BNE		otherread 
	
over		BX LR ; THE DEBOUNCED READING IS LEFT IN R0 
	
ENDP 
	
END 