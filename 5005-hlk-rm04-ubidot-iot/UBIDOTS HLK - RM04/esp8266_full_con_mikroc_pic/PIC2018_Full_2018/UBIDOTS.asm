
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
	GOTO        L__lee_trama35
	MOVF        _demora+2, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama35
	MOVF        _demora+1, 0 
	SUBLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama35
	MOVF        _demora+0, 0 
	SUBLW       107
L__lee_trama35:
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
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
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
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
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
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
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
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
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
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _contador_trama+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
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
	MOVWF       TBLPTRL+0 
	MOVF        FARG_manda_serial_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_manda_serial_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_manda_serial_const26
	MOVF        FARG_manda_serial_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_manda_serial_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_manda_serial_const_info+2, 0 
	MOVWF       TBLPTRU+0 
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

_DAC_Initialize:

;UBIDOTS.c,156 :: 		void DAC_Initialize(void)
;UBIDOTS.c,159 :: 		VREFCON1 = 0xA0;
	MOVLW       160
	MOVWF       VREFCON1+0 
;UBIDOTS.c,161 :: 		VREFCON2 = 0x00;
	CLRF        VREFCON2+0 
;UBIDOTS.c,162 :: 		}
L_end_DAC_Initialize:
	RETURN      0
; end of _DAC_Initialize

_DAC_SetOutput:

;UBIDOTS.c,164 :: 		void DAC_SetOutput(char inputData)
;UBIDOTS.c,166 :: 		VREFCON2  = inputData;
	MOVF        FARG_DAC_SetOutput_inputData+0, 0 
	MOVWF       VREFCON2+0 
;UBIDOTS.c,167 :: 		}
L_end_DAC_SetOutput:
	RETURN      0
; end of _DAC_SetOutput

_main:

;UBIDOTS.c,170 :: 		void main()
;UBIDOTS.c,174 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;UBIDOTS.c,175 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;UBIDOTS.c,176 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;UBIDOTS.c,177 :: 		ANSELA.b0=1; //an0 analogo
	BSF         ANSELA+0, 0 
;UBIDOTS.c,179 :: 		trisa.b0=1; //entrada del pin analogo
	BSF         TRISA+0, 0 
;UBIDOTS.c,180 :: 		trisb.b0=1; //entrada pulsador
	BSF         TRISB+0, 0 
;UBIDOTS.c,181 :: 		TRISB.b7=0; //salida del led
	BCF         TRISB+0, 7 
;UBIDOTS.c,183 :: 		TRISC6_bit=0; //Salida Tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;UBIDOTS.c,184 :: 		TRISC7_bit=1; //Entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;UBIDOTS.c,186 :: 		UART1_Init(115200);      //VELOCIDA BAUDIOS
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UBIDOTS.c,187 :: 		DAC_Initialize();
	CALL        _DAC_Initialize+0, 0
;UBIDOTS.c,188 :: 		while (1)
L_main27:
;UBIDOTS.c,191 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;UBIDOTS.c,192 :: 		temperatura=codigo*500.0/1023.0;
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
;UBIDOTS.c,194 :: 		if (suiche==0) led='0'; else led='1';
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main29
	MOVLW       48
	MOVWF       _led+0 
	GOTO        L_main30
L_main29:
	MOVLW       49
	MOVWF       _led+0 
L_main30:
;UBIDOTS.c,196 :: 		memset(trama_largo,20,0);
	MOVLW       _trama_largo+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_largo+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       20
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;UBIDOTS.c,197 :: 		memset(trama,150,0);
	MOVLW       _trama+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       150
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;UBIDOTS.c,200 :: 		sprintf(trama,"{\"temperatura\": %5.2f ,\"led\": %c}\n",temperatura,led);
	MOVLW       _trama+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_UBIDOTS+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_UBIDOTS+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_UBIDOTS+0)
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
;UBIDOTS.c,202 :: 		var_largo=strlen(trama)-1;
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
;UBIDOTS.c,204 :: 		sprinti(trama_largo,"%u\n\n",var_largo);
	MOVLW       _trama_largo+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_trama_largo+0)
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
;UBIDOTS.c,210 :: 		manda_serial_const("POST /api/v1.6/devices/clase/?token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
	MOVLW       ?lstr_3_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_3_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_3_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,212 :: 		UART1_Write_Text(trama_largo);
	MOVLW       _trama_largo+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_largo+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,215 :: 		UART1_Write_Text(trama);
	MOVLW       _trama+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,216 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
	NOP
;UBIDOTS.c,219 :: 		manda_serial_const("GET /api/v1.6/devices/clase/suiche/values?page_size=1&token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_4_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_4_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_4_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,221 :: 		lee_trama();
	CALL        _lee_trama+0, 0
;UBIDOTS.c,223 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr5_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr5_UBIDOTS+0)
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
;UBIDOTS.c,224 :: 		strcpy(captu, strtok(0, "}"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr6_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr6_UBIDOTS+0)
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
;UBIDOTS.c,226 :: 		valor_rx=atof(captu);
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
;UBIDOTS.c,227 :: 		if (valor_rx==1.0) led_out=1; else led_out=0;  //plica la salida al led
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
	GOTO        L_main32
	BSF         LATB7_bit+0, BitPos(LATB7_bit+0) 
	GOTO        L_main33
L_main32:
	BCF         LATB7_bit+0, BitPos(LATB7_bit+0) 
L_main33:
;UBIDOTS.c,230 :: 		manda_serial_const("GET /api/v1.6/devices/clase/voltaje/values?page_size=1&token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_7_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_7_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_7_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,232 :: 		lee_trama();
	CALL        _lee_trama+0, 0
;UBIDOTS.c,234 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr8_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr8_UBIDOTS+0)
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
;UBIDOTS.c,235 :: 		strcpy(captu, strtok(0, "}"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr9_UBIDOTS+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr9_UBIDOTS+0)
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
;UBIDOTS.c,237 :: 		valor_rx=atof(captu);
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
;UBIDOTS.c,239 :: 		DAC_SetOutput(valor_rx*31.0/5.0) ;
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
;UBIDOTS.c,246 :: 		}
	GOTO        L_main27
;UBIDOTS.c,248 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
