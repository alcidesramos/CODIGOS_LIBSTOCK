
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;prueba_33ep512mu810.c,2 :: 		void main()
;prueba_33ep512mu810.c,9 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;prueba_33ep512mu810.c,10 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;prueba_33ep512mu810.c,11 :: 		PLLFBD=68; // selecciona  M=68;  siempre lo deseado menos 2;  CRISTAL EXTERNO     8Mhz
	MOV	#68, W0
	MOV	WREG, PLLFBD
;prueba_33ep512mu810.c,14 :: 		ANSELA = 0x00;
	CLR	ANSELA
;prueba_33ep512mu810.c,15 :: 		ANSELB = 0x00;
	CLR	ANSELB
;prueba_33ep512mu810.c,16 :: 		ANSELC = 0x00;
	CLR	ANSELC
;prueba_33ep512mu810.c,17 :: 		ANSELD = 0x00;
	CLR	ANSELD
;prueba_33ep512mu810.c,18 :: 		ANSELE = 0x00;
	CLR	ANSELE
;prueba_33ep512mu810.c,19 :: 		ANSELG = 0x00;
	CLR	ANSELG
;prueba_33ep512mu810.c,20 :: 		TRISB=0; //TODO SALIDA
	CLR	TRISB
;prueba_33ep512mu810.c,22 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;prueba_33ep512mu810.c,24 :: 		PPS_Mapping_NoLock(101, _OUTPUT, _U1TX);     //RP101   RF5 ES TX
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping_NoLock
;prueba_33ep512mu810.c,27 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;prueba_33ep512mu810.c,28 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;prueba_33ep512mu810.c,30 :: 		LATB=0;
	CLR	LATB
;prueba_33ep512mu810.c,32 :: 		while (1)
L_main0:
;prueba_33ep512mu810.c,34 :: 		LATB=~LATB;
	COM	LATB
;prueba_33ep512mu810.c,35 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;prueba_33ep512mu810.c,36 :: 		UART1_Write_Text("HOLA MUNDO\r\n");
	MOV	#lo_addr(?lstr1_prueba_33ep512mu810), W10
	CALL	_UART1_Write_Text
;prueba_33ep512mu810.c,39 :: 		}
	GOTO	L_main0
;prueba_33ep512mu810.c,43 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
