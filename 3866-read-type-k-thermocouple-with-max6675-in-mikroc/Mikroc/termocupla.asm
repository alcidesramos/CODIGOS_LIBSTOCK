
_floattostr_:

;termocupla.c,28 :: 		void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
;termocupla.c,34 :: 		largo_n = decimales_+1;
	MOVF       FARG_floattostr__decimales_+0, 0
	ADDLW      1
	MOVWF      floattostr__largo_n_L0+0
	CLRF       floattostr__largo_n_L0+1
	BTFSC      STATUS+0, 0
	INCF       floattostr__largo_n_L0+1, 1
;termocupla.c,35 :: 		largo_entera = 0;
	CLRF       floattostr__largo_entera_L0+0
	CLRF       floattostr__largo_entera_L0+1
;termocupla.c,37 :: 		if ( numero_ < 0)
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_0
;termocupla.c,39 :: 		*cadena_++ = '-';
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;termocupla.c,40 :: 		numero_ = -numero_;
	MOVLW      0
	XORWF      FARG_floattostr__numero_+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__numero_+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+3, 1
;termocupla.c,41 :: 		}
L_floattostr_0:
;termocupla.c,43 :: 		if (numero_ > 0.0) while (numero_ < 1.0)
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R4+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R4+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R4+2
	MOVF       FARG_floattostr__numero_+3, 0
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
	GOTO       L_floattostr_1
L_floattostr_2:
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_3
;termocupla.c,45 :: 		numero_ =numero_* 10.0;
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__numero_+3, 0
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
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
;termocupla.c,46 :: 		largo_entera--;
	MOVLW      1
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
;termocupla.c,47 :: 		}
	GOTO       L_floattostr_2
L_floattostr_3:
L_floattostr_1:
;termocupla.c,50 :: 		while (numero_ >= 10.0)
L_floattostr_4:
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_5
;termocupla.c,52 :: 		numero_ = numero_/10.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
;termocupla.c,53 :: 		largo_entera++;   //sube el largo de la trama por ser deciaml
	INCF       floattostr__largo_entera_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__largo_entera_L0+1, 1
;termocupla.c,54 :: 		}
	GOTO       L_floattostr_4
L_floattostr_5:
;termocupla.c,55 :: 		largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera
	MOVF       floattostr__largo_entera_L0+0, 0
	ADDWF      floattostr__largo_n_L0+0, 1
	MOVF       floattostr__largo_entera_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      floattostr__largo_n_L0+1, 1
;termocupla.c,59 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
	MOVLW      1
	MOVWF      floattostr__cont_for_L0+0
	MOVLW      0
	MOVWF      floattostr__cont_for_L0+1
	MOVLW      0
	MOVWF      floattostr__tempo_float_L0+0
	MOVLW      0
	MOVWF      floattostr__tempo_float_L0+1
	MOVLW      0
	MOVWF      floattostr__tempo_float_L0+2
	MOVLW      127
	MOVWF      floattostr__tempo_float_L0+3
L_floattostr_6:
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_25
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_25:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_7
;termocupla.c,60 :: 		tempo_float = tempo_float/10.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       floattostr__tempo_float_L0+0, 0
	MOVWF      R0+0
	MOVF       floattostr__tempo_float_L0+1, 0
	MOVWF      R0+1
	MOVF       floattostr__tempo_float_L0+2, 0
	MOVWF      R0+2
	MOVF       floattostr__tempo_float_L0+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      floattostr__tempo_float_L0+0
	MOVF       R0+1, 0
	MOVWF      floattostr__tempo_float_L0+1
	MOVF       R0+2, 0
	MOVWF      floattostr__tempo_float_L0+2
	MOVF       R0+3, 0
	MOVWF      floattostr__tempo_float_L0+3
;termocupla.c,59 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;termocupla.c,60 :: 		tempo_float = tempo_float/10.0;
	GOTO       L_floattostr_6
L_floattostr_7:
;termocupla.c,61 :: 		numero_ += tempo_float/2.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       floattostr__tempo_float_L0+0, 0
	MOVWF      R0+0
	MOVF       floattostr__tempo_float_L0+1, 0
	MOVWF      R0+1
	MOVF       floattostr__tempo_float_L0+2, 0
	MOVWF      R0+2
	MOVF       floattostr__tempo_float_L0+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R4+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R4+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R4+2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
;termocupla.c,62 :: 		if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
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
	GOTO       L_floattostr_9
	MOVLW      0
	MOVWF      FARG_floattostr__numero_+0
	MOVLW      0
	MOVWF      FARG_floattostr__numero_+1
	MOVLW      0
	MOVWF      FARG_floattostr__numero_+2
	MOVLW      127
	MOVWF      FARG_floattostr__numero_+3
	INCF       floattostr__largo_entera_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__largo_entera_L0+1, 1
L_floattostr_9:
;termocupla.c,64 :: 		if (largo_entera<0)
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_26
	MOVLW      0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_26:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_10
;termocupla.c,66 :: 		*cadena_++ = '0'; *cadena_++ = '.';
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;termocupla.c,67 :: 		if (largo_n < 0) largo_entera = largo_entera-largo_n;
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_27
	MOVLW      0
	SUBWF      floattostr__largo_n_L0+0, 0
L__floattostr_27:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_11
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
	MOVF       floattostr__largo_n_L0+1, 0
	SUBWF      floattostr__largo_entera_L0+1, 1
L_floattostr_11:
;termocupla.c,68 :: 		for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+0
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+1
L_floattostr_12:
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_28
	MOVF       floattostr__cont_for_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_28:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_13
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
	MOVLW      1
	SUBWF      floattostr__cont_for_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__cont_for_L0+1, 1
	GOTO       L_floattostr_12
L_floattostr_13:
;termocupla.c,69 :: 		}
L_floattostr_10:
;termocupla.c,70 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	CLRF       floattostr__cont_for_L0+0
	CLRF       floattostr__cont_for_L0+1
L_floattostr_15:
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_29
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_29:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_16
;termocupla.c,72 :: 		tempo_int = numero_;
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      floattostr__tempo_int_L0+0
	MOVF       R0+1, 0
	MOVWF      floattostr__tempo_int_L0+1
;termocupla.c,73 :: 		*cadena_++ = tempo_int + 48;  //convierte a ascci
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;termocupla.c,74 :: 		if (cont_for ==  largo_entera ) *cadena_++ = '.';
	MOVF       floattostr__cont_for_L0+1, 0
	XORWF      floattostr__largo_entera_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_30
	MOVF       floattostr__largo_entera_L0+0, 0
	XORWF      floattostr__cont_for_L0+0, 0
L__floattostr_30:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_18
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
L_floattostr_18:
;termocupla.c,75 :: 		numero_ -= (tempo_float=tempo_int);
	MOVF       floattostr__tempo_int_L0+0, 0
	MOVWF      R0+0
	MOVF       floattostr__tempo_int_L0+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      floattostr__tempo_float_L0+0
	MOVF       R0+1, 0
	MOVWF      floattostr__tempo_float_L0+1
	MOVF       R0+2, 0
	MOVWF      floattostr__tempo_float_L0+2
	MOVF       R0+3, 0
	MOVWF      floattostr__tempo_float_L0+3
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0+0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R0+1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R0+2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
;termocupla.c,76 :: 		numero_ = numero_*10.0;
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
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
;termocupla.c,70 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;termocupla.c,77 :: 		}
	GOTO       L_floattostr_15
L_floattostr_16:
;termocupla.c,78 :: 		*cadena_ =0;    //anexa final de linea
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;termocupla.c,79 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_Uart1_write_text_const:

;termocupla.c,80 :: 		void Uart1_write_text_const(const char *info)
;termocupla.c,82 :: 		while(*info) UART1_Write(*info++);
L_Uart1_write_text_const19:
	MOVF       FARG_Uart1_write_text_const_info+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_Uart1_write_text_const_info+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Uart1_write_text_const20
	MOVF       FARG_Uart1_write_text_const_info+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_Uart1_write_text_const_info+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	INCF       FARG_Uart1_write_text_const_info+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Uart1_write_text_const_info+1, 1
	GOTO       L_Uart1_write_text_const19
L_Uart1_write_text_const20:
;termocupla.c,83 :: 		}
L_end_Uart1_write_text_const:
	RETURN
; end of _Uart1_write_text_const

_main:

;termocupla.c,85 :: 		void main()
;termocupla.c,88 :: 		ANSEL=0;
	CLRF       ANSEL+0
;termocupla.c,89 :: 		ANSELH=0;
	CLRF       ANSELH+0
;termocupla.c,91 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;termocupla.c,92 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;termocupla.c,93 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;termocupla.c,94 :: 		Lcd_Out(1,2,"TEMPERATURA=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_termocupla+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;termocupla.c,97 :: 		TRISC6_bit=0;// salida tx
	BCF        TRISC6_bit+0, BitPos(TRISC6_bit+0)
;termocupla.c,98 :: 		TRISC7_bit=1; // entrada rx
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;termocupla.c,99 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;termocupla.c,100 :: 		max6675_init();  //incializa el sensor
	CALL       _max6675_init+0
;termocupla.c,101 :: 		Uart1_write_text_const("INICIANDO\r\n");
	MOVLW      ?lstr_2_termocupla+0
	MOVWF      FARG_Uart1_write_text_const_info+0
	MOVLW      hi_addr(?lstr_2_termocupla+0)
	MOVWF      FARG_Uart1_write_text_const_info+1
	CALL       _Uart1_write_text_const+0
;termocupla.c,103 :: 		while (1)
L_main21:
;termocupla.c,105 :: 		temperatura= max6675_lee(); //lee el sensor
	CALL       _max6675_lee+0
	MOVF       R0+0, 0
	MOVWF      _temperatura+0
	MOVF       R0+1, 0
	MOVWF      _temperatura+1
	MOVF       R0+2, 0
	MOVWF      _temperatura+2
	MOVF       R0+3, 0
	MOVWF      _temperatura+3
;termocupla.c,106 :: 		FloatToStr_(temperatura, texto,2);
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      2
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;termocupla.c,107 :: 		Uart1_write_text_const("TEMPERATURA=");
	MOVLW      ?lstr_3_termocupla+0
	MOVWF      FARG_Uart1_write_text_const_info+0
	MOVLW      hi_addr(?lstr_3_termocupla+0)
	MOVWF      FARG_Uart1_write_text_const_info+1
	CALL       _Uart1_write_text_const+0
;termocupla.c,108 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;termocupla.c,109 :: 		Uart1_write_text_const("\r\n");
	MOVLW      ?lstr_4_termocupla+0
	MOVWF      FARG_Uart1_write_text_const_info+0
	MOVLW      hi_addr(?lstr_4_termocupla+0)
	MOVWF      FARG_Uart1_write_text_const_info+1
	CALL       _Uart1_write_text_const+0
;termocupla.c,110 :: 		Lcd_Out(2,7,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;termocupla.c,111 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;termocupla.c,117 :: 		}
	GOTO       L_main21
;termocupla.c,120 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
