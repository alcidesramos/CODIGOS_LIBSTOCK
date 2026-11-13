
_interrupcion:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;FRec_ccp.c,25 :: 		void interrupcion() iv 0x0004 ics ICS_AUTO
;FRec_ccp.c,27 :: 		if (CCP2IF_bit==1)
	BTFSS      CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
	GOTO       L_interrupcion0
;FRec_ccp.c,29 :: 		TMR1ON_bit=0; //para el timer para capturar dato
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;FRec_ccp.c,30 :: 		frecu=(CCPR2h << 8 ) | CCPR2l;
	MOVF       CCPR2H+0, 0
	MOVWF      _frecu+1
	CLRF       _frecu+0
	MOVF       CCPR2L+0, 0
	IORWF      _frecu+0, 1
	MOVLW      0
	IORWF      _frecu+1, 1
;FRec_ccp.c,31 :: 		flag_frec=1;  //habilita bandera de RPM
	BSF        _flag_frec+0, BitPos(_flag_frec+0)
;FRec_ccp.c,32 :: 		TMR1L=0;
	CLRF       TMR1L+0
;FRec_ccp.c,33 :: 		TMR1h=0;
	CLRF       TMR1H+0
;FRec_ccp.c,34 :: 		TMR1ON_bit=1;  //enciende timer para proximo dato
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;FRec_ccp.c,35 :: 		CCP2IF_bit=0;
	BCF        CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
;FRec_ccp.c,37 :: 		}
L_interrupcion0:
;FRec_ccp.c,40 :: 		}
L_end_interrupcion:
L__interrupcion27:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupcion

_config_captura:

;FRec_ccp.c,42 :: 		void config_captura()
;FRec_ccp.c,44 :: 		trisc.b1=1;  //pin de captura como entrada
	BSF        TRISC+0, 1
;FRec_ccp.c,47 :: 		t1con=0;
	CLRF       T1CON+0
;FRec_ccp.c,50 :: 		T1CKPS1_bit=0;
	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;FRec_ccp.c,51 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;FRec_ccp.c,54 :: 		TMR1L=0;
	CLRF       TMR1L+0
;FRec_ccp.c,55 :: 		TMR1H=0;
	CLRF       TMR1H+0
;FRec_ccp.c,57 :: 		TMR1ON_bit=0;  //timer quieto
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;FRec_ccp.c,60 :: 		CCP2CON=0;
	CLRF       CCP2CON+0
;FRec_ccp.c,63 :: 		CCP2M3_bit=0;
	BCF        CCP2M3_bit+0, BitPos(CCP2M3_bit+0)
;FRec_ccp.c,64 :: 		CCP2M2_bit=1;
	BSF        CCP2M2_bit+0, BitPos(CCP2M2_bit+0)
;FRec_ccp.c,65 :: 		CCP2M1_bit=0;
	BCF        CCP2M1_bit+0, BitPos(CCP2M1_bit+0)
;FRec_ccp.c,66 :: 		CCP2M0_bit=1;
	BSF        CCP2M0_bit+0, BitPos(CCP2M0_bit+0)
;FRec_ccp.c,68 :: 		CCP2IF_bit=0; //limpi la bandera
	BCF        CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
;FRec_ccp.c,69 :: 		CCP2IE_bit=1;  // activa interupcion del modulo ccp2
	BSF        CCP2IE_bit+0, BitPos(CCP2IE_bit+0)
;FRec_ccp.c,71 :: 		}
L_end_config_captura:
	RETURN
; end of _config_captura

_floattostr_:

;FRec_ccp.c,72 :: 		void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
;FRec_ccp.c,78 :: 		largo_n = decimales_+1;
	MOVF       FARG_floattostr__decimales_+0, 0
	ADDLW      1
	MOVWF      floattostr__largo_n_L0+0
	CLRF       floattostr__largo_n_L0+1
	BTFSC      STATUS+0, 0
	INCF       floattostr__largo_n_L0+1, 1
;FRec_ccp.c,79 :: 		largo_entera = 0;
	CLRF       floattostr__largo_entera_L0+0
	CLRF       floattostr__largo_entera_L0+1
;FRec_ccp.c,81 :: 		if ( numero_ < 0)
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
;FRec_ccp.c,83 :: 		*cadena_++ = '-';
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;FRec_ccp.c,84 :: 		numero_ = -numero_;
	MOVLW      0
	XORWF      FARG_floattostr__numero_+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__numero_+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+3, 1
;FRec_ccp.c,85 :: 		}
L_floattostr_1:
;FRec_ccp.c,87 :: 		if (numero_ > 0.0) while (numero_ < 1.0)
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
;FRec_ccp.c,89 :: 		numero_ =numero_* 10.0;
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
;FRec_ccp.c,90 :: 		largo_entera--;
	MOVLW      1
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
;FRec_ccp.c,91 :: 		}
	GOTO       L_floattostr_3
L_floattostr_4:
L_floattostr_2:
;FRec_ccp.c,94 :: 		while (numero_ >= 10.0)
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
;FRec_ccp.c,96 :: 		numero_ = numero_/10.0;
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
;FRec_ccp.c,97 :: 		largo_entera++;   //sube el largo de la trama por ser deciaml
	INCF       floattostr__largo_entera_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__largo_entera_L0+1, 1
;FRec_ccp.c,98 :: 		}
	GOTO       L_floattostr_5
L_floattostr_6:
;FRec_ccp.c,99 :: 		largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera
	MOVF       floattostr__largo_entera_L0+0, 0
	ADDWF      floattostr__largo_n_L0+0, 1
	MOVF       floattostr__largo_entera_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      floattostr__largo_n_L0+1, 1
;FRec_ccp.c,103 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
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
	GOTO       L__floattostr_30
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_30:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_8
;FRec_ccp.c,104 :: 		tempo_float = tempo_float/10.0;
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
;FRec_ccp.c,103 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;FRec_ccp.c,104 :: 		tempo_float = tempo_float/10.0;
	GOTO       L_floattostr_7
L_floattostr_8:
;FRec_ccp.c,105 :: 		numero_ += tempo_float/2.0;
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
;FRec_ccp.c,106 :: 		if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
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
;FRec_ccp.c,108 :: 		if (largo_entera<0)
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_31
	MOVLW      0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_31:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_11
;FRec_ccp.c,110 :: 		*cadena_++ = '0'; *cadena_++ = '.';
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
;FRec_ccp.c,111 :: 		if (largo_n < 0) largo_entera = largo_entera-largo_n;
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_32
	MOVLW      0
	SUBWF      floattostr__largo_n_L0+0, 0
L__floattostr_32:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_12
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__largo_entera_L0+1, 1
	MOVF       floattostr__largo_n_L0+1, 0
	SUBWF      floattostr__largo_entera_L0+1, 1
L_floattostr_12:
;FRec_ccp.c,112 :: 		for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
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
	GOTO       L__floattostr_33
	MOVF       floattostr__cont_for_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_33:
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
;FRec_ccp.c,113 :: 		}
L_floattostr_11:
;FRec_ccp.c,114 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
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
	GOTO       L__floattostr_34
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_34:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_17
;FRec_ccp.c,116 :: 		tempo_int = numero_;
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
;FRec_ccp.c,117 :: 		*cadena_++ = tempo_int + 48;  //convierte a ascci
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
;FRec_ccp.c,118 :: 		if (cont_for ==  largo_entera ) *cadena_++ = '.';
	MOVF       floattostr__cont_for_L0+1, 0
	XORWF      floattostr__largo_entera_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_35
	MOVF       floattostr__largo_entera_L0+0, 0
	XORWF      floattostr__cont_for_L0+0, 0
L__floattostr_35:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_19
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__cadena_+0, 1
L_floattostr_19:
;FRec_ccp.c,119 :: 		numero_ -= (tempo_float=tempo_int);
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
;FRec_ccp.c,120 :: 		numero_ = numero_*10.0;
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
;FRec_ccp.c,114 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;FRec_ccp.c,121 :: 		}
	GOTO       L_floattostr_16
L_floattostr_17:
;FRec_ccp.c,122 :: 		*cadena_ =0;    //anexa final de linea
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;FRec_ccp.c,123 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_main:

;FRec_ccp.c,128 :: 		void main()
;FRec_ccp.c,131 :: 		trisb=0;
	CLRF       TRISB+0
;FRec_ccp.c,132 :: 		trisC=0;
	CLRF       TRISC+0
;FRec_ccp.c,133 :: 		TRISD=0;
	CLRF       TRISD+0
;FRec_ccp.c,134 :: 		trisa=0;
	CLRF       TRISA+0
;FRec_ccp.c,135 :: 		TRISC1_bit=1; //entrada Frec
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;FRec_ccp.c,137 :: 		INTCON = 0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;FRec_ccp.c,138 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;FRec_ccp.c,139 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;FRec_ccp.c,140 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;FRec_ccp.c,141 :: 		Lcd_Out(1,1,"FRECUENCIMETRO");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_FRec_ccp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FRec_ccp.c,143 :: 		config_captura();
	CALL       _config_captura+0
;FRec_ccp.c,144 :: 		CCP2If_bit=0;
	BCF        CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
;FRec_ccp.c,145 :: 		GIE_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;FRec_ccp.c,146 :: 		flag_frec=0;
	BCF        _flag_frec+0, BitPos(_flag_frec+0)
;FRec_ccp.c,148 :: 		while (1)
L_main20:
;FRec_ccp.c,151 :: 		if (flag_frec==1)
	BTFSS      _flag_frec+0, BitPos(_flag_frec+0)
	GOTO       L_main22
;FRec_ccp.c,153 :: 		if (frecu!=0)
	MOVLW      0
	XORWF      _frecu+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      0
	XORWF      _frecu+0, 0
L__main37:
	BTFSC      STATUS+0, 2
	GOTO       L_main23
;FRec_ccp.c,155 :: 		frecuencia=Clock_kHz()*1e3/(frecu*4.0); //convierte a Hercios
	MOVF       _frecu+0, 0
	MOVWF      R0+0
	MOVF       _frecu+1, 0
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
;FRec_ccp.c,156 :: 		frecu=0;
	CLRF       _frecu+0
	CLRF       _frecu+1
;FRec_ccp.c,157 :: 		}
	GOTO       L_main24
L_main23:
;FRec_ccp.c,158 :: 		else frecuencia=0;
	CLRF       _frecuencia+0
	CLRF       _frecuencia+1
	CLRF       _frecuencia+2
	CLRF       _frecuencia+3
L_main24:
;FRec_ccp.c,159 :: 		flag_frec=0;
	BCF        _flag_frec+0, BitPos(_flag_frec+0)
;FRec_ccp.c,160 :: 		}
L_main22:
;FRec_ccp.c,161 :: 		floatToStr_(frecuencia,texto,2);
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
;FRec_ccp.c,162 :: 		Lcd_Out(3,5,"           ");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_FRec_ccp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FRec_ccp.c,164 :: 		Lcd_Out(3,5,texto);
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FRec_ccp.c,165 :: 		Lcd_Out_CP(" HZ");  //muestra pasos timer1
	MOVLW      ?lstr3_FRec_ccp+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;FRec_ccp.c,167 :: 		frecuencia=0;  //coloca en cero por si se quita la señal
	CLRF       _frecuencia+0
	CLRF       _frecuencia+1
	CLRF       _frecuencia+2
	CLRF       _frecuencia+3
;FRec_ccp.c,168 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
;FRec_ccp.c,170 :: 		}
	GOTO       L_main20
;FRec_ccp.c,176 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
