
_osciladorInt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_interrupcion.h,4 :: 		void  osciladorInt() org 0x06
;config_interrupcion.h,6 :: 		OSCFAIL_bit=0;
	BCLR	OSCFAIL_bit, BitPos(OSCFAIL_bit+0)
;config_interrupcion.h,7 :: 		}
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

;config_interrupcion.h,9 :: 		void direccionInt() org 0x08
;config_interrupcion.h,11 :: 		ADDRERR_bit=0;
	BCLR	ADDRERR_bit, BitPos(ADDRERR_bit+0)
;config_interrupcion.h,12 :: 		}
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

;config_interrupcion.h,14 :: 		void pilaInt() org 0x0A
;config_interrupcion.h,16 :: 		STKERR_bit=0;
	BCLR	STKERR_bit, BitPos(STKERR_bit+0)
;config_interrupcion.h,17 :: 		}
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

;config_interrupcion.h,20 :: 		void aritmetrico() org 0x0C
;config_interrupcion.h,22 :: 		MATHERR_bit=0;
	BCLR	MATHERR_bit, BitPos(MATHERR_bit+0)
;config_interrupcion.h,23 :: 		}
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

;config_interrupcion.h,25 :: 		void  deshabilita()
;config_interrupcion.h,29 :: 		intcon1.b15=0; //para poder hacer el cambio debe star en cero habilitado el anidamiento
	BCLR	INTCON1, #15
;config_interrupcion.h,30 :: 		IPL3_bit=1;
	BSET	IPL3_bit, BitPos(IPL3_bit+0)
;config_interrupcion.h,31 :: 		IPL_2_bit=1;
	BSET	IPL_2_bit, BitPos(IPL_2_bit+0)
;config_interrupcion.h,32 :: 		IPL_1_bit=1;
	BSET	IPL_1_bit, BitPos(IPL_1_bit+0)
;config_interrupcion.h,33 :: 		IPL_0_bit=1;
	BSET	IPL_0_bit, BitPos(IPL_0_bit+0)
;config_interrupcion.h,34 :: 		intcon1.b15=1; //deshabilita aninamiento interrupciones  0=habilita    1=deshabilita
	BSET	INTCON1, #15
;config_interrupcion.h,35 :: 		}
L_end_deshabilita:
	RETURN
; end of _deshabilita

_habilita:

;config_interrupcion.h,38 :: 		void  habilita()
;config_interrupcion.h,42 :: 		intcon1.b15=0; //para poder hacer el cambio debe star en cero habilitado el anidamiento
	BCLR	INTCON1, #15
;config_interrupcion.h,43 :: 		IPL3_bit=0;
	BCLR	IPL3_bit, BitPos(IPL3_bit+0)
;config_interrupcion.h,44 :: 		IPL_2_bit=0;
	BCLR	IPL_2_bit, BitPos(IPL_2_bit+0)
;config_interrupcion.h,45 :: 		IPL_1_bit=0;
	BCLR	IPL_1_bit, BitPos(IPL_1_bit+0)
;config_interrupcion.h,46 :: 		IPL_0_bit=0;
	BCLR	IPL_0_bit, BitPos(IPL_0_bit+0)
;config_interrupcion.h,47 :: 		intcon1.b15=1; //deshabilita aninamiento interrupciones  0=habilita    1=deshabilita
	BSET	INTCON1, #15
;config_interrupcion.h,48 :: 		}
L_end_habilita:
	RETURN
; end of _habilita

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68
	LNK	#4

;dspictimers.c,25 :: 		void main()
;dspictimers.c,34 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;dspictimers.c,35 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;dspictimers.c,36 :: 		PLLFBD=78; // selecciona  M=80;  siempre lo deseado menos 2;
	MOV	#78, W0
	MOV	WREG, PLLFBD
;dspictimers.c,38 :: 		deshabilita();
	CALL	_deshabilita
;dspictimers.c,40 :: 		AD1PCFGL=0xffff;// todo digital
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;dspictimers.c,42 :: 		TRISA=0;
	CLR	TRISA
;dspictimers.c,43 :: 		TRISB=0x0;
	CLR	TRISB
;dspictimers.c,44 :: 		LATB=0;
	CLR	LATB
;dspictimers.c,45 :: 		TRISA4_bit=1;
	BSET	TRISA4_bit, BitPos(TRISA4_bit+0)
;dspictimers.c,46 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;dspictimers.c,47 :: 		PPS_Mapping(0,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	CLR	W10
	CALL	_PPS_Mapping
;dspictimers.c,48 :: 		PPS_Mapping(2,_INPUT,_IC1);
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping
;dspictimers.c,49 :: 		PPS_Mapping(3,_INPUT,_IC2);
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping
;dspictimers.c,50 :: 		PPS_Mapping(4,_INPUT,_IC7);
	MOV.B	#6, W12
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_PPS_Mapping
;dspictimers.c,51 :: 		PPS_Mapping(5,_INPUT,_IC8);
	MOV.B	#7, W12
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_PPS_Mapping
;dspictimers.c,53 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;dspictimers.c,54 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;dspictimers.c,56 :: 		UART1_Write_Text("INCICIANDO\r\n");
	MOV	#lo_addr(?lstr1_dspictimers), W10
	CALL	_UART1_Write_Text
;dspictimers.c,61 :: 		config_inputcapure();
	CALL	_config_inputcapure
;dspictimers.c,63 :: 		habilita();
	CALL	_habilita
;dspictimers.c,64 :: 		while (1)
L_main0:
;dspictimers.c,68 :: 		disparo=0;
	BCLR	LATA1_bit, BitPos(LATA1_bit+0)
;dspictimers.c,69 :: 		Delay_us(10);
	MOV	#133, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	NOP
;dspictimers.c,71 :: 		disparo=1;
	BSET	LATA1_bit, BitPos(LATA1_bit+0)
;dspictimers.c,72 :: 		LATB13_bit=!LATB13_bit;
	BTG	LATB13_bit, BitPos(LATB13_bit+0)
;dspictimers.c,73 :: 		Delay_ms(200);
	MOV	#41, W8
	MOV	#45239, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
;dspictimers.c,76 :: 		ancho1=((float)pulso_1*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
	MOV	_pulso_1, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_prescalador, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _ancho1
	MOV	W1, _ancho1+2
;dspictimers.c,78 :: 		dis1=ancho1/58e-6;
	MOV	#17671, W2
	MOV	#14451, W3
	CALL	__Div_FP
	MOV	W0, _dis1
	MOV	W1, _dis1+2
;dspictimers.c,81 :: 		ancho2=((float)pulso_2*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
	MOV	_pulso_2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _ancho2
	MOV	W1, _ancho2+2
;dspictimers.c,84 :: 		dis2=ancho2/58e-6;
	MOV	#17671, W2
	MOV	#14451, W3
	CALL	__Div_FP
	MOV	W0, _dis2
	MOV	W1, _dis2+2
;dspictimers.c,86 :: 		ancho3=((float)pulso_3*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
	MOV	_pulso_3, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _ancho3
	MOV	W1, _ancho3+2
;dspictimers.c,89 :: 		dis3=ancho3/58e-6;
	MOV	#17671, W2
	MOV	#14451, W3
	CALL	__Div_FP
	MOV	W0, _dis3
	MOV	W1, _dis3+2
;dspictimers.c,92 :: 		ancho4=((float)pulso_4*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
	MOV	_pulso_4, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _ancho4
	MOV	W1, _ancho4+2
;dspictimers.c,95 :: 		dis4=ancho4/58e-6;
	MOV	#17671, W2
	MOV	#14451, W3
	CALL	__Div_FP
	MOV	W0, _dis4
	MOV	W1, _dis4+2
;dspictimers.c,98 :: 		sprintf(texto,"dis1=%.1fcm    dis2=%.1fcm   dis3=%.1fcm  dis4=%.1fcm\r\n", dis1,dis2,dis3,dis4);
	PUSH.D	W0
	PUSH	_dis3
	PUSH	_dis3+2
	PUSH	_dis2
	PUSH	_dis2+2
	PUSH	_dis1
	PUSH	_dis1+2
	MOV	#lo_addr(?lstr_2_dspictimers), W0
	PUSH	W0
	MOV	#lo_addr(_texto), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#20, W15
;dspictimers.c,99 :: 		UART1_Write_Text(texto);
	MOV	#lo_addr(_texto), W10
	CALL	_UART1_Write_Text
;dspictimers.c,102 :: 		}
	GOTO	L_main0
;dspictimers.c,104 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
