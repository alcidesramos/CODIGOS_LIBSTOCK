
_md_quieto:

;basico.c,36 :: 		void   md_quieto()
;basico.c,38 :: 		MD1=0;
	BCF        LATC0_bit+0, BitPos(LATC0_bit+0)
;basico.c,39 :: 		MD2=0;
	BCF        LATC1_bit+0, BitPos(LATC1_bit+0)
;basico.c,40 :: 		}
L_end_md_quieto:
	RETURN
; end of _md_quieto

_md_alante:

;basico.c,43 :: 		void   md_alante()
;basico.c,45 :: 		MD1=1;
	BSF        LATC0_bit+0, BitPos(LATC0_bit+0)
;basico.c,46 :: 		MD2=0;
	BCF        LATC1_bit+0, BitPos(LATC1_bit+0)
;basico.c,47 :: 		}
L_end_md_alante:
	RETURN
; end of _md_alante

_md_atras:

;basico.c,50 :: 		void   md_atras()
;basico.c,52 :: 		MD1=0;
	BCF        LATC0_bit+0, BitPos(LATC0_bit+0)
;basico.c,53 :: 		MD2=1;
	BSF        LATC1_bit+0, BitPos(LATC1_bit+0)
;basico.c,54 :: 		}
L_end_md_atras:
	RETURN
; end of _md_atras

_mi_quieto:

;basico.c,57 :: 		void   mi_quieto()
;basico.c,59 :: 		MI1=0;
	BCF        LATC2_bit+0, BitPos(LATC2_bit+0)
;basico.c,60 :: 		MI2=0;
	BCF        LATC4_bit+0, BitPos(LATC4_bit+0)
;basico.c,61 :: 		}
L_end_mi_quieto:
	RETURN
; end of _mi_quieto

_mi_alante:

;basico.c,64 :: 		void   mi_alante()
;basico.c,66 :: 		MI1=0;
	BCF        LATC2_bit+0, BitPos(LATC2_bit+0)
;basico.c,67 :: 		MI2=1;
	BSF        LATC4_bit+0, BitPos(LATC4_bit+0)
;basico.c,68 :: 		}
L_end_mi_alante:
	RETURN
; end of _mi_alante

_mi_atras:

;basico.c,72 :: 		void   mi_atras()
;basico.c,74 :: 		MI1=1;
	BSF        LATC2_bit+0, BitPos(LATC2_bit+0)
;basico.c,75 :: 		MI2=0;
	BCF        LATC4_bit+0, BitPos(LATC4_bit+0)
;basico.c,76 :: 		}
L_end_mi_atras:
	RETURN
; end of _mi_atras

_quieto:

;basico.c,82 :: 		void quieto()
;basico.c,84 :: 		md_quieto();
	CALL       _md_quieto+0
;basico.c,85 :: 		mi_quieto();
	CALL       _mi_quieto+0
;basico.c,86 :: 		}
L_end_quieto:
	RETURN
; end of _quieto

_alante:

;basico.c,89 :: 		void alante(signed int velo)
;basico.c,92 :: 		veld=velo_BASE+velo;
	MOVLW      90
	ADDWF      FARG_alante_velo+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     FARG_alante_velo+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      alante_veld_L0+0
	MOVF       R2, 0
	MOVWF      alante_veld_L0+1
;basico.c,93 :: 		veli=velo_BASE-velo;
	MOVF       FARG_alante_velo+0, 0
	SUBLW      90
	MOVWF      alante_veli_L0+0
	MOVF       FARG_alante_velo+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       alante_veli_L0+1
	SUBWF      alante_veli_L0+1, 1
;basico.c,95 :: 		if (veld>=255) veld=255;
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alante53
	MOVLW      255
	SUBWF      R1, 0
L__alante53:
	BTFSS      STATUS+0, 0
	GOTO       L_alante0
	MOVLW      255
	MOVWF      alante_veld_L0+0
	CLRF       alante_veld_L0+1
L_alante0:
;basico.c,96 :: 		if (veld<=0) veld=0;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      alante_veld_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alante54
	MOVF       alante_veld_L0+0, 0
	SUBLW      0
L__alante54:
	BTFSS      STATUS+0, 0
	GOTO       L_alante1
	CLRF       alante_veld_L0+0
	CLRF       alante_veld_L0+1
L_alante1:
;basico.c,97 :: 		if (veli>=255) veli=255;
	MOVLW      128
	XORWF      alante_veli_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alante55
	MOVLW      255
	SUBWF      alante_veli_L0+0, 0
L__alante55:
	BTFSS      STATUS+0, 0
	GOTO       L_alante2
	MOVLW      255
	MOVWF      alante_veli_L0+0
	CLRF       alante_veli_L0+1
L_alante2:
;basico.c,98 :: 		if (veli<=0) veli=0;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      alante_veli_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alante56
	MOVF       alante_veli_L0+0, 0
	SUBLW      0
L__alante56:
	BTFSS      STATUS+0, 0
	GOTO       L_alante3
	CLRF       alante_veli_L0+0
	CLRF       alante_veli_L0+1
L_alante3:
;basico.c,100 :: 		PWM1_Set_Duty(veld);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       alante_veld_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,101 :: 		PWM2_Set_Duty(veli);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       alante_veli_L0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,102 :: 		md_alante();
	CALL       _md_alante+0
;basico.c,103 :: 		mi_alante();
	CALL       _mi_alante+0
;basico.c,105 :: 		}
L_end_alante:
	RETURN
; end of _alante

_atras:

;basico.c,109 :: 		void atras(unsigned char velo)
;basico.c,111 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_atras_velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,112 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_atras_velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,113 :: 		md_atras();
	CALL       _md_atras+0
;basico.c,114 :: 		mi_atras();
	CALL       _mi_atras+0
;basico.c,115 :: 		}
L_end_atras:
	RETURN
; end of _atras

_derecha:

;basico.c,118 :: 		void derecha(unsigned char velo)
;basico.c,120 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_derecha_velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,121 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_derecha_velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,122 :: 		mi_alante();
	CALL       _mi_alante+0
;basico.c,123 :: 		md_atras();
	CALL       _md_atras+0
;basico.c,124 :: 		}
L_end_derecha:
	RETURN
; end of _derecha

_izquierda:

;basico.c,127 :: 		void izquierda(unsigned char velo)
;basico.c,129 :: 		PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_izquierda_velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,130 :: 		PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVF       FARG_izquierda_velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,132 :: 		md_alante();
	CALL       _md_alante+0
;basico.c,133 :: 		mi_atras();
	CALL       _mi_atras+0
;basico.c,134 :: 		}
L_end_izquierda:
	RETURN
; end of _izquierda

_analiza_sensores:

;basico.c,137 :: 		void analiza_sensores()
;basico.c,139 :: 		if ((SI==negro) &&  (SC==negro) &&(SD==negro) )           velocidad=velo_giro;
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores6
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores6
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores6
L__analiza_sensores44:
	MOVLW      90
	MOVWF      _velocidad+0
	MOVLW      0
	MOVWF      _velocidad+1
	GOTO       L_analiza_sensores7
L_analiza_sensores6:
;basico.c,140 :: 		else  if  ((SI==negro) &&  (SC==negro) && (SD==blanco) )   velocidad=-velo_giro;
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores10
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores10
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores10
L__analiza_sensores43:
	MOVLW      166
	MOVWF      _velocidad+0
	MOVLW      255
	MOVWF      _velocidad+1
	GOTO       L_analiza_sensores11
L_analiza_sensores10:
;basico.c,141 :: 		else if  ((SI==negro) &&  (SC==blanco) && (SD==negro) )    velocidad=-velo_giro;  // valor imposible
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores14
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores14
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores14
L__analiza_sensores42:
	MOVLW      166
	MOVWF      _velocidad+0
	MOVLW      255
	MOVWF      _velocidad+1
	GOTO       L_analiza_sensores15
L_analiza_sensores14:
;basico.c,142 :: 		else if  ((SI==negro) &&  (SC==blanco) && (SD==blanco) )    velocidad=-velo_giro;
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores18
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores18
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores18
L__analiza_sensores41:
	MOVLW      166
	MOVWF      _velocidad+0
	MOVLW      255
	MOVWF      _velocidad+1
	GOTO       L_analiza_sensores19
L_analiza_sensores18:
;basico.c,143 :: 		else if  ((SI==blanco) &&  (SC==negro) && (SD==negro) )     velocidad=velo_giro;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores22
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores22
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores22
L__analiza_sensores40:
	MOVLW      90
	MOVWF      _velocidad+0
	MOVLW      0
	MOVWF      _velocidad+1
	GOTO       L_analiza_sensores23
L_analiza_sensores22:
;basico.c,144 :: 		else if  ((SI==blanco) &&  (SC==negro) && (SD==blanco) )    velocidad=0;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores26
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores26
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores26
L__analiza_sensores39:
	CLRF       _velocidad+0
	CLRF       _velocidad+1
	GOTO       L_analiza_sensores27
L_analiza_sensores26:
;basico.c,145 :: 		else if  ((SI==blanco) &&  (SC==blanco) && (SD==negro) )    velocidad=velo_giro;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores30
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores30
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores30
L__analiza_sensores38:
	MOVLW      90
	MOVWF      _velocidad+0
	MOVLW      0
	MOVWF      _velocidad+1
	GOTO       L_analiza_sensores31
L_analiza_sensores30:
;basico.c,146 :: 		else if  ((SI==blanco) &&  (SC==blanco) && (SD==blanco) )   velocidad=0;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_analiza_sensores34
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_analiza_sensores34
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_analiza_sensores34
L__analiza_sensores37:
	CLRF       _velocidad+0
	CLRF       _velocidad+1
L_analiza_sensores34:
L_analiza_sensores31:
L_analiza_sensores27:
L_analiza_sensores23:
L_analiza_sensores19:
L_analiza_sensores15:
L_analiza_sensores11:
L_analiza_sensores7:
;basico.c,148 :: 		}
L_end_analiza_sensores:
	RETURN
; end of _analiza_sensores

_main:

;basico.c,151 :: 		void main()
;basico.c,154 :: 		OSCCON=0;
	CLRF       OSCCON+0
;basico.c,155 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;basico.c,159 :: 		SCS1_bit=0;
	BCF        SCS1_bit+0, BitPos(SCS1_bit+0)
;basico.c,160 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;basico.c,164 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;basico.c,165 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;basico.c,166 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;basico.c,167 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;basico.c,170 :: 		ANSELA=0;
	CLRF       ANSELA+0
;basico.c,171 :: 		ANSELC=0;
	CLRF       ANSELC+0
;basico.c,174 :: 		SI_DIR=1;
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;basico.c,175 :: 		SC_DIR=1;
	BSF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;basico.c,176 :: 		SD_DIR=1;
	BSF        TRISA5_bit+0, BitPos(TRISA5_bit+0)
;basico.c,178 :: 		MD1_DIR=0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;basico.c,179 :: 		MD2_DIR=0;
	BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;basico.c,180 :: 		MI1_DIR=0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;basico.c,181 :: 		MI2_DIR=0;
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;basico.c,184 :: 		TRISC3_bit=0;
	BCF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;basico.c,185 :: 		TRISC5_bit=0;
	BCF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
;basico.c,187 :: 		SPLLEN_bit=0; //prende el PLL por 4  da 32MHZ  si es cero da 8 MHZ
	BCF        SPLLEN_bit+0, BitPos(SPLLEN_bit+0)
;basico.c,189 :: 		PWM1_Init(250);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;basico.c,190 :: 		PWM2_Init(250);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;basico.c,192 :: 		PWM1_Set_Duty(127);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;basico.c,193 :: 		PWM2_Set_Duty(127);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
	MOVLW      127
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;basico.c,195 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;basico.c,196 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;basico.c,198 :: 		while (1)
L_main35:
;basico.c,200 :: 		analiza_sensores();
	CALL       _analiza_sensores+0
;basico.c,201 :: 		alante(velocidad);
	MOVF       _velocidad+0, 0
	MOVWF      FARG_alante_velo+0
	MOVF       _velocidad+1, 0
	MOVWF      FARG_alante_velo+1
	CALL       _alante+0
;basico.c,204 :: 		}
	GOTO       L_main35
;basico.c,206 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
