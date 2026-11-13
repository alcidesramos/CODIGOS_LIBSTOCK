
_procesarx:

;MIKROCMYOPENLAB.c,26 :: 		void procesarx()
;MIKROCMYOPENLAB.c,30 :: 		strcpy(captura_rx, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr1_MIKROCMYOPENLAB+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr1_MIKROCMYOPENLAB+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;MIKROCMYOPENLAB.c,31 :: 		strcpy(captura_rx, strtok(0, "/"));  //captura hasta el /  el primer dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr2_MIKROCMYOPENLAB+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr2_MIKROCMYOPENLAB+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;MIKROCMYOPENLAB.c,33 :: 		dato_procesado=atoi(captura_rx);   //captura el primer dato
	MOVLW       _captura_rx+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
;MIKROCMYOPENLAB.c,36 :: 		dato_procesado=dato_procesado*255/100;
	MOVLW       255
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
;MIKROCMYOPENLAB.c,38 :: 		PWM1_set_duty(dato_procesado);// aplica la velocidad al pwm1
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;MIKROCMYOPENLAB.c,41 :: 		strcpy(captura_rx, strtok(0, "/"));  //captura el 2 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr3_MIKROCMYOPENLAB+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr3_MIKROCMYOPENLAB+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;MIKROCMYOPENLAB.c,43 :: 		dato_procesado=atoi(captura_rx);   //captura el segundo dato
	MOVLW       _captura_rx+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
;MIKROCMYOPENLAB.c,45 :: 		dato_procesado=dato_procesado*255/100;
	MOVLW       255
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
;MIKROCMYOPENLAB.c,46 :: 		PWM2_set_duty(dato_procesado);// aplica la velocidad al pwm3
	MOVF        R0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;MIKROCMYOPENLAB.c,48 :: 		strcpy(captura_rx, strtok(0, "/"));  //captura el 3  dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr4_MIKROCMYOPENLAB+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr4_MIKROCMYOPENLAB+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;MIKROCMYOPENLAB.c,50 :: 		dato_procesado=atoi(captura_rx);   //captura el segundo dato
	MOVLW       _captura_rx+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
;MIKROCMYOPENLAB.c,51 :: 		led1=dato_procesado; // entrega al led1
	BTFSC       R0, 0 
	GOTO        L__procesarx26
	BCF         LATB6_bit+0, BitPos(LATB6_bit+0) 
	GOTO        L__procesarx27
L__procesarx26:
	BSF         LATB6_bit+0, BitPos(LATB6_bit+0) 
L__procesarx27:
;MIKROCMYOPENLAB.c,53 :: 		strcpy(captura_rx, strtok(0, "/"));  //captura el 4 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr5_MIKROCMYOPENLAB+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr5_MIKROCMYOPENLAB+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captura_rx+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;MIKROCMYOPENLAB.c,55 :: 		dato_procesado=atoi(captura_rx);   //captura el segundo dato
	MOVLW       _captura_rx+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captura_rx+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
;MIKROCMYOPENLAB.c,56 :: 		led2=dato_procesado; // entrega al led2
	BTFSC       R0, 0 
	GOTO        L__procesarx28
	BCF         LATB7_bit+0, BitPos(LATB7_bit+0) 
	GOTO        L__procesarx29
L__procesarx28:
	BSF         LATB7_bit+0, BitPos(LATB7_bit+0) 
L__procesarx29:
;MIKROCMYOPENLAB.c,59 :: 		}
L_end_procesarx:
	RETURN      0
; end of _procesarx

_interrupcion:

;MIKROCMYOPENLAB.c,62 :: 		void interrupcion() iv 0x0008 ics ICS_AUTO
;MIKROCMYOPENLAB.c,66 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion0
;MIKROCMYOPENLAB.c,69 :: 		datorx=RCREG;  //lee el dato
	MOVF        RCREG+0, 0 
	MOVWF       _datorx+0 
;MIKROCMYOPENLAB.c,72 :: 		switch (estado_rx)
	GOTO        L_interrupcion1
;MIKROCMYOPENLAB.c,74 :: 		case CAP_1I:
L_interrupcion3:
;MIKROCMYOPENLAB.c,75 :: 		if (datorx=='I')
	MOVF        _datorx+0, 0 
	XORLW       73
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion4
;MIKROCMYOPENLAB.c,77 :: 		trama_rx[puntero_rx]=datorx; //lo almacena en la trama
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _datorx+0, 0 
	MOVWF       POSTINC1+0 
;MIKROCMYOPENLAB.c,78 :: 		puntero_rx++; //incrementa el contador de trama
	INCF        _puntero_rx+0, 1 
;MIKROCMYOPENLAB.c,79 :: 		estado_rx=CAP_N;//configura siguiente estado
	MOVLW       1
	MOVWF       _estado_rx+0 
;MIKROCMYOPENLAB.c,81 :: 		}
L_interrupcion4:
;MIKROCMYOPENLAB.c,82 :: 		break;
	GOTO        L_interrupcion2
;MIKROCMYOPENLAB.c,84 :: 		case CAP_N:
L_interrupcion5:
;MIKROCMYOPENLAB.c,85 :: 		if (datorx=='N')
	MOVF        _datorx+0, 0 
	XORLW       78
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion6
;MIKROCMYOPENLAB.c,87 :: 		trama_rx[puntero_rx]=datorx; //lo almacena en la trama
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _datorx+0, 0 
	MOVWF       POSTINC1+0 
;MIKROCMYOPENLAB.c,88 :: 		puntero_rx++; //incrementa el contador de trama
	INCF        _puntero_rx+0, 1 
;MIKROCMYOPENLAB.c,89 :: 		estado_rx=CAP_2I;
	MOVLW       2
	MOVWF       _estado_rx+0 
;MIKROCMYOPENLAB.c,90 :: 		}
	GOTO        L_interrupcion7
L_interrupcion6:
;MIKROCMYOPENLAB.c,93 :: 		estado_rx=CAP_1I; // vuelve al primer estado
	CLRF        _estado_rx+0 
;MIKROCMYOPENLAB.c,94 :: 		puntero_rx=0; //resetea el puntero al inicio del buffer
	CLRF        _puntero_rx+0 
;MIKROCMYOPENLAB.c,95 :: 		}
L_interrupcion7:
;MIKROCMYOPENLAB.c,97 :: 		break;
	GOTO        L_interrupcion2
;MIKROCMYOPENLAB.c,99 :: 		case CAP_2I:
L_interrupcion8:
;MIKROCMYOPENLAB.c,101 :: 		if (datorx=='I')
	MOVF        _datorx+0, 0 
	XORLW       73
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion9
;MIKROCMYOPENLAB.c,103 :: 		trama_rx[puntero_rx]=datorx; //lo almacena en la trama
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _datorx+0, 0 
	MOVWF       POSTINC1+0 
;MIKROCMYOPENLAB.c,104 :: 		puntero_rx++; //incrementa el contador de trama
	INCF        _puntero_rx+0, 1 
;MIKROCMYOPENLAB.c,105 :: 		estado_rx=fin;
	MOVLW       3
	MOVWF       _estado_rx+0 
;MIKROCMYOPENLAB.c,106 :: 		}
	GOTO        L_interrupcion10
L_interrupcion9:
;MIKROCMYOPENLAB.c,109 :: 		estado_rx=CAP_1I; // vuelve al primer estado
	CLRF        _estado_rx+0 
;MIKROCMYOPENLAB.c,110 :: 		puntero_rx=0; //resetea el puntero al inicio del buffer
	CLRF        _puntero_rx+0 
;MIKROCMYOPENLAB.c,111 :: 		}
L_interrupcion10:
;MIKROCMYOPENLAB.c,113 :: 		break;
	GOTO        L_interrupcion2
;MIKROCMYOPENLAB.c,115 :: 		case fin:
L_interrupcion11:
;MIKROCMYOPENLAB.c,117 :: 		trama_rx[puntero_rx]=datorx; //lo almacena en la trama
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _datorx+0, 0 
	MOVWF       POSTINC1+0 
;MIKROCMYOPENLAB.c,118 :: 		puntero_rx++; //incrementa el contador de trama
	INCF        _puntero_rx+0, 1 
;MIKROCMYOPENLAB.c,119 :: 		if (puntero_rx>=40) // si supera tamaño del buffer
	MOVLW       40
	SUBWF       _puntero_rx+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion12
;MIKROCMYOPENLAB.c,121 :: 		puntero_rx=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
	CLRF        _puntero_rx+0 
;MIKROCMYOPENLAB.c,122 :: 		estado_rx=CAP_1I;// retorna al estado de origen
	CLRF        _estado_rx+0 
;MIKROCMYOPENLAB.c,124 :: 		}
L_interrupcion12:
;MIKROCMYOPENLAB.c,126 :: 		if (datorx=='*')  //Si llega el fin de la trama
	MOVF        _datorx+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion13
;MIKROCMYOPENLAB.c,129 :: 		RCIE_bit=0; //deshabilita la interrucion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;MIKROCMYOPENLAB.c,130 :: 		estado_rx=CAP_1I;// retorna al estado de origen
	CLRF        _estado_rx+0 
;MIKROCMYOPENLAB.c,131 :: 		flag_rx=1;  //activa la bandera de que hat una trama valida
	MOVLW       1
	MOVWF       _flag_rx+0 
;MIKROCMYOPENLAB.c,133 :: 		}
L_interrupcion13:
;MIKROCMYOPENLAB.c,136 :: 		break;
	GOTO        L_interrupcion2
;MIKROCMYOPENLAB.c,139 :: 		}// fin del switch
L_interrupcion1:
	MOVF        _estado_rx+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion3
	MOVF        _estado_rx+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion5
	MOVF        _estado_rx+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion8
	MOVF        _estado_rx+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion11
L_interrupcion2:
;MIKROCMYOPENLAB.c,143 :: 		if (OERR_bit==1)
	BTFSS       OERR_bit+0, BitPos(OERR_bit+0) 
	GOTO        L_interrupcion14
;MIKROCMYOPENLAB.c,145 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;MIKROCMYOPENLAB.c,146 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;MIKROCMYOPENLAB.c,147 :: 		}
L_interrupcion14:
;MIKROCMYOPENLAB.c,150 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;MIKROCMYOPENLAB.c,152 :: 		}
L_interrupcion0:
;MIKROCMYOPENLAB.c,157 :: 		}
L_end_interrupcion:
L__interrupcion31:
	RETFIE      1
; end of _interrupcion

_main:

;MIKROCMYOPENLAB.c,160 :: 		void main()
;MIKROCMYOPENLAB.c,164 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MIKROCMYOPENLAB.c,166 :: 		ADCON1=0b1101;    // analogo ra0 y ra1
	MOVLW       13
	MOVWF       ADCON1+0 
;MIKROCMYOPENLAB.c,169 :: 		TRISA=0;
	CLRF        TRISA+0 
;MIKROCMYOPENLAB.c,170 :: 		TRISB=0;
	CLRF        TRISB+0 
;MIKROCMYOPENLAB.c,171 :: 		TRISC=0;
	CLRF        TRISC+0 
;MIKROCMYOPENLAB.c,174 :: 		TRISA0_bit=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;MIKROCMYOPENLAB.c,175 :: 		TRISA1_bit=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;MIKROCMYOPENLAB.c,179 :: 		TRISB0_bit=1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;MIKROCMYOPENLAB.c,180 :: 		TRISB1_bit=1;
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;MIKROCMYOPENLAB.c,185 :: 		TRISC7_bit=1;
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;MIKROCMYOPENLAB.c,187 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MIKROCMYOPENLAB.c,189 :: 		PWM1_Init(260);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       240
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;MIKROCMYOPENLAB.c,190 :: 		PWM1_Init(260);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       240
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;MIKROCMYOPENLAB.c,191 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;MIKROCMYOPENLAB.c,192 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;MIKROCMYOPENLAB.c,193 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;MIKROCMYOPENLAB.c,194 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;MIKROCMYOPENLAB.c,197 :: 		INTCON=0B01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;MIKROCMYOPENLAB.c,199 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;MIKROCMYOPENLAB.c,200 :: 		RCIE_bit=1; //habi intt serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;MIKROCMYOPENLAB.c,202 :: 		RCEN_bit=0;// limpia errores en el buffer de recepcion
	BCF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;MIKROCMYOPENLAB.c,203 :: 		RCEN_bit=1;  // habilita interrpcion continua
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;MIKROCMYOPENLAB.c,205 :: 		GIE_bit=1;// Autoriza las interurpciones
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MIKROCMYOPENLAB.c,208 :: 		while(1)
L_main15:
;MIKROCMYOPENLAB.c,210 :: 		codigo=ADC_Get_Sample(0);
	CLRF        FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;MIKROCMYOPENLAB.c,211 :: 		temperatura=codigo*500.0/1023.0;
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
;MIKROCMYOPENLAB.c,212 :: 		Delay_us(100);
	MOVLW       33
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
;MIKROCMYOPENLAB.c,214 :: 		codigo=ADC_Get_Sample(1);
	MOVLW       1
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;MIKROCMYOPENLAB.c,215 :: 		voltaje=codigo*5.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
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
	MOVWF       _voltaje+0 
	MOVF        R1, 0 
	MOVWF       _voltaje+1 
	MOVF        R2, 0 
	MOVWF       _voltaje+2 
	MOVF        R3, 0 
	MOVWF       _voltaje+3 
;MIKROCMYOPENLAB.c,216 :: 		Delay_us(100);
	MOVLW       33
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
;MIKROCMYOPENLAB.c,219 :: 		if (pul1==0) led1_O=1; else led1_O=0;
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main19
	MOVLW       1
	MOVWF       _led1_O+0 
	MOVLW       0
	MOVWF       _led1_O+1 
	GOTO        L_main20
L_main19:
	CLRF        _led1_O+0 
	CLRF        _led1_O+1 
L_main20:
;MIKROCMYOPENLAB.c,220 :: 		if (pul2==0) led2_O=1; else led2_O=0;
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main21
	MOVLW       1
	MOVWF       _led2_O+0 
	MOVLW       0
	MOVWF       _led2_O+1 
	GOTO        L_main22
L_main21:
	CLRF        _led2_O+0 
	CLRF        _led2_O+1 
L_main22:
;MIKROCMYOPENLAB.c,224 :: 		sprintf(trama_tx,"/%5.1f/%3.1f/%1u/%1u/",temperatura,voltaje,led1_O,led2_O);
	MOVLW       _trama_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_6_MIKROCMYOPENLAB+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_6_MIKROCMYOPENLAB+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_6_MIKROCMYOPENLAB+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _voltaje+0, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _voltaje+1, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _voltaje+2, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _voltaje+3, 0 
	MOVWF       FARG_sprintf_wh+12 
	MOVF        _led1_O+0, 0 
	MOVWF       FARG_sprintf_wh+13 
	MOVF        _led1_O+1, 0 
	MOVWF       FARG_sprintf_wh+14 
	MOVF        _led2_O+0, 0 
	MOVWF       FARG_sprintf_wh+15 
	MOVF        _led2_O+1, 0 
	MOVWF       FARG_sprintf_wh+16 
	CALL        _sprintf+0, 0
;MIKROCMYOPENLAB.c,225 :: 		UART1_Write_Text(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MIKROCMYOPENLAB.c,227 :: 		if (flag_rx==1) // si hay dato para procesar
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;MIKROCMYOPENLAB.c,229 :: 		procesarx();  // llama al procedimiento de procesar la trama
	CALL        _procesarx+0, 0
;MIKROCMYOPENLAB.c,230 :: 		puntero_rx=0; //inicializa el conteo
	CLRF        _puntero_rx+0 
;MIKROCMYOPENLAB.c,231 :: 		memset(trama_rx,0,40); //limpia la trama
	MOVLW       _trama_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       40
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;MIKROCMYOPENLAB.c,232 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;MIKROCMYOPENLAB.c,233 :: 		RCIF_bit=0;    //limpia la bandera de la interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;MIKROCMYOPENLAB.c,234 :: 		CREN_bit=0;  // limpia errores
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;MIKROCMYOPENLAB.c,235 :: 		CREN_bit=1;   // habilita la recepcion continua
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;MIKROCMYOPENLAB.c,237 :: 		RCIE_bit=1;   //habilita la Interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;MIKROCMYOPENLAB.c,239 :: 		}
L_main23:
;MIKROCMYOPENLAB.c,244 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	NOP
	NOP
;MIKROCMYOPENLAB.c,247 :: 		}
	GOTO        L_main15
;MIKROCMYOPENLAB.c,250 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
