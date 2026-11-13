
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;prueba_33fj128gp710.c,1 :: 		void main()
;prueba_33fj128gp710.c,12 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;prueba_33fj128gp710.c,13 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;prueba_33fj128gp710.c,14 :: 		PLLFBD=30; // selecciona  M=80;  siempre lo deseado menos 2;
	MOV	#30, W0
	MOV	WREG, PLLFBD
;prueba_33fj128gp710.c,16 :: 		ADPCFG=0xffff; // todo digital
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;prueba_33fj128gp710.c,17 :: 		AD1PCFGH=0xffff;
	MOV	#65535, W0
	MOV	WREG, AD1PCFGH
;prueba_33fj128gp710.c,18 :: 		AD1PCFGL=0xffff;
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;prueba_33fj128gp710.c,19 :: 		TRISB=0;
	CLR	TRISB
;prueba_33fj128gp710.c,20 :: 		TRISF3_bit=0; //salida tx
	BCLR	TRISF3_bit, BitPos(TRISF3_bit+0)
;prueba_33fj128gp710.c,21 :: 		TRISF2_bit=1;// entrada rx
	BSET	TRISF2_bit, BitPos(TRISF2_bit+0)
;prueba_33fj128gp710.c,23 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;prueba_33fj128gp710.c,28 :: 		while (1)
L_main0:
;prueba_33fj128gp710.c,30 :: 		LATB=~LATB;
	COM	LATB
;prueba_33fj128gp710.c,31 :: 		Delay_ms(200);
	MOV	#41, W8
	MOV	#45239, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;prueba_33fj128gp710.c,32 :: 		UART1_Write_Text("HOLA MUNDO\r\n");
	MOV	#lo_addr(?lstr1_prueba_33fj128gp710), W10
	CALL	_UART1_Write_Text
;prueba_33fj128gp710.c,35 :: 		}
	GOTO	L_main0
;prueba_33fj128gp710.c,40 :: 		}
L_end_main:
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
