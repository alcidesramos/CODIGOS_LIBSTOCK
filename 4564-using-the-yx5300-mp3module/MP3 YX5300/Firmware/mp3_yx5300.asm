
_main:

;mp3_yx5300.c,20 :: 		void main()
;mp3_yx5300.c,23 :: 		ADCON1=0; // todo analogo;
	CLRF       ADCON1+0
;mp3_yx5300.c,24 :: 		TRISA0_bit=1;   //entrada analogos
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;mp3_yx5300.c,25 :: 		TRISB0_bit=1;  //entrada pulsador1
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;mp3_yx5300.c,26 :: 		TRISB1_bit=1;  //entrada pulsador2
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;mp3_yx5300.c,27 :: 		TRISC0_bit=0;// salida led;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;mp3_yx5300.c,28 :: 		TRISC6_bit=0;  //salida tx
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;mp3_yx5300.c,29 :: 		TRISC7_bit=1; // entrada rx
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;mp3_yx5300.c,30 :: 		NOT_RBPU_bit=0; //habilita pull up en portb
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;mp3_yx5300.c,31 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;mp3_yx5300.c,32 :: 		mp3_init();    // manda comando de inicializacion
	CALL       _mp3_init+0
;mp3_yx5300.c,34 :: 		mp3_set_vol(30);
	MOVLW      30
	MOVWF      FARG_mp3_set_vol_volu+0
	CALL       _mp3_set_vol+0
;mp3_yx5300.c,49 :: 		while (1)
L_main1:
;mp3_yx5300.c,51 :: 		codigo=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;mp3_yx5300.c,52 :: 		temperatuta=codigo*500.0/1023.0;
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
;mp3_yx5300.c,54 :: 		if (temperatuta>60)
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
	GOTO       L_main3
;mp3_yx5300.c,56 :: 		mp3_play_song(temp_alta);
	MOVLW      2
	MOVWF      FARG_mp3_play_song_song+0
	CALL       _mp3_play_song+0
;mp3_yx5300.c,57 :: 		Delay_ms(5000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;mp3_yx5300.c,58 :: 		}
	GOTO       L_main5
L_main3:
;mp3_yx5300.c,59 :: 		else if (temperatuta<20)
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
	GOTO       L_main6
;mp3_yx5300.c,61 :: 		mp3_play_song(temp_baja);
	MOVLW      3
	MOVWF      FARG_mp3_play_song_song+0
	CALL       _mp3_play_song+0
;mp3_yx5300.c,62 :: 		Delay_ms(4000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;mp3_yx5300.c,63 :: 		}
L_main6:
L_main5:
;mp3_yx5300.c,65 :: 		if (sw==0)      //sube volumen
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main8
;mp3_yx5300.c,67 :: 		mp3_vol_up();
	CALL       _mp3_vol_up+0
;mp3_yx5300.c,68 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;mp3_yx5300.c,69 :: 		}
L_main8:
;mp3_yx5300.c,73 :: 		if (sw1==0)     //baja volumen
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main10
;mp3_yx5300.c,75 :: 		mp3_vol_down();
	CALL       _mp3_vol_down+0
;mp3_yx5300.c,76 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;mp3_yx5300.c,77 :: 		}
L_main10:
;mp3_yx5300.c,79 :: 		led =!led;
	MOVLW
	XORWF      RC0_bit+0, 1
;mp3_yx5300.c,80 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;mp3_yx5300.c,82 :: 		}
	GOTO       L_main1
;mp3_yx5300.c,84 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
