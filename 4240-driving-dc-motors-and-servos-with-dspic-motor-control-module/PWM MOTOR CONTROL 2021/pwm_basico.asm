
_map:
	LNK	#16

;pwm_basico.c,14 :: 		float map(float x_in, float x1_, float y1_, float x2_, float y2_)
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
;pwm_basico.c,17 :: 		pendiente=(y2_ - y1_) / (x2_ - x1_);
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
;pwm_basico.c,18 :: 		pendiente=pendiente*(x_in- x1_);
	MOV.D	W12, W2
	MOV.D	W10, W0
	CALL	__Sub_FP
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
;pwm_basico.c,19 :: 		pendiente=pendiente+y1_;
	MOV	[W14-10], W2
	MOV	[W14-8], W3
	CALL	__AddSub_FP
;pwm_basico.c,20 :: 		return( pendiente);
;pwm_basico.c,21 :: 		}
L_end_map:
	ULNK
	RETURN
; end of _map

_servo1:

;pwm_basico.c,24 :: 		void servo1(float angulo)
;pwm_basico.c,26 :: 		angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
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
;pwm_basico.c,27 :: 		OC1RS=angulo*(float)PR2/20.0;
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
;pwm_basico.c,28 :: 		}
L_end_servo1:
	POP	W13
	POP	W12
	RETURN
; end of _servo1

_servo1_ecu:

;pwm_basico.c,31 :: 		void servo1_ecu(float angulo)
;pwm_basico.c,33 :: 		OC1RS=3.4722*angulo + 937.5;
	MOV	#14470, W0
	MOV	#16478, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#24576, W2
	MOV	#17514, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, OC1RS
;pwm_basico.c,34 :: 		}
L_end_servo1_ecu:
	RETURN
; end of _servo1_ecu

_pwm1:

;pwm_basico.c,36 :: 		void pwm1(float ancho)
;pwm_basico.c,38 :: 		OC1RS=ancho*(float)PR2/100.0;
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
;pwm_basico.c,39 :: 		}
L_end_pwm1:
	RETURN
; end of _pwm1

_servo2:

;pwm_basico.c,44 :: 		void servo2(float angulo)
;pwm_basico.c,46 :: 		angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
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
;pwm_basico.c,47 :: 		OC2RS=angulo*(float)PR2/20.0;
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
;pwm_basico.c,48 :: 		}
L_end_servo2:
	POP	W13
	POP	W12
	RETURN
; end of _servo2

_servo2_ecu:

;pwm_basico.c,51 :: 		void servo2_ecu(float angulo)
;pwm_basico.c,53 :: 		OC2RS=3.4722*angulo + 937.5;
	MOV	#14470, W0
	MOV	#16478, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#24576, W2
	MOV	#17514, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, OC2RS
;pwm_basico.c,54 :: 		}
L_end_servo2_ecu:
	RETURN
; end of _servo2_ecu

_pwm2:

;pwm_basico.c,57 :: 		void pwm2(float ancho)
;pwm_basico.c,59 :: 		OC2RS=ancho*(float)PR2/100.0;
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
;pwm_basico.c,60 :: 		}
L_end_pwm2:
	RETURN
; end of _pwm2

_servo3:

;pwm_basico.c,62 :: 		void servo3(float angulo)
;pwm_basico.c,64 :: 		angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
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
;pwm_basico.c,65 :: 		PDC1=angulo*(float)P1TPER*2.0/20.0;
	PUSH.D	W10
	MOV	P1TPER, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16800, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, PDC1
;pwm_basico.c,66 :: 		}
L_end_servo3:
	POP	W13
	POP	W12
	RETURN
; end of _servo3

_servo3_ecu:

;pwm_basico.c,69 :: 		void servo3_ecu(float angulo)
;pwm_basico.c,71 :: 		PDC1= 6.9444*angulo + 1874.0;
	MOV	#14470, W0
	MOV	#16606, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#16384, W2
	MOV	#17642, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, PDC1
;pwm_basico.c,72 :: 		}
L_end_servo3_ecu:
	RETURN
; end of _servo3_ecu

_pwm3:

;pwm_basico.c,74 :: 		void pwm3(float ancho)
;pwm_basico.c,76 :: 		PDC1=ancho*(float)P1TPER*2.0/100.0;
	PUSH.D	W10
	MOV	P1TPER, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, PDC1
;pwm_basico.c,77 :: 		}
L_end_pwm3:
	RETURN
; end of _pwm3

_servo4:

;pwm_basico.c,79 :: 		void servo4(float angulo)
;pwm_basico.c,81 :: 		angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
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
;pwm_basico.c,82 :: 		PDC2=angulo*(float)P1TPER*2.0/20.0;
	PUSH.D	W10
	MOV	P1TPER, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16800, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, PDC2
;pwm_basico.c,83 :: 		}
L_end_servo4:
	POP	W13
	POP	W12
	RETURN
; end of _servo4

_servo4_ecu:

;pwm_basico.c,86 :: 		void servo4_ecu(float angulo)
;pwm_basico.c,88 :: 		PDC2=6.9444*angulo + 1874.0;
	MOV	#14470, W0
	MOV	#16606, W1
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#16384, W2
	MOV	#17642, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	WREG, PDC2
;pwm_basico.c,89 :: 		}
L_end_servo4_ecu:
	RETURN
; end of _servo4_ecu

_pwm4:

;pwm_basico.c,92 :: 		void pwm4(float ancho)
;pwm_basico.c,94 :: 		PDC2=ancho*(float)P1TPER*2.0/100.0;
	PUSH.D	W10
	MOV	P1TPER, WREG
	CLR	W1
	CALL	__Long2Float
	POP.D	W10
	MOV.D	W10, W2
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	WREG, PDC2
;pwm_basico.c,95 :: 		}
L_end_pwm4:
	RETURN
; end of _pwm4

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;pwm_basico.c,98 :: 		void main()
;pwm_basico.c,100 :: 		CLKDIVbits.PLLPRE = 0;      // N1 = 2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;pwm_basico.c,101 :: 		CLKDIVbits.PLLPOST = 0;     // N2 = 2
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;pwm_basico.c,102 :: 		PLLFBD=41; // selecciona  M=40;  siempre lo deseado menos 2;    CRISTAL INTERNO
	MOV	#41, W0
	MOV	WREG, PLLFBD
;pwm_basico.c,105 :: 		AD1PCFGL = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, AD1PCFGL
;pwm_basico.c,108 :: 		TRISA=0XFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISA
;pwm_basico.c,109 :: 		TRISB=0XFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISB
;pwm_basico.c,111 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;pwm_basico.c,113 :: 		PPS_Mapping(0,_OUTPUT,_U1TX);
	MOV.B	#3, W12
	CLR	W11
	CLR	W10
	CALL	_PPS_Mapping
;pwm_basico.c,114 :: 		PPS_Mapping(1,_INPUT,_U1RX);
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#1, W10
	CALL	_PPS_Mapping
;pwm_basico.c,117 :: 		PPS_Mapping(2,_OUTPUT,_OC1);
	MOV.B	#18, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping
;pwm_basico.c,118 :: 		PPS_Mapping(3,_OUTPUT,_OC2);
	MOV.B	#19, W12
	CLR	W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping
;pwm_basico.c,122 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;pwm_basico.c,124 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;pwm_basico.c,125 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOV	#lo_addr(?lstr1_pwm_basico), W10
	CALL	_UART1_Write_Text
;pwm_basico.c,126 :: 		pwm_init_basico();
	CALL	_pwm_init_basico
;pwm_basico.c,127 :: 		pwm_fast_init();
	CALL	_pwm_fast_init
;pwm_basico.c,134 :: 		while (1)
L_main0:
;pwm_basico.c,137 :: 		PWM2(90);    //90 %
	MOV	#0, W10
	MOV	#17076, W11
	CALL	_pwm2
;pwm_basico.c,138 :: 		PWM4(90);    //90 %
	MOV	#0, W10
	MOV	#17076, W11
	CALL	_pwm4
;pwm_basico.c,141 :: 		for (cuenta=-90;cuenta<=90;cuenta+=5)
	MOV	#lo_addr(_cuenta), W1
	MOV.B	#166, W0
	MOV.B	W0, [W1]
L_main2:
	MOV	#lo_addr(_cuenta), W0
	MOV.B	[W0], W1
	MOV.B	#90, W0
	CP.B	W1, W0
	BRA LE	L__main23
	GOTO	L_main3
L__main23:
;pwm_basico.c,144 :: 		servo1_ecu(cuenta);
	MOV	#lo_addr(_cuenta), W2
	SE	[W2], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV.D	W0, W10
	CALL	_servo1_ecu
;pwm_basico.c,145 :: 		servo3_ecu(cuenta);
	MOV	#lo_addr(_cuenta), W2
	SE	[W2], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV.D	W0, W10
	CALL	_servo3_ecu
;pwm_basico.c,146 :: 		Delay_ms(50);
	MOV	#11, W8
	MOV	#11309, W7
L_main5:
	DEC	W7
	BRA NZ	L_main5
	DEC	W8
	BRA NZ	L_main5
;pwm_basico.c,141 :: 		for (cuenta=-90;cuenta<=90;cuenta+=5)
	MOV.B	#5, W1
	MOV	#lo_addr(_cuenta), W0
	ADD.B	W1, [W0], [W0]
;pwm_basico.c,147 :: 		}
	GOTO	L_main2
L_main3:
;pwm_basico.c,148 :: 		pwm2(10);  //porcentaje
	MOV	#0, W10
	MOV	#16672, W11
	CALL	_pwm2
;pwm_basico.c,149 :: 		pwm4(10);  //porcentaje
	MOV	#0, W10
	MOV	#16672, W11
	CALL	_pwm4
;pwm_basico.c,151 :: 		Delay_ms(1000);
	MOV	#204, W8
	MOV	#29592, W7
L_main7:
	DEC	W7
	BRA NZ	L_main7
	DEC	W8
	BRA NZ	L_main7
;pwm_basico.c,154 :: 		}
	GOTO	L_main0
;pwm_basico.c,157 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
