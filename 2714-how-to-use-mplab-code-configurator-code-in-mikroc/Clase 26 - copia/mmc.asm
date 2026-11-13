
_main:

;mmc.c,6 :: 		void main()
;mmc.c,10 :: 		LATA = 0x00;
	CLRF       LATA+0
;mmc.c,11 :: 		LATC = 0x00;
	CLRF       LATC+0
;mmc.c,16 :: 		TRISA = 0x37;
	MOVLW      55
	MOVWF      TRISA+0
;mmc.c,17 :: 		TRISC = 0x3F;
	MOVLW      63
	MOVWF      TRISC+0
;mmc.c,22 :: 		ANSELC = 0x3F;
	MOVLW      63
	MOVWF      ANSELC+0
;mmc.c,23 :: 		ANSELA = 0x17;
	MOVLW      23
	MOVWF      ANSELA+0
;mmc.c,28 :: 		WPUA = 0x00;
	CLRF       WPUA+0
;mmc.c,29 :: 		WPUC = 0x00;
	CLRF       WPUC+0
;mmc.c,30 :: 		OPTION_REG.nWPUEN = 1;
	BSF        OPTION_REG+0, 7
;mmc.c,35 :: 		ODCONA = 0x00;
	CLRF       ODCONA+0
;mmc.c,36 :: 		ODCONC = 0x00;
	CLRF       ODCONC+0
;mmc.c,41 :: 		SLRCONA = 0x37;
	MOVLW      55
	MOVWF      SLRCONA+0
;mmc.c,42 :: 		SLRCONC = 0x3F;
	MOVLW      63
	MOVWF      SLRCONC+0
;mmc.c,44 :: 		DAC_Initialize();
	CALL       _DAC_Initialize+0
;mmc.c,47 :: 		while (1)
L_main0:
;mmc.c,50 :: 		codigo=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      _codigo+0
	MOVF       R1, 0
	MOVWF      _codigo+1
;mmc.c,51 :: 		DAC_SetOutput(codigo/4);
	MOVF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
	LSRF       R3, 1
	RRF        R2, 1
	LSRF       R3, 1
	RRF        R2, 1
	MOVF       R2, 0
	MOVWF      FARG_DAC_SetOutput_inputData+0
	CALL       _DAC_SetOutput+0
;mmc.c,52 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	DECFSZ     R12, 1
	GOTO       L_main2
	DECFSZ     R11, 1
	GOTO       L_main2
;mmc.c,55 :: 		}
	GOTO       L_main0
;mmc.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
