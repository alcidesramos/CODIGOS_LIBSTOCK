
_saca_secuencia1:

;pasopaso2018.c,77 :: 		void saca_secuencia1()
;pasopaso2018.c,79 :: 		pasos1++;
	MOVLW      1
	ADDWF      _pasos1+0, 1
	MOVLW      0
	ADDWFC     _pasos1+1, 1
	ADDWFC     _pasos1+2, 1
	ADDWFC     _pasos1+3, 1
;pasopaso2018.c,80 :: 		m11=codigo1[secuencia1].b0;
	MOVLW      _codigo1+0
	MOVWF      R1
	MOVLW      hi_addr(_codigo1+0)
	MOVWF      R2
	MOVF       _secuencia1+0, 0
	ADDWF      R1, 1
	MOVLW      0
	BTFSC      _secuencia1+0, 7
	MOVLW      255
	ADDWFC     R2, 1
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 0
	GOTO       L__saca_secuencia149
	BCF        LATA+0, 0
	GOTO       L__saca_secuencia150
L__saca_secuencia149:
	BSF        LATA+0, 0
L__saca_secuencia150:
;pasopaso2018.c,81 :: 		m12=codigo1[secuencia1].b1;
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 1
	GOTO       L__saca_secuencia151
	BCF        LATA+0, 1
	GOTO       L__saca_secuencia152
L__saca_secuencia151:
	BSF        LATA+0, 1
L__saca_secuencia152:
;pasopaso2018.c,82 :: 		m13=codigo1[secuencia1].b2;
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 2
	GOTO       L__saca_secuencia153
	BCF        LATA+0, 2
	GOTO       L__saca_secuencia154
L__saca_secuencia153:
	BSF        LATA+0, 2
L__saca_secuencia154:
;pasopaso2018.c,83 :: 		m14=codigo1[secuencia1].b3;
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 3
	GOTO       L__saca_secuencia155
	BCF        LATA+0, 4
	GOTO       L__saca_secuencia156
L__saca_secuencia155:
	BSF        LATA+0, 4
L__saca_secuencia156:
;pasopaso2018.c,84 :: 		}
L_end_saca_secuencia1:
	RETURN
; end of _saca_secuencia1

_saca_secuencia2:

;pasopaso2018.c,87 :: 		void saca_secuencia2()
;pasopaso2018.c,89 :: 		pasos2++;
	MOVLW      1
	ADDWF      _pasos2+0, 1
	MOVLW      0
	ADDWFC     _pasos2+1, 1
	ADDWFC     _pasos2+2, 1
	ADDWFC     _pasos2+3, 1
;pasopaso2018.c,90 :: 		m21=codigo2[secuencia2].b0;
	MOVLW      _codigo2+0
	MOVWF      R1
	MOVLW      hi_addr(_codigo2+0)
	MOVWF      R2
	MOVF       _secuencia2+0, 0
	ADDWF      R1, 1
	MOVLW      0
	BTFSC      _secuencia2+0, 7
	MOVLW      255
	ADDWFC     R2, 1
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 0
	GOTO       L__saca_secuencia258
	BCF        LATC+0, 0
	GOTO       L__saca_secuencia259
L__saca_secuencia258:
	BSF        LATC+0, 0
L__saca_secuencia259:
;pasopaso2018.c,91 :: 		m22=codigo2[secuencia2].b1;
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 1
	GOTO       L__saca_secuencia260
	BCF        LATC+0, 1
	GOTO       L__saca_secuencia261
L__saca_secuencia260:
	BSF        LATC+0, 1
L__saca_secuencia261:
;pasopaso2018.c,92 :: 		m23=codigo2[secuencia2].b2;
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 2
	GOTO       L__saca_secuencia262
	BCF        LATC+0, 2
	GOTO       L__saca_secuencia263
L__saca_secuencia262:
	BSF        LATC+0, 2
L__saca_secuencia263:
;pasopaso2018.c,93 :: 		m24=codigo2[secuencia2].b3;
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	BTFSC      R0, 3
	GOTO       L__saca_secuencia264
	BCF        LATC+0, 3
	GOTO       L__saca_secuencia265
L__saca_secuencia264:
	BSF        LATC+0, 3
L__saca_secuencia265:
;pasopaso2018.c,94 :: 		}
L_end_saca_secuencia2:
	RETURN
; end of _saca_secuencia2

_izquierda1:

;pasopaso2018.c,97 :: 		void izquierda1()
;pasopaso2018.c,99 :: 		secuencia1++;
	INCF       _secuencia1+0, 1
;pasopaso2018.c,100 :: 		if (secuencia1>n_pasos) secuencia1=0;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	BTFSC      _secuencia1+0, 7
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__izquierda167
	MOVF       _secuencia1+0, 0
	SUBLW      7
L__izquierda167:
	BTFSC      STATUS+0, 0
	GOTO       L_izquierda10
	CLRF       _secuencia1+0
L_izquierda10:
;pasopaso2018.c,101 :: 		saca_secuencia1();
	CALL       _saca_secuencia1+0
;pasopaso2018.c,102 :: 		}
L_end_izquierda1:
	RETURN
; end of _izquierda1

_derecha1:

;pasopaso2018.c,104 :: 		void derecha1()
;pasopaso2018.c,106 :: 		secuencia1--;
	DECF       _secuencia1+0, 1
;pasopaso2018.c,107 :: 		if (secuencia1<0) secuencia1=n_pasos;
	MOVLW      128
	XORWF      _secuencia1+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_derecha11
	MOVLW      7
	MOVWF      _secuencia1+0
L_derecha11:
;pasopaso2018.c,108 :: 		saca_secuencia1();
	CALL       _saca_secuencia1+0
;pasopaso2018.c,109 :: 		}
L_end_derecha1:
	RETURN
; end of _derecha1

_izquierda2:

;pasopaso2018.c,111 :: 		void izquierda2()
;pasopaso2018.c,113 :: 		secuencia2++;
	INCF       _secuencia2+0, 1
;pasopaso2018.c,114 :: 		if (secuencia2>n_pasos) secuencia2=0;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	BTFSC      _secuencia2+0, 7
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__izquierda270
	MOVF       _secuencia2+0, 0
	SUBLW      7
L__izquierda270:
	BTFSC      STATUS+0, 0
	GOTO       L_izquierda22
	CLRF       _secuencia2+0
L_izquierda22:
;pasopaso2018.c,115 :: 		saca_secuencia2();
	CALL       _saca_secuencia2+0
;pasopaso2018.c,116 :: 		}
L_end_izquierda2:
	RETURN
; end of _izquierda2

_derecha2:

;pasopaso2018.c,118 :: 		void derecha2()
;pasopaso2018.c,120 :: 		secuencia2--;
	DECF       _secuencia2+0, 1
;pasopaso2018.c,121 :: 		if (secuencia2<0) secuencia2=n_pasos;
	MOVLW      128
	XORWF      _secuencia2+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_derecha23
	MOVLW      7
	MOVWF      _secuencia2+0
L_derecha23:
;pasopaso2018.c,122 :: 		saca_secuencia2();
	CALL       _saca_secuencia2+0
;pasopaso2018.c,123 :: 		}
L_end_derecha2:
	RETURN
; end of _derecha2

_procesarx:

;pasopaso2018.c,125 :: 		void procesarx()
;pasopaso2018.c,128 :: 		if (strstr(trama_rx,"m1der*"))     estado_giro1=derecha;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr1_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr1_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx4
	MOVLW      1
	MOVWF      _estado_giro1+0
	GOTO       L_procesarx5
L_procesarx4:
;pasopaso2018.c,129 :: 		else if (strstr(trama_rx,"m1izq*")) estado_giro1=izquierda;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr2_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr2_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx6
	MOVLW      2
	MOVWF      _estado_giro1+0
	GOTO       L_procesarx7
L_procesarx6:
;pasopaso2018.c,130 :: 		else if (strstr(trama_rx,"m1stop*"))   estado_giro1=quieto;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr3_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr3_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx8
	MOVLW      3
	MOVWF      _estado_giro1+0
	GOTO       L_procesarx9
L_procesarx8:
;pasopaso2018.c,131 :: 		else if (strstr(trama_rx,"m2der*"))  estado_giro2=derecha;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr4_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr4_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx10
	MOVLW      1
	MOVWF      _estado_giro2+0
	GOTO       L_procesarx11
L_procesarx10:
;pasopaso2018.c,132 :: 		else if (strstr(trama_rx,"m2izq*")) estado_giro2=izquierda;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr5_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr5_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx12
	MOVLW      2
	MOVWF      _estado_giro2+0
	GOTO       L_procesarx13
L_procesarx12:
;pasopaso2018.c,133 :: 		else if (strstr(trama_rx,"m2stop*"))   estado_giro2=quieto;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr6_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr6_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx14
	MOVLW      3
	MOVWF      _estado_giro2+0
	GOTO       L_procesarx15
L_procesarx14:
;pasopaso2018.c,135 :: 		else if (strstr(trama_rx,"vel1"))
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr7_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr7_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx16
;pasopaso2018.c,137 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW      _trama_rx+0
	MOVWF      FARG_strtok_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strtok_s1+1
	MOVLW      ?lstr8_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr8_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,138 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	CLRF       FARG_strtok_s1+1
	MOVLW      ?lstr9_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr9_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,140 :: 		dato=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_atoi_s+1
	CALL       _atoi+0
	MOVF       R0, 0
	MOVWF      _dato+0
;pasopaso2018.c,141 :: 		estado_modo1=continuo;
	MOVLW      1
	MOVWF      _estado_modo1+0
;pasopaso2018.c,142 :: 		velo_m1=dato;// carga el dato a la velocidad del motor
	MOVF       R0, 0
	MOVWF      _velo_m1+0
;pasopaso2018.c,144 :: 		}
	GOTO       L_procesarx17
L_procesarx16:
;pasopaso2018.c,146 :: 		else if (strstr(trama_rx,"vel2"))
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr10_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr10_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx18
;pasopaso2018.c,148 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW      _trama_rx+0
	MOVWF      FARG_strtok_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strtok_s1+1
	MOVLW      ?lstr11_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr11_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,149 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	CLRF       FARG_strtok_s1+1
	MOVLW      ?lstr12_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr12_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,151 :: 		dato=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_atoi_s+1
	CALL       _atoi+0
	MOVF       R0, 0
	MOVWF      _dato+0
;pasopaso2018.c,152 :: 		estado_modo2=continuo;
	MOVLW      1
	MOVWF      _estado_modo2+0
;pasopaso2018.c,153 :: 		velo_m2=dato;// carga el dato a la velocidad del motor
	MOVF       R0, 0
	MOVWF      _velo_m2+0
;pasopaso2018.c,155 :: 		}
	GOTO       L_procesarx19
L_procesarx18:
;pasopaso2018.c,158 :: 		else if (strstr(trama_rx,"pap1"))
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr13_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr13_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx20
;pasopaso2018.c,160 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW      _trama_rx+0
	MOVWF      FARG_strtok_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strtok_s1+1
	MOVLW      ?lstr14_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr14_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,161 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	CLRF       FARG_strtok_s1+1
	MOVLW      ?lstr15_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr15_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,163 :: 		dato=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_atoi_s+1
	CALL       _atoi+0
	MOVF       R0, 0
	MOVWF      _dato+0
;pasopaso2018.c,165 :: 		pasos1=0; //limpia el contador de pasos
	CLRF       _pasos1+0
	CLRF       _pasos1+1
	CLRF       _pasos1+2
	CLRF       _pasos1+3
;pasopaso2018.c,166 :: 		estado_modo1=pasos;  //pasa a modo pasos
	MOVLW      2
	MOVWF      _estado_modo1+0
;pasopaso2018.c,167 :: 		n_pasos1=dato;// carga numero de pasos a dar del motor1
	MOVF       R0, 0
	MOVWF      _n_pasos1+0
	CLRF       _n_pasos1+1
	CLRF       _n_pasos1+2
	CLRF       _n_pasos1+3
;pasopaso2018.c,168 :: 		}
	GOTO       L_procesarx21
L_procesarx20:
;pasopaso2018.c,170 :: 		else if (strstr(trama_rx,"pap2"))
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strstr_s1+1
	MOVLW      ?lstr16_pasopaso2018+0
	MOVWF      FARG_strstr_s2+0
	MOVLW      hi_addr(?lstr16_pasopaso2018+0)
	MOVWF      FARG_strstr_s2+1
	CALL       _strstr+0
	MOVF       R0, 0
	IORWF       R1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_procesarx22
;pasopaso2018.c,172 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW      _trama_rx+0
	MOVWF      FARG_strtok_s1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_strtok_s1+1
	MOVLW      ?lstr17_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr17_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,173 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	CLRF       FARG_strtok_s1+1
	MOVLW      ?lstr18_pasopaso2018+0
	MOVWF      FARG_strtok_s2+0
	MOVLW      hi_addr(?lstr18_pasopaso2018+0)
	MOVWF      FARG_strtok_s2+1
	CALL       _strtok+0
	MOVF       R0, 0
	MOVWF      FARG_strcpy_from+0
	MOVF       R1, 0
	MOVWF      FARG_strcpy_from+1
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_strcpy_to+1
	CALL       _strcpy+0
;pasopaso2018.c,175 :: 		dato=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	MOVLW      hi_addr(_procesa+0)
	MOVWF      FARG_atoi_s+1
	CALL       _atoi+0
	MOVF       R0, 0
	MOVWF      _dato+0
;pasopaso2018.c,177 :: 		pasos2=0; //limpia el contador de pasos
	CLRF       _pasos2+0
	CLRF       _pasos2+1
	CLRF       _pasos2+2
	CLRF       _pasos2+3
;pasopaso2018.c,178 :: 		estado_modo2=pasos;  //pasa a modo pasos
	MOVLW      2
	MOVWF      _estado_modo2+0
;pasopaso2018.c,179 :: 		n_pasos2=dato;// carga numero de pasos a dar del motor2
	MOVF       R0, 0
	MOVWF      _n_pasos2+0
	CLRF       _n_pasos2+1
	CLRF       _n_pasos2+2
	CLRF       _n_pasos2+3
;pasopaso2018.c,180 :: 		}
L_procesarx22:
L_procesarx21:
L_procesarx19:
L_procesarx17:
L_procesarx15:
L_procesarx13:
L_procesarx11:
L_procesarx9:
L_procesarx7:
L_procesarx5:
;pasopaso2018.c,182 :: 		memset(trama_rx,0,30);
	MOVLW      _trama_rx+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      30
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;pasopaso2018.c,183 :: 		}
L_end_procesarx:
	RETURN
; end of _procesarx

_interrupcion:

;pasopaso2018.c,187 :: 		void interrupcion() iv 0x0004 ics ICS_AUTO
;pasopaso2018.c,189 :: 		if (T0IF_bit==1)
	BTFSS      T0IF_bit+0, BitPos(T0IF_bit+0)
	GOTO       L_interrupcion23
;pasopaso2018.c,191 :: 		T0IE_bit=0; //deshabilito interrupcion del timer cero
	BCF        T0IE_bit+0, BitPos(T0IE_bit+0)
;pasopaso2018.c,192 :: 		velo1++;
	INCF       _velo1+0, 1
;pasopaso2018.c,193 :: 		velo2++;
	INCF       _velo2+0, 1
;pasopaso2018.c,196 :: 		if (velo1>=256-velo_m1)// para que la menor sea mas lenta
	MOVF       _velo_m1+0, 0
	SUBLW      0
	MOVWF      R1
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      1
	MOVWF      R2
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      R2, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion75
	MOVF       R1, 0
	SUBWF      _velo1+0, 0
L__interrupcion75:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupcion24
;pasopaso2018.c,198 :: 		velo1=0;
	CLRF       _velo1+0
;pasopaso2018.c,199 :: 		if (estado_modo1==pasos)  //si esta en modo de pasos
	MOVF       _estado_modo1+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupcion25
;pasopaso2018.c,201 :: 		if (pasos1>=n_pasos1)
	MOVF       _n_pasos1+3, 0
	SUBWF      _pasos1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion76
	MOVF       _n_pasos1+2, 0
	SUBWF      _pasos1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion76
	MOVF       _n_pasos1+1, 0
	SUBWF      _pasos1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion76
	MOVF       _n_pasos1+0, 0
	SUBWF      _pasos1+0, 0
L__interrupcion76:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupcion26
;pasopaso2018.c,203 :: 		estado_giro1=quieto;//deja quieto al motor
	MOVLW      3
	MOVWF      _estado_giro1+0
;pasopaso2018.c,204 :: 		pasos1=0;    //reinicia numero de pasos
	CLRF       _pasos1+0
	CLRF       _pasos1+1
	CLRF       _pasos1+2
	CLRF       _pasos1+3
;pasopaso2018.c,205 :: 		}
L_interrupcion26:
;pasopaso2018.c,206 :: 		}
L_interrupcion25:
;pasopaso2018.c,208 :: 		switch (estado_giro1)
	GOTO       L_interrupcion27
;pasopaso2018.c,210 :: 		case derecha: derecha1(); break;
L_interrupcion29:
	CALL       _derecha1+0
	GOTO       L_interrupcion28
;pasopaso2018.c,211 :: 		case izquierda:izquierda1();break;
L_interrupcion30:
	CALL       _izquierda1+0
	GOTO       L_interrupcion28
;pasopaso2018.c,213 :: 		}//fin del switch del sentido de giro
L_interrupcion27:
	MOVF       _estado_giro1+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_interrupcion29
	MOVF       _estado_giro1+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_interrupcion30
L_interrupcion28:
;pasopaso2018.c,215 :: 		}//fin de analisis del motor 1
L_interrupcion24:
;pasopaso2018.c,218 :: 		if (velo2>=256-velo_m2)// para que la menor sea mas lenta
	MOVF       _velo_m2+0, 0
	SUBLW      0
	MOVWF      R1
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      1
	MOVWF      R2
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      R2, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion77
	MOVF       R1, 0
	SUBWF      _velo2+0, 0
L__interrupcion77:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupcion31
;pasopaso2018.c,220 :: 		velo2=0;
	CLRF       _velo2+0
;pasopaso2018.c,221 :: 		if (estado_modo2==pasos)  //si esta en modo de pasos
	MOVF       _estado_modo2+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupcion32
;pasopaso2018.c,223 :: 		if (pasos2>=n_pasos2)
	MOVF       _n_pasos2+3, 0
	SUBWF      _pasos2+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion78
	MOVF       _n_pasos2+2, 0
	SUBWF      _pasos2+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion78
	MOVF       _n_pasos2+1, 0
	SUBWF      _pasos2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupcion78
	MOVF       _n_pasos2+0, 0
	SUBWF      _pasos2+0, 0
L__interrupcion78:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupcion33
;pasopaso2018.c,225 :: 		estado_giro2=quieto;//deja quieto al motor
	MOVLW      3
	MOVWF      _estado_giro2+0
;pasopaso2018.c,226 :: 		pasos2=0;    //reinicia nuemro de pasos
	CLRF       _pasos2+0
	CLRF       _pasos2+1
	CLRF       _pasos2+2
	CLRF       _pasos2+3
;pasopaso2018.c,227 :: 		}
L_interrupcion33:
;pasopaso2018.c,228 :: 		}
L_interrupcion32:
;pasopaso2018.c,230 :: 		switch (estado_giro2)
	GOTO       L_interrupcion34
;pasopaso2018.c,232 :: 		case derecha: derecha2(); break;
L_interrupcion36:
	CALL       _derecha2+0
	GOTO       L_interrupcion35
;pasopaso2018.c,233 :: 		case izquierda:izquierda2();break;
L_interrupcion37:
	CALL       _izquierda2+0
	GOTO       L_interrupcion35
;pasopaso2018.c,235 :: 		}//fin del switch del sentido de giro
L_interrupcion34:
	MOVF       _estado_giro2+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_interrupcion36
	MOVF       _estado_giro2+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_interrupcion37
L_interrupcion35:
;pasopaso2018.c,237 :: 		}//fin de analisis del motor 2
L_interrupcion31:
;pasopaso2018.c,244 :: 		TMR0=0;
	CLRF       TMR0+0
;pasopaso2018.c,245 :: 		T0IF_bit=0;
	BCF        T0IF_bit+0, BitPos(T0IF_bit+0)
;pasopaso2018.c,246 :: 		T0IE_bit=1; //habilita interrpion timer cero
	BSF        T0IE_bit+0, BitPos(T0IE_bit+0)
;pasopaso2018.c,247 :: 		}
L_interrupcion23:
;pasopaso2018.c,249 :: 		if (RCIF_bit==1)
	BTFSS      RCIF_bit+0, BitPos(RCIF_bit+0)
	GOTO       L_interrupcion38
;pasopaso2018.c,251 :: 		datorx=RCREG;  //lee el dato
	MOVF       RCREG+0, 0
	MOVWF      _datorx+0
;pasopaso2018.c,252 :: 		trama_rx[puntero]=datorx; //lo almacena en la trama
	MOVLW      _trama_rx+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FSR1H
	MOVF       _puntero+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVF       _datorx+0, 0
	MOVWF      INDF1+0
;pasopaso2018.c,253 :: 		puntero++; //incrementa el contador de trama
	INCF       _puntero+0, 1
;pasopaso2018.c,254 :: 		if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
	MOVLW      30
	SUBWF      _puntero+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupcion39
	CLRF       _puntero+0
L_interrupcion39:
;pasopaso2018.c,255 :: 		if (datorx=='*')  //Si llega el fin de la trama
	MOVF       _datorx+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_interrupcion40
;pasopaso2018.c,257 :: 		RCIE_bit=0; //deshabilita la interrucion
	BCF        RCIE_bit+0, BitPos(RCIE_bit+0)
;pasopaso2018.c,258 :: 		flag_rx=1;  //activa la bandera de que hat una trama valida
	MOVLW      1
	MOVWF      _flag_rx+0
;pasopaso2018.c,260 :: 		}
L_interrupcion40:
;pasopaso2018.c,262 :: 		if (OERR_bit==1)
	BTFSS      OERR_bit+0, BitPos(OERR_bit+0)
	GOTO       L_interrupcion41
;pasopaso2018.c,264 :: 		CREN_bit=0;
	BCF        CREN_bit+0, BitPos(CREN_bit+0)
;pasopaso2018.c,265 :: 		CREN_bit=1;
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;pasopaso2018.c,266 :: 		}
L_interrupcion41:
;pasopaso2018.c,267 :: 		RCIF_bit=0;
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;pasopaso2018.c,268 :: 		}
L_interrupcion38:
;pasopaso2018.c,273 :: 		}
L_end_interrupcion:
L__interrupcion74:
	RETFIE     %s
; end of _interrupcion

_main:

;pasopaso2018.c,277 :: 		void main()
;pasopaso2018.c,280 :: 		SCS1_bit=0;
	BCF        SCS1_bit+0, BitPos(SCS1_bit+0)
;pasopaso2018.c,281 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;pasopaso2018.c,285 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;pasopaso2018.c,286 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;pasopaso2018.c,287 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;pasopaso2018.c,288 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;pasopaso2018.c,291 :: 		SPLLEN_bit=1; //prende el PLL por 4   trabaja a 32
	BSF        SPLLEN_bit+0, BitPos(SPLLEN_bit+0)
;pasopaso2018.c,293 :: 		while (PLLR_bit==0);   //espera estabilidad del PLL
L_main42:
	BTFSC      PLLR_bit+0, BitPos(PLLR_bit+0)
	GOTO       L_main43
	GOTO       L_main42
L_main43:
;pasopaso2018.c,296 :: 		ANSELA=0;
	CLRF       ANSELA+0
;pasopaso2018.c,297 :: 		ANSELC=0;
	CLRF       ANSELC+0
;pasopaso2018.c,300 :: 		TRISA=0;
	CLRF       TRISA+0
;pasopaso2018.c,301 :: 		TRISC=0;
	CLRF       TRISC+0
;pasopaso2018.c,303 :: 		TRISC5_bit=1; //entrada rx
	BSF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
;pasopaso2018.c,305 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      64
	MOVWF      SPBRG+0
	MOVLW      3
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;pasopaso2018.c,306 :: 		UART1_Write_Text("INICIANDO");
	MOVLW      ?lstr19_pasopaso2018+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr19_pasopaso2018+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;pasopaso2018.c,308 :: 		RXDTSEL_bit=0; // RX en RC5  sino RA1
	BCF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
;pasopaso2018.c,309 :: 		TXCKSEL_bit=0; // tX en RC4  sino RA0
	BCF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;pasopaso2018.c,312 :: 		INTCON=0b01000000; //interrpcion de perifericos habiitada
	MOVLW      64
	MOVWF      INTCON+0
;pasopaso2018.c,314 :: 		OPTION_REG=0; //prescalador asociado a timer0
	CLRF       OPTION_REG+0
;pasopaso2018.c,316 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;pasopaso2018.c,317 :: 		PS1_bit=1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;pasopaso2018.c,318 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;pasopaso2018.c,320 :: 		TMR0=0;
	CLRF       TMR0+0
;pasopaso2018.c,321 :: 		T0IF_bit=0;//limpia la bandera
	BCF        T0IF_bit+0, BitPos(T0IF_bit+0)
;pasopaso2018.c,322 :: 		T0IE_bit=1;//habilita interrUpcion del timer
	BSF        T0IE_bit+0, BitPos(T0IE_bit+0)
;pasopaso2018.c,325 :: 		estado_giro1=derecha;
	MOVLW      1
	MOVWF      _estado_giro1+0
;pasopaso2018.c,326 :: 		estado_giro2=derecha;
	MOVLW      1
	MOVWF      _estado_giro2+0
;pasopaso2018.c,327 :: 		estado_modo1=continuo;
	MOVLW      1
	MOVWF      _estado_modo1+0
;pasopaso2018.c,328 :: 		estado_modo2=continuo;
	MOVLW      1
	MOVWF      _estado_modo2+0
;pasopaso2018.c,329 :: 		velo_m1=180;
	MOVLW      180
	MOVWF      _velo_m1+0
;pasopaso2018.c,330 :: 		velo_m2=180;
	MOVLW      180
	MOVWF      _velo_m2+0
;pasopaso2018.c,334 :: 		RCIF_bit=0;
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;pasopaso2018.c,335 :: 		RCIE_bit=1;//habiita interrpcion serial
	BSF        RCIE_bit+0, BitPos(RCIE_bit+0)
;pasopaso2018.c,336 :: 		CREN_bit=1;//borra errores
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;pasopaso2018.c,340 :: 		GIE_bit=1; //habilito interrpciones globales
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;pasopaso2018.c,341 :: 		while (1)
L_main44:
;pasopaso2018.c,344 :: 		if (flag_rx==1)
	MOVF       _flag_rx+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main46
;pasopaso2018.c,347 :: 		procesarx();  // llama al procedimiento de procesar la trama
	CALL       _procesarx+0
;pasopaso2018.c,348 :: 		puntero=0; //inicializa el conteo
	CLRF       _puntero+0
;pasopaso2018.c,349 :: 		memset(trama_rx,0,30); //limpia la trama
	MOVLW      _trama_rx+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_trama_rx+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      30
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;pasopaso2018.c,350 :: 		flag_rx=0;
	CLRF       _flag_rx+0
;pasopaso2018.c,351 :: 		RCIF_bit=0;    //limpia la bandera de la interrpcion
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;pasopaso2018.c,352 :: 		RCIE_bit=1;   //habilita la Interrpcion serial
	BSF        RCIE_bit+0, BitPos(RCIE_bit+0)
;pasopaso2018.c,353 :: 		}
L_main46:
;pasopaso2018.c,355 :: 		LATA5_bit=~LATA5_bit;
	MOVLW
	XORWF      LATA5_bit+0, 1
;pasopaso2018.c,356 :: 		Delay_ms(500);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_main47:
	DECFSZ     R13, 1
	GOTO       L_main47
	DECFSZ     R12, 1
	GOTO       L_main47
	DECFSZ     R11, 1
	GOTO       L_main47
	NOP
;pasopaso2018.c,390 :: 		}
	GOTO       L_main44
;pasopaso2018.c,397 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
