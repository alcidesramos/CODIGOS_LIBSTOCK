
_LEEBIT:

;ULTRASONICO.c,23 :: 		char LEEBIT (char *port, char bit1)
;ULTRASONICO.c,26 :: 		if ((*port & (1 << bit1))>0) return (1);
	MOVF       FARG_LEEBIT_bit1+0, 0
	MOVWF      R2
	MOVLW      1
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       R2, 0
L__LEEBIT40:
	BTFSC      STATUS+0, 2
	GOTO       L__LEEBIT41
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__LEEBIT40
L__LEEBIT41:
	MOVF       FARG_LEEBIT_port+0, 0
	MOVWF      FSR0L
	MOVF       FARG_LEEBIT_port+1, 0
	MOVWF      FSR0H
	MOVF       R0, 0
	ANDWF      INDF0+0, 0
	MOVWF      R2
	MOVLW      0
	ANDWF      R1, 0
	MOVWF      R3
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      R3, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LEEBIT42
	MOVF       R2, 0
	SUBLW      0
L__LEEBIT42:
	BTFSC      STATUS+0, 0
	GOTO       L_LEEBIT0
	MOVLW      1
	MOVWF      R0
	GOTO       L_end_LEEBIT
L_LEEBIT0:
;ULTRASONICO.c,27 :: 		else return (0);
	CLRF       R0
;ULTRASONICO.c,28 :: 		}
L_end_LEEBIT:
	RETURN
; end of _LEEBIT

_lee_distancia:

;ULTRASONICO.c,31 :: 		float lee_distancia(char *puerto,char pin)  //lee en el pin especificado
;ULTRASONICO.c,37 :: 		disparo=1;
	BSF        LATA5_bit+0, BitPos(LATA5_bit+0)
;ULTRASONICO.c,38 :: 		Delay_us(10);
	MOVLW      26
	MOVWF      R13
L_lee_distancia2:
	DECFSZ     R13, 1
	GOTO       L_lee_distancia2
	NOP
;ULTRASONICO.c,39 :: 		disparo=0;
	BCF        LATA5_bit+0, BitPos(LATA5_bit+0)
;ULTRASONICO.c,42 :: 		TMR1ON_bit=0; //TIMER QUIETO
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ULTRASONICO.c,43 :: 		TMR1L=0;// limpia parte baja
	CLRF       TMR1L+0
;ULTRASONICO.c,44 :: 		TMR1h=0; //limpia parte alta
	CLRF       TMR1H+0
;ULTRASONICO.c,45 :: 		TMR1IF_bit=0; //limpia la bandera de desboradmiento
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;ULTRASONICO.c,46 :: 		TMR1ON_bit=1; //Arranca el timer
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ULTRASONICO.c,48 :: 		while (LEEBIT(puerto,pin)==0)
L_lee_distancia3:
	MOVF       FARG_lee_distancia_puerto+0, 0
	MOVWF      FARG_LEEBIT_port+0
	MOVF       FARG_lee_distancia_puerto+1, 0
	MOVWF      FARG_LEEBIT_port+1
	MOVF       FARG_lee_distancia_pin+0, 0
	MOVWF      FARG_LEEBIT_bit1+0
	CALL       _LEEBIT+0
	MOVF       R0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_lee_distancia4
;ULTRASONICO.c,51 :: 		if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_lee_distancia5
;ULTRASONICO.c,53 :: 		return (-1);// si no hay sensor conectado retorna -1
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      128
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	GOTO       L_end_lee_distancia
;ULTRASONICO.c,55 :: 		}
L_lee_distancia5:
;ULTRASONICO.c,56 :: 		}
	GOTO       L_lee_distancia3
L_lee_distancia4:
;ULTRASONICO.c,58 :: 		TMR1ON_bit=0; //TIMER QUIETO
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ULTRASONICO.c,59 :: 		TMR1L=0;// limpia parte baja
	CLRF       TMR1L+0
;ULTRASONICO.c,60 :: 		TMR1h=0; //limpia parte alta
	CLRF       TMR1H+0
;ULTRASONICO.c,61 :: 		TMR1IF_bit=0; //limpia la bandera de desboradmiento
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;ULTRASONICO.c,62 :: 		TMR1ON_bit=1; //Arranca el timer
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ULTRASONICO.c,64 :: 		while (LEEBIT(puerto,pin)==1)
L_lee_distancia6:
	MOVF       FARG_lee_distancia_puerto+0, 0
	MOVWF      FARG_LEEBIT_port+0
	MOVF       FARG_lee_distancia_puerto+1, 0
	MOVWF      FARG_LEEBIT_port+1
	MOVF       FARG_lee_distancia_pin+0, 0
	MOVWF      FARG_LEEBIT_bit1+0
	CALL       _LEEBIT+0
	MOVF       R0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_lee_distancia7
;ULTRASONICO.c,66 :: 		if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_lee_distancia8
;ULTRASONICO.c,68 :: 		return (0);// si no hay eco
	CLRF       R0
	CLRF       R1
	CLRF       R2
	CLRF       R3
	GOTO       L_end_lee_distancia
;ULTRASONICO.c,70 :: 		}
L_lee_distancia8:
;ULTRASONICO.c,71 :: 		}
	GOTO       L_lee_distancia6
L_lee_distancia7:
;ULTRASONICO.c,73 :: 		TMR1ON_bit=0; //paro timer
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ULTRASONICO.c,74 :: 		contador=(TMR1H <<8) |  TMR1L;   // arma el valor del timer rotando 8 la parte alta y sumando la baja
	MOVF       TMR1H+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       TMR1L+0, 0
	IORWF       R0, 1
	MOVLW      0
	IORWF       R1, 1
	MOVF       R0, 0
	MOVWF      _contador+0
	MOVF       R1, 0
	MOVWF      _contador+1
;ULTRASONICO.c,76 :: 		calculo=(float)contador*0.0343*4.0/(2.0*Frec_real) ; //en cencimetro  //preescaldor =4
	CALL       _word2double+0
	MOVLW      40
	MOVWF      R4
	MOVLW      126
	MOVWF      R5
	MOVLW      12
	MOVWF      R6
	MOVLW      122
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	CALL       _Div_32x32_FP+0
;ULTRASONICO.c,77 :: 		return (calculo);
;ULTRASONICO.c,81 :: 		}
L_end_lee_distancia:
	RETURN
; end of _lee_distancia

_floattostr_:

;ULTRASONICO.c,84 :: 		void floattostr_(float x, unsigned char *str,char precision)
;ULTRASONICO.c,90 :: 		ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
	MOVF       FARG_floattostr__precision+0, 0
	SUBLW      0
	BTFSS      STATUS+0, 0
	GOTO       L_floattostr_9
	MOVLW      7
	MOVWF      ?FLOC___floattostr_T16+0
	MOVLW      0
	MOVWF      ?FLOC___floattostr_T16+1
	GOTO       L_floattostr_10
L_floattostr_9:
	MOVF       FARG_floattostr__precision+0, 0
	SUBLW      22
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_11
	MOVLW      23
	MOVWF      ?FLOC___floattostr_T18+0
	MOVLW      0
	MOVWF      ?FLOC___floattostr_T18+1
	GOTO       L_floattostr_12
L_floattostr_11:
	MOVF       FARG_floattostr__precision+0, 0
	ADDLW      1
	MOVWF      ?FLOC___floattostr_T18+0
	CLRF       ?FLOC___floattostr_T18+1
	MOVLW      0
	ADDWFC     ?FLOC___floattostr_T18+1, 1
L_floattostr_12:
	MOVF       ?FLOC___floattostr_T18+0, 0
	MOVWF      ?FLOC___floattostr_T16+0
	MOVF       ?FLOC___floattostr_T18+1, 0
	MOVWF      ?FLOC___floattostr_T16+1
L_floattostr_10:
	MOVF       ?FLOC___floattostr_T16+0, 0
	MOVWF      floattostr__ndig_L0+0
	MOVF       ?FLOC___floattostr_T16+1, 0
	MOVWF      floattostr__ndig_L0+1
;ULTRASONICO.c,91 :: 		ie = 0;
	CLRF       floattostr__ie_L0+0
	CLRF       floattostr__ie_L0+1
;ULTRASONICO.c,93 :: 		if ( x < 0)
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_13
;ULTRASONICO.c,95 :: 		*str++ = '-';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__str+1, 0
	MOVWF      FSR1H
	MOVLW      45
	MOVWF      INDF1+0
	INCF       FARG_floattostr__str+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__str+1, 1
;ULTRASONICO.c,96 :: 		x = -x;
	MOVLW      0
	XORWF      FARG_floattostr__x+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__x+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__x+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__x+3, 1
;ULTRASONICO.c,97 :: 		}
L_floattostr_13:
;ULTRASONICO.c,99 :: 		if (x > 0.0) while (x < 1.0)
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R4
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R5
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R6
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R7
	CLRF       R0
	CLRF       R1
	CLRF       R2
	CLRF       R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_14
L_floattostr_15:
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_16
;ULTRASONICO.c,101 :: 		x *= 10.0;                // a la place de =*
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
;ULTRASONICO.c,102 :: 		ie--;
	MOVLW      1
	SUBWF      floattostr__ie_L0+0, 1
	MOVLW      0
	SUBWFB     floattostr__ie_L0+1, 1
;ULTRASONICO.c,103 :: 		}
	GOTO       L_floattostr_15
L_floattostr_16:
L_floattostr_14:
;ULTRASONICO.c,104 :: 		while (x >= 10.0)
L_floattostr_17:
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_18
;ULTRASONICO.c,106 :: 		x = x/10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
;ULTRASONICO.c,107 :: 		ie++;
	INCF       floattostr__ie_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__ie_L0+1, 1
;ULTRASONICO.c,108 :: 		}
	GOTO       L_floattostr_17
L_floattostr_18:
;ULTRASONICO.c,109 :: 		ndig += ie;           // a la place de =+
	MOVF       floattostr__ie_L0+0, 0
	ADDWF      floattostr__ndig_L0+0, 1
	MOVF       floattostr__ie_L0+1, 0
	ADDWFC     floattostr__ndig_L0+1, 1
;ULTRASONICO.c,112 :: 		for (y = i = 1; i < ndig; i++)
	MOVLW      1
	MOVWF      floattostr__i_L0+0
	MOVLW      0
	MOVWF      floattostr__i_L0+1
	MOVLW      0
	MOVWF      floattostr__y_L0+0
	MOVLW      0
	MOVWF      floattostr__y_L0+1
	MOVLW      0
	MOVWF      floattostr__y_L0+2
	MOVLW      127
	MOVWF      floattostr__y_L0+3
L_floattostr_19:
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_45
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__i_L0+0, 0
L__floattostr_45:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_20
;ULTRASONICO.c,113 :: 		y = y/10.;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       floattostr__y_L0+0, 0
	MOVWF      R0
	MOVF       floattostr__y_L0+1, 0
	MOVWF      R1
	MOVF       floattostr__y_L0+2, 0
	MOVWF      R2
	MOVF       floattostr__y_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      floattostr__y_L0+0
	MOVF       R1, 0
	MOVWF      floattostr__y_L0+1
	MOVF       R2, 0
	MOVWF      floattostr__y_L0+2
	MOVF       R3, 0
	MOVWF      floattostr__y_L0+3
;ULTRASONICO.c,112 :: 		for (y = i = 1; i < ndig; i++)
	INCF       floattostr__i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__i_L0+1, 1
;ULTRASONICO.c,113 :: 		y = y/10.;
	GOTO       L_floattostr_19
L_floattostr_20:
;ULTRASONICO.c,114 :: 		x += y/2.;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
	MOVWF      R7
	MOVF       floattostr__y_L0+0, 0
	MOVWF      R0
	MOVF       floattostr__y_L0+1, 0
	MOVWF      R1
	MOVF       floattostr__y_L0+2, 0
	MOVWF      R2
	MOVF       floattostr__y_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R4
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R5
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R6
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
;ULTRASONICO.c,115 :: 		if (x >= 10.0) {x = 1.0; ie++;}
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_22
	MOVLW      0
	MOVWF      FARG_floattostr__x+0
	MOVLW      0
	MOVWF      FARG_floattostr__x+1
	MOVLW      0
	MOVWF      FARG_floattostr__x+2
	MOVLW      127
	MOVWF      FARG_floattostr__x+3
	INCF       floattostr__ie_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__ie_L0+1, 1
L_floattostr_22:
;ULTRASONICO.c,116 :: 		if (ie<0)
	MOVLW      128
	XORWF      floattostr__ie_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_46
	MOVLW      0
	SUBWF      floattostr__ie_L0+0, 0
L__floattostr_46:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_23
;ULTRASONICO.c,118 :: 		*str++ = '0'; *str++ = '.';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__str+1, 0
	MOVWF      FSR1H
	MOVLW      48
	MOVWF      INDF1+0
	INCF       FARG_floattostr__str+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__str+1, 1
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__str+1, 0
	MOVWF      FSR1H
	MOVLW      46
	MOVWF      INDF1+0
	INCF       FARG_floattostr__str+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__str+1, 1
;ULTRASONICO.c,119 :: 		if (ndig < 0) ie = ie-ndig;
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_47
	MOVLW      0
	SUBWF      floattostr__ndig_L0+0, 0
L__floattostr_47:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_24
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__ie_L0+0, 1
	MOVF       floattostr__ndig_L0+1, 0
	SUBWFB     floattostr__ie_L0+1, 1
L_floattostr_24:
;ULTRASONICO.c,120 :: 		for (i = -1; i > ie; i--)  *str++ = '0';
	MOVLW      255
	MOVWF      floattostr__i_L0+0
	MOVLW      255
	MOVWF      floattostr__i_L0+1
L_floattostr_25:
	MOVLW      128
	XORWF      floattostr__ie_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_48
	MOVF       floattostr__i_L0+0, 0
	SUBWF      floattostr__ie_L0+0, 0
L__floattostr_48:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_26
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__str+1, 0
	MOVWF      FSR1H
	MOVLW      48
	MOVWF      INDF1+0
	INCF       FARG_floattostr__str+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__str+1, 1
	MOVLW      1
	SUBWF      floattostr__i_L0+0, 1
	MOVLW      0
	SUBWFB     floattostr__i_L0+1, 1
	GOTO       L_floattostr_25
L_floattostr_26:
;ULTRASONICO.c,121 :: 		}
L_floattostr_23:
;ULTRASONICO.c,122 :: 		for (i=0; i < ndig; i++)
	CLRF       floattostr__i_L0+0
	CLRF       floattostr__i_L0+1
L_floattostr_28:
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_49
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__i_L0+0, 0
L__floattostr_49:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_29
;ULTRASONICO.c,124 :: 		k = x;
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R3
	CALL       _double2int+0
	MOVF       R0, 0
	MOVWF      floattostr__k_L0+0
	MOVF       R1, 0
	MOVWF      floattostr__k_L0+1
;ULTRASONICO.c,125 :: 		*str++ = k + '0';
	MOVLW      48
	ADDWF      R0, 1
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__str+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	INCF       FARG_floattostr__str+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__str+1, 1
;ULTRASONICO.c,126 :: 		if (i ==  ie ) *str++ = '.';
	MOVF       floattostr__i_L0+1, 0
	XORWF      floattostr__ie_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_50
	MOVF       floattostr__ie_L0+0, 0
	XORWF      floattostr__i_L0+0, 0
L__floattostr_50:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_31
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__str+1, 0
	MOVWF      FSR1H
	MOVLW      46
	MOVWF      INDF1+0
	INCF       FARG_floattostr__str+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__str+1, 1
L_floattostr_31:
;ULTRASONICO.c,127 :: 		x -= (y=k);
	MOVF       floattostr__k_L0+0, 0
	MOVWF      R0
	MOVF       floattostr__k_L0+1, 0
	MOVWF      R1
	CALL       _int2double+0
	MOVF       R0, 0
	MOVWF      floattostr__y_L0+0
	MOVF       R1, 0
	MOVWF      floattostr__y_L0+1
	MOVF       R2, 0
	MOVWF      floattostr__y_L0+2
	MOVF       R3, 0
	MOVWF      floattostr__y_L0+3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
;ULTRASONICO.c,128 :: 		x *= 10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
;ULTRASONICO.c,122 :: 		for (i=0; i < ndig; i++)
	INCF       floattostr__i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__i_L0+1, 1
;ULTRASONICO.c,129 :: 		}
	GOTO       L_floattostr_28
L_floattostr_29:
;ULTRASONICO.c,130 :: 		*str = '\0';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__str+1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
;ULTRASONICO.c,131 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_main:

;ULTRASONICO.c,135 :: 		void main()
;ULTRASONICO.c,138 :: 		OSCCON=0;
	CLRF       OSCCON+0
;ULTRASONICO.c,139 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;ULTRASONICO.c,141 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;ULTRASONICO.c,142 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;ULTRASONICO.c,145 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;ULTRASONICO.c,146 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;ULTRASONICO.c,147 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;ULTRASONICO.c,148 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;ULTRASONICO.c,151 :: 		SPLLEN_bit=1; //prende el PLL por 4
	BSF        SPLLEN_bit+0, BitPos(SPLLEN_bit+0)
;ULTRASONICO.c,153 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      64
	MOVWF      SPBRG+0
	MOVLW      3
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ULTRASONICO.c,155 :: 		ansela=0;
	CLRF       ANSELA+0
;ULTRASONICO.c,157 :: 		TRISA=0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;ULTRASONICO.c,158 :: 		trisa.b0=0; //salida tx
	BCF        TRISA+0, 0
;ULTRASONICO.c,159 :: 		trisa.b5=0; //salida  pin de trigger o disparo
	BCF        TRISA+0, 5
;ULTRASONICO.c,160 :: 		disparo=0; //inicia en cero el pin de disparo
	BCF        LATA5_bit+0, BitPos(LATA5_bit+0)
;ULTRASONICO.c,163 :: 		T1CON=0;  //limpia registor del timer 1
	CLRF       T1CON+0
;ULTRASONICO.c,166 :: 		T1CKPS1_bit=1;
	BSF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;ULTRASONICO.c,167 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;ULTRASONICO.c,175 :: 		while (1)
L_main32:
;ULTRASONICO.c,177 :: 		distancia=lee_distancia(&porta,eco1);
	MOVLW      PORTA+0
	MOVWF      FARG_lee_distancia_puerto+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_lee_distancia_puerto+1
	MOVLW      1
	MOVWF      FARG_lee_distancia_pin+0
	CALL       _lee_distancia+0
	MOVF       R0, 0
	MOVWF      _distancia+0
	MOVF       R1, 0
	MOVWF      _distancia+1
	MOVF       R2, 0
	MOVWF      _distancia+2
	MOVF       R3, 0
	MOVWF      _distancia+3
;ULTRASONICO.c,178 :: 		FloatToStr_(distancia ,texto,2); // 2 decimales
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__str+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__str+1
	MOVLW      2
	MOVWF      FARG_floattostr__precision+0
	CALL       _floattostr_+0
;ULTRASONICO.c,179 :: 		UART1_Write_Text("Dis1=");
	MOVLW      ?lstr1_ULTRASONICO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_ULTRASONICO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,180 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,181 :: 		UART1_Write('\r'); // enter y final de linea
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ULTRASONICO.c,182 :: 		Delay_ms(50);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main34:
	DECFSZ     R13, 1
	GOTO       L_main34
	DECFSZ     R12, 1
	GOTO       L_main34
	DECFSZ     R11, 1
	GOTO       L_main34
;ULTRASONICO.c,184 :: 		distancia=lee_distancia(&porta,eco2);
	MOVLW      PORTA+0
	MOVWF      FARG_lee_distancia_puerto+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_lee_distancia_puerto+1
	MOVLW      2
	MOVWF      FARG_lee_distancia_pin+0
	CALL       _lee_distancia+0
	MOVF       R0, 0
	MOVWF      _distancia+0
	MOVF       R1, 0
	MOVWF      _distancia+1
	MOVF       R2, 0
	MOVWF      _distancia+2
	MOVF       R3, 0
	MOVWF      _distancia+3
;ULTRASONICO.c,185 :: 		FloatToStr_(distancia ,texto,2); // 2 decimales
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__str+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__str+1
	MOVLW      2
	MOVWF      FARG_floattostr__precision+0
	CALL       _floattostr_+0
;ULTRASONICO.c,186 :: 		UART1_Write_Text("Dis2=");
	MOVLW      ?lstr2_ULTRASONICO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_ULTRASONICO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,187 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,188 :: 		UART1_Write('\r'); // enter y final de linea
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ULTRASONICO.c,189 :: 		Delay_ms(50);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main35:
	DECFSZ     R13, 1
	GOTO       L_main35
	DECFSZ     R12, 1
	GOTO       L_main35
	DECFSZ     R11, 1
	GOTO       L_main35
;ULTRASONICO.c,191 :: 		distancia=lee_distancia(&porta,eco3);
	MOVLW      PORTA+0
	MOVWF      FARG_lee_distancia_puerto+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_lee_distancia_puerto+1
	MOVLW      3
	MOVWF      FARG_lee_distancia_pin+0
	CALL       _lee_distancia+0
	MOVF       R0, 0
	MOVWF      _distancia+0
	MOVF       R1, 0
	MOVWF      _distancia+1
	MOVF       R2, 0
	MOVWF      _distancia+2
	MOVF       R3, 0
	MOVWF      _distancia+3
;ULTRASONICO.c,192 :: 		FloatToStr_(distancia ,texto,2); // 2 decimales
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__str+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__str+1
	MOVLW      2
	MOVWF      FARG_floattostr__precision+0
	CALL       _floattostr_+0
;ULTRASONICO.c,193 :: 		UART1_Write_Text("Dis3=");
	MOVLW      ?lstr3_ULTRASONICO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_ULTRASONICO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,194 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,195 :: 		UART1_Write('\r'); // enter y final de linea
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ULTRASONICO.c,196 :: 		Delay_ms(50);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main36:
	DECFSZ     R13, 1
	GOTO       L_main36
	DECFSZ     R12, 1
	GOTO       L_main36
	DECFSZ     R11, 1
	GOTO       L_main36
;ULTRASONICO.c,200 :: 		distancia=lee_distancia(&porta,eco4);
	MOVLW      PORTA+0
	MOVWF      FARG_lee_distancia_puerto+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_lee_distancia_puerto+1
	MOVLW      4
	MOVWF      FARG_lee_distancia_pin+0
	CALL       _lee_distancia+0
	MOVF       R0, 0
	MOVWF      _distancia+0
	MOVF       R1, 0
	MOVWF      _distancia+1
	MOVF       R2, 0
	MOVWF      _distancia+2
	MOVF       R3, 0
	MOVWF      _distancia+3
;ULTRASONICO.c,201 :: 		FloatToStr_(distancia ,texto,2); // 2 decimales
	MOVF       R0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__x+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__str+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__str+1
	MOVLW      2
	MOVWF      FARG_floattostr__precision+0
	CALL       _floattostr_+0
;ULTRASONICO.c,202 :: 		UART1_Write_Text("Dis4=");
	MOVLW      ?lstr4_ULTRASONICO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr4_ULTRASONICO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,203 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;ULTRASONICO.c,204 :: 		UART1_Write('\r'); // enter y final de linea
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ULTRASONICO.c,205 :: 		Delay_ms(50);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main37:
	DECFSZ     R13, 1
	GOTO       L_main37
	DECFSZ     R12, 1
	GOTO       L_main37
	DECFSZ     R11, 1
	GOTO       L_main37
;ULTRASONICO.c,208 :: 		Delay_ms(500);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_main38:
	DECFSZ     R13, 1
	GOTO       L_main38
	DECFSZ     R12, 1
	GOTO       L_main38
	DECFSZ     R11, 1
	GOTO       L_main38
	NOP
;ULTRASONICO.c,211 :: 		}
	GOTO       L_main32
;ULTRASONICO.c,214 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
