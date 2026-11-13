
_servo1:

;buque.c,19 :: 		void servo1(float angulo)
;buque.c,21 :: 		OC1RS=3.4722*angulo + 937.5;
	MOV	#14470, W0
	MOV	#16478, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#24576, W2
	MOV	#17514, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, OC1RS
;buque.c,22 :: 		}
L_end_servo1:
	RETURN
; end of _servo1

_servo2:

;buque.c,25 :: 		void servo2(float angulo)
;buque.c,27 :: 		OC2RS=3.4722*angulo + 937.5;
	MOV	#14470, W0
	MOV	#16478, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#24576, W2
	MOV	#17514, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, OC2RS
;buque.c,28 :: 		}
L_end_servo2:
	RETURN
; end of _servo2

_procesa_rx1:

;buque.c,33 :: 		void procesa_rx1()
;buque.c,36 :: 		strcpy(Captura_rx1, strtok(trama_rx1, "/"));  //inicia captura de tokens desde el /
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr1_buque), W11
	MOV	#lo_addr(_Trama_rx1), W10
	CALL	_strtok
	MOV	W0, W11
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_strcpy
;buque.c,37 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	MOV	#lo_addr(?lstr2_buque), W11
	CLR	W10
	CALL	_strtok
	MOV	W0, W11
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_strcpy
;buque.c,38 :: 		serv1=atof(Captura_rx1);
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_atof
	MOV	W0, _serV1
	MOV	W1, _serV1+2
;buque.c,40 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	MOV	#lo_addr(?lstr3_buque), W11
	CLR	W10
	CALL	_strtok
	MOV	W0, W11
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_strcpy
;buque.c,41 :: 		serv2=atof(Captura_rx1);
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_atof
	MOV	W0, _serV2
	MOV	W1, _serV2+2
;buque.c,43 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	MOV	#lo_addr(?lstr4_buque), W11
	CLR	W10
	CALL	_strtok
	MOV	W0, W11
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_strcpy
;buque.c,44 :: 		led1=atoi(Captura_rx1);
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_atoi
	BTSS	W0, #0
	BCLR	RB0_bit, BitPos(RB0_bit+0)
	BTSC	W0, #0
	BSET	RB0_bit, BitPos(RB0_bit+0)
;buque.c,46 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	MOV	#lo_addr(?lstr5_buque), W11
	CLR	W10
	CALL	_strtok
	MOV	W0, W11
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_strcpy
;buque.c,47 :: 		led2=atoi(Captura_rx1);
	MOV	#lo_addr(_Captura_rx1), W10
	CALL	_atoi
	BTSS	W0, #0
	BCLR	RB1_bit, BitPos(RB1_bit+0)
	BTSC	W0, #0
	BSET	RB1_bit, BitPos(RB1_bit+0)
;buque.c,54 :: 		servo1(serv1);// direccion
	MOV	_serV1, W10
	MOV	_serV1+2, W11
	CALL	_servo1
;buque.c,55 :: 		servo2(serv2*90.0/100.0);
	MOV	_serV2, W0
	MOV	_serV2+2, W1
	MOV	#0, W2
	MOV	#17076, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	MOV.D	W0, W10
	CALL	_servo2
;buque.c,57 :: 		}
L_end_procesa_rx1:
	POP	W11
	POP	W10
	RETURN
; end of _procesa_rx1

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;buque.c,61 :: 		void main()
;buque.c,69 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;buque.c,70 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;buque.c,71 :: 		PLLFBD=41; // selecciona  M=43;  se pone lo deseado menos 2;    CRISTAL INTERNO
	MOV	#41, W0
	MOV	WREG, PLLFBD
;buque.c,75 :: 		AD1PCFGL = 0xFFFF;        //1=digital  0=analogo
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;buque.c,77 :: 		TRISA=0; //todo salida  A
	CLR	TRISA
;buque.c,78 :: 		TRISB=0;  //salida todo B
	CLR	TRISB
;buque.c,79 :: 		TRISB0_bit=0; //salida ld1
	BCLR	TRISB0_bit, BitPos(TRISB0_bit+0)
;buque.c,80 :: 		TRISB1_bit=0;// salidaled2
	BCLR	TRISB1_bit, BitPos(TRISB1_bit+0)
;buque.c,82 :: 		PPS_Mapping(13,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#13, W10
	CALL	_PPS_Mapping
;buque.c,83 :: 		PPS_Mapping(14,_INPUT,_U1RX);
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping
;buque.c,86 :: 		PPS_Mapping(2,_OUTPUT,_OC1);
	MOV.B	#18, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping
;buque.c,87 :: 		PPS_Mapping(3,_OUTPUT,_OC2);
	MOV.B	#19, W12
	CLR	W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping
;buque.c,89 :: 		pwm_init_basico();
	CALL	_pwm_init_basico
;buque.c,90 :: 		config_uart1_trama(9600);
	MOV	#9600, W10
	CALL	_config_uart1_trama
;buque.c,91 :: 		UART1_Write_Text("AJA");
	MOV	#lo_addr(?lstr6_buque), W10
	CALL	_UART1_Write_Text
;buque.c,92 :: 		habilita();   //habuilita interrucipnes
	CALL	_habilita
;buque.c,93 :: 		while(1)
L_main0:
;buque.c,96 :: 		if (flag_rx1==1)
	MOV	#lo_addr(_flag_rx1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__main7
	GOTO	L_main2
L__main7:
;buque.c,99 :: 		procesa_rx1();
	CALL	_procesa_rx1
;buque.c,100 :: 		flag_rx1=0;
	MOV	#lo_addr(_flag_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
;buque.c,101 :: 		memset(Trama_rx1,0,50);// limpia la trama
	MOV	#50, W12
	CLR	W11
	MOV	#lo_addr(_Trama_rx1), W10
	CALL	_memset
;buque.c,102 :: 		U1STAbits.OERR=0; //LIMPIA  errores
	BCLR.B	U1STAbits, #1
;buque.c,104 :: 		U1RXIF_bit=0;
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;buque.c,105 :: 		U1RXIE_bit=1;
	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
;buque.c,108 :: 		}
L_main2:
;buque.c,112 :: 		}
	GOTO	L_main0
;buque.c,115 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
