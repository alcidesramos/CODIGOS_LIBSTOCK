
_main:

;switccase.c,10 :: 		void main()
;switccase.c,13 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;switccase.c,14 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;switccase.c,15 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;switccase.c,16 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;switccase.c,20 :: 		SPLLEN_bit=0;
	BCF        SPLLEN_bit+0, BitPos(SPLLEN_bit+0)
;switccase.c,21 :: 		TRISA=0;  // todo salida
	CLRF       TRISA+0
;switccase.c,22 :: 		TRISA3_bit=1; // entrada sdel sucihe
	BSF        TRISA3_bit+0, BitPos(TRISA3_bit+0)
;switccase.c,25 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;switccase.c,26 :: 		SCS0_bit=1;
	BSF        SCS0_bit+0, BitPos(SCS0_bit+0)
;switccase.c,28 :: 		ANSELA=0; //   todo digital
	CLRF       ANSELA+0
;switccase.c,32 :: 		LATA=0; //led apado
	CLRF       LATA+0
;switccase.c,33 :: 		Sound_Init(&LATA,5);
	MOVLW      LATA+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      hi_addr(LATA+0)
	MOVWF      FARG_Sound_Init_snd_port+1
	MOVLW      5
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;switccase.c,34 :: 		while (1)
L_main0:
;switccase.c,38 :: 		switch (estados)
	GOTO       L_main2
;switccase.c,40 :: 		case encendido :      //543210
L_main4:
;switccase.c,41 :: 		LATA=0b010111;
	MOVLW      23
	MOVWF      LATA+0
;switccase.c,42 :: 		if (sw==0)
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main5
;switccase.c,44 :: 		estados=flahs;
	MOVLW      1
	MOVWF      _estados+0
;switccase.c,45 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main6:
	DECFSZ     R13, 1
	GOTO       L_main6
	DECFSZ     R12, 1
	GOTO       L_main6
	DECFSZ     R11, 1
	GOTO       L_main6
	NOP
	NOP
;switccase.c,46 :: 		}
L_main5:
;switccase.c,48 :: 		break;
	GOTO       L_main3
;switccase.c,50 :: 		case flahs:              //543210
L_main7:
;switccase.c,51 :: 		LATA=LATA ^ 0b010111;
	MOVLW      23
	XORWF      LATA+0, 1
;switccase.c,52 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main8:
	DECFSZ     R13, 1
	GOTO       L_main8
	DECFSZ     R12, 1
	GOTO       L_main8
	DECFSZ     R11, 1
	GOTO       L_main8
;switccase.c,53 :: 		if (sw==0)
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main9
;switccase.c,57 :: 		LATA=0b010100;
	MOVLW      20
	MOVWF      LATA+0
;switccase.c,58 :: 		estados=policia;
	MOVLW      2
	MOVWF      _estados+0
;switccase.c,59 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main10:
	DECFSZ     R13, 1
	GOTO       L_main10
	DECFSZ     R12, 1
	GOTO       L_main10
	DECFSZ     R11, 1
	GOTO       L_main10
	NOP
	NOP
;switccase.c,60 :: 		}
L_main9:
;switccase.c,62 :: 		break;
	GOTO       L_main3
;switccase.c,65 :: 		case policia:              //543210
L_main11:
;switccase.c,66 :: 		LATA=LATA ^ 0b010111;
	MOVLW      23
	XORWF      LATA+0, 1
;switccase.c,67 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main12:
	DECFSZ     R13, 1
	GOTO       L_main12
	DECFSZ     R12, 1
	GOTO       L_main12
	DECFSZ     R11, 1
	GOTO       L_main12
;switccase.c,68 :: 		if (sw==0)
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main13
;switccase.c,72 :: 		LATA=0b010010;
	MOVLW      18
	MOVWF      LATA+0
;switccase.c,73 :: 		estados=alternado;
	MOVLW      3
	MOVWF      _estados+0
;switccase.c,74 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main14:
	DECFSZ     R13, 1
	GOTO       L_main14
	DECFSZ     R12, 1
	GOTO       L_main14
	DECFSZ     R11, 1
	GOTO       L_main14
	NOP
	NOP
;switccase.c,75 :: 		}
L_main13:
;switccase.c,77 :: 		break;
	GOTO       L_main3
;switccase.c,79 :: 		case alternado:              //543210
L_main15:
;switccase.c,80 :: 		LATA=LATA ^ 0b010111;
	MOVLW      23
	XORWF      LATA+0, 1
;switccase.c,81 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main16:
	DECFSZ     R13, 1
	GOTO       L_main16
	DECFSZ     R12, 1
	GOTO       L_main16
	DECFSZ     R11, 1
	GOTO       L_main16
;switccase.c,82 :: 		if (sw==0)
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main17
;switccase.c,86 :: 		LATA=0b000000;
	CLRF       LATA+0
;switccase.c,87 :: 		estados=apagado;
	MOVLW      4
	MOVWF      _estados+0
;switccase.c,88 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main18:
	DECFSZ     R13, 1
	GOTO       L_main18
	DECFSZ     R12, 1
	GOTO       L_main18
	DECFSZ     R11, 1
	GOTO       L_main18
	NOP
	NOP
;switccase.c,89 :: 		}
L_main17:
;switccase.c,91 :: 		break;
	GOTO       L_main3
;switccase.c,92 :: 		case apagado:       //543210
L_main19:
;switccase.c,93 :: 		LATA=0;
	CLRF       LATA+0
;switccase.c,94 :: 		if (sw==0)
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main20
;switccase.c,98 :: 		LATA=0b000000;
	CLRF       LATA+0
;switccase.c,99 :: 		estados=melodia;
	MOVLW      5
	MOVWF      _estados+0
;switccase.c,100 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main21:
	DECFSZ     R13, 1
	GOTO       L_main21
	DECFSZ     R12, 1
	GOTO       L_main21
	DECFSZ     R11, 1
	GOTO       L_main21
	NOP
	NOP
;switccase.c,101 :: 		}
L_main20:
;switccase.c,103 :: 		break;
	GOTO       L_main3
;switccase.c,104 :: 		case melodia:              //543210
L_main22:
;switccase.c,105 :: 		Sound_Play(1000,100);
	MOVLW      232
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      100
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;switccase.c,106 :: 		Sound_Play(2000,100);
	MOVLW      208
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      7
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      100
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;switccase.c,107 :: 		Sound_Play(3000,100);
	MOVLW      184
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      11
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      100
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;switccase.c,108 :: 		if (sw==0)
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main23
;switccase.c,112 :: 		LATA=0b010111;
	MOVLW      23
	MOVWF      LATA+0
;switccase.c,113 :: 		estados=encendido;
	CLRF       _estados+0
;switccase.c,114 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main24:
	DECFSZ     R13, 1
	GOTO       L_main24
	DECFSZ     R12, 1
	GOTO       L_main24
	DECFSZ     R11, 1
	GOTO       L_main24
	NOP
	NOP
;switccase.c,115 :: 		}
L_main23:
;switccase.c,117 :: 		break;
	GOTO       L_main3
;switccase.c,122 :: 		} //fin switch
L_main2:
	MOVF       _estados+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       _estados+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _estados+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _estados+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _estados+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _estados+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main22
L_main3:
;switccase.c,125 :: 		}
	GOTO       L_main0
;switccase.c,130 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
