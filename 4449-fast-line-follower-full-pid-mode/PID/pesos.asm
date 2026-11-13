
_config_timer1:

;pesos.c,79 :: 		void config_timer1 ()
;pesos.c,81 :: 		T1CON=0;
	CLRF        T1CON+0 
;pesos.c,83 :: 		TMR1H=236;
	MOVLW       236
	MOVWF       TMR1H+0 
;pesos.c,84 :: 		TMR1L=120;
	MOVLW       120
	MOVWF       TMR1L+0 
;pesos.c,86 :: 		T1CKPS1_bit=0;
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;pesos.c,87 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;pesos.c,89 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;pesos.c,90 :: 		TMR1ON_bit=0;
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;pesos.c,91 :: 		}
L_end_config_timer1:
	RETURN      0
; end of _config_timer1

_config_salidas:

;pesos.c,96 :: 		void config_salidas()//salida todos los sensores
;pesos.c,98 :: 		s1_dir=0;
	BCF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;pesos.c,99 :: 		s2_dir=0;
	BCF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;pesos.c,100 :: 		s3_dir=0;
	BCF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;pesos.c,101 :: 		s4_dir=0;
	BCF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;pesos.c,102 :: 		s5_dir=0;
	BCF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;pesos.c,103 :: 		s6_dir=0;
	BCF         TRISA5_bit+0, BitPos(TRISA5_bit+0) 
;pesos.c,104 :: 		}
L_end_config_salidas:
	RETURN      0
; end of _config_salidas

_config_entradas:

;pesos.c,107 :: 		void config_entradas()//entrada todos los sensores
;pesos.c,109 :: 		s1_dir=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;pesos.c,110 :: 		s2_dir=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;pesos.c,111 :: 		s3_dir=1;
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;pesos.c,112 :: 		s4_dir=1;
	BSF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;pesos.c,113 :: 		s5_dir=1;
	BSF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;pesos.c,114 :: 		s6_dir=1;
	BSF         TRISA5_bit+0, BitPos(TRISA5_bit+0) 
;pesos.c,115 :: 		}
L_end_config_entradas:
	RETURN      0
; end of _config_entradas

_saca_uno:

;pesos.c,118 :: 		void saca_uno()
;pesos.c,120 :: 		s1_out=1;
	BSF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;pesos.c,121 :: 		s2_out=1;
	BSF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;pesos.c,122 :: 		s3_out=1;
	BSF         LATA2_bit+0, BitPos(LATA2_bit+0) 
;pesos.c,123 :: 		s4_out=1;
	BSF         LATA3_bit+0, BitPos(LATA3_bit+0) 
;pesos.c,124 :: 		s5_out=1;
	BSF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;pesos.c,125 :: 		s6_out=1;
	BSF         LATA5_bit+0, BitPos(LATA5_bit+0) 
;pesos.c,126 :: 		}
L_end_saca_uno:
	RETURN      0
; end of _saca_uno

_analizasensoresir:

;pesos.c,128 :: 		void analizasensoresir()
;pesos.c,131 :: 		config_timer1();
	CALL        _config_timer1+0, 0
;pesos.c,132 :: 		leds=1;// enciende la regleta d elos leds
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;pesos.c,133 :: 		config_salidas();
	CALL        _config_salidas+0, 0
;pesos.c,134 :: 		saca_uno();
	CALL        _saca_uno+0, 0
;pesos.c,135 :: 		Delay_us(10);
	MOVLW       3
	MOVWF       R13, 0
L_analizasensoresir0:
	DECFSZ      R13, 1, 1
	BRA         L_analizasensoresir0
;pesos.c,136 :: 		config_entradas();
	CALL        _config_entradas+0, 0
;pesos.c,137 :: 		TMR1ON_bit=1; //prende el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;pesos.c,141 :: 		for (cuenta1=0;cuenta1<=8;cuenta1++)  lecturas[cuenta1]=0;
	CLRF        analizasensoresir_cuenta1_L0+0 
L_analizasensoresir1:
	MOVF        analizasensoresir_cuenta1_L0+0, 0 
	SUBLW       8
	BTFSS       STATUS+0, 0 
	GOTO        L_analizasensoresir2
	MOVF        analizasensoresir_cuenta1_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _lecturas+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_lecturas+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	INCF        analizasensoresir_cuenta1_L0+0, 1 
	GOTO        L_analizasensoresir1
L_analizasensoresir2:
;pesos.c,142 :: 		banderas=0;    //limpi las bandera de los sesnores
	CLRF        _banderas+0 
;pesos.c,144 :: 		while (TMR1IF_bit==0)
L_analizasensoresir4:
	BTFSC       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_analizasensoresir5
;pesos.c,148 :: 		if ((s1_in==0) && ( flag_s1==0))
	BTFSC       RA0_bit+0, BitPos(RA0_bit+0) 
	GOTO        L_analizasensoresir8
	BTFSC       _banderas+0, 0 
	GOTO        L_analizasensoresir8
L__analizasensoresir74:
;pesos.c,150 :: 		lecturas[0]=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lecturas+0 
	MOVLW       0
	MOVWF       _lecturas+1 
	MOVF        _lecturas+0, 0 
	MOVWF       _lecturas+1 
	CLRF        _lecturas+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lecturas+0, 1 
	MOVLW       0
	IORWF       _lecturas+1, 1 
;pesos.c,151 :: 		flag_s1=1;
	BSF         _banderas+0, 0 
;pesos.c,152 :: 		}
L_analizasensoresir8:
;pesos.c,155 :: 		if ((s2_in==0) && ( flag_s2==0))
	BTFSC       RA1_bit+0, BitPos(RA1_bit+0) 
	GOTO        L_analizasensoresir11
	BTFSC       _banderas+0, 1 
	GOTO        L_analizasensoresir11
L__analizasensoresir73:
;pesos.c,157 :: 		lecturas[1]=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lecturas+2 
	MOVLW       0
	MOVWF       _lecturas+3 
	MOVF        _lecturas+2, 0 
	MOVWF       _lecturas+3 
	CLRF        _lecturas+2 
	MOVF        TMR1L+0, 0 
	IORWF       _lecturas+2, 1 
	MOVLW       0
	IORWF       _lecturas+3, 1 
;pesos.c,158 :: 		flag_s2=1;
	BSF         _banderas+0, 1 
;pesos.c,159 :: 		}
L_analizasensoresir11:
;pesos.c,162 :: 		if ((s3_in==0) && ( flag_s3==0))
	BTFSC       RA2_bit+0, BitPos(RA2_bit+0) 
	GOTO        L_analizasensoresir14
	BTFSC       _banderas+0, 2 
	GOTO        L_analizasensoresir14
L__analizasensoresir72:
;pesos.c,164 :: 		lecturas[2]=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lecturas+4 
	MOVLW       0
	MOVWF       _lecturas+5 
	MOVF        _lecturas+4, 0 
	MOVWF       _lecturas+5 
	CLRF        _lecturas+4 
	MOVF        TMR1L+0, 0 
	IORWF       _lecturas+4, 1 
	MOVLW       0
	IORWF       _lecturas+5, 1 
;pesos.c,165 :: 		flag_s3=1;
	BSF         _banderas+0, 2 
;pesos.c,166 :: 		}
L_analizasensoresir14:
;pesos.c,169 :: 		if ((s4_in==0) && ( flag_s4==0))
	BTFSC       RA3_bit+0, BitPos(RA3_bit+0) 
	GOTO        L_analizasensoresir17
	BTFSC       _banderas+0, 3 
	GOTO        L_analizasensoresir17
L__analizasensoresir71:
;pesos.c,171 :: 		lecturas[3]=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lecturas+6 
	MOVLW       0
	MOVWF       _lecturas+7 
	MOVF        _lecturas+6, 0 
	MOVWF       _lecturas+7 
	CLRF        _lecturas+6 
	MOVF        TMR1L+0, 0 
	IORWF       _lecturas+6, 1 
	MOVLW       0
	IORWF       _lecturas+7, 1 
;pesos.c,172 :: 		flag_s4=1;
	BSF         _banderas+0, 3 
;pesos.c,173 :: 		}
L_analizasensoresir17:
;pesos.c,176 :: 		if ((s5_in==0) && ( flag_s5==0))
	BTFSC       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_analizasensoresir20
	BTFSC       _banderas+0, 4 
	GOTO        L_analizasensoresir20
L__analizasensoresir70:
;pesos.c,178 :: 		lecturas[4]=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lecturas+8 
	MOVLW       0
	MOVWF       _lecturas+9 
	MOVF        _lecturas+8, 0 
	MOVWF       _lecturas+9 
	CLRF        _lecturas+8 
	MOVF        TMR1L+0, 0 
	IORWF       _lecturas+8, 1 
	MOVLW       0
	IORWF       _lecturas+9, 1 
;pesos.c,179 :: 		flag_s5=1;
	BSF         _banderas+0, 4 
;pesos.c,180 :: 		}
L_analizasensoresir20:
;pesos.c,184 :: 		if ((s6_in==0) && ( flag_s6==0))
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_analizasensoresir23
	BTFSC       _banderas+0, 5 
	GOTO        L_analizasensoresir23
L__analizasensoresir69:
;pesos.c,186 :: 		lecturas[5]=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lecturas+10 
	MOVLW       0
	MOVWF       _lecturas+11 
	MOVF        _lecturas+10, 0 
	MOVWF       _lecturas+11 
	CLRF        _lecturas+10 
	MOVF        TMR1L+0, 0 
	IORWF       _lecturas+10, 1 
	MOVLW       0
	IORWF       _lecturas+11, 1 
;pesos.c,187 :: 		flag_s6=1;
	BSF         _banderas+0, 5 
;pesos.c,188 :: 		}
L_analizasensoresir23:
;pesos.c,189 :: 		} // fin del tiempo para leeer los sensores
	GOTO        L_analizasensoresir4
L_analizasensoresir5:
;pesos.c,191 :: 		leds=0;//
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;pesos.c,193 :: 		}
L_end_analizasensoresir:
	RETURN      0
; end of _analizasensoresir

_manda_sensores_ir:

;pesos.c,195 :: 		void manda_sensores_ir()
;pesos.c,197 :: 		sprintf(texto,"s1=%u   s2=%u  s3=%u   s4=%u   s5=%u   s6=%u\r\n\r\n",lecturas[0],lecturas[1],lecturas[2],lecturas[3],lecturas[4],lecturas[5]);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_pesos+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_pesos+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_pesos+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _lecturas+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _lecturas+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _lecturas+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _lecturas+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _lecturas+4, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _lecturas+5, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _lecturas+6, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _lecturas+7, 0 
	MOVWF       FARG_sprintf_wh+12 
	MOVF        _lecturas+8, 0 
	MOVWF       FARG_sprintf_wh+13 
	MOVF        _lecturas+9, 0 
	MOVWF       FARG_sprintf_wh+14 
	MOVF        _lecturas+10, 0 
	MOVWF       FARG_sprintf_wh+15 
	MOVF        _lecturas+11, 0 
	MOVWF       FARG_sprintf_wh+16 
	CALL        _sprintf+0, 0
;pesos.c,198 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,200 :: 		}
L_end_manda_sensores_ir:
	RETURN      0
; end of _manda_sensores_ir

_adelante:

;pesos.c,203 :: 		void adelante(unsigned char velo)
;pesos.c,205 :: 		m1_g=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,206 :: 		m2_g=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,207 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,208 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,209 :: 		}
L_end_adelante:
	RETURN      0
; end of _adelante

_atras:

;pesos.c,212 :: 		void atras(unsigned char velo)
;pesos.c,214 :: 		m1_g=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,215 :: 		m2_g=1;
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,216 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,217 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,218 :: 		}
L_end_atras:
	RETURN      0
; end of _atras

_derecha:

;pesos.c,221 :: 		void derecha(unsigned char velo)
;pesos.c,223 :: 		m1_g=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,224 :: 		m2_g=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,225 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,226 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,227 :: 		}
L_end_derecha:
	RETURN      0
; end of _derecha

_izquierda:

;pesos.c,230 :: 		void izquierda(unsigned char velo)
;pesos.c,232 :: 		m1_g=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,233 :: 		m2_g=1;
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,234 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,235 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,236 :: 		}
L_end_izquierda:
	RETURN      0
; end of _izquierda

_quieto:

;pesos.c,238 :: 		void quieto()
;pesos.c,240 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,241 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,242 :: 		}   void calibra_ir()
L_end_quieto:
	RETURN      0
; end of _quieto

_calibra_ir:

;pesos.c,246 :: 		led=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,248 :: 		for (cuenta2=0; cuenta2<=200;cuenta2++)
	CLRF        calibra_ir_cuenta2_L0+0 
	CLRF        calibra_ir_cuenta2_L0+1 
L_calibra_ir24:
	MOVLW       0
	MOVWF       R0 
	MOVF        calibra_ir_cuenta2_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calibra_ir87
	MOVF        calibra_ir_cuenta2_L0+0, 0 
	SUBLW       200
L__calibra_ir87:
	BTFSS       STATUS+0, 0 
	GOTO        L_calibra_ir25
;pesos.c,250 :: 		for (cont=0; cont<6;cont++)
	CLRF        calibra_ir_cont_L0+0 
L_calibra_ir27:
	MOVLW       6
	SUBWF       calibra_ir_cont_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_calibra_ir28
;pesos.c,252 :: 		analizasensoresir();
	CALL        _analizasensoresir+0, 0
;pesos.c,253 :: 		if (lecturas[cont]>=maximos[cont]) maximos[cont]=lecturas[cont];
	MOVF        calibra_ir_cont_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _lecturas+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lecturas+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       _maximos+0
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       hi_addr(_maximos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calibra_ir88
	MOVF        R1, 0 
	SUBWF       R3, 0 
L__calibra_ir88:
	BTFSS       STATUS+0, 0 
	GOTO        L_calibra_ir30
	MOVF        calibra_ir_cont_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _maximos+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_maximos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVLW       _lecturas+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lecturas+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
L_calibra_ir30:
;pesos.c,254 :: 		if (lecturas[cont]<=minimos[cont]) minimos[cont]=lecturas[cont];
	MOVF        calibra_ir_cont_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _lecturas+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lecturas+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       _minimos+0
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       hi_addr(_minimos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R4, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calibra_ir89
	MOVF        R3, 0 
	SUBWF       R1, 0 
L__calibra_ir89:
	BTFSS       STATUS+0, 0 
	GOTO        L_calibra_ir31
	MOVF        calibra_ir_cont_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _minimos+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_minimos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVLW       _lecturas+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lecturas+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
L_calibra_ir31:
;pesos.c,250 :: 		for (cont=0; cont<6;cont++)
	INCF        calibra_ir_cont_L0+0, 1 
;pesos.c,255 :: 		}  //
	GOTO        L_calibra_ir27
L_calibra_ir28:
;pesos.c,248 :: 		for (cuenta2=0; cuenta2<=200;cuenta2++)
	INFSNZ      calibra_ir_cuenta2_L0+0, 1 
	INCF        calibra_ir_cuenta2_L0+1, 1 
;pesos.c,256 :: 		} //fin for cuenta
	GOTO        L_calibra_ir24
L_calibra_ir25:
;pesos.c,257 :: 		led=1;
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,258 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_calibra_ir32:
	DECFSZ      R13, 1, 1
	BRA         L_calibra_ir32
	DECFSZ      R12, 1, 1
	BRA         L_calibra_ir32
	DECFSZ      R11, 1, 1
	BRA         L_calibra_ir32
	NOP
	NOP
;pesos.c,259 :: 		led=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,261 :: 		}
L_end_calibra_ir:
	RETURN      0
; end of _calibra_ir

_manda_limites:

;pesos.c,263 :: 		void manda_limites()
;pesos.c,265 :: 		sprintf(texto,"min1=%u   min2=%u  min3=%u   min4=%u   min5=%u   min6=%u\r\n",minimos[0],minimos[1],minimos[2],minimos[3],minimos[4],minimos[5]);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_pesos+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_pesos+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_pesos+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _minimos+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _minimos+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _minimos+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _minimos+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _minimos+4, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _minimos+5, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _minimos+6, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _minimos+7, 0 
	MOVWF       FARG_sprintf_wh+12 
	MOVF        _minimos+8, 0 
	MOVWF       FARG_sprintf_wh+13 
	MOVF        _minimos+9, 0 
	MOVWF       FARG_sprintf_wh+14 
	MOVF        _minimos+10, 0 
	MOVWF       FARG_sprintf_wh+15 
	MOVF        _minimos+11, 0 
	MOVWF       FARG_sprintf_wh+16 
	CALL        _sprintf+0, 0
;pesos.c,266 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,267 :: 		sprintf(texto,"max1=%u   max2=%u  max3=%u   max4=%u   max5=%u   max6=%u\r\n\r\n",maximos[0],maximos[1],maximos[2],maximos[3],maximos[4],maximos[5]);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_3_pesos+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_3_pesos+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_3_pesos+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _maximos+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _maximos+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _maximos+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _maximos+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _maximos+4, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _maximos+5, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _maximos+6, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _maximos+7, 0 
	MOVWF       FARG_sprintf_wh+12 
	MOVF        _maximos+8, 0 
	MOVWF       FARG_sprintf_wh+13 
	MOVF        _maximos+9, 0 
	MOVWF       FARG_sprintf_wh+14 
	MOVF        _maximos+10, 0 
	MOVWF       FARG_sprintf_wh+15 
	MOVF        _maximos+11, 0 
	MOVWF       FARG_sprintf_wh+16 
	CALL        _sprintf+0, 0
;pesos.c,268 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,271 :: 		}
L_end_manda_limites:
	RETURN      0
; end of _manda_limites

_normaliza:

;pesos.c,275 :: 		void normaliza()
;pesos.c,282 :: 		for (cuenta=0;cuenta<6;cuenta++)
	CLRF        normaliza_cuenta_L0+0 
L_normaliza33:
	MOVLW       6
	SUBWF       normaliza_cuenta_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_normaliza34
;pesos.c,284 :: 		min_temp=minimos[cuenta];
	MOVF        normaliza_cuenta_L0+0, 0 
	MOVWF       FLOC__normaliza+4 
	MOVLW       0
	MOVWF       FLOC__normaliza+5 
	RLCF        FLOC__normaliza+4, 1 
	BCF         FLOC__normaliza+4, 0 
	RLCF        FLOC__normaliza+5, 1 
	MOVLW       _minimos+0
	ADDWF       FLOC__normaliza+4, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_minimos+0)
	ADDWFC      FLOC__normaliza+5, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__normaliza+0 
	MOVF        R1, 0 
	MOVWF       FLOC__normaliza+1 
	MOVF        R2, 0 
	MOVWF       FLOC__normaliza+2 
	MOVF        R3, 0 
	MOVWF       FLOC__normaliza+3 
	MOVLW       _maximos+0
	ADDWF       FLOC__normaliza+4, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_maximos+0)
	ADDWFC      FLOC__normaliza+5, 0 
	MOVWF       FSR0L+1 
;pesos.c,285 :: 		max_temp=maximos[cuenta];
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
;pesos.c,286 :: 		promedio=(max_temp-min_temp)/2;  // calcual la diferencia entre el maximo y minimo del sensor correspondiente
	MOVF        FLOC__normaliza+0, 0 
	MOVWF       R4 
	MOVF        FLOC__normaliza+1, 0 
	MOVWF       R5 
	MOVF        FLOC__normaliza+2, 0 
	MOVWF       R6 
	MOVF        FLOC__normaliza+3, 0 
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;pesos.c,287 :: 		if (lecturas[cuenta]>=(min_temp+promedio))  normalizados[cuenta]=1;
	MOVLW       _lecturas+0
	ADDWF       FLOC__normaliza+4, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lecturas+0)
	ADDWFC      FLOC__normaliza+5, 0 
	MOVWF       FSR0L+1 
	MOVF        FLOC__normaliza+0, 0 
	MOVWF       R4 
	MOVF        FLOC__normaliza+1, 0 
	MOVWF       R5 
	MOVF        FLOC__normaliza+2, 0 
	MOVWF       R6 
	MOVF        FLOC__normaliza+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__normaliza+0 
	MOVF        R1, 0 
	MOVWF       FLOC__normaliza+1 
	MOVF        R2, 0 
	MOVWF       FLOC__normaliza+2 
	MOVF        R3, 0 
	MOVWF       FLOC__normaliza+3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        FLOC__normaliza+0, 0 
	MOVWF       R4 
	MOVF        FLOC__normaliza+1, 0 
	MOVWF       R5 
	MOVF        FLOC__normaliza+2, 0 
	MOVWF       R6 
	MOVF        FLOC__normaliza+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_normaliza36
	MOVF        normaliza_cuenta_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _normalizados+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_normalizados+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	GOTO        L_normaliza37
L_normaliza36:
;pesos.c,288 :: 		else  normalizados[cuenta]=0;
	MOVF        normaliza_cuenta_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _normalizados+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_normalizados+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
L_normaliza37:
;pesos.c,282 :: 		for (cuenta=0;cuenta<6;cuenta++)
	INCF        normaliza_cuenta_L0+0, 1 
;pesos.c,290 :: 		} // fin del for cuenta
	GOTO        L_normaliza33
L_normaliza34:
;pesos.c,293 :: 		}
L_end_normaliza:
	RETURN      0
; end of _normaliza

_manda_normalizados:

;pesos.c,297 :: 		void manda_normalizados()
;pesos.c,299 :: 		sprinti(texto,"s1=%u   s2=%u  s3=%u   s4=%u   s5=%u   s6=%u\r\n\r\n",normalizados[0],normalizados[1],normalizados[2],normalizados[3],normalizados[4],normalizados[5]);
	MOVLW       _texto+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_4_pesos+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_4_pesos+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_4_pesos+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        _normalizados+0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        _normalizados+1, 0 
	MOVWF       FARG_sprinti_wh+6 
	MOVF        _normalizados+2, 0 
	MOVWF       FARG_sprinti_wh+7 
	MOVF        _normalizados+3, 0 
	MOVWF       FARG_sprinti_wh+8 
	MOVF        _normalizados+4, 0 
	MOVWF       FARG_sprinti_wh+9 
	MOVF        _normalizados+5, 0 
	MOVWF       FARG_sprinti_wh+10 
	MOVF        _normalizados+6, 0 
	MOVWF       FARG_sprinti_wh+11 
	MOVF        _normalizados+7, 0 
	MOVWF       FARG_sprinti_wh+12 
	MOVF        _normalizados+8, 0 
	MOVWF       FARG_sprinti_wh+13 
	MOVF        _normalizados+9, 0 
	MOVWF       FARG_sprinti_wh+14 
	MOVF        _normalizados+10, 0 
	MOVWF       FARG_sprinti_wh+15 
	MOVF        _normalizados+11, 0 
	MOVWF       FARG_sprinti_wh+16 
	CALL        _sprinti+0, 0
;pesos.c,300 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,301 :: 		}
L_end_manda_normalizados:
	RETURN      0
; end of _manda_normalizados

_calcula_pesos:

;pesos.c,304 :: 		float calcula_pesos()
;pesos.c,307 :: 		float numerador=0,denominador=0;
	CLRF        calcula_pesos_numerador_L0+0 
	CLRF        calcula_pesos_numerador_L0+1 
	CLRF        calcula_pesos_numerador_L0+2 
	CLRF        calcula_pesos_numerador_L0+3 
	CLRF        calcula_pesos_denominador_L0+0 
	CLRF        calcula_pesos_denominador_L0+1 
	CLRF        calcula_pesos_denominador_L0+2 
	CLRF        calcula_pesos_denominador_L0+3 
;pesos.c,309 :: 		for (cuenta=0;cuenta<6; cuenta++)
	CLRF        calcula_pesos_cuenta_L0+0 
L_calcula_pesos38:
	MOVLW       6
	SUBWF       calcula_pesos_cuenta_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_calcula_pesos39
;pesos.c,311 :: 		numerador=normalizados[cuenta]*pesos[cuenta]+numerador;
	MOVF        calcula_pesos_cuenta_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _normalizados+0
	ADDWF       R0, 0 
	MOVWF       FLOC__calcula_pesos+2 
	MOVLW       hi_addr(_normalizados+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__calcula_pesos+3 
	MOVF        calcula_pesos_cuenta_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pesos+0
	ADDWF       R0, 0 
	MOVWF       FLOC__calcula_pesos+0 
	MOVLW       hi_addr(_pesos+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__calcula_pesos+1 
	MOVFF       FLOC__calcula_pesos+2, FSR0L+0
	MOVFF       FLOC__calcula_pesos+3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVFF       FLOC__calcula_pesos+0, FSR0L+0
	MOVFF       FLOC__calcula_pesos+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        calcula_pesos_numerador_L0+0, 0 
	MOVWF       R4 
	MOVF        calcula_pesos_numerador_L0+1, 0 
	MOVWF       R5 
	MOVF        calcula_pesos_numerador_L0+2, 0 
	MOVWF       R6 
	MOVF        calcula_pesos_numerador_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       calcula_pesos_numerador_L0+0 
	MOVF        R1, 0 
	MOVWF       calcula_pesos_numerador_L0+1 
	MOVF        R2, 0 
	MOVWF       calcula_pesos_numerador_L0+2 
	MOVF        R3, 0 
	MOVWF       calcula_pesos_numerador_L0+3 
;pesos.c,312 :: 		denominador=normalizados[cuenta]+denominador;
	MOVFF       FLOC__calcula_pesos+2, FSR0L+0
	MOVFF       FLOC__calcula_pesos+3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        calcula_pesos_denominador_L0+0, 0 
	MOVWF       R4 
	MOVF        calcula_pesos_denominador_L0+1, 0 
	MOVWF       R5 
	MOVF        calcula_pesos_denominador_L0+2, 0 
	MOVWF       R6 
	MOVF        calcula_pesos_denominador_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       calcula_pesos_denominador_L0+0 
	MOVF        R1, 0 
	MOVWF       calcula_pesos_denominador_L0+1 
	MOVF        R2, 0 
	MOVWF       calcula_pesos_denominador_L0+2 
	MOVF        R3, 0 
	MOVWF       calcula_pesos_denominador_L0+3 
;pesos.c,309 :: 		for (cuenta=0;cuenta<6; cuenta++)
	INCF        calcula_pesos_cuenta_L0+0, 1 
;pesos.c,313 :: 		}// for cuenta
	GOTO        L_calcula_pesos38
L_calcula_pesos39:
;pesos.c,316 :: 		if (denominador>=5.8) // indica que todo esta en negro, se recominda rectificar movimiento
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       57
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	MOVF        calcula_pesos_denominador_L0+0, 0 
	MOVWF       R0 
	MOVF        calcula_pesos_denominador_L0+1, 0 
	MOVWF       R1 
	MOVF        calcula_pesos_denominador_L0+2, 0 
	MOVWF       R2 
	MOVF        calcula_pesos_denominador_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_calcula_pesos41
;pesos.c,318 :: 		if (peso_anterior>0) return(10.0); // si estaba muy a la derecha antes retorna el maximo valor a la derecha
	MOVF        _peso_anterior+0, 0 
	MOVWF       R4 
	MOVF        _peso_anterior+1, 0 
	MOVWF       R5 
	MOVF        _peso_anterior+2, 0 
	MOVWF       R6 
	MOVF        _peso_anterior+3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_calcula_pesos42
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	GOTO        L_end_calcula_pesos
L_calcula_pesos42:
;pesos.c,319 :: 		else  if (peso_anterior<0) return(-10.0);  // si estaba muy a la izquierda antes retorna el maximo valor a la izquierda
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _peso_anterior+0, 0 
	MOVWF       R0 
	MOVF        _peso_anterior+1, 0 
	MOVWF       R1 
	MOVF        _peso_anterior+2, 0 
	MOVWF       R2 
	MOVF        _peso_anterior+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_calcula_pesos44
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       160
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	GOTO        L_end_calcula_pesos
L_calcula_pesos44:
;pesos.c,320 :: 		}
	GOTO        L_calcula_pesos45
L_calcula_pesos41:
;pesos.c,322 :: 		else if (denominador<=0.2) // indica que no esta en la linea , se salio  para evitar errores flotante
	MOVF        calcula_pesos_denominador_L0+0, 0 
	MOVWF       R4 
	MOVF        calcula_pesos_denominador_L0+1, 0 
	MOVWF       R5 
	MOVF        calcula_pesos_denominador_L0+2, 0 
	MOVWF       R6 
	MOVF        calcula_pesos_denominador_L0+3, 0 
	MOVWF       R7 
	MOVLW       205
	MOVWF       R0 
	MOVLW       204
	MOVWF       R1 
	MOVLW       76
	MOVWF       R2 
	MOVLW       124
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_calcula_pesos46
;pesos.c,324 :: 		if (peso_anterior>0) return(10.0); // si estaba muy a la derecha antes retorna el maximo valor a la derecha
	MOVF        _peso_anterior+0, 0 
	MOVWF       R4 
	MOVF        _peso_anterior+1, 0 
	MOVWF       R5 
	MOVF        _peso_anterior+2, 0 
	MOVWF       R6 
	MOVF        _peso_anterior+3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_calcula_pesos47
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	GOTO        L_end_calcula_pesos
L_calcula_pesos47:
;pesos.c,325 :: 		else  if (peso_anterior<0) return(-10.0);  // si estaba muy a la izquierda antes retorna el maximo valor a la izquierda
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _peso_anterior+0, 0 
	MOVWF       R0 
	MOVF        _peso_anterior+1, 0 
	MOVWF       R1 
	MOVF        _peso_anterior+2, 0 
	MOVWF       R2 
	MOVF        _peso_anterior+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_calcula_pesos49
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       160
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	GOTO        L_end_calcula_pesos
L_calcula_pesos49:
;pesos.c,326 :: 		}
	GOTO        L_calcula_pesos50
L_calcula_pesos46:
;pesos.c,328 :: 		valor=numerador/denominador;
	MOVF        calcula_pesos_denominador_L0+0, 0 
	MOVWF       R4 
	MOVF        calcula_pesos_denominador_L0+1, 0 
	MOVWF       R5 
	MOVF        calcula_pesos_denominador_L0+2, 0 
	MOVWF       R6 
	MOVF        calcula_pesos_denominador_L0+3, 0 
	MOVWF       R7 
	MOVF        calcula_pesos_numerador_L0+0, 0 
	MOVWF       R0 
	MOVF        calcula_pesos_numerador_L0+1, 0 
	MOVWF       R1 
	MOVF        calcula_pesos_numerador_L0+2, 0 
	MOVWF       R2 
	MOVF        calcula_pesos_numerador_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       calcula_pesos_valor_L0+0 
	MOVF        R1, 0 
	MOVWF       calcula_pesos_valor_L0+1 
	MOVF        R2, 0 
	MOVWF       calcula_pesos_valor_L0+2 
	MOVF        R3, 0 
	MOVWF       calcula_pesos_valor_L0+3 
L_calcula_pesos50:
L_calcula_pesos45:
;pesos.c,329 :: 		peso_anterior=valor;//  almacena el valor por si se lelga a salir de la linea
	MOVF        calcula_pesos_valor_L0+0, 0 
	MOVWF       _peso_anterior+0 
	MOVF        calcula_pesos_valor_L0+1, 0 
	MOVWF       _peso_anterior+1 
	MOVF        calcula_pesos_valor_L0+2, 0 
	MOVWF       _peso_anterior+2 
	MOVF        calcula_pesos_valor_L0+3, 0 
	MOVWF       _peso_anterior+3 
;pesos.c,330 :: 		return(valor);
	MOVF        calcula_pesos_valor_L0+0, 0 
	MOVWF       R0 
	MOVF        calcula_pesos_valor_L0+1, 0 
	MOVWF       R1 
	MOVF        calcula_pesos_valor_L0+2, 0 
	MOVWF       R2 
	MOVF        calcula_pesos_valor_L0+3, 0 
	MOVWF       R3 
;pesos.c,332 :: 		}
L_end_calcula_pesos:
	RETURN      0
; end of _calcula_pesos

_manda_caculo_pesos:

;pesos.c,334 :: 		void manda_caculo_pesos()
;pesos.c,336 :: 		sprintf(texto,"desvio=%.1f \r\n\r\n",calcula_pesos());
	CALL        _calcula_pesos+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_5_pesos+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_5_pesos+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_5_pesos+0)
	MOVWF       FARG_sprintf_f+2 
	CALL        _sprintf+0, 0
;pesos.c,337 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,338 :: 		}
L_end_manda_caculo_pesos:
	RETURN      0
; end of _manda_caculo_pesos

_map:

;pesos.c,340 :: 		float map(float x, float in_min, float in_max, float out_min, float out_max)
;pesos.c,342 :: 		return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
	MOVF        FARG_map_in_min+0, 0 
	MOVWF       R4 
	MOVF        FARG_map_in_min+1, 0 
	MOVWF       R5 
	MOVF        FARG_map_in_min+2, 0 
	MOVWF       R6 
	MOVF        FARG_map_in_min+3, 0 
	MOVWF       R7 
	MOVF        FARG_map_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_map_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_map_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_map_x+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__map+0 
	MOVF        R1, 0 
	MOVWF       FLOC__map+1 
	MOVF        R2, 0 
	MOVWF       FLOC__map+2 
	MOVF        R3, 0 
	MOVWF       FLOC__map+3 
	MOVF        FARG_map_out_min+0, 0 
	MOVWF       R4 
	MOVF        FARG_map_out_min+1, 0 
	MOVWF       R5 
	MOVF        FARG_map_out_min+2, 0 
	MOVWF       R6 
	MOVF        FARG_map_out_min+3, 0 
	MOVWF       R7 
	MOVF        FARG_map_out_max+0, 0 
	MOVWF       R0 
	MOVF        FARG_map_out_max+1, 0 
	MOVWF       R1 
	MOVF        FARG_map_out_max+2, 0 
	MOVWF       R2 
	MOVF        FARG_map_out_max+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        FLOC__map+0, 0 
	MOVWF       R4 
	MOVF        FLOC__map+1, 0 
	MOVWF       R5 
	MOVF        FLOC__map+2, 0 
	MOVWF       R6 
	MOVF        FLOC__map+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__map+0 
	MOVF        R1, 0 
	MOVWF       FLOC__map+1 
	MOVF        R2, 0 
	MOVWF       FLOC__map+2 
	MOVF        R3, 0 
	MOVWF       FLOC__map+3 
	MOVF        FARG_map_in_min+0, 0 
	MOVWF       R4 
	MOVF        FARG_map_in_min+1, 0 
	MOVWF       R5 
	MOVF        FARG_map_in_min+2, 0 
	MOVWF       R6 
	MOVF        FARG_map_in_min+3, 0 
	MOVWF       R7 
	MOVF        FARG_map_in_max+0, 0 
	MOVWF       R0 
	MOVF        FARG_map_in_max+1, 0 
	MOVWF       R1 
	MOVF        FARG_map_in_max+2, 0 
	MOVWF       R2 
	MOVF        FARG_map_in_max+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__map+0, 0 
	MOVWF       R0 
	MOVF        FLOC__map+1, 0 
	MOVWF       R1 
	MOVF        FLOC__map+2, 0 
	MOVWF       R2 
	MOVF        FLOC__map+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FARG_map_out_min+0, 0 
	MOVWF       R4 
	MOVF        FARG_map_out_min+1, 0 
	MOVWF       R5 
	MOVF        FARG_map_out_min+2, 0 
	MOVWF       R6 
	MOVF        FARG_map_out_min+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
;pesos.c,343 :: 		}
L_end_map:
	RETURN      0
; end of _map

_aplica_pwm:

;pesos.c,345 :: 		void aplica_pwm(float pwm_vel)
;pesos.c,347 :: 		velo_der=velo_basica-pwm_vel;   // uno gana velocidad
	MOVF        FARG_aplica_pwm_pwm_vel+0, 0 
	MOVWF       R4 
	MOVF        FARG_aplica_pwm_pwm_vel+1, 0 
	MOVWF       R5 
	MOVF        FARG_aplica_pwm_pwm_vel+2, 0 
	MOVWF       R6 
	MOVF        FARG_aplica_pwm_pwm_vel+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__aplica_pwm+0 
	MOVF        R1, 0 
	MOVWF       FLOC__aplica_pwm+1 
	MOVF        R2, 0 
	MOVWF       FLOC__aplica_pwm+2 
	MOVF        R3, 0 
	MOVWF       FLOC__aplica_pwm+3 
	MOVF        FLOC__aplica_pwm+0, 0 
	MOVWF       _velo_der+0 
	MOVF        FLOC__aplica_pwm+1, 0 
	MOVWF       _velo_der+1 
	MOVF        FLOC__aplica_pwm+2, 0 
	MOVWF       _velo_der+2 
	MOVF        FLOC__aplica_pwm+3, 0 
	MOVWF       _velo_der+3 
;pesos.c,348 :: 		velo_izq=velo_basica+pwm_vel;   // otro pierde velocidad
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	MOVF        FARG_aplica_pwm_pwm_vel+0, 0 
	MOVWF       R4 
	MOVF        FARG_aplica_pwm_pwm_vel+1, 0 
	MOVWF       R5 
	MOVF        FARG_aplica_pwm_pwm_vel+2, 0 
	MOVWF       R6 
	MOVF        FARG_aplica_pwm_pwm_vel+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _velo_izq+0 
	MOVF        R1, 0 
	MOVWF       _velo_izq+1 
	MOVF        R2, 0 
	MOVWF       _velo_izq+2 
	MOVF        R3, 0 
	MOVWF       _velo_izq+3 
;pesos.c,350 :: 		if (velo_der<0) velo_der=0;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        FLOC__aplica_pwm+0, 0 
	MOVWF       R0 
	MOVF        FLOC__aplica_pwm+1, 0 
	MOVWF       R1 
	MOVF        FLOC__aplica_pwm+2, 0 
	MOVWF       R2 
	MOVF        FLOC__aplica_pwm+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm51
	CLRF        _velo_der+0 
	CLRF        _velo_der+1 
	CLRF        _velo_der+2 
	CLRF        _velo_der+3 
L_aplica_pwm51:
;pesos.c,351 :: 		if (velo_der>255) velo_der=255;
	MOVF        _velo_der+0, 0 
	MOVWF       R4 
	MOVF        _velo_der+1, 0 
	MOVWF       R5 
	MOVF        _velo_der+2, 0 
	MOVWF       R6 
	MOVF        _velo_der+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm52
	MOVLW       0
	MOVWF       _velo_der+0 
	MOVLW       0
	MOVWF       _velo_der+1 
	MOVLW       127
	MOVWF       _velo_der+2 
	MOVLW       134
	MOVWF       _velo_der+3 
L_aplica_pwm52:
;pesos.c,352 :: 		if (velo_izq<0) velo_izq=0;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _velo_izq+0, 0 
	MOVWF       R0 
	MOVF        _velo_izq+1, 0 
	MOVWF       R1 
	MOVF        _velo_izq+2, 0 
	MOVWF       R2 
	MOVF        _velo_izq+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm53
	CLRF        _velo_izq+0 
	CLRF        _velo_izq+1 
	CLRF        _velo_izq+2 
	CLRF        _velo_izq+3 
L_aplica_pwm53:
;pesos.c,353 :: 		if (velo_izq>255) velo_izq=255;
	MOVF        _velo_izq+0, 0 
	MOVWF       R4 
	MOVF        _velo_izq+1, 0 
	MOVWF       R5 
	MOVF        _velo_izq+2, 0 
	MOVWF       R6 
	MOVF        _velo_izq+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm54
	MOVLW       0
	MOVWF       _velo_izq+0 
	MOVLW       0
	MOVWF       _velo_izq+1 
	MOVLW       127
	MOVWF       _velo_izq+2 
	MOVLW       134
	MOVWF       _velo_izq+3 
L_aplica_pwm54:
;pesos.c,356 :: 		m1_g=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,357 :: 		m2_g=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,359 :: 		PWM1_Set_Duty(velo_der);
	MOVF        _velo_der+0, 0 
	MOVWF       R0 
	MOVF        _velo_der+1, 0 
	MOVWF       R1 
	MOVF        _velo_der+2, 0 
	MOVWF       R2 
	MOVF        _velo_der+3, 0 
	MOVWF       R3 
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,360 :: 		PWM2_Set_Duty(velo_izq);
	MOVF        _velo_izq+0, 0 
	MOVWF       R0 
	MOVF        _velo_izq+1, 0 
	MOVWF       R1 
	MOVF        _velo_izq+2, 0 
	MOVWF       R2 
	MOVF        _velo_izq+3, 0 
	MOVWF       R3 
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,361 :: 		}
L_end_aplica_pwm:
	RETURN      0
; end of _aplica_pwm

_aplica_pwm_fast:

;pesos.c,364 :: 		void aplica_pwm_fast(float pwm_vel)
;pesos.c,366 :: 		velo_der=velo_basica-pwm_vel;   // uno gana velocidad
	MOVF        FARG_aplica_pwm_fast_pwm_vel+0, 0 
	MOVWF       R4 
	MOVF        FARG_aplica_pwm_fast_pwm_vel+1, 0 
	MOVWF       R5 
	MOVF        FARG_aplica_pwm_fast_pwm_vel+2, 0 
	MOVWF       R6 
	MOVF        FARG_aplica_pwm_fast_pwm_vel+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__aplica_pwm_fast+0 
	MOVF        R1, 0 
	MOVWF       FLOC__aplica_pwm_fast+1 
	MOVF        R2, 0 
	MOVWF       FLOC__aplica_pwm_fast+2 
	MOVF        R3, 0 
	MOVWF       FLOC__aplica_pwm_fast+3 
	MOVF        FLOC__aplica_pwm_fast+0, 0 
	MOVWF       _velo_der+0 
	MOVF        FLOC__aplica_pwm_fast+1, 0 
	MOVWF       _velo_der+1 
	MOVF        FLOC__aplica_pwm_fast+2, 0 
	MOVWF       _velo_der+2 
	MOVF        FLOC__aplica_pwm_fast+3, 0 
	MOVWF       _velo_der+3 
;pesos.c,367 :: 		velo_izq=velo_basica+pwm_vel;   // otro pierde velocidad
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	MOVF        FARG_aplica_pwm_fast_pwm_vel+0, 0 
	MOVWF       R4 
	MOVF        FARG_aplica_pwm_fast_pwm_vel+1, 0 
	MOVWF       R5 
	MOVF        FARG_aplica_pwm_fast_pwm_vel+2, 0 
	MOVWF       R6 
	MOVF        FARG_aplica_pwm_fast_pwm_vel+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _velo_izq+0 
	MOVF        R1, 0 
	MOVWF       _velo_izq+1 
	MOVF        R2, 0 
	MOVWF       _velo_izq+2 
	MOVF        R3, 0 
	MOVWF       _velo_izq+3 
;pesos.c,369 :: 		if (velo_der<-255) velo_der=-255;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       255
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	MOVF        FLOC__aplica_pwm_fast+0, 0 
	MOVWF       R0 
	MOVF        FLOC__aplica_pwm_fast+1, 0 
	MOVWF       R1 
	MOVF        FLOC__aplica_pwm_fast+2, 0 
	MOVWF       R2 
	MOVF        FLOC__aplica_pwm_fast+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm_fast55
	MOVLW       0
	MOVWF       _velo_der+0 
	MOVLW       0
	MOVWF       _velo_der+1 
	MOVLW       255
	MOVWF       _velo_der+2 
	MOVLW       134
	MOVWF       _velo_der+3 
L_aplica_pwm_fast55:
;pesos.c,370 :: 		if (velo_der>255) velo_der=255;
	MOVF        _velo_der+0, 0 
	MOVWF       R4 
	MOVF        _velo_der+1, 0 
	MOVWF       R5 
	MOVF        _velo_der+2, 0 
	MOVWF       R6 
	MOVF        _velo_der+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm_fast56
	MOVLW       0
	MOVWF       _velo_der+0 
	MOVLW       0
	MOVWF       _velo_der+1 
	MOVLW       127
	MOVWF       _velo_der+2 
	MOVLW       134
	MOVWF       _velo_der+3 
L_aplica_pwm_fast56:
;pesos.c,371 :: 		if (velo_izq<-255) velo_izq=-255;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       255
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	MOVF        _velo_izq+0, 0 
	MOVWF       R0 
	MOVF        _velo_izq+1, 0 
	MOVWF       R1 
	MOVF        _velo_izq+2, 0 
	MOVWF       R2 
	MOVF        _velo_izq+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm_fast57
	MOVLW       0
	MOVWF       _velo_izq+0 
	MOVLW       0
	MOVWF       _velo_izq+1 
	MOVLW       255
	MOVWF       _velo_izq+2 
	MOVLW       134
	MOVWF       _velo_izq+3 
L_aplica_pwm_fast57:
;pesos.c,372 :: 		if (velo_izq>255) velo_izq=255;
	MOVF        _velo_izq+0, 0 
	MOVWF       R4 
	MOVF        _velo_izq+1, 0 
	MOVWF       R5 
	MOVF        _velo_izq+2, 0 
	MOVWF       R6 
	MOVF        _velo_izq+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm_fast58
	MOVLW       0
	MOVWF       _velo_izq+0 
	MOVLW       0
	MOVWF       _velo_izq+1 
	MOVLW       127
	MOVWF       _velo_izq+2 
	MOVLW       134
	MOVWF       _velo_izq+3 
L_aplica_pwm_fast58:
;pesos.c,375 :: 		if (velo_der<=0)  m1_g=1;   // invierte giro
	MOVF        _velo_der+0, 0 
	MOVWF       R4 
	MOVF        _velo_der+1, 0 
	MOVWF       R5 
	MOVF        _velo_der+2, 0 
	MOVWF       R6 
	MOVF        _velo_der+3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm_fast59
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
	GOTO        L_aplica_pwm_fast60
L_aplica_pwm_fast59:
;pesos.c,376 :: 		else m1_g=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
L_aplica_pwm_fast60:
;pesos.c,378 :: 		if (velo_izq<=0)  m2_g=1;   // invierte giro
	MOVF        _velo_izq+0, 0 
	MOVWF       R4 
	MOVF        _velo_izq+1, 0 
	MOVWF       R5 
	MOVF        _velo_izq+2, 0 
	MOVWF       R6 
	MOVF        _velo_izq+3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_aplica_pwm_fast61
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
	GOTO        L_aplica_pwm_fast62
L_aplica_pwm_fast61:
;pesos.c,379 :: 		else m2_g==0;
L_aplica_pwm_fast62:
;pesos.c,382 :: 		PWM1_Set_Duty(abs(velo_der));
	MOVF        _velo_der+0, 0 
	MOVWF       R0 
	MOVF        _velo_der+1, 0 
	MOVWF       R1 
	MOVF        _velo_der+2, 0 
	MOVWF       R2 
	MOVF        _velo_der+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,383 :: 		PWM2_Set_Duty(abs(velo_izq));
	MOVF        _velo_izq+0, 0 
	MOVWF       R0 
	MOVF        _velo_izq+1, 0 
	MOVWF       R1 
	MOVF        _velo_izq+2, 0 
	MOVWF       R2 
	MOVF        _velo_izq+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,384 :: 		}
L_end_aplica_pwm_fast:
	RETURN      0
; end of _aplica_pwm_fast

_proporcional:

;pesos.c,385 :: 		void proporcional(float pro_in)
;pesos.c,388 :: 		velo_giro=map(pro_in,-10.0,10.0,-(float)velo_giro_max,(float)velo_giro_max);
	MOVF        FARG_proporcional_pro_in+0, 0 
	MOVWF       FARG_map_x+0 
	MOVF        FARG_proporcional_pro_in+1, 0 
	MOVWF       FARG_map_x+1 
	MOVF        FARG_proporcional_pro_in+2, 0 
	MOVWF       FARG_map_x+2 
	MOVF        FARG_proporcional_pro_in+3, 0 
	MOVWF       FARG_map_x+3 
	MOVLW       0
	MOVWF       FARG_map_in_min+0 
	MOVLW       0
	MOVWF       FARG_map_in_min+1 
	MOVLW       160
	MOVWF       FARG_map_in_min+2 
	MOVLW       130
	MOVWF       FARG_map_in_min+3 
	MOVLW       0
	MOVWF       FARG_map_in_max+0 
	MOVLW       0
	MOVWF       FARG_map_in_max+1 
	MOVLW       32
	MOVWF       FARG_map_in_max+2 
	MOVLW       130
	MOVWF       FARG_map_in_max+3 
	MOVLW       0
	MOVWF       FARG_map_out_min+0 
	MOVLW       0
	MOVWF       FARG_map_out_min+1 
	MOVLW       130
	MOVWF       FARG_map_out_min+2 
	MOVLW       134
	MOVWF       FARG_map_out_min+3 
	MOVLW       0
	MOVWF       FARG_map_out_max+0 
	MOVLW       0
	MOVWF       FARG_map_out_max+1 
	MOVLW       2
	MOVWF       FARG_map_out_max+2 
	MOVLW       134
	MOVWF       FARG_map_out_max+3 
	CALL        _map+0, 0
	MOVF        R0, 0 
	MOVWF       _velo_giro+0 
	MOVF        R1, 0 
	MOVWF       _velo_giro+1 
	MOVF        R2, 0 
	MOVWF       _velo_giro+2 
	MOVF        R3, 0 
	MOVWF       _velo_giro+3 
;pesos.c,389 :: 		aplica_pwm(velo_giro);
	MOVF        R0, 0 
	MOVWF       FARG_aplica_pwm_pwm_vel+0 
	MOVF        R1, 0 
	MOVWF       FARG_aplica_pwm_pwm_vel+1 
	MOVF        R2, 0 
	MOVWF       FARG_aplica_pwm_pwm_vel+2 
	MOVF        R3, 0 
	MOVWF       FARG_aplica_pwm_pwm_vel+3 
	CALL        _aplica_pwm+0, 0
;pesos.c,390 :: 		}
L_end_proporcional:
	RETURN      0
; end of _proporcional

_PID:

;pesos.c,403 :: 		void PID(float pid_in)
;pesos.c,407 :: 		error=setpoint-pid_in;
	MOVF        FARG_PID_pid_in+0, 0 
	MOVWF       R4 
	MOVF        FARG_PID_pid_in+1, 0 
	MOVWF       R5 
	MOVF        FARG_PID_pid_in+2, 0 
	MOVWF       R6 
	MOVF        FARG_PID_pid_in+3, 0 
	MOVWF       R7 
	MOVF        _setpoint+0, 0 
	MOVWF       R0 
	MOVF        _setpoint+1, 0 
	MOVWF       R1 
	MOVF        _setpoint+2, 0 
	MOVWF       R2 
	MOVF        _setpoint+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__PID+0 
	MOVF        R1, 0 
	MOVWF       FLOC__PID+1 
	MOVF        R2, 0 
	MOVWF       FLOC__PID+2 
	MOVF        R3, 0 
	MOVWF       FLOC__PID+3 
	MOVF        FLOC__PID+0, 0 
	MOVWF       _error+0 
	MOVF        FLOC__PID+1, 0 
	MOVWF       _error+1 
	MOVF        FLOC__PID+2, 0 
	MOVWF       _error+2 
	MOVF        FLOC__PID+3, 0 
	MOVWF       _error+3 
;pesos.c,409 :: 		up=kp*error;   // salida proporcional
	MOVF        _kp+0, 0 
	MOVWF       R0 
	MOVF        _kp+1, 0 
	MOVWF       R1 
	MOVF        _kp+2, 0 
	MOVWF       R2 
	MOVF        _kp+3, 0 
	MOVWF       R3 
	MOVF        FLOC__PID+0, 0 
	MOVWF       R4 
	MOVF        FLOC__PID+1, 0 
	MOVWF       R5 
	MOVF        FLOC__PID+2, 0 
	MOVWF       R6 
	MOVF        FLOC__PID+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__PID+8 
	MOVF        R1, 0 
	MOVWF       FLOC__PID+9 
	MOVF        R2, 0 
	MOVWF       FLOC__PID+10 
	MOVF        R3, 0 
	MOVWF       FLOC__PID+11 
	MOVF        FLOC__PID+8, 0 
	MOVWF       _up+0 
	MOVF        FLOC__PID+9, 0 
	MOVWF       _up+1 
	MOVF        FLOC__PID+10, 0 
	MOVWF       _up+2 
	MOVF        FLOC__PID+11, 0 
	MOVWF       _up+3 
;pesos.c,411 :: 		ui=ui_ + (ki*t_muestreo*error);   // salida integar
	MOVF        _ki+0, 0 
	MOVWF       R0 
	MOVF        _ki+1, 0 
	MOVWF       R1 
	MOVF        _ki+2, 0 
	MOVWF       R2 
	MOVF        _ki+3, 0 
	MOVWF       R3 
	MOVF        FLOC__PID+0, 0 
	MOVWF       R4 
	MOVF        FLOC__PID+1, 0 
	MOVWF       R5 
	MOVF        FLOC__PID+2, 0 
	MOVWF       R6 
	MOVF        FLOC__PID+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _ui_+0, 0 
	MOVWF       R4 
	MOVF        _ui_+1, 0 
	MOVWF       R5 
	MOVF        _ui_+2, 0 
	MOVWF       R6 
	MOVF        _ui_+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__PID+4 
	MOVF        R1, 0 
	MOVWF       FLOC__PID+5 
	MOVF        R2, 0 
	MOVWF       FLOC__PID+6 
	MOVF        R3, 0 
	MOVWF       FLOC__PID+7 
	MOVF        FLOC__PID+4, 0 
	MOVWF       _ui+0 
	MOVF        FLOC__PID+5, 0 
	MOVWF       _ui+1 
	MOVF        FLOC__PID+6, 0 
	MOVWF       _ui+2 
	MOVF        FLOC__PID+7, 0 
	MOVWF       _ui+3 
;pesos.c,413 :: 		ud=kd*(error-error_)/t_muestreo;   // SALADA DERIVATIVA
	MOVF        _error_+0, 0 
	MOVWF       R4 
	MOVF        _error_+1, 0 
	MOVWF       R5 
	MOVF        _error_+2, 0 
	MOVWF       R6 
	MOVF        _error_+3, 0 
	MOVWF       R7 
	MOVF        FLOC__PID+0, 0 
	MOVWF       R0 
	MOVF        FLOC__PID+1, 0 
	MOVWF       R1 
	MOVF        FLOC__PID+2, 0 
	MOVWF       R2 
	MOVF        FLOC__PID+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        _kd+0, 0 
	MOVWF       R4 
	MOVF        _kd+1, 0 
	MOVWF       R5 
	MOVF        _kd+2, 0 
	MOVWF       R6 
	MOVF        _kd+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__PID+0 
	MOVF        R1, 0 
	MOVWF       FLOC__PID+1 
	MOVF        R2, 0 
	MOVWF       FLOC__PID+2 
	MOVF        R3, 0 
	MOVWF       FLOC__PID+3 
	MOVF        FLOC__PID+0, 0 
	MOVWF       _ud+0 
	MOVF        FLOC__PID+1, 0 
	MOVWF       _ud+1 
	MOVF        FLOC__PID+2, 0 
	MOVWF       _ud+2 
	MOVF        FLOC__PID+3, 0 
	MOVWF       _ud+3 
;pesos.c,415 :: 		ut=up+ui+ud;  //SALIDA TOTAL
	MOVF        FLOC__PID+8, 0 
	MOVWF       R0 
	MOVF        FLOC__PID+9, 0 
	MOVWF       R1 
	MOVF        FLOC__PID+10, 0 
	MOVWF       R2 
	MOVF        FLOC__PID+11, 0 
	MOVWF       R3 
	MOVF        FLOC__PID+4, 0 
	MOVWF       R4 
	MOVF        FLOC__PID+5, 0 
	MOVWF       R5 
	MOVF        FLOC__PID+6, 0 
	MOVWF       R6 
	MOVF        FLOC__PID+7, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        FLOC__PID+0, 0 
	MOVWF       R4 
	MOVF        FLOC__PID+1, 0 
	MOVWF       R5 
	MOVF        FLOC__PID+2, 0 
	MOVWF       R6 
	MOVF        FLOC__PID+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ut+0 
	MOVF        R1, 0 
	MOVWF       _ut+1 
	MOVF        R2, 0 
	MOVWF       _ut+2 
	MOVF        R3, 0 
	MOVWF       _ut+3 
;pesos.c,418 :: 		if (ut>max_x) ut=max_x;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _max_x+0, 0 
	MOVWF       R0 
	MOVF        _max_x+1, 0 
	MOVWF       R1 
	MOVF        _max_x+2, 0 
	MOVWF       R2 
	MOVF        _max_x+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_PID63
	MOVF        _max_x+0, 0 
	MOVWF       _ut+0 
	MOVF        _max_x+1, 0 
	MOVWF       _ut+1 
	MOVF        _max_x+2, 0 
	MOVWF       _ut+2 
	MOVF        _max_x+3, 0 
	MOVWF       _ut+3 
L_PID63:
;pesos.c,419 :: 		if (ut<min_x) ut=min_x;
	MOVF        _min_x+0, 0 
	MOVWF       R4 
	MOVF        _min_x+1, 0 
	MOVWF       R5 
	MOVF        _min_x+2, 0 
	MOVWF       R6 
	MOVF        _min_x+3, 0 
	MOVWF       R7 
	MOVF        _ut+0, 0 
	MOVWF       R0 
	MOVF        _ut+1, 0 
	MOVWF       R1 
	MOVF        _ut+2, 0 
	MOVWF       R2 
	MOVF        _ut+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_PID64
	MOVF        _min_x+0, 0 
	MOVWF       _ut+0 
	MOVF        _min_x+1, 0 
	MOVWF       _ut+1 
	MOVF        _min_x+2, 0 
	MOVWF       _ut+2 
	MOVF        _min_x+3, 0 
	MOVWF       _ut+3 
L_PID64:
;pesos.c,421 :: 		ui_=ui;// Guarda salida inetgar anterior
	MOVF        _ui+0, 0 
	MOVWF       _ui_+0 
	MOVF        _ui+1, 0 
	MOVWF       _ui_+1 
	MOVF        _ui+2, 0 
	MOVWF       _ui_+2 
	MOVF        _ui+3, 0 
	MOVWF       _ui_+3 
;pesos.c,423 :: 		error_=error;
	MOVF        _error+0, 0 
	MOVWF       _error_+0 
	MOVF        _error+1, 0 
	MOVWF       _error_+1 
	MOVF        _error+2, 0 
	MOVWF       _error_+2 
	MOVF        _error+3, 0 
	MOVWF       _error_+3 
;pesos.c,425 :: 		aplica_pwm_fast(-ut);
	MOVLW       0
	XORWF       _ut+0, 0 
	MOVWF       FARG_aplica_pwm_fast_pwm_vel+0 
	MOVLW       0
	XORWF       _ut+1, 0 
	MOVWF       FARG_aplica_pwm_fast_pwm_vel+1 
	MOVLW       128
	XORWF       _ut+2, 0 
	MOVWF       FARG_aplica_pwm_fast_pwm_vel+2 
	MOVLW       0
	XORWF       _ut+3, 0 
	MOVWF       FARG_aplica_pwm_fast_pwm_vel+3 
	CALL        _aplica_pwm_fast+0, 0
;pesos.c,427 :: 		}
L_end_PID:
	RETURN      0
; end of _PID

_main:

;pesos.c,429 :: 		void main()
;pesos.c,432 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;pesos.c,433 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;pesos.c,434 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;pesos.c,437 :: 		TRISC1_bit=0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;pesos.c,438 :: 		TRISC2_bit=0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;pesos.c,440 :: 		m1_g_dir=0;
	BCF         TRISB3_bit+0, BitPos(TRISB3_bit+0) 
;pesos.c,441 :: 		m2_g_dir=0;
	BCF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;pesos.c,443 :: 		leds_dir=0;
	BCF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;pesos.c,447 :: 		TRISC0_bit=0;
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;pesos.c,450 :: 		TRISB7_bit=1;
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;pesos.c,452 :: 		NOT_RBPU_bit=0;
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
;pesos.c,455 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;pesos.c,456 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW       ?lstr6_pesos+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_pesos+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,458 :: 		PWM1_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;pesos.c,459 :: 		PWM2_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;pesos.c,461 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,462 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,463 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;pesos.c,464 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;pesos.c,466 :: 		calibra_ir();
	CALL        _calibra_ir+0, 0
;pesos.c,467 :: 		manda_limites();
	CALL        _manda_limites+0, 0
;pesos.c,469 :: 		while (sw==1);
L_main65:
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main66
	GOTO        L_main65
L_main66:
;pesos.c,472 :: 		while (1)
L_main67:
;pesos.c,474 :: 		analizasensoresir();
	CALL        _analizasensoresir+0, 0
;pesos.c,475 :: 		normaliza();
	CALL        _normaliza+0, 0
;pesos.c,477 :: 		PID(calcula_pesos());
	CALL        _calcula_pesos+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PID_pid_in+0 
	MOVF        R1, 0 
	MOVWF       FARG_PID_pid_in+1 
	MOVF        R2, 0 
	MOVWF       FARG_PID_pid_in+2 
	MOVF        R3, 0 
	MOVWF       FARG_PID_pid_in+3 
	CALL        _PID+0, 0
;pesos.c,478 :: 		led=!led;
	BTG         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,485 :: 		}
	GOTO        L_main67
;pesos.c,488 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
