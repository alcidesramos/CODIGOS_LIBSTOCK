
_setbit:

;dados.c,32 :: 		void setbit (unsigned int  *port, char bit1)
;dados.c,34 :: 		*port |= (1 << bit1);
	MOVF       FARG_setbit_bit1+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__setbit56:
	BTFSC      STATUS+0, 2
	GOTO       L__setbit57
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__setbit56
L__setbit57:
	MOVF       FARG_setbit_port+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	IORWF      R0+1, 1
	MOVF       FARG_setbit_port+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;dados.c,35 :: 		}
L_end_setbit:
	RETURN
; end of _setbit

_clearbit:

;dados.c,36 :: 		void clearbit (unsigned int *port, char bit1)
;dados.c,39 :: 		*port &= ~ (1 << bit1);
	MOVF       FARG_clearbit_bit1+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__clearbit59:
	BTFSC      STATUS+0, 2
	GOTO       L__clearbit60
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__clearbit59
L__clearbit60:
	COMF       R0+0, 1
	COMF       R0+1, 1
	MOVF       FARG_clearbit_port+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	ANDWF      R0+1, 1
	MOVF       FARG_clearbit_port+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;dados.c,40 :: 		}
L_end_clearbit:
	RETURN
; end of _clearbit

_readbit:

;dados.c,43 :: 		char readbit (unsigned int port, char bit1)
;dados.c,46 :: 		if ((port & (1 << bit1))>0)  return (1);
	MOVF       FARG_readbit_bit1+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__readbit62:
	BTFSC      STATUS+0, 2
	GOTO       L__readbit63
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__readbit62
L__readbit63:
	MOVF       R0+0, 0
	ANDWF      FARG_readbit_port+0, 0
	MOVWF      R2+0
	MOVF       FARG_readbit_port+1, 0
	ANDWF      R0+1, 0
	MOVWF      R2+1
	MOVF       R2+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__readbit64
	MOVF       R2+0, 0
	SUBLW      0
L__readbit64:
	BTFSC      STATUS+0, 0
	GOTO       L_readbit0
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_readbit
L_readbit0:
;dados.c,47 :: 		else return (0);
	CLRF       R0+0
;dados.c,48 :: 		}
L_end_readbit:
	RETURN
; end of _readbit

_borrado1:

;dados.c,51 :: 		void borrado1()
;dados.c,53 :: 		d11=d12=d13=d14=d15=d16=d17=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__borrado166
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L__borrado167
L__borrado166:
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
L__borrado167:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L__borrado168
	BCF        RA6_bit+0, BitPos(RA6_bit+0)
	GOTO       L__borrado169
L__borrado168:
	BSF        RA6_bit+0, BitPos(RA6_bit+0)
L__borrado169:
	BTFSC      RA6_bit+0, BitPos(RA6_bit+0)
	GOTO       L__borrado170
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L__borrado171
L__borrado170:
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
L__borrado171:
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L__borrado172
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L__borrado173
L__borrado172:
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
L__borrado173:
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L__borrado174
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L__borrado175
L__borrado174:
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
L__borrado175:
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L__borrado176
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L__borrado177
L__borrado176:
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
L__borrado177:
;dados.c,54 :: 		}
L_end_borrado1:
	RETURN
; end of _borrado1

_borrado2:

;dados.c,56 :: 		void borrado2()
;dados.c,58 :: 		d21=d22=d23=d24=d25=d26=d27=0;
	BCF        RA7_bit+0, BitPos(RA7_bit+0)
	BTFSC      RA7_bit+0, BitPos(RA7_bit+0)
	GOTO       L__borrado279
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L__borrado280
L__borrado279:
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
L__borrado280:
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L__borrado281
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__borrado282
L__borrado281:
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
L__borrado282:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__borrado283
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__borrado284
L__borrado283:
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
L__borrado284:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__borrado285
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__borrado286
L__borrado285:
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
L__borrado286:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__borrado287
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__borrado288
L__borrado287:
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
L__borrado288:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__borrado289
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__borrado290
L__borrado289:
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
L__borrado290:
;dados.c,59 :: 		}
L_end_borrado2:
	RETURN
; end of _borrado2

_dado1:

;dados.c,63 :: 		void dado1(char num)
;dados.c,67 :: 		borrado1();
	CALL       _borrado1+0
;dados.c,69 :: 		for (cont=0;cont<=6;cont++)
	CLRF       dado1_cont_L0+0
L_dado12:
	MOVF       dado1_cont_L0+0, 0
	SUBLW      6
	BTFSS      STATUS+0, 0
	GOTO       L_dado13
;dados.c,71 :: 		if (readbit(numeros[num],cont)==1)
	MOVF       FARG_dado1_num+0, 0
	ADDLW      _numeros+0
	MOVWF      R0+0
	MOVLW      hi_addr(_numeros+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_readbit_port+0
	MOVLW      0
	MOVWF      FARG_readbit_port+1
	MOVF       dado1_cont_L0+0, 0
	MOVWF      FARG_readbit_bit1+0
	CALL       _readbit+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_dado15
;dados.c,73 :: 		switch (cont)
	GOTO       L_dado16
;dados.c,75 :: 		case 0:
L_dado18:
;dados.c,76 :: 		d11=1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;dados.c,77 :: 		break;
	GOTO       L_dado17
;dados.c,78 :: 		case 1:
L_dado19:
;dados.c,79 :: 		d12=1;
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;dados.c,80 :: 		break;
	GOTO       L_dado17
;dados.c,81 :: 		case 2:
L_dado110:
;dados.c,82 :: 		d13=1;
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
;dados.c,83 :: 		break;
	GOTO       L_dado17
;dados.c,84 :: 		case 3:
L_dado111:
;dados.c,85 :: 		d14=1;
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
;dados.c,86 :: 		break;
	GOTO       L_dado17
;dados.c,87 :: 		case 4:
L_dado112:
;dados.c,88 :: 		d15=1;
	BSF        RA6_bit+0, BitPos(RA6_bit+0)
;dados.c,89 :: 		break;
	GOTO       L_dado17
;dados.c,90 :: 		case 5:
L_dado113:
;dados.c,91 :: 		d16=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;dados.c,92 :: 		break;
	GOTO       L_dado17
;dados.c,94 :: 		case 6:
L_dado114:
;dados.c,95 :: 		d17=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;dados.c,96 :: 		break;
	GOTO       L_dado17
;dados.c,100 :: 		}// fin del switch
L_dado16:
	MOVF       dado1_cont_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dado18
	MOVF       dado1_cont_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dado19
	MOVF       dado1_cont_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dado110
	MOVF       dado1_cont_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dado111
	MOVF       dado1_cont_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dado112
	MOVF       dado1_cont_L0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dado113
	MOVF       dado1_cont_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dado114
L_dado17:
;dados.c,103 :: 		}
L_dado15:
;dados.c,69 :: 		for (cont=0;cont<=6;cont++)
	INCF       dado1_cont_L0+0, 1
;dados.c,104 :: 		}
	GOTO       L_dado12
L_dado13:
;dados.c,106 :: 		}
L_end_dado1:
	RETURN
; end of _dado1

_dado2:

;dados.c,108 :: 		void dado2(char num)
;dados.c,112 :: 		borrado2();
	CALL       _borrado2+0
;dados.c,114 :: 		for (cont=0;cont<=6;cont++)
	CLRF       dado2_cont_L0+0
L_dado215:
	MOVF       dado2_cont_L0+0, 0
	SUBLW      6
	BTFSS      STATUS+0, 0
	GOTO       L_dado216
;dados.c,116 :: 		if (readbit(numeros[num],cont)==1)
	MOVF       FARG_dado2_num+0, 0
	ADDLW      _numeros+0
	MOVWF      R0+0
	MOVLW      hi_addr(_numeros+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_readbit_port+0
	MOVLW      0
	MOVWF      FARG_readbit_port+1
	MOVF       dado2_cont_L0+0, 0
	MOVWF      FARG_readbit_bit1+0
	CALL       _readbit+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_dado218
;dados.c,118 :: 		switch (cont)
	GOTO       L_dado219
;dados.c,120 :: 		case 0:
L_dado221:
;dados.c,121 :: 		d21=1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;dados.c,122 :: 		break;
	GOTO       L_dado220
;dados.c,123 :: 		case 1:
L_dado222:
;dados.c,124 :: 		d22=1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;dados.c,125 :: 		break;
	GOTO       L_dado220
;dados.c,126 :: 		case 2:
L_dado223:
;dados.c,127 :: 		d23=1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;dados.c,128 :: 		break;
	GOTO       L_dado220
;dados.c,129 :: 		case 3:
L_dado224:
;dados.c,130 :: 		d24=1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;dados.c,131 :: 		break;
	GOTO       L_dado220
;dados.c,132 :: 		case 4:
L_dado225:
;dados.c,133 :: 		d25=1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;dados.c,134 :: 		break;
	GOTO       L_dado220
;dados.c,135 :: 		case 5:
L_dado226:
;dados.c,136 :: 		d26=1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;dados.c,137 :: 		break;
	GOTO       L_dado220
;dados.c,139 :: 		case 6:
L_dado227:
;dados.c,140 :: 		d27=1;
	BSF        RA7_bit+0, BitPos(RA7_bit+0)
;dados.c,141 :: 		break;
	GOTO       L_dado220
;dados.c,145 :: 		}// fin del switch
L_dado219:
	MOVF       dado2_cont_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dado221
	MOVF       dado2_cont_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dado222
	MOVF       dado2_cont_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dado223
	MOVF       dado2_cont_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dado224
	MOVF       dado2_cont_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dado225
	MOVF       dado2_cont_L0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dado226
	MOVF       dado2_cont_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dado227
L_dado220:
;dados.c,148 :: 		}
L_dado218:
;dados.c,114 :: 		for (cont=0;cont<=6;cont++)
	INCF       dado2_cont_L0+0, 1
;dados.c,149 :: 		}
	GOTO       L_dado215
L_dado216:
;dados.c,151 :: 		}
L_end_dado2:
	RETURN
; end of _dado2

_map1:

;dados.c,154 :: 		float map1(float x, float in_min, float in_max, float out_min, float out_max)
;dados.c,158 :: 		pendiente=(out_max - out_min) / (in_max - in_min);
	MOVF       FARG_map1_out_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_out_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_out_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_out_min+3, 0
	MOVWF      R4+3
	MOVF       FARG_map1_out_max+0, 0
	MOVWF      R0+0
	MOVF       FARG_map1_out_max+1, 0
	MOVWF      R0+1
	MOVF       FARG_map1_out_max+2, 0
	MOVWF      R0+2
	MOVF       FARG_map1_out_max+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__map1+0
	MOVF       R0+1, 0
	MOVWF      FLOC__map1+1
	MOVF       R0+2, 0
	MOVWF      FLOC__map1+2
	MOVF       R0+3, 0
	MOVWF      FLOC__map1+3
	MOVF       FARG_map1_in_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_in_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_in_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_in_min+3, 0
	MOVWF      R4+3
	MOVF       FARG_map1_in_max+0, 0
	MOVWF      R0+0
	MOVF       FARG_map1_in_max+1, 0
	MOVWF      R0+1
	MOVF       FARG_map1_in_max+2, 0
	MOVWF      R0+2
	MOVF       FARG_map1_in_max+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__map1+0, 0
	MOVWF      R0+0
	MOVF       FLOC__map1+1, 0
	MOVWF      R0+1
	MOVF       FLOC__map1+2, 0
	MOVWF      R0+2
	MOVF       FLOC__map1+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__map1+0
	MOVF       R0+1, 0
	MOVWF      FLOC__map1+1
	MOVF       R0+2, 0
	MOVWF      FLOC__map1+2
	MOVF       R0+3, 0
	MOVWF      FLOC__map1+3
	MOVF       FARG_map1_in_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_in_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_in_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_in_min+3, 0
	MOVWF      R4+3
	MOVF       FARG_map1_x+0, 0
	MOVWF      R0+0
	MOVF       FARG_map1_x+1, 0
	MOVWF      R0+1
	MOVF       FARG_map1_x+2, 0
	MOVWF      R0+2
	MOVF       FARG_map1_x+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
;dados.c,159 :: 		pendiente=pendiente*(x- in_min);
	MOVF       FLOC__map1+0, 0
	MOVWF      R4+0
	MOVF       FLOC__map1+1, 0
	MOVWF      R4+1
	MOVF       FLOC__map1+2, 0
	MOVWF      R4+2
	MOVF       FLOC__map1+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
;dados.c,160 :: 		pendiente=pendiente+out_min;
	MOVF       FARG_map1_out_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_out_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_out_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_out_min+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
;dados.c,161 :: 		return( pendiente);
;dados.c,162 :: 		}
L_end_map1:
	RETURN
; end of _map1

_random1:

;dados.c,166 :: 		unsigned char random1()
;dados.c,169 :: 		do
L_random128:
;dados.c,171 :: 		srand(tmr0*random_num);
	MOVF       TMR0+0, 0
	MOVWF      R0+0
	MOVF       _random_num+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_srand_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_srand_x+1
	CALL       _srand+0
;dados.c,172 :: 		temp=rand();
	CALL       _rand+0
	CALL       _int2double+0
;dados.c,173 :: 		valor=map1(temp,0,32767,1,7);
	MOVF       R0+0, 0
	MOVWF      FARG_map1_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_map1_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_map1_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_map1_x+3
	CLRF       FARG_map1_in_min+0
	CLRF       FARG_map1_in_min+1
	CLRF       FARG_map1_in_min+2
	CLRF       FARG_map1_in_min+3
	MOVLW      0
	MOVWF      FARG_map1_in_max+0
	MOVLW      254
	MOVWF      FARG_map1_in_max+1
	MOVLW      127
	MOVWF      FARG_map1_in_max+2
	MOVLW      141
	MOVWF      FARG_map1_in_max+3
	MOVLW      0
	MOVWF      FARG_map1_out_min+0
	MOVLW      0
	MOVWF      FARG_map1_out_min+1
	MOVLW      0
	MOVWF      FARG_map1_out_min+2
	MOVLW      127
	MOVWF      FARG_map1_out_min+3
	MOVLW      0
	MOVWF      FARG_map1_out_max+0
	MOVLW      0
	MOVWF      FARG_map1_out_max+1
	MOVLW      96
	MOVWF      FARG_map1_out_max+2
	MOVLW      129
	MOVWF      FARG_map1_out_max+3
	CALL       _map1+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;dados.c,174 :: 		random_num=valor;
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      _random_num+0
;dados.c,175 :: 		}while ( (random_num<1) ||(random_num>6));
	MOVLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_random128
	MOVF       _random_num+0, 0
	SUBLW      6
	BTFSS      STATUS+0, 0
	GOTO       L_random128
L__random153:
;dados.c,177 :: 		return(random_num);
	MOVF       _random_num+0, 0
	MOVWF      R0+0
;dados.c,179 :: 		}
L_end_random1:
	RETURN
; end of _random1

_random2:

;dados.c,181 :: 		unsigned char random2()
;dados.c,184 :: 		do
L_random233:
;dados.c,186 :: 		srand(tmr2*random_num);
	MOVF       TMR2+0, 0
	MOVWF      R0+0
	MOVF       _random_num+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_srand_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_srand_x+1
	CALL       _srand+0
;dados.c,187 :: 		temp=rand();
	CALL       _rand+0
	CALL       _int2double+0
;dados.c,188 :: 		valor=map1(temp,0,32767,1,7);
	MOVF       R0+0, 0
	MOVWF      FARG_map1_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_map1_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_map1_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_map1_x+3
	CLRF       FARG_map1_in_min+0
	CLRF       FARG_map1_in_min+1
	CLRF       FARG_map1_in_min+2
	CLRF       FARG_map1_in_min+3
	MOVLW      0
	MOVWF      FARG_map1_in_max+0
	MOVLW      254
	MOVWF      FARG_map1_in_max+1
	MOVLW      127
	MOVWF      FARG_map1_in_max+2
	MOVLW      141
	MOVWF      FARG_map1_in_max+3
	MOVLW      0
	MOVWF      FARG_map1_out_min+0
	MOVLW      0
	MOVWF      FARG_map1_out_min+1
	MOVLW      0
	MOVWF      FARG_map1_out_min+2
	MOVLW      127
	MOVWF      FARG_map1_out_min+3
	MOVLW      0
	MOVWF      FARG_map1_out_max+0
	MOVLW      0
	MOVWF      FARG_map1_out_max+1
	MOVLW      96
	MOVWF      FARG_map1_out_max+2
	MOVLW      129
	MOVWF      FARG_map1_out_max+3
	CALL       _map1+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;dados.c,189 :: 		random_num=valor;
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      _random_num+0
;dados.c,190 :: 		}while ( (random_num<1) ||(random_num>6));
	MOVLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_random233
	MOVF       _random_num+0, 0
	SUBLW      6
	BTFSS      STATUS+0, 0
	GOTO       L_random233
L__random254:
;dados.c,192 :: 		return(random_num);
	MOVF       _random_num+0, 0
	MOVWF      R0+0
;dados.c,194 :: 		}
L_end_random2:
	RETURN
; end of _random2

_main:

;dados.c,198 :: 		void main()
;dados.c,200 :: 		PCON=0;
	CLRF       PCON+0
;dados.c,201 :: 		OSCF_bit=1; // OSCILAODR INTERNO A 4 MEGAS
	BSF        OSCF_bit+0, BitPos(OSCF_bit+0)
;dados.c,203 :: 		TRISA=0;
	CLRF       TRISA+0
;dados.c,204 :: 		TRISB=0;
	CLRF       TRISB+0
;dados.c,206 :: 		TRISA4_bit=1;
	BSF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;dados.c,207 :: 		TRISA5_bit=1;
	BSF        TRISA5_bit+0, BitPos(TRISA5_bit+0)
;dados.c,209 :: 		PORTA=0;
	CLRF       PORTA+0
;dados.c,210 :: 		PORTB=0;
	CLRF       PORTB+0
;dados.c,213 :: 		T0CS_bit=0; // corre con relo interno
	BCF        T0CS_bit+0, BitPos(T0CS_bit+0)
;dados.c,214 :: 		PSA_bit=0; // preedscaldor asignado al timer 0
	BCF        PSA_bit+0, BitPos(PSA_bit+0)
;dados.c,217 :: 		PS2_bit=0;
	BCF        PS2_bit+0, BitPos(PS2_bit+0)
;dados.c,218 :: 		PS1_bit=0;
	BCF        PS1_bit+0, BitPos(PS1_bit+0)
;dados.c,219 :: 		PS0_bit=0;
	BCF        PS0_bit+0, BitPos(PS0_bit+0)
;dados.c,223 :: 		T2CON=0;
	CLRF       T2CON+0
;dados.c,225 :: 		T2CKPS1_bit=0;
	BCF        T2CKPS1_bit+0, BitPos(T2CKPS1_bit+0)
;dados.c,226 :: 		T2CKPS0_bit=0;
	BCF        T2CKPS0_bit+0, BitPos(T2CKPS0_bit+0)
;dados.c,228 :: 		PR2=255; //
	MOVLW      255
	MOVWF      PR2+0
;dados.c,230 :: 		TMR2ON_bit=1; //prende el timer 2
	BSF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;dados.c,236 :: 		while (1)
L_main38:
;dados.c,240 :: 		if (sw1==0)
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_main40
;dados.c,242 :: 		borrado2();// borra el dado 2
	CALL       _borrado2+0
;dados.c,244 :: 		timer1=TMR0;
	MOVF       TMR0+0, 0
	MOVWF      _timer1+0
;dados.c,246 :: 		for (cuenta=0;cuenta<=10;cuenta++)
	CLRF       _cuenta+0
L_main41:
	MOVF       _cuenta+0, 0
	SUBLW      10
	BTFSS      STATUS+0, 0
	GOTO       L_main42
;dados.c,248 :: 		dado1(random1());
	CALL       _random1+0
	MOVF       R0+0, 0
	MOVWF      FARG_dado1_num+0
	CALL       _dado1+0
;dados.c,249 :: 		Delay_ms(80);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	NOP
;dados.c,246 :: 		for (cuenta=0;cuenta<=10;cuenta++)
	INCF       _cuenta+0, 1
;dados.c,251 :: 		}
	GOTO       L_main41
L_main42:
;dados.c,252 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main45:
	DECFSZ     R13+0, 1
	GOTO       L_main45
	DECFSZ     R12+0, 1
	GOTO       L_main45
	DECFSZ     R11+0, 1
	GOTO       L_main45
;dados.c,255 :: 		}
	GOTO       L_main46
L_main40:
;dados.c,258 :: 		else if (sw2==0)
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_main47
;dados.c,260 :: 		timer1=TMR0;
	MOVF       TMR0+0, 0
	MOVWF      _timer1+0
;dados.c,261 :: 		timer2=TMR2;
	MOVF       TMR2+0, 0
	MOVWF      _timer2+0
;dados.c,263 :: 		for (cuenta=0;cuenta<=10;cuenta++)
	CLRF       _cuenta+0
L_main48:
	MOVF       _cuenta+0, 0
	SUBLW      10
	BTFSS      STATUS+0, 0
	GOTO       L_main49
;dados.c,265 :: 		dado1(random1());
	CALL       _random1+0
	MOVF       R0+0, 0
	MOVWF      FARG_dado1_num+0
	CALL       _dado1+0
;dados.c,266 :: 		dado2(random2());
	CALL       _random2+0
	MOVF       R0+0, 0
	MOVWF      FARG_dado2_num+0
	CALL       _dado2+0
;dados.c,267 :: 		Delay_ms(80);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	NOP
;dados.c,263 :: 		for (cuenta=0;cuenta<=10;cuenta++)
	INCF       _cuenta+0, 1
;dados.c,269 :: 		}
	GOTO       L_main48
L_main49:
;dados.c,271 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main52:
	DECFSZ     R13+0, 1
	GOTO       L_main52
	DECFSZ     R12+0, 1
	GOTO       L_main52
	DECFSZ     R11+0, 1
	GOTO       L_main52
;dados.c,274 :: 		}
L_main47:
L_main46:
;dados.c,278 :: 		}
	GOTO       L_main38
;dados.c,284 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
