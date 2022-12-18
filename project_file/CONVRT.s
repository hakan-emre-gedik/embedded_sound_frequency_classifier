			AREA    	main, READONLY, CODE
			THUMB
			EXPORT		CONVRT
			EXTERN		OutStr
; convert the number in the register r4 into ascii format,
; and store the ascii values in the memeory address starting 
; from r5
			
CONVRT		PROC 
			MOV		R0, R5 ; r0 holds the memory pointer
			MOV 	R1, R4 ; take the value to r1 register 
			MOV 	R3, #10 
			MOV 	R6, #0 ; let it be the counter
		
loop		ADD		R6, #1; 
			MOV 	R2, R1 
			UDIV	R1, R3 ; perform integer division by 10 
			MUL		R1, R3 ; multiply by 10 again 
			SUB		R1, R2, R1 ; by subtracting we obtain the least significant digit 
			ADD		R1, #48 ; convert to ascii format each digit 
			STRB	R1, [R0], #1 ; store the digit 
			MOV 	R1, R2
			UDIV	R1, R3 ; get the number divided by 10 and loop again to obtain the next digit 
			CMP 	R1, #0 ; if R1 was smaller than 10, integer division would yield 0 
			BNE		loop 
			
			SUB		R6, #1 
			MOV 	R1, #0x04
			STRB	R1, [R0]
			; table is reversed, reverse it again. 
			MOV		R0, R5
			ADD		R1, R0, R6;	R1 holds the endpoint 
		
reverse			
			LDRB	R2, [R0] ; swap the values held in memory locations R0, R1
			LDRB	R3, [R1]
			STRB	R2, [R1]
			STRB 	R3, [R0], #1 ; increment the starter end
			SUB		R1, #1 ; decrement the finisher end 
			CMP		R1, R0 ; 
			BGE		reverse ; stop when finisher is smaller than the starter 
			
			
			BX	LR
ENDP 