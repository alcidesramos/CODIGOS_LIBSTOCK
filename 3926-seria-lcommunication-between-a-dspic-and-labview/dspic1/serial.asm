
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;serial.c,7 :: 		void main()
;serial.c,10 :: 		AD1PCFGL = 0xFFFF;        //1=digital  0=analogo
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;serial.c,11 :: 		AD1PCFGLbits.PCFG0=0;// an0 es analogo
	BCLR.B	AD1PCFGLbits, #0
;serial.c,13 :: 		TRISA=0; //todo salida  A
	CLR	TRISA
;serial.c,14 :: 		TRISB=0;  //salida todo B
	CLR	TRISB
;serial.c,15 :: 		TRISB0_bit=1; //ENTRADA PULSADOR1
	BSET	TRISB0_bit, BitPos(TRISB0_bit+0)
;serial.c,16 :: 		TRISB1_bit=1; //ENTRADA
	BSET	TRISB1_bit, BitPos(TRISB1_bit+0)
;serial.c,17 :: 		TRISA0_bit=1; //entrada analoga
	BSET	TRISA0_bit, BitPos(TRISA0_bit+0)
;serial.c,19 :: 		PPS_Mapping(13,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#13, W10
	CALL	_PPS_Mapping
;serial.c,20 :: 		UART1_Init(9600); //puerto serial a 9600 baudios
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;serial.c,22 :: 		ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_REF);  //ADC A 12BITS
	CLR	W11
	MOV	#1, W10
	CALL	_ADC1_Init_Advanced
;serial.c,25 :: 		UART1_Write_Text("TEM=22.5/");
	MOV	#lo_addr(?lstr1_serial), W10
	CALL	_UART1_Write_Text
;serial.c,27 :: 		while(1)
L_main0:
;serial.c,30 :: 		if (sw1==0)  UART1_Write_Text("LED1=ON/");
	BTSC	RB0_bit, BitPos(RB0_bit+0)
	GOTO	L_main2
	MOV	#lo_addr(?lstr2_serial), W10
	CALL	_UART1_Write_Text
	GOTO	L_main3
L_main2:
;serial.c,31 :: 		else    UART1_Write_Text("LED1=OFF/");
	MOV	#lo_addr(?lstr3_serial), W10
	CALL	_UART1_Write_Text
L_main3:
;serial.c,33 :: 		if (sw2==0)  UART1_Write_Text("LED2=ON/");
	BTSC	RB1_bit, BitPos(RB1_bit+0)
	GOTO	L_main4
	MOV	#lo_addr(?lstr4_serial), W10
	CALL	_UART1_Write_Text
	GOTO	L_main5
L_main4:
;serial.c,34 :: 		else    UART1_Write_Text("LED2=OFF/");
	MOV	#lo_addr(?lstr5_serial), W10
	CALL	_UART1_Write_Text
L_main5:
;serial.c,36 :: 		codigo=ADC1_Get_Sample(0);
	CLR	W10
	CALL	_ADC1_Get_Sample
	MOV	W0, _codigo
;serial.c,37 :: 		velocidad=codigo*200.0/4095.0;
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17224, W3
	CALL	__Mul_FP
	MOV	#61440, W2
	MOV	#17791, W3
	CALL	__Div_FP
	MOV	W0, _velocidad
	MOV	W1, _velocidad+2
;serial.c,40 :: 		sprintf( texto,"VEL=%.1f/" ,velocidad);
	PUSH.D	W0
	MOV	#lo_addr(?lstr_6_serial), W0
	PUSH	W0
	MOV	#lo_addr(_texto), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;serial.c,41 :: 		UART1_Write_Text(texto);
	MOV	#lo_addr(_texto), W10
	CALL	_UART1_Write_Text
;serial.c,44 :: 		LATB=~LATB; // porque se usa puerto como salida
	COM	LATB
;serial.c,45 :: 		Delay_ms(300);
	MOV	#4, W8
	MOV	#3392, W7
L_main6:
	DEC	W7
	BRA NZ	L_main6
	DEC	W8
	BRA NZ	L_main6
;serial.c,47 :: 		}
	GOTO	L_main0
;serial.c,51 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
