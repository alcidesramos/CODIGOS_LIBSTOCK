
_md_quieto:

;basico.c,33 :: 		void   md_quieto()
;basico.c,35 :: 		MD1=0;
	BCF        LATC0_bit+0, BitPos(LATC0_bit+0)
;basico.c,36 :: 		MD2=0;
	BCF        LATC1_bit+0, BitPos(LATC1_bit+0)
;basico.c,37 :: 		}
L_end_md_quieto:
	RETURN
; end of _md_quieto

_md_alante:

;basico.c,40 :: 		void   md_alante()
;basico.c,42 :: 		MD1=1;
	BSF        LATC0_bit+0, BitPos(LATC0_bit+0)
;basico.c,43 :: 		MD2=0;
	BCF        LATC1_bit+0, BitPos(LATC1_bit+0)
;basico.c,44 :: 		}
L_end_md_alante:
	RETURN
; end of _md_alante

_md_atras:

;basico.c,47 :: 		void   md_atras()
;basico.c,49 :: 		MD1=0;
	BCF        LATC0_bit+0, BitPos(LATC0_bit+0)
;basico.c,50 :: 		MD2=1;
	BSF        LATC1_bit+0, BitPos(LATC1_bit+0)
;basico.c,51 :: 		}
L_end_md_atras:
	RETURN
; end of _md_atras

_mi_quieto:

;basico.c,54 :: 		void   mi_quieto()
;basico.c,56 :: 		MI1=0;
	BCF        LATC2_bit+0, BitPos(LATC2_bit+0)
;basico.c,57 :: 		MI2=0;
	BCF        LATC4_bit+0, BitPos(LATC4_bit+0)
;basico.c,58 :: 		}
L_end_mi_quieto:
	RETURN
; end of _mi_quieto

_mi_alante:

;basico.c,61 :: 		void   mi_alante()
;basico.c,63 :: 		MI1=0;
	BCF        LATC2_bit+0, BitPos(LATC2_bit+0)
;basico.c,64 :: 		MI2=1;
	BSF        LATC4_bit+0, BitPos(LATC4_bit+0)
;basico.c,65 :: 		}
L_end_mi_alante:
	RETURN
; end of _mi_alante

_mi_atras:

;basico.c,69 :: 		void   mi_atras()
;basico.c,71 :: 		MI1=1;
	BSF        LATC2_bit+0, BitPos(LATC2_bit+0)
;basico.c,72 :: 		MI2=0;
	BCF        LATC4_bit+0, BitPos(LATC4_bit+0)
;basico.c,73 :: 		}
L_end_mi_atras:
	RETURN
; end of _mi_atras

_quieto:

;basico.c,79 :: 		void quieto()
;basico.c,81 :: 		md_quieto();
	CALL       _md_quieto+0
;basico.c,82 :: 		mi_quieto();
	CALL       _mi_quieto+0
;basico.c,83 :: 		}
L_end_quieto:
	RETURN
; end of _quieto

_alante:

;basico.c,86 :: 		void alante(unsigned char velo)
;basico.c,88 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_alante_velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,89 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_alante_velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,90 :: 		md_alante();
	CALL       _md_alante+0
;basico.c,91 :: 		mi_alante();
	CALL       _mi_alante+0
;basico.c,93 :: 		}
L_end_alante:
	RETURN
; end of _alante

_atras:

;basico.c,96 :: 		void atras(unsigned char velo)
;basico.c,98 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_atras_velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,99 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_atras_velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,100 :: 		md_atras();
	CALL       _md_atras+0
;basico.c,101 :: 		mi_atras();
	CALL       _mi_atras+0
;basico.c,102 :: 		}
L_end_atras:
	RETURN
; end of _atras

_derecha:

;basico.c,105 :: 		void derecha(unsigned char velo)
;basico.c,107 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_derecha_velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,108 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_derecha_velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,109 :: 		mi_alante();
	CALL       _mi_alante+0
;basico.c,110 :: 		md_atras();
	CALL       _md_atras+0
;basico.c,111 :: 		}
L_end_derecha:
	RETURN
; end of _derecha

_izquierda:

;basico.c,114 :: 		void izquierda(unsigned char velo)
;basico.c,116 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_izquierda_velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,117 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_izquierda_velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,119 :: 		md_alante();
	CALL       _md_alante+0
;basico.c,120 :: 		mi_atras();
	CALL       _mi_atras+0
;basico.c,121 :: 		}
L_end_izquierda:
	RETURN
; end of _izquierda

_analiza_sensores:

;basico.c,124 :: 		void analiza_sensores()
;basico.c,126 :: 		if ((SI==negro) &&  (SC==negro) &&(SD==negro) )           izquierda(velo_giro);
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores2
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores2
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores2
L__analiza_sensores41:
	MOVLW      50
	MOVWF      FARG_izquierda_velo+0
	CALL       _izquierda+0
	GOTO       L_analiza_sensores3
L_analiza_sensores2:
;basico.c,127 :: 		else  if  ((SI==negro) &&  (SC==negro) && (SD==blanco) )  izquierda(velo_giro);
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores6
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores6
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores6
L__analiza_sensores40:
	MOVLW      50
	MOVWF      FARG_izquierda_velo+0
	CALL       _izquierda+0
	GOTO       L_analiza_sensores7
L_analiza_sensores6:
;basico.c,128 :: 		else if  ((SI==negro) &&  (SC==blanco) && (SD==negro) )     alante(velo_giro);  // imposible
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores10
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores10
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores10
L__analiza_sensores39:
	MOVLW      50
	MOVWF      FARG_alante_velo+0
	CALL       _alante+0
	GOTO       L_analiza_sensores11
L_analiza_sensores10:
;basico.c,129 :: 		else if  ((SI==negro) &&  (SC==blanco) && (SD==blanco) )   izquierda(velo_giro);
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores14
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores14
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores14
L__analiza_sensores38:
	MOVLW      50
	MOVWF      FARG_izquierda_velo+0
	CALL       _izquierda+0
	GOTO       L_analiza_sensores15
L_analiza_sensores14:
;basico.c,130 :: 		else if  ((SI==blanco) &&  (SC==negro) && (SD==negro) )    derecha(velo_giro);
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores18
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores18
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores18
L__analiza_sensores37:
	MOVLW      50
	MOVWF      FARG_derecha_velo+0
	CALL       _derecha+0
	GOTO       L_analiza_sensores19
L_analiza_sensores18:
;basico.c,131 :: 		else if  ((SI==blanco) &&  (SC==negro) && (SD==blanco) )    alante(velo_linea);
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores22
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores22
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores22
L__analiza_sensores36:
	MOVLW      150
	MOVWF      FARG_alante_velo+0
	CALL       _alante+0
	GOTO       L_analiza_sensores23
L_analiza_sensores22:
;basico.c,132 :: 		else if  ((SI==blanco) &&  (SC==blanco) && (SD==negro) )   derecha(velo_giro);
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores26
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores26
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores26
L__analiza_sensores35:
	MOVLW      50
	MOVWF      FARG_derecha_velo+0
	CALL       _derecha+0
	GOTO       L_analiza_sensores27
L_analiza_sensores26:
;basico.c,133 :: 		else if  ((SI==blanco) &&  (SC==blanco) && (SD==blanco) )   alante(velo_linea);  //
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores30
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores30
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores30
L__analiza_sensores34:
	MOVLW      150
	MOVWF      FARG_alante_velo+0
	CALL       _alante+0
L_analiza_sensores30:
L_analiza_sensores27:
L_analiza_sensores23:
L_analiza_sensores19:
L_analiza_sensores15:
L_analiza_sensores11:
L_analiza_sensores7:
L_analiza_sensores3:
;basico.c,135 :: 		}
L_end_analiza_sensores:
	RETURN
; end of _analiza_sensores

_main:

;basico.c,138 :: 		void main()
;basico.c,141 :: 		OSCCON=0;
	CLRF       OSCCON+0
;basico.c,142 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;basico.c,146 :: 		SCS1_bit=0;
	BCF        SCS1_bit+0, BitPos(SCS1_bit+0)
;basico.c,147 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;basico.c,151 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;basico.c,152 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;basico.c,153 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;basico.c,154 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;basico.c,157 :: 		ANSELA=0;
	CLRF       ANSELA+0
;basico.c,158 :: 		ANSELC=0;
	CLRF       ANSELC+0
;basico.c,161 :: 		SI_DIR=1;
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;basico.c,162 :: 		SC_DIR=1;
	BSF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;basico.c,163 :: 		SD_DIR=1;
	BSF        TRISA5_bit+0, BitPos(TRISA5_bit+0)
;basico.c,165 :: 		MD1_DIR=0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;basico.c,166 :: 		MD2_DIR=0;
	BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;basico.c,167 :: 		MI1_DIR=0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;basico.c,168 :: 		MI2_DIR=0;
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;basico.c,171 :: 		TRISC3_bit=0;
	BCF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;basico.c,172 :: 		TRISC5_bit=0;
	BCF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
;basico.c,174 :: 		SPLLEN_bit=0; //prende el PLL por 4  da 32MHZ  si es cero da 8 MHZ
	BCF        SPLLEN_bit+0, BitPos(SPLLEN_bit+0)
;basico.c,176 :: 		PWM1_Init(250);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;basico.c,177 :: 		PWM2_Init(250);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;basico.c,179 :: 		PWM1_Set_Duty(127);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,180 :: 		PWM2_Set_Duty(127);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVLW      127
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,182 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;basico.c,183 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;basico.c,185 :: 		while (1)
L_main31:
;basico.c,187 :: 		analiza_sensores();
	CALL       _analiza_sensores+0
;basico.c,188 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_main33:
	DECFSZ     R13, 1
	GOTO       L_main33
	DECFSZ     R12, 1
	GOTO       L_main33
	NOP
	NOP
;basico.c,191 :: 		}
	GOTO       L_main31
;basico.c,193 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
