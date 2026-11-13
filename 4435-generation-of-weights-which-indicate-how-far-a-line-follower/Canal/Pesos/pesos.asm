
_config_timer1:

;pesos.c,72 :: 		void config_timer1 ()
;pesos.c,74 :: 		T1CON=0;
	CLRF        T1CON+0 
;pesos.c,76 :: 		TMR1H=236;
	MOVLW       236
	MOVWF       TMR1H+0 
;pesos.c,77 :: 		TMR1L=120;
	MOVLW       120
	MOVWF       TMR1L+0 
;pesos.c,79 :: 		T1CKPS1_bit=0;
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;pesos.c,80 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;pesos.c,82 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;pesos.c,83 :: 		TMR1ON_bit=0;
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;pesos.c,84 :: 		}
L_end_config_timer1:
	RETURN      0
; end of _config_timer1

_config_salidas:

;pesos.c,89 :: 		void config_salidas()//salida todos los sensores
;pesos.c,91 :: 		s1_dir=0;
	BCF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;pesos.c,92 :: 		s2_dir=0;
	BCF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;pesos.c,93 :: 		s3_dir=0;
	BCF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;pesos.c,94 :: 		s4_dir=0;
	BCF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;pesos.c,95 :: 		s5_dir=0;
	BCF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;pesos.c,96 :: 		s6_dir=0;
	BCF         TRISA5_bit+0, BitPos(TRISA5_bit+0) 
;pesos.c,97 :: 		}
L_end_config_salidas:
	RETURN      0
; end of _config_salidas

_config_entradas:

;pesos.c,100 :: 		void config_entradas()//entrada todos los sensores
;pesos.c,102 :: 		s1_dir=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;pesos.c,103 :: 		s2_dir=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;pesos.c,104 :: 		s3_dir=1;
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;pesos.c,105 :: 		s4_dir=1;
	BSF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;pesos.c,106 :: 		s5_dir=1;
	BSF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;pesos.c,107 :: 		s6_dir=1;
	BSF         TRISA5_bit+0, BitPos(TRISA5_bit+0) 
;pesos.c,108 :: 		}
L_end_config_entradas:
	RETURN      0
; end of _config_entradas

_saca_uno:

;pesos.c,111 :: 		void saca_uno()
;pesos.c,113 :: 		s1_out=1;
	BSF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;pesos.c,114 :: 		s2_out=1;
	BSF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;pesos.c,115 :: 		s3_out=1;
	BSF         LATA2_bit+0, BitPos(LATA2_bit+0) 
;pesos.c,116 :: 		s4_out=1;
	BSF         LATA3_bit+0, BitPos(LATA3_bit+0) 
;pesos.c,117 :: 		s5_out=1;
	BSF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;pesos.c,118 :: 		s6_out=1;
	BSF         LATA5_bit+0, BitPos(LATA5_bit+0) 
;pesos.c,119 :: 		}
L_end_saca_uno:
	RETURN      0
; end of _saca_uno

_analizasensoresir:

;pesos.c,121 :: 		void analizasensoresir()
;pesos.c,124 :: 		config_timer1();
	CALL        _config_timer1+0, 0
;pesos.c,125 :: 		leds=1;// enciende la regleta d elos leds
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;pesos.c,126 :: 		config_salidas();
	CALL        _config_salidas+0, 0
;pesos.c,127 :: 		saca_uno();
	CALL        _saca_uno+0, 0
;pesos.c,128 :: 		Delay_us(10);
	MOVLW       3
	MOVWF       R13, 0
L_analizasensoresir0:
	DECFSZ      R13, 1, 1
	BRA         L_analizasensoresir0
;pesos.c,129 :: 		config_entradas();
	CALL        _config_entradas+0, 0
;pesos.c,130 :: 		TMR1ON_bit=1; //prende el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;pesos.c,134 :: 		for (cuenta1=0;cuenta1<=8;cuenta1++)  lecturas[cuenta1]=0;
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
;pesos.c,135 :: 		banderas=0;    //limpi las bandera de los sesnores
	CLRF        _banderas+0 
;pesos.c,137 :: 		while (TMR1IF_bit==0)
L_analizasensoresir4:
	BTFSC       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_analizasensoresir5
;pesos.c,141 :: 		if ((s1_in==0) && ( flag_s1==0))
	BTFSC       RA0_bit+0, BitPos(RA0_bit+0) 
	GOTO        L_analizasensoresir8
	BTFSC       _banderas+0, 0 
	GOTO        L_analizasensoresir8
L__analizasensoresir61:
;pesos.c,143 :: 		lecturas[0]=(unsigned int)TMR1H<<8 |TMR1L;
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
;pesos.c,144 :: 		flag_s1=1;
	BSF         _banderas+0, 0 
;pesos.c,145 :: 		}
L_analizasensoresir8:
;pesos.c,148 :: 		if ((s2_in==0) && ( flag_s2==0))
	BTFSC       RA1_bit+0, BitPos(RA1_bit+0) 
	GOTO        L_analizasensoresir11
	BTFSC       _banderas+0, 1 
	GOTO        L_analizasensoresir11
L__analizasensoresir60:
;pesos.c,150 :: 		lecturas[1]=(unsigned int)TMR1H<<8 |TMR1L;
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
;pesos.c,151 :: 		flag_s2=1;
	BSF         _banderas+0, 1 
;pesos.c,152 :: 		}
L_analizasensoresir11:
;pesos.c,155 :: 		if ((s3_in==0) && ( flag_s3==0))
	BTFSC       RA2_bit+0, BitPos(RA2_bit+0) 
	GOTO        L_analizasensoresir14
	BTFSC       _banderas+0, 2 
	GOTO        L_analizasensoresir14
L__analizasensoresir59:
;pesos.c,157 :: 		lecturas[2]=(unsigned int)TMR1H<<8 |TMR1L;
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
;pesos.c,158 :: 		flag_s3=1;
	BSF         _banderas+0, 2 
;pesos.c,159 :: 		}
L_analizasensoresir14:
;pesos.c,162 :: 		if ((s4_in==0) && ( flag_s4==0))
	BTFSC       RA3_bit+0, BitPos(RA3_bit+0) 
	GOTO        L_analizasensoresir17
	BTFSC       _banderas+0, 3 
	GOTO        L_analizasensoresir17
L__analizasensoresir58:
;pesos.c,164 :: 		lecturas[3]=(unsigned int)TMR1H<<8 |TMR1L;
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
;pesos.c,165 :: 		flag_s4=1;
	BSF         _banderas+0, 3 
;pesos.c,166 :: 		}
L_analizasensoresir17:
;pesos.c,169 :: 		if ((s5_in==0) && ( flag_s5==0))
	BTFSC       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_analizasensoresir20
	BTFSC       _banderas+0, 4 
	GOTO        L_analizasensoresir20
L__analizasensoresir57:
;pesos.c,171 :: 		lecturas[4]=(unsigned int)TMR1H<<8 |TMR1L;
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
;pesos.c,172 :: 		flag_s5=1;
	BSF         _banderas+0, 4 
;pesos.c,173 :: 		}
L_analizasensoresir20:
;pesos.c,177 :: 		if ((s6_in==0) && ( flag_s6==0))
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_analizasensoresir23
	BTFSC       _banderas+0, 5 
	GOTO        L_analizasensoresir23
L__analizasensoresir56:
;pesos.c,179 :: 		lecturas[5]=(unsigned int)TMR1H<<8 |TMR1L;
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
;pesos.c,180 :: 		flag_s6=1;
	BSF         _banderas+0, 5 
;pesos.c,181 :: 		}
L_analizasensoresir23:
;pesos.c,182 :: 		} // fin del tiempo para leeer los sensores
	GOTO        L_analizasensoresir4
L_analizasensoresir5:
;pesos.c,184 :: 		leds=0;//
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;pesos.c,186 :: 		}
L_end_analizasensoresir:
	RETURN      0
; end of _analizasensoresir

_manda_sensores_ir:

;pesos.c,188 :: 		void manda_sensores_ir()
;pesos.c,190 :: 		sprintf(texto,"s1=%u   s2=%u  s3=%u   s4=%u   s5=%u   s6=%u\r\n\r\n",lecturas[0],lecturas[1],lecturas[2],lecturas[3],lecturas[4],lecturas[5]);
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
;pesos.c,191 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,193 :: 		}
L_end_manda_sensores_ir:
	RETURN      0
; end of _manda_sensores_ir

_adelante:

;pesos.c,196 :: 		void adelante(unsigned char velo)
;pesos.c,198 :: 		m1_g=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,199 :: 		m2_g=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,200 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,201 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_adelante_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,202 :: 		}
L_end_adelante:
	RETURN      0
; end of _adelante

_atras:

;pesos.c,205 :: 		void atras(unsigned char velo)
;pesos.c,207 :: 		m1_g=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,208 :: 		m2_g=1;
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,209 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,210 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_atras_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,211 :: 		}
L_end_atras:
	RETURN      0
; end of _atras

_derecha:

;pesos.c,214 :: 		void derecha(unsigned char velo)
;pesos.c,216 :: 		m1_g=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,217 :: 		m2_g=0;
	BCF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,218 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,219 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_derecha_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,220 :: 		}
L_end_derecha:
	RETURN      0
; end of _derecha

_izquierda:

;pesos.c,223 :: 		void izquierda(unsigned char velo)
;pesos.c,225 :: 		m1_g=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;pesos.c,226 :: 		m2_g=1;
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;pesos.c,227 :: 		PWM1_Set_Duty(velo);
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,228 :: 		PWM2_Set_Duty(velo);
	MOVF        FARG_izquierda_velo+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,229 :: 		}
L_end_izquierda:
	RETURN      0
; end of _izquierda

_quieto:

;pesos.c,231 :: 		void quieto()
;pesos.c,233 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,234 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,235 :: 		}   void calibra_ir()
L_end_quieto:
	RETURN      0
; end of _quieto

_calibra_ir:

;pesos.c,239 :: 		led=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,241 :: 		for (cuenta2=0; cuenta2<=200;cuenta2++)
	CLRF        calibra_ir_cuenta2_L0+0 
	CLRF        calibra_ir_cuenta2_L0+1 
L_calibra_ir24:
	MOVLW       0
	MOVWF       R0 
	MOVF        calibra_ir_cuenta2_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calibra_ir74
	MOVF        calibra_ir_cuenta2_L0+0, 0 
	SUBLW       200
L__calibra_ir74:
	BTFSS       STATUS+0, 0 
	GOTO        L_calibra_ir25
;pesos.c,243 :: 		for (cont=0; cont<6;cont++)
	CLRF        calibra_ir_cont_L0+0 
L_calibra_ir27:
	MOVLW       6
	SUBWF       calibra_ir_cont_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_calibra_ir28
;pesos.c,245 :: 		analizasensoresir();
	CALL        _analizasensoresir+0, 0
;pesos.c,246 :: 		if (lecturas[cont]>=maximos[cont]) maximos[cont]=lecturas[cont];
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
	GOTO        L__calibra_ir75
	MOVF        R1, 0 
	SUBWF       R3, 0 
L__calibra_ir75:
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
;pesos.c,247 :: 		if (lecturas[cont]<=minimos[cont]) minimos[cont]=lecturas[cont];
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
	GOTO        L__calibra_ir76
	MOVF        R3, 0 
	SUBWF       R1, 0 
L__calibra_ir76:
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
;pesos.c,243 :: 		for (cont=0; cont<6;cont++)
	INCF        calibra_ir_cont_L0+0, 1 
;pesos.c,248 :: 		}  //
	GOTO        L_calibra_ir27
L_calibra_ir28:
;pesos.c,241 :: 		for (cuenta2=0; cuenta2<=200;cuenta2++)
	INFSNZ      calibra_ir_cuenta2_L0+0, 1 
	INCF        calibra_ir_cuenta2_L0+1, 1 
;pesos.c,249 :: 		} //fin for cuenta
	GOTO        L_calibra_ir24
L_calibra_ir25:
;pesos.c,250 :: 		led=1;
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,251 :: 		Delay_ms(500);
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
;pesos.c,252 :: 		led=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,254 :: 		}
L_end_calibra_ir:
	RETURN      0
; end of _calibra_ir

_manda_limites:

;pesos.c,256 :: 		void manda_limites()
;pesos.c,258 :: 		sprintf(texto,"min1=%u   min2=%u  min3=%u   min4=%u   min5=%u   min6=%u\r\n",minimos[0],minimos[1],minimos[2],minimos[3],minimos[4],minimos[5]);
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
;pesos.c,259 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,260 :: 		sprintf(texto,"max1=%u   max2=%u  max3=%u   max4=%u   max5=%u   max6=%u\r\n\r\n",maximos[0],maximos[1],maximos[2],maximos[3],maximos[4],maximos[5]);
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
;pesos.c,261 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,264 :: 		}
L_end_manda_limites:
	RETURN      0
; end of _manda_limites

_normaliza:

;pesos.c,268 :: 		void normaliza()
;pesos.c,275 :: 		for (cuenta=0;cuenta<6;cuenta++)
	CLRF        normaliza_cuenta_L0+0 
L_normaliza33:
	MOVLW       6
	SUBWF       normaliza_cuenta_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_normaliza34
;pesos.c,277 :: 		min_temp=minimos[cuenta];
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
;pesos.c,278 :: 		max_temp=maximos[cuenta];
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
;pesos.c,279 :: 		promedio=(max_temp-min_temp)/2;  // calcual la diferencia entre el maximo y minimo del sensor correspondiente
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
;pesos.c,280 :: 		if (lecturas[cuenta]>=(min_temp+promedio))  normalizados[cuenta]=1;
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
;pesos.c,281 :: 		else  normalizados[cuenta]=0;
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
;pesos.c,275 :: 		for (cuenta=0;cuenta<6;cuenta++)
	INCF        normaliza_cuenta_L0+0, 1 
;pesos.c,283 :: 		} // fin del for cuenta
	GOTO        L_normaliza33
L_normaliza34:
;pesos.c,286 :: 		}
L_end_normaliza:
	RETURN      0
; end of _normaliza

_manda_normalizados:

;pesos.c,290 :: 		void manda_normalizados()
;pesos.c,292 :: 		sprinti(texto,"s1=%u   s2=%u  s3=%u   s4=%u   s5=%u   s6=%u\r\n\r\n",normalizados[0],normalizados[1],normalizados[2],normalizados[3],normalizados[4],normalizados[5]);
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
;pesos.c,293 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,294 :: 		}
L_end_manda_normalizados:
	RETURN      0
; end of _manda_normalizados

_calcula_pesos:

;pesos.c,297 :: 		float calcula_pesos()
;pesos.c,300 :: 		float numerador=0,denominador=0;
	CLRF        calcula_pesos_numerador_L0+0 
	CLRF        calcula_pesos_numerador_L0+1 
	CLRF        calcula_pesos_numerador_L0+2 
	CLRF        calcula_pesos_numerador_L0+3 
	CLRF        calcula_pesos_denominador_L0+0 
	CLRF        calcula_pesos_denominador_L0+1 
	CLRF        calcula_pesos_denominador_L0+2 
	CLRF        calcula_pesos_denominador_L0+3 
;pesos.c,302 :: 		for (cuenta=0;cuenta<6; cuenta++)
	CLRF        calcula_pesos_cuenta_L0+0 
L_calcula_pesos38:
	MOVLW       6
	SUBWF       calcula_pesos_cuenta_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_calcula_pesos39
;pesos.c,304 :: 		numerador=normalizados[cuenta]*pesos[cuenta]+numerador;
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
;pesos.c,305 :: 		denominador=normalizados[cuenta]+denominador;
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
;pesos.c,302 :: 		for (cuenta=0;cuenta<6; cuenta++)
	INCF        calcula_pesos_cuenta_L0+0, 1 
;pesos.c,306 :: 		}// for cuenta
	GOTO        L_calcula_pesos38
L_calcula_pesos39:
;pesos.c,309 :: 		if (denominador>=5.8) // indica que todo esta en negro, se recominda rectificar movimiento
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
;pesos.c,311 :: 		if (peso_anterior>0) return(10.0); // si estaba muy a la derecha antes retorna el maximo valor a la derecha
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
;pesos.c,312 :: 		else  if (peso_anterior<0) return(-10.0);  // si estaba muy a la izquierda antes retorna el maximo valor a la izquierda
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
;pesos.c,313 :: 		}
	GOTO        L_calcula_pesos45
L_calcula_pesos41:
;pesos.c,315 :: 		else if (denominador<=0.2) // indica que no esta en la linea , se salio  para evitar errores flotante
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
;pesos.c,317 :: 		if (peso_anterior>0) return(10.0); // si estaba muy a la derecha antes retorna el maximo valor a la derecha
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
;pesos.c,318 :: 		else  if (peso_anterior<0) return(-10.0);  // si estaba muy a la izquierda antes retorna el maximo valor a la izquierda
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
;pesos.c,319 :: 		}
	GOTO        L_calcula_pesos50
L_calcula_pesos46:
;pesos.c,321 :: 		valor=numerador/denominador;
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
;pesos.c,322 :: 		peso_anterior=valor;//  almacena el valor por si se lelga a salir de la linea
	MOVF        calcula_pesos_valor_L0+0, 0 
	MOVWF       _peso_anterior+0 
	MOVF        calcula_pesos_valor_L0+1, 0 
	MOVWF       _peso_anterior+1 
	MOVF        calcula_pesos_valor_L0+2, 0 
	MOVWF       _peso_anterior+2 
	MOVF        calcula_pesos_valor_L0+3, 0 
	MOVWF       _peso_anterior+3 
;pesos.c,323 :: 		return(valor);
	MOVF        calcula_pesos_valor_L0+0, 0 
	MOVWF       R0 
	MOVF        calcula_pesos_valor_L0+1, 0 
	MOVWF       R1 
	MOVF        calcula_pesos_valor_L0+2, 0 
	MOVWF       R2 
	MOVF        calcula_pesos_valor_L0+3, 0 
	MOVWF       R3 
;pesos.c,325 :: 		}
L_end_calcula_pesos:
	RETURN      0
; end of _calcula_pesos

_manda_caculo_pesos:

;pesos.c,327 :: 		void manda_caculo_pesos()
;pesos.c,329 :: 		sprintf(texto,"desvio=%.1f \r\n\r\n",calcula_pesos());
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
;pesos.c,330 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,331 :: 		}
L_end_manda_caculo_pesos:
	RETURN      0
; end of _manda_caculo_pesos

_main:

;pesos.c,335 :: 		void main()
;pesos.c,338 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;pesos.c,339 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;pesos.c,340 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;pesos.c,343 :: 		TRISC1_bit=0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;pesos.c,344 :: 		TRISC2_bit=0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;pesos.c,346 :: 		m1_g_dir=0;
	BCF         TRISB3_bit+0, BitPos(TRISB3_bit+0) 
;pesos.c,347 :: 		m2_g_dir=0;
	BCF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;pesos.c,349 :: 		leds_dir=0;
	BCF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;pesos.c,353 :: 		TRISC0_bit=0;
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;pesos.c,356 :: 		TRISB7_bit=1;
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;pesos.c,358 :: 		NOT_RBPU_bit=0;
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
;pesos.c,361 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;pesos.c,362 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW       ?lstr6_pesos+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_pesos+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;pesos.c,364 :: 		PWM1_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;pesos.c,365 :: 		PWM2_Init(250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;pesos.c,367 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pesos.c,368 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;pesos.c,369 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;pesos.c,370 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;pesos.c,372 :: 		calibra_ir();
	CALL        _calibra_ir+0, 0
;pesos.c,373 :: 		manda_limites();
	CALL        _manda_limites+0, 0
;pesos.c,375 :: 		while (sw==1);
L_main51:
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main52
	GOTO        L_main51
L_main52:
;pesos.c,378 :: 		while (1)
L_main53:
;pesos.c,380 :: 		analizasensoresir();
	CALL        _analizasensoresir+0, 0
;pesos.c,381 :: 		normaliza();
	CALL        _normaliza+0, 0
;pesos.c,382 :: 		calcula_pesos();
	CALL        _calcula_pesos+0, 0
;pesos.c,383 :: 		manda_caculo_pesos();
	CALL        _manda_caculo_pesos+0, 0
;pesos.c,386 :: 		led=!led;
	BTG         LATC0_bit+0, BitPos(LATC0_bit+0) 
;pesos.c,387 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main55:
	DECFSZ      R13, 1, 1
	BRA         L_main55
	DECFSZ      R12, 1, 1
	BRA         L_main55
	DECFSZ      R11, 1, 1
	BRA         L_main55
	NOP
	NOP
;pesos.c,390 :: 		}
	GOTO        L_main53
;pesos.c,393 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
