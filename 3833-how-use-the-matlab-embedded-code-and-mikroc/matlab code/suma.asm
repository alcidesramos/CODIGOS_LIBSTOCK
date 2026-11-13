
_suma_step:

;suma.c,30 :: 		void suma_step(void)
;suma.c,37 :: 		suma_Y.salida = suma_U.uno + suma_U.dos;
	MOVF       _suma_U+0, 0
	MOVWF      R0+0
	MOVF       _suma_U+1, 0
	MOVWF      R0+1
	MOVF       _suma_U+2, 0
	MOVWF      R0+2
	MOVF       _suma_U+3, 0
	MOVWF      R0+3
	MOVF       _suma_U+4, 0
	MOVWF      R4+0
	MOVF       _suma_U+5, 0
	MOVWF      R4+1
	MOVF       _suma_U+6, 0
	MOVWF      R4+2
	MOVF       _suma_U+7, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _suma_Y+0
	MOVF       R0+1, 0
	MOVWF      _suma_Y+1
	MOVF       R0+2, 0
	MOVWF      _suma_Y+2
	MOVF       R0+3, 0
	MOVWF      _suma_Y+3
;suma.c,38 :: 		}
L_end_suma_step:
	RETURN
; end of _suma_step

_suma_initialize:

;suma.c,41 :: 		void suma_initialize(void)
;suma.c,44 :: 		}
L_end_suma_initialize:
	RETURN
; end of _suma_initialize

_suma_terminate:

;suma.c,47 :: 		void suma_terminate(void)
;suma.c,50 :: 		}
L_end_suma_terminate:
	RETURN
; end of _suma_terminate

suma____?ag:

L_end_suma___?ag:
	RETURN
; end of suma____?ag
