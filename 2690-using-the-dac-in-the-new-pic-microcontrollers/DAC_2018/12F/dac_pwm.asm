
_main:

;dac_pwm.c,5 :: 		void main()
;dac_pwm.c,8 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;dac_pwm.c,9 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;dac_pwm.c,12 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;dac_pwm.c,13 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;dac_pwm.c,14 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;dac_pwm.c,15 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;dac_pwm.c,18 :: 		ansela=0;
	CLRF       ANSELA+0
;dac_pwm.c,19 :: 		ANSELA.b1=1; //entrada analoga
	BSF        ANSELA+0, 1
;dac_pwm.c,22 :: 		trisa.b1=1;
	BSF        TRISA+0, 1
;dac_pwm.c,23 :: 		trisa.b0=1; //salida DAC
	BSF        TRISA+0, 0
;dac_pwm.c,28 :: 		DACCON0=0;
	CLRF       DACCON0+0
;dac_pwm.c,29 :: 		DACCON1=0;
	CLRF       DACCON1+0
;dac_pwm.c,30 :: 		DACEN_bit=1; //HABILITA EL DAC
	BSF        DACEN_bit+0, BitPos(DACEN_bit+0)
;dac_pwm.c,31 :: 		DACOE_bit=1; //CONECTA EL dac A RAO
	BSF        DACOE_bit+0, BitPos(DACOE_bit+0)
;dac_pwm.c,33 :: 		while (1)
L_main0:
;dac_pwm.c,35 :: 		codigo=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      _codigo+0
	MOVF       R1, 0
	MOVWF      _codigo+1
;dac_pwm.c,36 :: 		dac=codigo/32.0;// para pasar a 5 bits
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      132
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
;dac_pwm.c,37 :: 		DACCON1=dac;
	CALL       _double2byte+0
	MOVF       R0, 0
	MOVWF      DACCON1+0
;dac_pwm.c,39 :: 		}
	GOTO       L_main0
;dac_pwm.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
