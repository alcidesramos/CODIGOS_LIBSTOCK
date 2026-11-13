
_INT1_int:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;longtimr.c,10 :: 		void INT1_int() iv IVT_ADDR_INT1INTERRUPT ics ICS_AUTO
;longtimr.c,12 :: 		switch (esta)
	GOTO	L_INT1_int0
;longtimr.c,14 :: 		case 0:
L_INT1_int2:
;longtimr.c,15 :: 		tmr2=0;
	CLR	TMR2
;longtimr.c,16 :: 		tmr3=0;
	CLR	TMR3
;longtimr.c,17 :: 		T2CONbits.TON=1;//prenDe  el Timer
	BSET	T2CONbits, #15
;longtimr.c,18 :: 		esta=1;
	MOV	#lo_addr(_esta), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;longtimr.c,19 :: 		break;
	GOTO	L_INT1_int1
;longtimr.c,20 :: 		case 1:
L_INT1_int3:
;longtimr.c,22 :: 		T2CONbits.TON=0;
	BCLR	T2CONbits, #15
;longtimr.c,23 :: 		tiem1=TMR2;
	MOV	TMR2, WREG
	CLR	W1
	MOV	W0, _tiem1
	MOV	W1, _tiem1+2
;longtimr.c,24 :: 		tiem2=(unsigned long)TMR3<<(unsigned long)16;
	MOV	TMR3, WREG
	CLR	W1
	MOV	W0, W3
	CLR	W2
	MOV	W2, _tiem2
	MOV	W3, _tiem2+2
;longtimr.c,25 :: 		tiem=tiem1 + tiem2;
	MOV	#lo_addr(_tiem1), W1
	MOV	#lo_addr(_tiem), W0
	ADD	W2, [W1++], [W0++]
	ADDC	W3, [W1--], [W0--]
;longtimr.c,26 :: 		esta=2;
	MOV	#lo_addr(_esta), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;longtimr.c,28 :: 		break;
	GOTO	L_INT1_int1
;longtimr.c,30 :: 		case 2:
L_INT1_int4:
;longtimr.c,31 :: 		tmr2=0;
	CLR	TMR2
;longtimr.c,32 :: 		tmr3=0;
	CLR	TMR3
;longtimr.c,33 :: 		T2CONbits.TON=0;//Apaga  el Timer
	BCLR	T2CONbits, #15
;longtimr.c,34 :: 		break;
	GOTO	L_INT1_int1
;longtimr.c,36 :: 		}
L_INT1_int0:
	MOV	#lo_addr(_esta), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__INT1_int11
	GOTO	L_INT1_int2
L__INT1_int11:
	MOV	#lo_addr(_esta), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__INT1_int12
	GOTO	L_INT1_int3
L__INT1_int12:
	MOV	#lo_addr(_esta), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__INT1_int13
	GOTO	L_INT1_int4
L__INT1_int13:
L_INT1_int1:
;longtimr.c,37 :: 		INT1IF_bit=0;  //limpia la bandera
	BCLR	INT1IF_bit, BitPos(INT1IF_bit+0)
;longtimr.c,38 :: 		}
L_end_INT1_int:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _INT1_int

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;longtimr.c,41 :: 		void main()
;longtimr.c,47 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;longtimr.c,48 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;longtimr.c,49 :: 		PLLFBD=78; // selecciona  M=80;  siempre lo deseado menos 2  crital 4MHz;
	MOV	#78, W0
	MOV	WREG, PLLFBD
;longtimr.c,52 :: 		trisb=0xffff;
	MOV	#65535, W0
	MOV	WREG, TRISB
;longtimr.c,53 :: 		trisa=0xffff;
	MOV	#65535, W0
	MOV	WREG, TRISA
;longtimr.c,57 :: 		AD1PCFGL = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;longtimr.c,60 :: 		TRISB0_bit=0; //led1
	BCLR	TRISB0_bit, BitPos(TRISB0_bit+0)
;longtimr.c,61 :: 		TRISB1_bit=0;  //led2
	BCLR	TRISB1_bit, BitPos(TRISB1_bit+0)
;longtimr.c,63 :: 		CNPU1=0;
	CLR	CNPU1
;longtimr.c,64 :: 		CNPU2=0;
	CLR	CNPU2
;longtimr.c,67 :: 		ppS_Mapping(14, _OUTPUT, _u1tx);  //TX Del Micro
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping
;longtimr.c,68 :: 		PPS_Mapping(15, _INPUT, _U1rX);  //RX el Micro
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#15, W10
	CALL	_PPS_Mapping
;longtimr.c,69 :: 		PPS_Mapping(7,_INPUT,_INT1); ///entrada de velocidad  //rb7 a entra de velocidad
	CLR	W12
	MOV.B	#1, W11
	MOV.B	#7, W10
	CALL	_PPS_Mapping
;longtimr.c,71 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;longtimr.c,75 :: 		INT1EP_bit=0; //interrucion por flanco positivo
	BCLR	INT1EP_bit, BitPos(INT1EP_bit+0)
;longtimr.c,77 :: 		INT1IP_2_bit=1;
	BSET	INT1IP_2_bit, BitPos(INT1IP_2_bit+0)
;longtimr.c,78 :: 		INT1IP_1_bit=1;
	BSET	INT1IP_1_bit, BitPos(INT1IP_1_bit+0)
;longtimr.c,79 :: 		INT1IP_0_bit=0;
	BCLR	INT1IP_0_bit, BitPos(INT1IP_0_bit+0)
;longtimr.c,80 :: 		INT1IF_bit=0;  // Limpia candera flanco
	BCLR	INT1IF_bit, BitPos(INT1IF_bit+0)
;longtimr.c,81 :: 		INT1IE_bit=1; //habilita interrución flanco
	BSET	INT1IE_bit, BitPos(INT1IE_bit+0)
;longtimr.c,84 :: 		tmr3=0;
	CLR	TMR3
;longtimr.c,85 :: 		tmr2=0;
	CLR	TMR2
;longtimr.c,87 :: 		pr2=65535;  //1 segun
	MOV	#65535, W0
	MOV	WREG, PR2
;longtimr.c,88 :: 		pr3=65535;
	MOV	#65535, W0
	MOV	WREG, PR3
;longtimr.c,90 :: 		t2con=0;
	CLR	T2CON
;longtimr.c,92 :: 		T2CONbits.TCKPS=0b11;
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	[W0], W1
	MOV.B	#48, W0
	IOR.B	W1, W0, W1
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	W1, [W0]
;longtimr.c,93 :: 		T2CONbits.T32= 1; //trabaja a 32 bits
	BSET.B	T2CONbits, #3
;longtimr.c,94 :: 		T2CONbits.TON=0;//apaga el Timer
	BCLR	T2CONbits, #15
;longtimr.c,97 :: 		while (1)
L_main5:
;longtimr.c,99 :: 		if (esta==2)
	MOV	#lo_addr(_esta), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__main15
	GOTO	L_main7
L__main15:
;longtimr.c,101 :: 		timems=tiem*256.0*1000.0/40e6 ;  //cilco*preescaldor*velocidad rela micro ;
	MOV	_tiem, W0
	MOV	_tiem+2, W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17280, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Mul_FP
	MOV	#38528, W2
	MOV	#19480, W3
	CALL	__Div_FP
	MOV	W0, _timems
	MOV	W1, _timems+2
;longtimr.c,103 :: 		sprintf(texto,"tiempo=%.1f\r\n",timems);
	PUSH.D	W0
	MOV	#lo_addr(?lstr_1_longtimr), W0
	PUSH	W0
	MOV	#lo_addr(_texto), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;longtimr.c,104 :: 		UART1_Write_Text(texto);
	MOV	#lo_addr(_texto), W10
	CALL	_UART1_Write_Text
;longtimr.c,105 :: 		esta=0;
	MOV	#lo_addr(_esta), W1
	CLR	W0
	MOV.B	W0, [W1]
;longtimr.c,106 :: 		}
L_main7:
;longtimr.c,107 :: 		Delay_ms(500);
	MOV	#102, W8
	MOV	#47563, W7
L_main8:
	DEC	W7
	BRA NZ	L_main8
	DEC	W8
	BRA NZ	L_main8
	NOP
;longtimr.c,108 :: 		led_verde=!led_verde;
	BTG	LATB0_bit, BitPos(LATB0_bit+0)
;longtimr.c,109 :: 		}
	GOTO	L_main5
;longtimr.c,111 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
