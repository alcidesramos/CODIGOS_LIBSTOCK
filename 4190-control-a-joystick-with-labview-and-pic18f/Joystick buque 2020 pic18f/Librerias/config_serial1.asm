
_config_serial:

;config_serial1.c,14 :: 		void config_serial()
;config_serial1.c,17 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;config_serial1.c,18 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;config_serial1.c,19 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;config_serial1.c,21 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;config_serial1.c,22 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;config_serial1.c,24 :: 		}
L_end_config_serial:
	RETURN      0
; end of _config_serial

_interrupcion_serial:

;config_serial1.c,27 :: 		void interrupcion_serial()
;config_serial1.c,29 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion_serial0
;config_serial1.c,32 :: 		dato1_in=RCREG; // lee el dato serial
	MOVF        RCREG+0, 0 
	MOVWF       _dato1_in+0 
;config_serial1.c,34 :: 		switch (recibidos_estado1)
	GOTO        L_interrupcion_serial1
;config_serial1.c,36 :: 		case inicio1:
L_interrupcion_serial3:
;config_serial1.c,38 :: 		if (dato1_in!='I') puntero_rx1=0;
	MOVF        _dato1_in+0, 0 
	XORLW       73
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion_serial4
	CLRF        _puntero_rx1+0 
	GOTO        L_interrupcion_serial5
L_interrupcion_serial4:
;config_serial1.c,41 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOVLW       _Trama_rx1+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_Trama_rx1+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx1+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato1_in+0, 0 
	MOVWF       POSTINC1+0 
;config_serial1.c,42 :: 		puntero_rx1++;
	INCF        _puntero_rx1+0, 1 
;config_serial1.c,43 :: 		recibidos_estado1=inicio2;
	MOVLW       1
	MOVWF       _recibidos_estado1+0 
;config_serial1.c,44 :: 		} //if
L_interrupcion_serial5:
;config_serial1.c,46 :: 		break;
	GOTO        L_interrupcion_serial2
;config_serial1.c,47 :: 		case inicio2:
L_interrupcion_serial6:
;config_serial1.c,49 :: 		if (dato1_in!='N')
	MOVF        _dato1_in+0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion_serial7
;config_serial1.c,50 :: 		{ puntero_rx1=0;
	CLRF        _puntero_rx1+0 
;config_serial1.c,51 :: 		recibidos_estado1=inicio1;
	CLRF        _recibidos_estado1+0 
;config_serial1.c,52 :: 		}
	GOTO        L_interrupcion_serial8
L_interrupcion_serial7:
;config_serial1.c,55 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOVLW       _Trama_rx1+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_Trama_rx1+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx1+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato1_in+0, 0 
	MOVWF       POSTINC1+0 
;config_serial1.c,56 :: 		puntero_rx1++;
	INCF        _puntero_rx1+0, 1 
;config_serial1.c,57 :: 		recibidos_estado1=inicio3;
	MOVLW       2
	MOVWF       _recibidos_estado1+0 
;config_serial1.c,58 :: 		} //if
L_interrupcion_serial8:
;config_serial1.c,60 :: 		break;
	GOTO        L_interrupcion_serial2
;config_serial1.c,62 :: 		case inicio3:
L_interrupcion_serial9:
;config_serial1.c,64 :: 		if (dato1_in!='I')
	MOVF        _dato1_in+0, 0 
	XORLW       73
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion_serial10
;config_serial1.c,66 :: 		puntero_rx1=0;
	CLRF        _puntero_rx1+0 
;config_serial1.c,67 :: 		recibidos_estado1=inicio1;
	CLRF        _recibidos_estado1+0 
;config_serial1.c,68 :: 		}
	GOTO        L_interrupcion_serial11
L_interrupcion_serial10:
;config_serial1.c,71 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOVLW       _Trama_rx1+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_Trama_rx1+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx1+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato1_in+0, 0 
	MOVWF       POSTINC1+0 
;config_serial1.c,72 :: 		puntero_rx1++;
	INCF        _puntero_rx1+0, 1 
;config_serial1.c,73 :: 		recibidos_estado1=fin1;
	MOVLW       3
	MOVWF       _recibidos_estado1+0 
;config_serial1.c,75 :: 		} //if
L_interrupcion_serial11:
;config_serial1.c,77 :: 		break;
	GOTO        L_interrupcion_serial2
;config_serial1.c,80 :: 		case fin1:
L_interrupcion_serial12:
;config_serial1.c,82 :: 		Trama_rx1[puntero_rx1]=dato1_in;
	MOVLW       _Trama_rx1+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_Trama_rx1+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx1+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato1_in+0, 0 
	MOVWF       POSTINC1+0 
;config_serial1.c,83 :: 		puntero_rx1++;
	INCF        _puntero_rx1+0, 1 
;config_serial1.c,84 :: 		if (dato1_in=='*')
	MOVF        _dato1_in+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion_serial13
;config_serial1.c,87 :: 		recibidos_estado1=0;
	CLRF        _recibidos_estado1+0 
;config_serial1.c,88 :: 		puntero_rx1=0;
	CLRF        _puntero_rx1+0 
;config_serial1.c,89 :: 		flag_rx1=1;  ///habilita la bandera para decir que tiene una trama completa
	MOVLW       1
	MOVWF       _flag_rx1+0 
;config_serial1.c,90 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;config_serial1.c,91 :: 		RCIE_bit=0;// deshabilita la interpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;config_serial1.c,92 :: 		}
	GOTO        L_interrupcion_serial14
L_interrupcion_serial13:
;config_serial1.c,93 :: 		else if (puntero_rx1>max_datos)
	MOVF        _puntero_rx1+0, 0 
	SUBLW       50
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupcion_serial15
;config_serial1.c,95 :: 		puntero_rx1=0;
	CLRF        _puntero_rx1+0 
;config_serial1.c,96 :: 		recibidos_estado1=0;
	CLRF        _recibidos_estado1+0 
;config_serial1.c,97 :: 		puntero_rx1=0;
	CLRF        _puntero_rx1+0 
;config_serial1.c,98 :: 		flag_rx1=0;
	CLRF        _flag_rx1+0 
;config_serial1.c,100 :: 		}
L_interrupcion_serial15:
L_interrupcion_serial14:
;config_serial1.c,103 :: 		break;
	GOTO        L_interrupcion_serial2
;config_serial1.c,106 :: 		}// case recibidos_
L_interrupcion_serial1:
	MOVF        _recibidos_estado1+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion_serial3
	MOVF        _recibidos_estado1+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion_serial6
	MOVF        _recibidos_estado1+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion_serial9
	MOVF        _recibidos_estado1+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion_serial12
L_interrupcion_serial2:
;config_serial1.c,109 :: 		RCIF_bit=0;//limpia bandera
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;config_serial1.c,110 :: 		}
L_interrupcion_serial0:
;config_serial1.c,113 :: 		}
L_end_interrupcion_serial:
	RETURN      0
; end of _interrupcion_serial
