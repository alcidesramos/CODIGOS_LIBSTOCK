
_main:

;CICLO.c,4 :: 		void main()
;CICLO.c,6 :: 		TRISC=0; // portc salida
	CLRF       TRISC+0
;CICLO.c,7 :: 		ANSELC=0; // PORTC DIGITAL
	CLRF       ANSELC+0
;CICLO.c,9 :: 		while (1)
L_main0:
;CICLO.c,11 :: 		for (cuenta=1;cuenta!=0b1000000;cuenta=cuenta<<1)
	MOVLW      1
	MOVWF      _cuenta+0
L_main2:
	MOVF       _cuenta+0, 0
	XORLW      64
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;CICLO.c,13 :: 		LATC=cuenta;
	MOVF       _cuenta+0, 0
	MOVWF      LATC+0
;CICLO.c,14 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	NOP
	NOP
;CICLO.c,11 :: 		for (cuenta=1;cuenta!=0b1000000;cuenta=cuenta<<1)
	LSLF       _cuenta+0, 1
;CICLO.c,17 :: 		}
	GOTO       L_main2
L_main3:
;CICLO.c,19 :: 		}
	GOTO       L_main0
;CICLO.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
