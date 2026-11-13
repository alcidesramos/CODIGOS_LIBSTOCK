
_espera:

;crucecero.c,8 :: 		void  espera(char t)
;crucecero.c,10 :: 		TMR0=t;
	MOVF       FARG_espera_t+0, 0
	MOVWF      TMR0+0
;crucecero.c,11 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;crucecero.c,12 :: 		while  (TMR0IF_bit==0) ;    // espera timer se desborde
L_espera0:
	BTFSC      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_espera1
	GOTO       L_espera0
L_espera1:
;crucecero.c,14 :: 		}
L_end_espera:
	RETURN
; end of _espera

_main:

;crucecero.c,20 :: 		void main()
;crucecero.c,24 :: 		OSCCON=0;
	CLRF       OSCCON+0
;crucecero.c,25 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;crucecero.c,27 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;crucecero.c,28 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;crucecero.c,31 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;crucecero.c,32 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;crucecero.c,33 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;crucecero.c,34 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;crucecero.c,37 :: 		SPLLEN_bit=1; //prende el PLL por 4
	BSF        SPLLEN_bit+0, BitPos(SPLLEN_bit+0)
;crucecero.c,42 :: 		ansela=0;
	CLRF       ANSELA+0
;crucecero.c,43 :: 		ansela.b0=1;//pin analogo  // el potenciometro
	BSF        ANSELA+0, 0
;crucecero.c,46 :: 		trisa=0;
	CLRF       TRISA+0
;crucecero.c,47 :: 		trisa.b0=1;// como entrada
	BSF        TRISA+0, 0
;crucecero.c,48 :: 		trisa.b2=1;// cruce por cero
	BSF        TRISA+0, 2
;crucecero.c,50 :: 		ADC_Init();     // inicalizo el adc
	CALL       _ADC_Init+0
;crucecero.c,54 :: 		OPTION_REG=0; //tmr0 como contador
	CLRF       OPTION_REG+0
;crucecero.c,57 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;crucecero.c,58 :: 		PS1_bit=1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;crucecero.c,59 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;crucecero.c,61 :: 		while (1)
L_main2:
;crucecero.c,63 :: 		codigo=ADC_Get_Sample(0);// lee  la energia deseada
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0, 0
	MOVWF      _codigo+0
	MOVF       R1, 0
	MOVWF      _codigo+1
;crucecero.c,65 :: 		if (codigo<=200) triac=0;
	MOVF       R1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       R0, 0
	SUBLW      200
L__main13:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
	BCF        LATA1_bit+0, BitPos(LATA1_bit+0)
	GOTO       L_main5
L_main4:
;crucecero.c,66 :: 		else if (codigo>=900) triac=1;
	MOVLW      3
	SUBWF      _codigo+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      132
	SUBWF      _codigo+0, 0
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
	BSF        LATA1_bit+0, BitPos(LATA1_bit+0)
	GOTO       L_main7
L_main6:
;crucecero.c,69 :: 		while ((opto==0)) ;
L_main8:
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;crucecero.c,70 :: 		velocidad= codigo >>2;  //   corre dos posi9ciones o dicide entre 4 para ubicar los 1023 en el rango de 255 del tiemr0
	MOVF       _codigo+0, 0
	MOVWF      R0
	MOVF       _codigo+1, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      _velocidad+0
;crucecero.c,71 :: 		espera(velocidad);
	MOVF       R0, 0
	MOVWF      FARG_espera_t+0
	CALL       _espera+0
;crucecero.c,72 :: 		triac=1;
	BSF        LATA1_bit+0, BitPos(LATA1_bit+0)
;crucecero.c,73 :: 		delay_us(100);
	MOVLW      2
	MOVWF      R12
	MOVLW      8
	MOVWF      R13
L_main10:
	DECFSZ     R13, 1
	GOTO       L_main10
	DECFSZ     R12, 1
	GOTO       L_main10
	NOP
;crucecero.c,74 :: 		triac=0;
	BCF        LATA1_bit+0, BitPos(LATA1_bit+0)
;crucecero.c,76 :: 		}
L_main7:
L_main5:
;crucecero.c,78 :: 		}
	GOTO       L_main2
;crucecero.c,83 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
