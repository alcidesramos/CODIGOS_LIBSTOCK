
_lee_trama:

;UBIDOTS.c,29 :: 		char lee_trama()   //funcio que retorna 1 si hay dato sino 0
;UBIDOTS.c,33 :: 		memset(trama_rx,50,0);
	MOVLW       _trama_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       50
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;UBIDOTS.c,34 :: 		demora=0;
	CLRF        _demora+0 
	CLRF        _demora+1 
	CLRF        _demora+2 
	CLRF        _demora+3 
;UBIDOTS.c,35 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;UBIDOTS.c,36 :: 		estado_rec=cap_l;
	CLRF        _estado_rec+0 
;UBIDOTS.c,38 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;UBIDOTS.c,39 :: 		CREN_bit=0; //
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;UBIDOTS.c,40 :: 		CREN_bit=1; //
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;UBIDOTS.c,42 :: 		while (demora<=66667)
L_lee_trama0:
	MOVF        _demora+3, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama50
	MOVF        _demora+2, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama50
	MOVF        _demora+1, 0 
	SUBLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama50
	MOVF        _demora+0, 0 
	SUBLW       107
L__lee_trama50:
	BTFSS       STATUS+0, 0 
	GOTO        L_lee_trama1
;UBIDOTS.c,44 :: 		demora++;
	MOVLW       1
	ADDWF       _demora+0, 1 
	MOVLW       0
	ADDWFC      _demora+1, 1 
	ADDWFC      _demora+2, 1 
	ADDWFC      _demora+3, 1 
;UBIDOTS.c,45 :: 		switch (estado_rec)
	GOTO        L_lee_trama2
;UBIDOTS.c,47 :: 		case cap_l:
L_lee_trama4:
;UBIDOTS.c,48 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama5
;UBIDOTS.c,50 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;UBIDOTS.c,51 :: 		trama_rx[contador_trama]=dato_rx;
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
;UBIDOTS.c,52 :: 		if (dato_rx!='l') contador_trama=0;    //no fue el dato que me interesa
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       108
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama6
	CLRF        _contador_trama+0 
	GOTO        L_lee_trama7
L_lee_trama6:
;UBIDOTS.c,55 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;UBIDOTS.c,56 :: 		estado_rec=cap_u; //pasa al estado de capturar la u
	MOVLW       1
	MOVWF       _estado_rec+0 
;UBIDOTS.c,57 :: 		}
L_lee_trama7:
;UBIDOTS.c,58 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;UBIDOTS.c,59 :: 		}
L_lee_trama5:
;UBIDOTS.c,60 :: 		break;
	GOTO        L_lee_trama3
;UBIDOTS.c,61 :: 		case cap_u:
L_lee_trama8:
;UBIDOTS.c,62 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama9
;UBIDOTS.c,64 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;UBIDOTS.c,65 :: 		trama_rx[contador_trama]=dato_rx;
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
;UBIDOTS.c,66 :: 		if (dato_rx!='u')
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       117
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama10
;UBIDOTS.c,68 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;UBIDOTS.c,69 :: 		estado_rec=cap_l; //regresa al estado inical
	CLRF        _estado_rec+0 
;UBIDOTS.c,70 :: 		}
	GOTO        L_lee_trama11
L_lee_trama10:
;UBIDOTS.c,73 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;UBIDOTS.c,74 :: 		estado_rec=cap_e; //pasa al estado de capturar la u
	MOVLW       2
	MOVWF       _estado_rec+0 
;UBIDOTS.c,75 :: 		}
L_lee_trama11:
;UBIDOTS.c,76 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;UBIDOTS.c,77 :: 		}
L_lee_trama9:
;UBIDOTS.c,78 :: 		break;
	GOTO        L_lee_trama3
;UBIDOTS.c,80 :: 		case cap_e:
L_lee_trama12:
;UBIDOTS.c,81 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama13
;UBIDOTS.c,83 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;UBIDOTS.c,84 :: 		trama_rx[contador_trama]=dato_rx;
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
;UBIDOTS.c,85 :: 		if (dato_rx!='e')
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama14
;UBIDOTS.c,87 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;UBIDOTS.c,88 :: 		estado_rec=cap_l; //regresa al estado inical
	CLRF        _estado_rec+0 
;UBIDOTS.c,89 :: 		}
	GOTO        L_lee_trama15
L_lee_trama14:
;UBIDOTS.c,92 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;UBIDOTS.c,93 :: 		estado_rec=cap_co; //pasa al estado de capturar la u
	MOVLW       3
	MOVWF       _estado_rec+0 
;UBIDOTS.c,94 :: 		}
L_lee_trama15:
;UBIDOTS.c,95 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;UBIDOTS.c,96 :: 		}
L_lee_trama13:
;UBIDOTS.c,97 :: 		break;
	GOTO        L_lee_trama3
;UBIDOTS.c,100 :: 		case cap_co:
L_lee_trama16:
;UBIDOTS.c,101 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama17
;UBIDOTS.c,103 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;UBIDOTS.c,104 :: 		trama_rx[contador_trama]=dato_rx;
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
;UBIDOTS.c,105 :: 		if (dato_rx!='\"')
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       34
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama18
;UBIDOTS.c,107 :: 		contador_trama=0;
	CLRF        _contador_trama+0 
;UBIDOTS.c,108 :: 		estado_rec=cap_l; //regresa al estado inical
	CLRF        _estado_rec+0 
;UBIDOTS.c,110 :: 		}
	GOTO        L_lee_trama19
L_lee_trama18:
;UBIDOTS.c,113 :: 		contador_trama++;//incrementa contador para proximo dato
	INCF        _contador_trama+0, 1 
;UBIDOTS.c,114 :: 		estado_rec=esp_final; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec+0 
;UBIDOTS.c,115 :: 		}
L_lee_trama19:
;UBIDOTS.c,116 :: 		RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;UBIDOTS.c,117 :: 		}
L_lee_trama17:
;UBIDOTS.c,119 :: 		break;
	GOTO        L_lee_trama3
;UBIDOTS.c,121 :: 		case esp_final:
L_lee_trama20:
;UBIDOTS.c,122 :: 		if (RCIF_bit==1) //si hay un dat recibido
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_lee_trama21
;UBIDOTS.c,124 :: 		dato_rx=UART_Read(); //lee el dato
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       lee_trama_dato_rx_L0+0 
;UBIDOTS.c,125 :: 		trama_rx[contador_trama]=dato_rx;
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
;UBIDOTS.c,126 :: 		contador_trama++;
	INCF        _contador_trama+0, 1 
;UBIDOTS.c,127 :: 		if (dato_rx=='}')   return(1); //sale del procedimiento
	MOVF        lee_trama_dato_rx_L0+0, 0 
	XORLW       125
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama22
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_trama
L_lee_trama22:
;UBIDOTS.c,128 :: 		RCIF_bit=0; //limpia la bandera de recepcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;UBIDOTS.c,129 :: 		}
L_lee_trama21:
;UBIDOTS.c,130 :: 		break;
	GOTO        L_lee_trama3
;UBIDOTS.c,133 :: 		}//fin del switch
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
;UBIDOTS.c,135 :: 		}//fin del while demora
	GOTO        L_lee_trama0
L_lee_trama1:
;UBIDOTS.c,136 :: 		return(0);
	CLRF        R0 
;UBIDOTS.c,138 :: 		}
L_end_lee_trama:
	RETURN      0
; end of _lee_trama

_strlen_const:

;UBIDOTS.c,142 :: 		unsigned long strlen_const(const char *const_pun)
;UBIDOTS.c,144 :: 		unsigned int cuen_const=0;
	CLRF        strlen_const_cuen_const_L0+0 
	CLRF        strlen_const_cuen_const_L0+1 
;UBIDOTS.c,146 :: 		while (*const_pun++!=0) cuen_const++;
L_strlen_const23:
	MOVF        FARG_strlen_const_const_pun+0, 0 
	MOVWF       R0 
	MOVF        FARG_strlen_const_const_pun+1, 0 
	MOVWF       R1 
	MOVF        FARG_strlen_const_const_pun+2, 0 
	MOVWF       R2 
	MOVLW       1
	ADDWF       FARG_strlen_const_const_pun+0, 1 
	MOVLW       0
	ADDWFC      FARG_strlen_const_const_pun+1, 1 
	ADDWFC      FARG_strlen_const_const_pun+2, 1 
	MOVF        R0, 0 
	MOVWF       TBLPTRL 
	MOVF        R1, 0 
	MOVWF       TBLPTRH 
	MOVF        R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_strlen_const24
	INFSNZ      strlen_const_cuen_const_L0+0, 1 
	INCF        strlen_const_cuen_const_L0+1, 1 
	GOTO        L_strlen_const23
L_strlen_const24:
;UBIDOTS.c,147 :: 		return (cuen_const);
	MOVF        strlen_const_cuen_const_L0+0, 0 
	MOVWF       R0 
	MOVF        strlen_const_cuen_const_L0+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
;UBIDOTS.c,149 :: 		}
L_end_strlen_const:
	RETURN      0
; end of _strlen_const

_manda_serial_const:

;UBIDOTS.c,151 :: 		void manda_serial_const(const char *info)
;UBIDOTS.c,153 :: 		while(*info) UART1_Write(*info++);
L_manda_serial_const25:
	MOVF        FARG_manda_serial_const_info+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_manda_serial_const_info+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_manda_serial_const_info+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_manda_serial_const26
	MOVF        FARG_manda_serial_const_info+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_manda_serial_const_info+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_manda_serial_const_info+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_UART1_Write_data_+0
	CALL        _UART1_Write+0, 0
	MOVLW       1
	ADDWF       FARG_manda_serial_const_info+0, 1 
	MOVLW       0
	ADDWFC      FARG_manda_serial_const_info+1, 1 
	ADDWFC      FARG_manda_serial_const_info+2, 1 
	GOTO        L_manda_serial_const25
L_manda_serial_const26:
;UBIDOTS.c,154 :: 		}
L_end_manda_serial_const:
	RETURN      0
; end of _manda_serial_const

_manda_esp8266_const:

;UBIDOTS.c,156 :: 		void manda_esp8266_const(const char *info)
;UBIDOTS.c,159 :: 		manda_serial_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_1_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_1_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_1_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,160 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,161 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,162 :: 		largo=strlen_const(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_strlen_const_const_pun+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_strlen_const_const_pun+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_strlen_const_const_pun+2 
	CALL        _strlen_const+0, 0
;UBIDOTS.c,163 :: 		sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_2_UBIDOTS+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_2_UBIDOTS+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_2_UBIDOTS+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;UBIDOTS.c,164 :: 		UART1_Write_Text(captu); //envia el largo d ela trama
	MOVLW       _captu+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,165 :: 		manda_serial_const("\r\n");
	MOVLW       ?lstr_3_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_3_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_3_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,166 :: 		Delay_ms(100); //retardo antes de enviar la trama
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_manda_esp8266_const27:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp8266_const27
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp8266_const27
	NOP
	NOP
;UBIDOTS.c,167 :: 		manda_serial_const(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_manda_serial_const_info+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_manda_serial_const_info+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,168 :: 		}
L_end_manda_esp8266_const:
	RETURN      0
; end of _manda_esp8266_const

_manda_esp8266:

;UBIDOTS.c,171 :: 		void manda_esp8266(char *info)
;UBIDOTS.c,174 :: 		manda_serial_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_4_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_4_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_4_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,175 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,176 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,177 :: 		largo=strlen(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
;UBIDOTS.c,178 :: 		sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_5_UBIDOTS+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_5_UBIDOTS+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_5_UBIDOTS+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;UBIDOTS.c,179 :: 		UART1_Write_Text(captu); //envia el largo d ela trama
	MOVLW       _captu+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,180 :: 		manda_serial_const("\r\n"); // estos son los dos que se adicionaron
	MOVLW       ?lstr_6_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_6_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_6_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,181 :: 		Delay_ms(100); //retardo antes de enviar la trama
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_manda_esp826628:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp826628
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp826628
	NOP
	NOP
;UBIDOTS.c,182 :: 		UART1_Write_Text(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,183 :: 		}
L_end_manda_esp8266:
	RETURN      0
; end of _manda_esp8266

_DAC_Initialize:

;UBIDOTS.c,186 :: 		void DAC_Initialize(void)
;UBIDOTS.c,189 :: 		VREFCON1 = 0xA0;
	MOVLW       160
	MOVWF       VREFCON1+0 
;UBIDOTS.c,191 :: 		VREFCON2 = 0x00;
	CLRF        VREFCON2+0 
;UBIDOTS.c,192 :: 		}
L_end_DAC_Initialize:
	RETURN      0
; end of _DAC_Initialize

_DAC_SetOutput:

;UBIDOTS.c,194 :: 		void DAC_SetOutput(char inputData)
;UBIDOTS.c,196 :: 		VREFCON2  = inputData;
	MOVF        FARG_DAC_SetOutput_inputData+0, 0 
	MOVWF       VREFCON2+0 
;UBIDOTS.c,197 :: 		}
L_end_DAC_SetOutput:
	RETURN      0
; end of _DAC_SetOutput

_main:

;UBIDOTS.c,200 :: 		void main()
;UBIDOTS.c,204 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;UBIDOTS.c,205 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;UBIDOTS.c,206 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;UBIDOTS.c,207 :: 		ANSELA.b0=1; //an0 analogo
	BSF         ANSELA+0, 0 
;UBIDOTS.c,209 :: 		trisa.b0=1; //entrada del pin analogo
	BSF         TRISA+0, 0 
;UBIDOTS.c,210 :: 		trisb.b0=1; //entrada pulsador
	BSF         TRISB+0, 0 
;UBIDOTS.c,211 :: 		TRISB.b7=0; //salida del led
	BCF         TRISB+0, 7 
;UBIDOTS.c,213 :: 		TRISC6_bit=0; //Salida Tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;UBIDOTS.c,214 :: 		TRISC7_bit=1; //Entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;UBIDOTS.c,215 :: 		UART1_Init(115200);      //VELOCIDA BAUDIOS
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UBIDOTS.c,218 :: 		manda_serial_const("ATE0\r\n"); //SIN ECO
	MOVLW       ?lstr_7_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_7_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_7_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,219 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
;UBIDOTS.c,221 :: 		manda_serial_const("AT+CWMODE=1\r\n"); //se CONECTA A RED EXISTENTE
	MOVLW       ?lstr_8_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_8_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_8_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,222 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main30:
	DECFSZ      R13, 1, 1
	BRA         L_main30
	DECFSZ      R12, 1, 1
	BRA         L_main30
	DECFSZ      R11, 1, 1
	BRA         L_main30
	NOP
;UBIDOTS.c,225 :: 		manda_serial_const("AT+CWDHCP=1,0\r\n"); //Deshabilita DHCP  para Ip manual
	MOVLW       ?lstr_9_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_9_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_9_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,226 :: 		Delay_ms(300);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
;UBIDOTS.c,230 :: 		manda_serial_const("AT+CIPSTA=\"192.168.1.117\",\"192.168.1.1\",\"255.255.255.0\"\r\n");
	MOVLW       ?lstr_10_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_10_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_10_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,232 :: 		Delay_ms(300);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
;UBIDOTS.c,237 :: 		manda_serial_const("AT+CWJAP=\"427315196575\",\"783054729115\"\r\n");  //se conecta a una red WIFI
	MOVLW       ?lstr_11_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_11_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_11_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,240 :: 		Delay_ms(6000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
	NOP
;UBIDOTS.c,241 :: 		manda_serial_const("AT+CIPMUX=1\r\n");  //acepta mulriples conexiones
	MOVLW       ?lstr_12_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_12_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_12_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,242 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
;UBIDOTS.c,244 :: 		manda_serial_const("AT+CIFSR\r\n");//mira que ip tiene el modulo
	MOVLW       ?lstr_13_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_13_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_13_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,245 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main35:
	DECFSZ      R13, 1, 1
	BRA         L_main35
	DECFSZ      R12, 1, 1
	BRA         L_main35
	DECFSZ      R11, 1, 1
	BRA         L_main35
	NOP
	NOP
;UBIDOTS.c,248 :: 		manda_serial_const("AT+CIPMUX=1\r\n");;
	MOVLW       ?lstr_14_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_14_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_14_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,249 :: 		Delay_ms(300);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main36:
	DECFSZ      R13, 1, 1
	BRA         L_main36
	DECFSZ      R12, 1, 1
	BRA         L_main36
	DECFSZ      R11, 1, 1
	BRA         L_main36
;UBIDOTS.c,250 :: 		manda_serial_const("AT+CIPSTART=4,\"TCP\",\"things.ubidots.com\",80\r\n");
	MOVLW       ?lstr_15_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_15_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_15_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,251 :: 		Delay_ms(3000);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	DECFSZ      R11, 1, 1
	BRA         L_main37
	NOP
	NOP
;UBIDOTS.c,253 :: 		DAC_Initialize();
	CALL        _DAC_Initialize+0, 0
;UBIDOTS.c,254 :: 		while (1)
L_main38:
;UBIDOTS.c,257 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;UBIDOTS.c,258 :: 		temperatura=codigo*500.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;UBIDOTS.c,260 :: 		if (suiche==0) led='0'; else led='1';
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main40
	MOVLW       48
	MOVWF       _led+0 
	GOTO        L_main41
L_main40:
	MOVLW       49
	MOVWF       _led+0 
L_main41:
;UBIDOTS.c,262 :: 		memset(trama_largo,20,0);
	MOVLW       _trama_largo+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_largo+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       20
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;UBIDOTS.c,263 :: 		memset(trama,150,0);
	MOVLW       _trama+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       150
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;UBIDOTS.c,266 :: 		sprintf(trama,"{\"temperatura\": %5.2f ,\"led\": %c}\n",temperatura,led);
	MOVLW       _trama+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_16_UBIDOTS+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_16_UBIDOTS+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_16_UBIDOTS+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _led+0, 0 
	MOVWF       FARG_sprintf_wh+9 
	CALL        _sprintf+0, 0
;UBIDOTS.c,268 :: 		var_largo=strlen(trama)-1;
	MOVLW       _trama+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       1
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	MOVWF       _var_largo+0 
	MOVF        R1, 0 
	MOVWF       _var_largo+1 
;UBIDOTS.c,270 :: 		sprinti(trama_largo,"%u\n\n",var_largo);
	MOVLW       _trama_largo+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_trama_largo+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_17_UBIDOTS+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_17_UBIDOTS+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_17_UBIDOTS+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;UBIDOTS.c,276 :: 		manda_esp8266_const("POST /api/v1.6/devices/micasa/?token=A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
	MOVLW       ?lstr_18_UBIDOTS+0
	MOVWF       FARG_manda_esp8266_const_info+0 
	MOVLW       hi_addr(?lstr_18_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+1 
	MOVLW       higher_addr(?lstr_18_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+2 
	CALL        _manda_esp8266_const+0, 0
;UBIDOTS.c,278 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	DECFSZ      R11, 1, 1
	BRA         L_main42
	NOP
	NOP
;UBIDOTS.c,280 :: 		manda_esp8266(trama_largo);
	MOVLW       _trama_largo+0
	MOVWF       FARG_manda_esp8266_info+0 
	MOVLW       hi_addr(_trama_largo+0)
	MOVWF       FARG_manda_esp8266_info+1 
	CALL        _manda_esp8266+0, 0
;UBIDOTS.c,281 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	DECFSZ      R11, 1, 1
	BRA         L_main43
	NOP
	NOP
;UBIDOTS.c,283 :: 		manda_esp8266(trama);
	MOVLW       _trama+0
	MOVWF       FARG_manda_esp8266_info+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_manda_esp8266_info+1 
	CALL        _manda_esp8266+0, 0
;UBIDOTS.c,284 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	DECFSZ      R11, 1, 1
	BRA         L_main44
	NOP
	NOP
;UBIDOTS.c,287 :: 		manda_esp8266_const("GET /api/v1.6/devices/micasa/luces/values?page_size=1&token=A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_19_UBIDOTS+0
	MOVWF       FARG_manda_esp8266_const_info+0 
	MOVLW       hi_addr(?lstr_19_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+1 
	MOVLW       higher_addr(?lstr_19_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+2 
	CALL        _manda_esp8266_const+0, 0
;UBIDOTS.c,289 :: 		lee_trama();
	CALL        _lee_trama+0, 0
;UBIDOTS.c,291 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr20_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr20_UBIDOTS+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;UBIDOTS.c,292 :: 		strcpy(captu, strtok(0, "}"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr21_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr21_UBIDOTS+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;UBIDOTS.c,294 :: 		valor_rx=atof(captu);
	MOVLW       _captu+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _valor_rx+0 
	MOVF        R1, 0 
	MOVWF       _valor_rx+1 
	MOVF        R2, 0 
	MOVWF       _valor_rx+2 
	MOVF        R3, 0 
	MOVWF       _valor_rx+3 
;UBIDOTS.c,295 :: 		if (valor_rx==1.0) led_out=1; else led_out=0;  //plica la salida al led
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
	BSF         LATB7_bit+0, BitPos(LATB7_bit+0) 
	GOTO        L_main46
L_main45:
	BCF         LATB7_bit+0, BitPos(LATB7_bit+0) 
L_main46:
;UBIDOTS.c,296 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main47:
	DECFSZ      R13, 1, 1
	BRA         L_main47
	DECFSZ      R12, 1, 1
	BRA         L_main47
	DECFSZ      R11, 1, 1
	BRA         L_main47
	NOP
;UBIDOTS.c,299 :: 		manda_esp8266_const("GET /api/v1.6/devices/micasa/nivel/values?page_size=1&token=A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_22_UBIDOTS+0
	MOVWF       FARG_manda_esp8266_const_info+0 
	MOVLW       hi_addr(?lstr_22_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+1 
	MOVLW       higher_addr(?lstr_22_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+2 
	CALL        _manda_esp8266_const+0, 0
;UBIDOTS.c,301 :: 		lee_trama();
	CALL        _lee_trama+0, 0
;UBIDOTS.c,303 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr23_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr23_UBIDOTS+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;UBIDOTS.c,304 :: 		strcpy(captu, strtok(0, "}"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr24_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr24_UBIDOTS+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;UBIDOTS.c,306 :: 		valor_rx=atof(captu);
	MOVLW       _captu+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _valor_rx+0 
	MOVF        R1, 0 
	MOVWF       _valor_rx+1 
	MOVF        R2, 0 
	MOVWF       _valor_rx+2 
	MOVF        R3, 0 
	MOVWF       _valor_rx+3 
;UBIDOTS.c,308 :: 		DAC_SetOutput(valor_rx*31.0/5.0) ;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       120
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_DAC_SetOutput_inputData+0 
	CALL        _DAC_SetOutput+0, 0
;UBIDOTS.c,310 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main48:
	DECFSZ      R13, 1, 1
	BRA         L_main48
	DECFSZ      R12, 1, 1
	BRA         L_main48
	DECFSZ      R11, 1, 1
	BRA         L_main48
	NOP
;UBIDOTS.c,316 :: 		}
	GOTO        L_main38
;UBIDOTS.c,318 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
