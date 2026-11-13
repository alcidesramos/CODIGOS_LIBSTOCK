
_config_uart1_trama:

;CONFIG_UART_RX1.c,17 :: 		void config_uart1_trama(unsigned int baudios)
;CONFIG_UART_RX1.c,19 :: 		UART1_Init(baudios);
	CLR	W11
	CALL	_UART1_Init
;CONFIG_UART_RX1.c,21 :: 		U1RXIP_2_bit=1;
	BSET	U1RXIP_2_bit, BitPos(U1RXIP_2_bit+0)
;CONFIG_UART_RX1.c,22 :: 		U1RXIP_1_bit=1;
	BSET	U1RXIP_1_bit, BitPos(U1RXIP_1_bit+0)
;CONFIG_UART_RX1.c,23 :: 		U1RXIP_0_bit=0;
	BCLR	U1RXIP_0_bit, BitPos(U1RXIP_0_bit+0)
;CONFIG_UART_RX1.c,26 :: 		u1sta.b7=0;
	BCLR.B	U1STA, #7
;CONFIG_UART_RX1.c,27 :: 		u1sta.b6=0;
	BCLR.B	U1STA, #6
;CONFIG_UART_RX1.c,29 :: 		U1STA.b1=0;
	BCLR.B	U1STA, #1
;CONFIG_UART_RX1.c,30 :: 		U1rXIF_bit=0;
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;CONFIG_UART_RX1.c,32 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,33 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,34 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,35 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,36 :: 		U1RXIF_bit=0;//limpia bandera
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;CONFIG_UART_RX1.c,37 :: 		U1RXIE_bit=1; //habilita interrupcion
	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
;CONFIG_UART_RX1.c,39 :: 		}
L_end_config_uart1_trama:
	RETURN
; end of _config_uart1_trama

_INT_TRAMA_RX1:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;CONFIG_UART_RX1.c,41 :: 		void INT_TRAMA_RX1() org IVT_ADDR_U1RXINTERRUPT
;CONFIG_UART_RX1.c,43 :: 		dato1_in=U1RXREG;
	MOV	#lo_addr(_dato1_in), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,45 :: 		switch (recibidos_estado1)
	GOTO	L_INT_TRAMA_RX10
;CONFIG_UART_RX1.c,47 :: 		case inicio1:
L_INT_TRAMA_RX12:
;CONFIG_UART_RX1.c,49 :: 		if (dato1_in!='I') puntero_rx1=0;
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA NZ	L__INT_TRAMA_RX117
	GOTO	L_INT_TRAMA_RX13
L__INT_TRAMA_RX117:
	MOV	#lo_addr(_puntero_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_INT_TRAMA_RX14
L_INT_TRAMA_RX13:
;CONFIG_UART_RX1.c,52 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOV	#lo_addr(_puntero_rx1), W0
	ZE	[W0], W1
	MOV	#lo_addr(_Trama_rx1), W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], [W1]
;CONFIG_UART_RX1.c,53 :: 		puntero_rx1++;
	MOV.B	#1, W1
	MOV	#lo_addr(_puntero_rx1), W0
	ADD.B	W1, [W0], [W0]
;CONFIG_UART_RX1.c,54 :: 		recibidos_estado1=inicio2;
	MOV	#lo_addr(_recibidos_estado1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,55 :: 		} //if
L_INT_TRAMA_RX14:
;CONFIG_UART_RX1.c,57 :: 		break;
	GOTO	L_INT_TRAMA_RX11
;CONFIG_UART_RX1.c,58 :: 		case inicio2:
L_INT_TRAMA_RX15:
;CONFIG_UART_RX1.c,60 :: 		if (dato1_in!='N')
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA NZ	L__INT_TRAMA_RX118
	GOTO	L_INT_TRAMA_RX16
L__INT_TRAMA_RX118:
;CONFIG_UART_RX1.c,61 :: 		{ puntero_rx1=0;
	MOV	#lo_addr(_puntero_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,62 :: 		recibidos_estado1=inicio1;
	MOV	#lo_addr(_recibidos_estado1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,63 :: 		}
	GOTO	L_INT_TRAMA_RX17
L_INT_TRAMA_RX16:
;CONFIG_UART_RX1.c,66 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOV	#lo_addr(_puntero_rx1), W0
	ZE	[W0], W1
	MOV	#lo_addr(_Trama_rx1), W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], [W1]
;CONFIG_UART_RX1.c,67 :: 		puntero_rx1++;
	MOV.B	#1, W1
	MOV	#lo_addr(_puntero_rx1), W0
	ADD.B	W1, [W0], [W0]
;CONFIG_UART_RX1.c,68 :: 		recibidos_estado1=inicio3;
	MOV	#lo_addr(_recibidos_estado1), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,69 :: 		} //if
L_INT_TRAMA_RX17:
;CONFIG_UART_RX1.c,71 :: 		break;
	GOTO	L_INT_TRAMA_RX11
;CONFIG_UART_RX1.c,73 :: 		case inicio3:
L_INT_TRAMA_RX18:
;CONFIG_UART_RX1.c,75 :: 		if (dato1_in!='I')
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA NZ	L__INT_TRAMA_RX119
	GOTO	L_INT_TRAMA_RX19
L__INT_TRAMA_RX119:
;CONFIG_UART_RX1.c,77 :: 		puntero_rx1=0;
	MOV	#lo_addr(_puntero_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,78 :: 		recibidos_estado1=inicio1;
	MOV	#lo_addr(_recibidos_estado1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,79 :: 		}
	GOTO	L_INT_TRAMA_RX110
L_INT_TRAMA_RX19:
;CONFIG_UART_RX1.c,82 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOV	#lo_addr(_puntero_rx1), W0
	ZE	[W0], W1
	MOV	#lo_addr(_Trama_rx1), W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], [W1]
;CONFIG_UART_RX1.c,83 :: 		puntero_rx1++;
	MOV.B	#1, W1
	MOV	#lo_addr(_puntero_rx1), W0
	ADD.B	W1, [W0], [W0]
;CONFIG_UART_RX1.c,84 :: 		recibidos_estado1=fin1;
	MOV	#lo_addr(_recibidos_estado1), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,86 :: 		} //if
L_INT_TRAMA_RX110:
;CONFIG_UART_RX1.c,88 :: 		break;
	GOTO	L_INT_TRAMA_RX11
;CONFIG_UART_RX1.c,91 :: 		case fin1:
L_INT_TRAMA_RX111:
;CONFIG_UART_RX1.c,93 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOV	#lo_addr(_puntero_rx1), W0
	ZE	[W0], W1
	MOV	#lo_addr(_Trama_rx1), W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], [W1]
;CONFIG_UART_RX1.c,94 :: 		puntero_rx1++;
	MOV.B	#1, W1
	MOV	#lo_addr(_puntero_rx1), W0
	ADD.B	W1, [W0], [W0]
;CONFIG_UART_RX1.c,95 :: 		if (dato1_in=='*')
	MOV	#lo_addr(_dato1_in), W0
	MOV.B	[W0], W1
	MOV.B	#42, W0
	CP.B	W1, W0
	BRA Z	L__INT_TRAMA_RX120
	GOTO	L_INT_TRAMA_RX112
L__INT_TRAMA_RX120:
;CONFIG_UART_RX1.c,98 :: 		recibidos_estado1=0;
	MOV	#lo_addr(_recibidos_estado1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,99 :: 		puntero_rx1=0;
	MOV	#lo_addr(_puntero_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,100 :: 		flag_rx1=1;  ///habilita la bandera para decir que tiene una trama completa
	MOV	#lo_addr(_flag_rx1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,101 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,102 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,103 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,104 :: 		rx1_dat=U1RXREG;
	MOV	#lo_addr(_rx1_dat), W1
	MOV.B	U1RXREG, WREG
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,105 :: 		U1STAbits.OERR=0; //LIMPIA BUFFER
	BCLR.B	U1STAbits, #1
;CONFIG_UART_RX1.c,106 :: 		U1RXIF_bit=0;
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;CONFIG_UART_RX1.c,107 :: 		U1RXIE_bit=0;
	BCLR	U1RXIE_bit, BitPos(U1RXIE_bit+0)
;CONFIG_UART_RX1.c,109 :: 		}
	GOTO	L_INT_TRAMA_RX113
L_INT_TRAMA_RX112:
;CONFIG_UART_RX1.c,110 :: 		else if (puntero_rx1>max_datos)
	MOV	#lo_addr(_puntero_rx1), W0
	MOV.B	[W0], W1
	MOV.B	#50, W0
	CP.B	W1, W0
	BRA GTU	L__INT_TRAMA_RX121
	GOTO	L_INT_TRAMA_RX114
L__INT_TRAMA_RX121:
;CONFIG_UART_RX1.c,112 :: 		puntero_rx1=0;
	MOV	#lo_addr(_puntero_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,113 :: 		recibidos_estado1=0;
	MOV	#lo_addr(_recibidos_estado1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,114 :: 		puntero_rx1=0;
	MOV	#lo_addr(_puntero_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,115 :: 		flag_rx1=0;
	MOV	#lo_addr(_flag_rx1), W1
	CLR	W0
	MOV.B	W0, [W1]
;CONFIG_UART_RX1.c,117 :: 		}
L_INT_TRAMA_RX114:
L_INT_TRAMA_RX113:
;CONFIG_UART_RX1.c,120 :: 		break;
	GOTO	L_INT_TRAMA_RX11
;CONFIG_UART_RX1.c,123 :: 		}// case recibidos_
L_INT_TRAMA_RX10:
	MOV	#lo_addr(_recibidos_estado1), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__INT_TRAMA_RX122
	GOTO	L_INT_TRAMA_RX12
L__INT_TRAMA_RX122:
	MOV	#lo_addr(_recibidos_estado1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__INT_TRAMA_RX123
	GOTO	L_INT_TRAMA_RX15
L__INT_TRAMA_RX123:
	MOV	#lo_addr(_recibidos_estado1), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__INT_TRAMA_RX124
	GOTO	L_INT_TRAMA_RX18
L__INT_TRAMA_RX124:
	MOV	#lo_addr(_recibidos_estado1), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__INT_TRAMA_RX125
	GOTO	L_INT_TRAMA_RX111
L__INT_TRAMA_RX125:
L_INT_TRAMA_RX11:
;CONFIG_UART_RX1.c,125 :: 		U1RXIF_bit=0;
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;CONFIG_UART_RX1.c,127 :: 		}
L_end_INT_TRAMA_RX1:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _INT_TRAMA_RX1
