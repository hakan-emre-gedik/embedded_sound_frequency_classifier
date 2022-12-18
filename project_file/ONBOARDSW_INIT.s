;GPIO Registers
GPIO_PORTF_DATA		EQU 0x400253FC ; Access ALL
GPIO_PORTF_CR		EQU 0x40025524 
GPIO_PORTF_LOCK		EQU 0x40025520
GPIO_PORTF_DIR 		EQU 0x40025400 ; Port Direction
GPIO_PORTF_AFSEL	EQU 0x40025420 ; Alt Function enable
GPIO_PORTF_DEN 		EQU 0x4002551C ; Digital Enable
GPIO_PORTF_AMSEL 	EQU 0x40025528 ; Analog enable
GPIO_PORTF_PCTL 	EQU 0x4002552C ; Alternate Functions
GPIO_PORTF_PUR 		EQU 0x40025510 ; Pull-up resistor selection  
GPIO_PORTF_IS 		EQU 0x40025404 ; Interrupt sense (edge or level triggering) 
GPIO_PORTF_EV 		EQU 0x4002540C ; Interrupt event (falling or rising edge)
GPIO_PORTF_IM 		EQU 0x40025410 ; Interrupt mask 

SYSCTL_RCGCGPIO 	EQU 0x400FE608 ; GPIO Gate Control

; NVIC ENABLE AND SET PRIORITY REGISTERS 
NVIC_EN 			EQU 0xE000E100 
NVIC_GPIO_PORTF_PRI EQU 0xE000E41C

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	ONBOARDSW_INIT, READONLY, CODE
			THUMB
			EXPORT  	ONBOARDSW_INIT ; Make available
				
ONBOARDSW_INIT_		PROC 
			LDR		R1, =SYSCTL_RCGCGPIO
			LDR		R0, [R1]
			ORR		R0, 0x20 ; CLOCK PORTF 
			STR		R0, [R1]
			NOP 
			NOP 
			NOP 

			LDR		R1, =GPIO_PORTF_LOCK 
			LDR 	R0, =0x4C4F434B ; SPECIAL UNLOCK ARRAY
			STR		R0, [R1]
			
			LDR		R1, =GPIO_PORTF_CR
			MOV		R0, #0x11 ; COMMIT PORTS PF0, 4  
			STR		R0, [R1]
			
			LDR		R1, =GPIO_PORTF_DIR 
			LDR		R0, [R1]
			BIC 	R0, #0x11 ; 
			STR		R0, [R1] ; SET PF0,4 AS INPUTS
			
			LDR		R1, =GPIO_PORTF_AFSEL 
			LDR		R0, [R1]
			BIC 	R0, #0x11
			STR		R0, [R1] ; DISABLE ALTERNATE FUNCTION 
			
			LDR		R1, =GPIO_PORTF_DEN 
			LDR		R0, [R1]
			ORR		R0, #0x11
			STR		R0, [R1] ; DIGITAL ENABLE THE PINS 
			
			LDR		R1, =GPIO_PORTF_PUR 
			LDR		R0, [R1]
			ORR		R0, #0x11
			STR		R0, [R1] ; ENABLE PULL-UP RESISTORS FOR SWITCHES
			
			LDR		R1, =GPIO_PORTF_IS 
			LDR		R0, [R1]			
			BIC 	R0, #0x11 ; SELECT EDGE TRIGGERING  
			STR		R0, [R1] ; 
			
			LDR		R1, =GPIO_PORTF_EV  
			LDR		R0, [R1]
			BIC 	R0, #0x11 ; SELECT FALLING EDGE TRIGGERING  
			STR		R0, [R1] ; 
			
			LDR		R1, =GPIO_PORTF_IM 
			LDR		R0, [R1]
			ORR		R0, #0x11 
			STR		R0, [R1] ; UNMASK THE INTERRUPTS 
			
			; CONFIGURE NVIC FOR THE INTERRUPT 
			LDR 	R1, =NVIC_EN
			ORR 	R0, #0x01 
			LSL 	R0, #30 ; INTERRUPT NUMBER FOR GPIOF 
			LDR 	R2, [R1]
			ORR		R0, R2 
			STR		R0, [R1]
			
			LDR		R1, =NVIC_GPIO_PORTF_PRI
			LDR		R0, [R1]
			MOV		R0, #5 ; SET 20 AS 
			LSL		R0, #21 
			LDR 	R2, [R1]
			ORR		R0, R2 
			STR		R0, [R1]
			BX LR 
			ENDP 