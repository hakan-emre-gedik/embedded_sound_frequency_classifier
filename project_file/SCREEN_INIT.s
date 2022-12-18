; SPI REGISTERS 
SYSCTL_RCGCSSI		EQU		0x400FE61C	
SSI1_BASE			EQU		0x40009000	
SSI1_PRSSI			EQU		0x40009A1C
SSI1_CR1			EQU		0x40009004
SSI1_CPSR			EQU		0x40009010
SSI1_DATA			EQU		0x40009008
SSI1_SR				EQU		0x4000900C

SYSCTL_RCGCGPIO 	EQU 0x400FE608 ; GPIO Gate Control

GPIO_PORTD_DATA		EQU 0x400073FC ; Access ALL

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	SCREEN_INIT, READONLY, CODE
			THUMB
			EXPORT  	SCREEN_INIT ; Make available
			EXTERN		DELAY 
			EXTERN		SCREEN_SEND_CHAR
SCREEN_INIT_	PROC
			LDR		R1, =GPIO_PORTD_DATA ; 
			LDR		R0, [R1]
			BIC 	R0, #0xC0 ; 
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =2000000
			BL DELAY 
			POP {R0, R1, LR}
			
			
			
			MOV		R0, #0x80 
			STR		R0, [R1]
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			LDR		R0, [R1]
			
			LDR		R1, =SSI1_DATA
			MOV		R0, 0x21
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			MOV		R0, #0xC0
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			MOV		R0, #0x07 
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			MOV		R0, #0x13 
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			MOV		R0, #0x20 
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			MOV		R0, #0x0C 
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			MOV		R0, #0x80 
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			MOV		R0, #0x40 
			STR		R0, [R1]
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			PUSH {R0, R1, LR}
			LDR		R5, =40000
			BL DELAY 
			POP {R0, R1, LR}
			
			LDR		R1, =GPIO_PORTD_DATA 
			LDR		R0, [R1]
			MOV 	R0, #0xC0 
			STR		R0, [R1]
			MOV		R0, #0xFF
			LDR		R1, =GPIO_PORTD_DATA  
			LDR		R0, [R1]
			
			MOV		R0, #0x00
			LDR		R1, =SSI1_DATA
			LDR	 	R2, =5712 
			
write_data 	PUSH {R0, R2, LR}
			BL SCREEN_SEND_CHAR
			POP {R0, R2, LR}
			SUBS 	R2, #1 
			BNE		write_data
			BX		LR
				
				
			
			
			ENDP 