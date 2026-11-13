
_interrpcion:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;NEXTION.c,17 :: 		void interrpcion() iv 0x0004 ics ICS_AUTO
;NEXTION.c,20 :: 		if (RCIF_bit==1)//analiza si hay dato serial
	BTFSS      RCIF_bit+0, BitPos(RCIF_bit+0)
	GOTO       L_interrpcion0
;NEXTION.c,22 :: 		dato=RCREG;  //lee el dato
	MOVF       RCREG+0, 0
	MOVWF      _dato+0
;NEXTION.c,23 :: 		trama[cuenta]=dato;   //lo almcena en el vector
	MOVF       _cuenta+0, 0
	ADDLW      _trama+0
	MOVWF      FSR
	MOVF       _dato+0, 0
	MOVWF      INDF+0
;NEXTION.c,24 :: 		if (( cuenta>3) && ((unsigned char)trama[cuenta]==0xff) && ((unsigned char)trama[cuenta-1]==0xff) && ((unsigned char)trama[cuenta-2]==0xff) )
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSC      STATUS+0, 0
	GOTO       L_interrpcion3
	MOVF       _cuenta+0, 0
	ADDLW      _trama+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_interrpcion3
	MOVLW      1
	SUBWF      _cuenta+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      _trama+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_interrpcion3
	MOVLW      2
	SUBWF      _cuenta+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      _trama+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_interrpcion3
L__interrpcion44:
;NEXTION.c,26 :: 		flag_rx=1;//activa la bandera de que llego trama comple y ista para procesar
	MOVLW      1
	MOVWF      _flag_rx+0
;NEXTION.c,27 :: 		CREN_bit=0;  //DESHABILITA LA RECEPCION CONTINU PARA LIMPIAR BUFFER    Y NO RECIBIR MIENTRA VA A NALIZAR
	BCF        CREN_bit+0, BitPos(CREN_bit+0)
;NEXTION.c,28 :: 		GIE_bit=0;  //deshabilita las interrpciones para poder procesar la trama
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;NEXTION.c,29 :: 		}
L_interrpcion3:
;NEXTION.c,31 :: 		cuenta++;//incrementa contador o puntero del vectro de recibido
	INCF       _cuenta+0, 1
;NEXTION.c,33 :: 		if (cuenta>=30)
	MOVLW      30
	SUBWF      _cuenta+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrpcion4
;NEXTION.c,35 :: 		flag_rx=0;
	CLRF       _flag_rx+0
;NEXTION.c,36 :: 		cuenta=0;
	CLRF       _cuenta+0
;NEXTION.c,37 :: 		}
L_interrpcion4:
;NEXTION.c,39 :: 		RCIF_bit=0;//limpia el bit de interrupcion
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;NEXTION.c,40 :: 		}
L_interrpcion0:
;NEXTION.c,43 :: 		}
L_end_interrpcion:
L__interrpcion46:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrpcion

_procesa_rx:

;NEXTION.c,46 :: 		void procesa_rx()
;NEXTION.c,48 :: 		if (flag_rx==1)//si la bandera de la trama esta activa
	MOVF       _flag_rx+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_procesa_rx5
;NEXTION.c,51 :: 		if ( strstr(trama,"led1=on" ))  led=1;
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr1_NEXTION+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesa_rx6
	BSF        PORTB+0, 0
	GOTO       L_procesa_rx7
L_procesa_rx6:
;NEXTION.c,52 :: 		else  if ( strstr(trama,"led1=off" ))  led=0;
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr2_NEXTION+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesa_rx8
	BCF        PORTB+0, 0
	GOTO       L_procesa_rx9
L_procesa_rx8:
;NEXTION.c,53 :: 		else  if ( strstr(trama,"pw1=" ))
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr3_NEXTION+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesa_rx10
;NEXTION.c,55 :: 		dato=trama[5];   //captura el 5 dato
	MOVF       _trama+5, 0
	MOVWF      _dato+0
;NEXTION.c,56 :: 		PWM1_Set_Duty(dato); //lo saca por pwm
	MOVF       _trama+5, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;NEXTION.c,57 :: 		}
L_procesa_rx10:
L_procesa_rx9:
L_procesa_rx7:
;NEXTION.c,59 :: 		memset(trama,0,30);
	MOVLW      _trama+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      30
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;NEXTION.c,60 :: 		cuenta=0;  //limpia el contador
	CLRF       _cuenta+0
;NEXTION.c,61 :: 		flag_rx=0; //limpia la bandera
	CLRF       _flag_rx+0
;NEXTION.c,62 :: 		RCIF_bit=0; //limpia la bandera de interrpcion
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;NEXTION.c,63 :: 		CREN_bit=1;
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;NEXTION.c,64 :: 		GIE_bit=1; //habilita interrpcion
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;NEXTION.c,65 :: 		}
L_procesa_rx5:
;NEXTION.c,66 :: 		}
L_end_procesa_rx:
	RETURN
; end of _procesa_rx

_floattostr_:

;NEXTION.c,70 :: 		void floattostr_(float x, unsigned char *str,char precision)
;NEXTION.c,76 :: 		ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
	MOVF       FARG_floattostr__precision+0, 0
	SUBLW      0
	BTFSS      STATUS+0, 0
	GOTO       L_floattostr_11
	MOVLW      7
	MOVWF      ?FLOC___floattostr_T38+0
	MOVLW      0
	MOVWF      ?FLOC___floattostr_T38+1
	GOTO       L_floattostr_12
L_floattostr_11:
	MOVF       FARG_floattostr__precision+0, 0
	SUBLW      22
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_13
	MOVLW      23
	MOVWF      ?FLOC___floattostr_T40+0
	MOVLW      0
	MOVWF      ?FLOC___floattostr_T40+1
	GOTO       L_floattostr_14
L_floattostr_13:
	MOVF       FARG_floattostr__precision+0, 0
	ADDLW      1
	MOVWF      ?FLOC___floattostr_T40+0
	CLRF       ?FLOC___floattostr_T40+1
	BTFSC      STATUS+0, 0
	INCF       ?FLOC___floattostr_T40+1, 1
L_floattostr_14:
	MOVF       ?FLOC___floattostr_T40+0, 0
	MOVWF      ?FLOC___floattostr_T38+0
	MOVF       ?FLOC___floattostr_T40+1, 0
	MOVWF      ?FLOC___floattostr_T38+1
L_floattostr_12:
	MOVF       ?FLOC___floattostr_T38+0, 0
	MOVWF      floattostr__ndig_L0+0
	MOVF       ?FLOC___floattostr_T38+1, 0
	MOVWF      floattostr__ndig_L0+1
;NEXTION.c,77 :: 		ie = 0;
	CLRF       floattostr__ie_L0+0
	CLRF       floattostr__ie_L0+1
;NEXTION.c,79 :: 		if ( x < 0)
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
	GOTO       L_floattostr_15
;NEXTION.c,81 :: 		*str++ = '-';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
;NEXTION.c,82 :: 		x = -x;
	MOVLW      0
	XORWF      FARG_floattostr__x+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__x+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__x+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__x+3, 1
;NEXTION.c,83 :: 		}
L_floattostr_15:
;NEXTION.c,85 :: 		if (x > 0.0) while (x < 1.0)
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
	GOTO       L_floattostr_16
L_floattostr_17:
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
	GOTO       L_floattostr_18
;NEXTION.c,87 :: 		x *= 10.0;                // a la place de =*
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
;NEXTION.c,88 :: 		ie--;
	MOVLW      1
	SUBWF      floattostr__ie_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__ie_L0+1, 1
;NEXTION.c,89 :: 		}
	GOTO       L_floattostr_17
L_floattostr_18:
L_floattostr_16:
;NEXTION.c,90 :: 		while (x >= 10.0)
L_floattostr_19:
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
	GOTO       L_floattostr_20
;NEXTION.c,92 :: 		x = x/10.0;
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
;NEXTION.c,93 :: 		ie++;
	INCF       floattostr__ie_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__ie_L0+1, 1
;NEXTION.c,94 :: 		}
	GOTO       L_floattostr_19
L_floattostr_20:
;NEXTION.c,95 :: 		ndig += ie;           // a la place de =+
	MOVF       floattostr__ie_L0+0, 0
	ADDWF      floattostr__ndig_L0+0, 1
	MOVF       floattostr__ie_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      floattostr__ndig_L0+1, 1
;NEXTION.c,98 :: 		for (y = i = 1; i < ndig; i++)
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
L_floattostr_21:
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_49
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__i_L0+0, 0
L__floattostr_49:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_22
;NEXTION.c,99 :: 		y = y/10.;
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
;NEXTION.c,98 :: 		for (y = i = 1; i < ndig; i++)
	INCF       floattostr__i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__i_L0+1, 1
;NEXTION.c,99 :: 		y = y/10.;
	GOTO       L_floattostr_21
L_floattostr_22:
;NEXTION.c,100 :: 		x += y/2.;
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
;NEXTION.c,101 :: 		if (x >= 10.0) {x = 1.0; ie++;}
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
	GOTO       L_floattostr_24
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
L_floattostr_24:
;NEXTION.c,102 :: 		if (ie<0)
	MOVLW      128
	XORWF      floattostr__ie_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_50
	MOVLW      0
	SUBWF      floattostr__ie_L0+0, 0
L__floattostr_50:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_25
;NEXTION.c,104 :: 		*str++ = '0'; *str++ = '.';
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
;NEXTION.c,105 :: 		if (ndig < 0) ie = ie-ndig;
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_51
	MOVLW      0
	SUBWF      floattostr__ndig_L0+0, 0
L__floattostr_51:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_26
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__ie_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__ie_L0+1, 1
	MOVF       floattostr__ndig_L0+1, 0
	SUBWF      floattostr__ie_L0+1, 1
L_floattostr_26:
;NEXTION.c,106 :: 		for (i = -1; i > ie; i--)  *str++ = '0';
	MOVLW      255
	MOVWF      floattostr__i_L0+0
	MOVLW      255
	MOVWF      floattostr__i_L0+1
L_floattostr_27:
	MOVLW      128
	XORWF      floattostr__ie_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_52
	MOVF       floattostr__i_L0+0, 0
	SUBWF      floattostr__ie_L0+0, 0
L__floattostr_52:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_28
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
	MOVLW      1
	SUBWF      floattostr__i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       floattostr__i_L0+1, 1
	GOTO       L_floattostr_27
L_floattostr_28:
;NEXTION.c,107 :: 		}
L_floattostr_25:
;NEXTION.c,108 :: 		for (i=0; i < ndig; i++)
	CLRF       floattostr__i_L0+0
	CLRF       floattostr__i_L0+1
L_floattostr_30:
	MOVLW      128
	XORWF      floattostr__i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      floattostr__ndig_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_53
	MOVF       floattostr__ndig_L0+0, 0
	SUBWF      floattostr__i_L0+0, 0
L__floattostr_53:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_31
;NEXTION.c,110 :: 		k = x;
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
;NEXTION.c,111 :: 		*str++ = k + '0';
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
;NEXTION.c,112 :: 		if (i ==  ie ) *str++ = '.';
	MOVF       floattostr__i_L0+1, 0
	XORWF      floattostr__ie_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_54
	MOVF       floattostr__ie_L0+0, 0
	XORWF      floattostr__i_L0+0, 0
L__floattostr_54:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_33
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
	INCF       FARG_floattostr__str+0, 1
L_floattostr_33:
;NEXTION.c,113 :: 		x -= (y=k);
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
;NEXTION.c,114 :: 		x *= 10.0;
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
;NEXTION.c,108 :: 		for (i=0; i < ndig; i++)
	INCF       floattostr__i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__i_L0+1, 1
;NEXTION.c,115 :: 		}
	GOTO       L_floattostr_30
L_floattostr_31:
;NEXTION.c,116 :: 		*str = '\0';
	MOVF       FARG_floattostr__str+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;NEXTION.c,117 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_manda_serial_const:

;NEXTION.c,119 :: 		void manda_serial_const(const char *info)
;NEXTION.c,121 :: 		while(*info) UART1_Write(*info++);
L_manda_serial_const34:
	MOVF       FARG_manda_serial_const_info+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_manda_serial_const_info+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_manda_serial_const35
	MOVF       FARG_manda_serial_const_info+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_manda_serial_const_info+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	INCF       FARG_manda_serial_const_info+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_manda_serial_const_info+1, 1
	GOTO       L_manda_serial_const34
L_manda_serial_const35:
;NEXTION.c,122 :: 		}
L_end_manda_serial_const:
	RETURN
; end of _manda_serial_const

_main:

;NEXTION.c,128 :: 		void main()
;NEXTION.c,130 :: 		TRISA.B0=1;
	BSF        TRISA+0, 0
;NEXTION.c,131 :: 		TRISA.B1=1;
	BSF        TRISA+0, 1
;NEXTION.c,132 :: 		trisb.b0=0; //salida portb
	BCF        TRISB+0, 0
;NEXTION.c,133 :: 		TRISC.b6=0; //salida pin TX
	BCF        TRISC+0, 6
;NEXTION.c,134 :: 		trisc.b7=1;  // entrada pin RX
	BSF        TRISC+0, 7
;NEXTION.c,135 :: 		trisc.b2=0;  // salida pin PWM
	BCF        TRISC+0, 2
;NEXTION.c,136 :: 		trisb.b1=1; //entrada del switch
	BSF        TRISB+0, 1
;NEXTION.c,137 :: 		adcon1=0;//  3 canalea analogos
	CLRF       ADCON1+0
;NEXTION.c,138 :: 		INTCON=0b01000000;   //bit 6 del intcon en hab interrpciones parciales
	MOVLW      64
	MOVWF      INTCON+0
;NEXTION.c,140 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;NEXTION.c,141 :: 		led=0;
	BCF        PORTB+0, 0
;NEXTION.c,142 :: 		memset(trama,0,30);
	MOVLW      _trama+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      30
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;NEXTION.c,146 :: 		RCIF_bit=0;
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;NEXTION.c,147 :: 		RCIE_bit=1;
	BSF        RCIE_bit+0, BitPos(RCIE_bit+0)
;NEXTION.c,148 :: 		GIE_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;NEXTION.c,151 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;NEXTION.c,152 :: 		PWM1_Set_Duty(100);
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;NEXTION.c,153 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;NEXTION.c,155 :: 		while (1)
L_main36:
;NEXTION.c,157 :: 		codigo=ADC_Read(0);  //lee canal cero
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;NEXTION.c,158 :: 		temperatura=codigo*500.0/1023.0;     //calcula la temperatura
	CALL       _word2double+0
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
;NEXTION.c,161 :: 		codigo=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;NEXTION.c,162 :: 		velocidad=codigo*100.0/1023.0;  //lo pasa de 0 % a 100%
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
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
	MOVWF      _velocidad+0
	MOVF       R0+1, 0
	MOVWF      _velocidad+1
	MOVF       R0+2, 0
	MOVWF      _velocidad+2
	MOVF       R0+3, 0
	MOVWF      _velocidad+3
;NEXTION.c,165 :: 		sprinti(envia,"pa1.te2.val=%d",(unsigned int)temperatura); //arma de una la trama a enviar
	MOVLW      _envia+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_4_NEXTION+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_4_NEXTION+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       _temperatura+0, 0
	MOVWF      R0+0
	MOVF       _temperatura+1, 0
	MOVWF      R0+1
	MOVF       _temperatura+2, 0
	MOVWF      R0+2
	MOVF       _temperatura+3, 0
	MOVWF      R0+3
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       R0+1, 0
	MOVWF      FARG_sprinti_wh+4
	CALL       _sprinti+0
;NEXTION.c,166 :: 		UART1_Write_Text(envia);//envia la trama
	MOVLW      _envia+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;NEXTION.c,168 :: 		manda_serial_const("\xFF\xFF\xFF");
	MOVLW      ?lstr_5_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_5_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
;NEXTION.c,171 :: 		temperatura=0.8654*temperatura + 10.032;
	MOVLW      219
	MOVWF      R0+0
	MOVLW      138
	MOVWF      R0+1
	MOVLW      93
	MOVWF      R0+2
	MOVLW      126
	MOVWF      R0+3
	MOVF       _temperatura+0, 0
	MOVWF      R4+0
	MOVF       _temperatura+1, 0
	MOVWF      R4+1
	MOVF       _temperatura+2, 0
	MOVWF      R4+2
	MOVF       _temperatura+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      18
	MOVWF      R4+0
	MOVLW      131
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temperatura+0
	MOVF       R0+1, 0
	MOVWF      _temperatura+1
	MOVF       R0+2, 0
	MOVWF      _temperatura+2
	MOVF       R0+3, 0
	MOVWF      _temperatura+3
;NEXTION.c,172 :: 		sprinti(envia,"pa1.te1.val=%d",(unsigned int)temperatura);
	MOVLW      _envia+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_6_NEXTION+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_6_NEXTION+0)
	MOVWF      FARG_sprinti_f+1
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       R0+1, 0
	MOVWF      FARG_sprinti_wh+4
	CALL       _sprinti+0
;NEXTION.c,173 :: 		UART1_Write_Text(envia);//envia la trama
	MOVLW      _envia+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;NEXTION.c,174 :: 		manda_serial_const("\xFF\xFF\xFF");
	MOVLW      ?lstr_7_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_7_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
;NEXTION.c,177 :: 		if (velocidad>20) velocidad_grafica=  3.152*velocidad - 65.949;
	MOVF       _velocidad+0, 0
	MOVWF      R4+0
	MOVF       _velocidad+1, 0
	MOVWF      R4+1
	MOVF       _velocidad+2, 0
	MOVWF      R4+2
	MOVF       _velocidad+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      32
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVLW      94
	MOVWF      R0+0
	MOVLW      186
	MOVWF      R0+1
	MOVLW      73
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	MOVF       _velocidad+0, 0
	MOVWF      R4+0
	MOVF       _velocidad+1, 0
	MOVWF      R4+1
	MOVF       _velocidad+2, 0
	MOVWF      R4+2
	MOVF       _velocidad+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      229
	MOVWF      R4+1
	MOVLW      3
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Sub_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _velocidad_grafica+0
	MOVF       R0+1, 0
	MOVWF      _velocidad_grafica+1
	GOTO       L_main39
L_main38:
;NEXTION.c,178 :: 		else  velocidad_grafica= 2.92*velocidad + 298.6;
	MOVLW      72
	MOVWF      R0+0
	MOVLW      225
	MOVWF      R0+1
	MOVLW      58
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	MOVF       _velocidad+0, 0
	MOVWF      R4+0
	MOVF       _velocidad+1, 0
	MOVWF      R4+1
	MOVF       _velocidad+2, 0
	MOVWF      R4+2
	MOVF       _velocidad+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      205
	MOVWF      R4+0
	MOVLW      76
	MOVWF      R4+1
	MOVLW      21
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _velocidad_grafica+0
	MOVF       R0+1, 0
	MOVWF      _velocidad_grafica+1
L_main39:
;NEXTION.c,180 :: 		sprinti(envia,"pa0.ve1.val=%d",velocidad_grafica);
	MOVLW      _envia+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_8_NEXTION+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_8_NEXTION+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       _velocidad_grafica+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       _velocidad_grafica+1, 0
	MOVWF      FARG_sprinti_wh+4
	CALL       _sprinti+0
;NEXTION.c,181 :: 		UART1_Write_Text(envia);//envia la trama
	MOVLW      _envia+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;NEXTION.c,182 :: 		manda_serial_const("\xFF\xFF\xFF");
	MOVLW      ?lstr_9_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_9_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
;NEXTION.c,186 :: 		floattostr_(velocidad,envia,2);    // 2 decimales
	MOVF       _velocidad+0, 0
	MOVWF      FARG_floattostr__x+0
	MOVF       _velocidad+1, 0
	MOVWF      FARG_floattostr__x+1
	MOVF       _velocidad+2, 0
	MOVWF      FARG_floattostr__x+2
	MOVF       _velocidad+3, 0
	MOVWF      FARG_floattostr__x+3
	MOVLW      _envia+0
	MOVWF      FARG_floattostr__str+0
	MOVLW      2
	MOVWF      FARG_floattostr__precision+0
	CALL       _floattostr_+0
;NEXTION.c,187 :: 		manda_serial_const("pa0.ve2.txt=\""); //manda primera parte de la trama
	MOVLW      ?lstr_10_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_10_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
;NEXTION.c,188 :: 		UART1_Write_Text(envia);     //manda el dato
	MOVLW      _envia+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;NEXTION.c,189 :: 		manda_serial_const("\"");   //mada final
	MOVLW      ?lstr_11_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_11_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
;NEXTION.c,191 :: 		manda_serial_const("\xFF\xFF\xFF");
	MOVLW      ?lstr_12_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_12_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
;NEXTION.c,192 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
;NEXTION.c,195 :: 		if (pulsador==1) manda_serial_const("pa1.led.pic=1");
	BTFSS      PORTB+0, 1
	GOTO       L_main41
	MOVLW      ?lstr_13_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_13_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
	GOTO       L_main42
L_main41:
;NEXTION.c,196 :: 		else manda_serial_const("pa1.led.pic=2");
	MOVLW      ?lstr_14_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_14_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
L_main42:
;NEXTION.c,197 :: 		manda_serial_const("\xFF\xFF\xFF");
	MOVLW      ?lstr_15_NEXTION+0
	MOVWF      FARG_manda_serial_const_info+0
	MOVLW      hi_addr(?lstr_15_NEXTION+0)
	MOVWF      FARG_manda_serial_const_info+1
	CALL       _manda_serial_const+0
;NEXTION.c,198 :: 		procesa_rx();
	CALL       _procesa_rx+0
;NEXTION.c,199 :: 		Delay_ms(30);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
;NEXTION.c,206 :: 		}
	GOTO       L_main36
;NEXTION.c,210 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
