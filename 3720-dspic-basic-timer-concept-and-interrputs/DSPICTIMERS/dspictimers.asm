
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

_confi_timer_1:

;config_timers.h,7 :: 		void confi_timer_1()
;config_timers.h,11 :: 		tmr1=0;
	CLR	TMR1
;config_timers.h,12 :: 		pr1=31250;
	MOV	#31250, W0
	MOV	WREG, PR1
;config_timers.h,13 :: 		t1con=0;
	CLR	T1CON
;config_timers.h,15 :: 		T1CONbits.TCKPS1=1;
	BSET.B	T1CONbits, #5
;config_timers.h,16 :: 		T1CONbits.TCKPS0=1;
	BSET.B	T1CONbits, #4
;config_timers.h,19 :: 		T1IP_2_bit=0;
	BCLR	T1IP_2_bit, BitPos(T1IP_2_bit+0)
;config_timers.h,20 :: 		T1IP_1_bit=0;
	BCLR	T1IP_1_bit, BitPos(T1IP_1_bit+0)
;config_timers.h,21 :: 		T1IP_0_bit=1;
	BSET	T1IP_0_bit, BitPos(T1IP_0_bit+0)
;config_timers.h,23 :: 		T1IF_bit = 0;     //limpia la bandera
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;config_timers.h,24 :: 		T1IE_bit = 1;    //habilta el timer
	BSET	T1IE_bit, BitPos(T1IE_bit+0)
;config_timers.h,25 :: 		T1CONbits.TON=1;//prende el Timer
	BSET	T1CONbits, #15
;config_timers.h,26 :: 		}
L_end_confi_timer_1:
	RETURN
; end of _confi_timer_1

_confi_timer_32:

;config_timers.h,29 :: 		void confi_timer_32()
;config_timers.h,32 :: 		tmr3=0;
	CLR	TMR3
;config_timers.h,33 :: 		tmr2=0;
	CLR	TMR2
;config_timers.h,35 :: 		pr3=2441;
	MOV	#2441, W0
	MOV	WREG, PR3
;config_timers.h,36 :: 		pr2=26624;
	MOV	#26624, W0
	MOV	WREG, PR2
;config_timers.h,38 :: 		t2con=0;
	CLR	T2CON
;config_timers.h,41 :: 		T2CONbits.TCKPS1=0;
	BCLR.B	T2CONbits, #5
;config_timers.h,42 :: 		T2CONbits.TCKPS0=0;
	BCLR.B	T2CONbits, #4
;config_timers.h,47 :: 		T3IP_2_bit=0;
	BCLR	T3IP_2_bit, BitPos(T3IP_2_bit+0)
;config_timers.h,48 :: 		T3IP_1_bit=1;
	BSET	T3IP_1_bit, BitPos(T3IP_1_bit+0)
;config_timers.h,49 :: 		T3IP_0_bit=0;
	BCLR	T3IP_0_bit, BitPos(T3IP_0_bit+0)
;config_timers.h,51 :: 		T3IF_bit = 0;     //limpia la bandera
	BCLR	T3IF_bit, BitPos(T3IF_bit+0)
;config_timers.h,52 :: 		T3IE_bit = 1;    //habilta el timer
	BSET	T3IE_bit, BitPos(T3IE_bit+0)
;config_timers.h,55 :: 		T2CONbits.T32= 1; //trabaja a 32 bits
	BSET.B	T2CONbits, #3
;config_timers.h,56 :: 		T2CONbits.TON=1;//prende el Timer
	BSET	T2CONbits, #15
;config_timers.h,57 :: 		}
L_end_confi_timer_32:
	RETURN
; end of _confi_timer_32

_timer1:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_timers.h,61 :: 		void timer1() iv IVT_ADDR_T1INTERRUPT ics ICS_AUTO
;config_timers.h,64 :: 		tmr1=0;
	CLR	TMR1
;config_timers.h,66 :: 		led1=!led1;
	BTG	LATB14_bit, BitPos(LATB14_bit+0)
;config_timers.h,70 :: 		T1IF_bit=0; // limpia bandera inetrrupcion
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;config_timers.h,71 :: 		}
L_end_timer1:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer1

_timer32_int:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_timers.h,75 :: 		void timer32_int() iv IVT_ADDR_T3INTERRUPT ics ICS_AUTO
;config_timers.h,77 :: 		tmr2=0;
	CLR	TMR2
;config_timers.h,78 :: 		tmr3=0;
	CLR	TMR3
;config_timers.h,81 :: 		led2=!led2;
	BTG	LATB15_bit, BitPos(LATB15_bit+0)
;config_timers.h,84 :: 		T3IF_bit=0;
	BCLR	T3IF_bit, BitPos(T3IF_bit+0)
;config_timers.h,85 :: 		}
L_end_timer32_int:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer32_int

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;dspictimers.c,7 :: 		void main()
;dspictimers.c,16 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;dspictimers.c,17 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;dspictimers.c,18 :: 		PLLFBD=78; // selecciona  M=80;  siempre lo deseado menos 2;
	MOV	#78, W0
	MOV	WREG, PLLFBD
;dspictimers.c,20 :: 		deshabilita();
	CALL	_deshabilita
;dspictimers.c,22 :: 		AD1PCFGL=0xffff;// todo digital
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;dspictimers.c,24 :: 		TRISB=0x0;
	CLR	TRISB
;dspictimers.c,25 :: 		LATB=0;
	CLR	LATB
;dspictimers.c,27 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;dspictimers.c,28 :: 		PPS_Mapping(0,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	CLR	W10
	CALL	_PPS_Mapping
;dspictimers.c,30 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;dspictimers.c,31 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;dspictimers.c,33 :: 		UART1_Write_Text("INCICIANDO\r\n");
	MOV	#lo_addr(?lstr1_dspictimers), W10
	CALL	_UART1_Write_Text
;dspictimers.c,35 :: 		confi_timer_1();
	CALL	_confi_timer_1
;dspictimers.c,36 :: 		confi_timer_32();
	CALL	_confi_timer_32
;dspictimers.c,38 :: 		habilita();
	CALL	_habilita
;dspictimers.c,39 :: 		while (1)
L_main0:
;dspictimers.c,41 :: 		LATB13_bit=!LATB13_bit;
	BTG	LATB13_bit, BitPos(LATB13_bit+0)
;dspictimers.c,42 :: 		Delay_ms(200);
	MOV	#41, W8
	MOV	#45239, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;dspictimers.c,43 :: 		UART1_Write_Text("Procesando\r\n");
	MOV	#lo_addr(?lstr2_dspictimers), W10
	CALL	_UART1_Write_Text
;dspictimers.c,46 :: 		}
	GOTO	L_main0
;dspictimers.c,48 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
