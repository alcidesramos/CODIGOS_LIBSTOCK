
_apaga_siete:

;MULTI.c,20 :: 		void apaga_siete()
;MULTI.c,22 :: 		EN1=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;MULTI.c,23 :: 		EN2=0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;MULTI.c,24 :: 		EN3=0;
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;MULTI.c,25 :: 		EN4=0;
	BCF         LATA2_bit+0, BitPos(LATA2_bit+0) 
;MULTI.c,26 :: 		}
L_end_apaga_siete:
	RETURN      0
; end of _apaga_siete

_Interrupcion:

;MULTI.c,28 :: 		void Interrupcion() iv 0x0008 ics ICS_AUTO
;MULTI.c,31 :: 		if (TMR1IF_bit==1)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_Interrupcion0
;MULTI.c,34 :: 		TMR1H=231;
	MOVLW       231
	MOVWF       TMR1H+0 
;MULTI.c,35 :: 		TMR1L=150;
	MOVLW       150
	MOVWF       TMR1L+0 
;MULTI.c,36 :: 		apaga_siete();
	CALL        _apaga_siete+0, 0
;MULTI.c,38 :: 		switch (multiplexa)
	GOTO        L_Interrupcion1
;MULTI.c,40 :: 		case 0b00001:
L_Interrupcion3:
;MULTI.c,41 :: 		display=codigo_siete[digito1];// suma la parte baja
	MOVLW       _codigo_siete+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_codigo_siete+0)
	MOVWF       FSR0L+1 
	MOVF        _digito1+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;MULTI.c,42 :: 		EN1=1;
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;MULTI.c,43 :: 		break;
	GOTO        L_Interrupcion2
;MULTI.c,45 :: 		case 0b0010:
L_Interrupcion4:
;MULTI.c,46 :: 		display=codigo_siete[digito2];// suma la parte baja
	MOVLW       _codigo_siete+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_codigo_siete+0)
	MOVWF       FSR0L+1 
	MOVF        _digito2+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;MULTI.c,47 :: 		EN2=1;
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;MULTI.c,48 :: 		break;
	GOTO        L_Interrupcion2
;MULTI.c,50 :: 		case 0b0100:
L_Interrupcion5:
;MULTI.c,51 :: 		display=codigo_siete[digito3];// suma la parte baja
	MOVLW       _codigo_siete+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_codigo_siete+0)
	MOVWF       FSR0L+1 
	MOVF        _digito3+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;MULTI.c,52 :: 		EN3=1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;MULTI.c,53 :: 		break;
	GOTO        L_Interrupcion2
;MULTI.c,55 :: 		case 0b1000:
L_Interrupcion6:
;MULTI.c,56 :: 		display=codigo_siete[digito4];// suma la parte baja
	MOVLW       _codigo_siete+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_codigo_siete+0)
	MOVWF       FSR0L+1 
	MOVF        _digito4+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;MULTI.c,57 :: 		EN4=1;
	BSF         LATA2_bit+0, BitPos(LATA2_bit+0) 
;MULTI.c,58 :: 		break;
	GOTO        L_Interrupcion2
;MULTI.c,61 :: 		}
L_Interrupcion1:
	MOVF        _multiplexa+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupcion3
	MOVF        _multiplexa+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupcion4
	MOVF        _multiplexa+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupcion5
	MOVF        _multiplexa+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupcion6
L_Interrupcion2:
;MULTI.c,62 :: 		multiplexa=multiplexa<<1;
	MOVF        _multiplexa+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _multiplexa+0 
;MULTI.c,64 :: 		if (multiplexa==0b10000) multiplexa=1;  // si ya paso al cuarto display apunta de nuevo al primero
	MOVF        R1, 0 
	XORLW       16
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupcion7
	MOVLW       1
	MOVWF       _multiplexa+0 
L_Interrupcion7:
;MULTI.c,70 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;MULTI.c,71 :: 		}
L_Interrupcion0:
;MULTI.c,74 :: 		}
L_end_Interrupcion:
L__Interrupcion14:
	RETFIE      1
; end of _Interrupcion

_mostrar:

;MULTI.c,76 :: 		void mostrar()
;MULTI.c,78 :: 		sprintf(texto,"%04d\r\n",conteo);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_MULTI+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_MULTI+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_MULTI+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _conteo+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _conteo+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	CALL        _sprintf+0, 0
;MULTI.c,79 :: 		digito1=texto[3]-48;//  pasa a numero;
	MOVLW       48
	SUBWF       _texto+3, 0 
	MOVWF       _digito1+0 
;MULTI.c,80 :: 		digito2=texto[2]-48;//  pasa a numero;
	MOVLW       48
	SUBWF       _texto+2, 0 
	MOVWF       _digito2+0 
;MULTI.c,81 :: 		digito3=texto[1]-48;//  pasa a numero;
	MOVLW       48
	SUBWF       _texto+1, 0 
	MOVWF       _digito3+0 
;MULTI.c,82 :: 		digito4=texto[0]-48;//  pasa a numero;
	MOVLW       48
	SUBWF       _texto+0, 0 
	MOVWF       _digito4+0 
;MULTI.c,84 :: 		}
L_end_mostrar:
	RETURN      0
; end of _mostrar

_main:

;MULTI.c,87 :: 		void main()
;MULTI.c,89 :: 		ADCON1=0B1111; // TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;MULTI.c,91 :: 		TRISA=0;
	CLRF        TRISA+0 
;MULTI.c,92 :: 		TRISB=0;
	CLRF        TRISB+0 
;MULTI.c,93 :: 		TRISC=0;
	CLRF        TRISC+0 
;MULTI.c,94 :: 		INTCON=0B01000000;// HABILITA INTERRPCION D EPERIFERICOS
	MOVLW       64
	MOVWF       INTCON+0 
;MULTI.c,95 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       3
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MULTI.c,97 :: 		T1CON=0;
	CLRF        T1CON+0 
;MULTI.c,99 :: 		T1CKPS1_bit=0;
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;MULTI.c,100 :: 		T1CKPS0_bit=1;
	BSF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;MULTI.c,102 :: 		TMR1H=231;
	MOVLW       231
	MOVWF       TMR1H+0 
;MULTI.c,103 :: 		TMR1L=150;
	MOVLW       150
	MOVWF       TMR1L+0 
;MULTI.c,105 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;MULTI.c,106 :: 		TMR1IE_bit=1;  // HABILITA LA INTERRPCION DEL TIMER1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;MULTI.c,107 :: 		TMR1ON_bit=1; // PRENDE EL TIMER
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;MULTI.c,109 :: 		GIE_bit=1; // AUTORIZA LAS INTERRPCIONES
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MULTI.c,111 :: 		while (1)
L_main8:
;MULTI.c,114 :: 		if (conteo>9999) conteo=0;
	MOVF        _conteo+1, 0 
	SUBLW       39
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVF        _conteo+0, 0 
	SUBLW       15
L__main17:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
	CLRF        _conteo+0 
	CLRF        _conteo+1 
L_main10:
;MULTI.c,115 :: 		mostrar();
	CALL        _mostrar+0, 0
;MULTI.c,116 :: 		conteo+=10;
	MOVLW       10
	ADDWF       _conteo+0, 1 
	MOVLW       0
	ADDWFC      _conteo+1, 1 
;MULTI.c,117 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MULTI.c,118 :: 		Delay_ms(150);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       231
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;MULTI.c,123 :: 		}
	GOTO        L_main8
;MULTI.c,128 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
