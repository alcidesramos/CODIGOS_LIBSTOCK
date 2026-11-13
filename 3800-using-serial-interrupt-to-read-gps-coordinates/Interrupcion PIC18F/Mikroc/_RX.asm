
_m1derecha:

;_RX.c,50 :: 		void m1derecha()
;_RX.c,52 :: 		m11=1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,53 :: 		m12=0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,54 :: 		}
L_end_m1derecha:
	RETURN      0
; end of _m1derecha

_m1izquierda:

;_RX.c,56 :: 		void m1izquierda()
;_RX.c,58 :: 		m11=0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,59 :: 		m12=1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,61 :: 		}
L_end_m1izquierda:
	RETURN      0
; end of _m1izquierda

_m1quieto:

;_RX.c,63 :: 		void m1quieto()
;_RX.c,65 :: 		m11=0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,66 :: 		m12=0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,67 :: 		}
L_end_m1quieto:
	RETURN      0
; end of _m1quieto

_procesa_rx:

;_RX.c,69 :: 		void procesa_rx()
;_RX.c,71 :: 		if (strstr(trama_rx,"led1="))      //led1=on*
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx0
;_RX.c,73 :: 		if (strstr(trama_rx,"on")) ledrx1=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr2__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr2__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx1
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_procesa_rx2
L_procesa_rx1:
;_RX.c,74 :: 		else ledrx1=0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
L_procesa_rx2:
;_RX.c,75 :: 		}
	GOTO        L_procesa_rx3
L_procesa_rx0:
;_RX.c,77 :: 		else if (strstr(trama_rx,"led2="))      //led1=on*
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr3__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr3__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx4
;_RX.c,79 :: 		if (strstr(trama_rx,"on")) ledrx2=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr4__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr4__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx5
	BSF         RE1_bit+0, BitPos(RE1_bit+0) 
	GOTO        L_procesa_rx6
L_procesa_rx5:
;_RX.c,80 :: 		else ledrx2=0;
	BCF         RE1_bit+0, BitPos(RE1_bit+0) 
L_procesa_rx6:
;_RX.c,81 :: 		}
	GOTO        L_procesa_rx7
L_procesa_rx4:
;_RX.c,83 :: 		else if (strstr(trama_rx,"m1der"))  m1derecha();
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr5__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr5__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx8
	CALL        _m1derecha+0, 0
	GOTO        L_procesa_rx9
L_procesa_rx8:
;_RX.c,84 :: 		else if (strstr(trama_rx,"m1izq"))  m1izquierda();
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr6__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr6__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx10
	CALL        _m1izquierda+0, 0
	GOTO        L_procesa_rx11
L_procesa_rx10:
;_RX.c,85 :: 		else if (strstr(trama_rx,"m1stop"))  m1quieto();
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr7__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr7__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx12
	CALL        _m1quieto+0, 0
	GOTO        L_procesa_rx13
L_procesa_rx12:
;_RX.c,90 :: 		else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr8__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr8__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx14
;_RX.c,92 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr9__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr9__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,93 :: 		strcpy(procesa, strtok(0, "*"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr10__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr10__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,95 :: 		dato_rx=atoi(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx+0 
;_RX.c,96 :: 		PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;_RX.c,99 :: 		}
L_procesa_rx14:
L_procesa_rx13:
L_procesa_rx11:
L_procesa_rx9:
L_procesa_rx7:
L_procesa_rx3:
;_RX.c,103 :: 		}
L_end_procesa_rx:
	RETURN      0
; end of _procesa_rx

_procesa_GPS:

;_RX.c,105 :: 		void procesa_GPS()
;_RX.c,108 :: 		strcpy(procesa, strtok(trama_rx, ","));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr11__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr11__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,110 :: 		strcpy(procesa, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr12__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr12__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,111 :: 		strcpy(procesa, strtok(0, ","));  //captura hasta lo que esta tercera coma es decir, latitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr13__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr13__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,112 :: 		memset(c_grados,0,10);//limpía los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       10
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;_RX.c,113 :: 		strncpy(c_grados,procesa,2);//captura los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       2
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;_RX.c,114 :: 		grados=atof(c_grados);      // pasa de alfanumerico o cadena a flotante
	MOVLW       _c_grados+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _grados+0 
	MOVF        R1, 0 
	MOVWF       _grados+1 
	MOVF        R2, 0 
	MOVWF       _grados+2 
	MOVF        R3, 0 
	MOVWF       _grados+3 
;_RX.c,117 :: 		minutos=atof(&procesa[2])/60.0;  //lo pasa a grados
	MOVLW       _procesa+2
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_procesa+2)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _minutos+0 
	MOVF        R1, 0 
	MOVWF       _minutos+1 
	MOVF        R2, 0 
	MOVWF       _minutos+2 
	MOVF        R3, 0 
	MOVWF       _minutos+3 
;_RX.c,118 :: 		latitud=grados+minutos;
	MOVF        _grados+0, 0 
	MOVWF       R4 
	MOVF        _grados+1, 0 
	MOVWF       R5 
	MOVF        _grados+2, 0 
	MOVWF       R6 
	MOVF        _grados+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _latitud+0 
	MOVF        R1, 0 
	MOVWF       _latitud+1 
	MOVF        R2, 0 
	MOVWF       _latitud+2 
	MOVF        R3, 0 
	MOVWF       _latitud+3 
;_RX.c,119 :: 		strcpy(procesa, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr14__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr14__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,120 :: 		if (procesa[0]=='S') latitud=-latitud;
	MOVF        _procesa+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_procesa_GPS15
	BTG         _latitud+2, 7 
L_procesa_GPS15:
;_RX.c,122 :: 		sprintf(texto,"lat=%f\r\n",latitud);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_15__RX+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_15__RX+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_15__RX+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _latitud+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _latitud+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _latitud+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _latitud+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;_RX.c,123 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_RX.c,127 :: 		strcpy(procesa, strtok(0, ","));  //captura siguiente coma la longitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr16__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr16__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,128 :: 		memset(c_grados,0,10);//limpía los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       10
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;_RX.c,129 :: 		strncpy(c_grados,procesa,3);//captura los grados  3 posiciones
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       3
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;_RX.c,130 :: 		grados=atof(c_grados);
	MOVLW       _c_grados+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _grados+0 
	MOVF        R1, 0 
	MOVWF       _grados+1 
	MOVF        R2, 0 
	MOVWF       _grados+2 
	MOVF        R3, 0 
	MOVWF       _grados+3 
;_RX.c,132 :: 		minutos=atof(&procesa[3])/60.0;  //lo pasa a grados
	MOVLW       _procesa+3
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_procesa+3)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _minutos+0 
	MOVF        R1, 0 
	MOVWF       _minutos+1 
	MOVF        R2, 0 
	MOVWF       _minutos+2 
	MOVF        R3, 0 
	MOVWF       _minutos+3 
;_RX.c,133 :: 		longitud=grados+minutos;
	MOVF        _grados+0, 0 
	MOVWF       R4 
	MOVF        _grados+1, 0 
	MOVWF       R5 
	MOVF        _grados+2, 0 
	MOVWF       R6 
	MOVF        _grados+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _longitud+0 
	MOVF        R1, 0 
	MOVWF       _longitud+1 
	MOVF        R2, 0 
	MOVWF       _longitud+2 
	MOVF        R3, 0 
	MOVWF       _longitud+3 
;_RX.c,134 :: 		strcpy(procesa, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr17__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr17__RX+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;_RX.c,135 :: 		if (procesa[0]=='W') longitud=-longitud;
	MOVF        _procesa+0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_procesa_GPS16
	BTG         _longitud+2, 7 
L_procesa_GPS16:
;_RX.c,136 :: 		sprintf(texto,"lon=%f\r\n\r\n",longitud);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_18__RX+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_18__RX+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_18__RX+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _longitud+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _longitud+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _longitud+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _longitud+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;_RX.c,137 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_RX.c,139 :: 		}
L_end_procesa_GPS:
	RETURN      0
; end of _procesa_GPS

_int_bajas:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;_RX.c,143 :: 		void  int_bajas() iv 0x0018 ics ICS_AUTO
;_RX.c,146 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_int_bajas17
;_RX.c,148 :: 		TMR0H=11;
	MOVLW       11
	MOVWF       TMR0H+0 
;_RX.c,149 :: 		TMR0L=220;
	MOVLW       220
	MOVWF       TMR0L+0 
;_RX.c,151 :: 		led2=!led2;
	BTG         RD4_bit+0, BitPos(RD4_bit+0) 
;_RX.c,154 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;_RX.c,155 :: 		}
L_int_bajas17:
;_RX.c,157 :: 		if(INT1F_bit==1)
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_int_bajas18
;_RX.c,159 :: 		led=!led;
	BTG         RD3_bit+0, BitPos(RD3_bit+0) 
;_RX.c,162 :: 		INT1F_bit=0; // limpia la bandera
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;_RX.c,163 :: 		}
L_int_bajas18:
;_RX.c,166 :: 		}
L_end_int_bajas:
L__int_bajas53:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _int_bajas

_INTERRPCION_altas:

;_RX.c,171 :: 		void INTERRPCION_altas() iv 0x0008 ics ICS_AUTO
;_RX.c,174 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_INTERRPCION_altas19
;_RX.c,176 :: 		dato_rx=UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx+0 
;_RX.c,178 :: 		switch (estado_rec)
	GOTO        L_INTERRPCION_altas20
;_RX.c,180 :: 		case cap_P:
L_INTERRPCION_altas22:
;_RX.c,181 :: 		trama_rx[puntero_rx]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;_RX.c,182 :: 		if (dato_rx!='P') puntero_rx=0;    //no fue el dato que me interesa
	MOVF        _dato_rx+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas23
	CLRF        _puntero_rx+0 
	GOTO        L_INTERRPCION_altas24
L_INTERRPCION_altas23:
;_RX.c,185 :: 		puntero_rx++;//incrementa contador para proximo dato
	INCF        _puntero_rx+0, 1 
;_RX.c,186 :: 		estado_rec=cap_G; //pasa al estado de capturar la g
	MOVLW       1
	MOVWF       _estado_rec+0 
;_RX.c,187 :: 		}
L_INTERRPCION_altas24:
;_RX.c,188 :: 		break;
	GOTO        L_INTERRPCION_altas21
;_RX.c,190 :: 		case cap_G:
L_INTERRPCION_altas25:
;_RX.c,191 :: 		trama_rx[puntero_rx]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;_RX.c,192 :: 		if (dato_rx!='G')
	MOVF        _dato_rx+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas26
;_RX.c,194 :: 		puntero_rx=0;
	CLRF        _puntero_rx+0 
;_RX.c,195 :: 		estado_rec=cap_P; //regresa al estado inical
	CLRF        _estado_rec+0 
;_RX.c,196 :: 		}
	GOTO        L_INTERRPCION_altas27
L_INTERRPCION_altas26:
;_RX.c,199 :: 		puntero_rx++;//incrementa contador para proximo dato
	INCF        _puntero_rx+0, 1 
;_RX.c,200 :: 		estado_rec=cap_G2; //pasa al estado de capturar la g
	MOVLW       2
	MOVWF       _estado_rec+0 
;_RX.c,201 :: 		}
L_INTERRPCION_altas27:
;_RX.c,202 :: 		break;
	GOTO        L_INTERRPCION_altas21
;_RX.c,204 :: 		case cap_G2:
L_INTERRPCION_altas28:
;_RX.c,205 :: 		trama_rx[puntero_rx]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;_RX.c,206 :: 		if (dato_rx!='G')
	MOVF        _dato_rx+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas29
;_RX.c,208 :: 		Puntero_rx=0;
	CLRF        _puntero_rx+0 
;_RX.c,209 :: 		estado_rec=cap_P; //regresa al estado inical
	CLRF        _estado_rec+0 
;_RX.c,210 :: 		}
	GOTO        L_INTERRPCION_altas30
L_INTERRPCION_altas29:
;_RX.c,213 :: 		puntero_rx++;//incrementa contador para proximo dato
	INCF        _puntero_rx+0, 1 
;_RX.c,214 :: 		estado_rec=cap_A; //pasa al estado de capturar la a
	MOVLW       3
	MOVWF       _estado_rec+0 
;_RX.c,215 :: 		}
L_INTERRPCION_altas30:
;_RX.c,216 :: 		break;
	GOTO        L_INTERRPCION_altas21
;_RX.c,219 :: 		case cap_A:
L_INTERRPCION_altas31:
;_RX.c,220 :: 		trama_rx[puntero_rx]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;_RX.c,221 :: 		if (dato_rx!='A')
	MOVF        _dato_rx+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas32
;_RX.c,223 :: 		puntero_rx=0;
	CLRF        _puntero_rx+0 
;_RX.c,224 :: 		estado_rec=cap_P; //regresa al estado inical
	CLRF        _estado_rec+0 
;_RX.c,226 :: 		}
	GOTO        L_INTERRPCION_altas33
L_INTERRPCION_altas32:
;_RX.c,229 :: 		puntero_rx++;//incrementa contador para proximo dato
	INCF        _puntero_rx+0, 1 
;_RX.c,230 :: 		estado_rec=esp_final; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec+0 
;_RX.c,231 :: 		}
L_INTERRPCION_altas33:
;_RX.c,233 :: 		break;
	GOTO        L_INTERRPCION_altas21
;_RX.c,235 :: 		case esp_final:
L_INTERRPCION_altas34:
;_RX.c,236 :: 		trama_rx[puntero_rx]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;_RX.c,237 :: 		puntero_rx++;
	INCF        _puntero_rx+0, 1 
;_RX.c,238 :: 		if (dato_rx=='*')
	MOVF        _dato_rx+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas35
;_RX.c,240 :: 		RCIE_bit=0; ///   DESHABILITA INR
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;_RX.c,241 :: 		estado_rec=cap_P; //regresa al estado inical
	CLRF        _estado_rec+0 
;_RX.c,242 :: 		puntero_rx=0;
	CLRF        _puntero_rx+0 
;_RX.c,243 :: 		flag_rx=1;
	MOVLW       1
	MOVWF       _flag_rx+0 
;_RX.c,244 :: 		}
L_INTERRPCION_altas35:
;_RX.c,245 :: 		break;
	GOTO        L_INTERRPCION_altas21
;_RX.c,247 :: 		}//fin del switch
L_INTERRPCION_altas20:
	MOVF        _estado_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas22
	MOVF        _estado_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas25
	MOVF        _estado_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas28
	MOVF        _estado_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas31
	MOVF        _estado_rec+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas34
L_INTERRPCION_altas21:
;_RX.c,251 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;_RX.c,252 :: 		}
L_INTERRPCION_altas19:
;_RX.c,255 :: 		if(INT0F_bit==1)
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_INTERRPCION_altas36
;_RX.c,257 :: 		led3=!led3;
	BTG         RA0_bit+0, BitPos(RA0_bit+0) 
;_RX.c,260 :: 		INT0F_bit=0; // limpia la bandera
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;_RX.c,261 :: 		}
L_INTERRPCION_altas36:
;_RX.c,264 :: 		if (TMR1IF_bit==1)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_INTERRPCION_altas37
;_RX.c,270 :: 		TMR1H=60;
	MOVLW       60
	MOVWF       TMR1H+0 
;_RX.c,271 :: 		TMR1L=175;
	MOVLW       175
	MOVWF       TMR1L+0 
;_RX.c,273 :: 		led1=!led1;
	BTG         RD5_bit+0, BitPos(RD5_bit+0) 
;_RX.c,275 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;_RX.c,276 :: 		}
L_INTERRPCION_altas37:
;_RX.c,280 :: 		}
L_end_INTERRPCION_altas:
L__INTERRPCION_altas55:
	RETFIE      1
; end of _INTERRPCION_altas

_main:

;_RX.c,283 :: 		void main()
;_RX.c,287 :: 		ADCON1=0b1111;
	MOVLW       15
	MOVWF       ADCON1+0 
;_RX.c,289 :: 		TRISA=0;
	CLRF        TRISA+0 
;_RX.c,290 :: 		TRISB=0 ;
	CLRF        TRISB+0 
;_RX.c,291 :: 		TRISC=0;
	CLRF        TRISC+0 
;_RX.c,292 :: 		TRISD=0;
	CLRF        TRISD+0 
;_RX.c,293 :: 		TRISE=0;
	CLRF        TRISE+0 
;_RX.c,295 :: 		TRISC7_bit=1; // enbtrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;_RX.c,296 :: 		TRISB0_bit=1; // entrda pulsador
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;_RX.c,297 :: 		TRISB1_bit=1; // entrda pulsador
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;_RX.c,300 :: 		INTCON=0B00000000;//
	CLRF        INTCON+0 
;_RX.c,302 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;_RX.c,303 :: 		PWM1_Init(300);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       208
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;_RX.c,305 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;_RX.c,306 :: 		UART1_Write_Text("HOLA MUNDO");
	MOVLW       ?lstr19__RX+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr19__RX+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_RX.c,307 :: 		RCEN_bit=1; // habilita la recepcion continua
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;_RX.c,310 :: 		INT0F_bit=0; /// LIMPIA LA BENDERA
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;_RX.c,311 :: 		INT0E_bit=1; // AUTORIZA INT PROPIA
	BSF         INT0E_bit+0, BitPos(INT0E_bit+0) 
;_RX.c,312 :: 		INTEDG0_bit=0; // FLANCO DE BAJADOS
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;_RX.c,315 :: 		INT1F_bit=0; /// LIMPIA LA BENDERA
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;_RX.c,316 :: 		INT1E_bit=1; // AUTORIZA INT PROPIA
	BSF         INT1E_bit+0, BitPos(INT1E_bit+0) 
;_RX.c,317 :: 		INTEDG1_bit=0; // FLANCO DE BAJADOS
	BCF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;_RX.c,318 :: 		INT1IP_bit=0;  // baja priorida
	BCF         INT1IP_bit+0, BitPos(INT1IP_bit+0) 
;_RX.c,321 :: 		T1CON=0;
	CLRF        T1CON+0 
;_RX.c,323 :: 		TMR1H=60;
	MOVLW       60
	MOVWF       TMR1H+0 
;_RX.c,324 :: 		TMR1L=175;
	MOVLW       175
	MOVWF       TMR1L+0 
;_RX.c,326 :: 		T1CKPS1_bit=1;
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;_RX.c,327 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;_RX.c,330 :: 		TMR1IF_bit=0;  //limpia bandera
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;_RX.c,331 :: 		TMR1IE_bit=1;// habilita la INTERRPCION
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;_RX.c,333 :: 		TMR1ON_bit=1; //prende
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;_RX.c,334 :: 		TMR1IP_bit=1; // prioridad alta
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;_RX.c,338 :: 		T0CON=0;
	CLRF        T0CON+0 
;_RX.c,340 :: 		TMR0H=11;
	MOVLW       11
	MOVWF       TMR0H+0 
;_RX.c,341 :: 		TMR0L=220;
	MOVLW       220
	MOVWF       TMR0L+0 
;_RX.c,344 :: 		T0PS2_bit=0;
	BCF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;_RX.c,345 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;_RX.c,346 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;_RX.c,349 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;_RX.c,350 :: 		TMR0IE_bit=1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;_RX.c,352 :: 		T08BIT_bit=0; // trabaja 16 bit
	BCF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;_RX.c,353 :: 		TMR0ON_bit=1;  // prende timer 0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;_RX.c,354 :: 		TMR0IP_bit=0;// prioridad alta
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;_RX.c,357 :: 		RCIP_bit=1; // alta prioridad
	BSF         RCIP_bit+0, BitPos(RCIP_bit+0) 
;_RX.c,358 :: 		RCIF_bit=0;//limpia la bansera
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;_RX.c,359 :: 		RCIE_bit=1; // habilita la interrupcion
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;_RX.c,361 :: 		CREN_bit=1; // habilita la recepcion continua
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;_RX.c,366 :: 		IPEN_bit=1;  // autoroizsa prioridas
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;_RX.c,370 :: 		GIEL_bit=1; // aurotiza las bajas
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
;_RX.c,371 :: 		GIE_bit=1; // AUTORIZA LAS INTERRPCIONES  altas
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;_RX.c,376 :: 		while (1)
L_main38:
;_RX.c,378 :: 		ledmain=!ledmain;
	BTG         RE2_bit+0, BitPos(RE2_bit+0) 
;_RX.c,383 :: 		if(flag_rx==1)
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main40
;_RX.c,386 :: 		procesa_gps();
	CALL        _procesa_GPS+0, 0
;_RX.c,389 :: 		if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.550437))  ledrx1=1; else ledrx1=0;
	MOVF        _latitud+0, 0 
	MOVWF       R4 
	MOVF        _latitud+1, 0 
	MOVWF       R5 
	MOVF        _latitud+2, 0 
	MOVWF       R6 
	MOVF        _latitud+3, 0 
	MOVWF       R7 
	MOVLW       167
	MOVWF       R0 
	MOVLW       95
	MOVWF       R1 
	MOVLW       38
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
	MOVLW       160
	MOVWF       R4 
	MOVLW       171
	MOVWF       R5 
	MOVLW       38
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        _latitud+0, 0 
	MOVWF       R0 
	MOVF        _latitud+1, 0 
	MOVWF       R1 
	MOVF        _latitud+2, 0 
	MOVWF       R2 
	MOVF        _latitud+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
	MOVF        _longitud+0, 0 
	MOVWF       R4 
	MOVF        _longitud+1, 0 
	MOVWF       R5 
	MOVF        _longitud+2, 0 
	MOVWF       R6 
	MOVF        _longitud+3, 0 
	MOVWF       R7 
	MOVLW       115
	MOVWF       R0 
	MOVLW       29
	MOVWF       R1 
	MOVLW       151
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
	MOVLW       211
	MOVWF       R4 
	MOVLW       25
	MOVWF       R5 
	MOVLW       151
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        _longitud+0, 0 
	MOVWF       R0 
	MOVF        _longitud+1, 0 
	MOVWF       R1 
	MOVF        _longitud+2, 0 
	MOVWF       R2 
	MOVF        _longitud+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
L__main46:
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_main44
L_main43:
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
L_main44:
;_RX.c,393 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;_RX.c,394 :: 		puntero_rx=0;
	CLRF        _puntero_rx+0 
;_RX.c,397 :: 		CREN_bit=0; //limpia buffer
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;_RX.c,398 :: 		CREN_bit=1;  // habilitar la recpcion
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;_RX.c,400 :: 		RCIE_bit=1; // habilita la interrpcion
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;_RX.c,402 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;_RX.c,404 :: 		}
L_main40:
;_RX.c,410 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main45:
	DECFSZ      R13, 1, 1
	BRA         L_main45
	DECFSZ      R12, 1, 1
	BRA         L_main45
	DECFSZ      R11, 1, 1
	BRA         L_main45
	NOP
	NOP
;_RX.c,412 :: 		}
	GOTO        L_main38
;_RX.c,417 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
