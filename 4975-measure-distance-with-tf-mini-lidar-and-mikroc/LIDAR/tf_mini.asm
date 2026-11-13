
_tf_mini_config:

;tf_mini.c,16 :: 		void tf_mini_config()
;tf_mini.c,18 :: 		UART1_Init(115200);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       21
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;tf_mini.c,19 :: 		memset(trama_rx_lidar,0,20);// limpia la trama
	MOVLW       _trama_rx_lidar+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx_lidar+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       20
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;tf_mini.c,20 :: 		}
L_end_tf_mini_config:
	RETURN      0
; end of _tf_mini_config

_tf_mini_out_hex:

;tf_mini.c,23 :: 		void tf_mini_out_hex()
;tf_mini.c,25 :: 		UART1_Write(0x42);
	MOVLW       66
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,26 :: 		UART1_Write(0x57);
	MOVLW       87
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,27 :: 		UART1_Write(0x02);
	MOVLW       2
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,28 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,29 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,30 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,31 :: 		UART1_Write(0x01);
	MOVLW       1
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,32 :: 		UART1_Write(0x06);
	MOVLW       6
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,34 :: 		}
L_end_tf_mini_out_hex:
	RETURN      0
; end of _tf_mini_out_hex

_tf_mini_out_str:

;tf_mini.c,37 :: 		void tf_mini_out_str()
;tf_mini.c,39 :: 		UART1_Write(0x42);
	MOVLW       66
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,40 :: 		UART1_Write(0x57);
	MOVLW       87
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,41 :: 		UART1_Write(0x02);
	MOVLW       2
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,42 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,43 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,44 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,45 :: 		UART1_Write(0x04);
	MOVLW       4
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,46 :: 		UART1_Write(0x06);
	MOVLW       6
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tf_mini.c,48 :: 		}
L_end_tf_mini_out_str:
	RETURN      0
; end of _tf_mini_out_str

_tf_mini_interrupcion_hex:

;tf_mini.c,51 :: 		void tf_mini_interrupcion_hex()
;tf_mini.c,53 :: 		if (RCIF_bit==1) // mira si es interrpcion serial
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_tf_mini_interrupcion_hex0
;tf_mini.c,57 :: 		dat_rx=RCREG;// recibe dato actual
	MOVF        RCREG+0, 0 
	MOVWF       R1 
;tf_mini.c,60 :: 		switch (tf_estado)
	GOTO        L_tf_mini_interrupcion_hex1
;tf_mini.c,62 :: 		case tf_cabe:
L_tf_mini_interrupcion_hex3:
;tf_mini.c,63 :: 		if (dat_rx==0x59) tf_estado=tf_cabe1;  //pasa al estado de segunda cabecera
	MOVF        R1, 0 
	XORLW       89
	BTFSS       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_hex4
	MOVLW       1
	MOVWF       _tf_estado+0 
L_tf_mini_interrupcion_hex4:
;tf_mini.c,64 :: 		break;
	GOTO        L_tf_mini_interrupcion_hex2
;tf_mini.c,66 :: 		case tf_cabe1:
L_tf_mini_interrupcion_hex5:
;tf_mini.c,67 :: 		if (dat_rx==0x59) tf_estado=tf_datos;      //pasa al estado datos
	MOVF        R1, 0 
	XORLW       89
	BTFSS       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_hex6
	MOVLW       2
	MOVWF       _tf_estado+0 
	GOTO        L_tf_mini_interrupcion_hex7
L_tf_mini_interrupcion_hex6:
;tf_mini.c,68 :: 		else   tf_estado=tf_cabe;   //regresa al estado inicial
	CLRF        _tf_estado+0 
L_tf_mini_interrupcion_hex7:
;tf_mini.c,69 :: 		break;
	GOTO        L_tf_mini_interrupcion_hex2
;tf_mini.c,71 :: 		case tf_datos:
L_tf_mini_interrupcion_hex8:
;tf_mini.c,73 :: 		trama_rx_lidar[trama_rx_lidar_cont]=dat_rx;
	MOVLW       _trama_rx_lidar+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_lidar+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_lidar_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;tf_mini.c,74 :: 		trama_rx_lidar_cont++;
	INCF        _trama_rx_lidar_cont+0, 1 
;tf_mini.c,75 :: 		if (trama_rx_lidar_cont>7)      //si captura los datos completos
	MOVF        _trama_rx_lidar_cont+0, 0 
	SUBLW       7
	BTFSC       STATUS+0, 0 
	GOTO        L_tf_mini_interrupcion_hex9
;tf_mini.c,77 :: 		tf_estado=tf_cabe;
	CLRF        _tf_estado+0 
;tf_mini.c,78 :: 		trama_rx_lidar_cont=0;
	CLRF        _trama_rx_lidar_cont+0 
;tf_mini.c,79 :: 		RCIE_bit=0;//deshabilita la interrupcion, para que se procese la info
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;tf_mini.c,80 :: 		flag_rx_lidar=1;//activa la bandera de datos listo
	MOVLW       1
	MOVWF       _flag_rx_lidar+0 
;tf_mini.c,81 :: 		}
L_tf_mini_interrupcion_hex9:
;tf_mini.c,83 :: 		break;
	GOTO        L_tf_mini_interrupcion_hex2
;tf_mini.c,86 :: 		}
L_tf_mini_interrupcion_hex1:
	MOVF        _tf_estado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_hex3
	MOVF        _tf_estado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_hex5
	MOVF        _tf_estado+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_hex8
L_tf_mini_interrupcion_hex2:
;tf_mini.c,89 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;tf_mini.c,90 :: 		}  //if
L_tf_mini_interrupcion_hex0:
;tf_mini.c,93 :: 		}
L_end_tf_mini_interrupcion_hex:
	RETURN      0
; end of _tf_mini_interrupcion_hex

_tf_mini_interrupcion_str:

;tf_mini.c,95 :: 		void tf_mini_interrupcion_str()
;tf_mini.c,97 :: 		if (RCIF_bit==1) // mira si es interrpcion serial
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_tf_mini_interrupcion_str10
;tf_mini.c,100 :: 		dat_rx=RCREG;// recibe dato actual
	MOVF        RCREG+0, 0 
	MOVWF       R1 
;tf_mini.c,103 :: 		switch (tf_estado)
	GOTO        L_tf_mini_interrupcion_str11
;tf_mini.c,105 :: 		case tf_cabe:
L_tf_mini_interrupcion_str13:
;tf_mini.c,106 :: 		if (dat_rx=='\n') tf_estado=tf_cabe1;  //pasa al estado de segunda cabecera
	MOVF        R1, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_str14
	MOVLW       1
	MOVWF       _tf_estado+0 
L_tf_mini_interrupcion_str14:
;tf_mini.c,107 :: 		break;
	GOTO        L_tf_mini_interrupcion_str12
;tf_mini.c,108 :: 		case tf_cabe1:
L_tf_mini_interrupcion_str15:
;tf_mini.c,109 :: 		trama_rx_lidar[trama_rx_lidar_cont]=dat_rx;
	MOVLW       _trama_rx_lidar+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_lidar+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_lidar_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;tf_mini.c,110 :: 		trama_rx_lidar_cont++;
	INCF        _trama_rx_lidar_cont+0, 1 
;tf_mini.c,112 :: 		if (dat_rx=='\n')
	MOVF        R1, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_str16
;tf_mini.c,114 :: 		trama_rx_lidar[trama_rx_lidar_cont]=0;
	MOVLW       _trama_rx_lidar+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx_lidar+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_rx_lidar_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	CLRF        POSTINC1+0 
;tf_mini.c,115 :: 		tf_estado=tf_cabe;
	CLRF        _tf_estado+0 
;tf_mini.c,116 :: 		trama_rx_lidar_cont=0;
	CLRF        _trama_rx_lidar_cont+0 
;tf_mini.c,117 :: 		RCIE_bit=0;//deshabilita la interrupcion, para que se procese la info
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;tf_mini.c,118 :: 		flag_rx_lidar=1;//activa la bandera de datos listo
	MOVLW       1
	MOVWF       _flag_rx_lidar+0 
;tf_mini.c,120 :: 		}
	GOTO        L_tf_mini_interrupcion_str17
L_tf_mini_interrupcion_str16:
;tf_mini.c,122 :: 		else if (trama_rx_lidar_cont>=20)      //si supero tamño del buffer
	MOVLW       20
	SUBWF       _trama_rx_lidar_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_tf_mini_interrupcion_str18
;tf_mini.c,124 :: 		trama_rx_lidar_cont=0;
	CLRF        _trama_rx_lidar_cont+0 
;tf_mini.c,125 :: 		tf_estado=tf_cabe;
	CLRF        _tf_estado+0 
;tf_mini.c,126 :: 		}
L_tf_mini_interrupcion_str18:
L_tf_mini_interrupcion_str17:
;tf_mini.c,128 :: 		break;
	GOTO        L_tf_mini_interrupcion_str12
;tf_mini.c,132 :: 		}
L_tf_mini_interrupcion_str11:
	MOVF        _tf_estado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_str13
	MOVF        _tf_estado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_tf_mini_interrupcion_str15
L_tf_mini_interrupcion_str12:
;tf_mini.c,134 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;tf_mini.c,135 :: 		}
L_tf_mini_interrupcion_str10:
;tf_mini.c,137 :: 		}
L_end_tf_mini_interrupcion_str:
	RETURN      0
; end of _tf_mini_interrupcion_str

_procesa_lidar_hex:

;tf_mini.c,139 :: 		void procesa_lidar_hex()
;tf_mini.c,141 :: 		distancia= ((unsigned int)trama_rx_lidar[1]<<8)+((unsigned int )trama_rx_lidar[0]);
	MOVF        _trama_rx_lidar+1, 0 
	MOVWF       _distancia+0 
	MOVLW       0
	MOVWF       _distancia+1 
	MOVF        _distancia+0, 0 
	MOVWF       _distancia+1 
	CLRF        _distancia+0 
	MOVF        _trama_rx_lidar+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       _distancia+0, 1 
	MOVF        R1, 0 
	ADDWFC      _distancia+1, 1 
;tf_mini.c,142 :: 		fuerza=((unsigned int)trama_rx_lidar[3]<<8)+((unsigned int )trama_rx_lidar[2]); //artma la distancia
	MOVF        _trama_rx_lidar+3, 0 
	MOVWF       _fuerza+0 
	MOVLW       0
	MOVWF       _fuerza+1 
	MOVF        _fuerza+0, 0 
	MOVWF       _fuerza+1 
	CLRF        _fuerza+0 
	MOVF        _trama_rx_lidar+2, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       _fuerza+0, 1 
	MOVF        R1, 0 
	ADDWFC      _fuerza+1, 1 
;tf_mini.c,144 :: 		memset(trama_rx_lidar,0,20);// limpia la trama
	MOVLW       _trama_rx_lidar+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx_lidar+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       20
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;tf_mini.c,145 :: 		}
L_end_procesa_lidar_hex:
	RETURN      0
; end of _procesa_lidar_hex

_procesa_lidar_str:

;tf_mini.c,148 :: 		void procesa_lidar_str()
;tf_mini.c,150 :: 		distancia_float=atof(trama_rx_lidar);
	MOVLW       _trama_rx_lidar+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_trama_rx_lidar+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _distancia_float+0 
	MOVF        R1, 0 
	MOVWF       _distancia_float+1 
	MOVF        R2, 0 
	MOVWF       _distancia_float+2 
	MOVF        R3, 0 
	MOVWF       _distancia_float+3 
;tf_mini.c,151 :: 		memset(trama_rx_lidar,0,20);// limpia la trama
	MOVLW       _trama_rx_lidar+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx_lidar+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       20
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;tf_mini.c,153 :: 		}
L_end_procesa_lidar_str:
	RETURN      0
; end of _procesa_lidar_str
