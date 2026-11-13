
_main:

;BUCK.c,4 :: 		void main()
;BUCK.c,9 :: 		OSCCON=0;
	CLRF       OSCCON+0
;BUCK.c,10 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;BUCK.c,12 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;BUCK.c,13 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;BUCK.c,16 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;BUCK.c,17 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;BUCK.c,18 :: 		IRCF1_bit=0;
	BCF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;BUCK.c,19 :: 		IRCF0_bit=1;
	BSF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;BUCK.c,41 :: 		INTCON=0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;BUCK.c,44 :: 		ansela=0;
	CLRF       ANSELA+0
;BUCK.c,45 :: 		ANSELA.b0=1; //analogo an0
	BSF        ANSELA+0, 0
;BUCK.c,47 :: 		TRISA2_bit=0;  //Salida PWM
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;BUCK.c,48 :: 		TRISA0_bit=1;  //Entrada ADC
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;BUCK.c,49 :: 		PWM1_Init(20000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      49
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;BUCK.c,50 :: 		PWM1_Set_Duty(127);
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;BUCK.c,51 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;BUCK.c,52 :: 		ADC_Init();
	CALL       _ADC_Init+0
;BUCK.c,53 :: 		while (1)
L_main0:
;BUCK.c,55 :: 		codigo=ADC_Get_Sample(0);   // 0- 1023
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0, 0
	MOVWF      _codigo+0
	MOVF       R1, 0
	MOVWF      _codigo+1
;BUCK.c,56 :: 		PWM1_Set_Duty(255-(codigo>>2));
	MOVF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
	LSRF       R3, 1
	RRF        R2, 1
	LSRF       R3, 1
	RRF        R2, 1
	MOVF       R2, 0
	SUBLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;BUCK.c,57 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	DECFSZ     R12, 1
	GOTO       L_main2
	DECFSZ     R11, 1
	GOTO       L_main2
	NOP
;BUCK.c,59 :: 		}
	GOTO       L_main0
;BUCK.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
