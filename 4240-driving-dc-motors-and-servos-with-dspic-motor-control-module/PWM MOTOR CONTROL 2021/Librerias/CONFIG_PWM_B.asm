
_pwm_init_basico:

;CONFIG_PWM_B.c,4 :: 		void pwm_init_basico()
;CONFIG_PWM_B.c,7 :: 		TMR2=0;
	CLR	TMR2
;CONFIG_PWM_B.c,8 :: 		PR2=12500;// para 50HZ = 20 ms manejo de servos
	MOV	#12500, W0
	MOV	WREG, PR2
;CONFIG_PWM_B.c,10 :: 		T2CON=0;
	CLR	T2CON
;CONFIG_PWM_B.c,12 :: 		T2CONbits.TCKPS=0B10;
	MOV.B	#32, W0
	MOV.B	W0, W1
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#48, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	W1, [W0]
;CONFIG_PWM_B.c,14 :: 		T2CONbits.TON=1; // prende el timer 2
	BSET	T2CONbits, #15
;CONFIG_PWM_B.c,18 :: 		OC1CON=OC2CON=0;
	CLR	OC2CON
	MOV	OC2CON, WREG
	MOV	WREG, OC1CON
;CONFIG_PWM_B.c,19 :: 		OC1CONbits.OCTSEL= OC2CONbits.OCTSEL=0;   //trabaja con timer2  sino timer 3
	BCLR.B	OC2CONbits, #3
	BTSS	OC2CONbits, #3
	BCLR.B	OC1CONbits, #3
	BTSC	OC2CONbits, #3
	BSET.B	OC1CONbits, #3
;CONFIG_PWM_B.c,21 :: 		OC1RS=OC1R=OC2RS=OC2R=6250;      //registro ancho pulso
	MOV	#6250, W0
	MOV	WREG, OC2R
	MOV	OC2R, WREG
	MOV	WREG, OC2RS
	MOV	OC2RS, WREG
	MOV	WREG, OC1R
	MOV	OC1R, WREG
	MOV	WREG, OC1RS
;CONFIG_PWM_B.c,24 :: 		OC1CONbits.OCM=OC2CONbits.OCM=0b110;     //configura como PWM
	MOV.B	#6, W0
	MOV.B	W0, W1
	MOV	#lo_addr(OC2CONbits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(OC2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(OC2CONbits), W0
	MOV.B	W1, [W0]
	MOV	#lo_addr(OC2CONbits), W0
	MOV.B	[W0], W0
	AND.B	W0, #7, W0
	MOV.B	W0, W1
	MOV	#lo_addr(OC1CONbits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(OC1CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(OC1CONbits), W0
	MOV.B	W1, [W0]
;CONFIG_PWM_B.c,27 :: 		}
L_end_pwm_init_basico:
	RETURN
; end of _pwm_init_basico
