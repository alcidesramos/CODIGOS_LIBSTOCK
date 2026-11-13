
_md_quieto:

;evasor.c,40 :: 		void   md_quieto()
;evasor.c,42 :: 		MD1=0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;evasor.c,43 :: 		MD2=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;evasor.c,44 :: 		}
L_end_md_quieto:
	RETURN      0
; end of _md_quieto

_md_adelante:

;evasor.c,47 :: 		void   md_adelante()
;evasor.c,49 :: 		MD1=1;
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;evasor.c,50 :: 		MD2=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;evasor.c,51 :: 		}
L_end_md_adelante:
	RETURN      0
; end of _md_adelante

_md_atras:

;evasor.c,54 :: 		void   md_atras()
;evasor.c,56 :: 		MD1=0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;evasor.c,57 :: 		MD2=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;evasor.c,58 :: 		}
L_end_md_atras:
	RETURN      0
; end of _md_atras

_mi_quieto:

;evasor.c,61 :: 		void   mi_quieto()
;evasor.c,63 :: 		MI1=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;evasor.c,64 :: 		MI2=0;
	BCF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;evasor.c,65 :: 		}
L_end_mi_quieto:
	RETURN      0
; end of _mi_quieto

_mi_adelante:

;evasor.c,68 :: 		void   mi_adelante()
;evasor.c,70 :: 		MI1=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;evasor.c,71 :: 		MI2=1;
	BSF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;evasor.c,72 :: 		}
L_end_mi_adelante:
	RETURN      0
; end of _mi_adelante

_mi_atras:

;evasor.c,76 :: 		void   mi_atras()
;evasor.c,78 :: 		MI1=1;
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;evasor.c,79 :: 		MI2=0;
	BCF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;evasor.c,80 :: 		}
L_end_mi_atras:
	RETURN      0
; end of _mi_atras

_quieto:

;evasor.c,86 :: 		void quieto()
;evasor.c,88 :: 		md_quieto();
	CALL        _md_quieto+0, 0
;evasor.c,89 :: 		mi_quieto();
	CALL        _mi_quieto+0, 0
;evasor.c,90 :: 		}
L_end_quieto:
	RETURN      0
; end of _quieto

_adelante:

;evasor.c,93 :: 		void adelante(unsigned char velo)
;evasor.c,96 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,97 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,98 :: 		md_adelante();
	CALL        _md_adelante+0, 0
;evasor.c,99 :: 		mi_adelante();
	CALL        _mi_adelante+0, 0
;evasor.c,101 :: 		}
L_end_adelante:
	RETURN      0
; end of _adelante

_atras:

;evasor.c,104 :: 		void atras(unsigned char velo)
;evasor.c,106 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,107 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,108 :: 		md_atras();
	CALL        _md_atras+0, 0
;evasor.c,109 :: 		mi_atras();
	CALL        _mi_atras+0, 0
;evasor.c,110 :: 		}
L_end_atras:
	RETURN      0
; end of _atras

_derecha:

;evasor.c,113 :: 		void derecha(unsigned char velo)
;evasor.c,115 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,116 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,117 :: 		mi_adelante();
	CALL        _mi_adelante+0, 0
;evasor.c,118 :: 		md_atras();
	CALL        _md_atras+0, 0
;evasor.c,119 :: 		}
L_end_derecha:
	RETURN      0
; end of _derecha

_izquierda:

;evasor.c,122 :: 		void izquierda(unsigned char velo)
;evasor.c,124 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,125 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,127 :: 		md_adelante();
	CALL        _md_adelante+0, 0
;evasor.c,128 :: 		mi_atras();
	CALL        _mi_atras+0, 0
;evasor.c,129 :: 		}
L_end_izquierda:
	RETURN      0
; end of _izquierda

_LEEBIT:

;evasor.c,135 :: 		char LEEBIT (char *port, char bit1)
;evasor.c,138 :: 		if ((*port & (1 << bit1))>0) return (1);
	MOVF        FARG_LEEBIT_bit1+0, 0 
	MOVWF       R2 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__LEEBIT28:
	BZ          L__LEEBIT29
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__LEEBIT28
L__LEEBIT29:
	MOVFF       FARG_LEEBIT_port+0, FSR0L+0
	MOVFF       FARG_LEEBIT_port+1, FSR0H+0
	MOVF        R0, 0 
	ANDWF       POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       0
	ANDWF       R1, 0 
	MOVWF       R3 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LEEBIT30
	MOVF        R2, 0 
	SUBLW       0
L__LEEBIT30:
	BTFSC       STATUS+0, 0 
	GOTO        L_LEEBIT0
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_LEEBIT
L_LEEBIT0:
;evasor.c,139 :: 		else return (0);
	CLRF        R0 
;evasor.c,140 :: 		}
L_end_LEEBIT:
	RETURN      0
; end of _LEEBIT

_lee_distancia:

;evasor.c,142 :: 		float lee_distancia(char *puerto,char pin)  //lee en el pin especificado
;evasor.c,148 :: 		disparo=1;
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;evasor.c,149 :: 		Delay_us(10);
	MOVLW       3
	MOVWF       R13, 0
L_lee_distancia2:
	DECFSZ      R13, 1, 1
	BRA         L_lee_distancia2
;evasor.c,150 :: 		disparo=0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;evasor.c,153 :: 		TMR1ON_bit=0; //TIMER QUIETO
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,154 :: 		TMR1L=0;// limpia parte baja
	CLRF        TMR1L+0 
;evasor.c,155 :: 		TMR1h=0; //limpia parte alta
	CLRF        TMR1H+0 
;evasor.c,156 :: 		TMR1IF_bit=0; //limpia la bandera de desboradmiento
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;evasor.c,157 :: 		TMR1ON_bit=1; //Arranca el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,159 :: 		while (LEEBIT(puerto,pin)==0)
L_lee_distancia3:
	MOVF        FARG_lee_distancia_puerto+0, 0 
	MOVWF       FARG_LEEBIT_port+0 
	MOVF        FARG_lee_distancia_puerto+1, 0 
	MOVWF       FARG_LEEBIT_port+1 
	MOVF        FARG_lee_distancia_pin+0, 0 
	MOVWF       FARG_LEEBIT_bit1+0 
	CALL        _LEEBIT+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_distancia4
;evasor.c,162 :: 		if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_lee_distancia5
;evasor.c,165 :: 		return (-1);// si no hay sensor conectado retorna -1
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	GOTO        L_end_lee_distancia
;evasor.c,167 :: 		}
L_lee_distancia5:
;evasor.c,168 :: 		}
	GOTO        L_lee_distancia3
L_lee_distancia4:
;evasor.c,170 :: 		TMR1ON_bit=0; //TIMER QUIETO
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,171 :: 		TMR1L=0;// limpia parte baja
	CLRF        TMR1L+0 
;evasor.c,172 :: 		TMR1h=0; //limpia parte alta
	CLRF        TMR1H+0 
;evasor.c,173 :: 		TMR1IF_bit=0; //limpia la bandera de desboradmiento
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;evasor.c,174 :: 		TMR1ON_bit=1; //Arranca el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,175 :: 		while (LEEBIT(puerto,pin)==1)
L_lee_distancia6:
	MOVF        FARG_lee_distancia_puerto+0, 0 
	MOVWF       FARG_LEEBIT_port+0 
	MOVF        FARG_lee_distancia_puerto+1, 0 
	MOVWF       FARG_LEEBIT_port+1 
	MOVF        FARG_lee_distancia_pin+0, 0 
	MOVWF       FARG_LEEBIT_bit1+0 
	CALL        _LEEBIT+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_distancia7
;evasor.c,177 :: 		if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_lee_distancia8
;evasor.c,179 :: 		return (0);// si no hay eco
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	GOTO        L_end_lee_distancia
;evasor.c,181 :: 		}
L_lee_distancia8:
;evasor.c,182 :: 		}
	GOTO        L_lee_distancia6
L_lee_distancia7:
;evasor.c,184 :: 		TMR1ON_bit=0; //paro timer
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,185 :: 		contador=(TMR1H <<8) |  TMR1L;   // arma el valor del timer rotando 8 la parte alta y sumando la baja
	MOVF        TMR1H+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        TMR1L+0, 0 
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _contador+0 
	MOVF        R1, 0 
	MOVWF       _contador+1 
;evasor.c,187 :: 		calculo=(float) contador*1.0/(Frec_real) ;   //1.0 prescalador de 1
	CALL        _word2double+0, 0
;evasor.c,188 :: 		calculo=calculo/58.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       104
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;evasor.c,189 :: 		return (calculo);
;evasor.c,190 :: 		}
L_end_lee_distancia:
	RETURN      0
; end of _lee_distancia

_sonar:

;evasor.c,192 :: 		void sonar()
;evasor.c,194 :: 		distancia=lee_distancia(&PORTB,eco);
	MOVLW       PORTB+0
	MOVWF       FARG_lee_distancia_puerto+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_lee_distancia_puerto+1 
	CLRF        FARG_lee_distancia_pin+0 
	CALL        _lee_distancia+0, 0
	MOVF        R0, 0 
	MOVWF       _distancia+0 
	MOVF        R1, 0 
	MOVWF       _distancia+1 
	MOVF        R2, 0 
	MOVWF       _distancia+2 
	MOVF        R3, 0 
	MOVWF       _distancia+3 
;evasor.c,195 :: 		sprintf(texto,"Distancia=%.1f\r\n",distancia);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_evasor+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_evasor+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_evasor+0)
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
;evasor.c,196 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;evasor.c,197 :: 		}
L_end_sonar:
	RETURN      0
; end of _sonar

_basico:

;evasor.c,200 :: 		void basico()
;evasor.c,202 :: 		sonar();
	CALL        _sonar+0, 0
;evasor.c,203 :: 		if (distancia<=10)
	MOVF        _distancia+0, 0 
	MOVWF       R4 
	MOVF        _distancia+1, 0 
	MOVWF       R5 
	MOVF        _distancia+2, 0 
	MOVWF       R6 
	MOVF        _distancia+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_basico9
;evasor.c,205 :: 		atras(100);
	MOVLW       100
	MOVWF       FARG_atras_velo+0 
	CALL        _atras+0, 0
;evasor.c,206 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_basico10:
	DECFSZ      R13, 1, 1
	BRA         L_basico10
	DECFSZ      R12, 1, 1
	BRA         L_basico10
	NOP
;evasor.c,207 :: 		derecha(50);
	MOVLW       50
	MOVWF       FARG_derecha_velo+0 
	CALL        _derecha+0, 0
;evasor.c,208 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_basico11:
	DECFSZ      R13, 1, 1
	BRA         L_basico11
	DECFSZ      R12, 1, 1
	BRA         L_basico11
	DECFSZ      R11, 1, 1
	BRA         L_basico11
	NOP
;evasor.c,209 :: 		}
	GOTO        L_basico12
L_basico9:
;evasor.c,212 :: 		adelante(100);
	MOVLW       100
	MOVWF       FARG_adelante_velo+0 
	CALL        _adelante+0, 0
;evasor.c,213 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_basico13:
	DECFSZ      R13, 1, 1
	BRA         L_basico13
	DECFSZ      R12, 1, 1
	BRA         L_basico13
	DECFSZ      R11, 1, 1
	BRA         L_basico13
	NOP
;evasor.c,215 :: 		}
L_basico12:
;evasor.c,218 :: 		}
L_end_basico:
	RETURN      0
; end of _basico

_main:

;evasor.c,221 :: 		void main()
;evasor.c,224 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;evasor.c,225 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;evasor.c,226 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;evasor.c,230 :: 		SI_DIR=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;evasor.c,231 :: 		SC_DIR=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;evasor.c,232 :: 		SD_DIR=1;
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;evasor.c,234 :: 		MD1_DIR=0;
	BCF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;evasor.c,235 :: 		MD2_DIR=0;
	BCF         TRISB3_bit+0, BitPos(TRISB3_bit+0) 
;evasor.c,236 :: 		MI1_DIR=0;
	BCF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;evasor.c,237 :: 		MI2_DIR=0;
	BCF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;evasor.c,240 :: 		TRISC1_bit=0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;evasor.c,241 :: 		TRISC2_bit=0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;evasor.c,244 :: 		TRISB1_bit=0;
	BCF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;evasor.c,247 :: 		TRISB0_bit=1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;evasor.c,249 :: 		TRISC6_bit=0; // SALIDA tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;evasor.c,250 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;evasor.c,252 :: 		TRISC0_bit=0; // salida led
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;evasor.c,254 :: 		Disparo = 0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;evasor.c,256 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;evasor.c,258 :: 		PWM1_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;evasor.c,259 :: 		PWM2_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;evasor.c,260 :: 		PWM1_Set_Duty(100);
	MOVLW       100
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,261 :: 		PWM2_Set_Duty(100);
	MOVLW       100
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,262 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;evasor.c,263 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;evasor.c,264 :: 		UART1_Write_Text("Inciciando\r\n");
	MOVLW       ?lstr2_evasor+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_evasor+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;evasor.c,267 :: 		while (1)
L_main14:
;evasor.c,269 :: 		basico();
	CALL        _basico+0, 0
;evasor.c,271 :: 		}
	GOTO        L_main14
;evasor.c,275 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
