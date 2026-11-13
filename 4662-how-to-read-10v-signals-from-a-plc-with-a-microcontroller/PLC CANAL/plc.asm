
_main:

;plc.c,2 :: 		void main()
;plc.c,5 :: 		OSCCON=0;
	CLRF       OSCCON+0
;plc.c,7 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;plc.c,8 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;plc.c,9 :: 		IRCF1_bit=0;
	BCF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;plc.c,11 :: 		TRISA0_bit=1;  // ENTRADA ANALOGA
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;plc.c,12 :: 		TRISA2_bit=0; //SALIDA PWM
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;plc.c,14 :: 		ADC_Init();// INICA EL ADC
	CALL       _ADC_Init+0
;plc.c,17 :: 		ANSELA=0;
	CLRF       ANSELA+0
;plc.c,18 :: 		AN0_bit=1; //ANALOGO AN0
	BSF        AN0_bit+0, BitPos(AN0_bit+0)
;plc.c,20 :: 		PWM1_Init(250);
	BCF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;plc.c,21 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;plc.c,22 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;plc.c,23 :: 		while(1)
L_main0:
;plc.c,25 :: 		PWM1_Set_Duty(ADC_Get_Sample(0)>>2);  // lee adc y lo corre 2 veces a la derecha es decir, divide por 4
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
	LSRF       R3, 1
	RRF        R2, 1
	LSRF       R3, 1
	RRF        R2, 1
	MOVF       R2, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;plc.c,26 :: 		Delay_ms(50);
	MOVLW      65
	MOVWF      R12
	MOVLW      238
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	DECFSZ     R12, 1
	GOTO       L_main2
	NOP
;plc.c,29 :: 		}
	GOTO       L_main0
;plc.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
