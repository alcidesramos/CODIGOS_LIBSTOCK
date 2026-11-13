
_main:

;dac_pwm.c,4 :: 		void main()
;dac_pwm.c,9 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;dac_pwm.c,10 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;dac_pwm.c,13 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;dac_pwm.c,14 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;dac_pwm.c,15 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;dac_pwm.c,16 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;dac_pwm.c,19 :: 		ansela=0;
	CLRF       ANSELA+0
;dac_pwm.c,20 :: 		ANSELC=0;
	CLRF       ANSELC+0
;dac_pwm.c,21 :: 		ANSELA.b1=1; //entrada analoga
	BSF        ANSELA+0, 1
;dac_pwm.c,24 :: 		trisa.b1=1;
	BSF        TRISA+0, 1
;dac_pwm.c,25 :: 		trisa.b0=1; //salida DAC
	BSF        TRISA+0, 0
;dac_pwm.c,27 :: 		TRISC=0;
	CLRF       TRISC+0
;dac_pwm.c,31 :: 		DAC1CON0=0;
	CLRF       DAC1CON0+0
;dac_pwm.c,32 :: 		DAC1CON1=0;
	CLRF       DAC1CON1+0
;dac_pwm.c,33 :: 		DAC1EN_bit=1; //HABILITA EL DAC
	BSF        DAC1EN_bit+0, BitPos(DAC1EN_bit+0)
;dac_pwm.c,34 :: 		DAC1OE1_bit=1; //CONECTA EL dac A RAO
	BSF        DAC1OE1_bit+0, BitPos(DAC1OE1_bit+0)
;dac_pwm.c,37 :: 		TRISC0_bit=1;      // entrada +
	BSF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;dac_pwm.c,38 :: 		TRISC1_bit=1;       // entrada negativa
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;dac_pwm.c,40 :: 		TRISC2_bit=0;       // operacional
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;dac_pwm.c,42 :: 		OPA1CON=0;
	CLRF       OPA1CON+0
;dac_pwm.c,43 :: 		OPA1EN_bit=1; // habilita operacional
	BSF        OPA1EN_bit+0, BitPos(OPA1EN_bit+0)
;dac_pwm.c,46 :: 		while (1)
L_main0:
;dac_pwm.c,48 :: 		codigo=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      _codigo+0
	MOVF       R1, 0
	MOVWF      _codigo+1
;dac_pwm.c,49 :: 		dac=codigo/4.0;// para pasar a 5 bits
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _dac+0
	MOVF       R1, 0
	MOVWF      _dac+1
	MOVF       R2, 0
	MOVWF      _dac+2
	MOVF       R3, 0
	MOVWF      _dac+3
;dac_pwm.c,50 :: 		DAC1CON1=dac;
	CALL       _double2byte+0
	MOVF       R0, 0
	MOVWF      DAC1CON1+0
;dac_pwm.c,52 :: 		}
	GOTO       L_main0
;dac_pwm.c,57 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
