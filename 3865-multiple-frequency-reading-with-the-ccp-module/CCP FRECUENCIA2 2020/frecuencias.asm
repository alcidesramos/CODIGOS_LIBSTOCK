
_config_captura1:

;frecuencias.c,23 :: 		void config_captura1()
;frecuencias.c,25 :: 		TRISC5_bit=1;  //pin de captura como entrada
	BSF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
;frecuencias.c,28 :: 		T1CON=0;
	CLRF       T1CON+0
;frecuencias.c,29 :: 		T1GCON=0;
	CLRF       T1GCON+0
;frecuencias.c,32 :: 		T1CKPS1_bit=0;
	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;frecuencias.c,33 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;frecuencias.c,36 :: 		TMR1L=0;
	CLRF       TMR1L+0
;frecuencias.c,37 :: 		TMR1H=0;
	CLRF       TMR1H+0
;frecuencias.c,40 :: 		CCP1CON=0;
	CLRF       CCP1CON+0
;frecuencias.c,43 :: 		CCP1M3_bit=0;
	BCF        CCP1M3_bit+0, BitPos(CCP1M3_bit+0)
;frecuencias.c,44 :: 		CCP1M2_bit=1;
	BSF        CCP1M2_bit+0, BitPos(CCP1M2_bit+0)
;frecuencias.c,45 :: 		CCP1M1_bit=0;
	BCF        CCP1M1_bit+0, BitPos(CCP1M1_bit+0)
;frecuencias.c,46 :: 		CCP1M0_bit=1;
	BSF        CCP1M0_bit+0, BitPos(CCP1M0_bit+0)
;frecuencias.c,48 :: 		CCP1IF_bit=0; //limpi la bandera
	BCF        CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
;frecuencias.c,49 :: 		CCP1IE_bit=1;  // activa interupcion del modulo ccp2
	BSF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;frecuencias.c,50 :: 		TMR1ON_bit=1;  //Arranca el timer
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,52 :: 		}
L_end_config_captura1:
	RETURN
; end of _config_captura1

_config_captura2:

;frecuencias.c,56 :: 		void config_captura2()
;frecuencias.c,58 :: 		CCP2SEL_bit=1; //CCP2 EN RA5   SINO EN RC3
	BSF        CCP2SEL_bit+0, BitPos(CCP2SEL_bit+0)
;frecuencias.c,59 :: 		TRISA5_bit=1;  //pin de captura como entrada
	BSF        TRISA5_bit+0, BitPos(TRISA5_bit+0)
;frecuencias.c,62 :: 		T1CON=0;
	CLRF       T1CON+0
;frecuencias.c,63 :: 		T1GCON=0;
	CLRF       T1GCON+0
;frecuencias.c,66 :: 		T1CKPS1_bit=0;
	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;frecuencias.c,67 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;frecuencias.c,70 :: 		TMR1L=0;
	CLRF       TMR1L+0
;frecuencias.c,71 :: 		TMR1H=0;
	CLRF       TMR1H+0
;frecuencias.c,75 :: 		CCP2CON=0;
	CLRF       CCP2CON+0
;frecuencias.c,78 :: 		CCP2M3_bit=0;
	BCF        CCP2M3_bit+0, BitPos(CCP2M3_bit+0)
;frecuencias.c,79 :: 		CCP2M2_bit=1;
	BSF        CCP2M2_bit+0, BitPos(CCP2M2_bit+0)
;frecuencias.c,80 :: 		CCP2M1_bit=0;
	BCF        CCP2M1_bit+0, BitPos(CCP2M1_bit+0)
;frecuencias.c,81 :: 		CCP2M0_bit=1;
	BSF        CCP2M0_bit+0, BitPos(CCP2M0_bit+0)
;frecuencias.c,83 :: 		CCP2IF_bit=0; //limpi la bandera
	BCF        CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
;frecuencias.c,84 :: 		CCP2IE_bit=1;  // activa interupcion del modulo ccp2
	BSF        CCP2IE_bit+0, BitPos(CCP2IE_bit+0)
;frecuencias.c,85 :: 		TMR1ON_bit=1;  //Arranca el timer
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,87 :: 		}
L_end_config_captura2:
	RETURN
; end of _config_captura2

_config_captura3:

;frecuencias.c,90 :: 		void config_captura3()
;frecuencias.c,92 :: 		TRISA2_bit=1;  //pin de captura como entrada
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;frecuencias.c,95 :: 		t1con=0;
	CLRF       T1CON+0
;frecuencias.c,98 :: 		T1CKPS1_bit=0;
	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;frecuencias.c,99 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;frecuencias.c,102 :: 		TMR1L=0;
	CLRF       TMR1L+0
;frecuencias.c,103 :: 		TMR1H=0;
	CLRF       TMR1H+0
;frecuencias.c,108 :: 		CCP3CON=0;
	CLRF       CCP3CON+0
;frecuencias.c,111 :: 		CCP3M3_bit=0;
	BCF        CCP3M3_bit+0, BitPos(CCP3M3_bit+0)
;frecuencias.c,112 :: 		CCP3M2_bit=1;
	BSF        CCP3M2_bit+0, BitPos(CCP3M2_bit+0)
;frecuencias.c,113 :: 		CCP3M1_bit=0;
	BCF        CCP3M1_bit+0, BitPos(CCP3M1_bit+0)
;frecuencias.c,114 :: 		CCP3M0_bit=1;
	BSF        CCP3M0_bit+0, BitPos(CCP3M0_bit+0)
;frecuencias.c,116 :: 		CCP3IF_bit=0; //limpi la bandera
	BCF        CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
;frecuencias.c,117 :: 		CCP3IE_bit=1;  // activa interupcion del modulo ccp3
	BSF        CCP3IE_bit+0, BitPos(CCP3IE_bit+0)
;frecuencias.c,119 :: 		TMR1ON_bit=1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,120 :: 		}
L_end_config_captura3:
	RETURN
; end of _config_captura3

_config_captura4:

;frecuencias.c,124 :: 		void config_captura4()
;frecuencias.c,126 :: 		TRISC1_bit=1;  //pin de captura como entrada
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;frecuencias.c,129 :: 		t1con=0;
	CLRF       T1CON+0
;frecuencias.c,132 :: 		T1CKPS1_bit=0;
	BCF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;frecuencias.c,133 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;frecuencias.c,136 :: 		TMR1L=0;
	CLRF       TMR1L+0
;frecuencias.c,137 :: 		TMR1H=0;
	CLRF       TMR1H+0
;frecuencias.c,141 :: 		CCP4CON=0;
	CLRF       CCP4CON+0
;frecuencias.c,144 :: 		CCP4M3_bit=0;
	BCF        CCP4M3_bit+0, BitPos(CCP4M3_bit+0)
;frecuencias.c,145 :: 		CCP4M2_bit=1;
	BSF        CCP4M2_bit+0, BitPos(CCP4M2_bit+0)
;frecuencias.c,146 :: 		CCP4M1_bit=0;
	BCF        CCP4M1_bit+0, BitPos(CCP4M1_bit+0)
;frecuencias.c,147 :: 		CCP4M0_bit=1;
	BSF        CCP4M0_bit+0, BitPos(CCP4M0_bit+0)
;frecuencias.c,149 :: 		CCP4IF_bit=0; //limpi la bandera
	BCF        CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
;frecuencias.c,150 :: 		CCP4IE_bit=1;  // activa interupcion del modulo ccp4
	BSF        CCP4IE_bit+0, BitPos(CCP4IE_bit+0)
;frecuencias.c,151 :: 		TMR1ON_bit=1;  // aRRANCA EL TIMERS
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,152 :: 		}
L_end_config_captura4:
	RETURN
; end of _config_captura4

_INTERRUPCION:

;frecuencias.c,155 :: 		void INTERRUPCION() iv 0x0004 ics ICS_AUTO
;frecuencias.c,159 :: 		if (CCP1IF_bit==1) // si es del ccp1
	BTFSS      CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
	GOTO       L_INTERRUPCION0
;frecuencias.c,161 :: 		if (procesa1flag==0) //solo entra si el dato ya fue procesado pro el programa principal
	BTFSC      _interrupcionfrec_flag+0, 0
	GOTO       L_INTERRUPCION1
;frecuencias.c,163 :: 		procesa1flag=1; // para evitar bug de reprocesamiento
	BSF        _interrupcionfrec_flag+0, 0
;frecuencias.c,164 :: 		pulsos1_2=(CCPR1h << 8 ) | CCPR1l;   //captura el valor timer
	MOVF       CCPR1H+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       CCPR1L+0, 0
	IORWF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
	MOVLW      0
	IORWF       R3, 1
	MOVF       R2, 0
	MOVWF      _pulsos1_2+0
	MOVF       R3, 0
	MOVWF      _pulsos1_2+1
;frecuencias.c,165 :: 		TMR1ON_bit=1;    // toca rrancar de nuevo el timers
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,166 :: 		if (pulsos1_2>=pulsos1_1) pulsos1=pulsos1_2-pulsos1_1;
	MOVF       _pulsos1_1+1, 0
	SUBWF      R3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__INTERRUPCION52
	MOVF       _pulsos1_1+0, 0
	SUBWF      R2, 0
L__INTERRUPCION52:
	BTFSS      STATUS+0, 0
	GOTO       L_INTERRUPCION2
	MOVF       _pulsos1_1+0, 0
	SUBWF      _pulsos1_2+0, 0
	MOVWF      _pulsos1+0
	MOVF       _pulsos1_1+1, 0
	SUBWFB     _pulsos1_2+1, 0
	MOVWF      _pulsos1+1
	GOTO       L_INTERRUPCION3
L_INTERRUPCION2:
;frecuencias.c,167 :: 		else  pulsos1=(65535-pulsos1_1)+pulsos1_2;
	MOVF       _pulsos1_1+0, 0
	SUBLW      255
	MOVWF      _pulsos1+0
	MOVF       _pulsos1_1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      255
	MOVWF      _pulsos1+1
	MOVF       _pulsos1_2+0, 0
	ADDWF      _pulsos1+0, 1
	MOVF       _pulsos1_2+1, 0
	ADDWFC     _pulsos1+1, 1
L_INTERRUPCION3:
;frecuencias.c,168 :: 		pulsos1_1=pulsos1_2;
	MOVF       _pulsos1_2+0, 0
	MOVWF      _pulsos1_1+0
	MOVF       _pulsos1_2+1, 0
	MOVWF      _pulsos1_1+1
;frecuencias.c,169 :: 		flag_frec1=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 1
	BSF        _interrupcionfrec_flag+0, 4
;frecuencias.c,170 :: 		procesa1flag=0;
	BCF        _interrupcionfrec_flag+0, 0
;frecuencias.c,171 :: 		}
L_INTERRUPCION1:
;frecuencias.c,172 :: 		CCP1IF_bit=0;
	BCF        CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
;frecuencias.c,174 :: 		}
L_INTERRUPCION0:
;frecuencias.c,176 :: 		if (CCP2IF_bit==1)  //si la interrpcion es ccp2
	BTFSS      CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
	GOTO       L_INTERRUPCION4
;frecuencias.c,178 :: 		if (procesa2flag==0)
	BTFSC      _interrupcionfrec_flag+0, 1
	GOTO       L_INTERRUPCION5
;frecuencias.c,180 :: 		procesa2flag=1;
	BSF        _interrupcionfrec_flag+0, 1
;frecuencias.c,181 :: 		pulsos2_2=(CCPR2h << 8 ) | CCPR2l;   //captura
	MOVF       CCPR2H+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       CCPR2L+0, 0
	IORWF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
	MOVLW      0
	IORWF       R3, 1
	MOVF       R2, 0
	MOVWF      _pulsos2_2+0
	MOVF       R3, 0
	MOVWF      _pulsos2_2+1
;frecuencias.c,182 :: 		TMR1ON_bit=1;    // toca rrancar de nuevo el timers
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,183 :: 		if (pulsos2_2>=pulsos2_1) pulsos2=pulsos2_2-pulsos2_1;
	MOVF       _pulsos2_1+1, 0
	SUBWF      R3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__INTERRUPCION53
	MOVF       _pulsos2_1+0, 0
	SUBWF      R2, 0
L__INTERRUPCION53:
	BTFSS      STATUS+0, 0
	GOTO       L_INTERRUPCION6
	MOVF       _pulsos2_1+0, 0
	SUBWF      _pulsos2_2+0, 0
	MOVWF      _pulsos2+0
	MOVF       _pulsos2_1+1, 0
	SUBWFB     _pulsos2_2+1, 0
	MOVWF      _pulsos2+1
	GOTO       L_INTERRUPCION7
L_INTERRUPCION6:
;frecuencias.c,184 :: 		else  pulsos2=(65535-pulsos2_1)+pulsos2_2;
	MOVF       _pulsos2_1+0, 0
	SUBLW      255
	MOVWF      _pulsos2+0
	MOVF       _pulsos2_1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      255
	MOVWF      _pulsos2+1
	MOVF       _pulsos2_2+0, 0
	ADDWF      _pulsos2+0, 1
	MOVF       _pulsos2_2+1, 0
	ADDWFC     _pulsos2+1, 1
L_INTERRUPCION7:
;frecuencias.c,185 :: 		pulsos2_1=pulsos2_2;
	MOVF       _pulsos2_2+0, 0
	MOVWF      _pulsos2_1+0
	MOVF       _pulsos2_2+1, 0
	MOVWF      _pulsos2_1+1
;frecuencias.c,186 :: 		flag_frec2=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 2
	BSF        _interrupcionfrec_flag+0, 5
;frecuencias.c,187 :: 		procesa2flag=0;
	BCF        _interrupcionfrec_flag+0, 1
;frecuencias.c,188 :: 		}
L_INTERRUPCION5:
;frecuencias.c,189 :: 		CCP2IF_bit=0;
	BCF        CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
;frecuencias.c,191 :: 		}
L_INTERRUPCION4:
;frecuencias.c,194 :: 		if (CCP3IF_bit==1)
	BTFSS      CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
	GOTO       L_INTERRUPCION8
;frecuencias.c,196 :: 		if (procesa3flag==0)
	BTFSC      _interrupcionfrec_flag+0, 2
	GOTO       L_INTERRUPCION9
;frecuencias.c,198 :: 		procesa3flag=1;
	BSF        _interrupcionfrec_flag+0, 2
;frecuencias.c,199 :: 		pulsos3_2=(CCPR3h << 8 ) | CCPR3l;   //captura
	MOVF       CCPR3H+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       CCPR3L+0, 0
	IORWF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
	MOVLW      0
	IORWF       R3, 1
	MOVF       R2, 0
	MOVWF      _pulsos3_2+0
	MOVF       R3, 0
	MOVWF      _pulsos3_2+1
;frecuencias.c,200 :: 		TMR1ON_bit=1;    // toca rrancar de nuevo el timers
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,201 :: 		if (pulsos3_2>=pulsos3_1) pulsos3=pulsos3_2-pulsos3_1;
	MOVF       _pulsos3_1+1, 0
	SUBWF      R3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__INTERRUPCION54
	MOVF       _pulsos3_1+0, 0
	SUBWF      R2, 0
L__INTERRUPCION54:
	BTFSS      STATUS+0, 0
	GOTO       L_INTERRUPCION10
	MOVF       _pulsos3_1+0, 0
	SUBWF      _pulsos3_2+0, 0
	MOVWF      _pulsos3+0
	MOVF       _pulsos3_1+1, 0
	SUBWFB     _pulsos3_2+1, 0
	MOVWF      _pulsos3+1
	GOTO       L_INTERRUPCION11
L_INTERRUPCION10:
;frecuencias.c,202 :: 		else  pulsos3=(65535-pulsos3_1)+pulsos3_2;
	MOVF       _pulsos3_1+0, 0
	SUBLW      255
	MOVWF      _pulsos3+0
	MOVF       _pulsos3_1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      255
	MOVWF      _pulsos3+1
	MOVF       _pulsos3_2+0, 0
	ADDWF      _pulsos3+0, 1
	MOVF       _pulsos3_2+1, 0
	ADDWFC     _pulsos3+1, 1
L_INTERRUPCION11:
;frecuencias.c,203 :: 		pulsos3_1=pulsos3_2;
	MOVF       _pulsos3_2+0, 0
	MOVWF      _pulsos3_1+0
	MOVF       _pulsos3_2+1, 0
	MOVWF      _pulsos3_1+1
;frecuencias.c,204 :: 		flag_frec3=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 3
	BSF        _interrupcionfrec_flag+0, 6
;frecuencias.c,205 :: 		procesa3flag=0;
	BCF        _interrupcionfrec_flag+0, 2
;frecuencias.c,206 :: 		}
L_INTERRUPCION9:
;frecuencias.c,207 :: 		CCP3IF_bit=0;
	BCF        CCP3IF_bit+0, BitPos(CCP3IF_bit+0)
;frecuencias.c,209 :: 		}
L_INTERRUPCION8:
;frecuencias.c,211 :: 		if (CCP4IF_bit==1)
	BTFSS      CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
	GOTO       L_INTERRUPCION12
;frecuencias.c,213 :: 		if (procesa4flag==0)
	BTFSC      _interrupcionfrec_flag+0, 3
	GOTO       L_INTERRUPCION13
;frecuencias.c,215 :: 		procesa4flag=1;
	BSF        _interrupcionfrec_flag+0, 3
;frecuencias.c,216 :: 		pulsos4_2=(CCPR4h << 8 ) | CCPR4l;   //captura
	MOVF       CCPR4H+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       CCPR4L+0, 0
	IORWF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
	MOVLW      0
	IORWF       R3, 1
	MOVF       R2, 0
	MOVWF      _pulsos4_2+0
	MOVF       R3, 0
	MOVWF      _pulsos4_2+1
;frecuencias.c,217 :: 		TMR1ON_bit=1;    // toca rrancar de nuevo el timers
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;frecuencias.c,218 :: 		if (pulsos4_2>=pulsos4_1) pulsos4=pulsos4_2-pulsos4_1;
	MOVF       _pulsos4_1+1, 0
	SUBWF      R3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__INTERRUPCION55
	MOVF       _pulsos4_1+0, 0
	SUBWF      R2, 0
L__INTERRUPCION55:
	BTFSS      STATUS+0, 0
	GOTO       L_INTERRUPCION14
	MOVF       _pulsos4_1+0, 0
	SUBWF      _pulsos4_2+0, 0
	MOVWF      _pulsos4+0
	MOVF       _pulsos4_1+1, 0
	SUBWFB     _pulsos4_2+1, 0
	MOVWF      _pulsos4+1
	GOTO       L_INTERRUPCION15
L_INTERRUPCION14:
;frecuencias.c,219 :: 		else  pulsos4=(65535-pulsos4_1)+pulsos4_2;
	MOVF       _pulsos4_1+0, 0
	SUBLW      255
	MOVWF      _pulsos4+0
	MOVF       _pulsos4_1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      255
	MOVWF      _pulsos4+1
	MOVF       _pulsos4_2+0, 0
	ADDWF      _pulsos4+0, 1
	MOVF       _pulsos4_2+1, 0
	ADDWFC     _pulsos4+1, 1
L_INTERRUPCION15:
;frecuencias.c,220 :: 		pulsos4_1=pulsos4_2;
	MOVF       _pulsos4_2+0, 0
	MOVWF      _pulsos4_1+0
	MOVF       _pulsos4_2+1, 0
	MOVWF      _pulsos4_1+1
;frecuencias.c,221 :: 		flag_frec4=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 4
	BSF        _interrupcionfrec_flag+0, 7
;frecuencias.c,222 :: 		procesa4flag=0;
	BCF        _interrupcionfrec_flag+0, 3
;frecuencias.c,223 :: 		}
L_INTERRUPCION13:
;frecuencias.c,224 :: 		CCP4IF_bit=0;
	BCF        CCP4IF_bit+0, BitPos(CCP4IF_bit+0)
;frecuencias.c,226 :: 		}
L_INTERRUPCION12:
;frecuencias.c,228 :: 		}
L_end_INTERRUPCION:
L__INTERRUPCION51:
	RETFIE     %s
; end of _INTERRUPCION

_floattostr_:

;frecuencias.c,230 :: 		void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
;frecuencias.c,236 :: 		largo_n = decimales_+1;
	MOVF       FARG_floattostr__decimales_+0, 0
	ADDLW      1
	MOVWF      floattostr__largo_n_L0+0
	CLRF       floattostr__largo_n_L0+1
	MOVLW      0
	ADDWFC     floattostr__largo_n_L0+1, 1
;frecuencias.c,237 :: 		largo_entera = 0;
	CLRF       floattostr__largo_entera_L0+0
	CLRF       floattostr__largo_entera_L0+1
;frecuencias.c,239 :: 		if ( numero_ < 0)
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_16
;frecuencias.c,241 :: 		*cadena_++ = '-';
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__cadena_+1, 0
	MOVWF      FSR1H
	MOVLW      45
	MOVWF      INDF1+0
	INCF       FARG_floattostr__cadena_+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__cadena_+1, 1
;frecuencias.c,242 :: 		numero_ = -numero_;
	MOVLW      0
	XORWF      FARG_floattostr__numero_+0, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+1, 1
	MOVLW      128
	XORWF      FARG_floattostr__numero_+2, 1
	MOVLW      0
	XORWF      FARG_floattostr__numero_+3, 1
;frecuencias.c,243 :: 		}
L_floattostr_16:
;frecuencias.c,245 :: 		if (numero_ > 0.0) while (numero_ < 1.0)
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R4
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R5
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R6
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R7
	CLRF       R0
	CLRF       R1
	CLRF       R2
	CLRF       R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_17
L_floattostr_18:
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_19
;frecuencias.c,247 :: 		numero_ =numero_* 10.0;
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__numero_+3
;frecuencias.c,248 :: 		largo_entera--;
	MOVLW      1
	SUBWF      floattostr__largo_entera_L0+0, 1
	MOVLW      0
	SUBWFB     floattostr__largo_entera_L0+1, 1
;frecuencias.c,249 :: 		}
	GOTO       L_floattostr_18
L_floattostr_19:
L_floattostr_17:
;frecuencias.c,252 :: 		while (numero_ >= 10.0)
L_floattostr_20:
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_21
;frecuencias.c,254 :: 		numero_ = numero_/10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__numero_+3
;frecuencias.c,255 :: 		largo_entera++;   //sube el largo de la trama por ser deciaml
	INCF       floattostr__largo_entera_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__largo_entera_L0+1, 1
;frecuencias.c,256 :: 		}
	GOTO       L_floattostr_20
L_floattostr_21:
;frecuencias.c,257 :: 		largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera
	MOVF       floattostr__largo_entera_L0+0, 0
	ADDWF      floattostr__largo_n_L0+0, 1
	MOVF       floattostr__largo_entera_L0+1, 0
	ADDWFC     floattostr__largo_n_L0+1, 1
;frecuencias.c,261 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
	MOVLW      1
	MOVWF      floattostr__cont_for_L0+0
	MOVLW      0
	MOVWF      floattostr__cont_for_L0+1
	MOVLW      0
	MOVWF      floattostr__tempo_float_L0+0
	MOVLW      0
	MOVWF      floattostr__tempo_float_L0+1
	MOVLW      0
	MOVWF      floattostr__tempo_float_L0+2
	MOVLW      127
	MOVWF      floattostr__tempo_float_L0+3
L_floattostr_22:
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_57
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_57:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_23
;frecuencias.c,262 :: 		tempo_float = tempo_float/10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       floattostr__tempo_float_L0+0, 0
	MOVWF      R0
	MOVF       floattostr__tempo_float_L0+1, 0
	MOVWF      R1
	MOVF       floattostr__tempo_float_L0+2, 0
	MOVWF      R2
	MOVF       floattostr__tempo_float_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      floattostr__tempo_float_L0+0
	MOVF       R1, 0
	MOVWF      floattostr__tempo_float_L0+1
	MOVF       R2, 0
	MOVWF      floattostr__tempo_float_L0+2
	MOVF       R3, 0
	MOVWF      floattostr__tempo_float_L0+3
;frecuencias.c,261 :: 		for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;frecuencias.c,262 :: 		tempo_float = tempo_float/10.0;
	GOTO       L_floattostr_22
L_floattostr_23:
;frecuencias.c,263 :: 		numero_ += tempo_float/2.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
	MOVWF      R7
	MOVF       floattostr__tempo_float_L0+0, 0
	MOVWF      R0
	MOVF       floattostr__tempo_float_L0+1, 0
	MOVWF      R1
	MOVF       floattostr__tempo_float_L0+2, 0
	MOVWF      R2
	MOVF       floattostr__tempo_float_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R4
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R5
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R6
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__numero_+3
;frecuencias.c,264 :: 		if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_floattostr_25
	MOVLW      0
	MOVWF      FARG_floattostr__numero_+0
	MOVLW      0
	MOVWF      FARG_floattostr__numero_+1
	MOVLW      0
	MOVWF      FARG_floattostr__numero_+2
	MOVLW      127
	MOVWF      FARG_floattostr__numero_+3
	INCF       floattostr__largo_entera_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__largo_entera_L0+1, 1
L_floattostr_25:
;frecuencias.c,266 :: 		if (largo_entera<0)
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_58
	MOVLW      0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_58:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_26
;frecuencias.c,268 :: 		*cadena_++ = '0'; *cadena_++ = '.';
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__cadena_+1, 0
	MOVWF      FSR1H
	MOVLW      48
	MOVWF      INDF1+0
	INCF       FARG_floattostr__cadena_+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__cadena_+1, 1
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__cadena_+1, 0
	MOVWF      FSR1H
	MOVLW      46
	MOVWF      INDF1+0
	INCF       FARG_floattostr__cadena_+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__cadena_+1, 1
;frecuencias.c,269 :: 		if (largo_n < 0) largo_entera = largo_entera-largo_n;
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_59
	MOVLW      0
	SUBWF      floattostr__largo_n_L0+0, 0
L__floattostr_59:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_27
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 1
	MOVF       floattostr__largo_n_L0+1, 0
	SUBWFB     floattostr__largo_entera_L0+1, 1
L_floattostr_27:
;frecuencias.c,270 :: 		for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+0
	MOVLW      255
	MOVWF      floattostr__cont_for_L0+1
L_floattostr_28:
	MOVLW      128
	XORWF      floattostr__largo_entera_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_60
	MOVF       floattostr__cont_for_L0+0, 0
	SUBWF      floattostr__largo_entera_L0+0, 0
L__floattostr_60:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_29
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__cadena_+1, 0
	MOVWF      FSR1H
	MOVLW      48
	MOVWF      INDF1+0
	INCF       FARG_floattostr__cadena_+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__cadena_+1, 1
	MOVLW      1
	SUBWF      floattostr__cont_for_L0+0, 1
	MOVLW      0
	SUBWFB     floattostr__cont_for_L0+1, 1
	GOTO       L_floattostr_28
L_floattostr_29:
;frecuencias.c,271 :: 		}
L_floattostr_26:
;frecuencias.c,272 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	CLRF       floattostr__cont_for_L0+0
	CLRF       floattostr__cont_for_L0+1
L_floattostr_31:
	MOVLW      128
	XORWF      floattostr__cont_for_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      floattostr__largo_n_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_61
	MOVF       floattostr__largo_n_L0+0, 0
	SUBWF      floattostr__cont_for_L0+0, 0
L__floattostr_61:
	BTFSC      STATUS+0, 0
	GOTO       L_floattostr_32
;frecuencias.c,274 :: 		tempo_int = numero_;
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R3
	CALL       _double2int+0
	MOVF       R0, 0
	MOVWF      floattostr__tempo_int_L0+0
	MOVF       R1, 0
	MOVWF      floattostr__tempo_int_L0+1
;frecuencias.c,275 :: 		*cadena_++ = tempo_int + 48;  //convierte a ascci
	MOVLW      48
	ADDWF      R0, 1
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__cadena_+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	INCF       FARG_floattostr__cadena_+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__cadena_+1, 1
;frecuencias.c,276 :: 		if (cont_for ==  largo_entera ) *cadena_++ = '.';
	MOVF       floattostr__cont_for_L0+1, 0
	XORWF      floattostr__largo_entera_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__floattostr_62
	MOVF       floattostr__largo_entera_L0+0, 0
	XORWF      floattostr__cont_for_L0+0, 0
L__floattostr_62:
	BTFSS      STATUS+0, 2
	GOTO       L_floattostr_34
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__cadena_+1, 0
	MOVWF      FSR1H
	MOVLW      46
	MOVWF      INDF1+0
	INCF       FARG_floattostr__cadena_+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_floattostr__cadena_+1, 1
L_floattostr_34:
;frecuencias.c,277 :: 		numero_ -= (tempo_float=tempo_int);
	MOVF       floattostr__tempo_int_L0+0, 0
	MOVWF      R0
	MOVF       floattostr__tempo_int_L0+1, 0
	MOVWF      R1
	CALL       _int2double+0
	MOVF       R0, 0
	MOVWF      floattostr__tempo_float_L0+0
	MOVF       R1, 0
	MOVWF      floattostr__tempo_float_L0+1
	MOVF       R2, 0
	MOVWF      floattostr__tempo_float_L0+2
	MOVF       R3, 0
	MOVWF      floattostr__tempo_float_L0+3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FARG_floattostr__numero_+0, 0
	MOVWF      R0
	MOVF       FARG_floattostr__numero_+1, 0
	MOVWF      R1
	MOVF       FARG_floattostr__numero_+2, 0
	MOVWF      R2
	MOVF       FARG_floattostr__numero_+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__numero_+3
;frecuencias.c,278 :: 		numero_ = numero_*10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R3, 0
	MOVWF      FARG_floattostr__numero_+3
;frecuencias.c,272 :: 		for (cont_for=0; cont_for < largo_n; cont_for++)
	INCF       floattostr__cont_for_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       floattostr__cont_for_L0+1, 1
;frecuencias.c,279 :: 		}
	GOTO       L_floattostr_31
L_floattostr_32:
;frecuencias.c,280 :: 		*cadena_ =0;    //anexa final de linea
	MOVF       FARG_floattostr__cadena_+0, 0
	MOVWF      FSR1L
	MOVF       FARG_floattostr__cadena_+1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
;frecuencias.c,281 :: 		}
L_end_floattostr_:
	RETURN
; end of _floattostr_

_procesa_frecuencias:

;frecuencias.c,286 :: 		void procesa_frecuencias()
;frecuencias.c,289 :: 		frecuencia1=0,frecuencia2=0,frecuencia3=0;frecuencia4=0; //coloca en cero
	CLRF       _frecuencia1+0
	CLRF       _frecuencia1+1
	CLRF       _frecuencia1+2
	CLRF       _frecuencia1+3
	CLRF       _frecuencia2+0
	CLRF       _frecuencia2+1
	CLRF       _frecuencia2+2
	CLRF       _frecuencia2+3
	CLRF       _frecuencia3+0
	CLRF       _frecuencia3+1
	CLRF       _frecuencia3+2
	CLRF       _frecuencia3+3
	CLRF       _frecuencia4+0
	CLRF       _frecuencia4+1
	CLRF       _frecuencia4+2
	CLRF       _frecuencia4+3
;frecuencias.c,291 :: 		if (flag_frec1==1)
	BTFSS      _interrupcionfrec_flag+0, 4
	GOTO       L_procesa_frecuencias35
;frecuencias.c,293 :: 		if (pulsos1!=0)  frecuencia1=Clock_kHz()*1e3/(pulsos1*4.0); //convierte a Hercios
	MOVLW      0
	XORWF      _pulsos1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__procesa_frecuencias64
	MOVLW      0
	XORWF      _pulsos1+0, 0
L__procesa_frecuencias64:
	BTFSC      STATUS+0, 2
	GOTO       L_procesa_frecuencias36
	MOVF       _pulsos1+0, 0
	MOVWF      R0
	MOVF       _pulsos1+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      36
	MOVWF      R1
	MOVLW      116
	MOVWF      R2
	MOVLW      149
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _frecuencia1+0
	MOVF       R1, 0
	MOVWF      _frecuencia1+1
	MOVF       R2, 0
	MOVWF      _frecuencia1+2
	MOVF       R3, 0
	MOVWF      _frecuencia1+3
L_procesa_frecuencias36:
;frecuencias.c,294 :: 		flag_frec1=0;
	BCF        _interrupcionfrec_flag+0, 4
;frecuencias.c,295 :: 		} // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 1
L_procesa_frecuencias35:
;frecuencias.c,300 :: 		if (flag_frec2==1)
	BTFSS      _interrupcionfrec_flag+0, 5
	GOTO       L_procesa_frecuencias37
;frecuencias.c,302 :: 		if (pulsos2!=0) Frecuencia2=Clock_kHz()*1e3/(pulsos2*4.0); //convierte a Hercios
	MOVLW      0
	XORWF      _pulsos2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__procesa_frecuencias65
	MOVLW      0
	XORWF      _pulsos2+0, 0
L__procesa_frecuencias65:
	BTFSC      STATUS+0, 2
	GOTO       L_procesa_frecuencias38
	MOVF       _pulsos2+0, 0
	MOVWF      R0
	MOVF       _pulsos2+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      36
	MOVWF      R1
	MOVLW      116
	MOVWF      R2
	MOVLW      149
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _frecuencia2+0
	MOVF       R1, 0
	MOVWF      _frecuencia2+1
	MOVF       R2, 0
	MOVWF      _frecuencia2+2
	MOVF       R3, 0
	MOVWF      _frecuencia2+3
L_procesa_frecuencias38:
;frecuencias.c,303 :: 		flag_frec2=0;
	BCF        _interrupcionfrec_flag+0, 5
;frecuencias.c,304 :: 		} // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 2
L_procesa_frecuencias37:
;frecuencias.c,308 :: 		if (flag_frec3==1)
	BTFSS      _interrupcionfrec_flag+0, 6
	GOTO       L_procesa_frecuencias39
;frecuencias.c,310 :: 		if (pulsos3!=0)  frecuencia3=Clock_kHz()*1e3/(pulsos3*4.0); //convierte a Hercios
	MOVLW      0
	XORWF      _pulsos3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__procesa_frecuencias66
	MOVLW      0
	XORWF      _pulsos3+0, 0
L__procesa_frecuencias66:
	BTFSC      STATUS+0, 2
	GOTO       L_procesa_frecuencias40
	MOVF       _pulsos3+0, 0
	MOVWF      R0
	MOVF       _pulsos3+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      36
	MOVWF      R1
	MOVLW      116
	MOVWF      R2
	MOVLW      149
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _frecuencia3+0
	MOVF       R1, 0
	MOVWF      _frecuencia3+1
	MOVF       R2, 0
	MOVWF      _frecuencia3+2
	MOVF       R3, 0
	MOVWF      _frecuencia3+3
L_procesa_frecuencias40:
;frecuencias.c,311 :: 		flag_frec3=0;
	BCF        _interrupcionfrec_flag+0, 6
;frecuencias.c,312 :: 		} // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 3
L_procesa_frecuencias39:
;frecuencias.c,316 :: 		if (flag_frec4==1)
	BTFSS      _interrupcionfrec_flag+0, 7
	GOTO       L_procesa_frecuencias41
;frecuencias.c,318 :: 		if (pulsos4!=0) frecuencia4=Clock_kHz()*1e3/(pulsos4*4.0); //convierte a Hercios
	MOVLW      0
	XORWF      _pulsos4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__procesa_frecuencias67
	MOVLW      0
	XORWF      _pulsos4+0, 0
L__procesa_frecuencias67:
	BTFSC      STATUS+0, 2
	GOTO       L_procesa_frecuencias42
	MOVF       _pulsos4+0, 0
	MOVWF      R0
	MOVF       _pulsos4+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      36
	MOVWF      R1
	MOVLW      116
	MOVWF      R2
	MOVLW      149
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _frecuencia4+0
	MOVF       R1, 0
	MOVWF      _frecuencia4+1
	MOVF       R2, 0
	MOVWF      _frecuencia4+2
	MOVF       R3, 0
	MOVWF      _frecuencia4+3
L_procesa_frecuencias42:
;frecuencias.c,319 :: 		flag_frec4=0;
	BCF        _interrupcionfrec_flag+0, 7
;frecuencias.c,320 :: 		} // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 4
L_procesa_frecuencias41:
;frecuencias.c,322 :: 		}
L_end_procesa_frecuencias:
	RETURN
; end of _procesa_frecuencias

_main:

;frecuencias.c,324 :: 		void main()
;frecuencias.c,327 :: 		OSCCON=0;
	CLRF       OSCCON+0
;frecuencias.c,328 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;frecuencias.c,330 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;frecuencias.c,331 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;frecuencias.c,334 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;frecuencias.c,335 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;frecuencias.c,336 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;frecuencias.c,337 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;frecuencias.c,339 :: 		INTCON=0b01000000; // mandos medios habilitado
	MOVLW      64
	MOVWF      INTCON+0
;frecuencias.c,341 :: 		ansela=0;
	CLRF       ANSELA+0
;frecuencias.c,342 :: 		anselc=0;
	CLRF       ANSELC+0
;frecuencias.c,345 :: 		TRISA=0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;frecuencias.c,346 :: 		trisc=0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;frecuencias.c,347 :: 		TRISA0_bit=0;//Salida tx
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;frecuencias.c,348 :: 		TRISC0_bit=0; //Salida led
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;frecuencias.c,350 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;frecuencias.c,352 :: 		TRISA0_bit=0; //salida LED
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;frecuencias.c,353 :: 		TRISC3_bit=0; //SALIDA HAB
	BCF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;frecuencias.c,355 :: 		WPUA=0;
	CLRF       WPUA+0
;frecuencias.c,356 :: 		WPUC=0;
	CLRF       WPUC+0
;frecuencias.c,359 :: 		RXDTSEL_bit=1; // RX en RA1  sino RC5
	BSF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
;frecuencias.c,360 :: 		TXCKSEL_bit=1; // tX en RA0  sino RC4
	BSF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;frecuencias.c,366 :: 		config_captura1();
	CALL       _config_captura1+0
;frecuencias.c,367 :: 		config_captura2();
	CALL       _config_captura2+0
;frecuencias.c,368 :: 		config_captura3();
	CALL       _config_captura3+0
;frecuencias.c,369 :: 		config_captura4();
	CALL       _config_captura4+0
;frecuencias.c,371 :: 		NOT_WPUEN_bit=0; //HABILITA PULL UPS
	BCF        NOT_WPUEN_bit+0, BitPos(NOT_WPUEN_bit+0)
;frecuencias.c,373 :: 		WPUA2_bit=1; //pull up en el pin de RA2
	BSF        WPUA2_bit+0, BitPos(WPUA2_bit+0)
;frecuencias.c,374 :: 		WPUA5_bit=1; //pull up en el pin RA5
	BSF        WPUA5_bit+0, BitPos(WPUA5_bit+0)
;frecuencias.c,375 :: 		WPUC1_bit=1; //pull up en el pin RC1
	BSF        WPUC1_bit+0, BitPos(WPUC1_bit+0)
;frecuencias.c,376 :: 		WPUC5_bit=1; //pull up en el pin RC5
	BSF        WPUC5_bit+0, BitPos(WPUC5_bit+0)
;frecuencias.c,378 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr1_frecuencias+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_frecuencias+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,381 :: 		GIE_bit=1;  //Autoriza LAS INTERRPCIONES
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;frecuencias.c,383 :: 		while (1)
L_main43:
;frecuencias.c,386 :: 		led=!led;
	MOVLW
	XORWF      LATC0_bit+0, 1
;frecuencias.c,387 :: 		procesa_frecuencias();
	CALL       _procesa_frecuencias+0
;frecuencias.c,388 :: 		floatToStr_(frecuencia1,texto,2);
	MOVF       _frecuencia1+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       _frecuencia1+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       _frecuencia1+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       _frecuencia1+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__cadena_+1
	MOVLW      2
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;frecuencias.c,389 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,390 :: 		UART1_Write_Text("     ");
	MOVLW      ?lstr2_frecuencias+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_frecuencias+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,392 :: 		floatToStr_(frecuencia2,texto,2);
	MOVF       _frecuencia2+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       _frecuencia2+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       _frecuencia2+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       _frecuencia2+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__cadena_+1
	MOVLW      2
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;frecuencias.c,393 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,394 :: 		UART1_Write_Text("     ");
	MOVLW      ?lstr3_frecuencias+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_frecuencias+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,396 :: 		floatToStr_(frecuencia3,texto,2);
	MOVF       _frecuencia3+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       _frecuencia3+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       _frecuencia3+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       _frecuencia3+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__cadena_+1
	MOVLW      2
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;frecuencias.c,397 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,398 :: 		UART1_Write_Text("     ");
	MOVLW      ?lstr4_frecuencias+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr4_frecuencias+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,400 :: 		floatToStr_(frecuencia4,texto,2);
	MOVF       _frecuencia4+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       _frecuencia4+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       _frecuencia4+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       _frecuencia4+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_floattostr__cadena_+1
	MOVLW      2
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;frecuencias.c,401 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,402 :: 		UART1_Write_Text("     ");
	MOVLW      ?lstr5_frecuencias+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr5_frecuencias+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,405 :: 		UART1_Write_Text("\r\n");
	MOVLW      ?lstr6_frecuencias+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr6_frecuencias+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;frecuencias.c,408 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main45:
	DECFSZ     R13, 1
	GOTO       L_main45
	DECFSZ     R12, 1
	GOTO       L_main45
	DECFSZ     R11, 1
	GOTO       L_main45
	NOP
	NOP
;frecuencias.c,412 :: 		}
	GOTO       L_main43
;frecuencias.c,416 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
