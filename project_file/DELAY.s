
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	DELAY, READONLY, CODE
			THUMB
			EXPORT  	DELAY	; Make available
			 

DELAY_		PROC
			; SUBTRACT 1 FROM THE VALUE GIVEN IN R5 AT EACH CYCLE 
loop		SUBS	R5, #1 
			NOP
			NOP
			BPL		loop 
			BX		LR 
			
			
				
ENDP 


;***************************************************************
; End of the program  section
;***************************************************************
;LABEL      DIRECTIVE       VALUE                           COMMENT
			ALIGN
			END