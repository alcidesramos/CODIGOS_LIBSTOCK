
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;proteus.c,1 :: 		void main()
;proteus.c,10 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;proteus.c,11 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;proteus.c,12 :: 		PLLFBD=78; // selecciona  M=80;  siempre lo deseado menos 2;
	MOV	#78, W0
	MOV	WREG, PLLFBD
;proteus.c,15 :: 		AD1PCFGL=0xffff;// todo digital
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;proteus.c,17 :: 		TRISB=0x0;
	CLR	TRISB
;proteus.c,18 :: 		latb=0;
	CLR	LATB
;proteus.c,19 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;proteus.c,20 :: 		PPS_Mapping(12,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#12, W10
	CALL	_PPS_Mapping
;proteus.c,22 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;proteus.c,24 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;proteus.c,26 :: 		while (1)
L_main0:
;proteus.c,28 :: 		LATB0_bit=~LATB0_bit;
	BTG	LATB0_bit, BitPos(LATB0_bit+0)
;proteus.c,29 :: 		Delay_ms(200);
	MOV	#41, W8
	MOV	#45239, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;proteus.c,31 :: 		UART1_Write_Text("HOLA MUNDO\r\n");
	MOV	#lo_addr(?lstr1_proteus), W10
	CALL	_UART1_Write_Text
;proteus.c,34 :: 		}
	GOTO	L_main0
;proteus.c,36 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
