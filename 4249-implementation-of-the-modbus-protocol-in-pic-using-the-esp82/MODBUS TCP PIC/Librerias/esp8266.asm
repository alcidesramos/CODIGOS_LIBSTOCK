
_atoi_:

;esp8266.c,25 :: 		int atoi_(char* cadena)
;esp8266.c,27 :: 		int respuesta = 0;
	CLRF        atoi__respuesta_L0+0 
	CLRF        atoi__respuesta_L0+1 
;esp8266.c,30 :: 		for (i = 0; cadena[i] != '\0'; ++i)
	CLRF        atoi__i_L0+0 
	CLRF        atoi__i_L0+1 
L_atoi_0:
	MOVF        atoi__i_L0+0, 0 
	ADDWF       FARG_atoi__cadena+0, 0 
	MOVWF       FSR0L+0 
	MOVF        atoi__i_L0+1, 0 
	ADDWFC      FARG_atoi__cadena+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_atoi_1
;esp8266.c,31 :: 		respuesta = respuesta * 10 + cadena[i] - '0';
	MOVF        atoi__respuesta_L0+0, 0 
	MOVWF       R0 
	MOVF        atoi__respuesta_L0+1, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        atoi__i_L0+0, 0 
	ADDWF       FARG_atoi__cadena+0, 0 
	MOVWF       FSR2L+0 
	MOVF        atoi__i_L0+1, 0 
	ADDWFC      FARG_atoi__cadena+1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       atoi__respuesta_L0+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       atoi__respuesta_L0+1 
	MOVLW       48
	SUBWF       atoi__respuesta_L0+0, 1 
	MOVLW       0
	SUBWFB      atoi__respuesta_L0+1, 1 
;esp8266.c,30 :: 		for (i = 0; cadena[i] != '\0'; ++i)
	INFSNZ      atoi__i_L0+0, 1 
	INCF        atoi__i_L0+1, 1 
;esp8266.c,31 :: 		respuesta = respuesta * 10 + cadena[i] - '0';
	GOTO        L_atoi_0
L_atoi_1:
;esp8266.c,32 :: 		return respuesta;
	MOVF        atoi__respuesta_L0+0, 0 
	MOVWF       R0 
	MOVF        atoi__respuesta_L0+1, 0 
	MOVWF       R1 
;esp8266.c,33 :: 		}
L_end_atoi_:
	RETURN      0
; end of _atoi_

_Uart1_write_text_const:

;esp8266.c,35 :: 		void Uart1_write_text_const(const char *info)
;esp8266.c,37 :: 		while(*info) UART1_Write(*info++);
L_Uart1_write_text_const3:
	MOVF        FARG_Uart1_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_Uart1_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_Uart1_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Uart1_write_text_const4
	MOVF        FARG_Uart1_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_Uart1_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_Uart1_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_UART1_Write_data_+0
	CALL        _UART1_Write+0, 0
	MOVLW       1
	ADDWF       FARG_Uart1_write_text_const_info+0, 1 
	MOVLW       0
	ADDWFC      FARG_Uart1_write_text_const_info+1, 1 
	ADDWFC      FARG_Uart1_write_text_const_info+2, 1 
	GOTO        L_Uart1_write_text_const3
L_Uart1_write_text_const4:
;esp8266.c,38 :: 		}
L_end_Uart1_write_text_const:
	RETURN      0
; end of _Uart1_write_text_const

_tiempo:

;esp8266.c,41 :: 		char tiempo(unsigned int milis, char cap[30], char cap1[30])
;esp8266.c,44 :: 		estado_rec=normal;
	CLRF        _estado_rec+0 
;esp8266.c,45 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,46 :: 		memset(modbus_rx,0,50);// LIMPIA LA TRAMA
	MOVLW       _modbus_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_modbus_rx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;esp8266.c,47 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;esp8266.c,49 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;esp8266.c,50 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;esp8266.c,51 :: 		RCIE_bit=1; // habilita la recepcoón
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;esp8266.c,52 :: 		Delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_tiempo5:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo5
	DECFSZ      R12, 1, 1
	BRA         L_tiempo5
	DECFSZ      R11, 1, 1
	BRA         L_tiempo5
	NOP
	NOP
;esp8266.c,55 :: 		for (cont1=1;cont1<=milis;cont1++)
	MOVLW       1
	MOVWF       tiempo_cont1_L0+0 
	MOVLW       0
	MOVWF       tiempo_cont1_L0+1 
L_tiempo6:
	MOVF        tiempo_cont1_L0+1, 0 
	SUBWF       FARG_tiempo_milis+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo69
	MOVF        tiempo_cont1_L0+0, 0 
	SUBWF       FARG_tiempo_milis+0, 0 
L__tiempo69:
	BTFSS       STATUS+0, 0 
	GOTO        L_tiempo7
;esp8266.c,57 :: 		delay_Ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_tiempo9:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo9
	DECFSZ      R12, 1, 1
	BRA         L_tiempo9
;esp8266.c,59 :: 		if (strstr(modbus_rx,cap))
	MOVLW       _modbus_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_modbus_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_tiempo_cap+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_tiempo_cap+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo10
;esp8266.c,61 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;esp8266.c,62 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_tiempo11:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo11
	DECFSZ      R12, 1, 1
	BRA         L_tiempo11
	NOP
;esp8266.c,63 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_tiempo
;esp8266.c,64 :: 		}
L_tiempo10:
;esp8266.c,65 :: 		else  if (strstr(modbus_rx,cap1) )
	MOVLW       _modbus_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_modbus_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_tiempo_cap1+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_tiempo_cap1+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo13
;esp8266.c,67 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;esp8266.c,68 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_tiempo14:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo14
	DECFSZ      R12, 1, 1
	BRA         L_tiempo14
	NOP
;esp8266.c,69 :: 		return(2);
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_tiempo
;esp8266.c,70 :: 		}
L_tiempo13:
;esp8266.c,55 :: 		for (cont1=1;cont1<=milis;cont1++)
	INFSNZ      tiempo_cont1_L0+0, 1 
	INCF        tiempo_cont1_L0+1, 1 
;esp8266.c,71 :: 		}
	GOTO        L_tiempo6
L_tiempo7:
;esp8266.c,73 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;esp8266.c,74 :: 		return(0);
	CLRF        R0 
;esp8266.c,75 :: 		}
L_end_tiempo:
	RETURN      0
; end of _tiempo

_esp82666_interrupcion:

;esp8266.c,78 :: 		void esp82666_interrupcion()
;esp8266.c,81 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_esp82666_interrupcion15
;esp8266.c,82 :: 		{            dato_rx=RCREG; // lee el dato
	MOVF        RCREG+0, 0 
	MOVWF       _dato_rx+0 
;esp8266.c,84 :: 		switch (estado_rec)
	GOTO        L_esp82666_interrupcion16
;esp8266.c,86 :: 		case normal:
L_esp82666_interrupcion18:
;esp8266.c,87 :: 		modbus_rx[trama_cont]=dato_rx;  // almacena el dato
	MOVLW       _modbus_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_modbus_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;esp8266.c,88 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;esp8266.c,89 :: 		if (trama_cont>=50) trama_cont=0;
	MOVLW       50
	SUBWF       _trama_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_esp82666_interrupcion19
	CLRF        _trama_cont+0 
L_esp82666_interrupcion19:
;esp8266.c,90 :: 		break;
	GOTO        L_esp82666_interrupcion17
;esp8266.c,92 :: 		case cap_i:
L_esp82666_interrupcion20:
;esp8266.c,94 :: 		if (dato_rx!='I') trama_cont=0;    //no fue el dato que me interesa
	MOVF        _dato_rx+0, 0 
	XORLW       73
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion21
	CLRF        _trama_cont+0 
	GOTO        L_esp82666_interrupcion22
L_esp82666_interrupcion21:
;esp8266.c,98 :: 		estado_rec=cap_p; //pasa al estado de capturar la p
	MOVLW       2
	MOVWF       _estado_rec+0 
;esp8266.c,99 :: 		}
L_esp82666_interrupcion22:
;esp8266.c,101 :: 		case cap_p:
L_esp82666_interrupcion23:
;esp8266.c,104 :: 		if (dato_rx!='P')
	MOVF        _dato_rx+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion24
;esp8266.c,106 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,107 :: 		estado_rec=cap_i; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;esp8266.c,109 :: 		}
	GOTO        L_esp82666_interrupcion25
L_esp82666_interrupcion24:
;esp8266.c,113 :: 		estado_rec=cap_d; //pasa al estado de capturar la d
	MOVLW       3
	MOVWF       _estado_rec+0 
;esp8266.c,114 :: 		}
L_esp82666_interrupcion25:
;esp8266.c,116 :: 		break ;
	GOTO        L_esp82666_interrupcion17
;esp8266.c,119 :: 		case cap_d:
L_esp82666_interrupcion26:
;esp8266.c,121 :: 		if (dato_rx!='D')
	MOVF        _dato_rx+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion27
;esp8266.c,123 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,124 :: 		estado_rec=cap_i; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;esp8266.c,126 :: 		}
	GOTO        L_esp82666_interrupcion28
L_esp82666_interrupcion27:
;esp8266.c,130 :: 		estado_rec=cap_co; //pasa al estado de capturar la coma
	MOVLW       4
	MOVWF       _estado_rec+0 
;esp8266.c,131 :: 		}
L_esp82666_interrupcion28:
;esp8266.c,133 :: 		break ;
	GOTO        L_esp82666_interrupcion17
;esp8266.c,135 :: 		case cap_co:
L_esp82666_interrupcion29:
;esp8266.c,137 :: 		if (dato_rx!=',')
	MOVF        _dato_rx+0, 0 
	XORLW       44
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion30
;esp8266.c,139 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,140 :: 		estado_rec=cap_i; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;esp8266.c,142 :: 		}
	GOTO        L_esp82666_interrupcion31
L_esp82666_interrupcion30:
;esp8266.c,149 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,150 :: 		estado_rec=cap_co2; //pasa al estado de capturar la coma
	MOVLW       5
	MOVWF       _estado_rec+0 
;esp8266.c,152 :: 		}
L_esp82666_interrupcion31:
;esp8266.c,154 :: 		break ;
	GOTO        L_esp82666_interrupcion17
;esp8266.c,157 :: 		case cap_co2:
L_esp82666_interrupcion32:
;esp8266.c,160 :: 		if (dato_rx==',')
	MOVF        _dato_rx+0, 0 
	XORLW       44
	BTFSS       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion33
;esp8266.c,162 :: 		estado_rec=cap_largo; //pasa al estado de capturar el largo
	MOVLW       6
	MOVWF       _estado_rec+0 
;esp8266.c,163 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,164 :: 		}
	GOTO        L_esp82666_interrupcion34
L_esp82666_interrupcion33:
;esp8266.c,167 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;esp8266.c,168 :: 		if (trama_cont>50)
	MOVF        _trama_cont+0, 0 
	SUBLW       50
	BTFSC       STATUS+0, 0 
	GOTO        L_esp82666_interrupcion35
;esp8266.c,169 :: 		{ trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,170 :: 		estado_rec=cap_i; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;esp8266.c,171 :: 		}
L_esp82666_interrupcion35:
;esp8266.c,172 :: 		}
L_esp82666_interrupcion34:
;esp8266.c,174 :: 		break ;
	GOTO        L_esp82666_interrupcion17
;esp8266.c,176 :: 		case cap_largo:
L_esp82666_interrupcion36:
;esp8266.c,178 :: 		if (dato_rx==':')
	MOVF        _dato_rx+0, 0 
	XORLW       58
	BTFSS       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion37
;esp8266.c,180 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,181 :: 		rec_son=13;//8+tamano*2;
	MOVLW       13
	MOVWF       _rec_son+0 
	MOVLW       0
	MOVWF       _rec_son+1 
;esp8266.c,182 :: 		estado_rec=esp_final; //pasa al estado de capturar el largo
	MOVLW       7
	MOVWF       _estado_rec+0 
;esp8266.c,183 :: 		}
	GOTO        L_esp82666_interrupcion38
L_esp82666_interrupcion37:
;esp8266.c,186 :: 		modbus_rx[trama_cont]=dato_rx;
	MOVLW       _modbus_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_modbus_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;esp8266.c,187 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;esp8266.c,188 :: 		if (trama_cont>50)
	MOVF        _trama_cont+0, 0 
	SUBLW       50
	BTFSC       STATUS+0, 0 
	GOTO        L_esp82666_interrupcion39
;esp8266.c,189 :: 		{ trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,190 :: 		estado_rec=cap_i; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;esp8266.c,191 :: 		}
L_esp82666_interrupcion39:
;esp8266.c,192 :: 		}
L_esp82666_interrupcion38:
;esp8266.c,193 :: 		break ;
	GOTO        L_esp82666_interrupcion17
;esp8266.c,196 :: 		case esp_final:
L_esp82666_interrupcion40:
;esp8266.c,197 :: 		led1=!led1;
	BTG         led1+0, BitPos(led1+0) 
;esp8266.c,198 :: 		modbus_rx[trama_cont]=dato_rx;
	MOVLW       _modbus_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_modbus_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;esp8266.c,199 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;esp8266.c,200 :: 		if (trama_cont>=rec_son)
	MOVLW       0
	MOVWF       R0 
	MOVF        _rec_son+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__esp82666_interrupcion71
	MOVF        _rec_son+0, 0 
	SUBWF       _trama_cont+0, 0 
L__esp82666_interrupcion71:
	BTFSS       STATUS+0, 0 
	GOTO        L_esp82666_interrupcion41
;esp8266.c,204 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;esp8266.c,205 :: 		estado_rec=normal; //regresa al estado inical
	CLRF        _estado_rec+0 
;esp8266.c,206 :: 		flag_modbus=1;
	MOVLW       1
	MOVWF       _flag_modbus+0 
;esp8266.c,207 :: 		led2=1;
	BSF         led2+0, BitPos(led2+0) 
;esp8266.c,208 :: 		RCIE_bit=0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;esp8266.c,210 :: 		}
L_esp82666_interrupcion41:
;esp8266.c,211 :: 		break;
	GOTO        L_esp82666_interrupcion17
;esp8266.c,214 :: 		}//fin del switch
L_esp82666_interrupcion16:
	MOVF        _estado_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion18
	MOVF        _estado_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion20
	MOVF        _estado_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion23
	MOVF        _estado_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion26
	MOVF        _estado_rec+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion29
	MOVF        _estado_rec+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion32
	MOVF        _estado_rec+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion36
	MOVF        _estado_rec+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_esp82666_interrupcion40
L_esp82666_interrupcion17:
;esp8266.c,217 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;esp8266.c,220 :: 		}//fin del if
L_esp82666_interrupcion15:
;esp8266.c,222 :: 		}
L_end_esp82666_interrupcion:
	RETURN      0
; end of _esp82666_interrupcion

_manda_AT_COMANDO:

;esp8266.c,224 :: 		char manda_AT_COMANDO(char *coman, char cap[30], char cap1[30],unsigned int retardo)
;esp8266.c,227 :: 		Uart1_write_text(coman);//manda el comando
	MOVF        FARG_manda_AT_COMANDO_coman+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_AT_COMANDO_coman+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;esp8266.c,228 :: 		Uart1_write_text_const("\r\n"); // manda final de linea
	MOVLW       ?lstr_1_esp8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_1_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_1_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,229 :: 		return (tiempo(retardo,cap,cap1));
	MOVF        FARG_manda_AT_COMANDO_retardo+0, 0 
	MOVWF       FARG_tiempo_milis+0 
	MOVF        FARG_manda_AT_COMANDO_retardo+1, 0 
	MOVWF       FARG_tiempo_milis+1 
	MOVF        FARG_manda_AT_COMANDO_cap+0, 0 
	MOVWF       FARG_tiempo_cap+0 
	MOVF        FARG_manda_AT_COMANDO_cap+1, 0 
	MOVWF       FARG_tiempo_cap+1 
	MOVF        FARG_manda_AT_COMANDO_cap1+0, 0 
	MOVWF       FARG_tiempo_cap1+0 
	MOVF        FARG_manda_AT_COMANDO_cap1+1, 0 
	MOVWF       FARG_tiempo_cap1+1 
	CALL        _tiempo+0, 0
;esp8266.c,230 :: 		}
L_end_manda_AT_COMANDO:
	RETURN      0
; end of _manda_AT_COMANDO

_strlen_const:

;esp8266.c,233 :: 		unsigned long strlen_const(const char *const_pun)
;esp8266.c,235 :: 		unsigned int cuen_const=0;
	CLRF        strlen_const_cuen_const_L0+0 
	CLRF        strlen_const_cuen_const_L0+1 
;esp8266.c,237 :: 		while (*const_pun++!=0) cuen_const++;
L_strlen_const42:
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
	MOVWF       TBLPTRL+0 
	MOVF        R1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        R2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_strlen_const43
	INFSNZ      strlen_const_cuen_const_L0+0, 1 
	INCF        strlen_const_cuen_const_L0+1, 1 
	GOTO        L_strlen_const42
L_strlen_const43:
;esp8266.c,238 :: 		return (cuen_const);
	MOVF        strlen_const_cuen_const_L0+0, 0 
	MOVWF       R0 
	MOVF        strlen_const_cuen_const_L0+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
;esp8266.c,240 :: 		}
L_end_strlen_const:
	RETURN      0
; end of _strlen_const

_manda_esp8266_const:

;esp8266.c,241 :: 		void manda_esp8266_const(const char *info)
;esp8266.c,244 :: 		Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_2_esp8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_2_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_2_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,245 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;esp8266.c,246 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;esp8266.c,247 :: 		largo=strlen_const(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_strlen_const_const_pun+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_strlen_const_const_pun+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_strlen_const_const_pun+2 
	CALL        _strlen_const+0, 0
;esp8266.c,248 :: 		sprinti(captu1,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu1+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu1+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_3_esp8266+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_3_esp8266+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_3_esp8266+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;esp8266.c,249 :: 		UART1_Write_Text(captu1); //envia el largo d ela trama
	MOVLW       _captu1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;esp8266.c,250 :: 		Uart1_write_text_const("\r\n");
	MOVLW       ?lstr_4_esp8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_4_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_4_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,251 :: 		Delay_ms(50); //retardo antes de enviar la trama   para que muestre el >
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_manda_esp8266_const44:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp8266_const44
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp8266_const44
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp8266_const44
	NOP
	NOP
;esp8266.c,252 :: 		Uart1_write_text_const(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,253 :: 		Delay_ms(100); //retardo para que confirme que se envio
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_manda_esp8266_const45:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp8266_const45
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp8266_const45
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp8266_const45
	NOP
	NOP
;esp8266.c,255 :: 		}
L_end_manda_esp8266_const:
	RETURN      0
; end of _manda_esp8266_const

_manda_esp8266:

;esp8266.c,258 :: 		void manda_esp8266(char *info)
;esp8266.c,261 :: 		Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_5_esp8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_5_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_5_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,262 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;esp8266.c,263 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;esp8266.c,264 :: 		largo=strlen(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
;esp8266.c,265 :: 		sprinti(captu1,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu1+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu1+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_6_esp8266+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_6_esp8266+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_6_esp8266+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;esp8266.c,266 :: 		UART1_Write_Text(captu1); //envia el largo d ela trama
	MOVLW       _captu1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;esp8266.c,267 :: 		Uart1_write_text_const("\r\n"); // estos son los dos que se adicionaron
	MOVLW       ?lstr_7_esp8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_7_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_7_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,268 :: 		Delay_ms(50); //retardo para que muestre >
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_manda_esp826646:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp826646
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp826646
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp826646
	NOP
	NOP
;esp8266.c,269 :: 		UART1_Write_Text(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;esp8266.c,270 :: 		Delay_ms(100); //retardo para que confirme ele envio
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_manda_esp826647:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp826647
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp826647
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp826647
	NOP
	NOP
;esp8266.c,272 :: 		}
L_end_manda_esp8266:
	RETURN      0
; end of _manda_esp8266

_manda_esp8266_bytes:

;esp8266.c,275 :: 		void manda_esp8266_bytes(unsigned char *info,unsigned int largo)
;esp8266.c,279 :: 		Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_8_esp8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_8_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_8_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,280 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;esp8266.c,281 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;esp8266.c,282 :: 		sprinti(captu1,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu1+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu1+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_9_esp8266+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_9_esp8266+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_9_esp8266+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        FARG_manda_esp8266_bytes_largo+0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        FARG_manda_esp8266_bytes_largo+1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;esp8266.c,283 :: 		UART1_Write_Text(captu1); //envia el largo de la trama
	MOVLW       _captu1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;esp8266.c,284 :: 		Uart1_write_text_const("\r\n"); // estos son los dos que se adicionaron
	MOVLW       ?lstr_10_esp8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_10_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_10_esp8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;esp8266.c,285 :: 		Delay_ms(50); //retardo antes de enviar apra que muestre >
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_manda_esp8266_bytes48:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp8266_bytes48
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp8266_bytes48
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp8266_bytes48
	NOP
	NOP
;esp8266.c,286 :: 		for (cuenta=0;cuenta<largo;cuenta++) UART1_Write(*info++);  // manda los bytes deseados
	CLRF        manda_esp8266_bytes_cuenta_L0+0 
L_manda_esp8266_bytes49:
	MOVLW       0
	MOVWF       R0 
	MOVF        FARG_manda_esp8266_bytes_largo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__manda_esp8266_bytes77
	MOVF        FARG_manda_esp8266_bytes_largo+0, 0 
	SUBWF       manda_esp8266_bytes_cuenta_L0+0, 0 
L__manda_esp8266_bytes77:
	BTFSC       STATUS+0, 0 
	GOTO        L_manda_esp8266_bytes50
	MOVFF       FARG_manda_esp8266_bytes_info+0, FSR0L+0
	MOVFF       FARG_manda_esp8266_bytes_info+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	INFSNZ      FARG_manda_esp8266_bytes_info+0, 1 
	INCF        FARG_manda_esp8266_bytes_info+1, 1 
	INCF        manda_esp8266_bytes_cuenta_L0+0, 1 
	GOTO        L_manda_esp8266_bytes49
L_manda_esp8266_bytes50:
;esp8266.c,287 :: 		Delay_ms(50); //retardo para que prdcesa la info,  vuelve lento el sistema
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_manda_esp8266_bytes52:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp8266_bytes52
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp8266_bytes52
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp8266_bytes52
	NOP
	NOP
;esp8266.c,289 :: 		}
L_end_manda_esp8266_bytes:
	RETURN      0
; end of _manda_esp8266_bytes

_conecta:

;esp8266.c,294 :: 		unsigned char conecta(char *ip_dir)
;esp8266.c,297 :: 		memset(modbus_tx,0,50);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;esp8266.c,298 :: 		sprintf(modbus_tx,"AT+CIPSTART=4,\"TCP\",\"%s\",502",ip_dir);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_11_esp8266+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_11_esp8266+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_11_esp8266+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        FARG_conecta_ip_dir+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        FARG_conecta_ip_dir+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	CALL        _sprintf+0, 0
;esp8266.c,300 :: 		manda_AT_COMANDO("AT+CIPMUX=1\r\n","OK","OK",500);
	MOVLW       ?lstr12_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr12_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr13_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr13_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr14_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr14_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;esp8266.c,301 :: 		Delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_conecta53:
	DECFSZ      R13, 1, 1
	BRA         L_conecta53
	DECFSZ      R12, 1, 1
	BRA         L_conecta53
	DECFSZ      R11, 1, 1
	BRA         L_conecta53
	NOP
	NOP
;esp8266.c,302 :: 		tempo=manda_AT_COMANDO(modbus_tx, "OK", "CONNECT", 10000);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr15_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr15_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr16_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr16_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       16
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       39
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       conecta_tempo_L0+0 
;esp8266.c,303 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_conecta54:
	DECFSZ      R13, 1, 1
	BRA         L_conecta54
	DECFSZ      R12, 1, 1
	BRA         L_conecta54
	DECFSZ      R11, 1, 1
	BRA         L_conecta54
	NOP
	NOP
;esp8266.c,304 :: 		if ((tempo==1) ||(tempo==2)) return(1);
	MOVF        conecta_tempo_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta65
	MOVF        conecta_tempo_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta65
	GOTO        L_conecta57
L__conecta65:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conecta
L_conecta57:
;esp8266.c,305 :: 		manda_AT_COMANDO("AT+CIPMUX=1\r\n","OK","OK",500);
	MOVLW       ?lstr17_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr17_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr18_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr18_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr19_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr19_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;esp8266.c,306 :: 		Delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_conecta58:
	DECFSZ      R13, 1, 1
	BRA         L_conecta58
	DECFSZ      R12, 1, 1
	BRA         L_conecta58
	DECFSZ      R11, 1, 1
	BRA         L_conecta58
	NOP
	NOP
;esp8266.c,307 :: 		tempo=manda_AT_COMANDO(modbus_tx, "OK", "Linked", 10000);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr20_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr20_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr21_esp8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr21_esp8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       16
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       39
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       conecta_tempo_L0+0 
;esp8266.c,308 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_conecta59:
	DECFSZ      R13, 1, 1
	BRA         L_conecta59
	DECFSZ      R12, 1, 1
	BRA         L_conecta59
	DECFSZ      R11, 1, 1
	BRA         L_conecta59
	NOP
	NOP
;esp8266.c,310 :: 		if ((tempo==1) ||(tempo==2)) return(1);
	MOVF        conecta_tempo_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta64
	MOVF        conecta_tempo_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta64
	GOTO        L_conecta62
L__conecta64:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conecta
L_conecta62:
;esp8266.c,311 :: 		else return(0);
	CLRF        R0 
;esp8266.c,314 :: 		}
L_end_conecta:
	RETURN      0
; end of _conecta
