
_main:

;mosfet.c,2 :: 		void main()
;mosfet.c,6 :: 		OSCCON=0;
	CLRF       OSCCON+0
;mosfet.c,7 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;mosfet.c,9 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;mosfet.c,10 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;mosfet.c,13 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;mosfet.c,14 :: 		IRCF2_bit=0;
	BCF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;mosfet.c,15 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;mosfet.c,16 :: 		IRCF0_bit=1;
	BSF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;mosfet.c,18 :: 		ANSELA=0; //todo digital
	CLRF       ANSELA+0
;mosfet.c,19 :: 		TRISA=0;  //Todo salida
	CLRF       TRISA+0
;mosfet.c,20 :: 		PWM1_Init(100);
	BCF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      156
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;mosfet.c,21 :: 		PWM1_Set_Duty(max-200);
	MOVLW      55
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;mosfet.c,22 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;mosfet.c,23 :: 		while(1)
L_main0:
;mosfet.c,27 :: 		}
	GOTO       L_main0
;mosfet.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
