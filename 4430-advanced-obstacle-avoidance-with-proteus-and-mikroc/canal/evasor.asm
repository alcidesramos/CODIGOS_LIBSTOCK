
_md_quieto:

;evasor.c,69 :: 		void   md_quieto()
;evasor.c,71 :: 		MD1=0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;evasor.c,72 :: 		MD2=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;evasor.c,73 :: 		}
L_end_md_quieto:
	RETURN      0
; end of _md_quieto

_md_adelante:

;evasor.c,76 :: 		void   md_adelante()
;evasor.c,78 :: 		MD1=1;
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;evasor.c,79 :: 		MD2=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;evasor.c,80 :: 		}
L_end_md_adelante:
	RETURN      0
; end of _md_adelante

_md_atras:

;evasor.c,83 :: 		void   md_atras()
;evasor.c,85 :: 		MD1=0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;evasor.c,86 :: 		MD2=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;evasor.c,87 :: 		}
L_end_md_atras:
	RETURN      0
; end of _md_atras

_mi_quieto:

;evasor.c,90 :: 		void   mi_quieto()
;evasor.c,92 :: 		MI1=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;evasor.c,93 :: 		MI2=0;
	BCF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;evasor.c,94 :: 		}
L_end_mi_quieto:
	RETURN      0
; end of _mi_quieto

_mi_adelante:

;evasor.c,97 :: 		void   mi_adelante()
;evasor.c,99 :: 		MI1=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;evasor.c,100 :: 		MI2=1;
	BSF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;evasor.c,101 :: 		}
L_end_mi_adelante:
	RETURN      0
; end of _mi_adelante

_mi_atras:

;evasor.c,105 :: 		void   mi_atras()
;evasor.c,107 :: 		MI1=1;
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;evasor.c,108 :: 		MI2=0;
	BCF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;evasor.c,109 :: 		}
L_end_mi_atras:
	RETURN      0
; end of _mi_atras

_quieto:

;evasor.c,115 :: 		void quieto()
;evasor.c,117 :: 		md_quieto();
	CALL        _md_quieto+0, 0
;evasor.c,118 :: 		mi_quieto();
	CALL        _mi_quieto+0, 0
;evasor.c,119 :: 		}
L_end_quieto:
	RETURN      0
; end of _quieto

_adelante:

;evasor.c,122 :: 		void adelante(unsigned char velo)
;evasor.c,125 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,126 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,127 :: 		md_adelante();
	CALL        _md_adelante+0, 0
;evasor.c,128 :: 		mi_adelante();
	CALL        _mi_adelante+0, 0
;evasor.c,130 :: 		}
L_end_adelante:
	RETURN      0
; end of _adelante

_atras:

;evasor.c,133 :: 		void atras(unsigned char velo)
;evasor.c,135 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,136 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,137 :: 		md_atras();
	CALL        _md_atras+0, 0
;evasor.c,138 :: 		mi_atras();
	CALL        _mi_atras+0, 0
;evasor.c,139 :: 		}
L_end_atras:
	RETURN      0
; end of _atras

_derecha:

;evasor.c,142 :: 		void derecha(unsigned char velo)
;evasor.c,144 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,145 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,146 :: 		mi_adelante();
	CALL        _mi_adelante+0, 0
;evasor.c,147 :: 		md_atras();
	CALL        _md_atras+0, 0
;evasor.c,148 :: 		}
L_end_derecha:
	RETURN      0
; end of _derecha

_izquierda:

;evasor.c,151 :: 		void izquierda(unsigned char velo)
;evasor.c,153 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,154 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,156 :: 		md_adelante();
	CALL        _md_adelante+0, 0
;evasor.c,157 :: 		mi_atras();
	CALL        _mi_atras+0, 0
;evasor.c,158 :: 		}
L_end_izquierda:
	RETURN      0
; end of _izquierda

_LEEBIT:

;evasor.c,164 :: 		char LEEBIT (char *port, char bit1)
;evasor.c,167 :: 		if ((*port & (1 << bit1))>0) return (1);
	MOVF        FARG_LEEBIT_bit1+0, 0 
	MOVWF       R2 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__LEEBIT56:
	BZ          L__LEEBIT57
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__LEEBIT56
L__LEEBIT57:
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
	GOTO        L__LEEBIT58
	MOVF        R2, 0 
	SUBLW       0
L__LEEBIT58:
	BTFSC       STATUS+0, 0 
	GOTO        L_LEEBIT0
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_LEEBIT
L_LEEBIT0:
;evasor.c,168 :: 		else return (0);
	CLRF        R0 
;evasor.c,169 :: 		}
L_end_LEEBIT:
	RETURN      0
; end of _LEEBIT

_lee_distancia:

;evasor.c,171 :: 		float lee_distancia(char *puerto,char pin)  //lee en el pin especificado
;evasor.c,177 :: 		disparo=1;
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;evasor.c,178 :: 		Delay_us(10);
	MOVLW       3
	MOVWF       R13, 0
L_lee_distancia2:
	DECFSZ      R13, 1, 1
	BRA         L_lee_distancia2
;evasor.c,179 :: 		disparo=0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;evasor.c,182 :: 		TMR1ON_bit=0; //TIMER QUIETO
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,183 :: 		TMR1L=0;// limpia parte baja
	CLRF        TMR1L+0 
;evasor.c,184 :: 		TMR1h=0; //limpia parte alta
	CLRF        TMR1H+0 
;evasor.c,185 :: 		TMR1IF_bit=0; //limpia la bandera de desboradmiento
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;evasor.c,186 :: 		TMR1ON_bit=1; //Arranca el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,188 :: 		while (LEEBIT(puerto,pin)==0)
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
;evasor.c,191 :: 		if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_lee_distancia5
;evasor.c,194 :: 		return (-1);// si no hay sensor conectado retorna -1
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	GOTO        L_end_lee_distancia
;evasor.c,196 :: 		}
L_lee_distancia5:
;evasor.c,197 :: 		}
	GOTO        L_lee_distancia3
L_lee_distancia4:
;evasor.c,199 :: 		TMR1ON_bit=0; //TIMER QUIETO
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,200 :: 		TMR1L=0;// limpia parte baja
	CLRF        TMR1L+0 
;evasor.c,201 :: 		TMR1h=0; //limpia parte alta
	CLRF        TMR1H+0 
;evasor.c,202 :: 		TMR1IF_bit=0; //limpia la bandera de desboradmiento
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;evasor.c,203 :: 		TMR1ON_bit=1; //Arranca el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,204 :: 		while (LEEBIT(puerto,pin)==1)
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
;evasor.c,206 :: 		if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_lee_distancia8
;evasor.c,208 :: 		return (0);// si no hay eco
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	GOTO        L_end_lee_distancia
;evasor.c,210 :: 		}
L_lee_distancia8:
;evasor.c,211 :: 		}
	GOTO        L_lee_distancia6
L_lee_distancia7:
;evasor.c,213 :: 		TMR1ON_bit=0; //paro timer
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;evasor.c,214 :: 		contador=(TMR1H <<8) |  TMR1L;   // arma el valor del timer rotando 8 la parte alta y sumando la baja
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
;evasor.c,216 :: 		calculo=(float) contador*1.0/(Frec_real) ;   //1.0 prescalador de 1
	CALL        _word2double+0, 0
;evasor.c,217 :: 		calculo=calculo/58.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       104
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;evasor.c,218 :: 		return (calculo);
;evasor.c,219 :: 		}
L_end_lee_distancia:
	RETURN      0
; end of _lee_distancia

_sonar:

;evasor.c,221 :: 		void sonar()
;evasor.c,223 :: 		distancia=lee_distancia(&PORTB,eco);
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
;evasor.c,226 :: 		}
L_end_sonar:
	RETURN      0
; end of _sonar

_basico:

;evasor.c,229 :: 		void basico()
;evasor.c,231 :: 		sonar();
	CALL        _sonar+0, 0
;evasor.c,232 :: 		if (distancia<=10)
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
;evasor.c,234 :: 		atras(100);
	MOVLW       100
	MOVWF       FARG_atras_velo+0 
	CALL        _atras+0, 0
;evasor.c,235 :: 		Delay_ms(50);
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
;evasor.c,236 :: 		derecha(50);
	MOVLW       50
	MOVWF       FARG_derecha_velo+0 
	CALL        _derecha+0, 0
;evasor.c,237 :: 		Delay_ms(200);
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
;evasor.c,238 :: 		}
	GOTO        L_basico12
L_basico9:
;evasor.c,241 :: 		adelante(100);
	MOVLW       100
	MOVWF       FARG_adelante_velo+0 
	CALL        _adelante+0, 0
;evasor.c,242 :: 		Delay_ms(200);
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
;evasor.c,244 :: 		}
L_basico12:
;evasor.c,247 :: 		}
L_end_basico:
	RETURN      0
; end of _basico

_InitTimer0:

;evasor.c,253 :: 		void InitTimer0(){
;evasor.c,254 :: 		T0CON	 = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;evasor.c,255 :: 		TMR0H	 = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;evasor.c,256 :: 		TMR0L	 = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;evasor.c,257 :: 		GIE_bit	 = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;evasor.c,258 :: 		TMR0IE_bit	 = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;evasor.c,259 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_Interrupt:

;evasor.c,261 :: 		void Interrupt(){
;evasor.c,263 :: 		if (TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_Interrupt14
;evasor.c,264 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;evasor.c,265 :: 		TMR0H	 = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;evasor.c,266 :: 		TMR0L	 = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;evasor.c,268 :: 		if (flag_dir!=car_A) // si no esta  moviendo adelante
	MOVF        _flag_dir+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt15
;evasor.c,270 :: 		if (flag_dir==car_D)  rumbo++;
	MOVF        _flag_dir+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt16
	MOVLW       1
	ADDWF       _rumbo+0, 1 
	MOVLW       0
	ADDWFC      _rumbo+1, 1 
	ADDWFC      _rumbo+2, 1 
	ADDWFC      _rumbo+3, 1 
	GOTO        L_Interrupt17
L_Interrupt16:
;evasor.c,271 :: 		else rumbo--;
	MOVLW       1
	SUBWF       _rumbo+0, 1 
	MOVLW       0
	SUBWFB      _rumbo+1, 1 
	SUBWFB      _rumbo+2, 1 
	SUBWFB      _rumbo+3, 1 
L_Interrupt17:
;evasor.c,272 :: 		if (rumbo==limite_giro)
	MOVF        _rumbo+3, 0 
	XORWF       _limite_giro+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt65
	MOVF        _rumbo+2, 0 
	XORWF       _limite_giro+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt65
	MOVF        _rumbo+1, 0 
	XORWF       _limite_giro+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt65
	MOVF        _rumbo+0, 0 
	XORWF       _limite_giro+0, 0 
L__Interrupt65:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt18
;evasor.c,274 :: 		TMR0IE_bit=0;// deshabilita  timer
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;evasor.c,275 :: 		flag_giro=1; // activa bantera que ya llego al limite
	MOVLW       1
	MOVWF       _flag_giro+0 
;evasor.c,277 :: 		}
L_Interrupt18:
;evasor.c,278 :: 		}
	GOTO        L_Interrupt19
L_Interrupt15:
;evasor.c,281 :: 		tiempo++;
	INFSNZ      _tiempo+0, 1 
	INCF        _tiempo+1, 1 
;evasor.c,282 :: 		if (tiempo>=limite_tiempo)
	MOVF        _limite_tiempo+1, 0 
	SUBWF       _tiempo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt66
	MOVF        _limite_tiempo+0, 0 
	SUBWF       _tiempo+0, 0 
L__Interrupt66:
	BTFSS       STATUS+0, 0 
	GOTO        L_Interrupt20
;evasor.c,284 :: 		TMR0IE_bit=0;// deshabilita  timer
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;evasor.c,285 :: 		tiempo=0;
	CLRF        _tiempo+0 
	CLRF        _tiempo+1 
;evasor.c,286 :: 		flag_tiempo=1;
	MOVLW       1
	MOVWF       _flag_tiempo+0 
;evasor.c,287 :: 		}
L_Interrupt20:
;evasor.c,288 :: 		}
L_Interrupt19:
;evasor.c,291 :: 		}
L_Interrupt14:
;evasor.c,292 :: 		}
L_end_Interrupt:
L__Interrupt64:
	RETFIE      1
; end of _Interrupt

_main:

;evasor.c,294 :: 		void main()
;evasor.c,297 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;evasor.c,298 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;evasor.c,299 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;evasor.c,303 :: 		SI_DIR=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;evasor.c,304 :: 		SC_DIR=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;evasor.c,305 :: 		SD_DIR=1;
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;evasor.c,307 :: 		MD1_DIR=0;
	BCF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;evasor.c,308 :: 		MD2_DIR=0;
	BCF         TRISB3_bit+0, BitPos(TRISB3_bit+0) 
;evasor.c,309 :: 		MI1_DIR=0;
	BCF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;evasor.c,310 :: 		MI2_DIR=0;
	BCF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;evasor.c,313 :: 		TRISC1_bit=0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;evasor.c,314 :: 		TRISC2_bit=0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;evasor.c,317 :: 		TRISB1_bit=0;
	BCF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;evasor.c,320 :: 		TRISB0_bit=1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;evasor.c,322 :: 		TRISC6_bit=0; // SALIDA tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;evasor.c,323 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;evasor.c,325 :: 		TRISC0_bit=0; // salida led
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;evasor.c,329 :: 		T1CON = 0;
	CLRF        T1CON+0 
;evasor.c,331 :: 		T1CKPS1_bit = 0;
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;evasor.c,332 :: 		T1CKPS0_bit = 0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;evasor.c,335 :: 		Disparo = 0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;evasor.c,337 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;evasor.c,339 :: 		PWM1_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;evasor.c,340 :: 		PWM2_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;evasor.c,341 :: 		PWM1_Set_Duty(100);
	MOVLW       100
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;evasor.c,342 :: 		PWM2_Set_Duty(100);
	MOVLW       100
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;evasor.c,343 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;evasor.c,344 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;evasor.c,345 :: 		UART1_Write_Text("Inciciando\r\n");
	MOVLW       ?lstr1_evasor+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_evasor+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;evasor.c,353 :: 		while(1)
L_main21:
;evasor.c,355 :: 		sonar();
	CALL        _sonar+0, 0
;evasor.c,356 :: 		switch (dir_estado)
	GOTO        L_main23
;evasor.c,358 :: 		case avante:
L_main25:
;evasor.c,359 :: 		adelante(100);// va hacia  adelante a
	MOVLW       100
	MOVWF       FARG_adelante_velo+0 
	CALL        _adelante+0, 0
;evasor.c,361 :: 		if (distancia<=dis_min)
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
	GOTO        L_main26
;evasor.c,363 :: 		dir_estado=babor;
	MOVLW       3
	MOVWF       _dir_estado+0 
;evasor.c,364 :: 		limite_giro=limite_giro1;
	MOVLW       105
	MOVWF       _limite_giro+0 
	MOVLW       0
	MOVWF       _limite_giro+1 
	MOVWF       _limite_giro+2 
	MOVWF       _limite_giro+3 
;evasor.c,365 :: 		flag_dir=car_D; //para que el encoder cuente a la derecha
	CLRF        _flag_dir+0 
;evasor.c,366 :: 		InitTimer0();  // inicia el timer para calcular giro
	CALL        _InitTimer0+0, 0
;evasor.c,367 :: 		flag_giro_ok=0;
	CLRF        _flag_giro_ok+0 
;evasor.c,368 :: 		derecha(100);
	MOVLW       100
	MOVWF       FARG_derecha_velo+0 
	CALL        _derecha+0, 0
;evasor.c,369 :: 		}
L_main26:
;evasor.c,371 :: 		break;
	GOTO        L_main24
;evasor.c,373 :: 		case avante_time_d:
L_main27:
;evasor.c,375 :: 		if (flag_tiempo==1)    // si cumplio del tiempo ebe enderezar el movieminto
	MOVF        _flag_tiempo+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
;evasor.c,377 :: 		flag_tiempo=0;
	CLRF        _flag_tiempo+0 
;evasor.c,378 :: 		dir_estado=estribor;
	MOVLW       4
	MOVWF       _dir_estado+0 
;evasor.c,379 :: 		limite_giro=0; // endereza moviento
	CLRF        _limite_giro+0 
	CLRF        _limite_giro+1 
	CLRF        _limite_giro+2 
	CLRF        _limite_giro+3 
;evasor.c,380 :: 		flag_dir=car_I; //para que el encoder cuente a la derecha
	MOVLW       1
	MOVWF       _flag_dir+0 
;evasor.c,381 :: 		InitTimer0();  // inicia el timer para calcular giro
	CALL        _InitTimer0+0, 0
;evasor.c,382 :: 		izquierda(100);
	MOVLW       100
	MOVWF       FARG_izquierda_velo+0 
	CALL        _izquierda+0, 0
;evasor.c,383 :: 		while(flag_giro==0);// como e sun movimiento en un eje no será bloqeuante
L_main29:
	MOVF        _flag_giro+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
	GOTO        L_main29
L_main30:
;evasor.c,384 :: 		flag_giro=0;
	CLRF        _flag_giro+0 
;evasor.c,385 :: 		dir_estado=avante;  // inicia movimeinto adelante
	CLRF        _dir_estado+0 
;evasor.c,388 :: 		}
L_main28:
;evasor.c,391 :: 		break;
	GOTO        L_main24
;evasor.c,393 :: 		case avante_time_i:
L_main31:
;evasor.c,395 :: 		if (flag_tiempo==1)    // si cumplio del tiempo ebe enderezar el movieminto
	MOVF        _flag_tiempo+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
;evasor.c,397 :: 		flag_tiempo=0;
	CLRF        _flag_tiempo+0 
;evasor.c,398 :: 		dir_estado=babor;  // regresa a la derecha
	MOVLW       3
	MOVWF       _dir_estado+0 
;evasor.c,399 :: 		limite_giro=0; // endereza moviento
	CLRF        _limite_giro+0 
	CLRF        _limite_giro+1 
	CLRF        _limite_giro+2 
	CLRF        _limite_giro+3 
;evasor.c,400 :: 		flag_dir=car_D; //para que el encoder cuente a la derecha
	CLRF        _flag_dir+0 
;evasor.c,401 :: 		InitTimer0();  // inicia el timer para calcular giro
	CALL        _InitTimer0+0, 0
;evasor.c,402 :: 		derecha(100);
	MOVLW       100
	MOVWF       FARG_derecha_velo+0 
	CALL        _derecha+0, 0
;evasor.c,403 :: 		while(flag_giro==0);// como e sun movimiento en un eje no será bloqeuante
L_main33:
	MOVF        _flag_giro+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
	GOTO        L_main33
L_main34:
;evasor.c,404 :: 		flag_giro=0;
	CLRF        _flag_giro+0 
;evasor.c,405 :: 		dir_estado=avante;  // inicia movimeinto adelante
	CLRF        _dir_estado+0 
;evasor.c,408 :: 		}
L_main32:
;evasor.c,411 :: 		break;
	GOTO        L_main24
;evasor.c,413 :: 		case BABOR:
L_main35:
;evasor.c,414 :: 		if (distancia>=30) flag_giro_ok=1;    // detecta si giro es correcto girar en ese sentido
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _distancia+0, 0 
	MOVWF       R0 
	MOVF        _distancia+1, 0 
	MOVWF       R1 
	MOVF        _distancia+2, 0 
	MOVWF       R2 
	MOVF        _distancia+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
	MOVLW       1
	MOVWF       _flag_giro_ok+0 
L_main36:
;evasor.c,416 :: 		if (flag_giro==1)     // si ya terminó el giro
	MOVF        _flag_giro+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main37
;evasor.c,418 :: 		flag_giro=0;
	CLRF        _flag_giro+0 
;evasor.c,419 :: 		if (flag_giro_ok==1)  // y si es el correto
	MOVF        _flag_giro_ok+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
;evasor.c,421 :: 		dir_estado=avante_time_d;
	MOVLW       1
	MOVWF       _dir_estado+0 
;evasor.c,422 :: 		limite_tiempo=limite_time;
	MOVLW       200
	MOVWF       _limite_tiempo+0 
	MOVLW       0
	MOVWF       _limite_tiempo+1 
;evasor.c,423 :: 		flag_dir=car_A; //para que el encoder cuente a la izquierda
	MOVLW       2
	MOVWF       _flag_dir+0 
;evasor.c,424 :: 		InitTimer0();  // inicia el timer para calcular giro
	CALL        _InitTimer0+0, 0
;evasor.c,425 :: 		flag_tiempo=0; // limpia la bandera de tiempo
	CLRF        _flag_tiempo+0 
;evasor.c,426 :: 		flag_giro=0;
	CLRF        _flag_giro+0 
;evasor.c,427 :: 		adelante(100);
	MOVLW       100
	MOVWF       FARG_adelante_velo+0 
	CALL        _adelante+0, 0
;evasor.c,429 :: 		}
	GOTO        L_main39
L_main38:
;evasor.c,432 :: 		dir_estado=estribor;
	MOVLW       4
	MOVWF       _dir_estado+0 
;evasor.c,433 :: 		limite_giro=limite_giro2;
	MOVLW       151
	MOVWF       _limite_giro+0 
	MOVLW       255
	MOVWF       _limite_giro+1 
	MOVWF       _limite_giro+2 
	MOVWF       _limite_giro+3 
;evasor.c,434 :: 		flag_dir=car_I; //para que el encoder cuente a la derecha
	MOVLW       1
	MOVWF       _flag_dir+0 
;evasor.c,435 :: 		InitTimer0();  // inicia el timer para calcular giro
	CALL        _InitTimer0+0, 0
;evasor.c,436 :: 		flag_giro_ok=0;
	CLRF        _flag_giro_ok+0 
;evasor.c,437 :: 		izquierda(100);
	MOVLW       100
	MOVWF       FARG_izquierda_velo+0 
	CALL        _izquierda+0, 0
;evasor.c,438 :: 		}
L_main39:
;evasor.c,439 :: 		}
L_main37:
;evasor.c,441 :: 		break;
	GOTO        L_main24
;evasor.c,443 :: 		case estribor:
L_main40:
;evasor.c,444 :: 		if (flag_giro==1)     // si ya terminó el giro
	MOVF        _flag_giro+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main41
;evasor.c,446 :: 		flag_giro=0;
	CLRF        _flag_giro+0 
;evasor.c,447 :: 		dir_estado=avante_time_i;
	MOVLW       2
	MOVWF       _dir_estado+0 
;evasor.c,448 :: 		limite_tiempo=limite_time;
	MOVLW       200
	MOVWF       _limite_tiempo+0 
	MOVLW       0
	MOVWF       _limite_tiempo+1 
;evasor.c,449 :: 		flag_dir=car_A; //para que el encoder cuente a la izquierda
	MOVLW       2
	MOVWF       _flag_dir+0 
;evasor.c,450 :: 		InitTimer0();  // inicia el timer para calcular giro
	CALL        _InitTimer0+0, 0
;evasor.c,451 :: 		flag_tiempo=0; // limpia la bandera de tiempo
	CLRF        _flag_tiempo+0 
;evasor.c,452 :: 		flag_giro=0;
	CLRF        _flag_giro+0 
;evasor.c,453 :: 		adelante(100);
	MOVLW       100
	MOVWF       FARG_adelante_velo+0 
	CALL        _adelante+0, 0
;evasor.c,455 :: 		}
L_main41:
;evasor.c,456 :: 		break;
	GOTO        L_main24
;evasor.c,462 :: 		}// fin del switch
L_main23:
	MOVF        _dir_estado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
	MOVF        _dir_estado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main27
	MOVF        _dir_estado+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main31
	MOVF        _dir_estado+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
	MOVF        _dir_estado+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
L_main24:
;evasor.c,469 :: 		}
	GOTO        L_main21
;evasor.c,481 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
