TIMER0_ICR			EQU 0x40030024 ; Timer Interrupt Clear
TIMER0_CTL			EQU 0x4003000C
TIMER0_TAILR		EQU 0x40030028 ; Timer interval
GPIO_PORTF_DATA		EQU 0x400253FC ; Access ALL

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	LED_POWER_ISR, READONLY, CODE
			THUMB
			EXPORT 		LED_POWER_ISR
			IMPORT 		HIGH 
			IMPORT		LOW 
			IMPORT 		WHICH_LED 
LED_POWER_ISR_	PROC
			
				LDR 	R1, =TIMER0_CTL ; disable timer during setup 
				LDR 	R2, [R1]
				BIC 	R2, R2, #0x01
				STR		R2, [R1]
				
				LDR		R1, =WHICH_LED 
				LDR		R0, [R1]
				CMP 	R0, #0 
				BEQ		pwm_red 
				CMP 	R0, #1
				BEQ		pwm_green  
				CMP		R0, #2 
				BEQ		pwm_blue 
				CMP		R0, #3 
				BEQ		no_pwm 
				
pwm_red 
				LDR 	R1, =GPIO_PORTF_DATA
				LDR		R0, [R1] 
				LSR		R0, #1 
				ANDS	R0, #0x01 
				BEQ		make_high_red 
				BNE		make_low 

pwm_green  						
				LDR 	R1, =GPIO_PORTF_DATA
				LDR		R0, [R1] 
				LSR		R0, #3 
				ANDS	R0, #0x01 
				BEQ		make_high_green
				BNE		make_low 

pwm_blue 					
				LDR 	R1, =GPIO_PORTF_DATA
				LDR		R0, [R1] 
				LSR		R0, #2 
				ANDS	R0, #0x01 
				BEQ		make_high_blue
				BNE		make_low 

no_pwm 			LDR 	R1, =GPIO_PORTF_DATA
				B		make_low 
				
make_high_red  
				LDR		R0, [R1]
				BIC		R0, #0x02 ; CLOSE THE OTHER LEDS 
				ORR		R0, #0x02 
				STR		R0, [R1]
				; CHANGE THE COUNTDOWN VALUE 
				LDR 	R1, =TIMER0_TAILR 
				LDR 	R2, =HIGH
				LDR		R0, [R2]
				STR 	R0, [R1]
				B exit  
make_high_green   
				LDR		R0, [R1]
				AND		R0, #0x08 ; CLOSE THE OTHER LEDS 
				ORR		R0, #0x08
				STR		R0, [R1]
				; CHANGE THE COUNTDOWN VALUE 
				LDR 	R1, =TIMER0_TAILR 
				LDR 	R2, =HIGH
				LDR		R0, [R2]
				STR 	R0, [R1]
				B exit
				
make_high_blue  
				LDR		R0, [R1]
				BIC		R0, #0x04 ; CLOSE THE OTHER LEDS 
				ORR		R0, #0x04 
				STR		R0, [R1]
				; CHANGE THE COUNTDOWN VALUE 
				LDR 	R1, =TIMER0_TAILR 
				LDR 	R2, =HIGH
				LDR		R0, [R2]
				STR 	R0, [R1]
				B exit
make_low 			
				LDR		R0, [R1]
				BIC 	R0, #0x0E 
				STR		R0, [R1]
				; CHANGE THE COUNTDOWN VALUE 
				LDR		R1, =TIMER0_TAILR 
				LDR 	R2, =LOW
				LDR		R0, [R2]
				STR 	R0, [R1]
					
exit 				; ENABLE THE COUNTER AND CLEAR THE INTERRUPT FLAG 
				LDR		R1, =TIMER0_ICR
				LDR		R0, [R1]
				ORR		R0, #0x01
				STR		R0, [R1]
					
				LDR R1, =TIMER0_CTL  
				LDR R2, [R1]
				ORR	R2, R2, #0x01
				STR R2, [R1]
					
					
				BX LR 
				ENDP
			 