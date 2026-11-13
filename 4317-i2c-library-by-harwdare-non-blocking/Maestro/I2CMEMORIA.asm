
_memoria_i2c_write:

;I2CMEMORIA.c,13 :: 		void memoria_i2c_write(unsigned int dir_mem, unsigned char dato_mem)
;I2CMEMORIA.c,15 :: 		I2C_STARTBIT();
	CALL       _I2C_STARTBIT+0
;I2CMEMORIA.c,16 :: 		I2C_WRITE_BYTE(dir_exclavo & 0b11111110);   //para escribir
	MOVLW      160
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,18 :: 		I2C_WRITE_BYTE(Hi(dir_mem));
	MOVF       FARG_memoria_i2c_write_dir_mem+1, 0
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,19 :: 		I2C_WRITE_BYTE(Lo(dir_mem));
	MOVF       FARG_memoria_i2c_write_dir_mem+0, 0
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,21 :: 		I2C_WRITE_BYTE(dato_mem);
	MOVF       FARG_memoria_i2c_write_dato_mem+0, 0
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,22 :: 		I2C_STOPBIT();
	CALL       _I2C_STOPBIT+0
;I2CMEMORIA.c,24 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_memoria_i2c_write0:
	DECFSZ     R13, 1
	GOTO       L_memoria_i2c_write0
	DECFSZ     R12, 1
	GOTO       L_memoria_i2c_write0
	NOP
	NOP
;I2CMEMORIA.c,26 :: 		}
L_end_memoria_i2c_write:
	RETURN
; end of _memoria_i2c_write

_memoria_i2c_read:

;I2CMEMORIA.c,28 :: 		unsigned char memoria_i2c_read(unsigned int dir_mem)
;I2CMEMORIA.c,32 :: 		I2C_STARTBIT();
	CALL       _I2C_STARTBIT+0
;I2CMEMORIA.c,33 :: 		I2C_WRITE_BYTE(dir_exclavo & 0b11111110);   //para escribir
	MOVLW      160
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,35 :: 		I2C_WRITE_BYTE(Hi(dir_mem));
	MOVF       FARG_memoria_i2c_read_dir_mem+1, 0
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,36 :: 		I2C_WRITE_BYTE(Lo(dir_mem));
	MOVF       FARG_memoria_i2c_read_dir_mem+0, 0
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,38 :: 		I2C_REPEATSTARTBIT();
	CALL       _I2C_REPEATSTARTBIT+0
;I2CMEMORIA.c,39 :: 		I2C_WRITE_BYTE(dir_exclavo | 0b00000001);    // para DECIRLE QUE VA A LEER
	MOVLW      161
	MOVWF      FARG_I2C_WRITE_BYTE_dato_i2c+0
	CALL       _I2C_WRITE_BYTE+0
;I2CMEMORIA.c,40 :: 		i2c_dato_read=I2C_READ_BYTE(0);// lee  1= con reconocimiento 0 sin
	CLRF       FARG_I2C_READ_BYTE_ack_bit+0
	CALL       _I2C_READ_BYTE+0
	MOVF       R0, 0
	MOVWF      memoria_i2c_read_i2c_dato_read_L0+0
;I2CMEMORIA.c,41 :: 		I2C_STOPBIT();
	CALL       _I2C_STOPBIT+0
;I2CMEMORIA.c,42 :: 		return(i2c_dato_read);
	MOVF       memoria_i2c_read_i2c_dato_read_L0+0, 0
	MOVWF      R0
;I2CMEMORIA.c,43 :: 		}
L_end_memoria_i2c_read:
	RETURN
; end of _memoria_i2c_read

_main:

;I2CMEMORIA.c,46 :: 		void main()
;I2CMEMORIA.c,49 :: 		OSCCON=0;
	CLRF       OSCCON+0
;I2CMEMORIA.c,50 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;I2CMEMORIA.c,52 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;I2CMEMORIA.c,53 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;I2CMEMORIA.c,56 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;I2CMEMORIA.c,57 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;I2CMEMORIA.c,58 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;I2CMEMORIA.c,59 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;I2CMEMORIA.c,60 :: 		INTCON=0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;I2CMEMORIA.c,62 :: 		ansela=0;
	CLRF       ANSELA+0
;I2CMEMORIA.c,63 :: 		anselc=0;
	CLRF       ANSELC+0
;I2CMEMORIA.c,65 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;I2CMEMORIA.c,67 :: 		TRISA=0;
	CLRF       TRISA+0
;I2CMEMORIA.c,68 :: 		TRISC=0;
	CLRF       TRISC+0
;I2CMEMORIA.c,70 :: 		TRISc0_bit=1;
	BSF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;I2CMEMORIA.c,71 :: 		TRISC1_bit=1;
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;I2CMEMORIA.c,73 :: 		TRISA1_bit=1; // entrada rx
	BSF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;I2CMEMORIA.c,75 :: 		RXDTSEL_bit=1; // RX en RA1  sino RC5
	BSF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
;I2CMEMORIA.c,76 :: 		TXCKSEL_bit=1; // tX en RA0  sino RC4
	BSF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;I2CMEMORIA.c,80 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr1_I2CMEMORIA+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_I2CMEMORIA+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;I2CMEMORIA.c,82 :: 		I2C_CONFIG_master(100000);
	MOVLW      160
	MOVWF      FARG_I2C_CONFIG_master_i2c_velo+0
	MOVLW      134
	MOVWF      FARG_I2C_CONFIG_master_i2c_velo+1
	MOVLW      1
	MOVWF      FARG_I2C_CONFIG_master_i2c_velo+2
	MOVLW      0
	MOVWF      FARG_I2C_CONFIG_master_i2c_velo+3
	CALL       _I2C_CONFIG_master+0
;I2CMEMORIA.c,83 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main1:
	DECFSZ     R13, 1
	GOTO       L_main1
	DECFSZ     R12, 1
	GOTO       L_main1
	DECFSZ     R11, 1
	GOTO       L_main1
	NOP
;I2CMEMORIA.c,105 :: 		memoria_i2c_write(0,10);
	CLRF       FARG_memoria_i2c_write_dir_mem+0
	CLRF       FARG_memoria_i2c_write_dir_mem+1
	MOVLW      10
	MOVWF      FARG_memoria_i2c_write_dato_mem+0
	CALL       _memoria_i2c_write+0
;I2CMEMORIA.c,107 :: 		memoria_i2c_write(1,11);
	MOVLW      1
	MOVWF      FARG_memoria_i2c_write_dir_mem+0
	MOVLW      0
	MOVWF      FARG_memoria_i2c_write_dir_mem+1
	MOVLW      11
	MOVWF      FARG_memoria_i2c_write_dato_mem+0
	CALL       _memoria_i2c_write+0
;I2CMEMORIA.c,109 :: 		memoria_i2c_write(2,12);
	MOVLW      2
	MOVWF      FARG_memoria_i2c_write_dir_mem+0
	MOVLW      0
	MOVWF      FARG_memoria_i2c_write_dir_mem+1
	MOVLW      12
	MOVWF      FARG_memoria_i2c_write_dato_mem+0
	CALL       _memoria_i2c_write+0
;I2CMEMORIA.c,111 :: 		memoria_i2c_write(3,13);
	MOVLW      3
	MOVWF      FARG_memoria_i2c_write_dir_mem+0
	MOVLW      0
	MOVWF      FARG_memoria_i2c_write_dir_mem+1
	MOVLW      13
	MOVWF      FARG_memoria_i2c_write_dato_mem+0
	CALL       _memoria_i2c_write+0
;I2CMEMORIA.c,113 :: 		memoria_i2c_write(4,14);
	MOVLW      4
	MOVWF      FARG_memoria_i2c_write_dir_mem+0
	MOVLW      0
	MOVWF      FARG_memoria_i2c_write_dir_mem+1
	MOVLW      14
	MOVWF      FARG_memoria_i2c_write_dato_mem+0
	CALL       _memoria_i2c_write+0
;I2CMEMORIA.c,115 :: 		leido=memoria_i2c_read(0);
	CLRF       FARG_memoria_i2c_read_dir_mem+0
	CLRF       FARG_memoria_i2c_read_dir_mem+1
	CALL       _memoria_i2c_read+0
	MOVF       R0, 0
	MOVWF      _leido+0
;I2CMEMORIA.c,116 :: 		sprinti(texto,"leido1= %u  \r\n",(unsigned int)leido);
	MOVLW      _TEXTO+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_sprinti_wh+1
	MOVLW      ?lstr_2_I2CMEMORIA+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_2_I2CMEMORIA+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       R0, 0
	MOVWF      FARG_sprinti_wh+4
	CLRF       FARG_sprinti_wh+5
	CALL       _sprinti+0
;I2CMEMORIA.c,117 :: 		UART1_Write_Text(texto);
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;I2CMEMORIA.c,118 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	DECFSZ     R12, 1
	GOTO       L_main2
	NOP
;I2CMEMORIA.c,120 :: 		leido=memoria_i2c_read(1);
	MOVLW      1
	MOVWF      FARG_memoria_i2c_read_dir_mem+0
	MOVLW      0
	MOVWF      FARG_memoria_i2c_read_dir_mem+1
	CALL       _memoria_i2c_read+0
	MOVF       R0, 0
	MOVWF      _leido+0
;I2CMEMORIA.c,121 :: 		sprinti(texto,"leido2= %u  \r\n",(unsigned int)leido);
	MOVLW      _TEXTO+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_sprinti_wh+1
	MOVLW      ?lstr_3_I2CMEMORIA+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_3_I2CMEMORIA+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       R0, 0
	MOVWF      FARG_sprinti_wh+4
	CLRF       FARG_sprinti_wh+5
	CALL       _sprinti+0
;I2CMEMORIA.c,122 :: 		UART1_Write_Text(texto);
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;I2CMEMORIA.c,125 :: 		leido=memoria_i2c_read(2);
	MOVLW      2
	MOVWF      FARG_memoria_i2c_read_dir_mem+0
	MOVLW      0
	MOVWF      FARG_memoria_i2c_read_dir_mem+1
	CALL       _memoria_i2c_read+0
	MOVF       R0, 0
	MOVWF      _leido+0
;I2CMEMORIA.c,126 :: 		sprinti(texto,"leido3= %u  \r\n",(unsigned int)leido);
	MOVLW      _TEXTO+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_sprinti_wh+1
	MOVLW      ?lstr_4_I2CMEMORIA+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_4_I2CMEMORIA+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       R0, 0
	MOVWF      FARG_sprinti_wh+4
	CLRF       FARG_sprinti_wh+5
	CALL       _sprinti+0
;I2CMEMORIA.c,127 :: 		UART1_Write_Text(texto);
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;I2CMEMORIA.c,129 :: 		leido=memoria_i2c_read(3);
	MOVLW      3
	MOVWF      FARG_memoria_i2c_read_dir_mem+0
	MOVLW      0
	MOVWF      FARG_memoria_i2c_read_dir_mem+1
	CALL       _memoria_i2c_read+0
	MOVF       R0, 0
	MOVWF      _leido+0
;I2CMEMORIA.c,130 :: 		sprinti(texto,"leido4= %u  \r\n",(unsigned int)leido);
	MOVLW      _TEXTO+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_sprinti_wh+1
	MOVLW      ?lstr_5_I2CMEMORIA+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_5_I2CMEMORIA+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       R0, 0
	MOVWF      FARG_sprinti_wh+4
	CLRF       FARG_sprinti_wh+5
	CALL       _sprinti+0
;I2CMEMORIA.c,131 :: 		UART1_Write_Text(texto);
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_TEXTO+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;I2CMEMORIA.c,136 :: 		while (1)
L_main3:
;I2CMEMORIA.c,138 :: 		led=!led;
	MOVLW
	XORWF      LATC5_bit+0, 1
;I2CMEMORIA.c,139 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	DECFSZ     R11, 1
	GOTO       L_main5
;I2CMEMORIA.c,141 :: 		}
	GOTO       L_main3
;I2CMEMORIA.c,144 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
