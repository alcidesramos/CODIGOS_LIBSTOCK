
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

_config_timer_frec:

;config_timer_frec.h,7 :: 		void config_timer_frec()
;config_timer_frec.h,10 :: 		TMR1=TMR2=TMR3=0;
	CLR	TMR3
	MOV	TMR3, WREG
	MOV	WREG, TMR2
	MOV	TMR2, WREG
	MOV	WREG, TMR1
;config_timer_frec.h,11 :: 		PR1=PR2=PR3=31250;// para  50ms
	MOV	#31250, W0
	MOV	WREG, PR3
	MOV	PR3, WREG
	MOV	WREG, PR2
	MOV	PR2, WREG
	MOV	WREG, PR1
;config_timer_frec.h,12 :: 		T1CON=T2CON=T3CON=0;
	CLR	T3CON
	MOV	T3CON, WREG
	MOV	WREG, T2CON
	MOV	T2CON, WREG
	MOV	WREG, T1CON
;config_timer_frec.h,13 :: 		T1CONbits.TGATE=T2CONbits.TGATE=T3CONbits.TGATE=1;  //para medir ancho pulso
	BSET.B	T3CONbits, #6
	BTSS	T3CONbits, #6
	BCLR.B	T2CONbits, #6
	BTSC	T3CONbits, #6
	BSET.B	T2CONbits, #6
	BTSS	T2CONbits, #6
	BCLR.B	T1CONbits, #6
	BTSC	T2CONbits, #6
	BSET.B	T1CONbits, #6
;config_timer_frec.h,15 :: 		T1CONbits.TCKPS=T2CONbits.TCKPS=T3CONbits.TCKPS=0b10;  // preescalador de 64
	MOV.B	#32, W0
	MOV.B	W0, W1
	MOV	#lo_addr(T3CONbits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#48, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(T3CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(T3CONbits), W0
	MOV.B	W1, [W0]
	MOV	#lo_addr(T3CONbits), W0
	MOV.B	[W0], W0
	MOV.B	W0, W1
	MOV.B	#48, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	MOV.B	W1, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	W3, [W0]
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	[W0], W0
	MOV.B	W0, W1
	MOV.B	#48, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	MOV.B	W1, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T1CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T1CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T1CONbits), W0
	MOV.B	W3, [W0]
;config_timer_frec.h,16 :: 		T1CONbits.TON=T2CONbits.TON=T3CONbits.TON=1;//prende timer
	BSET	T3CONbits, #15
	BTSS	T3CONbits, #15
	BCLR	T2CONbits, #15
	BTSC	T3CONbits, #15
	BSET	T2CONbits, #15
	BTSS	T2CONbits, #15
	BCLR	T1CONbits, #15
	BTSC	T2CONbits, #15
	BSET	T1CONbits, #15
;config_timer_frec.h,18 :: 		T1IP_2_bit=T2IP_2_bit=T3IP_2_bit=0;
	BCLR	T3IP_2_bit, BitPos(T3IP_2_bit+0)
	BTSS	T3IP_2_bit, BitPos(T3IP_2_bit+0)
	BCLR	T2IP_2_bit, BitPos(T2IP_2_bit+0)
	BTSC	T3IP_2_bit, BitPos(T3IP_2_bit+0)
	BSET	T2IP_2_bit, BitPos(T2IP_2_bit+0)
	BTSS	T2IP_2_bit, BitPos(T2IP_2_bit+0)
	BCLR	T1IP_2_bit, BitPos(T1IP_2_bit+0)
	BTSC	T2IP_2_bit, BitPos(T2IP_2_bit+0)
	BSET	T1IP_2_bit, BitPos(T1IP_2_bit+0)
;config_timer_frec.h,19 :: 		T1IP_1_bit=T2IP_1_bit=T3IP_1_bit=0;
	BCLR	T3IP_1_bit, BitPos(T3IP_1_bit+0)
	BTSS	T3IP_1_bit, BitPos(T3IP_1_bit+0)
	BCLR	T2IP_1_bit, BitPos(T2IP_1_bit+0)
	BTSC	T3IP_1_bit, BitPos(T3IP_1_bit+0)
	BSET	T2IP_1_bit, BitPos(T2IP_1_bit+0)
	BTSS	T2IP_1_bit, BitPos(T2IP_1_bit+0)
	BCLR	T1IP_1_bit, BitPos(T1IP_1_bit+0)
	BTSC	T2IP_1_bit, BitPos(T2IP_1_bit+0)
	BSET	T1IP_1_bit, BitPos(T1IP_1_bit+0)
;config_timer_frec.h,20 :: 		T1IP_0_bit=T2IP_0_bit=T3IP_0_bit=1;
	BSET	T3IP_0_bit, BitPos(T3IP_0_bit+0)
	BTSS	T3IP_0_bit, BitPos(T3IP_0_bit+0)
	BCLR	T2IP_0_bit, BitPos(T2IP_0_bit+0)
	BTSC	T3IP_0_bit, BitPos(T3IP_0_bit+0)
	BSET	T2IP_0_bit, BitPos(T2IP_0_bit+0)
	BTSS	T2IP_0_bit, BitPos(T2IP_0_bit+0)
	BCLR	T1IP_0_bit, BitPos(T1IP_0_bit+0)
	BTSC	T2IP_0_bit, BitPos(T2IP_0_bit+0)
	BSET	T1IP_0_bit, BitPos(T1IP_0_bit+0)
;config_timer_frec.h,23 :: 		T1IF_bit=T2IF_bit=T3IF_bit=0;
	BCLR	T3IF_bit, BitPos(T3IF_bit+0)
	BTSS	T3IF_bit, BitPos(T3IF_bit+0)
	BCLR	T2IF_bit, BitPos(T2IF_bit+0)
	BTSC	T3IF_bit, BitPos(T3IF_bit+0)
	BSET	T2IF_bit, BitPos(T2IF_bit+0)
	BTSS	T2IF_bit, BitPos(T2IF_bit+0)
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
	BTSC	T2IF_bit, BitPos(T2IF_bit+0)
	BSET	T1IF_bit, BitPos(T1IF_bit+0)
;config_timer_frec.h,24 :: 		T1IE_bit=T2IE_bit=T3IE_bit=1;
	BSET	T3IE_bit, BitPos(T3IE_bit+0)
	BTSS	T3IE_bit, BitPos(T3IE_bit+0)
	BCLR	T2IE_bit, BitPos(T2IE_bit+0)
	BTSC	T3IE_bit, BitPos(T3IE_bit+0)
	BSET	T2IE_bit, BitPos(T2IE_bit+0)
	BTSS	T2IE_bit, BitPos(T2IE_bit+0)
	BCLR	T1IE_bit, BitPos(T1IE_bit+0)
	BTSC	T2IE_bit, BitPos(T2IE_bit+0)
	BSET	T1IE_bit, BitPos(T1IE_bit+0)
;config_timer_frec.h,26 :: 		}
L_end_config_timer_frec:
	RETURN
; end of _config_timer_frec

_Int_frecuencia1:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_timer_frec.h,28 :: 		void Int_frecuencia1() iv IVT_ADDR_T1INTERRUPT  ics ICS_AUTO
;config_timer_frec.h,31 :: 		pwm_in1=TMR1;
	MOV	TMR1, WREG
	MOV	W0, _pwm_in1
;config_timer_frec.h,32 :: 		TMR1=0;
	CLR	TMR1
;config_timer_frec.h,33 :: 		T1IF_bit=0; // Limpia la bandera
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;config_timer_frec.h,35 :: 		}
L_end_Int_frecuencia1:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Int_frecuencia1

_Int_frecuencia2:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_timer_frec.h,37 :: 		void Int_frecuencia2() iv IVT_ADDR_T2INTERRUPT  ics ICS_AUTO
;config_timer_frec.h,40 :: 		pwm_in2=TMR2;
	MOV	TMR2, WREG
	MOV	W0, _pwm_in2
;config_timer_frec.h,41 :: 		TMR2=0;
	CLR	TMR2
;config_timer_frec.h,42 :: 		T2IF_bit=0; // Limpia la bandera
	BCLR	T2IF_bit, BitPos(T2IF_bit+0)
;config_timer_frec.h,44 :: 		}
L_end_Int_frecuencia2:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Int_frecuencia2

_Int_frecuencia3:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_timer_frec.h,48 :: 		void Int_frecuencia3() iv IVT_ADDR_T3INTERRUPT  ics ICS_AUTO
;config_timer_frec.h,52 :: 		pwm_in3=TMR3;
	MOV	TMR3, WREG
	MOV	W0, _pwm_in3
;config_timer_frec.h,53 :: 		tmr3=0;
	CLR	TMR3
;config_timer_frec.h,54 :: 		T3IF_bit=0; // Limpia la bandera
	BCLR	T3IF_bit, BitPos(T3IF_bit+0)
;config_timer_frec.h,56 :: 		}
L_end_Int_frecuencia3:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Int_frecuencia3

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;dspictimers.c,14 :: 		void main()
;dspictimers.c,23 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;dspictimers.c,24 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;dspictimers.c,25 :: 		PLLFBD=78; // selecciona  M=80;  siempre lo deseado menos 2;
	MOV	#78, W0
	MOV	WREG, PLLFBD
;dspictimers.c,27 :: 		deshabilita();
	CALL	_deshabilita
;dspictimers.c,29 :: 		AD1PCFGL=0xffff;// todo digital
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;dspictimers.c,31 :: 		TRISB=0x0;
	CLR	TRISB
;dspictimers.c,32 :: 		TRISA=0;
	CLR	TRISA
;dspictimers.c,33 :: 		TRISA4_bit=1;// t1ck entrada
	BSET	TRISA4_bit, BitPos(TRISA4_bit+0)
;dspictimers.c,34 :: 		LATB=0;
	CLR	LATB
;dspictimers.c,36 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;dspictimers.c,37 :: 		PPS_Mapping(0,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	CLR	W10
	CALL	_PPS_Mapping
;dspictimers.c,38 :: 		PPS_Mapping(3,_INPUT,_T2CK);
	MOV.B	#2, W12
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping
;dspictimers.c,39 :: 		PPS_Mapping(5,_INPUT,_T3CK);
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_PPS_Mapping
;dspictimers.c,41 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;dspictimers.c,42 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;dspictimers.c,44 :: 		UART1_Write_Text("INCICIANDO\r\n");
	MOV	#lo_addr(?lstr1_dspictimers), W10
	CALL	_UART1_Write_Text
;dspictimers.c,48 :: 		config_timer_frec();
	CALL	_config_timer_frec
;dspictimers.c,50 :: 		habilita();
	CALL	_habilita
;dspictimers.c,51 :: 		while (1)
L_main0:
;dspictimers.c,53 :: 		LATB13_bit=!LATB13_bit;
	BTG	LATB13_bit, BitPos(LATB13_bit+0)
;dspictimers.c,54 :: 		Delay_ms(200);
	MOV	#41, W8
	MOV	#45239, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;dspictimers.c,56 :: 		disparo=0;
	BCLR	LATA1_bit, BitPos(LATA1_bit+0)
;dspictimers.c,57 :: 		Delay_us(10);
	MOV	#133, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	NOP
;dspictimers.c,58 :: 		disparo=1;
	BSET	LATA1_bit, BitPos(LATA1_bit+0)
;dspictimers.c,61 :: 		ancho1=((float)pwm_in1*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
	MOV	_pwm_in1, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17024, W3
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _ancho1
	MOV	W1, _ancho1+2
;dspictimers.c,63 :: 		dis1=ancho1/58e-6;
	MOV	#17671, W2
	MOV	#14451, W3
	CALL	__Div_FP
	MOV	W0, _dis1
	MOV	W1, _dis1+2
;dspictimers.c,65 :: 		ancho2=((float)pwm_in2*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
	MOV	_pwm_in2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17024, W3
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _ancho2
	MOV	W1, _ancho2+2
;dspictimers.c,67 :: 		dis2=ancho2/58e-6;
	MOV	#17671, W2
	MOV	#14451, W3
	CALL	__Div_FP
	MOV	W0, _dis2
	MOV	W1, _dis2+2
;dspictimers.c,69 :: 		ancho3=((float)pwm_in3*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
	MOV	_pwm_in3, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17024, W3
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _ancho3
	MOV	W1, _ancho3+2
;dspictimers.c,71 :: 		dis3=ancho3/58e-6;
	MOV	#17671, W2
	MOV	#14451, W3
	CALL	__Div_FP
	MOV	W0, _dis3
	MOV	W1, _dis3+2
;dspictimers.c,74 :: 		sprintf(texto,"dis1=%.1fcm    dis2=%.1fcm    dis3=%.1fcm\r\n", dis1,dis2,dis3);
	PUSH.D	W0
	PUSH	_dis2
	PUSH	_dis2+2
	PUSH	_dis1
	PUSH	_dis1+2
	MOV	#lo_addr(?lstr_2_dspictimers), W0
	PUSH	W0
	MOV	#lo_addr(_texto), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#16, W15
;dspictimers.c,75 :: 		UART1_Write_Text(texto);
	MOV	#lo_addr(_texto), W10
	CALL	_UART1_Write_Text
;dspictimers.c,78 :: 		}
	GOTO	L_main0
;dspictimers.c,80 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
