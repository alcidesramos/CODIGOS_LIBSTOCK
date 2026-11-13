
_nextion_init:

;Nextion.c,15 :: 		void nextion_init()
;Nextion.c,17 :: 		UART1_Init(9600); //inicia la nextion a 9600
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Nextion.c,18 :: 		RCIF_bit=0; //limpia bandera recepcions Serial
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;Nextion.c,19 :: 		RCIE_bit=1;// activa la bandera de recepción serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Nextion.c,21 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;Nextion.c,22 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;Nextion.c,24 :: 		}
L_end_nextion_init:
	RETURN      0
; end of _nextion_init

_nextion_interrupcion:

;Nextion.c,27 :: 		void nextion_interrupcion()
;Nextion.c,29 :: 		if (RCIF_bit==1) // mira si es interrpcion serial
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_nextion_interrupcion0
;Nextion.c,36 :: 		dat_rx=RCREG;// recibe dato actual
	MOVF        RCREG+0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
;Nextion.c,39 :: 		switch (nextion_trama_estado)
	GOTO        L_nextion_interrupcion1
;Nextion.c,41 :: 		case inicio1:
L_nextion_interrupcion3:
;Nextion.c,42 :: 		if (dat_rx=='I')
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__nextion_interrupcion25
	MOVLW       73
	XORWF       R1, 0 
L__nextion_interrupcion25:
	BTFSS       STATUS+0, 2 
	GOTO        L_nextion_interrupcion4
;Nextion.c,44 :: 		trama_rx_nextion[trama_rx_cont]=dat_rx;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;Nextion.c,45 :: 		nextion_trama_estado=inicio2;
	MOVLW       1
	MOVWF       _nextion_trama_estado+0 
;Nextion.c,46 :: 		trama_rx_cont++;
	INCF        _trama_rx_cont+0, 1 
;Nextion.c,47 :: 		}
L_nextion_interrupcion4:
;Nextion.c,48 :: 		break;
	GOTO        L_nextion_interrupcion2
;Nextion.c,50 :: 		case inicio2:
L_nextion_interrupcion5:
;Nextion.c,51 :: 		if (dat_rx=='N')
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__nextion_interrupcion26
	MOVLW       78
	XORWF       R1, 0 
L__nextion_interrupcion26:
	BTFSS       STATUS+0, 2 
	GOTO        L_nextion_interrupcion6
;Nextion.c,53 :: 		trama_rx_nextion[trama_rx_cont]=dat_rx;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;Nextion.c,54 :: 		nextion_trama_estado=inicio3;
	MOVLW       2
	MOVWF       _nextion_trama_estado+0 
;Nextion.c,55 :: 		trama_rx_cont++;
	INCF        _trama_rx_cont+0, 1 
;Nextion.c,56 :: 		}
	GOTO        L_nextion_interrupcion7
L_nextion_interrupcion6:
;Nextion.c,59 :: 		nextion_trama_estado=inicio1;
	CLRF        _nextion_trama_estado+0 
;Nextion.c,60 :: 		trama_rx_cont=0;
	CLRF        _trama_rx_cont+0 
;Nextion.c,61 :: 		}
L_nextion_interrupcion7:
;Nextion.c,62 :: 		break;
	GOTO        L_nextion_interrupcion2
;Nextion.c,64 :: 		case inicio3:
L_nextion_interrupcion8:
;Nextion.c,65 :: 		if (dat_rx=='=')
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__nextion_interrupcion27
	MOVLW       61
	XORWF       R1, 0 
L__nextion_interrupcion27:
	BTFSS       STATUS+0, 2 
	GOTO        L_nextion_interrupcion9
;Nextion.c,67 :: 		trama_rx_nextion[trama_rx_cont]=dat_rx;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;Nextion.c,68 :: 		nextion_trama_estado=fin1;
	MOVLW       3
	MOVWF       _nextion_trama_estado+0 
;Nextion.c,69 :: 		trama_rx_cont++;
	INCF        _trama_rx_cont+0, 1 
;Nextion.c,70 :: 		}
	GOTO        L_nextion_interrupcion10
L_nextion_interrupcion9:
;Nextion.c,73 :: 		nextion_trama_estado=inicio1;
	CLRF        _nextion_trama_estado+0 
;Nextion.c,74 :: 		trama_rx_cont=0;
	CLRF        _trama_rx_cont+0 
;Nextion.c,75 :: 		}
L_nextion_interrupcion10:
;Nextion.c,76 :: 		break;
	GOTO        L_nextion_interrupcion2
;Nextion.c,78 :: 		case fin1:
L_nextion_interrupcion11:
;Nextion.c,80 :: 		if (dat_rx!=0xff)
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__nextion_interrupcion28
	MOVLW       255
	XORWF       R1, 0 
L__nextion_interrupcion28:
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion12
;Nextion.c,82 :: 		trama_rx_nextion[trama_rx_cont]=dat_rx;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;Nextion.c,83 :: 		trama_rx_cont++;
	INCF        _trama_rx_cont+0, 1 
;Nextion.c,84 :: 		if (trama_rx_cont>=50)
	MOVLW       50
	SUBWF       _trama_rx_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_nextion_interrupcion13
;Nextion.c,86 :: 		trama_rx_cont=0;
	CLRF        _trama_rx_cont+0 
;Nextion.c,87 :: 		nextion_trama_estado=inicio1;
	CLRF        _nextion_trama_estado+0 
;Nextion.c,88 :: 		}
L_nextion_interrupcion13:
;Nextion.c,89 :: 		}
	GOTO        L_nextion_interrupcion14
L_nextion_interrupcion12:
;Nextion.c,90 :: 		else nextion_trama_estado=fin2;
	MOVLW       4
	MOVWF       _nextion_trama_estado+0 
L_nextion_interrupcion14:
;Nextion.c,91 :: 		break;
	GOTO        L_nextion_interrupcion2
;Nextion.c,93 :: 		case fin2:
L_nextion_interrupcion15:
;Nextion.c,95 :: 		if (dat_rx!=0xff)
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__nextion_interrupcion29
	MOVLW       255
	XORWF       R1, 0 
L__nextion_interrupcion29:
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion16
;Nextion.c,97 :: 		trama_rx_nextion[trama_rx_cont]=dat_rx;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;Nextion.c,98 :: 		trama_rx_cont++;
	INCF        _trama_rx_cont+0, 1 
;Nextion.c,99 :: 		if (trama_rx_cont>=50)
	MOVLW       50
	SUBWF       _trama_rx_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_nextion_interrupcion17
;Nextion.c,101 :: 		trama_rx_cont=0;
	CLRF        _trama_rx_cont+0 
;Nextion.c,102 :: 		nextion_trama_estado=inicio1;
	CLRF        _nextion_trama_estado+0 
;Nextion.c,103 :: 		}
L_nextion_interrupcion17:
;Nextion.c,105 :: 		}
	GOTO        L_nextion_interrupcion18
L_nextion_interrupcion16:
;Nextion.c,106 :: 		else nextion_trama_estado=fin3;
	MOVLW       5
	MOVWF       _nextion_trama_estado+0 
L_nextion_interrupcion18:
;Nextion.c,107 :: 		break;
	GOTO        L_nextion_interrupcion2
;Nextion.c,110 :: 		case fin3:
L_nextion_interrupcion19:
;Nextion.c,112 :: 		if (dat_rx!=0xff)
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__nextion_interrupcion30
	MOVLW       255
	XORWF       R1, 0 
L__nextion_interrupcion30:
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion20
;Nextion.c,114 :: 		trama_rx_nextion[trama_rx_cont]=dat_rx;
	MOVLW       _trama_rx_nextion+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;Nextion.c,115 :: 		trama_rx_cont++;
	INCF        _trama_rx_cont+0, 1 
;Nextion.c,116 :: 		if (trama_rx_cont>=50)
	MOVLW       50
	SUBWF       _trama_rx_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_nextion_interrupcion21
;Nextion.c,118 :: 		trama_rx_cont=0;
	CLRF        _trama_rx_cont+0 
;Nextion.c,119 :: 		nextion_trama_estado=inicio1;
	CLRF        _nextion_trama_estado+0 
;Nextion.c,120 :: 		}
L_nextion_interrupcion21:
;Nextion.c,122 :: 		}
	GOTO        L_nextion_interrupcion22
L_nextion_interrupcion20:
;Nextion.c,125 :: 		trama_rx_nextion[trama_rx_cont]=0; // agrega cero fin de cadena para variables string
	MOVLW       _trama_rx_nextion+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_nextion+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	CLRF        POSTINC1+0 
;Nextion.c,126 :: 		nextion_trama_estado=inicio1;
	CLRF        _nextion_trama_estado+0 
;Nextion.c,127 :: 		trama_rx_cont=0;
	CLRF        _trama_rx_cont+0 
;Nextion.c,128 :: 		RCIE_bit=0;//deshabilita la interrupcio, para que se procese la info
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Nextion.c,129 :: 		flag_rx1=1;//activa la bandera de datos listo
	MOVLW       1
	MOVWF       _flag_rx1+0 
;Nextion.c,130 :: 		}
L_nextion_interrupcion22:
;Nextion.c,131 :: 		break;
	GOTO        L_nextion_interrupcion2
;Nextion.c,133 :: 		}//fin del switch
L_nextion_interrupcion1:
	MOVF        _nextion_trama_estado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion3
	MOVF        _nextion_trama_estado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion5
	MOVF        _nextion_trama_estado+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion8
	MOVF        _nextion_trama_estado+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion11
	MOVF        _nextion_trama_estado+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion15
	MOVF        _nextion_trama_estado+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_nextion_interrupcion19
L_nextion_interrupcion2:
;Nextion.c,135 :: 		RCIF_bit=0;//limpia bandera de recepcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;Nextion.c,136 :: 		}
L_nextion_interrupcion0:
;Nextion.c,137 :: 		}
L_end_nextion_interrupcion:
	RETURN      0
; end of _nextion_interrupcion
