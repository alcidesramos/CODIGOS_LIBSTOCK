
_main:

;suma_arz.c,3 :: 		void main()
;suma_arz.c,5 :: 		suma_U.uno=2;
	MOVLW      0
	MOVWF      _suma_U+0
	MOVLW      0
	MOVWF      _suma_U+1
	MOVLW      0
	MOVWF      _suma_U+2
	MOVLW      128
	MOVWF      _suma_U+3
;suma_arz.c,6 :: 		suma_U.dos=4;
	MOVLW      0
	MOVWF      _suma_U+4
	MOVLW      0
	MOVWF      _suma_U+5
	MOVLW      0
	MOVWF      _suma_U+6
	MOVLW      129
	MOVWF      _suma_U+7
;suma_arz.c,9 :: 		suma_step();
	CALL       _suma_step+0
;suma_arz.c,10 :: 		salida_suma=suma_Y.salida;
	MOVF       _suma_Y+0, 0
	MOVWF      _salida_suma+0
	MOVF       _suma_Y+1, 0
	MOVWF      _salida_suma+1
	MOVF       _suma_Y+2, 0
	MOVWF      _salida_suma+2
	MOVF       _suma_Y+3, 0
	MOVWF      _salida_suma+3
;suma_arz.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
