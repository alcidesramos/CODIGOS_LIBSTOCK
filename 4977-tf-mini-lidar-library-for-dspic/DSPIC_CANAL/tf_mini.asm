
_tf_mini_config:

;tf_mini.c,18 :: 		void tf_mini_config()
;tf_mini.c,20 :: 		UART1_Init(115200);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#49664, W10
	MOV	#1, W11
	CALL	_UART1_Init
;tf_mini.c,21 :: 		memset(trama_rx_lidar,0,20);// limpia la trama
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_trama_rx_lidar), W10
	CALL	_memset
;tf_mini.c,22 :: 		}
L_end_tf_mini_config:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _tf_mini_config

_tf_mini_out_hex:

;tf_mini.c,25 :: 		void tf_mini_out_hex()
;tf_mini.c,27 :: 		UART1_Write(0x42);
	PUSH	W10
	MOV	#66, W10
	CALL	_UART1_Write
;tf_mini.c,28 :: 		UART1_Write(0x57);
	MOV	#87, W10
	CALL	_UART1_Write
;tf_mini.c,29 :: 		UART1_Write(0x02);
	MOV	#2, W10
	CALL	_UART1_Write
;tf_mini.c,30 :: 		UART1_Write(0x00);
	CLR	W10
	CALL	_UART1_Write
;tf_mini.c,31 :: 		UART1_Write(0x00);
	CLR	W10
	CALL	_UART1_Write
;tf_mini.c,32 :: 		UART1_Write(0x00);
	CLR	W10
	CALL	_UART1_Write
;tf_mini.c,33 :: 		UART1_Write(0x01);
	MOV	#1, W10
	CALL	_UART1_Write
;tf_mini.c,34 :: 		UART1_Write(0x06);
	MOV	#6, W10
	CALL	_UART1_Write
;tf_mini.c,36 :: 		}
L_end_tf_mini_out_hex:
	POP	W10
	RETURN
; end of _tf_mini_out_hex

_tf_mini_out_str:

;tf_mini.c,39 :: 		void tf_mini_out_str()
;tf_mini.c,41 :: 		UART1_Write(0x42);
	PUSH	W10
	MOV	#66, W10
	CALL	_UART1_Write
;tf_mini.c,42 :: 		UART1_Write(0x57);
	MOV	#87, W10
	CALL	_UART1_Write
;tf_mini.c,43 :: 		UART1_Write(0x02);
	MOV	#2, W10
	CALL	_UART1_Write
;tf_mini.c,44 :: 		UART1_Write(0x00);
	CLR	W10
	CALL	_UART1_Write
;tf_mini.c,45 :: 		UART1_Write(0x00);
	CLR	W10
	CALL	_UART1_Write
;tf_mini.c,46 :: 		UART1_Write(0x00);
	CLR	W10
	CALL	_UART1_Write
;tf_mini.c,47 :: 		UART1_Write(0x04);
	MOV	#4, W10
	CALL	_UART1_Write
;tf_mini.c,48 :: 		UART1_Write(0x06);
	MOV	#6, W10
	CALL	_UART1_Write
;tf_mini.c,50 :: 		}
L_end_tf_mini_out_str:
	POP	W10
	RETURN
; end of _tf_mini_out_str

_tf_mini_interrupcion_hex:

;tf_mini.c,53 :: 		void tf_mini_interrupcion_hex()
;tf_mini.c,57 :: 		dat_rx=u1rxreg;// recibe dato actual
; dat_rx start address is: 4 (W2)
	MOV	U1RXREG, W2
;tf_mini.c,60 :: 		switch (tf_estado)
	GOTO	L_tf_mini_interrupcion_hex0
;tf_mini.c,62 :: 		case tf_cabe:
L_tf_mini_interrupcion_hex2:
;tf_mini.c,63 :: 		if (dat_rx==0x59) tf_estado=tf_cabe1;  //pasa al estado de segunda cabecera
	MOV.B	#89, W0
	CP.B	W2, W0
	BRA Z	L__tf_mini_interrupcion_hex21
	GOTO	L_tf_mini_interrupcion_hex3
L__tf_mini_interrupcion_hex21:
; dat_rx end address is: 4 (W2)
	MOV	#lo_addr(_tf_estado), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L_tf_mini_interrupcion_hex3:
;tf_mini.c,64 :: 		break;
	GOTO	L_tf_mini_interrupcion_hex1
;tf_mini.c,66 :: 		case tf_cabe1:
L_tf_mini_interrupcion_hex4:
;tf_mini.c,67 :: 		if (dat_rx==0x59) tf_estado=tf_datos;      //pasa al estado datos
; dat_rx start address is: 4 (W2)
	MOV.B	#89, W0
	CP.B	W2, W0
	BRA Z	L__tf_mini_interrupcion_hex22
	GOTO	L_tf_mini_interrupcion_hex5
L__tf_mini_interrupcion_hex22:
; dat_rx end address is: 4 (W2)
	MOV	#lo_addr(_tf_estado), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	GOTO	L_tf_mini_interrupcion_hex6
L_tf_mini_interrupcion_hex5:
;tf_mini.c,68 :: 		else   tf_estado=tf_cabe;   //regresa al estado inicial
	MOV	#lo_addr(_tf_estado), W1
	CLR	W0
	MOV.B	W0, [W1]
L_tf_mini_interrupcion_hex6:
;tf_mini.c,69 :: 		break;
	GOTO	L_tf_mini_interrupcion_hex1
;tf_mini.c,71 :: 		case tf_datos:
L_tf_mini_interrupcion_hex7:
;tf_mini.c,73 :: 		trama_rx_lidar[trama_rx_lidar_cont]=dat_rx;
; dat_rx start address is: 4 (W2)
	MOV	#lo_addr(_trama_rx_lidar_cont), W0
	ZE	[W0], W1
	MOV	#lo_addr(_trama_rx_lidar), W0
	ADD	W0, W1, W0
	MOV.B	W2, [W0]
; dat_rx end address is: 4 (W2)
;tf_mini.c,74 :: 		trama_rx_lidar_cont++;
	MOV.B	#1, W1
	MOV	#lo_addr(_trama_rx_lidar_cont), W0
	ADD.B	W1, [W0], [W0]
;tf_mini.c,75 :: 		if (trama_rx_lidar_cont>7)      //si captura los datos completos
	MOV	#lo_addr(_trama_rx_lidar_cont), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA GTU	L__tf_mini_interrupcion_hex23
	GOTO	L_tf_mini_interrupcion_hex8
L__tf_mini_interrupcion_hex23:
;tf_mini.c,77 :: 		tf_estado=tf_cabe;
	MOV	#lo_addr(_tf_estado), W1
	CLR	W0
	MOV.B	W0, [W1]
;tf_mini.c,78 :: 		trama_rx_lidar_cont=0;
	MOV	#lo_addr(_trama_rx_lidar_cont), W1
	CLR	W0
	MOV.B	W0, [W1]
;tf_mini.c,79 :: 		U1RXIE_bit=0;//deshabilita la interrupcion, para que se procese la info
	BCLR	U1RXIE_bit, BitPos(U1RXIE_bit+0)
;tf_mini.c,80 :: 		flag_rx_lidar=1;//activa la bandera de datos listo
	MOV	#lo_addr(_flag_rx_lidar), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;tf_mini.c,81 :: 		}
L_tf_mini_interrupcion_hex8:
;tf_mini.c,83 :: 		break;
	GOTO	L_tf_mini_interrupcion_hex1
;tf_mini.c,86 :: 		}
L_tf_mini_interrupcion_hex0:
; dat_rx start address is: 4 (W2)
	MOV	#lo_addr(_tf_estado), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__tf_mini_interrupcion_hex24
	GOTO	L_tf_mini_interrupcion_hex2
L__tf_mini_interrupcion_hex24:
	MOV	#lo_addr(_tf_estado), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__tf_mini_interrupcion_hex25
	GOTO	L_tf_mini_interrupcion_hex4
L__tf_mini_interrupcion_hex25:
	MOV	#lo_addr(_tf_estado), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__tf_mini_interrupcion_hex26
	GOTO	L_tf_mini_interrupcion_hex7
L__tf_mini_interrupcion_hex26:
; dat_rx end address is: 4 (W2)
L_tf_mini_interrupcion_hex1:
;tf_mini.c,89 :: 		U1RXIF_bit=0;//limpia bandera de recepcion`
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;tf_mini.c,92 :: 		}
L_end_tf_mini_interrupcion_hex:
	RETURN
; end of _tf_mini_interrupcion_hex

_tf_mini_interrupcion_str:

;tf_mini.c,94 :: 		void tf_mini_interrupcion_str()
;tf_mini.c,97 :: 		dat_rx=u1rxreg;// recibe dato actual
; dat_rx start address is: 4 (W2)
	MOV	U1RXREG, W2
;tf_mini.c,100 :: 		switch (tf_estado)
	GOTO	L_tf_mini_interrupcion_str9
;tf_mini.c,102 :: 		case tf_cabe:
L_tf_mini_interrupcion_str11:
;tf_mini.c,103 :: 		if (dat_rx=='\n') tf_estado=tf_cabe1;  //pasa al estado de segunda cabecera
	CP.B	W2, #10
	BRA Z	L__tf_mini_interrupcion_str28
	GOTO	L_tf_mini_interrupcion_str12
L__tf_mini_interrupcion_str28:
; dat_rx end address is: 4 (W2)
	MOV	#lo_addr(_tf_estado), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L_tf_mini_interrupcion_str12:
;tf_mini.c,104 :: 		break;
	GOTO	L_tf_mini_interrupcion_str10
;tf_mini.c,105 :: 		case tf_cabe1:
L_tf_mini_interrupcion_str13:
;tf_mini.c,106 :: 		trama_rx_lidar[trama_rx_lidar_cont]=dat_rx;
; dat_rx start address is: 4 (W2)
	MOV	#lo_addr(_trama_rx_lidar_cont), W0
	ZE	[W0], W1
	MOV	#lo_addr(_trama_rx_lidar), W0
	ADD	W0, W1, W0
	MOV.B	W2, [W0]
;tf_mini.c,107 :: 		trama_rx_lidar_cont++;
	MOV.B	#1, W1
	MOV	#lo_addr(_trama_rx_lidar_cont), W0
	ADD.B	W1, [W0], [W0]
;tf_mini.c,109 :: 		if (dat_rx=='\n')
	CP.B	W2, #10
	BRA Z	L__tf_mini_interrupcion_str29
	GOTO	L_tf_mini_interrupcion_str14
L__tf_mini_interrupcion_str29:
; dat_rx end address is: 4 (W2)
;tf_mini.c,111 :: 		trama_rx_lidar[trama_rx_lidar_cont]=0;
	MOV	#lo_addr(_trama_rx_lidar_cont), W0
	ZE	[W0], W1
	MOV	#lo_addr(_trama_rx_lidar), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV.B	W0, [W1]
;tf_mini.c,112 :: 		tf_estado=tf_cabe;
	MOV	#lo_addr(_tf_estado), W1
	CLR	W0
	MOV.B	W0, [W1]
;tf_mini.c,113 :: 		trama_rx_lidar_cont=0;
	MOV	#lo_addr(_trama_rx_lidar_cont), W1
	CLR	W0
	MOV.B	W0, [W1]
;tf_mini.c,115 :: 		U1RXIE_bit=0;//deshabilita la interrupcion, para que se procese la info
	BCLR	U1RXIE_bit, BitPos(U1RXIE_bit+0)
;tf_mini.c,116 :: 		flag_rx_lidar=1;//activa la bandera de datos listo
	MOV	#lo_addr(_flag_rx_lidar), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;tf_mini.c,118 :: 		}
	GOTO	L_tf_mini_interrupcion_str15
L_tf_mini_interrupcion_str14:
;tf_mini.c,120 :: 		else if (trama_rx_lidar_cont>=20)      //si supero tamño del buffer
	MOV	#lo_addr(_trama_rx_lidar_cont), W0
	MOV.B	[W0], W0
	CP.B	W0, #20
	BRA GEU	L__tf_mini_interrupcion_str30
	GOTO	L_tf_mini_interrupcion_str16
L__tf_mini_interrupcion_str30:
;tf_mini.c,122 :: 		trama_rx_lidar_cont=0;
	MOV	#lo_addr(_trama_rx_lidar_cont), W1
	CLR	W0
	MOV.B	W0, [W1]
;tf_mini.c,123 :: 		tf_estado=tf_cabe;
	MOV	#lo_addr(_tf_estado), W1
	CLR	W0
	MOV.B	W0, [W1]
;tf_mini.c,124 :: 		}
L_tf_mini_interrupcion_str16:
L_tf_mini_interrupcion_str15:
;tf_mini.c,126 :: 		break;
	GOTO	L_tf_mini_interrupcion_str10
;tf_mini.c,130 :: 		}
L_tf_mini_interrupcion_str9:
; dat_rx start address is: 4 (W2)
	MOV	#lo_addr(_tf_estado), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__tf_mini_interrupcion_str31
	GOTO	L_tf_mini_interrupcion_str11
L__tf_mini_interrupcion_str31:
	MOV	#lo_addr(_tf_estado), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__tf_mini_interrupcion_str32
	GOTO	L_tf_mini_interrupcion_str13
L__tf_mini_interrupcion_str32:
; dat_rx end address is: 4 (W2)
L_tf_mini_interrupcion_str10:
;tf_mini.c,132 :: 		U1RXIF_bit=0;//limpia bandera de recepcion
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;tf_mini.c,135 :: 		}
L_end_tf_mini_interrupcion_str:
	RETURN
; end of _tf_mini_interrupcion_str

_procesa_lidar_hex:

;tf_mini.c,137 :: 		void procesa_lidar_hex()
;tf_mini.c,139 :: 		distancia= ((unsigned int)trama_rx_lidar[1]<<8)+((unsigned int )trama_rx_lidar[0]);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_trama_rx_lidar+1), W0
	ZE	[W0], W0
	SL	W0, #8, W2
	MOV	#lo_addr(_trama_rx_lidar), W0
	ZE	[W0], W1
	MOV	#lo_addr(_distancia), W0
	ADD	W2, W1, [W0]
;tf_mini.c,140 :: 		fuerza=((unsigned int)trama_rx_lidar[3]<<8)+((unsigned int )trama_rx_lidar[2]); //artma la distancia
	MOV	#lo_addr(_trama_rx_lidar+3), W0
	ZE	[W0], W0
	SL	W0, #8, W2
	MOV	#lo_addr(_trama_rx_lidar+2), W0
	ZE	[W0], W1
	MOV	#lo_addr(_fuerza), W0
	ADD	W2, W1, [W0]
;tf_mini.c,141 :: 		memset(trama_rx_lidar,0,20);// limpia la trama
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_trama_rx_lidar), W10
	CALL	_memset
;tf_mini.c,142 :: 		}
L_end_procesa_lidar_hex:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _procesa_lidar_hex

_procesa_lidar_str:

;tf_mini.c,145 :: 		void procesa_lidar_str()
;tf_mini.c,147 :: 		distancia_float=atof(trama_rx_lidar);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_trama_rx_lidar), W10
	CALL	_atof
	MOV	W0, _distancia_float
	MOV	W1, _distancia_float+2
;tf_mini.c,148 :: 		memset(trama_rx_lidar,0,20);// limpia la trama
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_trama_rx_lidar), W10
	CALL	_memset
;tf_mini.c,150 :: 		}
L_end_procesa_lidar_str:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _procesa_lidar_str
