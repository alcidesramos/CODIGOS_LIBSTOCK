
_osciladorInt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Config_Interrupcion.c,4 :: 		void  osciladorInt() org 0x06
;Config_Interrupcion.c,6 :: 		OSCFAIL_bit=0;
	BCLR	OSCFAIL_bit, BitPos(OSCFAIL_bit+0)
;Config_Interrupcion.c,7 :: 		}
L_end_osciladorInt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _osciladorInt

_direccionInt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Config_Interrupcion.c,9 :: 		void direccionInt() org 0x08
;Config_Interrupcion.c,11 :: 		ADDRERR_bit=0;
	BCLR	ADDRERR_bit, BitPos(ADDRERR_bit+0)
;Config_Interrupcion.c,12 :: 		}
L_end_direccionInt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _direccionInt

_pilaInt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Config_Interrupcion.c,14 :: 		void pilaInt() org 0x0A
;Config_Interrupcion.c,16 :: 		STKERR_bit=0;
	BCLR	STKERR_bit, BitPos(STKERR_bit+0)
;Config_Interrupcion.c,17 :: 		}
L_end_pilaInt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _pilaInt

_aritmetrico:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Config_Interrupcion.c,20 :: 		void aritmetrico() org 0x0C
;Config_Interrupcion.c,22 :: 		MATHERR_bit=0;
	BCLR	MATHERR_bit, BitPos(MATHERR_bit+0)
;Config_Interrupcion.c,23 :: 		}
L_end_aritmetrico:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _aritmetrico

_deshabilita:

;Config_Interrupcion.c,25 :: 		void  deshabilita()
;Config_Interrupcion.c,29 :: 		intcon1.b15=0; //para poder hacer el cambio debe star en cero habilitado el anidamiento
	BCLR	INTCON1, #15
;Config_Interrupcion.c,30 :: 		IPL3_bit=1;
	BSET	IPL3_bit, BitPos(IPL3_bit+0)
;Config_Interrupcion.c,31 :: 		IPL_2_bit=1;
	BSET	IPL_2_bit, BitPos(IPL_2_bit+0)
;Config_Interrupcion.c,32 :: 		IPL_1_bit=1;
	BSET	IPL_1_bit, BitPos(IPL_1_bit+0)
;Config_Interrupcion.c,33 :: 		IPL_0_bit=1;
	BSET	IPL_0_bit, BitPos(IPL_0_bit+0)
;Config_Interrupcion.c,34 :: 		intcon1.b15=0; //habilita aninamiento interrupciones
	BCLR	INTCON1, #15
;Config_Interrupcion.c,35 :: 		}
L_end_deshabilita:
	RETURN
; end of _deshabilita

_habilita:

;Config_Interrupcion.c,38 :: 		void  habilita()
;Config_Interrupcion.c,42 :: 		intcon1.b15=0; //para poder hacer el cambio debe star en cero habilitado el anidamiento
	BCLR	INTCON1, #15
;Config_Interrupcion.c,43 :: 		IPL3_bit=0;
	BCLR	IPL3_bit, BitPos(IPL3_bit+0)
;Config_Interrupcion.c,44 :: 		IPL_2_bit=0;
	BCLR	IPL_2_bit, BitPos(IPL_2_bit+0)
;Config_Interrupcion.c,45 :: 		IPL_1_bit=0;
	BCLR	IPL_1_bit, BitPos(IPL_1_bit+0)
;Config_Interrupcion.c,46 :: 		IPL_0_bit=0;
	BCLR	IPL_0_bit, BitPos(IPL_0_bit+0)
;Config_Interrupcion.c,47 :: 		intcon1.b15=0; //habilita aninamiento interrupciones
	BCLR	INTCON1, #15
;Config_Interrupcion.c,48 :: 		}
L_end_habilita:
	RETURN
; end of _habilita
