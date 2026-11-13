
_Uart1_write_text_const:

;gprs_clase.c,77 :: 		void Uart1_write_text_const(const char *info)
;gprs_clase.c,79 :: 		while(*info) UART1_Write(*info++);
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
;gprs_clase.c,80 :: 		}
L_end_Uart1_write_text_const:
	RETURN      0
; end of _Uart1_write_text_const

_soft_Uart_write_text_const:

;gprs_clase.c,82 :: 		void soft_Uart_write_text_const(const char *info)
;gprs_clase.c,84 :: 		while(*info) Soft_UART_Write(*info++);
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
;gprs_clase.c,85 :: 		}
L_end_soft_Uart_write_text_const:
	RETURN      0
; end of _soft_Uart_write_text_const

_Soft_UART_Read_Text:

;gprs_clase.c,87 :: 		void Soft_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama,char cuanto)
;gprs_clase.c,89 :: 		unsigned int con_t=0;
	CLRF        Soft_UART_Read_Text_con_t_L0+0 
	CLRF        Soft_UART_Read_Text_con_t_L0+1 
;gprs_clase.c,92 :: 		while(*(Buffer-1)!=StopChar)   //mientras no llegue el caracter deseado
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
;gprs_clase.c,94 :: 		con_t++;
	INFSNZ      Soft_UART_Read_Text_con_t_L0+0, 1 
	INCF        Soft_UART_Read_Text_con_t_L0+1, 1 
;gprs_clase.c,95 :: 		dato=Soft_UART_Read(&error);  //sigue almacenando en el buffer
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
;gprs_clase.c,96 :: 		*Buffer++=dato;
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+0, FSR1L+0
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Soft_UART_Read_Text_Buffer+0, 1 
	INCF        FARG_Soft_UART_Read_Text_Buffer+1, 1 
;gprs_clase.c,97 :: 		if (con_t>=tama) break;
	MOVF        FARG_Soft_UART_Read_Text_tama+1, 0 
	SUBWF       Soft_UART_Read_Text_con_t_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Soft_UART_Read_Text133
	MOVF        FARG_Soft_UART_Read_Text_tama+0, 0 
	SUBWF       Soft_UART_Read_Text_con_t_L0+0, 0 
L__Soft_UART_Read_Text133:
	BTFSS       STATUS+0, 0 
	GOTO        L_Soft_UART_Read_Text6
	GOTO        L_Soft_UART_Read_Text5
L_Soft_UART_Read_Text6:
;gprs_clase.c,98 :: 		}
	GOTO        L_Soft_UART_Read_Text4
L_Soft_UART_Read_Text5:
;gprs_clase.c,99 :: 		*--Buffer=0; //coloca un cero al final para que sea una cadena
	MOVLW       1
	SUBWF       FARG_Soft_UART_Read_Text_Buffer+0, 1 
	MOVLW       0
	SUBWFB      FARG_Soft_UART_Read_Text_Buffer+1, 1 
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+0, FSR1L+0
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+1, FSR1H+0
	CLRF        POSTINC1+0 
;gprs_clase.c,100 :: 		}
L_end_Soft_UART_Read_Text:
	RETURN      0
; end of _Soft_UART_Read_Text

_soft_Uart_write_text:

;gprs_clase.c,106 :: 		void soft_Uart_write_text(char *info)
;gprs_clase.c,108 :: 		while(*info) Soft_UART_Write(*info++);
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
;gprs_clase.c,109 :: 		}
L_end_soft_Uart_write_text:
	RETURN      0
; end of _soft_Uart_write_text

_tiempo:

;gprs_clase.c,115 :: 		char tiempo(unsigned int milis, char cap[15], char cap1[15])
;gprs_clase.c,119 :: 		estado_rec=normal;
	CLRF        _estado_rec+0 
;gprs_clase.c,120 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;gprs_clase.c,121 :: 		memset(trama_rx,0,100);// LIMPIA LA TRAMA
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
;gprs_clase.c,122 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,124 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,125 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,126 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,127 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo9:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo9
	DECFSZ      R12, 1, 1
	BRA         L_tiempo9
;gprs_clase.c,128 :: 		for (cont1=1;cont1<=milis;cont1++)
	MOVLW       1
	MOVWF       tiempo_cont1_L0+0 
	MOVLW       0
	MOVWF       tiempo_cont1_L0+1 
L_tiempo10:
	MOVF        tiempo_cont1_L0+1, 0 
	SUBWF       FARG_tiempo_milis+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo136
	MOVF        tiempo_cont1_L0+0, 0 
	SUBWF       FARG_tiempo_milis+0, 0 
L__tiempo136:
	BTFSS       STATUS+0, 0 
	GOTO        L_tiempo11
;gprs_clase.c,130 :: 		delay_Ms(1);
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
;gprs_clase.c,132 :: 		if (strstr(trama_rx,cap)!=0 )
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
	GOTO        L__tiempo137
	MOVLW       0
	XORWF       R0, 0 
L__tiempo137:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo14
;gprs_clase.c,134 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,135 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo15:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo15
	DECFSZ      R12, 1, 1
	BRA         L_tiempo15
;gprs_clase.c,136 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_tiempo
;gprs_clase.c,137 :: 		}
L_tiempo14:
;gprs_clase.c,138 :: 		else  if (strstr(trama_rx,cap1)!=0 )
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
	GOTO        L__tiempo138
	MOVLW       0
	XORWF       R0, 0 
L__tiempo138:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo17
;gprs_clase.c,140 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,141 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo18:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo18
	DECFSZ      R12, 1, 1
	BRA         L_tiempo18
;gprs_clase.c,142 :: 		return(2);
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_tiempo
;gprs_clase.c,143 :: 		}
L_tiempo17:
;gprs_clase.c,128 :: 		for (cont1=1;cont1<=milis;cont1++)
	INFSNZ      tiempo_cont1_L0+0, 1 
	INCF        tiempo_cont1_L0+1, 1 
;gprs_clase.c,144 :: 		}
	GOTO        L_tiempo10
L_tiempo11:
;gprs_clase.c,146 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,147 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,148 :: 		}
L_end_tiempo:
	RETURN      0
; end of _tiempo

_tiempo_rec:

;gprs_clase.c,151 :: 		char tiempo_rec(unsigned int milis)
;gprs_clase.c,155 :: 		flag_ubi=0;
	CLRF        _flag_ubi+0 
;gprs_clase.c,156 :: 		estado_rec=cap_l;
	MOVLW       1
	MOVWF       _estado_rec+0 
;gprs_clase.c,157 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;gprs_clase.c,158 :: 		memset(trama_rx,0,100);// LIMPIA LA TRAMA
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
;gprs_clase.c,159 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,161 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,162 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,163 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,164 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo_rec19:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo_rec19
	DECFSZ      R12, 1, 1
	BRA         L_tiempo_rec19
;gprs_clase.c,165 :: 		for (cont1=1;cont1<=milis;cont1++)
	MOVLW       1
	MOVWF       tiempo_rec_cont1_L0+0 
	MOVLW       0
	MOVWF       tiempo_rec_cont1_L0+1 
L_tiempo_rec20:
	MOVF        tiempo_rec_cont1_L0+1, 0 
	SUBWF       FARG_tiempo_rec_milis+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo_rec140
	MOVF        tiempo_rec_cont1_L0+0, 0 
	SUBWF       FARG_tiempo_rec_milis+0, 0 
L__tiempo_rec140:
	BTFSS       STATUS+0, 0 
	GOTO        L_tiempo_rec21
;gprs_clase.c,167 :: 		delay_Ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_tiempo_rec23:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo_rec23
	DECFSZ      R12, 1, 1
	BRA         L_tiempo_rec23
	NOP
;gprs_clase.c,168 :: 		if (flag_ubi==1) return(1);
	MOVF        _flag_ubi+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_tiempo_rec24
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_tiempo_rec
L_tiempo_rec24:
;gprs_clase.c,165 :: 		for (cont1=1;cont1<=milis;cont1++)
	INFSNZ      tiempo_rec_cont1_L0+0, 1 
	INCF        tiempo_rec_cont1_L0+1, 1 
;gprs_clase.c,169 :: 		}
	GOTO        L_tiempo_rec20
L_tiempo_rec21:
;gprs_clase.c,170 :: 		RCIE_bit=0; // deshabilita la interrupcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,171 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,172 :: 		}
L_end_tiempo_rec:
	RETURN      0
; end of _tiempo_rec

_manda_AT_COMANDO:

;gprs_clase.c,176 :: 		char manda_AT_COMANDO(char *coman, char cap[15], char cap1[15],unsigned int retardo)
;gprs_clase.c,178 :: 		Uart1_write_text(coman);//manda el comando
	MOVF        FARG_manda_AT_COMANDO_coman+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_AT_COMANDO_coman+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,179 :: 		Uart1_write_text_const("\r\n"); // manda final de linea
	MOVLW       ?lstr_1_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_1_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_1_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,180 :: 		return (tiempo(retardo,cap,cap1));
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
;gprs_clase.c,181 :: 		}
L_end_manda_AT_COMANDO:
	RETURN      0
; end of _manda_AT_COMANDO

_prendio:

;gprs_clase.c,184 :: 		unsigned char prendio()
;gprs_clase.c,186 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio25:
	DECFSZ      R13, 1, 1
	BRA         L_prendio25
	DECFSZ      R12, 1, 1
	BRA         L_prendio25
	DECFSZ      R11, 1, 1
	BRA         L_prendio25
	NOP
	NOP
;gprs_clase.c,189 :: 		if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
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
	GOTO        L_prendio26
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_prendio
L_prendio26:
;gprs_clase.c,192 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,193 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_prendio28:
	DECFSZ      R13, 1, 1
	BRA         L_prendio28
	DECFSZ      R12, 1, 1
	BRA         L_prendio28
	DECFSZ      R11, 1, 1
	BRA         L_prendio28
	NOP
	NOP
;gprs_clase.c,194 :: 		pin_on=1;
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,195 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio29:
	DECFSZ      R13, 1, 1
	BRA         L_prendio29
	DECFSZ      R12, 1, 1
	BRA         L_prendio29
	DECFSZ      R11, 1, 1
	BRA         L_prendio29
	NOP
	NOP
;gprs_clase.c,196 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,197 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_prendio30:
	DECFSZ      R13, 1, 1
	BRA         L_prendio30
	DECFSZ      R12, 1, 1
	BRA         L_prendio30
	DECFSZ      R11, 1, 1
	BRA         L_prendio30
	NOP
	NOP
;gprs_clase.c,199 :: 		if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
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
	GOTO        L_prendio31
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_prendio
L_prendio31:
;gprs_clase.c,200 :: 		else return(0);// sino dice que fue imposible encender el modulo
	CLRF        R0 
;gprs_clase.c,202 :: 		}
L_end_prendio:
	RETURN      0
; end of _prendio

_interrupcion:

;gprs_clase.c,207 :: 		void interrupcion() iv 0x0008 ics ICS_AUTO
;gprs_clase.c,211 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion33
;gprs_clase.c,213 :: 		dato_rx=RCREG; // lee el dato
	MOVF        RCREG+0, 0 
	MOVWF       _dato_rx+0 
;gprs_clase.c,215 :: 		switch (estado_rec)
	GOTO        L_interrupcion34
;gprs_clase.c,217 :: 		case normal:
L_interrupcion36:
;gprs_clase.c,218 :: 		trama_rx[trama_cont]=dato_rx;
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
;gprs_clase.c,219 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;gprs_clase.c,220 :: 		if (trama_cont>=100) trama_cont=0;
	MOVLW       100
	SUBWF       _trama_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion37
	CLRF        _trama_cont+0 
L_interrupcion37:
;gprs_clase.c,221 :: 		break;
	GOTO        L_interrupcion35
;gprs_clase.c,223 :: 		case cap_l:
L_interrupcion38:
;gprs_clase.c,224 :: 		trama_rx[trama_cont]=dato_rx;
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
;gprs_clase.c,225 :: 		if (dato_rx!='l') trama_cont=0;    //no fue el dato que me interesa
	MOVF        _dato_rx+0, 0 
	XORLW       108
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion39
	CLRF        _trama_cont+0 
	GOTO        L_interrupcion40
L_interrupcion39:
;gprs_clase.c,228 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;gprs_clase.c,229 :: 		estado_rec=cap_u; //pasa al estado de capturar la u
	MOVLW       2
	MOVWF       _estado_rec+0 
;gprs_clase.c,230 :: 		}
L_interrupcion40:
;gprs_clase.c,231 :: 		break;
	GOTO        L_interrupcion35
;gprs_clase.c,233 :: 		case cap_u:
L_interrupcion41:
;gprs_clase.c,234 :: 		trama_rx[trama_cont]=dato_rx;
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
;gprs_clase.c,235 :: 		if (dato_rx!='u')
	MOVF        _dato_rx+0, 0 
	XORLW       117
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion42
;gprs_clase.c,237 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;gprs_clase.c,238 :: 		estado_rec=cap_l; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;gprs_clase.c,239 :: 		}
	GOTO        L_interrupcion43
L_interrupcion42:
;gprs_clase.c,242 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;gprs_clase.c,243 :: 		estado_rec=cap_e; //pasa al estado de capturar la u
	MOVLW       3
	MOVWF       _estado_rec+0 
;gprs_clase.c,244 :: 		}
L_interrupcion43:
;gprs_clase.c,245 :: 		break;
	GOTO        L_interrupcion35
;gprs_clase.c,247 :: 		case cap_e:
L_interrupcion44:
;gprs_clase.c,248 :: 		trama_rx[trama_cont]=dato_rx;
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
;gprs_clase.c,249 :: 		if (dato_rx!='e')
	MOVF        _dato_rx+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion45
;gprs_clase.c,251 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;gprs_clase.c,252 :: 		estado_rec=cap_l; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;gprs_clase.c,253 :: 		}
	GOTO        L_interrupcion46
L_interrupcion45:
;gprs_clase.c,256 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;gprs_clase.c,257 :: 		estado_rec=cap_co; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec+0 
;gprs_clase.c,258 :: 		}
L_interrupcion46:
;gprs_clase.c,259 :: 		break;
	GOTO        L_interrupcion35
;gprs_clase.c,261 :: 		case cap_co:
L_interrupcion47:
;gprs_clase.c,262 :: 		trama_rx[trama_cont]=dato_rx;
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
;gprs_clase.c,263 :: 		if (dato_rx!='\"')
	MOVF        _dato_rx+0, 0 
	XORLW       34
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion48
;gprs_clase.c,265 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;gprs_clase.c,266 :: 		estado_rec=cap_l; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;gprs_clase.c,267 :: 		}
	GOTO        L_interrupcion49
L_interrupcion48:
;gprs_clase.c,270 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;gprs_clase.c,271 :: 		estado_rec=esp_final; //pasa al estado de capturar la u
	MOVLW       5
	MOVWF       _estado_rec+0 
;gprs_clase.c,272 :: 		}
L_interrupcion49:
;gprs_clase.c,273 :: 		break;
	GOTO        L_interrupcion35
;gprs_clase.c,275 :: 		case esp_final:
L_interrupcion50:
;gprs_clase.c,276 :: 		trama_rx[trama_cont]=dato_rx;
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
;gprs_clase.c,277 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;gprs_clase.c,279 :: 		if (dato_rx==',')
	MOVF        _dato_rx+0, 0 
	XORLW       44
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion51
;gprs_clase.c,281 :: 		RCIE_bit=0; //desactiva interrupcion serial
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,282 :: 		trama_cont=0;//limpia contador de trama
	CLRF        _trama_cont+0 
;gprs_clase.c,283 :: 		estado_rec=normal;// para que pase al estado de recepcion normal a la proxima
	CLRF        _estado_rec+0 
;gprs_clase.c,284 :: 		flag_ubi=1; //activa la bandera de que tiene un dato valido de ubidots
	MOVLW       1
	MOVWF       _flag_ubi+0 
;gprs_clase.c,285 :: 		}
L_interrupcion51:
;gprs_clase.c,287 :: 		break;
	GOTO        L_interrupcion35
;gprs_clase.c,289 :: 		}//fin del switch
L_interrupcion34:
	MOVF        _estado_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion36
	MOVF        _estado_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion38
	MOVF        _estado_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion41
	MOVF        _estado_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion44
	MOVF        _estado_rec+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion47
	MOVF        _estado_rec+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion50
L_interrupcion35:
;gprs_clase.c,291 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,292 :: 		}
L_interrupcion33:
;gprs_clase.c,297 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupcion52
;gprs_clase.c,299 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;gprs_clase.c,300 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;gprs_clase.c,302 :: 		timer_cont++;
	INFSNZ      _timer_cont+0, 1 
	INCF        _timer_cont+1, 1 
;gprs_clase.c,304 :: 		if (timer_cont>=espera)
	MOVLW       0
	SUBWF       _timer_cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupcion145
	MOVF        _espera+0, 0 
	SUBWF       _timer_cont+0, 0 
L__interrupcion145:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion53
;gprs_clase.c,306 :: 		Soft_UART_Break();    // le dice que salga en caso que este leyendo datos seriales por software
	CALL        _Soft_UART_Break+0, 0
;gprs_clase.c,307 :: 		timer_cont=0;
	CLRF        _timer_cont+0 
	CLRF        _timer_cont+1 
;gprs_clase.c,308 :: 		TMR0IE_bit=0; // DESHABILITA LA INTERRPCION
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,309 :: 		flag_timer=1;// habilita bandera que se cumplió el tiempo
	MOVLW       1
	MOVWF       _flag_timer+0 
	MOVLW       0
	MOVWF       _flag_timer+1 
;gprs_clase.c,310 :: 		}
L_interrupcion53:
;gprs_clase.c,311 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,312 :: 		}
L_interrupcion52:
;gprs_clase.c,315 :: 		}
L_end_interrupcion:
L__interrupcion144:
	RETFIE      1
; end of _interrupcion

_config_gprs:

;gprs_clase.c,319 :: 		void config_gprs()
;gprs_clase.c,322 :: 		hoy : // etiquete de reinico en caso que un comando falle
___config_gprs_hoy:
;gprs_clase.c,325 :: 		manda_AT_COMANDO("AT+CIPSHUT","OK", "ERROR", 2000);
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
;gprs_clase.c,328 :: 		tempo=manda_AT_COMANDO("AT+CIPMUX=0", "OK", "ERROR", 4000);
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
;gprs_clase.c,329 :: 		if (tempo!=1)  goto hoy; // Va al inicio hasta que logre inicializar
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs54
	GOTO        ___config_gprs_hoy
L_config_gprs54:
;gprs_clase.c,332 :: 		tempo=manda_AT_COMANDO("AT+CIPSTATUS", "IP INITIAL", "ERROR", 500);
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
;gprs_clase.c,333 :: 		if (tempo!=1)  goto hoy; // Va al inicio hasta que este en estado de ip inial
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs55
	GOTO        ___config_gprs_hoy
L_config_gprs55:
;gprs_clase.c,337 :: 		tempo=manda_AT_COMANDO("AT+CSTT=\"lte.avantel.com.co\",\"\",\"\"", "OK",  "ERROR", 30000);
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
;gprs_clase.c,338 :: 		if (tempo!=1)  goto hoy; // SINO SE CONECTA A LA RED REINCIA LA CONEXIÓN
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs56
	GOTO        ___config_gprs_hoy
L_config_gprs56:
;gprs_clase.c,341 :: 		manda_AT_COMANDO("AT+CGQMIN= 1,0,0,0,0,0", "OK", "OK", 500);
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
;gprs_clase.c,342 :: 		manda_AT_COMANDO("AT+CGQREQ= 1,0,0,3,0,0", "OK", "OK", 500);
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
;gprs_clase.c,345 :: 		manda_AT_COMANDO("AT+CMGF=1", "OK", "OK", 500);
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
;gprs_clase.c,348 :: 		manda_AT_COMANDO("AT+CNMI=1,1,2,1,0", "OK", "OK", 500);
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
;gprs_clase.c,351 :: 		while(manda_AT_COMANDO("AT+CIPSTATUS", "START", "ERROR", 3000)  == 0 );
L_config_gprs57:
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
	GOTO        L_config_gprs58
	GOTO        L_config_gprs57
L_config_gprs58:
;gprs_clase.c,352 :: 		Delay_ms(2000);// RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_config_gprs59:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs59
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs59
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs59
	NOP
	NOP
;gprs_clase.c,355 :: 		tempo=manda_AT_COMANDO("AT+CIICR", "OK",  "ERROR", 30000);
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
;gprs_clase.c,356 :: 		if (tempo!=1)  goto hoy;
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs60
	GOTO        ___config_gprs_hoy
L_config_gprs60:
;gprs_clase.c,358 :: 		while (tempo=manda_AT_COMANDO("AT+CIPSTATUS", "GPRSACT", "ERROR", 6000)==0);
L_config_gprs61:
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
	GOTO        L_config_gprs62
	GOTO        L_config_gprs61
L_config_gprs62:
;gprs_clase.c,359 :: 		Delay_ms(2000);   // RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_config_gprs63:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs63
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs63
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs63
	NOP
	NOP
;gprs_clase.c,362 :: 		tempo=manda_AT_COMANDO("AT+CIFSR", ".", "ERROR", 10000);
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
;gprs_clase.c,363 :: 		if (tempo!=1)  goto hoy;// sino no hya ip reinica el proceso
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_config_gprs64
	GOTO        ___config_gprs_hoy
L_config_gprs64:
;gprs_clase.c,364 :: 		Delay_ms(3000);
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
	MOVWF       R13, 0
L_config_gprs65:
	DECFSZ      R13, 1, 1
	BRA         L_config_gprs65
	DECFSZ      R12, 1, 1
	BRA         L_config_gprs65
	DECFSZ      R11, 1, 1
	BRA         L_config_gprs65
	NOP
	NOP
;gprs_clase.c,365 :: 		}
L_end_config_gprs:
	RETURN      0
; end of _config_gprs

_conecta:

;gprs_clase.c,370 :: 		unsigned char conecta()
;gprs_clase.c,372 :: 		tempo=manda_AT_COMANDO("AT+CIPSTART="  "\"TCP\""   ","   "\"things.ubidots.com\""  ","  "\"80\"", "CONNECT OK", "ALREADY CONNECT", 10000);
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
;gprs_clase.c,374 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_conecta66:
	DECFSZ      R13, 1, 1
	BRA         L_conecta66
	DECFSZ      R12, 1, 1
	BRA         L_conecta66
	DECFSZ      R11, 1, 1
	BRA         L_conecta66
	NOP
	NOP
;gprs_clase.c,375 :: 		if ((tempo==1) ||(tempo==2)) return(1);
	MOVF        _tempo+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta127
	MOVF        _tempo+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta127
	GOTO        L_conecta69
L__conecta127:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conecta
L_conecta69:
;gprs_clase.c,376 :: 		else return(0);
	CLRF        R0 
;gprs_clase.c,379 :: 		}
L_end_conecta:
	RETURN      0
; end of _conecta

_conectar:

;gprs_clase.c,382 :: 		unsigned char conectar()
;gprs_clase.c,385 :: 		if (conecta()==1)
	CALL        _conecta+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_conectar71
;gprs_clase.c,388 :: 		tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",5000);
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
;gprs_clase.c,389 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_conectar72:
	DECFSZ      R13, 1, 1
	BRA         L_conectar72
	DECFSZ      R12, 1, 1
	BRA         L_conectar72
	DECFSZ      R11, 1, 1
	BRA         L_conectar72
	NOP
;gprs_clase.c,391 :: 		memset(trama_tx,0,100);//limpia la trama de tranmision
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
;gprs_clase.c,393 :: 		sprintf(trama_tx,"{\"led\": %1d,\"temperatura\": %5.2f,\"gps\":{\"lat\":%11.7f, \"lng\":%12.7f}}",(unsigned int)led_ubidot,temperatura,latitud,longitud);
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
;gprs_clase.c,394 :: 		largo=strlen(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       _largo+0 
;gprs_clase.c,396 :: 		sprintf(largo_str,"%u\n\n",largo);
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
;gprs_clase.c,397 :: 		Uart1_write_text_const("POST /api/v1.6/devices/pruebas/?token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
	MOVLW       ?lstr_52_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_52_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_52_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,398 :: 		UART1_Write_Text(largo_str);
	MOVLW       _largo_str+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_largo_str+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,399 :: 		Uart1_write_text(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,403 :: 		Delay_ms(4000);// retardo de envio
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_conectar73:
	DECFSZ      R13, 1, 1
	BRA         L_conectar73
	DECFSZ      R12, 1, 1
	BRA         L_conectar73
	DECFSZ      R11, 1, 1
	BRA         L_conectar73
;gprs_clase.c,404 :: 		tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",4000);// comando de fin de envio
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
;gprs_clase.c,405 :: 		Delay_ms(5000);       //   retardo para evitar conflcitos con la respuesta de ubidots
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_conectar74:
	DECFSZ      R13, 1, 1
	BRA         L_conectar74
	DECFSZ      R12, 1, 1
	BRA         L_conectar74
	DECFSZ      R11, 1, 1
	BRA         L_conectar74
	DECFSZ      R10, 1, 1
	BRA         L_conectar74
;gprs_clase.c,409 :: 		tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",6000);
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
	MOVLW       112
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       23
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,410 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_conectar75:
	DECFSZ      R13, 1, 1
	BRA         L_conectar75
	DECFSZ      R12, 1, 1
	BRA         L_conectar75
	DECFSZ      R11, 1, 1
	BRA         L_conectar75
	NOP
;gprs_clase.c,412 :: 		Uart1_write_text_const("GET /api/v1.6/devices/pruebas/suiche/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_59_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_59_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_59_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,413 :: 		Delay_ms(4000);// retardo de envio
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_conectar76:
	DECFSZ      R13, 1, 1
	BRA         L_conectar76
	DECFSZ      R12, 1, 1
	BRA         L_conectar76
	DECFSZ      R11, 1, 1
	BRA         L_conectar76
;gprs_clase.c,414 :: 		tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",6000);// comando de fin de envio
	MOVLW       ?lstr60_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr60_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr61_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr61_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr62_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr62_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       112
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       23
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,417 :: 		tempo=tiempo_rec(6000); // espera un tiempo o hasta que tenga una respeusta valida
	MOVLW       112
	MOVWF       FARG_tiempo_rec_milis+0 
	MOVLW       23
	MOVWF       FARG_tiempo_rec_milis+1 
	CALL        _tiempo_rec+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,419 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr63_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr63_gprs_clase+0)
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
;gprs_clase.c,420 :: 		strcpy(captu, strtok(0, ","));  //captura hasta el /
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
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,422 :: 		suiche_ubi=atof(captu);
	MOVLW       _captu+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _suiche_ubi+0 
	MOVF        R1, 0 
	MOVWF       _suiche_ubi+1 
;gprs_clase.c,424 :: 		tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",6000);
	MOVLW       ?lstr65_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr65_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr66_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr66_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr67_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr67_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       112
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       23
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,425 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_conectar77:
	DECFSZ      R13, 1, 1
	BRA         L_conectar77
	DECFSZ      R12, 1, 1
	BRA         L_conectar77
	DECFSZ      R11, 1, 1
	BRA         L_conectar77
	NOP
;gprs_clase.c,427 :: 		Uart1_write_text_const("GET /api/v1.6/devices/pruebas/pwm/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_68_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_68_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_68_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,428 :: 		Delay_ms(4000);// retardo de envio
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_conectar78:
	DECFSZ      R13, 1, 1
	BRA         L_conectar78
	DECFSZ      R12, 1, 1
	BRA         L_conectar78
	DECFSZ      R11, 1, 1
	BRA         L_conectar78
;gprs_clase.c,429 :: 		tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",6000);// comando de fin de envio
	MOVLW       ?lstr69_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr69_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr70_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr70_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr71_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr71_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       112
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       23
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,432 :: 		tempo=tiempo_rec(6000); // espera un tiempo o hasta que tenga una respeusta valida
	MOVLW       112
	MOVWF       FARG_tiempo_rec_milis+0 
	MOVLW       23
	MOVWF       FARG_tiempo_rec_milis+1 
	CALL        _tiempo_rec+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,434 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr72_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr72_gprs_clase+0)
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
;gprs_clase.c,435 :: 		strcpy(captu, strtok(0, ","));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr73_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr73_gprs_clase+0)
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
;gprs_clase.c,437 :: 		pwm_ubi=atof(captu);
	MOVLW       _captu+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _pwm_ubi+0 
	MOVF        R1, 0 
	MOVWF       _pwm_ubi+1 
;gprs_clase.c,439 :: 		Delay_us(4000);
	MOVLW       63
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_conectar79:
	DECFSZ      R13, 1, 1
	BRA         L_conectar79
	DECFSZ      R12, 1, 1
	BRA         L_conectar79
;gprs_clase.c,441 :: 		tempo=manda_AT_COMANDO("AT+CIPCLOSE", "CLOSE OK", "ERROR",4000);// comando de fin de envio// CIERRA EL SOCKET
	MOVLW       ?lstr74_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr74_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr75_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr75_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr76_gprs_clase+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr76_gprs_clase+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       160
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       15
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;gprs_clase.c,442 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar80:
	DECFSZ      R13, 1, 1
	BRA         L_conectar80
	DECFSZ      R12, 1, 1
	BRA         L_conectar80
	DECFSZ      R11, 1, 1
	BRA         L_conectar80
	NOP
	NOP
;gprs_clase.c,445 :: 		sprintf(texto,"sw=%1d  pwm=%3d\r\n",suiche_ubi,pwm_ubi);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_77_gprs_clase+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_77_gprs_clase+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_77_gprs_clase+0)
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
;gprs_clase.c,446 :: 		UART1_Write_Text(texto);    // debe quitarse despues
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;gprs_clase.c,447 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar81:
	DECFSZ      R13, 1, 1
	BRA         L_conectar81
	DECFSZ      R12, 1, 1
	BRA         L_conectar81
	DECFSZ      R11, 1, 1
	BRA         L_conectar81
	NOP
	NOP
;gprs_clase.c,448 :: 		if (tempo!=1) return(2);// anlizando estos codigos da más robuztez el programa
	MOVF        _tempo+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_conectar82
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_conectar
L_conectar82:
;gprs_clase.c,449 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conectar
;gprs_clase.c,450 :: 		}  // si se conector
L_conectar71:
;gprs_clase.c,451 :: 		else return(0);
	CLRF        R0 
;gprs_clase.c,452 :: 		}
L_end_conectar:
	RETURN      0
; end of _conectar

_timer_enable:

;gprs_clase.c,455 :: 		void timer_enable(char tiempo)
;gprs_clase.c,457 :: 		espera=tiempo;
	MOVF        FARG_timer_enable_tiempo+0, 0 
	MOVWF       _espera+0 
;gprs_clase.c,458 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;gprs_clase.c,459 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;gprs_clase.c,460 :: 		TMR0ON_bit=1;// prende el timer
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;gprs_clase.c,461 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,462 :: 		TMR0IE_bit=1;// habilita la interrpcion
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,464 :: 		}
L_end_timer_enable:
	RETURN      0
; end of _timer_enable

_lee_trama_soft:

;gprs_clase.c,465 :: 		char lee_trama_soft()   //funcion que retorna 1 si hay dato sino 0    en el GPS
;gprs_clase.c,471 :: 		memset(trama_GPS,100,0);
	MOVLW       _trama_GPS+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       100
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;gprs_clase.c,472 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,473 :: 		estado_rec_GPS=cap_P;
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,474 :: 		flag_timer=0;
	CLRF        _flag_timer+0 
	CLRF        _flag_timer+1 
;gprs_clase.c,475 :: 		timer_enable(4);
	MOVLW       4
	MOVWF       FARG_timer_enable_tiempo+0 
	CALL        _timer_enable+0, 0
;gprs_clase.c,477 :: 		while (flag_timer==0)
L_lee_trama_soft84:
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft151
	MOVLW       0
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft151:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft85
;gprs_clase.c,479 :: 		switch (estado_rec_GPS)
	GOTO        L_lee_trama_soft86
;gprs_clase.c,481 :: 		case cap_P:
L_lee_trama_soft88:
;gprs_clase.c,482 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,483 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft152
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft152:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft89
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft89:
;gprs_clase.c,484 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
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
;gprs_clase.c,485 :: 		if (dato_rx_GPS!='P') trama_cont_GPS=0;    //no fue el dato que me interesa
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft90
	CLRF        _trama_cont_GPS+0 
	GOTO        L_lee_trama_soft91
L_lee_trama_soft90:
;gprs_clase.c,488 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,489 :: 		estado_rec_GPS=cap_G; //pasa al estado de capturar la g
	MOVLW       1
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,490 :: 		}
L_lee_trama_soft91:
;gprs_clase.c,492 :: 		break;
	GOTO        L_lee_trama_soft87
;gprs_clase.c,494 :: 		case cap_G:
L_lee_trama_soft92:
;gprs_clase.c,495 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,496 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft153
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft153:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft93
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft93:
;gprs_clase.c,497 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
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
;gprs_clase.c,498 :: 		if (dato_rx_GPS!='G')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft94
;gprs_clase.c,500 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,501 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,502 :: 		}
	GOTO        L_lee_trama_soft95
L_lee_trama_soft94:
;gprs_clase.c,505 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,506 :: 		estado_rec_GPS=cap_G2; //pasa al estado de capturar la g
	MOVLW       2
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,507 :: 		}
L_lee_trama_soft95:
;gprs_clase.c,510 :: 		break;
	GOTO        L_lee_trama_soft87
;gprs_clase.c,513 :: 		case cap_G2:
L_lee_trama_soft96:
;gprs_clase.c,514 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,515 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft154
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft154:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft97
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft97:
;gprs_clase.c,516 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
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
;gprs_clase.c,517 :: 		if (dato_rx_GPS!='G')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft98
;gprs_clase.c,519 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,520 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,521 :: 		}
	GOTO        L_lee_trama_soft99
L_lee_trama_soft98:
;gprs_clase.c,524 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,525 :: 		estado_rec_GPS=cap_A; //pasa al estado de capturar la a
	MOVLW       3
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,526 :: 		}
L_lee_trama_soft99:
;gprs_clase.c,528 :: 		break;
	GOTO        L_lee_trama_soft87
;gprs_clase.c,531 :: 		case cap_A:
L_lee_trama_soft100:
;gprs_clase.c,533 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,534 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft155
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft155:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft101
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft101:
;gprs_clase.c,535 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
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
;gprs_clase.c,536 :: 		if (dato_rx_GPS!='A')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft102
;gprs_clase.c,538 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;gprs_clase.c,539 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,541 :: 		}
	GOTO        L_lee_trama_soft103
L_lee_trama_soft102:
;gprs_clase.c,544 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,545 :: 		estado_rec_GPS=esp_final_GPS; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec_GPS+0 
;gprs_clase.c,546 :: 		}
L_lee_trama_soft103:
;gprs_clase.c,549 :: 		break;
	GOTO        L_lee_trama_soft87
;gprs_clase.c,551 :: 		case esp_final_GPS:
L_lee_trama_soft104:
;gprs_clase.c,552 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;gprs_clase.c,553 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft156
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft156:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft105
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft105:
;gprs_clase.c,554 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
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
;gprs_clase.c,555 :: 		trama_cont_GPS++;
	INCF        _trama_cont_GPS+0, 1 
;gprs_clase.c,556 :: 		if (trama_cont_GPS>=100) trama_cont_GPS=0;// si supera el buffer
	MOVLW       100
	SUBWF       _trama_cont_GPS+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_lee_trama_soft106
	CLRF        _trama_cont_GPS+0 
L_lee_trama_soft106:
;gprs_clase.c,557 :: 		if (dato_rx_GPS=='*')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft107
;gprs_clase.c,559 :: 		estado_rec_GPS=cap_P;
	CLRF        _estado_rec_GPS+0 
;gprs_clase.c,560 :: 		timer_cont=0;
	CLRF        _timer_cont+0 
	CLRF        _timer_cont+1 
;gprs_clase.c,561 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,562 :: 		TMR0IE_bit=0;
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,563 :: 		flag_timer=0;
	CLRF        _flag_timer+0 
	CLRF        _flag_timer+1 
;gprs_clase.c,564 :: 		return(1); //sale del procedimiento
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_trama_soft
;gprs_clase.c,565 :: 		}
L_lee_trama_soft107:
;gprs_clase.c,567 :: 		break;
	GOTO        L_lee_trama_soft87
;gprs_clase.c,570 :: 		}//fin del switch
L_lee_trama_soft86:
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft88
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft92
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft96
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft100
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft104
L_lee_trama_soft87:
;gprs_clase.c,571 :: 		} //fin del while
	GOTO        L_lee_trama_soft84
L_lee_trama_soft85:
;gprs_clase.c,572 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,574 :: 		}
L_end_lee_trama_soft:
	RETURN      0
; end of _lee_trama_soft

_lee_cordenadas:

;gprs_clase.c,578 :: 		unsigned char lee_cordenadas()
;gprs_clase.c,582 :: 		RCIE_bit=0;  /// deshabilita int serial
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,583 :: 		if (lee_trama_soft()==1)
	CALL        _lee_trama_soft+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas108
;gprs_clase.c,587 :: 		memset (trama_GPS1,0,100);
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
;gprs_clase.c,588 :: 		memset (captu_GPS,0,30);
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
;gprs_clase.c,590 :: 		strcpy(trama_GPS1,trama_GPS);//almacena en otro buffer  poruqe primero debe ller el fix y luego si los datos
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _trama_GPS+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;gprs_clase.c,592 :: 		strcpy(captu_GPS, strtok(trama_GPS, ","));  //captura 1 coma
	MOVLW       _trama_GPS+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr78_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr78_gprs_clase+0)
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
;gprs_clase.c,593 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr79_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr79_gprs_clase+0)
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
;gprs_clase.c,594 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr80_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr80_gprs_clase+0)
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
;gprs_clase.c,595 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr81_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr81_gprs_clase+0)
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
;gprs_clase.c,596 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr82_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr82_gprs_clase+0)
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
;gprs_clase.c,597 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr83_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr83_gprs_clase+0)
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
;gprs_clase.c,598 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr84_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr84_gprs_clase+0)
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
;gprs_clase.c,600 :: 		fix=atoi(captu_GPS);
	MOVLW       _captu_GPS+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _fix+0 
	MOVF        R1, 0 
	MOVWF       _fix+1 
;gprs_clase.c,601 :: 		if ((fix==1) ||(fix==2) )// solo si ya tiene un dato valido
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_cordenadas158
	MOVLW       1
	XORWF       R0, 0 
L__lee_cordenadas158:
	BTFSC       STATUS+0, 2 
	GOTO        L__lee_cordenadas128
	MOVLW       0
	XORWF       _fix+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_cordenadas159
	MOVLW       2
	XORWF       _fix+0, 0 
L__lee_cordenadas159:
	BTFSC       STATUS+0, 2 
	GOTO        L__lee_cordenadas128
	GOTO        L_lee_cordenadas111
L__lee_cordenadas128:
;gprs_clase.c,604 :: 		strcpy(captu_GPS, strtok(trama_GPS1, ","));  //captura 1 coma
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr85_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr85_gprs_clase+0)
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
;gprs_clase.c,605 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr86_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr86_gprs_clase+0)
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
;gprs_clase.c,606 :: 		strcpy(captu_GPS, strtok(0, ",")); //captura latitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr87_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr87_gprs_clase+0)
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
;gprs_clase.c,607 :: 		memset(c_grados,0,10);//limpía los grados
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
;gprs_clase.c,608 :: 		strncpy(c_grados,captu_GPS,2);//captura los grados
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
;gprs_clase.c,609 :: 		grados=atof(c_grados);
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
;gprs_clase.c,611 :: 		minutos=atof(&captu_GPS[2])/60.0;  //lo pasa a grados
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
;gprs_clase.c,612 :: 		latitud=grados+minutos;
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
;gprs_clase.c,613 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr88_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr88_gprs_clase+0)
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
;gprs_clase.c,614 :: 		if (captu_GPS[0]=='S') latitud=-latitud;
	MOVF        _captu_GPS+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas112
	BTG         _latitud+2, 7 
L_lee_cordenadas112:
;gprs_clase.c,617 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma la longitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr89_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr89_gprs_clase+0)
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
;gprs_clase.c,618 :: 		memset(c_grados,0,10);//limpía los grados
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
;gprs_clase.c,619 :: 		strncpy(c_grados,captu_GPS,3);//captura los grados  3 posiciones
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
;gprs_clase.c,620 :: 		grados=atof(c_grados);
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
;gprs_clase.c,622 :: 		minutos=atof(&captu_GPS[3])/60.0;  //lo pasa a grados
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
;gprs_clase.c,623 :: 		longitud=grados+minutos;
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
;gprs_clase.c,624 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr90_gprs_clase+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr90_gprs_clase+0)
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
;gprs_clase.c,625 :: 		if (captu_GPS[0]=='W') longitud=-longitud;
	MOVF        _captu_GPS+0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas113
	BTG         _longitud+2, 7 
L_lee_cordenadas113:
;gprs_clase.c,626 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,627 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,628 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,629 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,630 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_cordenadas
;gprs_clase.c,631 :: 		}// si es valida la trama
L_lee_cordenadas111:
;gprs_clase.c,634 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,635 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,636 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,637 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,638 :: 		return(0);
	CLRF        R0 
	GOTO        L_end_lee_cordenadas
;gprs_clase.c,641 :: 		}
L_lee_cordenadas108:
;gprs_clase.c,642 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,643 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;gprs_clase.c,644 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,645 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,646 :: 		return(0);
	CLRF        R0 
;gprs_clase.c,647 :: 		}
L_end_lee_cordenadas:
	RETURN      0
; end of _lee_cordenadas

_manda_mensaje:

;gprs_clase.c,649 :: 		void manda_mensaje()
;gprs_clase.c,651 :: 		Uart1_write_text_const("AT+CMGF=1\r\n");
	MOVLW       ?lstr_91_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_91_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_91_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,652 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_manda_mensaje115:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje115
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje115
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje115
	NOP
	NOP
;gprs_clase.c,653 :: 		Uart1_write_text_const("AT+CMGS=" "\"3205481022\"\r\n");// colocar el  numero deseado
	MOVLW       ?lstr_92_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_92_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_92_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,654 :: 		Delay_ms(3000);
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
	MOVWF       R13, 0
L_manda_mensaje116:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje116
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje116
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje116
	NOP
	NOP
;gprs_clase.c,655 :: 		Uart1_write_text_const("ALERTA\r\n");// mensaje a enviar
	MOVLW       ?lstr_93_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_93_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_93_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,656 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_manda_mensaje117:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje117
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje117
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje117
	NOP
	NOP
;gprs_clase.c,657 :: 		Uart1_write_text_const("\x1A\r\n");
	MOVLW       ?lstr_94_gprs_clase+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_94_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_94_gprs_clase+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;gprs_clase.c,658 :: 		Delay_ms(3000);
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
	MOVWF       R13, 0
L_manda_mensaje118:
	DECFSZ      R13, 1, 1
	BRA         L_manda_mensaje118
	DECFSZ      R12, 1, 1
	BRA         L_manda_mensaje118
	DECFSZ      R11, 1, 1
	BRA         L_manda_mensaje118
	NOP
	NOP
;gprs_clase.c,659 :: 		}
L_end_manda_mensaje:
	RETURN      0
; end of _manda_mensaje

_main:

;gprs_clase.c,663 :: 		void main()
;gprs_clase.c,665 :: 		ADCON1=0B1111; // TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;gprs_clase.c,666 :: 		TRISB=0;
	CLRF        TRISB+0 
;gprs_clase.c,667 :: 		TRISC=0;
	CLRF        TRISC+0 
;gprs_clase.c,668 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;gprs_clase.c,670 :: 		UART1_Init(9600); // velocidad del modulo sim800
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;gprs_clase.c,671 :: 		pin_on=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;gprs_clase.c,673 :: 		INTCON=0b01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;gprs_clase.c,675 :: 		Soft_UART_Init(&PORTB, 2, 1, 9600, 0);  // inicializa un puerto por software
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
;gprs_clase.c,678 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;gprs_clase.c,679 :: 		RCIE_bit=0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;gprs_clase.c,681 :: 		LATB=0;
	CLRF        LATB+0 
;gprs_clase.c,685 :: 		T0CON=0;//LIMPIA REGISTRO DEL TIMER CERO
	CLRF        T0CON+0 
;gprs_clase.c,686 :: 		TMR0ON_bit=0; // lo mantiene apagado
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;gprs_clase.c,687 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;gprs_clase.c,688 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;gprs_clase.c,690 :: 		T0PS2_bit=1;
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;gprs_clase.c,691 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;gprs_clase.c,692 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;gprs_clase.c,694 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;gprs_clase.c,695 :: 		TMR0IE_bit=0;// deshabilita la interrpcion
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;gprs_clase.c,698 :: 		GIE_bit=1;// HABILITA INTERPCIONES GLOBALES
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;gprs_clase.c,701 :: 		RCEN_bit=0;
	BCF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;gprs_clase.c,702 :: 		RCEN_bit=1;
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;gprs_clase.c,704 :: 		cuenta_on=0;
	CLRF        _cuenta_on+0 
;gprs_clase.c,705 :: 		while ((prendio()==0) || (cuenta_on>=10)) cuenta_on++;  // intenta prender el modulo usando 10 intentos
L_main119:
	CALL        _prendio+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__main129
	MOVLW       10
	SUBWF       _cuenta_on+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__main129
	GOTO        L_main120
L__main129:
	INCF        _cuenta_on+0, 1 
	GOTO        L_main119
L_main120:
;gprs_clase.c,706 :: 		config_gprs();
	CALL        _config_gprs+0, 0
;gprs_clase.c,707 :: 		led_ubidot=1;
	MOVLW       1
	MOVWF       _led_ubidot+0 
;gprs_clase.c,708 :: 		temperatura=25.63;
	MOVLW       61
	MOVWF       _temperatura+0 
	MOVLW       10
	MOVWF       _temperatura+1 
	MOVLW       77
	MOVWF       _temperatura+2 
	MOVLW       131
	MOVWF       _temperatura+3 
;gprs_clase.c,709 :: 		latitud=10.3997200;
	MOVLW       65
	MOVWF       _latitud+0 
	MOVLW       101
	MOVWF       _latitud+1 
	MOVLW       38
	MOVWF       _latitud+2 
	MOVLW       130
	MOVWF       _latitud+3 
;gprs_clase.c,710 :: 		longitud=-75.4920880;
	MOVLW       243
	MOVWF       _longitud+0 
	MOVLW       251
	MOVWF       _longitud+1 
	MOVLW       150
	MOVWF       _longitud+2 
	MOVLW       133
	MOVWF       _longitud+3 
;gprs_clase.c,712 :: 		while (1)
L_main123:
;gprs_clase.c,714 :: 		if (lee_cordenadas()==1) conectar();
	CALL        _lee_cordenadas+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main125
	CALL        _conectar+0, 0
L_main125:
;gprs_clase.c,715 :: 		Delay_ms(5000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_main126:
	DECFSZ      R13, 1, 1
	BRA         L_main126
	DECFSZ      R12, 1, 1
	BRA         L_main126
	DECFSZ      R11, 1, 1
	BRA         L_main126
	DECFSZ      R10, 1, 1
	BRA         L_main126
;gprs_clase.c,717 :: 		}
	GOTO        L_main123
;gprs_clase.c,720 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
