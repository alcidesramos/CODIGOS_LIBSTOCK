
_uartrx:

;uartline.c,10 :: 		void uartrx() iv 0x0008 ics ICS_AUTO
;uartline.c,13 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_uartrx0
;uartline.c,16 :: 		flag_rx=1; //avisa que posee datos valodo para procesa
	MOVLW       1
	MOVWF       _flag_rx+0 
;uartline.c,17 :: 		cont_trama=0;
	CLRF        _cont_trama+0 
;uartline.c,18 :: 		RCIE_bit=0;//dehabilita la int serial
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;uartline.c,19 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;uartline.c,20 :: 		TMR0IE_bit=0;//deshabilita la int del timer
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;uartline.c,21 :: 		TMR0ON_bit=0;  //APARA EL TIMER
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;uartline.c,22 :: 		}
L_uartrx0:
;uartline.c,25 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_uartrx1
;uartline.c,27 :: 		dato_rx=RCREG;// Lee dato serial
	MOVF        RCREG+0, 0 
	MOVWF       _dato_rx+0 
;uartline.c,28 :: 		trama_rx[cont_trama]=dato_rx; //va llenando el buffer con lo recibido
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _cont_trama+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;uartline.c,29 :: 		cont_trama++;    //incrementa contado de datos recibidos
	INCF        _cont_trama+0, 1 
;uartline.c,30 :: 		if (cont_trama>=50) cont_trama=0;  //si se llena el buffer lo reinicia
	MOVLW       50
	SUBWF       _cont_trama+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_uartrx2
	CLRF        _cont_trama+0 
L_uartrx2:
;uartline.c,31 :: 		TMR0L=0; //limpia el timer
	CLRF        TMR0L+0 
;uartline.c,32 :: 		TMR0ON_bit=1;//ARRANCA EL TIMER
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;uartline.c,33 :: 		TMR0IE_bit=1; //habilita la int del timer
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;uartline.c,34 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;uartline.c,35 :: 		}
L_uartrx1:
;uartline.c,40 :: 		}
L_end_uartrx:
L__uartrx11:
	RETFIE      1
; end of _uartrx

_main:

;uartline.c,42 :: 		void main()
;uartline.c,46 :: 		INTCON=0b01000000;  //ineterrupciones de perifericos autorizada
	MOVLW       64
	MOVWF       INTCON+0 
;uartline.c,47 :: 		TRISC6_bit=0;//salida tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;uartline.c,49 :: 		
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;uartline.c,50 :: 		TRISC0_bit=0; ///salida led1
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;uartline.c,52 :: 		TRISC1_bit=0; ///salida led2
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;uartline.c,54 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;uartline.c,57 :: 		T0CON=0;
	CLRF        T0CON+0 
;uartline.c,59 :: 		T08BIT_bit=1;//TRABAJA  A8 BIT
	BSF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;uartline.c,61 :: 		T0PS2_bit=1;
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;uartline.c,62 :: 		T0PS1_bit=0;
	BCF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;uartline.c,63 :: 		T0PS0_bit=0;
	BCF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;uartline.c,65 :: 		TMR0ON_bit=0;// Apaga el timer
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;uartline.c,67 :: 		T0CS_bit=0;  //el timer incrementa con el ciclo del reloj
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;uartline.c,69 :: 		PSA_bit=0; //el preescalador es asignado al timer 0
	BCF         PSA_bit+0, BitPos(PSA_bit+0) 
;uartline.c,72 :: 		TMR0IF_bit=0; //limpia la banders
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;uartline.c,73 :: 		TMR0IE_bit=0; //deshabilita las interrupciones de time
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;uartline.c,76 :: 		RCIF_bit=0; //limpia la bandera int serial
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;uartline.c,78 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;uartline.c,79 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;uartline.c,80 :: 		RCIE_bit=1;//habilita la int serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;uartline.c,83 :: 		GIE_bit=1; //autorizza interrpciones
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;uartline.c,84 :: 		while (1)
L_main3:
;uartline.c,86 :: 		if (flag_rx==1)
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;uartline.c,88 :: 		cont_trama=0;
	CLRF        _cont_trama+0 
;uartline.c,89 :: 		UART1_Write_Text(trama_rx); //REPITE LA TRAMA
	MOVLW       _trama_rx+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;uartline.c,90 :: 		if (strstr(trama_rx,"led=") )
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1_uartline+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1_uartline+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;uartline.c,92 :: 		if (strstr(trama_rx,"on"))   led2=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr2_uartline+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr2_uartline+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
	GOTO        L_main8
L_main7:
;uartline.c,93 :: 		else led2=0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
L_main8:
;uartline.c,94 :: 		}
L_main6:
;uartline.c,95 :: 		memset(trama_rx,0,50);//limpia le buffer
	MOVLW       _trama_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;uartline.c,97 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;uartline.c,98 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;uartline.c,99 :: 		RCIF_bit=0; //limpia la bandera int serial
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;uartline.c,100 :: 		RCIE_bit=1;//habilita la int serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;uartline.c,101 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;uartline.c,103 :: 		}
L_main5:
;uartline.c,106 :: 		led=!led;
	BTG         LATC0_bit+0, BitPos(LATC0_bit+0) 
;uartline.c,107 :: 		Delay_ms(300);
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
;uartline.c,110 :: 		}
	GOTO        L_main3
;uartline.c,112 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
