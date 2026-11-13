
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;prueba.c,1 :: 		void main()
;prueba.c,11 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;prueba.c,12 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;prueba.c,13 :: 		PLLFBD=38; // selecciona  M=80;  siempre lo deseado menos 2;
	MOV	#38, W0
	MOV	WREG, PLLFBD
;prueba.c,17 :: 		AD1PCFGL = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;prueba.c,20 :: 		TRISB=0x0;
	CLR	TRISB
;prueba.c,21 :: 		latb=0;
	CLR	LATB
;prueba.c,22 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;prueba.c,23 :: 		PPS_Mapping(14,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping
;prueba.c,25 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;prueba.c,27 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;prueba.c,30 :: 		while (1)
L_main0:
;prueba.c,32 :: 		LATB0_bit=~LATB0_bit;
	BTG	LATB0_bit, BitPos(LATB0_bit+0)
;prueba.c,33 :: 		Delay_ms(200);
	MOV	#41, W8
	MOV	#45239, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;prueba.c,35 :: 		UART1_Write_Text("HOLA MUNDO\r\n");
	MOV	#lo_addr(?lstr1_prueba), W10
	CALL	_UART1_Write_Text
;prueba.c,37 :: 		}
	GOTO	L_main0
;prueba.c,40 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
