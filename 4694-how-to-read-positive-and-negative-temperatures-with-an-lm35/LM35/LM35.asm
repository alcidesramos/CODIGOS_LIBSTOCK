
_floattostr_:

;LM35.c,22 :: 		void floattostr_(float x, unsigned char *str,char precision)
;LM35.c,28 :: 		ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
	MOVF       FARG_floattostr__precision+0, 0
	SUBLW      0
	BTFSS      STATUS+0, 0
	GOTO       L_floattostr_0
	MOVLW      7
	MOVWF      ?FLOC___floattostr_T1+0
	MOVLW      0
	MOVWF      ?FLOC___floattostr_T1+1
	GOTO       L_floattostr_1
L_floattostr_0:
	MOVF       FARG_floattostr__precision+0, 0
	SUBLW      22
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_2
	MOVLW      23
	MOVWF      ?FLOC___floattostr_T3+0
	MOVLW      0
	MOVWF      ?FLOC___floattostr_T3+1
	GOTO       L_floattostr_3
L_floattostr_2:
	MOVF       FARG_floattostr__precision+0, 0
	ADDLW      1
	MOVWF      ?FLOC___floattostr_T3+0
	CLRF       ?FLOC___floattostr_T3+1
	BTFSC      STATUS+0, 0
	INCF       ?FLOC___floattostr_T3+1, 1
L_floattostr_3:
	MOVF       ?FLOC___floattostr_T3+0, 0
	MOVWF      ?FLOC___floattostr_T1+0
	MOVF       ?FLOC___floattostr_T3+1, 0
	MOVWF      ?FLOC___floattostr_T1+1
L_floattostr_1:
	MOVF       ?FLOC___floattostr_T1+0, 0
	MOVWF      floattostr__ndig_L0+0
	MOVF       ?FLOC___floattostr_T1+1, 0
	MOVWF      floattostr__ndig_L0+1
;LM35.c,29 :: 		ie = 0;
	CLRF       floattostr__ie_L0+0
	CLRF       floattostr__ie_L0+1
;LM35.c,31 :: 		if ( x < 0)
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_4
;LM35.c,33 :: 		*str++ = '-';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
;LM35.c,34 :: 		x = -x;
	MOVLW      0
	XORWF      FARG_floattostr__x+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__x+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__x+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__x+3, 1
;LM35.c,35 :: 		}
L_floattostr_4:
;LM35.c,37 :: 		if (x > 0.0) while (x < 1.0)
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R4+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R4+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R4+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R4+3
	CLRF       R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_5
L_floattostr_6:
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_7
;LM35.c,39 :: 		x *= 10.0;                // a la place de =*
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__x+3
;LM35.c,40 :: 		ie--;
	MOVLW      1
	SUBWF      floattostr__ie_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__ie_L0+1, 1
;LM35.c,41 :: 		}
	GOTO       L_floattostr_6
L_floattostr_7:
L_floattostr_5:
;LM35.c,42 :: 		while (x >= 10.0)
L_floattostr_8:
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_9
;LM35.c,44 :: 		x = x/10.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__x+3
;LM35.c,45 :: 		ie++;
	INCF       floattostr__ie_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__ie_L0+1, 1
;LM35.c,46 :: 		}
	GOTO       L_floattostr_8
L_floattostr_9:
;LM35.c,47 :: 		ndig += ie;           // a la place de =+
	MOVF       floattostr__ie_L0+0, 0
	ADDWF      floattostr__ndig_L0+0, 1
	MOVF       floattostr__ie_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      floattostr__ndig_L0+1, 1
;LM35.c,50 :: 		for (y = i = 1; i < ndig; i++)
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
L_floattostr_10:
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_27
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__i_L0+0, 0
L__floattostr_27:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_11
;LM35.c,51 :: 		y = y/10.;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       floattostr__y_L0+0, 0
	MOVWF      R0+0
	MOVF       floattostr__y_L0+1, 0
	MOVWF      R0+1
	MOVF       floattostr__y_L0+2, 0
	MOVWF      R0+2
	MOVF       floattostr__y_L0+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      floattostr__y_L0+0
	MOVF       R0+1, 0
	MOVWF      floattostr__y_L0+1
	MOVF       R0+2, 0
	MOVWF      floattostr__y_L0+2
	MOVF       R0+3, 0
	MOVWF      floattostr__y_L0+3
;LM35.c,50 :: 		for (y = i = 1; i < ndig; i++)
	INCF       floattostr__i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__i_L0+1, 1
;LM35.c,51 :: 		y = y/10.;
	GOTO       L_floattostr_10
L_floattostr_11:
;LM35.c,52 :: 		x += y/2.;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       floattostr__y_L0+0, 0
	MOVWF      R0+0
	MOVF       floattostr__y_L0+1, 0
	MOVWF      R0+1
	MOVF       floattostr__y_L0+2, 0
	MOVWF      R0+2
	MOVF       floattostr__y_L0+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R4+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R4+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R4+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__x+3
;LM35.c,53 :: 		if (x >= 10.0) {x = 1.0; ie++;}
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_13
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
L_floattostr_13:
;LM35.c,54 :: 		if (ie<0)
	MOVLW      128
	XORWF      floattostr__ie_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_28
	MOVLW      0
	SUBWF      floattostr__ie_L0+0, 0
L__floattostr_28:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_14
;LM35.c,56 :: 		*str++ = '0'; *str++ = '.';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
;LM35.c,57 :: 		if (ndig < 0) ie = ie-ndig;
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_29
	MOVLW      0
	SUBWF      floattostr__ndig_L0+0, 0
L__floattostr_29:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_15
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__ie_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__ie_L0+1, 1
	MOVF       floattostr__ndig_L0+1, 0
	SUBWF      floattostr__ie_L0+1, 1
L_floattostr_15:
;LM35.c,58 :: 		for (i = -1; i > ie; i--)  *str++ = '0';
	MOVLW      255
	MOVWF      floattostr__i_L0+0
	MOVLW      255
	MOVWF      floattostr__i_L0+1
L_floattostr_16:
	MOVLW      128
	XORWF      floattostr__ie_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_30
	MOVF       floattostr__i_L0+0, 0
	SUBWF      floattostr__ie_L0+0, 0
L__floattostr_30:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_17
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
	MOVLW      1
	SUBWF      floattostr__i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__i_L0+1, 1
	GOTO       L_floattostr_16
L_floattostr_17:
;LM35.c,59 :: 		}
L_floattostr_14:
;LM35.c,60 :: 		for (i=0; i < ndig; i++)
	CLRF       floattostr__i_L0+0
	CLRF       floattostr__i_L0+1
L_floattostr_19:
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_31
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__i_L0+0, 0
L__floattostr_31:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_20
;LM35.c,62 :: 		k = x;
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      floattostr__k_L0+0
	MOVF       R0+1, 0
	MOVWF      floattostr__k_L0+1
;LM35.c,63 :: 		*str++ = k + '0';
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
;LM35.c,64 :: 		if (i ==  ie ) *str++ = '.';
	MOVF       floattostr__i_L0+1, 0
	XORWF      floattostr__ie_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_32
	MOVF       floattostr__ie_L0+0, 0
	XORWF      floattostr__i_L0+0, 0
L__floattostr_32:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_22
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
L_floattostr_22:
;LM35.c,65 :: 		x -= (y=k);
	MOVF       floattostr__k_L0+0, 0
	MOVWF      R0+0
	MOVF       floattostr__k_L0+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      floattostr__y_L0+0
	MOVF       R0+1, 0
	MOVWF      floattostr__y_L0+1
	MOVF       R0+2, 0
	MOVWF      floattostr__y_L0+2
	MOVF       R0+3, 0
	MOVWF      floattostr__y_L0+3
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FARG_floattostr__x+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__x+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__x+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__x+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__x+3
;LM35.c,66 :: 		x *= 10.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__x+3
;LM35.c,60 :: 		for (i=0; i < ndig; i++)
	INCF       floattostr__i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__i_L0+1, 1
;LM35.c,67 :: 		}
	GOTO       L_floattostr_19
L_floattostr_20:
;LM35.c,68 :: 		*str = '\0';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;LM35.c,69 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_main:

;LM35.c,73 :: 		void main()
;LM35.c,75 :: 		TRISA=0b11;// entradas analogas;
	MOVLW      3
	MOVWF      TRISA+0
;LM35.c,76 :: 		ADC_Init();
	CALL       _ADC_Init+0
;LM35.c,77 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;LM35.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM35.c,80 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM35.c,81 :: 		Lcd_Out(1,1,"   TEMPERATURA=");                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LM35+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,84 :: 		while(1)
L_main23:
;LM35.c,86 :: 		codigo=ADC_Read(0)-ADC_Read(1);// resta los dos canales
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;LM35.c,87 :: 		temperatura=codigo*500.0/1023.0;    // formula para pasar a grados
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temperatura+0
	MOVF       R0+1, 0
	MOVWF      _temperatura+1
	MOVF       R0+2, 0
	MOVWF      _temperatura+2
	MOVF       R0+3, 0
	MOVWF      _temperatura+3
;LM35.c,88 :: 		FloatToStr_(temperatura,texto,1);
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__x+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__str+0
	MOVLW      1
	MOVWF      FARG_floattostr__precision+0
	CALL       _floattostr_+0
;LM35.c,90 :: 		Lcd_Out(2,7,"         ");                 // borra la linea
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LM35+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,91 :: 		Lcd_Out(2,7,texto);                 // escribe la temperatura
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35.c,92 :: 		Lcd_Chr_CP(223);    // signo grados
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;LM35.c,93 :: 		Lcd_Chr_CP('C');   // celcius
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;LM35.c,95 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;LM35.c,99 :: 		}
	GOTO       L_main23
;LM35.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
