
_map:
	LNK	#16

;pwm_basico.c,12 :: 		float map(float x_in, float x1_, float y1_, float x2_, float y2_)
	MOV	[W14-10], W0
	MOV	[W14-8], W1
	MOV	W0, [W14-10]
	MOV	W1, [W14-8]
	MOV	[W14-14], W0
	MOV	[W14-12], W1
	MOV	W0, [W14-14]
	MOV	W1, [W14-12]
; y2_ start address is: 8 (W4)
	MOV	[W14-18], W4
	MOV	[W14-16], W5
;pwm_basico.c,15 :: 		pendiente=(y2_ - y1_) / (x2_ - x1_);
	MOV	[W14-10], W2
	MOV	[W14-8], W3
	PUSH.D	W12
; y2_ end address is: 8 (W4)
	PUSH.D	W10
	MOV.D	W4, W0
	CALL	__Sub_FP
	POP.D	W10
	POP.D	W12
	MOV	W0, [W14+12]
	MOV	W1, [W14+14]
	MOV	[W14-14], W1
	MOV	[W14-12], W2
	ADD	W14, #4, W0
	PUSH.D	W12
	PUSH.D	W10
	MOV	W1, W0
	MOV	W2, W1
	MOV.D	W12, W2
	CALL	__Sub_FP
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	MOV	[W14+12], W0
	MOV	[W14+14], W1
	MOV	[W14+4], W2
	MOV	[W14+6], W3
	CALL	__Div_FP
	POP.D	W10
	POP.D	W12
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;pwm_basico.c,16 :: 		pendiente=pendiente*(x_in- x1_);
	MOV.D	W12, W2
	MOV.D	W10, W0
	CALL	__Sub_FP
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
;pwm_basico.c,17 :: 		pendiente=pendiente+y1_;
	MOV	[W14-10], W2
	MOV	[W14-8], W3
	CALL	__AddSub_FP
;pwm_basico.c,18 :: 		return( pendiente);
;pwm_basico.c,19 :: 		}
L_end_map:
	ULNK
	RETURN
; end of _map

_servo1:

;pwm_basico.c,22 :: 		void servo1(float angulo)
;pwm_basico.c,24 :: 		angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
	PUSH	W12
	PUSH	W13
	PUSH.D	W10
	MOV	#0, W12
	MOV	#49844, W13
	MOV	#0, W0
	MOV	#16384, W1
	PUSH.D	W0
	MOV	#0, W0
	MOV	#17076, W1
	PUSH.D	W0
	MOV	#0, W0
	MOV	#16256, W1
	PUSH.D	W0
	CALL	_map
	SUB	#12, W15
	POP.D	W10
	MOV.D	W0, W10
;pwm_basico.c,25 :: 		OC1RS=angulo*(float)PR2/20.0;
	PUSH.D	W10
	MOV	PR2, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16800, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, OC1RS
;pwm_basico.c,26 :: 		}
L_end_servo1:
	POP	W13
	POP	W12
	RETURN
; end of _servo1

_servo1_ecu:

;pwm_basico.c,29 :: 		void servo1_ecu(float angulo)
;pwm_basico.c,31 :: 		OC1RS=3.4722*angulo + 937.5;
	MOV	#14470, W0
	MOV	#16478, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#24576, W2
	MOV	#17514, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, OC1RS
;pwm_basico.c,32 :: 		}
L_end_servo1_ecu:
	RETURN
; end of _servo1_ecu

_pwm1:

;pwm_basico.c,34 :: 		void pwm1(float ancho)
;pwm_basico.c,36 :: 		OC1RS=ancho*(float)PR2/100.0;
	PUSH.D	W10
	MOV	PR2, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, OC1RS
;pwm_basico.c,37 :: 		}
L_end_pwm1:
	RETURN
; end of _pwm1

_servo2:

;pwm_basico.c,39 :: 		void servo2(float angulo)
;pwm_basico.c,41 :: 		angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
	PUSH	W12
	PUSH	W13
	PUSH.D	W10
	MOV	#0, W12
	MOV	#49844, W13
	MOV	#0, W0
	MOV	#16384, W1
	PUSH.D	W0
	MOV	#0, W0
	MOV	#17076, W1
	PUSH.D	W0
	MOV	#0, W0
	MOV	#16256, W1
	PUSH.D	W0
	CALL	_map
	SUB	#12, W15
	POP.D	W10
	MOV.D	W0, W10
;pwm_basico.c,42 :: 		OC2RS=angulo*(float)PR2/20.0;
	PUSH.D	W10
	MOV	PR2, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16800, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, OC2RS
;pwm_basico.c,43 :: 		}
L_end_servo2:
	POP	W13
	POP	W12
	RETURN
; end of _servo2

_servo2_ecu:

;pwm_basico.c,46 :: 		void servo2_ecu(float angulo)
;pwm_basico.c,48 :: 		OC2RS=3.4722*angulo + 937.5;
	MOV	#14470, W0
	MOV	#16478, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#24576, W2
	MOV	#17514, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, OC2RS
;pwm_basico.c,49 :: 		}
L_end_servo2_ecu:
	RETURN
; end of _servo2_ecu

_pwm2:

;pwm_basico.c,52 :: 		void pwm2(float ancho)
;pwm_basico.c,54 :: 		OC2RS=ancho*(float)PR2/100.0;
	PUSH.D	W10
	MOV	PR2, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, OC2RS
;pwm_basico.c,55 :: 		}
L_end_pwm2:
	RETURN
; end of _pwm2

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;pwm_basico.c,57 :: 		void main()
;pwm_basico.c,59 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;pwm_basico.c,60 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;pwm_basico.c,61 :: 		PLLFBD=41; // selecciona  M=40;  siempre lo deseado menos 2;    CRISTAL INTERNO
	MOV	#41, W0
	MOV	WREG, PLLFBD
;pwm_basico.c,64 :: 		AD1PCFGL = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;pwm_basico.c,67 :: 		TRISA=0XFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISA
;pwm_basico.c,68 :: 		TRISB=0XFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISB
;pwm_basico.c,70 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;pwm_basico.c,72 :: 		PPS_Mapping(0,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	CLR	W10
	CALL	_PPS_Mapping
;pwm_basico.c,73 :: 		PPS_Mapping(1,_INPUT,_U1RX);
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#1, W10
	CALL	_PPS_Mapping
;pwm_basico.c,76 :: 		PPS_Mapping(2,_OUTPUT,_OC1);
	MOV.B	#18, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping
;pwm_basico.c,77 :: 		PPS_Mapping(3,_OUTPUT,_OC2);
	MOV.B	#19, W12
	CLR	W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping
;pwm_basico.c,81 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;pwm_basico.c,83 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;pwm_basico.c,84 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOV	#lo_addr(?lstr1_pwm_basico), W10
	CALL	_UART1_Write_Text
;pwm_basico.c,85 :: 		pwm_init_basico();
	CALL	_pwm_init_basico
;pwm_basico.c,86 :: 		while (1)
L_main0:
;pwm_basico.c,89 :: 		servo1(-90); // angulo   1ms
	MOV	#0, W10
	MOV	#49844, W11
	CALL	_servo1
;pwm_basico.c,92 :: 		for (cuenta=-90;cuenta<=90;cuenta+=5)
	MOV	#lo_addr(_cuenta), W1
	MOV.B	#166, W0
	MOV.B	W0, [W1]
L_main2:
	MOV	#lo_addr(_cuenta), W0
	MOV.B	[W0], W1
	MOV.B	#90, W0
	CP.B	W1, W0
	BRA LE	L__main15
	GOTO	L_main3
L__main15:
;pwm_basico.c,95 :: 		servo1_ecu(cuenta);
	MOV	#lo_addr(_cuenta), W2
	SE	[W2], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV.D	W0, W10
	CALL	_servo1_ecu
;pwm_basico.c,96 :: 		Delay_ms(50);
	MOV	#11, W8
	MOV	#11309, W7
L_main5:
	DEC	W7
	BRA NZ	L_main5
	DEC	W8
	BRA NZ	L_main5
;pwm_basico.c,92 :: 		for (cuenta=-90;cuenta<=90;cuenta+=5)
	MOV.B	#5, W1
	MOV	#lo_addr(_cuenta), W0
	ADD.B	W1, [W0], [W0]
;pwm_basico.c,97 :: 		}
	GOTO	L_main2
L_main3:
;pwm_basico.c,98 :: 		pwm2(80);  //porcentaje
	MOV	#0, W10
	MOV	#17056, W11
	CALL	_pwm2
;pwm_basico.c,102 :: 		}
	GOTO	L_main0
;pwm_basico.c,105 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
