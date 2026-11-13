
_procesarx:

;crucefinal.c,22 :: 		void procesarx()
;crucefinal.c,24 :: 		if (strstr(trama_rx,"led1="))
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1_crucefinal+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1_crucefinal+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx0
;crucefinal.c,26 :: 		if (strstr(trama_rx,"on")) led=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr2_crucefinal+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr2_crucefinal+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx1
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
	GOTO        L_procesarx2
L_procesarx1:
;crucefinal.c,27 :: 		else led=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
L_procesarx2:
;crucefinal.c,28 :: 		}
	GOTO        L_procesarx3
L_procesarx0:
;crucefinal.c,30 :: 		else if (strstr(trama_rx,"pul="))
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr3_crucefinal+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr3_crucefinal+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx4
;crucefinal.c,32 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr4_crucefinal+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr4_crucefinal+0)
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
;crucefinal.c,33 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr5_crucefinal+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr5_crucefinal+0)
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
;crucefinal.c,35 :: 		dispara=atoi(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _dispara+0 
;crucefinal.c,37 :: 		}
L_procesarx4:
L_procesarx3:
;crucefinal.c,40 :: 		}
L_end_procesarx:
	RETURN      0
; end of _procesarx

_interrupcion:

;crucefinal.c,42 :: 		void interrupcion() iv 0x0008 ics ICS_AUTO
;crucefinal.c,45 :: 		if (INT0IF_bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupcion5
;crucefinal.c,47 :: 		pulso=0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;crucefinal.c,48 :: 		TMR0L=calculo;  //carga el tiempo a temporizar en el timer 0
	MOVF        _calculo+0, 0 
	MOVWF       R0 
	MOVF        _calculo+1, 0 
	MOVWF       R1 
	MOVF        _calculo+2, 0 
	MOVWF       R2 
	MOVF        _calculo+3, 0 
	MOVWF       R3 
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       TMR0L+0 
;crucefinal.c,49 :: 		TMR0IF_bit=0;//limpia bandera timer 0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;crucefinal.c,50 :: 		TMR0IE_bit=1;// activa interrpcion de timer cero
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;crucefinal.c,52 :: 		INT0IF_bit=0; //limpia la bandera
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;crucefinal.c,53 :: 		}
L_interrupcion5:
;crucefinal.c,55 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion6
;crucefinal.c,57 :: 		datorx=UART1_Read();  //lee el dato
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datorx+0 
;crucefinal.c,58 :: 		trama_rx[puntero]=datorx; //lo almacena en la trama
	MOVLW       _trama_rx+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1H 
	MOVF        _puntero+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;crucefinal.c,59 :: 		puntero++; //incrementa el contador de trama
	INCF        _puntero+0, 1 
;crucefinal.c,60 :: 		if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
	MOVLW       30
	SUBWF       _puntero+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion7
	CLRF        _puntero+0 
L_interrupcion7:
;crucefinal.c,61 :: 		if (datorx=='*')  //Si llega el fin de la trama
	MOVF        _datorx+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion8
;crucefinal.c,63 :: 		RCIE_bit=0; //deshabilita la interrucion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;crucefinal.c,64 :: 		flag_rx=1;  //activa la bandera de que hat una trama valida
	MOVLW       1
	MOVWF       _flag_rx+0 
;crucefinal.c,66 :: 		}
L_interrupcion8:
;crucefinal.c,68 :: 		if (OERR_bit==1)
	BTFSS       OERR_bit+0, BitPos(OERR_bit+0) 
	GOTO        L_interrupcion9
;crucefinal.c,70 :: 		RCEN_bit=0;
	BCF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;crucefinal.c,71 :: 		RCEN_bit=1;
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;crucefinal.c,72 :: 		}
L_interrupcion9:
;crucefinal.c,74 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;crucefinal.c,75 :: 		}
L_interrupcion6:
;crucefinal.c,79 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupcion10
;crucefinal.c,82 :: 		pulso=1;
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;crucefinal.c,84 :: 		Delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_interrupcion11:
	DECFSZ      R13, 1, 1
	BRA         L_interrupcion11
	NOP
;crucefinal.c,85 :: 		pulso=0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;crucefinal.c,86 :: 		TMR0IF_bit=0;  //Limpia la bandera del timer cero
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;crucefinal.c,87 :: 		TMR0IE_bit=0;// deshabilita interrpcion de timer cero
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;crucefinal.c,89 :: 		}
L_interrupcion10:
;crucefinal.c,92 :: 		}
L_end_interrupcion:
L__interrupcion24:
	RETFIE      1
; end of _interrupcion

_main:

;crucefinal.c,96 :: 		void main()
;crucefinal.c,98 :: 		ADCON1=0b1110; // an0 analogo
	MOVLW       14
	MOVWF       ADCON1+0 
;crucefinal.c,101 :: 		trisa.b0=1; //entrada del pin analogo
	BSF         TRISA+0, 0 
;crucefinal.c,102 :: 		trisb.b0=1; //entrada cruce por cero
	BSF         TRISB+0, 0 
;crucefinal.c,103 :: 		trisb.b1=1; //entrada pulsador
	BSF         TRISB+0, 1 
;crucefinal.c,105 :: 		trisc.b0=0; //salida led
	BCF         TRISC+0, 0 
;crucefinal.c,106 :: 		trisc.b1=0; //salida pulso de disparo
	BCF         TRISC+0, 1 
;crucefinal.c,111 :: 		TRISC6_bit=0; //Salida Tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;crucefinal.c,112 :: 		TRISC7_bit=1; //Entrada Tx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;crucefinal.c,114 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;crucefinal.c,117 :: 		RCIF_bit=0;//LIMPIA LA BANDERA
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;crucefinal.c,118 :: 		RCIE_bit=1;// HABILITA INTERRPCION SERAL
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;crucefinal.c,122 :: 		INTCON=0B01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;crucefinal.c,123 :: 		INT0IF_bit=0;//LIMPIA BIT DE LA INTERRPCION
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;crucefinal.c,124 :: 		INTEDG0_bit=1; //inTERRPCION INT0 POR FALNCO DE SUBIDA
	BSF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;crucefinal.c,125 :: 		INT0IE_bit=1; //HABILITA LA INTERRUPCION POR CAMBIO DE FLCNO
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;crucefinal.c,131 :: 		TMR0ON_bit=1; // Habilita timer el timer cero
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;crucefinal.c,132 :: 		T08BIT_bit=1;  // trabaja el timer a 8 bits
	BSF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;crucefinal.c,136 :: 		T0IF_bit=0; //bandero en cero
	BCF         T0IF_bit+0, BitPos(T0IF_bit+0) 
;crucefinal.c,137 :: 		T0IE_bit=0; //aun no usa la interrpcion  del timer cero
	BCF         T0IE_bit+0, BitPos(T0IE_bit+0) 
;crucefinal.c,138 :: 		T0CS_bit=0;  //el timer incrementa con el ciclo del reloj
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;crucefinal.c,139 :: 		PSA_bit=0; //el preescalador es asignado al timer 0
	BCF         PSA_bit+0, BitPos(PSA_bit+0) 
;crucefinal.c,142 :: 		T0PS2_bit=1;
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;crucefinal.c,143 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;crucefinal.c,144 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;crucefinal.c,147 :: 		GIE_bit = 1;         // Habilitar todas las interrupciones.
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;crucefinal.c,148 :: 		led=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;crucefinal.c,151 :: 		while (1)
L_main12:
;crucefinal.c,155 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;crucefinal.c,156 :: 		temperatura=500.0*codigo/1023.0; //pasa hasta 100
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
;crucefinal.c,157 :: 		if (flag_rx==1)
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;crucefinal.c,160 :: 		procesarx();  // llama al procedimiento de procesar la trama
	CALL        _procesarx+0, 0
;crucefinal.c,161 :: 		puntero=0; //inicializa el conteo
	CLRF        _puntero+0 
;crucefinal.c,162 :: 		memset(trama_rx,0,30); //limpia la trama
	MOVLW       _trama_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       30
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;crucefinal.c,163 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;crucefinal.c,164 :: 		RCIF_bit=0;    //limpia la bandera de la interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;crucefinal.c,165 :: 		RCIE_bit=1;   //habilita la Interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;crucefinal.c,166 :: 		}
L_main14:
;crucefinal.c,169 :: 		if (dispara<=5)
	MOVF        _dispara+0, 0 
	SUBLW       5
	BTFSS       STATUS+0, 0 
	GOTO        L_main15
;crucefinal.c,172 :: 		INT0IE_bit=0;// DESHABILITA INTERRUPCION POR FLANCO
	BCF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;crucefinal.c,173 :: 		pulso=0;//APAGA LA CARGA
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;crucefinal.c,175 :: 		}
	GOTO        L_main16
L_main15:
;crucefinal.c,176 :: 		else if (dispara>=90)
	MOVLW       90
	SUBWF       _dispara+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main17
;crucefinal.c,180 :: 		INT0IE_bit=0;// DESHABILITA INTERRUPCION POR FLANCO
	BCF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;crucefinal.c,181 :: 		pulso=1;
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;crucefinal.c,184 :: 		}
	GOTO        L_main18
L_main17:
;crucefinal.c,188 :: 		calculo=-1.6266*dispara + 256.1;
	MOVF        _dispara+0, 0 
	MOVWF       R0 
	CALL        _byte2double+0, 0
	MOVLW       110
	MOVWF       R4 
	MOVLW       52
	MOVWF       R5 
	MOVLW       208
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       12
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _calculo+0 
	MOVF        R1, 0 
	MOVWF       _calculo+1 
	MOVF        R2, 0 
	MOVWF       _calculo+2 
	MOVF        R3, 0 
	MOVWF       _calculo+3 
;crucefinal.c,189 :: 		INT0IF_bit=0; //limpia la bandeta de  interrpcion
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;crucefinal.c,190 :: 		INT0IE_bit=1;// HABILITA INTERRUPCION POR FLANCO
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;crucefinal.c,192 :: 		}
L_main18:
L_main16:
;crucefinal.c,194 :: 		sprintf(trama_tx,"temp=%.2f/",temperatura);
	MOVLW       _trama_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_6_crucefinal+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_6_crucefinal+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_6_crucefinal+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;crucefinal.c,195 :: 		UART1_Write_Text(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;crucefinal.c,197 :: 		if (suiche==1) UART1_Write_Text("led=on/");
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main19
	MOVLW       ?lstr7_crucefinal+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_crucefinal+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	GOTO        L_main20
L_main19:
;crucefinal.c,198 :: 		else UART1_Write_Text("led=off/");
	MOVLW       ?lstr8_crucefinal+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_crucefinal+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
L_main20:
;crucefinal.c,200 :: 		Delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
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
;crucefinal.c,203 :: 		}
	GOTO        L_main12
;crucefinal.c,206 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
