
_main:

;prueba.c,1 :: 		void main()
;prueba.c,3 :: 		ADCON1=0b1111;
	MOVLW       15
	MOVWF       ADCON1+0 
;prueba.c,4 :: 		TRISB=0;
	CLRF        TRISB+0 
;prueba.c,5 :: 		LATB=0;
	CLRF        LATB+0 
;prueba.c,6 :: 		while (1)
L_main0:
;prueba.c,9 :: 		LATB=~LATB;
	COMF        LATB+0, 1 
;prueba.c,10 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;prueba.c,13 :: 		}
	GOTO        L_main0
;prueba.c,15 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
