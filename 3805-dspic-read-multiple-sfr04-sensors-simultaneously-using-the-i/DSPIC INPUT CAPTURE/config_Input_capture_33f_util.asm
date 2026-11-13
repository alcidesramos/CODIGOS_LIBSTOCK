
_confi_timer_2:

;config_Input_capture_33f_util.c,19 :: 		void confi_timer_2()
;config_Input_capture_33f_util.c,23 :: 		tmr2=0;
	CLR	TMR2
;config_Input_capture_33f_util.c,24 :: 		pr2=65535;
	MOV	#65535, W0
	MOV	WREG, PR2
;config_Input_capture_33f_util.c,25 :: 		t2con=0;
	CLR	T2CON
;config_Input_capture_33f_util.c,28 :: 		t2con.b5=1;
	BSET.B	T2CON, #5
;config_Input_capture_33f_util.c,29 :: 		t2con.b4=0;
	BCLR.B	T2CON, #4
;config_Input_capture_33f_util.c,30 :: 		T2CONbits.TON=1;//prendo
	BSET	T2CONbits, #15
;config_Input_capture_33f_util.c,31 :: 		}
L_end_confi_timer_2:
	RETURN
; end of _confi_timer_2

_config_inputcapure:

;config_Input_capture_33f_util.c,33 :: 		void config_inputcapure()
;config_Input_capture_33f_util.c,34 :: 		{confi_timer_2();
	CALL	_confi_timer_2
;config_Input_capture_33f_util.c,35 :: 		IC1CON=IC2CON=IC7CON=IC8CON=0; //limpia registo
	CLR	IC8CON
	MOV	IC8CON, WREG
	MOV	WREG, IC7CON
	MOV	IC7CON, WREG
	MOV	WREG, IC2CON
	MOV	IC2CON, WREG
	MOV	WREG, IC1CON
;config_Input_capture_33f_util.c,37 :: 		ICTMR_IC1CON_bit=ICTMR_IC2CON_bit=ICTMR_IC7CON_bit=ICTMR_IC8CON_bit=1; //1=timer 2 es la fuente de reloj 0= timer 3
	BSET	ICTMR_IC8CON_bit, BitPos(ICTMR_IC8CON_bit+0)
	BTSS	ICTMR_IC8CON_bit, BitPos(ICTMR_IC8CON_bit+0)
	BCLR	ICTMR_IC7CON_bit, BitPos(ICTMR_IC7CON_bit+0)
	BTSC	ICTMR_IC8CON_bit, BitPos(ICTMR_IC8CON_bit+0)
	BSET	ICTMR_IC7CON_bit, BitPos(ICTMR_IC7CON_bit+0)
	BTSS	ICTMR_IC7CON_bit, BitPos(ICTMR_IC7CON_bit+0)
	BCLR	ICTMR_IC2CON_bit, BitPos(ICTMR_IC2CON_bit+0)
	BTSC	ICTMR_IC7CON_bit, BitPos(ICTMR_IC7CON_bit+0)
	BSET	ICTMR_IC2CON_bit, BitPos(ICTMR_IC2CON_bit+0)
	BTSS	ICTMR_IC2CON_bit, BitPos(ICTMR_IC2CON_bit+0)
	BCLR	ICTMR_IC1CON_bit, BitPos(ICTMR_IC1CON_bit+0)
	BTSC	ICTMR_IC2CON_bit, BitPos(ICTMR_IC2CON_bit+0)
	BSET	ICTMR_IC1CON_bit, BitPos(ICTMR_IC1CON_bit+0)
;config_Input_capture_33f_util.c,40 :: 		IC1CONbits.ICM=IC2CONbits.ICM=IC7CONbits.ICM=IC8CONbits.ICM=0b001;
	MOV.B	#1, W0
	MOV.B	W0, W1
	MOV	#lo_addr(IC8CONbits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IC8CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IC8CONbits), W0
	MOV.B	W1, [W0]
	MOV	#lo_addr(IC8CONbits), W0
	MOV.B	[W0], W0
	AND.B	W0, #7, W0
	MOV.B	W0, W1
	MOV	#lo_addr(IC7CONbits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IC7CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IC7CONbits), W0
	MOV.B	W1, [W0]
	MOV	#lo_addr(IC7CONbits), W0
	MOV.B	[W0], W0
	AND.B	W0, #7, W0
	MOV.B	W0, W1
	MOV	#lo_addr(IC2CONbits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IC2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IC2CONbits), W0
	MOV.B	W1, [W0]
	MOV	#lo_addr(IC2CONbits), W0
	MOV.B	[W0], W0
	AND.B	W0, #7, W0
	MOV.B	W0, W1
	MOV	#lo_addr(IC1CONbits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IC1CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IC1CONbits), W0
	MOV.B	W1, [W0]
;config_Input_capture_33f_util.c,43 :: 		IC1IF_bit=IC2IF_bit=IC7IF_bit=IC8IF_bit=0;   // limnpia la bandera
	BCLR	IC8IF_bit, BitPos(IC8IF_bit+0)
	BTSS	IC8IF_bit, BitPos(IC8IF_bit+0)
	BCLR	IC7IF_bit, BitPos(IC7IF_bit+0)
	BTSC	IC8IF_bit, BitPos(IC8IF_bit+0)
	BSET	IC7IF_bit, BitPos(IC7IF_bit+0)
	BTSS	IC7IF_bit, BitPos(IC7IF_bit+0)
	BCLR	IC2IF_bit, BitPos(IC2IF_bit+0)
	BTSC	IC7IF_bit, BitPos(IC7IF_bit+0)
	BSET	IC2IF_bit, BitPos(IC2IF_bit+0)
	BTSS	IC2IF_bit, BitPos(IC2IF_bit+0)
	BCLR	IC1IF_bit, BitPos(IC1IF_bit+0)
	BTSC	IC2IF_bit, BitPos(IC2IF_bit+0)
	BSET	IC1IF_bit, BitPos(IC1IF_bit+0)
;config_Input_capture_33f_util.c,44 :: 		IC1IE_bit=IC2IE_bit=IC7IE_bit=IC8IE_bit=1;  //habilita las interrpcion
	BSET	IC8IE_bit, BitPos(IC8IE_bit+0)
	BTSS	IC8IE_bit, BitPos(IC8IE_bit+0)
	BCLR	IC7IE_bit, BitPos(IC7IE_bit+0)
	BTSC	IC8IE_bit, BitPos(IC8IE_bit+0)
	BSET	IC7IE_bit, BitPos(IC7IE_bit+0)
	BTSS	IC7IE_bit, BitPos(IC7IE_bit+0)
	BCLR	IC2IE_bit, BitPos(IC2IE_bit+0)
	BTSC	IC7IE_bit, BitPos(IC7IE_bit+0)
	BSET	IC2IE_bit, BitPos(IC2IE_bit+0)
	BTSS	IC2IE_bit, BitPos(IC2IE_bit+0)
	BCLR	IC1IE_bit, BitPos(IC1IE_bit+0)
	BTSC	IC2IE_bit, BitPos(IC2IE_bit+0)
	BSET	IC1IE_bit, BitPos(IC1IE_bit+0)
;config_Input_capture_33f_util.c,47 :: 		IC1IP_2_bit=IC2IP_2_bit=IC7IP_2_bit=IC8IP_2_bit=0;
	BCLR	IC8IP_2_bit, BitPos(IC8IP_2_bit+0)
	BTSS	IC8IP_2_bit, BitPos(IC8IP_2_bit+0)
	BCLR	IC7IP_2_bit, BitPos(IC7IP_2_bit+0)
	BTSC	IC8IP_2_bit, BitPos(IC8IP_2_bit+0)
	BSET	IC7IP_2_bit, BitPos(IC7IP_2_bit+0)
	BTSS	IC7IP_2_bit, BitPos(IC7IP_2_bit+0)
	BCLR	IC2IP_2_bit, BitPos(IC2IP_2_bit+0)
	BTSC	IC7IP_2_bit, BitPos(IC7IP_2_bit+0)
	BSET	IC2IP_2_bit, BitPos(IC2IP_2_bit+0)
	BTSS	IC2IP_2_bit, BitPos(IC2IP_2_bit+0)
	BCLR	IC1IP_2_bit, BitPos(IC1IP_2_bit+0)
	BTSC	IC2IP_2_bit, BitPos(IC2IP_2_bit+0)
	BSET	IC1IP_2_bit, BitPos(IC1IP_2_bit+0)
;config_Input_capture_33f_util.c,48 :: 		IC1IP_1_bit=IC2IP_1_bit=IC7IP_1_bit=IC8IP_1_bit=1;
	BSET	IC8IP_1_bit, BitPos(IC8IP_1_bit+0)
	BTSS	IC8IP_1_bit, BitPos(IC8IP_1_bit+0)
	BCLR	IC7IP_1_bit, BitPos(IC7IP_1_bit+0)
	BTSC	IC8IP_1_bit, BitPos(IC8IP_1_bit+0)
	BSET	IC7IP_1_bit, BitPos(IC7IP_1_bit+0)
	BTSS	IC7IP_1_bit, BitPos(IC7IP_1_bit+0)
	BCLR	IC2IP_1_bit, BitPos(IC2IP_1_bit+0)
	BTSC	IC7IP_1_bit, BitPos(IC7IP_1_bit+0)
	BSET	IC2IP_1_bit, BitPos(IC2IP_1_bit+0)
	BTSS	IC2IP_1_bit, BitPos(IC2IP_1_bit+0)
	BCLR	IC1IP_1_bit, BitPos(IC1IP_1_bit+0)
	BTSC	IC2IP_1_bit, BitPos(IC2IP_1_bit+0)
	BSET	IC1IP_1_bit, BitPos(IC1IP_1_bit+0)
;config_Input_capture_33f_util.c,49 :: 		IC1IP_0_bit=IC2IP_0_bit=IC7IP_0_bit=IC8IP_0_bit=1;
	BSET	IC8IP_0_bit, BitPos(IC8IP_0_bit+0)
	BTSS	IC8IP_0_bit, BitPos(IC8IP_0_bit+0)
	BCLR	IC7IP_0_bit, BitPos(IC7IP_0_bit+0)
	BTSC	IC8IP_0_bit, BitPos(IC8IP_0_bit+0)
	BSET	IC7IP_0_bit, BitPos(IC7IP_0_bit+0)
	BTSS	IC7IP_0_bit, BitPos(IC7IP_0_bit+0)
	BCLR	IC2IP_0_bit, BitPos(IC2IP_0_bit+0)
	BTSC	IC7IP_0_bit, BitPos(IC7IP_0_bit+0)
	BSET	IC2IP_0_bit, BitPos(IC2IP_0_bit+0)
	BTSS	IC2IP_0_bit, BitPos(IC2IP_0_bit+0)
	BCLR	IC1IP_0_bit, BitPos(IC1IP_0_bit+0)
	BTSC	IC2IP_0_bit, BitPos(IC2IP_0_bit+0)
	BSET	IC1IP_0_bit, BitPos(IC1IP_0_bit+0)
;config_Input_capture_33f_util.c,51 :: 		}
L_end_config_inputcapure:
	RETURN
; end of _config_inputcapure

_INTIC1:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_Input_capture_33f_util.c,54 :: 		void INTIC1() iv IVT_ADDR_IC1INTERRUPT ics ICS_AUTO
;config_Input_capture_33f_util.c,57 :: 		pul1_2=IC1BUF;
	MOV	IC1BUF, WREG
	MOV	W0, _pul1_2
;config_Input_capture_33f_util.c,59 :: 		if (in_pulso_1==0)
	BTSC	in_pulso_1, BitPos(in_pulso_1+0)
	GOTO	L_INTIC10
;config_Input_capture_33f_util.c,62 :: 		if (pul1_2>pul1_1) pulso_1=(pul1_2-pul1_1);
	MOV	_pul1_2, W1
	MOV	#lo_addr(_pul1_1), W0
	CP	W1, [W0]
	BRA GTU	L__INTIC115
	GOTO	L_INTIC11
L__INTIC115:
	MOV	_pul1_2, W2
	MOV	#lo_addr(_pul1_1), W1
	MOV	#lo_addr(_pulso_1), W0
	SUB	W2, [W1], [W0]
	GOTO	L_INTIC12
L_INTIC11:
;config_Input_capture_33f_util.c,63 :: 		else pulso_1=(PR2 - pul1_1) + pul1_2;   //desborde del timer
	MOV	PR2, W1
	MOV	#lo_addr(_pul1_1), W0
	SUB	W1, [W0], W2
	MOV	#lo_addr(_pul1_2), W1
	MOV	#lo_addr(_pulso_1), W0
	ADD	W2, [W1], [W0]
L_INTIC12:
;config_Input_capture_33f_util.c,64 :: 		}
L_INTIC10:
;config_Input_capture_33f_util.c,65 :: 		pul1_1=pul1_2;
	MOV	_pul1_2, W0
	MOV	W0, _pul1_1
;config_Input_capture_33f_util.c,66 :: 		IC1IF_bit=0; // limpia la bandera
	BCLR	IC1IF_bit, BitPos(IC1IF_bit+0)
;config_Input_capture_33f_util.c,67 :: 		}
L_end_INTIC1:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _INTIC1

_INTIC2:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_Input_capture_33f_util.c,69 :: 		void INTIC2() iv IVT_ADDR_IC2INTERRUPT ics ICS_AUTO
;config_Input_capture_33f_util.c,72 :: 		pul2_2=IC2BUF;
	MOV	IC2BUF, WREG
	MOV	W0, _pul2_2
;config_Input_capture_33f_util.c,74 :: 		if (in_pulso_2==0)
	BTSC	in_pulso_2, BitPos(in_pulso_2+0)
	GOTO	L_INTIC23
;config_Input_capture_33f_util.c,77 :: 		if (pul2_2>pul2_1) pulso_2=(pul2_2-pul2_1);
	MOV	_pul2_2, W1
	MOV	#lo_addr(_pul2_1), W0
	CP	W1, [W0]
	BRA GTU	L__INTIC217
	GOTO	L_INTIC24
L__INTIC217:
	MOV	_pul2_2, W2
	MOV	#lo_addr(_pul2_1), W1
	MOV	#lo_addr(_pulso_2), W0
	SUB	W2, [W1], [W0]
	GOTO	L_INTIC25
L_INTIC24:
;config_Input_capture_33f_util.c,78 :: 		else pulso_2=(PR2 - pul2_1) + pul2_2;
	MOV	PR2, W1
	MOV	#lo_addr(_pul2_1), W0
	SUB	W1, [W0], W2
	MOV	#lo_addr(_pul2_2), W1
	MOV	#lo_addr(_pulso_2), W0
	ADD	W2, [W1], [W0]
L_INTIC25:
;config_Input_capture_33f_util.c,79 :: 		}
L_INTIC23:
;config_Input_capture_33f_util.c,80 :: 		pul2_1=pul2_2;
	MOV	_pul2_2, W0
	MOV	W0, _pul2_1
;config_Input_capture_33f_util.c,81 :: 		IC2IF_bit=0;
	BCLR	IC2IF_bit, BitPos(IC2IF_bit+0)
;config_Input_capture_33f_util.c,82 :: 		}
L_end_INTIC2:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _INTIC2

_INTIC3:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_Input_capture_33f_util.c,85 :: 		void INTIC3() iv IVT_ADDR_IC7INTERRUPT ics ICS_AUTO
;config_Input_capture_33f_util.c,89 :: 		pul3_2=IC7BUF;
	MOV	IC7BUF, WREG
	MOV	W0, _pul3_2
;config_Input_capture_33f_util.c,91 :: 		if (in_pulso_3==0)
	BTSC	in_pulso_3, BitPos(in_pulso_3+0)
	GOTO	L_INTIC36
;config_Input_capture_33f_util.c,94 :: 		if (pul3_2>pul3_1) pulso_3=(pul3_2-pul3_1);
	MOV	_pul3_2, W1
	MOV	#lo_addr(_pul3_1), W0
	CP	W1, [W0]
	BRA GTU	L__INTIC319
	GOTO	L_INTIC37
L__INTIC319:
	MOV	_pul3_2, W2
	MOV	#lo_addr(_pul3_1), W1
	MOV	#lo_addr(_pulso_3), W0
	SUB	W2, [W1], [W0]
	GOTO	L_INTIC38
L_INTIC37:
;config_Input_capture_33f_util.c,95 :: 		else pulso_3=(PR2 - pul3_1) + pul3_2;
	MOV	PR2, W1
	MOV	#lo_addr(_pul3_1), W0
	SUB	W1, [W0], W2
	MOV	#lo_addr(_pul3_2), W1
	MOV	#lo_addr(_pulso_3), W0
	ADD	W2, [W1], [W0]
L_INTIC38:
;config_Input_capture_33f_util.c,96 :: 		}
L_INTIC36:
;config_Input_capture_33f_util.c,97 :: 		pul3_1=pul3_2;
	MOV	_pul3_2, W0
	MOV	W0, _pul3_1
;config_Input_capture_33f_util.c,98 :: 		IC7IF_bit=0;
	BCLR	IC7IF_bit, BitPos(IC7IF_bit+0)
;config_Input_capture_33f_util.c,99 :: 		}
L_end_INTIC3:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _INTIC3

_INTIC4:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;config_Input_capture_33f_util.c,101 :: 		void INTIC4() iv IVT_ADDR_IC8INTERRUPT ics ICS_AUTO
;config_Input_capture_33f_util.c,104 :: 		pul4_2=IC8BUF;
	MOV	IC8BUF, WREG
	MOV	W0, _pul4_2
;config_Input_capture_33f_util.c,106 :: 		if (in_pulso_4==0)
	BTSC	in_pulso_4, BitPos(in_pulso_4+0)
	GOTO	L_INTIC49
;config_Input_capture_33f_util.c,109 :: 		if (pul4_2>pul4_1) pulso_4=(pul4_2-pul4_1);
	MOV	_pul4_2, W1
	MOV	#lo_addr(_pul4_1), W0
	CP	W1, [W0]
	BRA GTU	L__INTIC421
	GOTO	L_INTIC410
L__INTIC421:
	MOV	_pul4_2, W2
	MOV	#lo_addr(_pul4_1), W1
	MOV	#lo_addr(_pulso_4), W0
	SUB	W2, [W1], [W0]
	GOTO	L_INTIC411
L_INTIC410:
;config_Input_capture_33f_util.c,110 :: 		else pulso_4=(PR2 - pul4_1) + pul4_2;
	MOV	PR2, W1
	MOV	#lo_addr(_pul4_1), W0
	SUB	W1, [W0], W2
	MOV	#lo_addr(_pul4_2), W1
	MOV	#lo_addr(_pulso_4), W0
	ADD	W2, [W1], [W0]
L_INTIC411:
;config_Input_capture_33f_util.c,111 :: 		}
L_INTIC49:
;config_Input_capture_33f_util.c,112 :: 		pul4_1=pul4_2;
	MOV	_pul4_2, W0
	MOV	W0, _pul4_1
;config_Input_capture_33f_util.c,113 :: 		IC8IF_bit=0;
	BCLR	IC8IF_bit, BitPos(IC8IF_bit+0)
;config_Input_capture_33f_util.c,114 :: 		}
L_end_INTIC4:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _INTIC4
