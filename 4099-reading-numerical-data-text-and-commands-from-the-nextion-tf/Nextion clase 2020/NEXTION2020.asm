
_interrupciones:

;NEXTION2020.c,35 :: 		void interrupciones() iv 0x0008 ics ICS_AUTO
;NEXTION2020.c,37 :: 		nextion_interrupcion();
	CALL        _nextion_interrupcion+0, 0
;NEXTION2020.c,40 :: 		}
L_end_interrupciones:
L__interrupciones26:
	RETFIE      1
; end of _interrupciones

_procesa_rx_nextion:

;NEXTION2020.c,41 :: 		void procesa_rx_nextion()
;NEXTION2020.c,48 :: 		if (strstr(trama_rx_nextion,"onle1"))  led1=1;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1_NEXTION2020+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1_NEXTION2020+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion0
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
	GOTO        L_procesa_rx_nextion1
L_procesa_rx_nextion0:
;NEXTION2020.c,49 :: 		else if (strstr(trama_rx_nextion,"offle1"))  led1=0;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr2_NEXTION2020+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr2_NEXTION2020+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion2
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
	GOTO        L_procesa_rx_nextion3
L_procesa_rx_nextion2:
;NEXTION2020.c,52 :: 		else  if (strstr(trama_rx_nextion,"pwm1"))    // analiza la orden
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr3_NEXTION2020+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr3_NEXTION2020+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion4
;NEXTION2020.c,54 :: 		strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr4_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr4_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,55 :: 		strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr5_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr5_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,56 :: 		nextion_var_corta=captura_nextion[0];
	MOVF        _captura_nextion+0, 0 
	MOVWF       _nextion_var_corta+0 
;NEXTION2020.c,58 :: 		PWM1_Set_Duty(nextion_var_corta); // saca el valor capturado
	MOVF        _captura_nextion+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;NEXTION2020.c,60 :: 		}
	GOTO        L_procesa_rx_nextion5
L_procesa_rx_nextion4:
;NEXTION2020.c,62 :: 		else  if (strstr(trama_rx_nextion,"va1"))
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr6_NEXTION2020+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr6_NEXTION2020+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion6
;NEXTION2020.c,65 :: 		strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr7_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr7_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,66 :: 		strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr8_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr8_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,71 :: 		largo_cap=strlen(captura_nextion);
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       procesa_rx_nextion_largo_cap_L0+0 
;NEXTION2020.c,73 :: 		switch (largo_cap)
	GOTO        L_procesa_rx_nextion7
;NEXTION2020.c,75 :: 		case 1:
L_procesa_rx_nextion9:
;NEXTION2020.c,76 :: 		nextion_var_larga=(unsigned long)captura_nextion[0];
	MOVF        _captura_nextion+0, 0 
	MOVWF       _nextion_var_larga+0 
	MOVLW       0
	MOVWF       _nextion_var_larga+1 
	MOVWF       _nextion_var_larga+2 
	MOVWF       _nextion_var_larga+3 
;NEXTION2020.c,77 :: 		break;
	GOTO        L_procesa_rx_nextion8
;NEXTION2020.c,79 :: 		case 2:
L_procesa_rx_nextion10:
;NEXTION2020.c,80 :: 		nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256;
	MOVF        _captura_nextion+0, 0 
	MOVWF       _nextion_var_larga+0 
	MOVLW       0
	MOVWF       _nextion_var_larga+1 
	MOVWF       _nextion_var_larga+2 
	MOVWF       _nextion_var_larga+3 
	MOVF        _captura_nextion+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVWF       R8 
	MOVF        R7, 0 
	MOVWF       R3 
	MOVF        R6, 0 
	MOVWF       R2 
	MOVF        R5, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	ADDWF       _nextion_var_larga+0, 1 
	MOVF        R1, 0 
	ADDWFC      _nextion_var_larga+1, 1 
	MOVF        R2, 0 
	ADDWFC      _nextion_var_larga+2, 1 
	MOVF        R3, 0 
	ADDWFC      _nextion_var_larga+3, 1 
;NEXTION2020.c,81 :: 		break;
	GOTO        L_procesa_rx_nextion8
;NEXTION2020.c,83 :: 		case 3:
L_procesa_rx_nextion11:
;NEXTION2020.c,84 :: 		nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256+(unsigned long)captura_nextion[2]*65536;
	MOVF        _captura_nextion+0, 0 
	MOVWF       _nextion_var_larga+0 
	MOVLW       0
	MOVWF       _nextion_var_larga+1 
	MOVWF       _nextion_var_larga+2 
	MOVWF       _nextion_var_larga+3 
	MOVF        _captura_nextion+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVWF       R8 
	MOVF        R7, 0 
	MOVWF       R3 
	MOVF        R6, 0 
	MOVWF       R2 
	MOVF        R5, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	ADDWF       _nextion_var_larga+0, 1 
	MOVF        R1, 0 
	ADDWFC      _nextion_var_larga+1, 1 
	MOVF        R2, 0 
	ADDWFC      _nextion_var_larga+2, 1 
	MOVF        R3, 0 
	ADDWFC      _nextion_var_larga+3, 1 
	MOVF        _captura_nextion+2, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVWF       R8 
	MOVF        R6, 0 
	MOVWF       R3 
	MOVF        R5, 0 
	MOVWF       R2 
	CLRF        R0 
	CLRF        R1 
	MOVF        R0, 0 
	ADDWF       _nextion_var_larga+0, 1 
	MOVF        R1, 0 
	ADDWFC      _nextion_var_larga+1, 1 
	MOVF        R2, 0 
	ADDWFC      _nextion_var_larga+2, 1 
	MOVF        R3, 0 
	ADDWFC      _nextion_var_larga+3, 1 
;NEXTION2020.c,85 :: 		break;
	GOTO        L_procesa_rx_nextion8
;NEXTION2020.c,87 :: 		case 4:
L_procesa_rx_nextion12:
;NEXTION2020.c,88 :: 		nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256+(unsigned long)captura_nextion[2]*65536+(unsigned long)captura_nextion[3]*16777216;
	MOVF        _captura_nextion+0, 0 
	MOVWF       _nextion_var_larga+0 
	MOVLW       0
	MOVWF       _nextion_var_larga+1 
	MOVWF       _nextion_var_larga+2 
	MOVWF       _nextion_var_larga+3 
	MOVF        _captura_nextion+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVWF       R8 
	MOVF        R7, 0 
	MOVWF       R3 
	MOVF        R6, 0 
	MOVWF       R2 
	MOVF        R5, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	ADDWF       _nextion_var_larga+0, 1 
	MOVF        R1, 0 
	ADDWFC      _nextion_var_larga+1, 1 
	MOVF        R2, 0 
	ADDWFC      _nextion_var_larga+2, 1 
	MOVF        R3, 0 
	ADDWFC      _nextion_var_larga+3, 1 
	MOVF        _captura_nextion+2, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVWF       R8 
	MOVF        R6, 0 
	MOVWF       R3 
	MOVF        R5, 0 
	MOVWF       R2 
	CLRF        R0 
	CLRF        R1 
	MOVF        R0, 0 
	ADDWF       _nextion_var_larga+0, 1 
	MOVF        R1, 0 
	ADDWFC      _nextion_var_larga+1, 1 
	MOVF        R2, 0 
	ADDWFC      _nextion_var_larga+2, 1 
	MOVF        R3, 0 
	ADDWFC      _nextion_var_larga+3, 1 
	MOVF        _captura_nextion+3, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVWF       R8 
	MOVF        R5, 0 
	MOVWF       R3 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	MOVF        R0, 0 
	ADDWF       _nextion_var_larga+0, 1 
	MOVF        R1, 0 
	ADDWFC      _nextion_var_larga+1, 1 
	MOVF        R2, 0 
	ADDWFC      _nextion_var_larga+2, 1 
	MOVF        R3, 0 
	ADDWFC      _nextion_var_larga+3, 1 
;NEXTION2020.c,89 :: 		break;
	GOTO        L_procesa_rx_nextion8
;NEXTION2020.c,90 :: 		} // fin del switch
L_procesa_rx_nextion7:
	MOVF        procesa_rx_nextion_largo_cap_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion9
	MOVF        procesa_rx_nextion_largo_cap_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion10
	MOVF        procesa_rx_nextion_largo_cap_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion11
	MOVF        procesa_rx_nextion_largo_cap_L0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion12
L_procesa_rx_nextion8:
;NEXTION2020.c,92 :: 		LongWordToStr(nextion_var_larga,texto);      // lo pasa a cadena
	MOVF        _nextion_var_larga+0, 0 
	MOVWF       FARG_LongWordToStr_input+0 
	MOVF        _nextion_var_larga+1, 0 
	MOVWF       FARG_LongWordToStr_input+1 
	MOVF        _nextion_var_larga+2, 0 
	MOVWF       FARG_LongWordToStr_input+2 
	MOVF        _nextion_var_larga+3, 0 
	MOVWF       FARG_LongWordToStr_input+3 
	MOVLW       _texto+0
	MOVWF       FARG_LongWordToStr_output+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_LongWordToStr_output+1 
	CALL        _LongWordToStr+0, 0
;NEXTION2020.c,93 :: 		Ltrim(texto); // quita espacios vacios a la izquierda
	MOVLW       _texto+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;NEXTION2020.c,95 :: 		Lcd_Out(2,2,"            ");// borra antes de escribir
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_NEXTION2020+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_NEXTION2020+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;NEXTION2020.c,96 :: 		Lcd_Out(2,2,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;NEXTION2020.c,98 :: 		}
	GOTO        L_procesa_rx_nextion13
L_procesa_rx_nextion6:
;NEXTION2020.c,100 :: 		else   if (strstr(trama_rx_nextion,"text1"))
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr10_NEXTION2020+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr10_NEXTION2020+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion14
;NEXTION2020.c,102 :: 		strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr11_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr11_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,103 :: 		strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr12_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr12_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,104 :: 		Lcd_Out(3,1,"            ");   // borra linea
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_NEXTION2020+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_NEXTION2020+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;NEXTION2020.c,105 :: 		Lcd_Out(3,1,captura_nextion);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;NEXTION2020.c,107 :: 		}
	GOTO        L_procesa_rx_nextion15
L_procesa_rx_nextion14:
;NEXTION2020.c,109 :: 		else if (strstr(trama_rx_nextion,"led"))
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr14_NEXTION2020+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr14_NEXTION2020+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion16
;NEXTION2020.c,112 :: 		strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr15_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr15_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,113 :: 		strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr16_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr16_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,114 :: 		nextion_var=atoi(captura_nextion); // captura la psocion
	MOVLW       _captura_nextion+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _nextion_var+0 
;NEXTION2020.c,115 :: 		strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr17_NEXTION2020+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr17_NEXTION2020+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_nextion+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;NEXTION2020.c,116 :: 		nextion_var_corta=atoi(captura_nextion);     // captura el estado
	MOVLW       _captura_nextion+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captura_nextion+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _nextion_var_corta+0 
;NEXTION2020.c,117 :: 		switch (nextion_var)
	GOTO        L_procesa_rx_nextion17
;NEXTION2020.c,119 :: 		case 1:
L_procesa_rx_nextion19:
;NEXTION2020.c,120 :: 		led1= nextion_var_corta;
	BTFSC       _nextion_var_corta+0, 0 
	GOTO        L__procesa_rx_nextion28
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
	GOTO        L__procesa_rx_nextion29
L__procesa_rx_nextion28:
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
L__procesa_rx_nextion29:
;NEXTION2020.c,121 :: 		break;
	GOTO        L_procesa_rx_nextion18
;NEXTION2020.c,123 :: 		case 2:
L_procesa_rx_nextion20:
;NEXTION2020.c,124 :: 		led2= nextion_var_corta;
	BTFSC       _nextion_var_corta+0, 0 
	GOTO        L__procesa_rx_nextion30
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
	GOTO        L__procesa_rx_nextion31
L__procesa_rx_nextion30:
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
L__procesa_rx_nextion31:
;NEXTION2020.c,125 :: 		break;
	GOTO        L_procesa_rx_nextion18
;NEXTION2020.c,129 :: 		}// fin del switch
L_procesa_rx_nextion17:
	MOVF        _nextion_var+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion19
	MOVF        _nextion_var+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx_nextion20
L_procesa_rx_nextion18:
;NEXTION2020.c,130 :: 		}
L_procesa_rx_nextion16:
L_procesa_rx_nextion15:
L_procesa_rx_nextion13:
L_procesa_rx_nextion5:
L_procesa_rx_nextion3:
L_procesa_rx_nextion1:
;NEXTION2020.c,136 :: 		}
L_end_procesa_rx_nextion:
	RETURN      0
; end of _procesa_rx_nextion

_main:

;NEXTION2020.c,137 :: 		void main()
;NEXTION2020.c,140 :: 		ADCON1=0B1111;
	MOVLW       15
	MOVWF       ADCON1+0 
;NEXTION2020.c,142 :: 		TRISC6_bit=0; // TX   SALIDA
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;NEXTION2020.c,143 :: 		TRISC7_bit=1;  //RX ENTRADA
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;NEXTION2020.c,145 :: 		TRISC2_bit=0; // SALIDA PWM
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;NEXTION2020.c,147 :: 		TRISC0_bit=0;
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;NEXTION2020.c,148 :: 		TRISC1_bit=0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;NEXTION2020.c,149 :: 		TRISD7_bit=0;
	BCF         TRISD7_bit+0, BitPos(TRISD7_bit+0) 
;NEXTION2020.c,150 :: 		INTCON=0b01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;NEXTION2020.c,152 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;NEXTION2020.c,153 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;NEXTION2020.c,154 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;NEXTION2020.c,155 :: 		Lcd_Out(1,1,"   NEXTION 2020");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_NEXTION2020+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_NEXTION2020+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;NEXTION2020.c,157 :: 		PWM1_Init(500);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;NEXTION2020.c,158 :: 		PWM1_Set_Duty(127);
	MOVLW       127
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;NEXTION2020.c,159 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;NEXTION2020.c,161 :: 		nextion_init();
	CALL        _nextion_init+0, 0
;NEXTION2020.c,162 :: 		GIE_bit=1; // autoriza inrerrpciones
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;NEXTION2020.c,164 :: 		while (1)
L_main21:
;NEXTION2020.c,166 :: 		if (flag_rx1==1)
	MOVF        _flag_rx1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;NEXTION2020.c,168 :: 		procesa_rx_nextion();
	CALL        _procesa_rx_nextion+0, 0
;NEXTION2020.c,169 :: 		memset(trama_rx_nextion,0,50);// limpia la trama
	MOVLW       _trama_rx_nextion+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;NEXTION2020.c,171 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;NEXTION2020.c,172 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;NEXTION2020.c,173 :: 		RCIF_bit=0;   // limnpia la bandera de interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;NEXTION2020.c,174 :: 		RCIE_bit=1;// habilita la interrpcion nuevamente
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;NEXTION2020.c,175 :: 		flag_rx1=0;
	CLRF        _flag_rx1+0 
;NEXTION2020.c,178 :: 		}
L_main23:
;NEXTION2020.c,181 :: 		LED=!led;
	BTG         LATD7_bit+0, BitPos(LATD7_bit+0) 
;NEXTION2020.c,182 :: 		Delay_ms(150);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	DECFSZ      R11, 1, 1
	BRA         L_main24
;NEXTION2020.c,184 :: 		}
	GOTO        L_main21
;NEXTION2020.c,187 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
