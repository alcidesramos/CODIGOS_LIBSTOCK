
_main:

;basico.c,6 :: 		void main()
;basico.c,8 :: 		ANSELA=0; // todo digitla;
	CLRF       ANSELA+0
;basico.c,11 :: 		while (1)
L_main0:
;basico.c,13 :: 		TRISA0_bit=0; //configura como salida
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;basico.c,14 :: 		s1_out=1;
	BSF        LATA0_bit+0, BitPos(LATA0_bit+0)
;basico.c,15 :: 		Delay_us(10);
	MOVLW      16
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	NOP
;basico.c,16 :: 		TRISA0_bit=1;
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;basico.c,19 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main3:
	DECFSZ     R13, 1
	GOTO       L_main3
	DECFSZ     R12, 1
	GOTO       L_main3
	DECFSZ     R11, 1
	GOTO       L_main3
	NOP
	NOP
;basico.c,22 :: 		}
	GOTO       L_main0
;basico.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
