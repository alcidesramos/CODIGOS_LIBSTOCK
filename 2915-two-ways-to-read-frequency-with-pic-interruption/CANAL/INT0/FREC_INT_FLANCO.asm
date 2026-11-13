
_interrpcion:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;FREC_INT_FLANCO.c,23 :: 		void interrpcion() iv 0x0004 ics ICS_AUTO
;FREC_INT_FLANCO.c,26 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrpcion0
;FREC_INT_FLANCO.c,28 :: 		TMR1ON_bit=0;  //para el conteo del timer
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;FREC_INT_FLANCO.c,29 :: 		contador=(TMR1H<<8)| TMR1L;  // arma los 16 bits del timer en contador
	MOVF       TMR1H+0, 0
	MOVWF      _contador+1
	CLRF       _contador+0
	MOVF       TMR1L+0, 0
	IORWF      _contador+0, 1
	MOVLW      0
	IORWF      _contador+1, 1
;FREC_INT_FLANCO.c,30 :: 		flag_cero=1;
	MOVLW      1
	MOVWF      _flag_cero+0
;FREC_INT_FLANCO.c,31 :: 		TMR1H=0;
	CLRF       TMR1H+0
;FREC_INT_FLANCO.c,32 :: 		TMR1L=0;
	CLRF       TMR1L+0
;FREC_INT_FLANCO.c,33 :: 		TMR1ON_bit=1;  //para el conteo del timer
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;FREC_INT_FLANCO.c,35 :: 		}
L_interrpcion0:
;FREC_INT_FLANCO.c,37 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;FREC_INT_FLANCO.c,39 :: 		}
L_end_interrpcion:
L__interrpcion26:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrpcion

_floattostr_:

;FREC_INT_FLANCO.c,41 :: 		void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
;FREC_INT_FLANCO.c,47 :: 		largo_n = decimales_+1;
	MOVF       FARG_floattostr__decimales_+0, 0
	ADDLW      1
	MOVWF      floattostr__largo_n_L0+0
	CLRF       floattostr__largo_n_L0+1
	BTFSC      STATUS+0, 0
	INCF       floattostr__largo_n_L0+1, 1
;FREC_INT_FLANCO.c,48 :: 		largo_entera = 0;
	CLRF       floattostr__largo_entera_L0+0
	CLRF       floattostr__largo_entera_L0+1
;FREC_INT_FLANCO.c,50 :: 		if ( numero_ < 0)
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
	GOTO       L_floattostr_1
;FREC_INT_FLANCO.c,52 :: 		*cadena_++ = '-';
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;FREC_INT_FLANCO.c,53 :: 		numero_ = -numero_;
	MOVLW      0
	XORWF      FARG_floattostr__numero_+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__numero_+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+3, 1
;FREC_INT_FLANCO.c,54 :: 		}
L_floattostr_1:
;FREC_INT_FLANCO.c,56 :: 		if (numero_ > 0.0) while (numero_ < 1.0)
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
	GOTO       L_floattostr_2
L_floattostr_3:
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
	GOTO       L_floattostr_4
;FREC_INT_FLANCO.c,58 :: 		numero_ =numero_* 10.0;
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
;FREC_INT_FLANCO.c,59 :: 		largo_entera--;
	MOVLW      1
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
;FREC_INT_FLANCO.c,60 :: 		}
	GOTO       L_floattostr_3
L_floattostr_4:
L_floattostr_2:
;FREC_INT_FLANCO.c,63 :: 		while (numero_ >= 10.0)
L_floattostr_5:
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
	GOTO       L_floattostr_6
;FREC_INT_FLANCO.c,65 :: 		numero_ = numero_/10.0;
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
;FREC_INT_FLANCO.c,66 :: 		largo_entera++;   //sube el largo de la trama por ser deciaml
	INCF       floattostr__largo_entera_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__largo_entera_L0+1, 1
;FREC_INT_FLANCO.c,67 :: 		}
	GOTO       L_floattostr_5
L_floattostr_6:
;FREC_INT_FLANCO.c,68 :: 		largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera
	MOVF       floattostr__largo_entera_L0+0, 0
	ADDWF      floattostr__largo_n_L0+0, 1
	MOVF       floattostr__largo_entera_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      floattostr__largo_n_L0+1, 1
;FREC_INT_FLANCO.c,72 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
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
L_floattostr_7:
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_28
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_28:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_8
;FREC_INT_FLANCO.c,73 :: 		tempo_float = tempo_float/10.0;
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
;FREC_INT_FLANCO.c,72 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;FREC_INT_FLANCO.c,73 :: 		tempo_float = tempo_float/10.0;
	GOTO       L_floattostr_7
L_floattostr_8:
;FREC_INT_FLANCO.c,74 :: 		numero_ += tempo_float/2.0;
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
;FREC_INT_FLANCO.c,75 :: 		if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
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
	GOTO       L_floattostr_10
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
L_floattostr_10:
;FREC_INT_FLANCO.c,77 :: 		if (largo_entera<0)
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_29
	MOVLW      0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_29:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_11
;FREC_INT_FLANCO.c,79 :: 		*cadena_++ = '0'; *cadena_++ = '.';
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
;FREC_INT_FLANCO.c,80 :: 		if (largo_n < 0) largo_entera = largo_entera-largo_n;
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_30
	MOVLW      0
	SUBWF      floattostr__largo_n_L0+0, 0
L__floattostr_30:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_12
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
	MOVF       floattostr__largo_n_L0+1, 0
	SUBWF      floattostr__largo_entera_L0+1, 1
L_floattostr_12:
;FREC_INT_FLANCO.c,81 :: 		for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+0
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+1
L_floattostr_13:
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_31
	MOVF       floattostr__cont_for_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_31:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_14
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
	MOVLW      1
	SUBWF      floattostr__cont_for_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__cont_for_L0+1, 1
	GOTO       L_floattostr_13
L_floattostr_14:
;FREC_INT_FLANCO.c,82 :: 		}
L_floattostr_11:
;FREC_INT_FLANCO.c,83 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	CLRF       floattostr__cont_for_L0+0
	CLRF       floattostr__cont_for_L0+1
L_floattostr_16:
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_32
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_32:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_17
;FREC_INT_FLANCO.c,85 :: 		tempo_int = numero_;
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
;FREC_INT_FLANCO.c,86 :: 		*cadena_++ = tempo_int + 48;  //convierte a ascci
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;FREC_INT_FLANCO.c,87 :: 		if (cont_for ==  largo_entera ) *cadena_++ = '.';
	MOVF       floattostr__cont_for_L0+1, 0
	XORWF      floattostr__largo_entera_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_33
	MOVF       floattostr__largo_entera_L0+0, 0
	XORWF      floattostr__cont_for_L0+0, 0
L__floattostr_33:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_19
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
L_floattostr_19:
;FREC_INT_FLANCO.c,88 :: 		numero_ -= (tempo_float=tempo_int);
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
;FREC_INT_FLANCO.c,89 :: 		numero_ = numero_*10.0;
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
;FREC_INT_FLANCO.c,83 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;FREC_INT_FLANCO.c,90 :: 		}
	GOTO       L_floattostr_16
L_floattostr_17:
;FREC_INT_FLANCO.c,91 :: 		*cadena_ =0;    //anexa final de linea
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;FREC_INT_FLANCO.c,92 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_main:

;FREC_INT_FLANCO.c,95 :: 		void main()
;FREC_INT_FLANCO.c,99 :: 		INTCON=0b01000000;   // HABILITA INTERRPCIONES DE PERIFERICOS
	MOVLW      64
	MOVWF      INTCON+0
;FREC_INT_FLANCO.c,101 :: 		TRISB.b0=1; //ENTRADA DE FRECUENCIA
	BSF        TRISB+0, 0
;FREC_INT_FLANCO.c,103 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;FREC_INT_FLANCO.c,104 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;FREC_INT_FLANCO.c,105 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;FREC_INT_FLANCO.c,106 :: 		Lcd_Out(1,1,"   FRECUENCIA =");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_FREC_INT_FLANCO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FREC_INT_FLANCO.c,113 :: 		t1con=0;
	CLRF       T1CON+0
;FREC_INT_FLANCO.c,116 :: 		T1CKPS1_bit=0;
	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;FREC_INT_FLANCO.c,117 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;FREC_INT_FLANCO.c,120 :: 		TMR1L=0;
	CLRF       TMR1L+0
;FREC_INT_FLANCO.c,121 :: 		TMR1H=0;
	CLRF       TMR1H+0
;FREC_INT_FLANCO.c,123 :: 		TMR1ON_bit=0;  //timer quieto
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;FREC_INT_FLANCO.c,126 :: 		INTEDG_bit=1;  //interrupcion por flanco de nivel de subida
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;FREC_INT_FLANCO.c,128 :: 		INTF_bit=0;//Limpia la bandera de interrpción.
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;FREC_INT_FLANCO.c,130 :: 		INTE_bit=1;//Habilita la interrupción por cambio de nivel
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;FREC_INT_FLANCO.c,132 :: 		GIE_bit=1;  //Habilita interrupcioes       BIT  7 EL INTCON
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;FREC_INT_FLANCO.c,134 :: 		while (1)
L_main20:
;FREC_INT_FLANCO.c,137 :: 		Lcd_Out(2,5,"                  ");  //muestra pasos timer1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_FREC_INT_FLANCO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FREC_INT_FLANCO.c,138 :: 		if (flag_cero!=0)   frecuencia=(Clock_kHz()*1e3)/(contador*4.0);
	MOVF       _flag_cero+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _contador+0, 0
	MOVWF      R0+0
	MOVF       _contador+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      36
	MOVWF      R0+1
	MOVLW      116
	MOVWF      R0+2
	MOVLW      149
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _frecuencia+0
	MOVF       R0+1, 0
	MOVWF      _frecuencia+1
	MOVF       R0+2, 0
	MOVWF      _frecuencia+2
	MOVF       R0+3, 0
	MOVWF      _frecuencia+3
	GOTO       L_main23
L_main22:
;FREC_INT_FLANCO.c,139 :: 		else    frecuencia=0;
	CLRF       _frecuencia+0
	CLRF       _frecuencia+1
	CLRF       _frecuencia+2
	CLRF       _frecuencia+3
L_main23:
;FREC_INT_FLANCO.c,140 :: 		flag_cero=0;
	CLRF       _flag_cero+0
;FREC_INT_FLANCO.c,141 :: 		FloatToStr_(frecuencia,texto,2);
	MOVF       _frecuencia+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       _frecuencia+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       _frecuencia+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       _frecuencia+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      2
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;FREC_INT_FLANCO.c,142 :: 		Lcd_Out(2,5,texto);  //muestra pasos timer1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FREC_INT_FLANCO.c,143 :: 		Lcd_Out_CP(" HZ");  //muestra pasos timer1
	MOVLW      ?lstr3_FREC_INT_FLANCO+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;FREC_INT_FLANCO.c,144 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
;FREC_INT_FLANCO.c,149 :: 		}
	GOTO       L_main20
;FREC_INT_FLANCO.c,152 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
