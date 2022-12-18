	;***************************************************************
	; Program section					      
	;***************************************************************
	;LABEL		DIRECTIVE	VALUE		COMMENT
				AREA    	main, READONLY, CODE
				THUMB
				EXTERN		OutStr	; Reference external subroutine	
				EXPORT  	__main	; Make available
				EXTERN 		PROJECT_PARAMS_INIT
				EXTERN 		SYSTICK_INIT 
				EXTERN		ADC_INIT
				EXTERN		TIMERS_INIT
				EXTERN		LED_PINS_INIT
				EXTERN		STEP_OUT_PINS_INIT
				EXTERN		FFT_MAGNITUDE 
				EXTERN 		ONBOARDSW_INIT
				EXTERN		ADJUST_STEP_FREQUENCY_LED_PWM
				EXTERN		SPI_INIT
				EXTERN		SCREEN_INIT
				EXTERN		UPDATE_SCREEN 
				EXTERN		POLL_KEYBOARD
				EXTERN		KEYBOARD_PINS_INIT 
				EXTERN		MAGNITUDE_ADC_INIT 
				EXTERN		MAGNITUDE_SET_T 
				IMPORT 		READ_COMPLETE
				IMPORT 		MIC_READINGS
				
				
__main			PROC	
				CPSIE	I	
				BL PROJECT_PARAMS_INIT
				BL ADC_INIT
				BL SYSTICK_INIT 
				BL TIMERS_INIT	
				BL LED_PINS_INIT
				BL STEP_OUT_PINS_INIT
				BL ONBOARDSW_INIT
				BL SPI_INIT
				BL SCREEN_INIT 
				BL KEYBOARD_PINS_INIT
				BL MAGNITUDE_ADC_INIT
				
wait_st_isr 	LDR		R1, =READ_COMPLETE 
				LDR		R0, [R1]
				CMP 	R0, #1
				BNE 	wait_st_isr 
				BL FFT_MAGNITUDE 
				; R0 AND R1 ARE RETURN PARAMETERS OF FFT_MAGNITUDE 
				BL ADJUST_STEP_FREQUENCY_LED_PWM
				BL UPDATE_SCREEN
				BL POLL_KEYBOARD
				BL MAGNITUDE_SET_T
				LDR	R2, =READ_COMPLETE 
				MOV	R3, #0 
				STR	R3, [R2]
				B wait_st_isr		

				
							
finish		
			B		finish 
				ENDP
					



	;***************************************************************
	; End of the program  section
	;***************************************************************
	;LABEL      DIRECTIVE       VALUE                           COMMENT
				ALIGN
				END
