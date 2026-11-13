
_lee_trama:

;GPS2018.c,42 :: 		char lee_trama()   //funcio que retorna 1 si hay dato sino 0
;GPS2018.c,46 :: 		memset(trama_rx,100,0);
	MOVLW       _trama_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       100
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;GPS2018.c,47 :: 		demora=0;
	CLRF        _demora+0 
	CLRF        _demora+1 
	CLRF        _demora+2 
	CLRF        _demora+3 
;GPS2018.c,48 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;GPS2018.c,49 :: 		estado_rec=cap_P;
	CLRF        _estado_rec+0 
;GPS2018.c,51 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;GPS2018.c,52 :: 		CREN_bit=0; //
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;GPS2018.c,53 :: 		CREN_bit=1; //
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;GPS2018.c,55 :: 		while (demora<=96667)
L_lee_trama0:
	MOVF        _demora+3, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama35
	MOVF        _demora+2, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama35
	MOVF        _demora+1, 0 
	SUBLW       121
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama35
	MOVF        _demora+0, 0 
	SUBLW       155
L__lee_trama35:
	BTFSS       STATUS+0, 0 
	GOTO        L_lee_trama1
;GPS2018.c,57 :: 		demora++;
	MOVLW       1
	ADDWF       _demora+0, 1 
	MOVLW       0
	ADDWFC      _demora+1, 1 
	ADDWFC      _demora+2, 1 
	ADDWFC      _demora+3, 1 
;GPS2018.c,58 :: 		switch (estado_rec)
	GOTO        L_lee_trama2
;GPS2018.c,60 :: 		case cap_P:
L_lee_trama4:
;GPS2018.c,61 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama5
;GPS2018.c,63 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;GPS2018.c,64 :: 		trama_rx[contador_trama]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1H 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;GPS2018.c,65 :: 		if (dato_rx!='P') contador_trama=0;    //no fue el dato que me interesa
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama6
	CLRF        _contador_trama+0 
	GOTO        L_lee_trama7
L_lee_trama6:
;GPS2018.c,68 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;GPS2018.c,69 :: 		estado_rec=cap_G; //pasa al estado de capturar la g
	MOVLW       1
	MOVWF       _estado_rec+0 
;GPS2018.c,70 :: 		}
L_lee_trama7:
;GPS2018.c,71 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;GPS2018.c,72 :: 		}
L_lee_trama5:
;GPS2018.c,73 :: 		break;
	GOTO        L_lee_trama3
;GPS2018.c,75 :: 		case cap_G:
L_lee_trama8:
;GPS2018.c,76 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama9
;GPS2018.c,78 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;GPS2018.c,79 :: 		trama_rx[contador_trama]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1H 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;GPS2018.c,80 :: 		if (dato_rx!='G')
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama10
;GPS2018.c,82 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;GPS2018.c,83 :: 		estado_rec=cap_P; //regresa al estado inical
	CLRF        _estado_rec+0 
;GPS2018.c,84 :: 		}
	GOTO        L_lee_trama11
L_lee_trama10:
;GPS2018.c,87 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;GPS2018.c,88 :: 		estado_rec=cap_G2; //pasa al estado de capturar la g
	MOVLW       2
	MOVWF       _estado_rec+0 
;GPS2018.c,89 :: 		}
L_lee_trama11:
;GPS2018.c,90 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;GPS2018.c,91 :: 		}
L_lee_trama9:
;GPS2018.c,92 :: 		break;
	GOTO        L_lee_trama3
;GPS2018.c,94 :: 		case cap_G2:
L_lee_trama12:
;GPS2018.c,95 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama13
;GPS2018.c,97 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;GPS2018.c,98 :: 		trama_rx[contador_trama]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1H 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;GPS2018.c,99 :: 		if (dato_rx!='G')
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama14
;GPS2018.c,101 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;GPS2018.c,102 :: 		estado_rec=cap_P; //regresa al estado inical
	CLRF        _estado_rec+0 
;GPS2018.c,103 :: 		}
	GOTO        L_lee_trama15
L_lee_trama14:
;GPS2018.c,106 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;GPS2018.c,107 :: 		estado_rec=cap_A; //pasa al estado de capturar la a
	MOVLW       3
	MOVWF       _estado_rec+0 
;GPS2018.c,108 :: 		}
L_lee_trama15:
;GPS2018.c,109 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;GPS2018.c,110 :: 		}
L_lee_trama13:
;GPS2018.c,111 :: 		break;
	GOTO        L_lee_trama3
;GPS2018.c,114 :: 		case cap_A:
L_lee_trama16:
;GPS2018.c,115 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama17
;GPS2018.c,117 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;GPS2018.c,118 :: 		trama_rx[contador_trama]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1H 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;GPS2018.c,119 :: 		if (dato_rx!='A')
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama18
;GPS2018.c,121 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;GPS2018.c,122 :: 		estado_rec=cap_P; //regresa al estado inical
	CLRF        _estado_rec+0 
;GPS2018.c,124 :: 		}
	GOTO        L_lee_trama19
L_lee_trama18:
;GPS2018.c,127 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;GPS2018.c,128 :: 		estado_rec=esp_final; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec+0 
;GPS2018.c,129 :: 		}
L_lee_trama19:
;GPS2018.c,130 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;GPS2018.c,131 :: 		}
L_lee_trama17:
;GPS2018.c,133 :: 		break;
	GOTO        L_lee_trama3
;GPS2018.c,135 :: 		case esp_final:
L_lee_trama20:
;GPS2018.c,136 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama21
;GPS2018.c,138 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;GPS2018.c,139 :: 		trama_rx[contador_trama]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1H 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;GPS2018.c,140 :: 		contador_trama++;
	INCF        _contador_trama+0, 1 
;GPS2018.c,141 :: 		if (dato_rx=='*')   return(1); //sale del procedimiento
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama22
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_trama
L_lee_trama22:
;GPS2018.c,142 :: 		RCIF_bit=0; //limpia la bandera de recepcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;GPS2018.c,143 :: 		}
L_lee_trama21:
;GPS2018.c,144 :: 		break;
	GOTO        L_lee_trama3
;GPS2018.c,147 :: 		}//fin del switch
L_lee_trama2:
	MOVF        _estado_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama4
	MOVF        _estado_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama8
	MOVF        _estado_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama12
	MOVF        _estado_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama16
	MOVF        _estado_rec+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama20
L_lee_trama3:
;GPS2018.c,149 :: 		}//fin del while demora
	GOTO        L_lee_trama0
L_lee_trama1:
;GPS2018.c,150 :: 		return(0);
	CLRF        R0 
;GPS2018.c,152 :: 		}
L_end_lee_trama:
	RETURN      0
; end of _lee_trama

_main:

;GPS2018.c,156 :: 		void main()
;GPS2018.c,159 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;GPS2018.c,160 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;GPS2018.c,161 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;GPS2018.c,164 :: 		trisc.b7=1;//entrada serial
	BSF         TRISC+0, 7 
;GPS2018.c,165 :: 		trisc.b6=0;//salida serial
	BCF         TRISC+0, 6 
;GPS2018.c,167 :: 		trisc.b0=0;//salida led
	BCF         TRISC+0, 0 
;GPS2018.c,170 :: 		UART1_Init(9600);    // velocidad en baudios del gps usado
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;GPS2018.c,172 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;GPS2018.c,173 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GPS2018.c,174 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GPS2018.c,176 :: 		Lcd_Out(1,1,"LAT= ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_GPS2018+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_GPS2018+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GPS2018.c,177 :: 		Lcd_Out(2,1,"LON= ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_GPS2018+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_GPS2018+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GPS2018.c,179 :: 		Delay_ms(5000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
;GPS2018.c,182 :: 		while (1)
L_main24:
;GPS2018.c,184 :: 		lee_trama();
	CALL        _lee_trama+0, 0
;GPS2018.c,187 :: 		strcpy(captura_rx, strtok(trama_rx, ","));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr3_GPS2018+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr3_GPS2018+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;GPS2018.c,188 :: 		strcpy(captura_rx, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr4_GPS2018+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr4_GPS2018+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;GPS2018.c,189 :: 		strcpy(captura_rx, strtok(0, ","));  //captura hasta lo que esta tercera coma es decir, latitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr5_GPS2018+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr5_GPS2018+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;GPS2018.c,190 :: 		memset(c_grados,0,10);//limpía los grados
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
;GPS2018.c,191 :: 		strncpy(c_grados,captura_rx,2);//captura los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       2
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;GPS2018.c,192 :: 		grados=atof(c_grados);      // pasa de alfanumerico o cadena a flotante
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
;GPS2018.c,195 :: 		minutos=atof(&captura_rx[2])/60.0;  //lo pasa a grados
	MOVLW       _captura_rx+2
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captura_rx+2)
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
;GPS2018.c,196 :: 		latitud=grados+minutos;
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
;GPS2018.c,198 :: 		strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr6_GPS2018+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr6_GPS2018+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;GPS2018.c,199 :: 		if (captura_rx[0]=='S') latitud=-latitud;
	MOVF        _captura_rx+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_main26
	BTG         _latitud+2, 7 
L_main26:
;GPS2018.c,201 :: 		sprintf(texto,"%f",latitud);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_7_GPS2018+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_7_GPS2018+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_7_GPS2018+0)
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
;GPS2018.c,203 :: 		Lcd_Out(1,6,"            ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_GPS2018+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_GPS2018+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GPS2018.c,204 :: 		Lcd_Out(1,6,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GPS2018.c,208 :: 		strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma la longitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr9_GPS2018+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr9_GPS2018+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;GPS2018.c,209 :: 		memset(c_grados,0,10);//limpía los grados
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
;GPS2018.c,210 :: 		strncpy(c_grados,captura_rx,3);//captura los grados  3 posiciones
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       3
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;GPS2018.c,211 :: 		grados=atof(c_grados);
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
;GPS2018.c,213 :: 		minutos=atof(&captura_rx[3])/60.0;  //lo pasa a grados
	MOVLW       _captura_rx+3
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captura_rx+3)
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
;GPS2018.c,214 :: 		longitud=grados+minutos;
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
;GPS2018.c,215 :: 		strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr10_GPS2018+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr10_GPS2018+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;GPS2018.c,216 :: 		if (captura_rx[0]=='W') longitud=-longitud;
	MOVF        _captura_rx+0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
	BTG         _longitud+2, 7 
L_main27:
;GPS2018.c,217 :: 		sprintf(texto,"%f",longitud);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_11_GPS2018+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_11_GPS2018+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_11_GPS2018+0)
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
;GPS2018.c,218 :: 		Lcd_Out(2,6,"            ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_GPS2018+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_GPS2018+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GPS2018.c,219 :: 		Lcd_Out(2,6,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GPS2018.c,222 :: 		if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.5531294 ))  led=1; else led=0;
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
	GOTO        L_main30
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
	GOTO        L_main30
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
	GOTO        L_main30
	MOVLW       52
	MOVWF       R4 
	MOVLW       27
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
	GOTO        L_main30
L__main33:
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
	GOTO        L_main31
L_main30:
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
L_main31:
;GPS2018.c,226 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
	NOP
	NOP
;GPS2018.c,231 :: 		}
	GOTO        L_main24
;GPS2018.c,235 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
