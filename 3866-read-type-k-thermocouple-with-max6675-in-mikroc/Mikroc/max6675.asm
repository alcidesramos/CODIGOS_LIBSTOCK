
_max6675_init:

;max6675.c,4 :: 		void max6675_init()
;max6675.c,6 :: 		max6675_ck_dir=0;   //salida reloj
	BCF        TRISC+0, 3
;max6675.c,7 :: 		max6675_cs_dir=0;  //salida cs
	BCF        TRISC+0, 0
;max6675.c,8 :: 		max6675_dat_dir=1;  //entrada dato
	BSF        TRISC+0, 4
;max6675.c,11 :: 		max6675_cs=1;//salida 1
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;max6675.c,12 :: 		max6675_ck=0; //saca cero por el reloj
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;max6675.c,13 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_max6675_init0:
	DECFSZ     R13+0, 1
	GOTO       L_max6675_init0
	DECFSZ     R12+0, 1
	GOTO       L_max6675_init0
	NOP
	NOP
;max6675.c,14 :: 		}
L_end_max6675_init:
	RETURN
; end of _max6675_init

_max6675_pulso:

;max6675.c,16 :: 		char max6675_pulso()
;max6675.c,20 :: 		max6675_ck=1; //saca uno por el reloj
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
;max6675.c,21 :: 		Delay_us(10);
	MOVLW      3
	MOVWF      R13+0
L_max6675_pulso1:
	DECFSZ     R13+0, 1
	GOTO       L_max6675_pulso1
;max6675.c,22 :: 		lei=max6675_dat;
	MOVLW      0
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	MOVLW      1
	MOVWF      R1+0
;max6675.c,23 :: 		max6675_ck=0; //saca cero por el reloj
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;max6675.c,24 :: 		Delay_us(10);
	MOVLW      3
	MOVWF      R13+0
L_max6675_pulso2:
	DECFSZ     R13+0, 1
	GOTO       L_max6675_pulso2
;max6675.c,25 :: 		return lei;
	MOVF       R1+0, 0
	MOVWF      R0+0
;max6675.c,26 :: 		}
L_end_max6675_pulso:
	RETURN
; end of _max6675_pulso

_max6675_lee:

;max6675.c,28 :: 		float max6675_lee()
;max6675.c,32 :: 		unsigned int max6675_dato=0;
	CLRF       max6675_lee_max6675_dato_L0+0
	CLRF       max6675_lee_max6675_dato_L0+1
;max6675.c,35 :: 		max6675_cs=0;   // habilita el modulo
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;max6675.c,37 :: 		for (cont=15;cont>=0;cont--)
	MOVLW      15
	MOVWF      max6675_lee_cont_L0+0
L_max6675_lee3:
	MOVLW      128
	XORWF      max6675_lee_cont_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_max6675_lee4
;max6675.c,39 :: 		if (max6675_pulso()==1)  max6675_dato=max6675_dato | 1<<cont ;
	CALL       _max6675_pulso+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_max6675_lee6
	MOVF       max6675_lee_cont_L0+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__max6675_lee10:
	BTFSC      STATUS+0, 2
	GOTO       L__max6675_lee11
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__max6675_lee10
L__max6675_lee11:
	MOVF       R0+0, 0
	IORWF      max6675_lee_max6675_dato_L0+0, 1
	MOVF       R0+1, 0
	IORWF      max6675_lee_max6675_dato_L0+1, 1
L_max6675_lee6:
;max6675.c,37 :: 		for (cont=15;cont>=0;cont--)
	DECF       max6675_lee_cont_L0+0, 1
;max6675.c,41 :: 		}//fin for
	GOTO       L_max6675_lee3
L_max6675_lee4:
;max6675.c,43 :: 		max6675_cs=1;  //apagar modulo
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;max6675.c,46 :: 		sensor_dato=(max6675_dato>>3 ); //desplaz 3 veces
	MOVF       max6675_lee_max6675_dato_L0+0, 0
	MOVWF      R0+0
	MOVF       max6675_lee_max6675_dato_L0+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
;max6675.c,47 :: 		return((sensor_dato*0.25));
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
;max6675.c,48 :: 		}
L_end_max6675_lee:
	RETURN
; end of _max6675_lee
