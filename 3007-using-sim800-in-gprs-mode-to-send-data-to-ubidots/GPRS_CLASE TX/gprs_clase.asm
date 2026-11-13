
_Uart1_write_text_const:

;gprs_clase.c,37 :: 		void Uart1_write_text_const(const char *info)
;gprs_clase.c,39 :: 		while(*info) UART1_Write(*info++);
L_Uart1_write_text_const0:
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
	GOTO        L_Uart1_write_text_const1
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
	GOTO        L_Uart1_write_text_const0
L_Uart1_write_text_const1:
;gprs_clase.c,40 :: 		}
L_end_Uart1_write_text_const:
	RETURN      0
; end of _Uart1_write_text_const

_tiempo:

;gprs_clase.c,43 :: 		char tiempo(unsigned int milis, char cap[15], char cap1[15])
;gprs_clase.c,48 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;gprs_clase.c,49 :: 		memset(trama_rx,0,100);// LIMPIA LA TRAMA
	MOVLW       _trama_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       100
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;gprs_clase.c,50 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,52 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,53 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,54 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,55 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo2:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo2
	DECFSZ      R12, 1, 1
	BRA         L_tiempo2
;gprs_clase.c,56 :: 		for (cont1=1;cont1<=milis;cont1++)
	MOVLW       1
	MOVWF       tiempo_cont1_L0+0 
	MOVLW       0
	MOVWF       tiempo_cont1_L0+1 
L_tiempo3:
	MOVF        tiempo_cont1_L0+1, 0 
	SUBWF       FARG_tiempo_milis+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo58
	MOVF        tiempo_cont1_L0+0, 0 
	SUBWF       FARG_tiempo_milis+0, 0 
L__tiempo58:
	BTFSS       STATUS+0, 0 
	GOTO        L_tiempo4
;gprs_clase.c,58 :: 		delay_Ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_tiempo6:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo6
	DECFSZ      R12, 1, 1
	BRA         L_tiempo6
	NOP
;gprs_clase.c,60 :: 		if (strstr(trama_rx,cap)!=0 )
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_tiempo_cap+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_tiempo_cap+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo59
	MOVLW       0
	XORWF       R0, 0 
L__tiempo59:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo7
;gprs_clase.c,62 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,63 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo8:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo8
	DECFSZ      R12, 1, 1
	BRA         L_tiempo8
;gprs_clase.c,64 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_tiempo
;gprs_clase.c,65 :: 		}
L_tiempo7:
;gprs_clase.c,66 :: 		else  if (strstr(trama_rx,cap1)!=0 )
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_tiempo_cap1+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_tiempo_cap1+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo60
	MOVLW       0
	XORWF       R0, 0 
L__tiempo60:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo10
;gprs_clase.c,68 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,69 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo11:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo11
	DECFSZ      R12, 1, 1
	BRA         L_tiempo11
;gprs_clase.c,70 :: 		return(2);
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_tiempo
;gprs_clase.c,71 :: 		}
L_tiempo10:
;gprs_clase.c,56 :: 		for (cont1=1;cont1<=milis;cont1++)
	INFSNZ      tiempo_cont1_L0+0, 1 
	INCF        tiempo_cont1_L0+1, 1 
;gprs_clase.c,72 :: 		}
	GOTO        L_tiempo3
L_tiempo4:
;gprs_clase.c,74 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,75 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,76 :: 		}
L_end_tiempo:
	RETURN      0
; end of _tiempo

_manda_AT_COMANDO:

;gprs_clase.c,78 :: 		char manda_AT_COMANDO(char *coman, char cap[15], char cap1[15],unsigned int retardo)
;gprs_clase.c,80 :: 		Uart1_write_text(coman);//manda el comando
	MOVF        FARG_manda_AT_COMANDO_coman+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_AT_COMANDO_coman+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,81 :: 		Uart1_write_text_const("\r\n"); // manda final de linea
	MOVLW       ?lstr_1_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_1_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_1_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,82 :: 		return (tiempo(retardo,cap,cap1));
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
;gprs_clase.c,83 :: 		}
L_end_manda_AT_COMANDO:
	RETURN      0
; end of _manda_AT_COMANDO

_prendio:

;gprs_clase.c,86 :: 		unsigned char prendio()
;gprs_clase.c,88 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio12:
	DECFSZ      R13, 1, 1
	BRA         L_prendio12
	DECFSZ      R12, 1, 1
	BRA         L_prendio12
	DECFSZ      R11, 1, 1
	BRA         L_prendio12
	NOP
	NOP
;gprs_clase.c,91 :: 		if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
	MOVLW       ?lstr2_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr2_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr3_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr3_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr4_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr4_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       208
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       7
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_prendio13
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_prendio
L_prendio13:
;gprs_clase.c,94 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,95 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_prendio15:
	DECFSZ      R13, 1, 1
	BRA         L_prendio15
	DECFSZ      R12, 1, 1
	BRA         L_prendio15
	DECFSZ      R11, 1, 1
	BRA         L_prendio15
	NOP
	NOP
;gprs_clase.c,96 :: 		pin_on=1;
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,97 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio16:
	DECFSZ      R13, 1, 1
	BRA         L_prendio16
	DECFSZ      R12, 1, 1
	BRA         L_prendio16
	DECFSZ      R11, 1, 1
	BRA         L_prendio16
	NOP
	NOP
;gprs_clase.c,98 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,99 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio17:
	DECFSZ      R13, 1, 1
	BRA         L_prendio17
	DECFSZ      R12, 1, 1
	BRA         L_prendio17
	DECFSZ      R11, 1, 1
	BRA         L_prendio17
	NOP
	NOP
;gprs_clase.c,101 :: 		if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
	MOVLW       ?lstr5_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr5_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr6_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr6_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr7_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr7_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       208
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       7
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_prendio18
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_prendio
L_prendio18:
;gprs_clase.c,102 :: 		else return(0);// sino dice que fue imposible encender el modulo
	CLRF        R0 
;gprs_clase.c,104 :: 		}
L_end_prendio:
	RETURN      0
; end of _prendio

_interrupcion:

;gprs_clase.c,109 :: 		void interrupcion() iv 0x0008 ics ICS_AUTO
;gprs_clase.c,112 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion20
;gprs_clase.c,114 :: 		dato_rx=RCREG; // lee el dato
	MOVF        RCREG+0, 0 
	MOVWF       _dato_rx+0 
;gprs_clase.c,115 :: 		trama_rx[trama_cont]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;gprs_clase.c,116 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;gprs_clase.c,117 :: 		if (trama_cont>=100) trama_cont=0;
	MOVLW       100
	SUBWF       _trama_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion21
	CLRF        _trama_cont+0 
L_interrupcion21:
;gprs_clase.c,118 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,119 :: 		}
L_interrupcion20:
;gprs_clase.c,121 :: 		}
L_end_interrupcion:
L__interrupcion64:
	RETFIE      1
; end of _interrupcion

_config_gprs:

;gprs_clase.c,125 :: 		void config_gprs()
;gprs_clase.c,128 :: 		hoy : // etiquete de reinico en caso que un comando falle
___config_gprs_hoy:
;gprs_clase.c,131 :: 		manda_AT_COMANDO("AT+CIPSHUT","OK", "ERROR", 2000);
	MOVLW       ?lstr8_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr8_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr9_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr9_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr10_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr10_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       208
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       7
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;gprs_clase.c,134 :: 		tempo=manda_AT_COMANDO("AT+CIPMUX=0", "OK", "ERROR", 4000);
	MOVLW       ?lstr11_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr11_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr12_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr12_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr13_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr13_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       160
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       15
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,135 :: 		if (tempo!=1)  goto hoy; // Va al inicio hasta que logre inicializar
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs22
	GOTO        ___config_gprs_hoy
L_config_gprs22:
;gprs_clase.c,138 :: 		tempo=manda_AT_COMANDO("AT+CIPSTATUS", "IP INITIAL", "ERROR", 500);
	MOVLW       ?lstr14_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr14_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr15_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr15_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr16_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr16_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,139 :: 		if (tempo!=1)  goto hoy; // Va al inicio hasta que este en estado de ip inial
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs23
	GOTO        ___config_gprs_hoy
L_config_gprs23:
;gprs_clase.c,143 :: 		tempo=manda_AT_COMANDO("AT+CSTT=\"lte.avantel.com.co\",\"\",\"\"", "OK",  "ERROR", 30000);
	MOVLW       ?lstr17_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr17_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr18_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr18_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr19_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr19_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       48
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       117
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,144 :: 		if (tempo!=1)  goto hoy; // SINO SE CONECTA A LA RED REINCIA LA CONEXIÓN
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs24
	GOTO        ___config_gprs_hoy
L_config_gprs24:
;gprs_clase.c,147 :: 		manda_AT_COMANDO("AT+CGQMIN= 1,0,0,0,0,0", "OK", "OK", 500);
	MOVLW       ?lstr20_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr20_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr21_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr21_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr22_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr22_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;gprs_clase.c,148 :: 		manda_AT_COMANDO("AT+CGQREQ= 1,0,0,3,0,0", "OK", "OK", 500);
	MOVLW       ?lstr23_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr23_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr24_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr24_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr25_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr25_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;gprs_clase.c,151 :: 		manda_AT_COMANDO("AT+CMGF=1", "OK", "OK", 500);
	MOVLW       ?lstr26_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr26_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr27_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr27_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr28_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr28_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;gprs_clase.c,154 :: 		manda_AT_COMANDO("AT+CNMI=1,1,2,1,0", "OK", "OK", 500);
	MOVLW       ?lstr29_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr29_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr30_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr30_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr31_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr31_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;gprs_clase.c,157 :: 		while(manda_AT_COMANDO("AT+CIPSTATUS", "START", "ERROR", 3000)  == 0 );
L_config_gprs25:
	MOVLW       ?lstr32_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr32_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr33_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr33_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr34_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr34_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       184
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       11
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_config_gprs26
	GOTO        L_config_gprs25
L_config_gprs26:
;gprs_clase.c,158 :: 		Delay_ms(2000);// RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_config_gprs27:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs27
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs27
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs27
	NOP
	NOP
;gprs_clase.c,161 :: 		tempo=manda_AT_COMANDO("AT+CIICR", "OK",  "ERROR", 30000);
	MOVLW       ?lstr35_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr35_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr36_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr36_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr37_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr37_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       48
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       117
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,162 :: 		if (tempo!=1)  goto hoy;
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs28
	GOTO        ___config_gprs_hoy
L_config_gprs28:
;gprs_clase.c,164 :: 		while (tempo=manda_AT_COMANDO("AT+CIPSTATUS", "GPRSACT", "ERROR", 6000)==0);
L_config_gprs29:
	MOVLW       ?lstr38_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr38_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr39_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr39_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr40_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr40_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       112
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       23
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tempo+0 
	MOVF        R1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs30
	GOTO        L_config_gprs29
L_config_gprs30:
;gprs_clase.c,165 :: 		Delay_ms(2000);   // RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_config_gprs31:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs31
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs31
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs31
	NOP
	NOP
;gprs_clase.c,168 :: 		tempo=manda_AT_COMANDO("AT+CIFSR", ".", "ERROR", 10000);
	MOVLW       ?lstr41_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr41_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr42_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr42_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr43_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr43_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       16
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       39
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,169 :: 		if (tempo!=1)  goto hoy;// sino no hya ip reinica el proceso
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs32
	GOTO        ___config_gprs_hoy
L_config_gprs32:
;gprs_clase.c,170 :: 		Delay_ms(3000);
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
	MOVWF       R13, 0
L_config_gprs33:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs33
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs33
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs33
	NOP
	NOP
;gprs_clase.c,171 :: 		}
L_end_config_gprs:
	RETURN      0
; end of _config_gprs

_conecta:

;gprs_clase.c,174 :: 		unsigned char conecta()
;gprs_clase.c,176 :: 		tempo=manda_AT_COMANDO("AT+CIPSTART="  "\"TCP\""   ","   "\"things.ubidots.com\""  ","  "\"80\"", "CONNECT OK", "ALREADY CONNECT", 10000);
	MOVLW       ?lstr44_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr44_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr45_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr45_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr46_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr46_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       16
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       39
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,178 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_conecta34:
	DECFSZ      R13, 1, 1
	BRA         L_conecta34
	DECFSZ      R12, 1, 1
	BRA         L_conecta34
	DECFSZ      R11, 1, 1
	BRA         L_conecta34
	NOP
	NOP
;gprs_clase.c,179 :: 		if ((tempo==1) ||(tempo==2)) return(1);
	MOVF        _tempo+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta54
	MOVF        _tempo+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta54
	GOTO        L_conecta37
L__conecta54:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conecta
L_conecta37:
;gprs_clase.c,180 :: 		else return(0);
	CLRF        R0 
;gprs_clase.c,183 :: 		}
L_end_conecta:
	RETURN      0
; end of _conecta

_conectar:

;gprs_clase.c,186 :: 		unsigned char conectar()
;gprs_clase.c,189 :: 		if (conecta()==1)
	CALL        _conecta+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_conectar39
;gprs_clase.c,192 :: 		tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",5000);
	MOVLW       ?lstr47_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr47_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr48_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr48_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr49_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr49_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       136
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       19
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,193 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_conectar40:
	DECFSZ      R13, 1, 1
	BRA         L_conectar40
	DECFSZ      R12, 1, 1
	BRA         L_conectar40
	DECFSZ      R11, 1, 1
	BRA         L_conectar40
	NOP
;gprs_clase.c,195 :: 		memset(trama_tx,0,100);//limpia la trama de tranmision
	MOVLW       _trama_tx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       100
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;gprs_clase.c,197 :: 		sprintf(trama_tx,"{\"led\": %1d,\"temperatura\": %5.2f,\"gps\":{\"lat\":%11.7f, \"lng\":%12.7f}}",(unsigned int)led_ubidot,temperatura,latitud,longitud);
	MOVLW       _trama_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_50_gprs_clase+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_50_gprs_clase+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_50_gprs_clase+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _led_ubidot+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _latitud+0, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _latitud+1, 0 
	MOVWF       FARG_sprintf_wh+12 
	MOVF        _latitud+2, 0 
	MOVWF       FARG_sprintf_wh+13 
	MOVF        _latitud+3, 0 
	MOVWF       FARG_sprintf_wh+14 
	MOVF        _longitud+0, 0 
	MOVWF       FARG_sprintf_wh+15 
	MOVF        _longitud+1, 0 
	MOVWF       FARG_sprintf_wh+16 
	MOVF        _longitud+2, 0 
	MOVWF       FARG_sprintf_wh+17 
	MOVF        _longitud+3, 0 
	MOVWF       FARG_sprintf_wh+18 
	CALL        _sprintf+0, 0
;gprs_clase.c,198 :: 		largo=strlen(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       _largo+0 
;gprs_clase.c,200 :: 		sprintf(largo_str,"%u\n\n",largo);
	MOVLW       _largo_str+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_largo_str+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_51_gprs_clase+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_51_gprs_clase+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_51_gprs_clase+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	CALL        _sprintf+0, 0
;gprs_clase.c,201 :: 		Uart1_write_text_const("POST /api/v1.6/devices/pruebas/?token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
	MOVLW       ?lstr_52_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_52_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_52_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,202 :: 		UART1_Write_Text(largo_str);
	MOVLW       _largo_str+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_largo_str+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,203 :: 		Uart1_write_text(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,206 :: 		Delay_ms(4000);// retardo de envio
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_conectar41:
	DECFSZ      R13, 1, 1
	BRA         L_conectar41
	DECFSZ      R12, 1, 1
	BRA         L_conectar41
	DECFSZ      R11, 1, 1
	BRA         L_conectar41
;gprs_clase.c,207 :: 		tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",4000);// comando de fin de envio
	MOVLW       ?lstr53_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr53_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr54_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr54_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr55_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr55_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       160
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       15
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,208 :: 		Delay_ms(5000);       //   retardo para evitar conflcitos con la respuesta de ubidots
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_conectar42:
	DECFSZ      R13, 1, 1
	BRA         L_conectar42
	DECFSZ      R12, 1, 1
	BRA         L_conectar42
	DECFSZ      R11, 1, 1
	BRA         L_conectar42
	DECFSZ      R10, 1, 1
	BRA         L_conectar42
;gprs_clase.c,242 :: 		tempo=manda_AT_COMANDO("AT+CIPCLOSE", "CLOSE OK", "ERROR",4000);// comando de fin de envio// CIERRA EL SOCKET
	MOVLW       ?lstr56_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr56_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr57_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr57_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr58_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr58_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       160
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       15
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,243 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar43:
	DECFSZ      R13, 1, 1
	BRA         L_conectar43
	DECFSZ      R12, 1, 1
	BRA         L_conectar43
	DECFSZ      R11, 1, 1
	BRA         L_conectar43
	NOP
	NOP
;gprs_clase.c,246 :: 		sprintf(texto,"sw=%1d  pwm=%3d\r\n",suiche_ubi,pwm_ubi);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_59_gprs_clase+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_59_gprs_clase+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_59_gprs_clase+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _suiche_ubi+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _suiche_ubi+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _pwm_ubi+0, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _pwm_ubi+1, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;gprs_clase.c,247 :: 		UART1_Write_Text(texto);    // debe quitarse despues
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,248 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar44:
	DECFSZ      R13, 1, 1
	BRA         L_conectar44
	DECFSZ      R12, 1, 1
	BRA         L_conectar44
	DECFSZ      R11, 1, 1
	BRA         L_conectar44
	NOP
	NOP
;gprs_clase.c,249 :: 		if (tempo!=1) return(2);// anlizando estos codigos da más robuztez el programa
	MOVF        _tempo+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_conectar45
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_conectar
L_conectar45:
;gprs_clase.c,250 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conectar
;gprs_clase.c,251 :: 		}  // si se conector
L_conectar39:
;gprs_clase.c,252 :: 		else return(0);
	CLRF        R0 
;gprs_clase.c,253 :: 		}
L_end_conectar:
	RETURN      0
; end of _conectar

_main:

;gprs_clase.c,258 :: 		void main()
;gprs_clase.c,260 :: 		ADCON1=0B1111; // TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;gprs_clase.c,261 :: 		TRISB=0;
	CLRF        TRISB+0 
;gprs_clase.c,262 :: 		TRISC=0;
	CLRF        TRISC+0 
;gprs_clase.c,263 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;gprs_clase.c,265 :: 		UART1_Init(9600); // velocidad del modulo sim800
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;gprs_clase.c,266 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,268 :: 		INTCON=0b01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;gprs_clase.c,270 :: 		Soft_UART_Init(&PORTB, 2, 1, 9600, 0);  // inicializa un puerto por software
	MOVLW       PORTB+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       2
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       1
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       128
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       37
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
;gprs_clase.c,273 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,274 :: 		RCIE_bit=0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,276 :: 		LATB=0;
	CLRF        LATB+0 
;gprs_clase.c,281 :: 		T0CON=0;//LIMPIA REGISTRO DEL TIMER CERO
	CLRF        T0CON+0 
;gprs_clase.c,282 :: 		TMR0ON_bit=0; // lo mantiene apagado
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;gprs_clase.c,283 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;gprs_clase.c,284 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;gprs_clase.c,286 :: 		T0PS2_bit=1;
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;gprs_clase.c,287 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;gprs_clase.c,288 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;gprs_clase.c,290 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,291 :: 		TMR0IE_bit=0;// deshabilita la interrpcion
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,295 :: 		GIE_bit=1;// HABILITA INTERPCIONES GLOBALES
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;gprs_clase.c,298 :: 		RCEN_bit=0;
	BCF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;gprs_clase.c,299 :: 		RCEN_bit=1;
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;gprs_clase.c,300 :: 		while ((prendio()==0) || (cuenta_on>=10)) cuenta_on++;  // intenta prender el modulo usando 10 intentos
L_main47:
	CALL        _prendio+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__main55
	MOVLW       10
	SUBWF       _cuenta_on+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__main55
	GOTO        L_main48
L__main55:
	INCF        _cuenta_on+0, 1 
	GOTO        L_main47
L_main48:
;gprs_clase.c,301 :: 		config_gprs();
	CALL        _config_gprs+0, 0
;gprs_clase.c,302 :: 		led_ubidot=1;
	MOVLW       1
	MOVWF       _led_ubidot+0 
;gprs_clase.c,303 :: 		temperatura=25.63;
	MOVLW       61
	MOVWF       _temperatura+0 
	MOVLW       10
	MOVWF       _temperatura+1 
	MOVLW       77
	MOVWF       _temperatura+2 
	MOVLW       131
	MOVWF       _temperatura+3 
;gprs_clase.c,304 :: 		latitud=10.3997200;
	MOVLW       65
	MOVWF       _latitud+0 
	MOVLW       101
	MOVWF       _latitud+1 
	MOVLW       38
	MOVWF       _latitud+2 
	MOVLW       130
	MOVWF       _latitud+3 
;gprs_clase.c,305 :: 		longitud=-75.4920880;
	MOVLW       243
	MOVWF       _longitud+0 
	MOVLW       251
	MOVWF       _longitud+1 
	MOVLW       150
	MOVWF       _longitud+2 
	MOVLW       133
	MOVWF       _longitud+3 
;gprs_clase.c,307 :: 		while (1)
L_main51:
;gprs_clase.c,309 :: 		conectar();
	CALL        _conectar+0, 0
;gprs_clase.c,310 :: 		Delay_ms(5000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
	DECFSZ      R10, 1, 1
	BRA         L_main53
;gprs_clase.c,312 :: 		}
	GOTO        L_main51
;gprs_clase.c,315 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
