
_m1derecha:

;serial1.c,36 :: 		void m1derecha()
;serial1.c,38 :: 		m11=1;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;serial1.c,39 :: 		m12=0;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;serial1.c,40 :: 		}
L_end_m1derecha:
	RETURN      0
; end of _m1derecha

_m1izquierda:

;serial1.c,42 :: 		void m1izquierda()
;serial1.c,44 :: 		m11=0;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;serial1.c,45 :: 		m12=1;
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
;serial1.c,46 :: 		}
L_end_m1izquierda:
	RETURN      0
; end of _m1izquierda

_m1quieto:

;serial1.c,48 :: 		void m1quieto()
;serial1.c,50 :: 		m11=0;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;serial1.c,51 :: 		m12=0;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;serial1.c,52 :: 		}
L_end_m1quieto:
	RETURN      0
; end of _m1quieto

_procesarx:

;serial1.c,54 :: 		void procesarx()
;serial1.c,56 :: 		if (strstr(trama,"led1="))
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx0
;serial1.c,58 :: 		if (strstr(trama,"on")) led1=1;
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr2_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr2_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx1
	BSF         RC5_bit+0, BitPos(RC5_bit+0) 
	GOTO        L_procesarx2
L_procesarx1:
;serial1.c,59 :: 		else led1=0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
L_procesarx2:
;serial1.c,60 :: 		}
	GOTO        L_procesarx3
L_procesarx0:
;serial1.c,62 :: 		else if (strstr(trama,"led2="))
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr3_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr3_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx4
;serial1.c,64 :: 		if (strstr(trama,"on")) led2=1;
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr4_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr4_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx5
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L_procesarx6
L_procesarx5:
;serial1.c,65 :: 		else led2=0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
L_procesarx6:
;serial1.c,66 :: 		}
	GOTO        L_procesarx7
L_procesarx4:
;serial1.c,68 :: 		else if (strstr(trama,"m1der"))  m1derecha();
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr5_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr5_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx8
	CALL        _m1derecha+0, 0
	GOTO        L_procesarx9
L_procesarx8:
;serial1.c,70 :: 		else if (strstr(trama,"m1izq"))  m1izquierda();
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr6_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr6_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx10
	CALL        _m1izquierda+0, 0
	GOTO        L_procesarx11
L_procesarx10:
;serial1.c,72 :: 		else if (strstr(trama,"m1stop"))  m1quieto();
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr7_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr7_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx12
	CALL        _m1quieto+0, 0
	GOTO        L_procesarx13
L_procesarx12:
;serial1.c,74 :: 		else if (strstr(trama,"m1pwm="))
	MOVLW       _trama+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr8_serial1+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr8_serial1+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx14
;serial1.c,76 :: 		strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
	MOVLW       _trama+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr9_serial1+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr9_serial1+0)
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
;serial1.c,77 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr10_serial1+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr10_serial1+0)
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
;serial1.c,79 :: 		dato=atoi(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _dato+0 
;serial1.c,80 :: 		PWM1_Set_Duty(dato);// aplica la velocidad al pwm
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;serial1.c,83 :: 		}
L_procesarx14:
L_procesarx13:
L_procesarx11:
L_procesarx9:
L_procesarx7:
L_procesarx3:
;serial1.c,86 :: 		}
L_end_procesarx:
	RETURN      0
; end of _procesarx

_Interrpcion:

;serial1.c,89 :: 		void Interrpcion() iv 0x0008 ics ICS_AUTO
;serial1.c,93 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_Interrpcion15
;serial1.c,95 :: 		datorx=UART1_Read();  //lee el dato
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datorx+0 
;serial1.c,96 :: 		trama[puntero]=datorx; //lo almacena en la trama
	MOVLW       _trama+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;serial1.c,97 :: 		puntero++; //incrementa el contador de trama
	INCF        _puntero+0, 1 
;serial1.c,98 :: 		if (puntero>=100) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
	MOVLW       100
	SUBWF       _puntero+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Interrpcion16
	CLRF        _puntero+0 
L_Interrpcion16:
;serial1.c,99 :: 		if (datorx=='*')  //Si llega el fin de la trama
	MOVF        _datorx+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrpcion17
;serial1.c,101 :: 		RCIE_bit=0; //deshabilita la interrucion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;serial1.c,102 :: 		flag_rx=1;  //activa la bandera de que hat una trama valida
	MOVLW       1
	MOVWF       _flag_rx+0 
;serial1.c,104 :: 		}
L_Interrpcion17:
;serial1.c,105 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;serial1.c,107 :: 		}
L_Interrpcion15:
;serial1.c,111 :: 		}
L_end_Interrpcion:
L__Interrpcion35:
	RETFIE      1
; end of _Interrpcion

_main:

;serial1.c,114 :: 		void main()
;serial1.c,118 :: 		uart1_init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;serial1.c,119 :: 		trisb.b0=0;//salida m11
	BCF         TRISB+0, 0 
;serial1.c,120 :: 		trisb.b1=0;//salida m12
	BCF         TRISB+0, 1 
;serial1.c,121 :: 		trisc.b2=0; //salida pin PWM
	BCF         TRISC+0, 2 
;serial1.c,122 :: 		trisc.B4=0; //salida led2
	BCF         TRISC+0, 4 
;serial1.c,123 :: 		trisc.b5=0; //salida led 1
	BCF         TRISC+0, 5 
;serial1.c,124 :: 		trisc.b3=0; //salida led 3
	BCF         TRISC+0, 3 
;serial1.c,126 :: 		trisb.b7=1; //entrada del suiche
	BSF         TRISB+0, 7 
;serial1.c,128 :: 		trisa.B0=1;  //entrada del sensor lm35
	BSF         TRISA+0, 0 
;serial1.c,132 :: 		ANSEL=0;
	CLRF        ANSEL+0 
;serial1.c,133 :: 		ANSELH=0;
	CLRF        ANSELH+0 
;serial1.c,135 :: 		ANSEL.AN0=1; //el canal an0 es analogo
	BSF         ANSEL+0, 0 
;serial1.c,138 :: 		pwm1_init(1250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;serial1.c,139 :: 		PWM1_Set_Duty(100);//inia un valor inicial en el pwm
	MOVLW       100
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;serial1.c,140 :: 		PWM1_Start();// prende el modulo pwm
	CALL        _PWM1_Start+0, 0
;serial1.c,143 :: 		m1quieto();
	CALL        _m1quieto+0, 0
;serial1.c,144 :: 		led1=0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;serial1.c,145 :: 		led2=0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;serial1.c,147 :: 		UART1_Write_Text("ATE0\r\n"); //SIN ECO
	MOVLW       ?lstr11_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,148 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
	NOP
;serial1.c,151 :: 		UART1_Write_Text("AT+CWMODE=2\r\n"); //ACTUA COMO  ROUTER CREA UNA RED PROPIA
	MOVLW       ?lstr12_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,152 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
	NOP
;serial1.c,156 :: 		UART1_Write_Text("AT+CIPSERVER=0\r\n");  //cierra sevidores
	MOVLW       ?lstr13_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,157 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
	NOP
	NOP
;serial1.c,158 :: 		UART1_Write_Text("AT+CIPMUX=0\r\n");   //pone conexion un unica
	MOVLW       ?lstr14_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,159 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;serial1.c,162 :: 		UART1_Write_Text("AT+CIPMODE=0\r\n"); //Trabaja en modo normal
	MOVLW       ?lstr15_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,163 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
;serial1.c,165 :: 		UART1_Write_Text("AT+CWSAP=\"ESP8266_ARZ\",\"noconectar\",5,3\r\n");
	MOVLW       ?lstr16_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,166 :: 		Delay_ms(600);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
	NOP
;serial1.c,168 :: 		UART1_Write_Text("AT+CIPAP=\"192.168.1.254\"\r\n");
	MOVLW       ?lstr17_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,169 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	DECFSZ      R11, 1, 1
	BRA         L_main24
	NOP
	NOP
;serial1.c,172 :: 		UART1_Write_Text("AT+CIPMUX=1\r\n");  //habilita multiples conexiones
	MOVLW       ?lstr18_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr18_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,173 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
	NOP
;serial1.c,176 :: 		UART1_Write_Text("AT+CIPSERVER=1,200\r\n");
	MOVLW       ?lstr19_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr19_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,177 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
	NOP
;serial1.c,180 :: 		UART1_Write_Text("AT+CIPSTO=0\r\n");    //0  siempre(todo el tiempo)
	MOVLW       ?lstr20_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr20_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,186 :: 		INTCON=0b01000000;//habilita interrpciones de perifericos
	MOVLW       64
	MOVWF       INTCON+0 
;serial1.c,187 :: 		RCIF_bit=0; //limpia bandesta interrpcion serial
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;serial1.c,188 :: 		RCIE_bit=1; // habilite la interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;serial1.c,190 :: 		GIE_bit=1; //autoriza todas las interrepciones programadas
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;serial1.c,195 :: 		while (1)
L_main27:
;serial1.c,198 :: 		if (flag_rx==1)
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
;serial1.c,201 :: 		procesarx();  // llama al procedimiento de procesar la trama
	CALL        _procesarx+0, 0
;serial1.c,202 :: 		puntero=0; //inicializa el conteo
	CLRF        _puntero+0 
;serial1.c,203 :: 		memset(trama,0,100); //limpia la trama
	MOVLW       _trama+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       100
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;serial1.c,204 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;serial1.c,205 :: 		RCIF_bit=0;    //limpia la bandera de la interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;serial1.c,206 :: 		RCIE_bit=1;   //habilita la Interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;serial1.c,207 :: 		}
L_main29:
;serial1.c,210 :: 		}
	GOTO        L_main27
;serial1.c,215 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
