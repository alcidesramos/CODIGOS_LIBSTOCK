
_UART1_Write_Text_const:

;open.c,15 :: 		void UART1_Write_Text_const(const char* Text)
;open.c,18 :: 		while(*Text)UART1_Write(*Text++);
L_UART1_Write_Text_const0:
	MOVF       FARG_UART1_Write_Text_const_Text+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_UART1_Write_Text_const_Text+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_UART1_Write_Text_const1
	MOVF       FARG_UART1_Write_Text_const_Text+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_UART1_Write_Text_const_Text+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	INCF       FARG_UART1_Write_Text_const_Text+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_UART1_Write_Text_const_Text+1, 1
	GOTO       L_UART1_Write_Text_const0
L_UART1_Write_Text_const1:
;open.c,19 :: 		}
L_end_UART1_Write_Text_const:
	RETURN
; end of _UART1_Write_Text_const

_INTERRPCION:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;open.c,21 :: 		void INTERRPCION() iv 0x0004 ics ICS_AUTO
;open.c,24 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_INTERRPCION2
;open.c,27 :: 		TMR1ON_bit=0;  //para el conteo del timer
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;open.c,28 :: 		contador=(TMR1H<<8)| TMR1L;  // arma los 16 bits del timer en contador
	MOVF       TMR1H+0, 0
	MOVWF      _contador+1
	CLRF       _contador+0
	MOVF       TMR1L+0, 0
	IORWF      _contador+0, 1
	MOVLW      0
	IORWF      _contador+1, 1
;open.c,29 :: 		flag_cero=1;
	MOVLW      1
	MOVWF      _flag_cero+0
;open.c,30 :: 		TMR1H=0;
	CLRF       TMR1H+0
;open.c,31 :: 		TMR1L=0;
	CLRF       TMR1L+0
;open.c,32 :: 		TMR1ON_bit=1;  //para el conteo del timer
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;open.c,34 :: 		}
L_INTERRPCION2:
;open.c,36 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;open.c,38 :: 		}
L_end_INTERRPCION:
L__INTERRPCION30:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _INTERRPCION

_floattostr_:

;open.c,39 :: 		void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
;open.c,45 :: 		largo_n = decimales_+1;
	MOVF       FARG_floattostr__decimales_+0, 0
	ADDLW      1
	MOVWF      floattostr__largo_n_L0+0
	CLRF       floattostr__largo_n_L0+1
	BTFSC      STATUS+0, 0
	INCF       floattostr__largo_n_L0+1, 1
;open.c,46 :: 		largo_entera = 0;
	CLRF       floattostr__largo_entera_L0+0
	CLRF       floattostr__largo_entera_L0+1
;open.c,48 :: 		if ( numero_ < 0)
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
	GOTO       L_floattostr_3
;open.c,50 :: 		*cadena_++ = '-';
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;open.c,51 :: 		numero_ = -numero_;
	MOVLW      0
	XORWF      FARG_floattostr__numero_+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__numero_+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+3, 1
;open.c,52 :: 		}
L_floattostr_3:
;open.c,54 :: 		if (numero_ > 0.0) while (numero_ < 1.0)
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
	GOTO       L_floattostr_4
L_floattostr_5:
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
	GOTO       L_floattostr_6
;open.c,56 :: 		numero_ =numero_* 10.0;
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
;open.c,57 :: 		largo_entera--;
	MOVLW      1
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
;open.c,58 :: 		}
	GOTO       L_floattostr_5
L_floattostr_6:
L_floattostr_4:
;open.c,61 :: 		while (numero_ >= 10.0)
L_floattostr_7:
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
	GOTO       L_floattostr_8
;open.c,63 :: 		numero_ = numero_/10.0;
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
;open.c,64 :: 		largo_entera++;   //sube el largo de la trama por ser deciaml
	INCF       floattostr__largo_entera_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__largo_entera_L0+1, 1
;open.c,65 :: 		}
	GOTO       L_floattostr_7
L_floattostr_8:
;open.c,66 :: 		largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera
	MOVF       floattostr__largo_entera_L0+0, 0
	ADDWF      floattostr__largo_n_L0+0, 1
	MOVF       floattostr__largo_entera_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      floattostr__largo_n_L0+1, 1
;open.c,70 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
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
L_floattostr_9:
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
	GOTO       L_floattostr_10
;open.c,71 :: 		tempo_float = tempo_float/10.0;
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
;open.c,70 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;open.c,71 :: 		tempo_float = tempo_float/10.0;
	GOTO       L_floattostr_9
L_floattostr_10:
;open.c,72 :: 		numero_ += tempo_float/2.0;
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
;open.c,73 :: 		if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
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
	GOTO       L_floattostr_12
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
L_floattostr_12:
;open.c,75 :: 		if (largo_entera<0)
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_33
	MOVLW      0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_33:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_13
;open.c,77 :: 		*cadena_++ = '0'; *cadena_++ = '.';
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
;open.c,78 :: 		if (largo_n < 0) largo_entera = largo_entera-largo_n;
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_34
	MOVLW      0
	SUBWF      floattostr__largo_n_L0+0, 0
L__floattostr_34:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_14
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
	MOVF       floattostr__largo_n_L0+1, 0
	SUBWF      floattostr__largo_entera_L0+1, 1
L_floattostr_14:
;open.c,79 :: 		for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+0
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+1
L_floattostr_15:
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_35
	MOVF       floattostr__cont_for_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_35:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_16
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
	MOVLW      1
	SUBWF      floattostr__cont_for_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__cont_for_L0+1, 1
	GOTO       L_floattostr_15
L_floattostr_16:
;open.c,80 :: 		}
L_floattostr_13:
;open.c,81 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	CLRF       floattostr__cont_for_L0+0
	CLRF       floattostr__cont_for_L0+1
L_floattostr_18:
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_36
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_36:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_19
;open.c,83 :: 		tempo_int = numero_;
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
;open.c,84 :: 		*cadena_++ = tempo_int + 48;  //convierte a ascci
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;open.c,85 :: 		if (cont_for ==  largo_entera ) *cadena_++ = '.';
	MOVF       floattostr__cont_for_L0+1, 0
	XORWF      floattostr__largo_entera_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_37
	MOVF       floattostr__largo_entera_L0+0, 0
	XORWF      floattostr__cont_for_L0+0, 0
L__floattostr_37:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_21
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
L_floattostr_21:
;open.c,86 :: 		numero_ -= (tempo_float=tempo_int);
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
;open.c,87 :: 		numero_ = numero_*10.0;
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
;open.c,81 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;open.c,88 :: 		}
	GOTO       L_floattostr_18
L_floattostr_19:
;open.c,89 :: 		*cadena_ =0;    //anexa final de linea
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;open.c,90 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_pid:

;open.c,102 :: 		void pid(float pid_in)
;open.c,109 :: 		error=set_point-pid_in;
	MOVF       FARG_pid_pid_in+0, 0
	MOVWF      R4+0
	MOVF       FARG_pid_pid_in+1, 0
	MOVWF      R4+1
	MOVF       FARG_pid_pid_in+2, 0
	MOVWF      R4+2
	MOVF       FARG_pid_pid_in+3, 0
	MOVWF      R4+3
	MOVF       _set_point+0, 0
	MOVWF      R0+0
	MOVF       _set_point+1, 0
	MOVWF      R0+1
	MOVF       _set_point+2, 0
	MOVWF      R0+2
	MOVF       _set_point+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__pid+0
	MOVF       R0+1, 0
	MOVWF      FLOC__pid+1
	MOVF       R0+2, 0
	MOVWF      FLOC__pid+2
	MOVF       R0+3, 0
	MOVWF      FLOC__pid+3
	MOVF       FLOC__pid+0, 0
	MOVWF      _error+0
	MOVF       FLOC__pid+1, 0
	MOVWF      _error+1
	MOVF       FLOC__pid+2, 0
	MOVWF      _error+2
	MOVF       FLOC__pid+3, 0
	MOVWF      _error+3
;open.c,110 :: 		up=kp*error;
	MOVF       _kp+0, 0
	MOVWF      R0+0
	MOVF       _kp+1, 0
	MOVWF      R0+1
	MOVF       _kp+2, 0
	MOVWF      R0+2
	MOVF       _kp+3, 0
	MOVWF      R0+3
	MOVF       FLOC__pid+0, 0
	MOVWF      R4+0
	MOVF       FLOC__pid+1, 0
	MOVWF      R4+1
	MOVF       FLOC__pid+2, 0
	MOVWF      R4+2
	MOVF       FLOC__pid+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__pid+8
	MOVF       R0+1, 0
	MOVWF      FLOC__pid+9
	MOVF       R0+2, 0
	MOVWF      FLOC__pid+10
	MOVF       R0+3, 0
	MOVWF      FLOC__pid+11
	MOVF       FLOC__pid+8, 0
	MOVWF      _up+0
	MOVF       FLOC__pid+9, 0
	MOVWF      _up+1
	MOVF       FLOC__pid+10, 0
	MOVWF      _up+2
	MOVF       FLOC__pid+11, 0
	MOVWF      _up+3
;open.c,111 :: 		ui=ui_ + (ki*t_muestreo*error);
	MOVF       _ki+0, 0
	MOVWF      R0+0
	MOVF       _ki+1, 0
	MOVWF      R0+1
	MOVF       _ki+2, 0
	MOVWF      R0+2
	MOVF       _ki+3, 0
	MOVWF      R0+3
	MOVF       FLOC__pid+0, 0
	MOVWF      R4+0
	MOVF       FLOC__pid+1, 0
	MOVWF      R4+1
	MOVF       FLOC__pid+2, 0
	MOVWF      R4+2
	MOVF       FLOC__pid+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       _ui_+0, 0
	MOVWF      R4+0
	MOVF       _ui_+1, 0
	MOVWF      R4+1
	MOVF       _ui_+2, 0
	MOVWF      R4+2
	MOVF       _ui_+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__pid+4
	MOVF       R0+1, 0
	MOVWF      FLOC__pid+5
	MOVF       R0+2, 0
	MOVWF      FLOC__pid+6
	MOVF       R0+3, 0
	MOVWF      FLOC__pid+7
	MOVF       FLOC__pid+4, 0
	MOVWF      _ui+0
	MOVF       FLOC__pid+5, 0
	MOVWF      _ui+1
	MOVF       FLOC__pid+6, 0
	MOVWF      _ui+2
	MOVF       FLOC__pid+7, 0
	MOVWF      _ui+3
;open.c,112 :: 		ud=kd*(error-error_)/t_muestreo;
	MOVF       _error_+0, 0
	MOVWF      R4+0
	MOVF       _error_+1, 0
	MOVWF      R4+1
	MOVF       _error_+2, 0
	MOVWF      R4+2
	MOVF       _error_+3, 0
	MOVWF      R4+3
	MOVF       FLOC__pid+0, 0
	MOVWF      R0+0
	MOVF       FLOC__pid+1, 0
	MOVWF      R0+1
	MOVF       FLOC__pid+2, 0
	MOVWF      R0+2
	MOVF       FLOC__pid+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       _kd+0, 0
	MOVWF      R4+0
	MOVF       _kd+1, 0
	MOVWF      R4+1
	MOVF       _kd+2, 0
	MOVWF      R4+2
	MOVF       _kd+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__pid+0
	MOVF       R0+1, 0
	MOVWF      FLOC__pid+1
	MOVF       R0+2, 0
	MOVWF      FLOC__pid+2
	MOVF       R0+3, 0
	MOVWF      FLOC__pid+3
	MOVF       FLOC__pid+0, 0
	MOVWF      _ud+0
	MOVF       FLOC__pid+1, 0
	MOVWF      _ud+1
	MOVF       FLOC__pid+2, 0
	MOVWF      _ud+2
	MOVF       FLOC__pid+3, 0
	MOVWF      _ud+3
;open.c,113 :: 		ut=up+ui+ud;
	MOVF       FLOC__pid+8, 0
	MOVWF      R0+0
	MOVF       FLOC__pid+9, 0
	MOVWF      R0+1
	MOVF       FLOC__pid+10, 0
	MOVWF      R0+2
	MOVF       FLOC__pid+11, 0
	MOVWF      R0+3
	MOVF       FLOC__pid+4, 0
	MOVWF      R4+0
	MOVF       FLOC__pid+5, 0
	MOVWF      R4+1
	MOVF       FLOC__pid+6, 0
	MOVWF      R4+2
	MOVF       FLOC__pid+7, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       FLOC__pid+0, 0
	MOVWF      R4+0
	MOVF       FLOC__pid+1, 0
	MOVWF      R4+1
	MOVF       FLOC__pid+2, 0
	MOVWF      R4+2
	MOVF       FLOC__pid+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _ut+0
	MOVF       R0+1, 0
	MOVWF      _ut+1
	MOVF       R0+2, 0
	MOVWF      _ut+2
	MOVF       R0+3, 0
	MOVWF      _ut+3
;open.c,114 :: 		if (ut>max_x) ut=max_x;
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
	MOVLW      0
	MOVWF      R0+1
	MOVLW      127
	MOVWF      R0+2
	MOVLW      134
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_pid22
	MOVLW      0
	MOVWF      _ut+0
	MOVLW      0
	MOVWF      _ut+1
	MOVLW      127
	MOVWF      _ut+2
	MOVLW      134
	MOVWF      _ut+3
L_pid22:
;open.c,115 :: 		if (ut<min_x) ut=min_x;
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _ut+0, 0
	MOVWF      R0+0
	MOVF       _ut+1, 0
	MOVWF      R0+1
	MOVF       _ut+2, 0
	MOVWF      R0+2
	MOVF       _ut+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_pid23
	CLRF       _ut+0
	CLRF       _ut+1
	CLRF       _ut+2
	CLRF       _ut+3
L_pid23:
;open.c,116 :: 		ui_=ui;
	MOVF       _ui+0, 0
	MOVWF      _ui_+0
	MOVF       _ui+1, 0
	MOVWF      _ui_+1
	MOVF       _ui+2, 0
	MOVWF      _ui_+2
	MOVF       _ui+3, 0
	MOVWF      _ui_+3
;open.c,117 :: 		error_=error;
	MOVF       _error+0, 0
	MOVWF      _error_+0
	MOVF       _error+1, 0
	MOVWF      _error_+1
	MOVF       _error+2, 0
	MOVWF      _error_+2
	MOVF       _error+3, 0
	MOVWF      _error_+3
;open.c,119 :: 		}
L_end_pid:
	RETURN
; end of _pid

_main:

;open.c,122 :: 		void main()
;open.c,124 :: 		ADCON1=0; // todo loanalogo como analogo
	CLRF       ADCON1+0
;open.c,125 :: 		TRISA=255;
	MOVLW      255
	MOVWF      TRISA+0
;open.c,126 :: 		TRISB=0;
	CLRF       TRISB+0
;open.c,127 :: 		TRISC=0;
	CLRF       TRISC+0
;open.c,129 :: 		TRISB0_bit=1; // ENTRADA RPM
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;open.c,131 :: 		TRISC7_bit=1; // ENTRADA RX
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;open.c,133 :: 		NOT_RBPU_bit=0; //habilita pull up
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;open.c,135 :: 		UART1_Init(19200);
	MOVLW      32
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;open.c,136 :: 		UART1_Write_Text_const("Iniciando");
	MOVLW      ?lstr_1_open+0
	MOVWF      FARG_UART1_Write_Text_const_Text+0
	MOVLW      hi_addr(?lstr_1_open+0)
	MOVWF      FARG_UART1_Write_Text_const_Text+1
	CALL       _UART1_Write_Text_const+0
;open.c,138 :: 		PWM1_Init(620);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      251
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;open.c,139 :: 		PWM1_Set_Duty(0);    //maxima velocidad
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;open.c,140 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;open.c,142 :: 		ADC_Init();
	CALL       _ADC_Init+0
;open.c,145 :: 		INTCON=0b01000000;   // HABILITA INTERRPCIONES DE PERIFERICOS
	MOVLW      64
	MOVWF      INTCON+0
;open.c,152 :: 		t1con=0;
	CLRF       T1CON+0
;open.c,155 :: 		T1CKPS1_bit=1;
	BSF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;open.c,156 :: 		T1CKPS0_bit=1;
	BSF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;open.c,159 :: 		TMR1L=0;
	CLRF       TMR1L+0
;open.c,160 :: 		TMR1H=0;
	CLRF       TMR1H+0
;open.c,162 :: 		TMR1ON_bit=0;  //timer quieto
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;open.c,165 :: 		INTEDG_bit=1;  //interrupcion por flanco de nivel de subida
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;open.c,167 :: 		INTF_bit=0;//Limpia la bandera de interrpción.
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;open.c,169 :: 		INTE_bit=1;//Habilita la interrupción por cambio de nivel
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;open.c,171 :: 		GIE_bit=1;  //Habilita interrupcioes       BIT  7 EL INTCON
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;open.c,176 :: 		while (1)
L_main24:
;open.c,180 :: 		codigo=ADC_Get_Sample(0);   //   0 -1023
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;open.c,181 :: 		set_point= 0.0635*codigo + 5.0;;  // set point en ranfo de la frecuancia min y max 5 -70
	CALL       _word2double+0
	MOVLW      74
	MOVWF      R4+0
	MOVLW      12
	MOVWF      R4+1
	MOVLW      2
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _set_point+0
	MOVF       R0+1, 0
	MOVWF      _set_point+1
	MOVF       R0+2, 0
	MOVWF      _set_point+2
	MOVF       R0+3, 0
	MOVWF      _set_point+3
;open.c,185 :: 		if (flag_cero!=0)   frecuencia=(Clock_kHz()*1e3)/(8.0*contador*4.0);  //8.0 ES EL PREESCALADOR
	MOVF       _flag_cero+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main26
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
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
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
	MOVLW      128
	MOVWF      R0+0
	MOVLW      150
	MOVWF      R0+1
	MOVLW      24
	MOVWF      R0+2
	MOVLW      150
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
L_main26:
;open.c,187 :: 		flag_cero=0;
	CLRF       _flag_cero+0
;open.c,188 :: 		pid(frecuencia);
	MOVF       _frecuencia+0, 0
	MOVWF      FARG_pid_pid_in+0
	MOVF       _frecuencia+1, 0
	MOVWF      FARG_pid_pid_in+1
	MOVF       _frecuencia+2, 0
	MOVWF      FARG_pid_pid_in+2
	MOVF       _frecuencia+3, 0
	MOVWF      FARG_pid_pid_in+3
	CALL       _pid+0
;open.c,189 :: 		salida=ut;
	MOVF       _ut+0, 0
	MOVWF      R0+0
	MOVF       _ut+1, 0
	MOVWF      R0+1
	MOVF       _ut+2, 0
	MOVWF      R0+2
	MOVF       _ut+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
;open.c,191 :: 		PWM1_Set_Duty(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;open.c,202 :: 		FloatToStr_(set_point,texto,2);
	MOVF       _set_point+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       _set_point+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       _set_point+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       _set_point+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      2
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;open.c,203 :: 		UART1_Write_Text_const("SP=") ;
	MOVLW      ?lstr_2_open+0
	MOVWF      FARG_UART1_Write_Text_const_Text+0
	MOVLW      hi_addr(?lstr_2_open+0)
	MOVWF      FARG_UART1_Write_Text_const_Text+1
	CALL       _UART1_Write_Text_const+0
;open.c,204 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;open.c,205 :: 		UART1_Write('/');
	MOVLW      47
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;open.c,206 :: 		FloatToStr_(frecuencia,texto,2);
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
;open.c,207 :: 		UART1_Write_Text_const("RPM=");
	MOVLW      ?lstr_3_open+0
	MOVWF      FARG_UART1_Write_Text_const_Text+0
	MOVLW      hi_addr(?lstr_3_open+0)
	MOVWF      FARG_UART1_Write_Text_const_Text+1
	CALL       _UART1_Write_Text_const+0
;open.c,208 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;open.c,209 :: 		UART1_Write('/');
	MOVLW      47
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;open.c,211 :: 		FloatToStr_(salida,texto,2);
	MOVF       _salida+0, 0
	MOVWF      R0+0
	MOVF       _salida+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
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
;open.c,212 :: 		UART1_Write_Text_const("OUT=");
	MOVLW      ?lstr_4_open+0
	MOVWF      FARG_UART1_Write_Text_const_Text+0
	MOVLW      hi_addr(?lstr_4_open+0)
	MOVWF      FARG_UART1_Write_Text_const_Text+1
	CALL       _UART1_Write_Text_const+0
;open.c,213 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;open.c,214 :: 		UART1_Write('/');
	MOVLW      47
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;open.c,215 :: 		UART1_Write_Text_const("\r\n");
	MOVLW      ?lstr_5_open+0
	MOVWF      FARG_UART1_Write_Text_const_Text+0
	MOVLW      hi_addr(?lstr_5_open+0)
	MOVWF      FARG_UART1_Write_Text_const_Text+1
	CALL       _UART1_Write_Text_const+0
;open.c,217 :: 		Delay_ms(80);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
;open.c,222 :: 		}
	GOTO       L_main24
;open.c,225 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
