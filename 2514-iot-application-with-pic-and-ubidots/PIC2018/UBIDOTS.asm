
_strlen_const:

;UBIDOTS.c,17 :: 		unsigned long strlen_const(const char *const_pun)
;UBIDOTS.c,19 :: 		unsigned int cuen_const=0;
	CLRF        strlen_const_cuen_const_L0+0 
	CLRF        strlen_const_cuen_const_L0+1 
;UBIDOTS.c,21 :: 		while (*const_pun++!=0) cuen_const++;
L_strlen_const0:
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
	GOTO        L_strlen_const1
	INFSNZ      strlen_const_cuen_const_L0+0, 1 
	INCF        strlen_const_cuen_const_L0+1, 1 
	GOTO        L_strlen_const0
L_strlen_const1:
;UBIDOTS.c,22 :: 		return (cuen_const);
	MOVF        strlen_const_cuen_const_L0+0, 0 
	MOVWF       R0 
	MOVF        strlen_const_cuen_const_L0+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
;UBIDOTS.c,24 :: 		}
L_end_strlen_const:
	RETURN      0
; end of _strlen_const

_manda_serial_const:

;UBIDOTS.c,27 :: 		void manda_serial_const(const char *info)
;UBIDOTS.c,29 :: 		while(*info) UART1_Write(*info++);
L_manda_serial_const2:
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
	GOTO        L_manda_serial_const3
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
	GOTO        L_manda_serial_const2
L_manda_serial_const3:
;UBIDOTS.c,30 :: 		}
L_end_manda_serial_const:
	RETURN      0
; end of _manda_serial_const

_manda_esp8266_const:

;UBIDOTS.c,34 :: 		void manda_esp8266_const(const char *info)
;UBIDOTS.c,37 :: 		manda_serial_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_1_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_1_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_1_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,38 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,39 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,40 :: 		largo=strlen_const(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_strlen_const_const_pun+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_strlen_const_const_pun+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_strlen_const_const_pun+2 
	CALL        _strlen_const+0, 0
;UBIDOTS.c,41 :: 		sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
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
;UBIDOTS.c,42 :: 		UART1_Write_Text(captu); //envia el largo d ela trama
	MOVLW       _captu+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,43 :: 		manda_serial_const("\r\n");
	MOVLW       ?lstr_3_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_3_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_3_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,44 :: 		Delay_ms(100); //retardo antes de enviar la trama
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_manda_esp8266_const4:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp8266_const4
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp8266_const4
	NOP
	NOP
;UBIDOTS.c,45 :: 		manda_serial_const(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_manda_serial_const_info+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_manda_serial_const_info+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,46 :: 		}
L_end_manda_esp8266_const:
	RETURN      0
; end of _manda_esp8266_const

_manda_esp8266:

;UBIDOTS.c,49 :: 		void manda_esp8266(char *info)
;UBIDOTS.c,52 :: 		manda_serial_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_4_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_4_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_4_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,53 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,54 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UBIDOTS.c,55 :: 		largo=strlen(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
;UBIDOTS.c,56 :: 		sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
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
;UBIDOTS.c,57 :: 		UART1_Write_Text(captu); //envia el largo d ela trama
	MOVLW       _captu+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,58 :: 		manda_serial_const("\r\n"); // estos son los dos que se adicionaron
	MOVLW       ?lstr_6_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_6_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_6_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,59 :: 		Delay_ms(100); //retardo antes de enviar la trama
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_manda_esp82665:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp82665
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp82665
	NOP
	NOP
;UBIDOTS.c,60 :: 		UART1_Write_Text(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UBIDOTS.c,61 :: 		}
L_end_manda_esp8266:
	RETURN      0
; end of _manda_esp8266

_main:

;UBIDOTS.c,66 :: 		void main()
;UBIDOTS.c,68 :: 		ADCON1=0b1110; // an0 analogo
	MOVLW       14
	MOVWF       ADCON1+0 
;UBIDOTS.c,70 :: 		trisa.b0=1; //entrada del pin analogo
	BSF         TRISA+0, 0 
;UBIDOTS.c,71 :: 		trisb.b0=1; //entrada pulsador
	BSF         TRISB+0, 0 
;UBIDOTS.c,73 :: 		TRISC6_bit=0; //Salida Tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;UBIDOTS.c,74 :: 		TRISC7_bit=1; //Entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;UBIDOTS.c,75 :: 		UART1_Init(115200);      //VELOCIDA BAUDIOS
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UBIDOTS.c,78 :: 		manda_serial_const("ATE0\r\n"); //SIN ECO
	MOVLW       ?lstr_7_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_7_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_7_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,79 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;UBIDOTS.c,81 :: 		manda_serial_const("AT+CWMODE=1\r\n"); //se CONECTA A RED EXISTENTE
	MOVLW       ?lstr_8_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_8_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_8_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,82 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;UBIDOTS.c,85 :: 		manda_serial_const("AT+CWDHCP=1,0\r\n"); //Deshabilita DHCP  para Ip manual
	MOVLW       ?lstr_9_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_9_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_9_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,86 :: 		Delay_ms(300);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
;UBIDOTS.c,90 :: 		manda_serial_const("AT+CIPSTA=\"192.168.1.117\",\"192.168.1.1\",\"255.255.255.0\"\r\n");
	MOVLW       ?lstr_10_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_10_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_10_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,92 :: 		Delay_ms(300);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
;UBIDOTS.c,97 :: 		manda_serial_const("AT+CWJAP=\"427315196575\",\"783054729115\"\r\n");  //se conecta a una red WIFI
	MOVLW       ?lstr_11_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_11_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_11_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,100 :: 		Delay_ms(6000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;UBIDOTS.c,101 :: 		manda_serial_const("AT+CIPMUX=1\r\n");  //acepta mulriples conexiones
	MOVLW       ?lstr_12_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_12_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_12_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,102 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;UBIDOTS.c,104 :: 		manda_serial_const("AT+CIFSR\r\n");//mira que ip tiene el modulo
	MOVLW       ?lstr_13_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_13_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_13_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,105 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;UBIDOTS.c,108 :: 		manda_serial_const("AT+CIPMUX=1\r\n");;
	MOVLW       ?lstr_14_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_14_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_14_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,109 :: 		Delay_ms(300);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
;UBIDOTS.c,110 :: 		manda_serial_const("AT+CIPSTART=4,\"TCP\",\"things.ubidots.com\",80\r\n");
	MOVLW       ?lstr_15_UBIDOTS+0
	MOVWF       FARG_manda_serial_const_info+0 
	MOVLW       hi_addr(?lstr_15_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+1 
	MOVLW       higher_addr(?lstr_15_UBIDOTS+0)
	MOVWF       FARG_manda_serial_const_info+2 
	CALL        _manda_serial_const+0, 0
;UBIDOTS.c,111 :: 		Delay_ms(3000);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
	NOP
;UBIDOTS.c,113 :: 		while (1)
L_main15:
;UBIDOTS.c,116 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;UBIDOTS.c,117 :: 		temperatura=codigo*500.0/1023.0;
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
;UBIDOTS.c,119 :: 		if (suiche==0) led='0'; else led='1';
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main17
	MOVLW       48
	MOVWF       _led+0 
	GOTO        L_main18
L_main17:
	MOVLW       49
	MOVWF       _led+0 
L_main18:
;UBIDOTS.c,121 :: 		memset(trama_largo,20,0);
	MOVLW       _trama_largo+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_largo+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       20
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;UBIDOTS.c,122 :: 		memset(trama,150,0);
	MOVLW       _trama+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       150
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;UBIDOTS.c,125 :: 		sprintf(trama,"{\"temperatura\": %5.2f ,\"led\": %c}\n",temperatura,led);
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
;UBIDOTS.c,127 :: 		var_largo=strlen(trama)-1;
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
;UBIDOTS.c,129 :: 		sprinti(trama_largo,"%u\n\n",var_largo);
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
;UBIDOTS.c,135 :: 		manda_esp8266_const("POST /api/v1.6/devices/micasa/?token=A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
	MOVLW       ?lstr_18_UBIDOTS+0
	MOVWF       FARG_manda_esp8266_const_info+0 
	MOVLW       hi_addr(?lstr_18_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+1 
	MOVLW       higher_addr(?lstr_18_UBIDOTS+0)
	MOVWF       FARG_manda_esp8266_const_info+2 
	CALL        _manda_esp8266_const+0, 0
;UBIDOTS.c,137 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
	NOP
;UBIDOTS.c,139 :: 		manda_esp8266(trama_largo);
	MOVLW       _trama_largo+0
	MOVWF       FARG_manda_esp8266_info+0 
	MOVLW       hi_addr(_trama_largo+0)
	MOVWF       FARG_manda_esp8266_info+1 
	CALL        _manda_esp8266+0, 0
;UBIDOTS.c,140 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
	NOP
	NOP
;UBIDOTS.c,142 :: 		manda_esp8266(trama);
	MOVLW       _trama+0
	MOVWF       FARG_manda_esp8266_info+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_manda_esp8266_info+1 
	CALL        _manda_esp8266+0, 0
;UBIDOTS.c,143 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
	NOP
;UBIDOTS.c,148 :: 		}
	GOTO        L_main15
;UBIDOTS.c,150 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
