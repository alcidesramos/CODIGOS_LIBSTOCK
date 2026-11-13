
_interrpcionlidar:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;lidar_dspic.c,35 :: 		void interrpcionlidar() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO
;lidar_dspic.c,40 :: 		tf_mini_interrupcion_str();
	CALL	_tf_mini_interrupcion_str
;lidar_dspic.c,45 :: 		}
L_end_interrpcionlidar:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _interrpcionlidar

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;lidar_dspic.c,48 :: 		void main()
;lidar_dspic.c,56 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;lidar_dspic.c,57 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;lidar_dspic.c,58 :: 		PLLFBD=41; // selecciona  para que trabaje con cristal interno
	MOV	#41, W0
	MOV	WREG, PLLFBD
;lidar_dspic.c,60 :: 		deshabilita();
	CALL	_deshabilita
;lidar_dspic.c,61 :: 		AD1PCFGL=0xffff;// todo digital
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;lidar_dspic.c,63 :: 		TRISB=0;
	CLR	TRISB
;lidar_dspic.c,64 :: 		TRISA=0;
	CLR	TRISA
;lidar_dspic.c,65 :: 		Delay_ms(100);
	MOV	#21, W8
	MOV	#22619, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
;lidar_dspic.c,66 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;lidar_dspic.c,67 :: 		PPS_Mapping(8,_OUTPUT,_U1TX);  //lidar tx
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#8, W10
	CALL	_PPS_Mapping
;lidar_dspic.c,68 :: 		PPS_Mapping(9,_INPUT,_U1RX);   //lidar rx
	MOV.B	#19, W12
	MOV.B	#1, W11
	MOV.B	#9, W10
	CALL	_PPS_Mapping
;lidar_dspic.c,70 :: 		PPS_Mapping(0,_OUTPUT,_U2TX); //tx pc
	MOV.B	#5, W12
	CLR	W11
	CLR	W10
	CALL	_PPS_Mapping
;lidar_dspic.c,71 :: 		PPS_Mapping(1,_INPUT,_U2RX);  //rx pc
	MOV.B	#21, W12
	MOV.B	#1, W11
	MOV.B	#1, W10
	CALL	_PPS_Mapping
;lidar_dspic.c,73 :: 		UART1_Init(115200);  //puerto lidar
	MOV	#49664, W10
	MOV	#1, W11
	CALL	_UART1_Init
;lidar_dspic.c,74 :: 		UART2_Init(115200);   //puerto pc
	MOV	#49664, W10
	MOV	#1, W11
	CALL	_UART2_Init
;lidar_dspic.c,75 :: 		Delay_ms(50);
	MOV	#11, W8
	MOV	#11309, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;lidar_dspic.c,77 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;lidar_dspic.c,79 :: 		Lcd_Init();
	CALL	_Lcd_Init
;lidar_dspic.c,80 :: 		Delay_ms(50);
	MOV	#11, W8
	MOV	#11309, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
;lidar_dspic.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;lidar_dspic.c,82 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOV.B	#12, W10
	CALL	_Lcd_Cmd
;lidar_dspic.c,83 :: 		Lcd_Out(1,6,"LIDAR");
	MOV	#lo_addr(?lstr1_lidar_dspic), W12
	MOV	#6, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;lidar_dspic.c,85 :: 		tf_mini_config();      //entra en configuracion
	CALL	_tf_mini_config
;lidar_dspic.c,89 :: 		tf_mini_out_str(); //salida en string
	CALL	_tf_mini_out_str
;lidar_dspic.c,94 :: 		u1sta.b7=0;
	BCLR.B	U1STA, #7
;lidar_dspic.c,95 :: 		u1sta.b6=0;
	BCLR.B	U1STA, #6
;lidar_dspic.c,98 :: 		U1STA.b1=0;
	BCLR.B	U1STA, #1
;lidar_dspic.c,101 :: 		U1RXIP_2_bit=1;
	BSET	U1RXIP_2_bit, BitPos(U1RXIP_2_bit+0)
;lidar_dspic.c,102 :: 		U1RXIP_1_bit=1;
	BSET	U1RXIP_1_bit, BitPos(U1RXIP_1_bit+0)
;lidar_dspic.c,103 :: 		U1RXIP_0_bit=1;
	BSET	U1RXIP_0_bit, BitPos(U1RXIP_0_bit+0)
;lidar_dspic.c,105 :: 		U1RXIF_bit=0;
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;lidar_dspic.c,106 :: 		U1RXIE_bit=1;
	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
;lidar_dspic.c,108 :: 		habilita();
	CALL	_habilita
;lidar_dspic.c,109 :: 		UART2_Write_Text("INICIANDO\r\n");
	MOV	#lo_addr(?lstr2_lidar_dspic), W10
	CALL	_UART2_Write_Text
;lidar_dspic.c,111 :: 		while(1)
L_main6:
;lidar_dspic.c,115 :: 		if (flag_rx_lidar==1)
	MOV	#lo_addr(_flag_rx_lidar), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__main13
	GOTO	L_main8
L__main13:
;lidar_dspic.c,126 :: 		procesa_lidar_str();
	CALL	_procesa_lidar_str
;lidar_dspic.c,127 :: 		sprintf(texto,"DIST=%.1f",distancia_float);
	PUSH	_distancia_float
	PUSH	_distancia_float+2
	MOV	#lo_addr(?lstr_3_lidar_dspic), W0
	PUSH	W0
	MOV	#lo_addr(_texto), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;lidar_dspic.c,128 :: 		Lcd_Out(2,5,"          ");
	MOV	#lo_addr(?lstr4_lidar_dspic), W12
	MOV	#5, W11
	MOV	#2, W10
	CALL	_Lcd_Out
;lidar_dspic.c,129 :: 		Lcd_Out(2,5,texto);
	MOV	#lo_addr(_texto), W12
	MOV	#5, W11
	MOV	#2, W10
	CALL	_Lcd_Out
;lidar_dspic.c,130 :: 		UART2_Write_Text(texto);
	MOV	#lo_addr(_texto), W10
	CALL	_UART2_Write_Text
;lidar_dspic.c,131 :: 		UART2_Write_Text("\r\n");
	MOV	#lo_addr(?lstr5_lidar_dspic), W10
	CALL	_UART2_Write_Text
;lidar_dspic.c,138 :: 		U1STA.b1=0;
	BCLR.B	U1STA, #1
;lidar_dspic.c,140 :: 		U1RXIF_bit=0;
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
;lidar_dspic.c,141 :: 		U1RXIE_bit=1;
	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
;lidar_dspic.c,143 :: 		flag_rx_lidar=0;
	MOV	#lo_addr(_flag_rx_lidar), W1
	CLR	W0
	MOV.B	W0, [W1]
;lidar_dspic.c,144 :: 		}
L_main8:
;lidar_dspic.c,146 :: 		led1=!led1;
	BTG	LATB15_bit, BitPos(LATB15_bit+0)
;lidar_dspic.c,147 :: 		Delay_ms(200);
	MOV	#41, W8
	MOV	#45239, W7
L_main9:
	DEC	W7
	BRA NZ	L_main9
	DEC	W8
	BRA NZ	L_main9
;lidar_dspic.c,149 :: 		}
	GOTO	L_main6
;lidar_dspic.c,152 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
