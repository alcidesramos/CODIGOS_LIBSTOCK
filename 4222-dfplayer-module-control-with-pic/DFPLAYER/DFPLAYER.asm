
_main:

;DFPLAYER.c,20 :: 		void main()
;DFPLAYER.c,22 :: 		ADCON1=0; // todo analogo;
	CLRF       ADCON1+0
;DFPLAYER.c,23 :: 		TRISA0_bit=1;   //entrada analogos
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;DFPLAYER.c,24 :: 		TRISB0_bit=1;  //entrada pulsador1
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;DFPLAYER.c,25 :: 		TRISB1_bit=1;  //entrada pulsador2
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;DFPLAYER.c,26 :: 		TRISC0_bit=0;// salida led;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;DFPLAYER.c,27 :: 		TRISC6_bit=0;  //salida tx
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;DFPLAYER.c,28 :: 		TRISC7_bit=1; // entrada rx
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;DFPLAYER.c,29 :: 		NOT_RBPU_bit=0; //habilita pull up en portb
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;DFPLAYER.c,30 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;DFPLAYER.c,31 :: 		mp3_inicializa();    // manda comando de inicializacion
	CALL       _mp3_inicializa+0
;DFPLAYER.c,32 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;DFPLAYER.c,34 :: 		mp3_play_x(bienvenida);
	MOVLW      5
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;DFPLAYER.c,35 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;DFPLAYER.c,36 :: 		while (1)
L_main3:
;DFPLAYER.c,38 :: 		codigo=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;DFPLAYER.c,39 :: 		temperatuta=codigo*500.0/1023.0;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temperatuta+0
	MOVF       R0+1, 0
	MOVWF      _temperatuta+1
	MOVF       R0+2, 0
	MOVWF      _temperatuta+2
	MOVF       R0+3, 0
	MOVWF      _temperatuta+3
;DFPLAYER.c,41 :: 		if (temperatuta>60)
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      112
	MOVWF      R0+2
	MOVLW      132
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;DFPLAYER.c,43 :: 		mp3_play_x(temp_alta);
	MOVLW      2
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;DFPLAYER.c,44 :: 		Delay_ms(5000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;DFPLAYER.c,45 :: 		}
	GOTO       L_main7
L_main5:
;DFPLAYER.c,46 :: 		else if (temperatuta<20)
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       _temperatuta+0, 0
	MOVWF      R0+0
	MOVF       _temperatuta+1, 0
	MOVWF      R0+1
	MOVF       _temperatuta+2, 0
	MOVWF      R0+2
	MOVF       _temperatuta+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;DFPLAYER.c,48 :: 		mp3_play_x(temp_baja);
	MOVLW      3
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;DFPLAYER.c,49 :: 		Delay_ms(4000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;DFPLAYER.c,50 :: 		}
L_main8:
L_main7:
;DFPLAYER.c,52 :: 		if (sw==0)
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main10
;DFPLAYER.c,54 :: 		mp3_volumen_x(20);
	MOVLW      20
	MOVWF      FARG_mp3_volumen_x_vol+0
	CALL       _mp3_volumen_x+0
;DFPLAYER.c,55 :: 		mp3_play_x(suiche_pres);
	MOVLW      4
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;DFPLAYER.c,56 :: 		Delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;DFPLAYER.c,57 :: 		}
L_main10:
;DFPLAYER.c,59 :: 		if (sw1==0)
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main12
;DFPLAYER.c,61 :: 		mp3_volumen_x(30);
	MOVLW      30
	MOVWF      FARG_mp3_volumen_x_vol+0
	CALL       _mp3_volumen_x+0
;DFPLAYER.c,62 :: 		mp3_play_x(musica);
	MOVLW      1
	MOVWF      FARG_mp3_play_x_cancion+0
	MOVLW      0
	MOVWF      FARG_mp3_play_x_cancion+1
	CALL       _mp3_play_x+0
;DFPLAYER.c,63 :: 		Delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;DFPLAYER.c,64 :: 		}
L_main12:
;DFPLAYER.c,66 :: 		led =!led;
	MOVLW
	XORWF      RC0_bit+0, 1
;DFPLAYER.c,67 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;DFPLAYER.c,71 :: 		}
	GOTO       L_main3
;DFPLAYER.c,75 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
