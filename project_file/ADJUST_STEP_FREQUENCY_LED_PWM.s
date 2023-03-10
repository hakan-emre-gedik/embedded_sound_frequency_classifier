GPIO_PORTB_DATA		EQU 	0x400053FC ; no pin should be masked
TIMER1_TAILR		EQU 0x40031028 ; Timer interval
TIMER0_TAILR		EQU 0x40030028 ; Timer interval
	
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	ADJUST_STEP_FREQUENCY_LED_PWM, READONLY, CODE
			THUMB
			EXPORT  	ADJUST_STEP_FREQUENCY_LED_PWM; Make available
			IMPORT 		HIGH 
			IMPORT		LOW 
			IMPORT 		WHICH_LED 
			IMPORT		LOW_FREQ_T
			IMPORT		HIGH_FREQ_T
			IMPORT		AMPLITUDE_T 
			; IN R0, THE FREQUENCY WITH MAXIMUM MAGNITUDE EXISTS, WHERE 
			; R1, THE MAXIMUM MAGNITUDE IS HELD.
ADJUST_STEP_FREQUENCY_LED_PWM_ PROC
			; FIRSTLY, DETERMINE WHETHER THE DOMINANT FREQUENCY IS GREATER THAN THE 
			; MAGNITUDE TRESHOLD 
			LDR		R3, =AMPLITUDE_T 
			LDR		R2, [R3]
			CMP		R1, R2 
			BPL		adjust
			LDR		R1, =WHICH_LED 
			MOV		R0, #0x03 
			STR		R0, [R1]
			BXMI LR ; IF MAGNITUDE TRESHOLD IS NOT EXCEEDED DO NOT MAKE ANY ADJUSTMENTS 
			
			; DECIDE WHICH LED SHOULD BE ON WITH THE FREQUENCY INFORMATION 
adjust		LDR		R2, =LOW_FREQ_T 
			LDR		R3, [R2]
			CMP 	R0, R3 
			MOVMI	R4, #0 ; RED LED 
			BMI 	save_which_led
			LDR		R2, =HIGH_FREQ_T 
			LDR		R3, [R2]
			CMP 	R0, R3 
			MOVMI	R4, #1 ; GREEN LED
			MOVPL	R4, #2 ; BLUE LED 
			
save_which_led
			LDR		R2, =WHICH_LED 
			STR		R4, [R2] ; STORE WHICH LED SHOULD BE ON 
			
			
			; EXPAND FREQUENCY VALUES BETWEEN 0, 1000 INTO INTERVAL
			; 40000 - 240000 THEN SUBTRACT THE VALUE FROM 240000
			; TO MAKE THE STEP MOTOR ROTATION SPEED PROPORTIONAL 
			; TO THE INPUT FREQUENCY 
			LDR		R2, =200
			MUL		R3, R2, R0 
			LDR		R2, =10000
			ADD		R3, R2 
			LDR		R2, =240000 
			SUB		R3, R2, R3 ; THE STEP MOTOR ROTATION ILR VALUE OBTAINED 
			
			LDR		R2, =TIMER1_TAILR
			STR		R3, [R2] ; UPDATE TIMER1 ILR 
			
			; FOR LEDs MODULATE HIGH DURATION OF THE PWM WRT THE DOMINANT 
			; FREQUENCIES MAGNITUDE. AMPLITUDE VALUE COME BETWEEN 0 AND 600 
			
			MOV		R3, R1 
			SUB		R3, #100 
			LDR		R2, =10 
			MUL		R3, R2 
			
			LDR		R2, =HIGH 
			STR		R3, [R2]
			
			BX LR
			ENDP 