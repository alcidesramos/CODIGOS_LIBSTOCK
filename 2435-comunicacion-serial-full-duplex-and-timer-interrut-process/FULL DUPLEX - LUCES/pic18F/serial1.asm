
_m1derecha:

;serial1.c,44 :: 		void m1derecha()
;serial1.c,46 :: 		m11=1;
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;serial1.c,47 :: 		m12=0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;serial1.c,48 :: 		}
L_end_m1derecha:
	RETURN      0
; end of _m1derecha

_m1izquierda:

;serial1.c,50 :: 		void m1izquierda()
;serial1.c,52 :: 		m11=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;serial1.c,53 :: 		m12=1;
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;serial1.c,54 :: 		}
L_end_m1izquierda:
	RETURN      0
; end of _m1izquierda

_m1quieto:

;serial1.c,56 :: 		void m1quieto()
;serial1.c,58 :: 		m11=0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;serial1.c,59 :: 		m12=0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;serial1.c,60 :: 		}
L_end_m1quieto:
	RETURN      0
; end of _m1quieto

_procesarx:

;serial1.c,62 :: 		void procesarx()
;serial1.c,64 :: 		if (strstr(trama,"led1="))
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
;serial1.c,66 :: 		if (strstr(trama,"on")) led1=1;
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
	BSF         LATC5_bit+0, BitPos(LATC5_bit+0) 
	GOTO        L_procesarx2
L_procesarx1:
;serial1.c,67 :: 		else led1=0;
	BCF         LATC5_bit+0, BitPos(LATC5_bit+0) 
L_procesarx2:
;serial1.c,68 :: 		}
	GOTO        L_procesarx3
L_procesarx0:
;serial1.c,70 :: 		else if (strstr(trama,"led2="))
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
;serial1.c,72 :: 		if (strstr(trama,"on")) led2=1;
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
	BSF         LATC4_bit+0, BitPos(LATC4_bit+0) 
	GOTO        L_procesarx6
L_procesarx5:
;serial1.c,73 :: 		else led2=0;
	BCF         LATC4_bit+0, BitPos(LATC4_bit+0) 
L_procesarx6:
;serial1.c,74 :: 		}
	GOTO        L_procesarx7
L_procesarx4:
;serial1.c,76 :: 		else if (strstr(trama,"m1der"))  m1derecha();
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
;serial1.c,78 :: 		else if (strstr(trama,"m1izq"))  m1izquierda();
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
;serial1.c,80 :: 		else if (strstr(trama,"m1stop"))  m1quieto();
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
;serial1.c,82 :: 		else if (strstr(trama,"m1pwm="))
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
;serial1.c,84 :: 		strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
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
;serial1.c,85 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
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
;serial1.c,87 :: 		dato=atoi(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _dato+0 
;serial1.c,88 :: 		PWM1_Set_Duty(dato);// aplica la velocidad al pwm
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;serial1.c,91 :: 		}
L_procesarx14:
L_procesarx13:
L_procesarx11:
L_procesarx9:
L_procesarx7:
L_procesarx3:
;serial1.c,94 :: 		}
L_end_procesarx:
	RETURN      0
; end of _procesarx

_Interrpcion:

;serial1.c,99 :: 		void Interrpcion() iv 0x0008 ics ICS_AUTO
;serial1.c,103 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_Interrpcion15
;serial1.c,105 :: 		datorx=UART1_Read();  //lee el dato
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datorx+0 
;serial1.c,106 :: 		trama[puntero]=datorx; //lo almacena en la trama
	MOVLW       _trama+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FSR1H 
	MOVF        _puntero+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;serial1.c,107 :: 		puntero++; //incrementa el contador de trama
	INCF        _puntero+0, 1 
;serial1.c,108 :: 		if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
	MOVLW       30
	SUBWF       _puntero+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Interrpcion16
	CLRF        _puntero+0 
L_Interrpcion16:
;serial1.c,109 :: 		if (datorx=='*')  //Si llega el fin de la trama
	MOVF        _datorx+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrpcion17
;serial1.c,111 :: 		RCIE_bit=0; //deshabilita la interrucion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;serial1.c,112 :: 		flag_rx=1;  //activa la bandera de que hat una trama valida
	MOVLW       1
	MOVWF       _flag_rx+0 
;serial1.c,114 :: 		}
L_Interrpcion17:
;serial1.c,115 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;serial1.c,117 :: 		}    //FIN INTERRPCION SERIAL
L_Interrpcion15:
;serial1.c,119 :: 		if (TMR1IF_bit)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_Interrpcion18
;serial1.c,121 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;serial1.c,122 :: 		TMR1H	 = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;serial1.c,123 :: 		TMR1L	 = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;serial1.c,126 :: 		veces++;
	INFSNZ      _veces+0, 1 
	INCF        _veces+1, 1 
;serial1.c,127 :: 		if (veces>=10) // un segundo
	MOVLW       0
	SUBWF       _veces+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrpcion33
	MOVLW       10
	SUBWF       _veces+0, 0 
L__Interrpcion33:
	BTFSS       STATUS+0, 0 
	GOTO        L_Interrpcion19
;serial1.c,130 :: 		sacar=luces[recorre];
	MOVLW       _luces+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_luces+0)
	MOVWF       FSR0H 
	MOVF        _recorre+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _sacar+0 
;serial1.c,131 :: 		sacar=sacar<<1;// rota uno a la izquierda porque empieza desde pc1
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       _sacar+0 
;serial1.c,132 :: 		LATA= sacar;
	MOVF        R0, 0 
	MOVWF       LATA+0 
;serial1.c,133 :: 		recorre++;
	INCF        _recorre+0, 1 
;serial1.c,134 :: 		if (recorre>=4) recorre=0;  //limite del vector
	MOVLW       4
	SUBWF       _recorre+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Interrpcion20
	CLRF        _recorre+0 
L_Interrpcion20:
;serial1.c,135 :: 		veces=0;
	CLRF        _veces+0 
	CLRF        _veces+1 
;serial1.c,137 :: 		}
L_Interrpcion19:
;serial1.c,139 :: 		}
L_Interrpcion18:
;serial1.c,143 :: 		}
L_end_Interrpcion:
L__Interrpcion32:
	RETFIE      1
; end of _Interrpcion

_InitTimer1:

;serial1.c,145 :: 		void InitTimer1(){
;serial1.c,146 :: 		T1CON	 = 0x11;
	MOVLW       17
	MOVWF       T1CON+0 
;serial1.c,147 :: 		TMR1IF_bit	 = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;serial1.c,148 :: 		TMR1H	 = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;serial1.c,149 :: 		TMR1L	 = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;serial1.c,150 :: 		TMR1IE_bit	 = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;serial1.c,151 :: 		INTCON	 = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;serial1.c,152 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_main:

;serial1.c,156 :: 		void main()
;serial1.c,160 :: 		uart1_init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;serial1.c,161 :: 		trisb.b0=0;//salida m11
	BCF         TRISB+0, 0 
;serial1.c,162 :: 		trisb.b1=0;//salida m12
	BCF         TRISB+0, 1 
;serial1.c,163 :: 		trisc.b2=0; //salida pin PWM
	BCF         TRISC+0, 2 
;serial1.c,164 :: 		trisc.B4=0; //salida led2
	BCF         TRISC+0, 4 
;serial1.c,165 :: 		trisc.b5=0; //salida led 1
	BCF         TRISC+0, 5 
;serial1.c,166 :: 		trisc.b3=0; //salida led 3
	BCF         TRISC+0, 3 
;serial1.c,168 :: 		trisb.b7=1; //entrada del suiche
	BSF         TRISB+0, 7 
;serial1.c,170 :: 		trisa=0; //todo a salida
	CLRF        TRISA+0 
;serial1.c,171 :: 		trisa.B0=1;  //entrada del sensor lm35
	BSF         TRISA+0, 0 
;serial1.c,175 :: 		ANSEL=0;
	CLRF        ANSEL+0 
;serial1.c,176 :: 		ANSELH=0;
	CLRF        ANSELH+0 
;serial1.c,178 :: 		ANSEL.AN0=1; //el canal an0 es analogo
	BSF         ANSEL+0, 0 
;serial1.c,181 :: 		pwm1_init(300);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       208
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;serial1.c,182 :: 		PWM1_Set_Duty(100);//inia un valor inicial en el pwm
	MOVLW       100
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;serial1.c,183 :: 		PWM1_Start();// prende el modulo pwm
	CALL        _PWM1_Start+0, 0
;serial1.c,186 :: 		m1quieto();
	CALL        _m1quieto+0, 0
;serial1.c,187 :: 		led1=0;
	BCF         LATC5_bit+0, BitPos(LATC5_bit+0) 
;serial1.c,188 :: 		led2=0;
	BCF         LATC4_bit+0, BitPos(LATC4_bit+0) 
;serial1.c,190 :: 		INTCON=0b01000000;//habilita interrpciones de perifericos
	MOVLW       64
	MOVWF       INTCON+0 
;serial1.c,191 :: 		RCIF_bit=0; //limpia bandesta interrpcion serial
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;serial1.c,192 :: 		RCIE_bit=1; // habilite la interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;serial1.c,194 :: 		GIE_bit=1; //autoriza todas las interrepciones programadas
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;serial1.c,197 :: 		InitTimer1();
	CALL        _InitTimer1+0, 0
;serial1.c,199 :: 		while (1)
L_main21:
;serial1.c,202 :: 		if (flag_rx==1)
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;serial1.c,205 :: 		procesarx();  // llama al procedimiento de procesar la trama
	CALL        _procesarx+0, 0
;serial1.c,206 :: 		puntero=0; //inicializa el conteo
	CLRF        _puntero+0 
;serial1.c,207 :: 		memset(trama,0,30); //limpia la trama
	MOVLW       _trama+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       30
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;serial1.c,208 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;serial1.c,209 :: 		RCIF_bit=0;    //limpia la bandera de la interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;serial1.c,210 :: 		RCIE_bit=1;   //habilita la Interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;serial1.c,211 :: 		}
L_main23:
;serial1.c,213 :: 		codigo=ADC_Read(0);//lee el canal analogo cero
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;serial1.c,214 :: 		temperatura=codigo*500.0/1023.0;// calcula la temperatura
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
;serial1.c,220 :: 		sprintf(texto,"temp=%.2f/",temperatura);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_11_serial1+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_11_serial1+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_11_serial1+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;serial1.c,221 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial1.c,223 :: 		if (suiche==1) UART1_Write_Text("led=on/");
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main24
	MOVLW       ?lstr12_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	GOTO        L_main25
L_main24:
;serial1.c,224 :: 		else UART1_Write_Text("led=off/");
	MOVLW       ?lstr13_serial1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_serial1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
L_main25:
;serial1.c,227 :: 		led3=~led3;
	BTG         LATC3_bit+0, BitPos(LATC3_bit+0) 
;serial1.c,228 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	NOP
;serial1.c,233 :: 		}
	GOTO        L_main21
;serial1.c,238 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
