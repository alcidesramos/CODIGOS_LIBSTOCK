
_Uart1_write_text_const:

;gprs_clase.c,67 :: 		void Uart1_write_text_const(const char *info)
;gprs_clase.c,69 :: 		while(*info) UART1_Write(*info++);
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
;gprs_clase.c,70 :: 		}
L_end_Uart1_write_text_const:
	RETURN      0
; end of _Uart1_write_text_const

_soft_Uart_write_text_const:

;gprs_clase.c,72 :: 		void soft_Uart_write_text_const(const char *info)
;gprs_clase.c,74 :: 		while(*info) Soft_UART_Write(*info++);
L_soft_Uart_write_text_const2:
	MOVF        FARG_soft_Uart_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_soft_Uart_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_soft_Uart_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_soft_Uart_write_text_const3
	MOVF        FARG_soft_Uart_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_soft_Uart_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_soft_Uart_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Soft_UART_Write_udata+0
	CALL        _Soft_UART_Write+0, 0
	MOVLW       1
	ADDWF       FARG_soft_Uart_write_text_const_info+0, 1 
	MOVLW       0
	ADDWFC      FARG_soft_Uart_write_text_const_info+1, 1 
	ADDWFC      FARG_soft_Uart_write_text_const_info+2, 1 
	GOTO        L_soft_Uart_write_text_const2
L_soft_Uart_write_text_const3:
;gprs_clase.c,75 :: 		}
L_end_soft_Uart_write_text_const:
	RETURN      0
; end of _soft_Uart_write_text_const

_Soft_UART_Read_Text:

;gprs_clase.c,77 :: 		void Soft_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama,char cuanto)
;gprs_clase.c,79 :: 		unsigned int con_t=0;
	CLRF        Soft_UART_Read_Text_con_t_L0+0 
	CLRF        Soft_UART_Read_Text_con_t_L0+1 
;gprs_clase.c,82 :: 		while(*(Buffer-1)!=StopChar)   //mientras no llegue el caracter deseado
L_Soft_UART_Read_Text4:
	MOVLW       1
	SUBWF       FARG_Soft_UART_Read_Text_Buffer+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	SUBWFB      FARG_Soft_UART_Read_Text_Buffer+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORWF       FARG_Soft_UART_Read_Text_StopChar+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Soft_UART_Read_Text5
;gprs_clase.c,84 :: 		con_t++;
	INFSNZ      Soft_UART_Read_Text_con_t_L0+0, 1 
	INCF        Soft_UART_Read_Text_con_t_L0+1, 1 
;gprs_clase.c,85 :: 		dato=Soft_UART_Read(&error);  //sigue almacenando en el buffer
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
;gprs_clase.c,86 :: 		*Buffer++=dato;
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+0, FSR1L+0
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Soft_UART_Read_Text_Buffer+0, 1 
	INCF        FARG_Soft_UART_Read_Text_Buffer+1, 1 
;gprs_clase.c,87 :: 		if (con_t>=tama) break;
	MOVF        FARG_Soft_UART_Read_Text_tama+1, 0 
	SUBWF       Soft_UART_Read_Text_con_t_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Soft_UART_Read_Text105
	MOVF        FARG_Soft_UART_Read_Text_tama+0, 0 
	SUBWF       Soft_UART_Read_Text_con_t_L0+0, 0 
L__Soft_UART_Read_Text105:
	BTFSS       STATUS+0, 0 
	GOTO        L_Soft_UART_Read_Text6
	GOTO        L_Soft_UART_Read_Text5
L_Soft_UART_Read_Text6:
;gprs_clase.c,88 :: 		}
	GOTO        L_Soft_UART_Read_Text4
L_Soft_UART_Read_Text5:
;gprs_clase.c,89 :: 		*--Buffer=0; //coloca un cero al final para que sea una cadena
	MOVLW       1
	SUBWF       FARG_Soft_UART_Read_Text_Buffer+0, 1 
	MOVLW       0
	SUBWFB      FARG_Soft_UART_Read_Text_Buffer+1, 1 
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+0, FSR1L+0
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+1, FSR1H+0
	CLRF        POSTINC1+0 
;gprs_clase.c,90 :: 		}
L_end_Soft_UART_Read_Text:
	RETURN      0
; end of _Soft_UART_Read_Text

_soft_Uart_write_text:

;gprs_clase.c,96 :: 		void soft_Uart_write_text(char *info)
;gprs_clase.c,98 :: 		while(*info) Soft_UART_Write(*info++);
L_soft_Uart_write_text7:
	MOVFF       FARG_soft_Uart_write_text_info+0, FSR0L+0
	MOVFF       FARG_soft_Uart_write_text_info+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_soft_Uart_write_text8
	MOVFF       FARG_soft_Uart_write_text_info+0, FSR0L+0
	MOVFF       FARG_soft_Uart_write_text_info+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
	INFSNZ      FARG_soft_Uart_write_text_info+0, 1 
	INCF        FARG_soft_Uart_write_text_info+1, 1 
	GOTO        L_soft_Uart_write_text7
L_soft_Uart_write_text8:
;gprs_clase.c,99 :: 		}
L_end_soft_Uart_write_text:
	RETURN      0
; end of _soft_Uart_write_text

_tiempo:

;gprs_clase.c,105 :: 		char tiempo(unsigned int milis, char cap[15], char cap1[15])
;gprs_clase.c,110 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;gprs_clase.c,111 :: 		memset(trama_rx,0,100);// LIMPIA LA TRAMA
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
;gprs_clase.c,112 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,114 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,115 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,116 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,117 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo9:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo9
	DECFSZ      R12, 1, 1
	BRA         L_tiempo9
;gprs_clase.c,118 :: 		for (cont1=1;cont1<=milis;cont1++)
	MOVLW       1
	MOVWF       tiempo_cont1_L0+0 
	MOVLW       0
	MOVWF       tiempo_cont1_L0+1 
L_tiempo10:
	MOVF        tiempo_cont1_L0+1, 0 
	SUBWF       FARG_tiempo_milis+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo108
	MOVF        tiempo_cont1_L0+0, 0 
	SUBWF       FARG_tiempo_milis+0, 0 
L__tiempo108:
	BTFSS       STATUS+0, 0 
	GOTO        L_tiempo11
;gprs_clase.c,120 :: 		delay_Ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_tiempo13:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo13
	DECFSZ      R12, 1, 1
	BRA         L_tiempo13
	NOP
;gprs_clase.c,122 :: 		if (strstr(trama_rx,cap)!=0 )
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
	GOTO        L__tiempo109
	MOVLW       0
	XORWF       R0, 0 
L__tiempo109:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo14
;gprs_clase.c,124 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,125 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo15:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo15
	DECFSZ      R12, 1, 1
	BRA         L_tiempo15
;gprs_clase.c,126 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_tiempo
;gprs_clase.c,127 :: 		}
L_tiempo14:
;gprs_clase.c,128 :: 		else  if (strstr(trama_rx,cap1)!=0 )
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
	GOTO        L__tiempo110
	MOVLW       0
	XORWF       R0, 0 
L__tiempo110:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo17
;gprs_clase.c,130 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,131 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo18:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo18
	DECFSZ      R12, 1, 1
	BRA         L_tiempo18
;gprs_clase.c,132 :: 		return(2);
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_tiempo
;gprs_clase.c,133 :: 		}
L_tiempo17:
;gprs_clase.c,118 :: 		for (cont1=1;cont1<=milis;cont1++)
	INFSNZ      tiempo_cont1_L0+0, 1 
	INCF        tiempo_cont1_L0+1, 1 
;gprs_clase.c,134 :: 		}
	GOTO        L_tiempo10
L_tiempo11:
;gprs_clase.c,136 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,137 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,138 :: 		}
L_end_tiempo:
	RETURN      0
; end of _tiempo

_manda_AT_COMANDO:

;gprs_clase.c,140 :: 		char manda_AT_COMANDO(char *coman, char cap[15], char cap1[15],unsigned int retardo)
;gprs_clase.c,142 :: 		Uart1_write_text(coman);//manda el comando
	MOVF        FARG_manda_AT_COMANDO_coman+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_AT_COMANDO_coman+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,143 :: 		Uart1_write_text_const("\r\n"); // manda final de linea
	MOVLW       ?lstr_1_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_1_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_1_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,144 :: 		return (tiempo(retardo,cap,cap1));
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
;gprs_clase.c,145 :: 		}
L_end_manda_AT_COMANDO:
	RETURN      0
; end of _manda_AT_COMANDO

_prendio:

;gprs_clase.c,148 :: 		unsigned char prendio()
;gprs_clase.c,150 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio19:
	DECFSZ      R13, 1, 1
	BRA         L_prendio19
	DECFSZ      R12, 1, 1
	BRA         L_prendio19
	DECFSZ      R11, 1, 1
	BRA         L_prendio19
	NOP
	NOP
;gprs_clase.c,153 :: 		if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
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
	GOTO        L_prendio20
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_prendio
L_prendio20:
;gprs_clase.c,156 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,157 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_prendio22:
	DECFSZ      R13, 1, 1
	BRA         L_prendio22
	DECFSZ      R12, 1, 1
	BRA         L_prendio22
	DECFSZ      R11, 1, 1
	BRA         L_prendio22
	NOP
	NOP
;gprs_clase.c,158 :: 		pin_on=1;
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,159 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio23:
	DECFSZ      R13, 1, 1
	BRA         L_prendio23
	DECFSZ      R12, 1, 1
	BRA         L_prendio23
	DECFSZ      R11, 1, 1
	BRA         L_prendio23
	NOP
	NOP
;gprs_clase.c,160 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,161 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio24:
	DECFSZ      R13, 1, 1
	BRA         L_prendio24
	DECFSZ      R12, 1, 1
	BRA         L_prendio24
	DECFSZ      R11, 1, 1
	BRA         L_prendio24
	NOP
	NOP
;gprs_clase.c,163 :: 		if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
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
	GOTO        L_prendio25
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_prendio
L_prendio25:
;gprs_clase.c,164 :: 		else return(0);// sino dice que fue imposible encender el modulo
	CLRF        R0 
;gprs_clase.c,166 :: 		}
L_end_prendio:
	RETURN      0
; end of _prendio

_interrupcion:

;gprs_clase.c,171 :: 		void interrupcion() iv 0x0008 ics ICS_AUTO
;gprs_clase.c,174 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion27
;gprs_clase.c,176 :: 		dato_rx=RCREG; // lee el dato
	MOVF        RCREG+0, 0 
	MOVWF       _dato_rx+0 
;gprs_clase.c,177 :: 		trama_rx[trama_cont]=dato_rx;
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
;gprs_clase.c,178 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;gprs_clase.c,179 :: 		if (trama_cont>=100) trama_cont=0;
	MOVLW       100
	SUBWF       _trama_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion28
	CLRF        _trama_cont+0 
L_interrupcion28:
;gprs_clase.c,180 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,181 :: 		}
L_interrupcion27:
;gprs_clase.c,186 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupcion29
;gprs_clase.c,188 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;gprs_clase.c,189 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;gprs_clase.c,191 :: 		timer_cont++;
	INFSNZ      _timer_cont+0, 1 
	INCF        _timer_cont+1, 1 
;gprs_clase.c,193 :: 		if (timer_cont>=espera)
	MOVLW       0
	SUBWF       _timer_cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupcion115
	MOVF        _espera+0, 0 
	SUBWF       _timer_cont+0, 0 
L__interrupcion115:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion30
;gprs_clase.c,195 :: 		Soft_UART_Break();    // le dice que salga en caso que este leyendo datos seriales por software
	CALL        _Soft_UART_Break+0, 0
;gprs_clase.c,196 :: 		timer_cont=0;
	CLRF        _timer_cont+0 
	CLRF        _timer_cont+1 
;gprs_clase.c,197 :: 		TMR0IE_bit=0; // DESHABILITA LA INTERRPCION
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,198 :: 		flag_timer=1;// habilita bandera que se cumplió el tiempo
	MOVLW       1
	MOVWF       _flag_timer+0 
	MOVLW       0
	MOVWF       _flag_timer+1 
;gprs_clase.c,199 :: 		}
L_interrupcion30:
;gprs_clase.c,200 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,201 :: 		}
L_interrupcion29:
;gprs_clase.c,204 :: 		}
L_end_interrupcion:
L__interrupcion114:
	RETFIE      1
; end of _interrupcion

_config_gprs:

;gprs_clase.c,208 :: 		void config_gprs()
;gprs_clase.c,211 :: 		hoy : // etiquete de reinico en caso que un comando falle
___config_gprs_hoy:
;gprs_clase.c,214 :: 		manda_AT_COMANDO("AT+CIPSHUT","OK", "ERROR", 2000);
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
;gprs_clase.c,217 :: 		tempo=manda_AT_COMANDO("AT+CIPMUX=0", "OK", "ERROR", 4000);
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
;gprs_clase.c,218 :: 		if (tempo!=1)  goto hoy; // Va al inicio hasta que logre inicializar
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs31
	GOTO        ___config_gprs_hoy
L_config_gprs31:
;gprs_clase.c,221 :: 		tempo=manda_AT_COMANDO("AT+CIPSTATUS", "IP INITIAL", "ERROR", 500);
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
;gprs_clase.c,222 :: 		if (tempo!=1)  goto hoy; // Va al inicio hasta que este en estado de ip inial
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs32
	GOTO        ___config_gprs_hoy
L_config_gprs32:
;gprs_clase.c,226 :: 		tempo=manda_AT_COMANDO("AT+CSTT=\"lte.avantel.com.co\",\"\",\"\"", "OK",  "ERROR", 30000);
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
;gprs_clase.c,227 :: 		if (tempo!=1)  goto hoy; // SINO SE CONECTA A LA RED REINCIA LA CONEXIÓN
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs33
	GOTO        ___config_gprs_hoy
L_config_gprs33:
;gprs_clase.c,230 :: 		manda_AT_COMANDO("AT+CGQMIN= 1,0,0,0,0,0", "OK", "OK", 500);
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
;gprs_clase.c,231 :: 		manda_AT_COMANDO("AT+CGQREQ= 1,0,0,3,0,0", "OK", "OK", 500);
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
;gprs_clase.c,234 :: 		manda_AT_COMANDO("AT+CMGF=1", "OK", "OK", 500);
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
;gprs_clase.c,237 :: 		manda_AT_COMANDO("AT+CNMI=1,1,2,1,0", "OK", "OK", 500);
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
;gprs_clase.c,240 :: 		while(manda_AT_COMANDO("AT+CIPSTATUS", "START", "ERROR", 3000)  == 0 );
L_config_gprs34:
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
	GOTO        L_config_gprs35
	GOTO        L_config_gprs34
L_config_gprs35:
;gprs_clase.c,241 :: 		Delay_ms(2000);// RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_config_gprs36:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs36
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs36
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs36
	NOP
	NOP
;gprs_clase.c,244 :: 		tempo=manda_AT_COMANDO("AT+CIICR", "OK",  "ERROR", 30000);
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
;gprs_clase.c,245 :: 		if (tempo!=1)  goto hoy;
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs37
	GOTO        ___config_gprs_hoy
L_config_gprs37:
;gprs_clase.c,247 :: 		while (tempo=manda_AT_COMANDO("AT+CIPSTATUS", "GPRSACT", "ERROR", 6000)==0);
L_config_gprs38:
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
	GOTO        L_config_gprs39
	GOTO        L_config_gprs38
L_config_gprs39:
;gprs_clase.c,248 :: 		Delay_ms(2000);   // RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_config_gprs40:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs40
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs40
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs40
	NOP
	NOP
;gprs_clase.c,251 :: 		tempo=manda_AT_COMANDO("AT+CIFSR", ".", "ERROR", 10000);
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
;gprs_clase.c,252 :: 		if (tempo!=1)  goto hoy;// sino no hya ip reinica el proceso
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs41
	GOTO        ___config_gprs_hoy
L_config_gprs41:
;gprs_clase.c,253 :: 		Delay_ms(3000);
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
	MOVWF       R13, 0
L_config_gprs42:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs42
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs42
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs42
	NOP
	NOP
;gprs_clase.c,254 :: 		}
L_end_config_gprs:
	RETURN      0
; end of _config_gprs

_conecta:

;gprs_clase.c,257 :: 		unsigned char conecta()
;gprs_clase.c,259 :: 		tempo=manda_AT_COMANDO("AT+CIPSTART="  "\"TCP\""   ","   "\"things.ubidots.com\""  ","  "\"80\"", "CONNECT OK", "ALREADY CONNECT", 10000);
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
;gprs_clase.c,261 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_conecta43:
	DECFSZ      R13, 1, 1
	BRA         L_conecta43
	DECFSZ      R12, 1, 1
	BRA         L_conecta43
	DECFSZ      R11, 1, 1
	BRA         L_conecta43
	NOP
	NOP
;gprs_clase.c,262 :: 		if ((tempo==1) ||(tempo==2)) return(1);
	MOVF        _tempo+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta99
	MOVF        _tempo+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta99
	GOTO        L_conecta46
L__conecta99:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conecta
L_conecta46:
;gprs_clase.c,263 :: 		else return(0);
	CLRF        R0 
;gprs_clase.c,266 :: 		}
L_end_conecta:
	RETURN      0
; end of _conecta

_conectar:

;gprs_clase.c,269 :: 		unsigned char conectar()
;gprs_clase.c,272 :: 		if (conecta()==1)
	CALL        _conecta+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_conectar48
;gprs_clase.c,275 :: 		tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",5000);
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
;gprs_clase.c,276 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_conectar49:
	DECFSZ      R13, 1, 1
	BRA         L_conectar49
	DECFSZ      R12, 1, 1
	BRA         L_conectar49
	DECFSZ      R11, 1, 1
	BRA         L_conectar49
	NOP
;gprs_clase.c,278 :: 		memset(trama_tx,0,100);//limpia la trama de tranmision
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
;gprs_clase.c,280 :: 		sprintf(trama_tx,"{\"led\": %1d,\"temperatura\": %5.2f,\"gps\":{\"lat\":%11.7f, \"lng\":%12.7f}}",(unsigned int)led_ubidot,temperatura,latitud,longitud);
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
;gprs_clase.c,281 :: 		largo=strlen(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       _largo+0 
;gprs_clase.c,283 :: 		sprintf(largo_str,"%u\n\n",largo);
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
;gprs_clase.c,284 :: 		Uart1_write_text_const("POST /api/v1.6/devices/pruebas/?token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
	MOVLW       ?lstr_52_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_52_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_52_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,285 :: 		UART1_Write_Text(largo_str);
	MOVLW       _largo_str+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_largo_str+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,286 :: 		Uart1_write_text(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,289 :: 		Delay_ms(4000);// retardo de envio
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_conectar50:
	DECFSZ      R13, 1, 1
	BRA         L_conectar50
	DECFSZ      R12, 1, 1
	BRA         L_conectar50
	DECFSZ      R11, 1, 1
	BRA         L_conectar50
;gprs_clase.c,290 :: 		tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",4000);// comando de fin de envio
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
;gprs_clase.c,291 :: 		Delay_ms(5000);       //   retardo para evitar conflcitos con la respuesta de ubidots
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_conectar51:
	DECFSZ      R13, 1, 1
	BRA         L_conectar51
	DECFSZ      R12, 1, 1
	BRA         L_conectar51
	DECFSZ      R11, 1, 1
	BRA         L_conectar51
	DECFSZ      R10, 1, 1
	BRA         L_conectar51
;gprs_clase.c,325 :: 		tempo=manda_AT_COMANDO("AT+CIPCLOSE", "CLOSE OK", "ERROR",4000);// comando de fin de envio// CIERRA EL SOCKET
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
;gprs_clase.c,326 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar52:
	DECFSZ      R13, 1, 1
	BRA         L_conectar52
	DECFSZ      R12, 1, 1
	BRA         L_conectar52
	DECFSZ      R11, 1, 1
	BRA         L_conectar52
	NOP
	NOP
;gprs_clase.c,329 :: 		sprintf(texto,"sw=%1d  pwm=%3d\r\n",suiche_ubi,pwm_ubi);
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
;gprs_clase.c,330 :: 		UART1_Write_Text(texto);    // debe quitarse despues
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,331 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar53:
	DECFSZ      R13, 1, 1
	BRA         L_conectar53
	DECFSZ      R12, 1, 1
	BRA         L_conectar53
	DECFSZ      R11, 1, 1
	BRA         L_conectar53
	NOP
	NOP
;gprs_clase.c,332 :: 		if (tempo!=1) return(2);// anlizando estos codigos da más robuztez el programa
	MOVF        _tempo+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_conectar54
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_conectar
L_conectar54:
;gprs_clase.c,333 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conectar
;gprs_clase.c,334 :: 		}  // si se conector
L_conectar48:
;gprs_clase.c,335 :: 		else return(0);
	CLRF        R0 
;gprs_clase.c,336 :: 		}
L_end_conectar:
	RETURN      0
; end of _conectar

_timer_enable:

;gprs_clase.c,339 :: 		void timer_enable(char tiempo)
;gprs_clase.c,341 :: 		espera=tiempo;
	MOVF        FARG_timer_enable_tiempo+0, 0 
	MOVWF       _espera+0 
;gprs_clase.c,342 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;gprs_clase.c,343 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;gprs_clase.c,344 :: 		TMR0ON_bit=1;// prende el timer
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;gprs_clase.c,345 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,346 :: 		TMR0IE_bit=1;// habilita la interrpcion
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,348 :: 		}
L_end_timer_enable:
	RETURN      0
; end of _timer_enable

_lee_trama_soft:

;gprs_clase.c,349 :: 		char lee_trama_soft()   //funcion que retorna 1 si hay dato sino 0    en el GPS
;gprs_clase.c,355 :: 		memset(trama_GPS,100,0);
	MOVLW       _trama_GPS+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       100
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;gprs_clase.c,356 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,357 :: 		estado_rec_GPS=cap_P;
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,358 :: 		flag_timer=0;
	CLRF        _flag_timer+0 
	CLRF        _flag_timer+1 
;gprs_clase.c,359 :: 		timer_enable(4);
	MOVLW       4
	MOVWF       FARG_timer_enable_tiempo+0 
	CALL        _timer_enable+0, 0
;gprs_clase.c,361 :: 		while (flag_timer==0)
L_lee_trama_soft56:
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft121
	MOVLW       0
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft121:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft57
;gprs_clase.c,363 :: 		switch (estado_rec_GPS)
	GOTO        L_lee_trama_soft58
;gprs_clase.c,365 :: 		case cap_P:
L_lee_trama_soft60:
;gprs_clase.c,366 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,367 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft122
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft122:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft61
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft61:
;gprs_clase.c,368 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;gprs_clase.c,369 :: 		if (dato_rx_GPS!='P') trama_cont_GPS=0;    //no fue el dato que me interesa
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft62
	CLRF        _trama_cont_GPS+0 
	GOTO        L_lee_trama_soft63
L_lee_trama_soft62:
;gprs_clase.c,372 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,373 :: 		estado_rec_GPS=cap_G; //pasa al estado de capturar la g
	MOVLW       1
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,374 :: 		}
L_lee_trama_soft63:
;gprs_clase.c,376 :: 		break;
	GOTO        L_lee_trama_soft59
;gprs_clase.c,378 :: 		case cap_G:
L_lee_trama_soft64:
;gprs_clase.c,379 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,380 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft123
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft123:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft65
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft65:
;gprs_clase.c,381 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;gprs_clase.c,382 :: 		if (dato_rx_GPS!='G')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft66
;gprs_clase.c,384 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,385 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,386 :: 		}
	GOTO        L_lee_trama_soft67
L_lee_trama_soft66:
;gprs_clase.c,389 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,390 :: 		estado_rec_GPS=cap_G2; //pasa al estado de capturar la g
	MOVLW       2
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,391 :: 		}
L_lee_trama_soft67:
;gprs_clase.c,394 :: 		break;
	GOTO        L_lee_trama_soft59
;gprs_clase.c,397 :: 		case cap_G2:
L_lee_trama_soft68:
;gprs_clase.c,398 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,399 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft124
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft124:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft69
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft69:
;gprs_clase.c,400 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;gprs_clase.c,401 :: 		if (dato_rx_GPS!='G')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft70
;gprs_clase.c,403 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,404 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,405 :: 		}
	GOTO        L_lee_trama_soft71
L_lee_trama_soft70:
;gprs_clase.c,408 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,409 :: 		estado_rec_GPS=cap_A; //pasa al estado de capturar la a
	MOVLW       3
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,410 :: 		}
L_lee_trama_soft71:
;gprs_clase.c,412 :: 		break;
	GOTO        L_lee_trama_soft59
;gprs_clase.c,415 :: 		case cap_A:
L_lee_trama_soft72:
;gprs_clase.c,417 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,418 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft125
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft125:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft73
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft73:
;gprs_clase.c,419 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;gprs_clase.c,420 :: 		if (dato_rx_GPS!='A')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft74
;gprs_clase.c,422 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,423 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,425 :: 		}
	GOTO        L_lee_trama_soft75
L_lee_trama_soft74:
;gprs_clase.c,428 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,429 :: 		estado_rec_GPS=esp_final_GPS; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,430 :: 		}
L_lee_trama_soft75:
;gprs_clase.c,433 :: 		break;
	GOTO        L_lee_trama_soft59
;gprs_clase.c,435 :: 		case esp_final_GPS:
L_lee_trama_soft76:
;gprs_clase.c,436 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,437 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft126
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft126:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft77
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft77:
;gprs_clase.c,438 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;gprs_clase.c,439 :: 		trama_cont_GPS++;
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,440 :: 		if (trama_cont_GPS>=100) trama_cont_GPS=0;// si supera el buffer
	MOVLW       100
	SUBWF       _trama_cont_GPS+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_lee_trama_soft78
	CLRF        _trama_cont_GPS+0 
L_lee_trama_soft78:
;gprs_clase.c,441 :: 		if (dato_rx_GPS=='*')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft79
;gprs_clase.c,443 :: 		estado_rec_GPS=cap_P;
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,444 :: 		timer_cont=0;
	CLRF        _timer_cont+0 
	CLRF        _timer_cont+1 
;gprs_clase.c,445 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,446 :: 		TMR0IE_bit=0;
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,447 :: 		flag_timer=0;
	CLRF        _flag_timer+0 
	CLRF        _flag_timer+1 
;gprs_clase.c,448 :: 		return(1); //sale del procedimiento
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_trama_soft
;gprs_clase.c,449 :: 		}
L_lee_trama_soft79:
;gprs_clase.c,451 :: 		break;
	GOTO        L_lee_trama_soft59
;gprs_clase.c,454 :: 		}//fin del switch
L_lee_trama_soft58:
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft60
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft64
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft68
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft72
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft76
L_lee_trama_soft59:
;gprs_clase.c,455 :: 		} //fin del while
	GOTO        L_lee_trama_soft56
L_lee_trama_soft57:
;gprs_clase.c,456 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,458 :: 		}
L_end_lee_trama_soft:
	RETURN      0
; end of _lee_trama_soft

_lee_cordenadas:

;gprs_clase.c,462 :: 		unsigned char lee_cordenadas()
;gprs_clase.c,466 :: 		RCIE_bit=0;  /// deshabilita int serial
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,467 :: 		if (lee_trama_soft()==1)
	CALL        _lee_trama_soft+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas80
;gprs_clase.c,471 :: 		memset (trama_GPS1,0,100);
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       100
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;gprs_clase.c,472 :: 		memset (captu_GPS,0,30);
	MOVLW       _captu_GPS+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       30
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;gprs_clase.c,474 :: 		strcpy(trama_GPS1,trama_GPS);//almacena en otro buffer  poruqe primero debe ller el fix y luego si los datos
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _trama_GPS+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,476 :: 		strcpy(captu_GPS, strtok(trama_GPS, ","));  //captura 1 coma
	MOVLW       _trama_GPS+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr60_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr60_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,477 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr61_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr61_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,478 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr62_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr62_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,479 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr63_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr63_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,480 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr64_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr64_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,481 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr65_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr65_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,482 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr66_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr66_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,484 :: 		fix=atoi(captu_GPS);
	MOVLW       _captu_GPS+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _fix+0 
	MOVF        R1, 0 
	MOVWF       _fix+1 
;gprs_clase.c,485 :: 		if ((fix==1) ||(fix==2) )// solo si ya tiene un dato valido
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_cordenadas128
	MOVLW       1
	XORWF       R0, 0 
L__lee_cordenadas128:
	BTFSC       STATUS+0, 2 
	GOTO        L__lee_cordenadas100
	MOVLW       0
	XORWF       _fix+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_cordenadas129
	MOVLW       2
	XORWF       _fix+0, 0 
L__lee_cordenadas129:
	BTFSC       STATUS+0, 2 
	GOTO        L__lee_cordenadas100
	GOTO        L_lee_cordenadas83
L__lee_cordenadas100:
;gprs_clase.c,488 :: 		strcpy(captu_GPS, strtok(trama_GPS1, ","));  //captura 1 coma
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr67_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr67_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,489 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr68_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr68_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,490 :: 		strcpy(captu_GPS, strtok(0, ",")); //captura latitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr69_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr69_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,491 :: 		memset(c_grados,0,10);//limpía los grados
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
;gprs_clase.c,492 :: 		strncpy(c_grados,captu_GPS,2);//captura los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       2
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;gprs_clase.c,493 :: 		grados=atof(c_grados);
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
;gprs_clase.c,495 :: 		minutos=atof(&captu_GPS[2])/60.0;  //lo pasa a grados
	MOVLW       _captu_GPS+2
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu_GPS+2)
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
;gprs_clase.c,496 :: 		latitud=grados+minutos;
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
;gprs_clase.c,497 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr70_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr70_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,498 :: 		if (captu_GPS[0]=='S') latitud=-latitud;
	MOVF        _captu_GPS+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas84
	BTG         _latitud+2, 7 
L_lee_cordenadas84:
;gprs_clase.c,501 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma la longitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr71_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr71_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,502 :: 		memset(c_grados,0,10);//limpía los grados
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
;gprs_clase.c,503 :: 		strncpy(c_grados,captu_GPS,3);//captura los grados  3 posiciones
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       3
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;gprs_clase.c,504 :: 		grados=atof(c_grados);
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
;gprs_clase.c,506 :: 		minutos=atof(&captu_GPS[3])/60.0;  //lo pasa a grados
	MOVLW       _captu_GPS+3
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu_GPS+3)
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
;gprs_clase.c,507 :: 		longitud=grados+minutos;
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
;gprs_clase.c,508 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr72_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr72_gprs_clase+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,509 :: 		if (captu_GPS[0]=='W') longitud=-longitud;
	MOVF        _captu_GPS+0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas85
	BTG         _longitud+2, 7 
L_lee_cordenadas85:
;gprs_clase.c,510 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,511 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,512 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,513 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,514 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_cordenadas
;gprs_clase.c,515 :: 		}// si es valida la trama
L_lee_cordenadas83:
;gprs_clase.c,518 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,519 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,520 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,521 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,522 :: 		return(0);
	CLRF        R0 
	GOTO        L_end_lee_cordenadas
;gprs_clase.c,525 :: 		}
L_lee_cordenadas80:
;gprs_clase.c,526 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,527 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,528 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,529 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,530 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,531 :: 		}
L_end_lee_cordenadas:
	RETURN      0
; end of _lee_cordenadas

_manda_mensaje:

;gprs_clase.c,533 :: 		void manda_mensaje()
;gprs_clase.c,535 :: 		Uart1_write_text_const("AT+CMGF=1\r\n");
	MOVLW       ?lstr_73_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_73_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_73_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,536 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_manda_mensaje87:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje87
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje87
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje87
	NOP
	NOP
;gprs_clase.c,537 :: 		Uart1_write_text_const("AT+CMGS=" "\"3205481022\"\r\n");// colocar el  numero deseado
	MOVLW       ?lstr_74_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_74_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_74_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,538 :: 		Delay_ms(3000);
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
	MOVWF       R13, 0
L_manda_mensaje88:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje88
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje88
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje88
	NOP
	NOP
;gprs_clase.c,539 :: 		Uart1_write_text_const("ALERTA\r\n");// mensaje a enviar
	MOVLW       ?lstr_75_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_75_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_75_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,540 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_manda_mensaje89:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje89
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje89
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje89
	NOP
	NOP
;gprs_clase.c,541 :: 		Uart1_write_text_const("\x1A\r\n");
	MOVLW       ?lstr_76_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_76_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_76_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,542 :: 		Delay_ms(3000);
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
	MOVWF       R13, 0
L_manda_mensaje90:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje90
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje90
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje90
	NOP
	NOP
;gprs_clase.c,543 :: 		}
L_end_manda_mensaje:
	RETURN      0
; end of _manda_mensaje

_main:

;gprs_clase.c,547 :: 		void main()
;gprs_clase.c,549 :: 		ADCON1=0B1111; // TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;gprs_clase.c,550 :: 		TRISB=0;
	CLRF        TRISB+0 
;gprs_clase.c,551 :: 		TRISC=0;
	CLRF        TRISC+0 
;gprs_clase.c,552 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;gprs_clase.c,554 :: 		UART1_Init(9600); // velocidad del modulo sim800
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;gprs_clase.c,555 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,557 :: 		INTCON=0b01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;gprs_clase.c,559 :: 		Soft_UART_Init(&PORTB, 2, 1, 9600, 0);  // inicializa un puerto por software
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
;gprs_clase.c,562 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,563 :: 		RCIE_bit=0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,565 :: 		LATB=0;
	CLRF        LATB+0 
;gprs_clase.c,569 :: 		T0CON=0;//LIMPIA REGISTRO DEL TIMER CERO
	CLRF        T0CON+0 
;gprs_clase.c,570 :: 		TMR0ON_bit=0; // lo mantiene apagado
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;gprs_clase.c,571 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;gprs_clase.c,572 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;gprs_clase.c,574 :: 		T0PS2_bit=1;
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;gprs_clase.c,575 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;gprs_clase.c,576 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;gprs_clase.c,578 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,579 :: 		TMR0IE_bit=0;// deshabilita la interrpcion
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,582 :: 		GIE_bit=1;// HABILITA INTERPCIONES GLOBALES
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;gprs_clase.c,585 :: 		RCEN_bit=0;
	BCF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;gprs_clase.c,586 :: 		RCEN_bit=1;
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;gprs_clase.c,588 :: 		cuenta_on=0;
	CLRF        _cuenta_on+0 
;gprs_clase.c,589 :: 		while ((prendio()==0) || (cuenta_on>=10)) cuenta_on++;  // intenta prender el modulo usando 10 intentos
L_main91:
	CALL        _prendio+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__main101
	MOVLW       10
	SUBWF       _cuenta_on+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__main101
	GOTO        L_main92
L__main101:
	INCF        _cuenta_on+0, 1 
	GOTO        L_main91
L_main92:
;gprs_clase.c,590 :: 		config_gprs();
	CALL        _config_gprs+0, 0
;gprs_clase.c,591 :: 		led_ubidot=1;
	MOVLW       1
	MOVWF       _led_ubidot+0 
;gprs_clase.c,592 :: 		temperatura=25.63;
	MOVLW       61
	MOVWF       _temperatura+0 
	MOVLW       10
	MOVWF       _temperatura+1 
	MOVLW       77
	MOVWF       _temperatura+2 
	MOVLW       131
	MOVWF       _temperatura+3 
;gprs_clase.c,593 :: 		latitud=10.3997200;
	MOVLW       65
	MOVWF       _latitud+0 
	MOVLW       101
	MOVWF       _latitud+1 
	MOVLW       38
	MOVWF       _latitud+2 
	MOVLW       130
	MOVWF       _latitud+3 
;gprs_clase.c,594 :: 		longitud=-75.4920880;
	MOVLW       243
	MOVWF       _longitud+0 
	MOVLW       251
	MOVWF       _longitud+1 
	MOVLW       150
	MOVWF       _longitud+2 
	MOVLW       133
	MOVWF       _longitud+3 
;gprs_clase.c,596 :: 		while (1)
L_main95:
;gprs_clase.c,598 :: 		if (lee_cordenadas()==1) conectar();
	CALL        _lee_cordenadas+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main97
	CALL        _conectar+0, 0
L_main97:
;gprs_clase.c,599 :: 		Delay_ms(5000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_main98:
	DECFSZ      R13, 1, 1
	BRA         L_main98
	DECFSZ      R12, 1, 1
	BRA         L_main98
	DECFSZ      R11, 1, 1
	BRA         L_main98
	DECFSZ      R10, 1, 1
	BRA         L_main98
;gprs_clase.c,601 :: 		}
	GOTO        L_main95
;gprs_clase.c,604 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
