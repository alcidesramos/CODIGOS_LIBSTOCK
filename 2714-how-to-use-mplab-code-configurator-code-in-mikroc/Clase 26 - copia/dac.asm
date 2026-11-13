
_DAC_Initialize:

;dac.c,57 :: 		void DAC_Initialize(void)
;dac.c,60 :: 		DAC1CON0 = 0xA0;
	MOVLW      160
	MOVWF      DAC1CON0+0
;dac.c,62 :: 		DAC1CON1 = 0x00;
	CLRF       DAC1CON1+0
;dac.c,63 :: 		}
L_end_DAC_Initialize:
	RETURN
; end of _DAC_Initialize

_DAC_SetOutput:

;dac.c,65 :: 		void DAC_SetOutput(uint8_t inputData)
;dac.c,67 :: 		DAC1CON1  = inputData;
	MOVF       FARG_DAC_SetOutput_inputData+0, 0
	MOVWF      DAC1CON1+0
;dac.c,68 :: 		}
L_end_DAC_SetOutput:
	RETURN
; end of _DAC_SetOutput

_DAC_GetOutput:

;dac.c,70 :: 		uint8_t DAC_GetOutput(void)
;dac.c,72 :: 		return DAC1CON1;
	MOVF       DAC1CON1+0, 0
	MOVWF      R0
;dac.c,73 :: 		}
L_end_DAC_GetOutput:
	RETURN
; end of _DAC_GetOutput
