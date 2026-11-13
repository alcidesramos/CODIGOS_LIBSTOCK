
_m1derecha:

;_RX.c,37 :: 		void m1derecha()
;_RX.c,39 :: 		m11=1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,40 :: 		m12=0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,41 :: 		}
L_end_m1derecha:
	RETURN      0
; end of _m1derecha

_m1izquierda:

;_RX.c,43 :: 		void m1izquierda()
;_RX.c,45 :: 		m11=0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,46 :: 		m12=1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,48 :: 		}
L_end_m1izquierda:
	RETURN      0
; end of _m1izquierda

_m1quieto:

;_RX.c,50 :: 		void m1quieto()
;_RX.c,52 :: 		m11=0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,53 :: 		m12=0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,54 :: 		}
L_end_m1quieto:
	RETURN      0
; end of _m1quieto

_procesa_rx:

;_RX.c,56 :: 		void procesa_rx()
;_RX.c,58 :: 		if (strstr(trama_rx,"led1="))      //led1=on*
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx0
;_RX.c,60 :: 		if (strstr(trama_rx,"on")) ledrx1=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr2__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr2__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx1
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_procesa_rx2
L_procesa_rx1:
;_RX.c,61 :: 		else ledrx1=0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
L_procesa_rx2:
;_RX.c,62 :: 		}
	GOTO        L_procesa_rx3
L_procesa_rx0:
;_RX.c,64 :: 		else if (strstr(trama_rx,"led2="))      //led1=on*
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr3__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr3__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx4
;_RX.c,66 :: 		if (strstr(trama_rx,"on")) ledrx2=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr4__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr4__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx5
	BSF         RE1_bit+0, BitPos(RE1_bit+0) 
	GOTO        L_procesa_rx6
L_procesa_rx5:
;_RX.c,67 :: 		else ledrx2=0;
	BCF         RE1_bit+0, BitPos(RE1_bit+0) 
L_procesa_rx6:
;_RX.c,68 :: 		}
	GOTO        L_procesa_rx7
L_procesa_rx4:
;_RX.c,70 :: 		else if (strstr(trama_rx,"m1der"))  m1derecha();
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr5__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr5__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx8
	CALL        _m1derecha+0, 0
	GOTO        L_procesa_rx9
L_procesa_rx8:
;_RX.c,71 :: 		else if (strstr(trama_rx,"m1izq"))  m1izquierda();
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr6__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr6__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx10
	CALL        _m1izquierda+0, 0
	GOTO        L_procesa_rx11
L_procesa_rx10:
;_RX.c,72 :: 		else if (strstr(trama_rx,"m1stop"))  m1quieto();
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr7__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr7__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx12
	CALL        _m1quieto+0, 0
	GOTO        L_procesa_rx13
L_procesa_rx12:
;_RX.c,77 :: 		else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr8__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr8__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_procesa_rx14
;_RX.c,79 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr9__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr9__RX+0)
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
;_RX.c,80 :: 		strcpy(procesa, strtok(0, "*"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr10__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr10__RX+0)
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
;_RX.c,82 :: 		dato_rx=atoi(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx+0 
;_RX.c,83 :: 		PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;_RX.c,86 :: 		}
L_procesa_rx14:
L_procesa_rx13:
L_procesa_rx11:
L_procesa_rx9:
L_procesa_rx7:
L_procesa_rx3:
;_RX.c,90 :: 		}
L_end_procesa_rx:
	RETURN      0
; end of _procesa_rx

_int_bajas:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;_RX.c,95 :: 		void  int_bajas() iv 0x0018 ics ICS_AUTO
;_RX.c,98 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_int_bajas15
;_RX.c,100 :: 		TMR0H=11;
	MOVLW       11
	MOVWF       TMR0H+0 
;_RX.c,101 :: 		TMR0L=220;
	MOVLW       220
	MOVWF       TMR0L+0 
;_RX.c,103 :: 		led2=!led2;
	BTG         RD4_bit+0, BitPos(RD4_bit+0) 
;_RX.c,106 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;_RX.c,107 :: 		}
L_int_bajas15:
;_RX.c,109 :: 		if(INT1F_bit==1)
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_int_bajas16
;_RX.c,111 :: 		led=!led;
	BTG         RD3_bit+0, BitPos(RD3_bit+0) 
;_RX.c,114 :: 		INT1F_bit=0; // limpia la bandera
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;_RX.c,115 :: 		}
L_int_bajas16:
;_RX.c,118 :: 		}
L_end_int_bajas:
L__int_bajas31:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _int_bajas

_INTERRPCION_altas:

;_RX.c,123 :: 		void INTERRPCION_altas() iv 0x0008 ics ICS_AUTO
;_RX.c,126 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_INTERRPCION_altas17
;_RX.c,128 :: 		dato_rx=UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx+0 
;_RX.c,129 :: 		trama_rx[puntero_rx]=dato_rx; //lo almacena en la trama
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero_rx+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;_RX.c,130 :: 		puntero_rx++;
	INCF        _puntero_rx+0, 1 
;_RX.c,131 :: 		if (puntero_rx>=100) puntero_rx=0;
	MOVLW       100
	SUBWF       _puntero_rx+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_INTERRPCION_altas18
	CLRF        _puntero_rx+0 
L_INTERRPCION_altas18:
;_RX.c,132 :: 		if (dato_rx=='*')       // si dato es  igual final trama
	MOVF        _dato_rx+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_INTERRPCION_altas19
;_RX.c,134 :: 		RCIE_bit=0; // dehabilito la int serial
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;_RX.c,135 :: 		flag_rx=1;
	MOVLW       1
	MOVWF       _flag_rx+0 
;_RX.c,139 :: 		}
L_INTERRPCION_altas19:
;_RX.c,146 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;_RX.c,147 :: 		}
L_INTERRPCION_altas17:
;_RX.c,150 :: 		if(INT0F_bit==1)
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_INTERRPCION_altas20
;_RX.c,152 :: 		led3=!led3;
	BTG         RA0_bit+0, BitPos(RA0_bit+0) 
;_RX.c,155 :: 		INT0F_bit=0; // limpia la bandera
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;_RX.c,156 :: 		}
L_INTERRPCION_altas20:
;_RX.c,159 :: 		if (TMR1IF_bit==1)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_INTERRPCION_altas21
;_RX.c,165 :: 		TMR1H=60;
	MOVLW       60
	MOVWF       TMR1H+0 
;_RX.c,166 :: 		TMR1L=175;
	MOVLW       175
	MOVWF       TMR1L+0 
;_RX.c,168 :: 		led1=!led1;
	BTG         RD5_bit+0, BitPos(RD5_bit+0) 
;_RX.c,170 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;_RX.c,171 :: 		}
L_INTERRPCION_altas21:
;_RX.c,175 :: 		}
L_end_INTERRPCION_altas:
L__INTERRPCION_altas33:
	RETFIE      1
; end of _INTERRPCION_altas

_main:

;_RX.c,178 :: 		void main()
;_RX.c,182 :: 		ADCON1=0b1111;
	MOVLW       15
	MOVWF       ADCON1+0 
;_RX.c,184 :: 		TRISA=0;
	CLRF        TRISA+0 
;_RX.c,185 :: 		TRISB=0 ;
	CLRF        TRISB+0 
;_RX.c,186 :: 		TRISC=0;
	CLRF        TRISC+0 
;_RX.c,187 :: 		TRISD=0;
	CLRF        TRISD+0 
;_RX.c,188 :: 		TRISE=0;
	CLRF        TRISE+0 
;_RX.c,190 :: 		TRISC7_bit=1; // enbtrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;_RX.c,191 :: 		TRISB0_bit=1; // entrda pulsador
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;_RX.c,192 :: 		TRISB1_bit=1; // entrda pulsador
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;_RX.c,195 :: 		INTCON=0B00000000;//
	CLRF        INTCON+0 
;_RX.c,197 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;_RX.c,198 :: 		PWM1_Init(300);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       208
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;_RX.c,200 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;_RX.c,201 :: 		UART1_Write_Text("HOLA MUNDO");
	MOVLW       ?lstr11__RX+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11__RX+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_RX.c,202 :: 		RCEN_bit=1; // habilita la recepcion continua
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;_RX.c,205 :: 		INT0F_bit=0; /// LIMPIA LA BENDERA
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;_RX.c,206 :: 		INT0E_bit=1; // AUTORIZA INT PROPIA
	BSF         INT0E_bit+0, BitPos(INT0E_bit+0) 
;_RX.c,207 :: 		INTEDG0_bit=0; // FLANCO DE BAJADOS
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;_RX.c,210 :: 		INT1F_bit=0; /// LIMPIA LA BENDERA
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;_RX.c,211 :: 		INT1E_bit=1; // AUTORIZA INT PROPIA
	BSF         INT1E_bit+0, BitPos(INT1E_bit+0) 
;_RX.c,212 :: 		INTEDG1_bit=0; // FLANCO DE BAJADOS
	BCF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;_RX.c,213 :: 		INT1IP_bit=0;  // baja priorida
	BCF         INT1IP_bit+0, BitPos(INT1IP_bit+0) 
;_RX.c,216 :: 		T1CON=0;
	CLRF        T1CON+0 
;_RX.c,218 :: 		TMR1H=60;
	MOVLW       60
	MOVWF       TMR1H+0 
;_RX.c,219 :: 		TMR1L=175;
	MOVLW       175
	MOVWF       TMR1L+0 
;_RX.c,221 :: 		T1CKPS1_bit=1;
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;_RX.c,222 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;_RX.c,225 :: 		TMR1IF_bit=0;  //limpia bandera
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;_RX.c,226 :: 		TMR1IE_bit=1;// habilita la INTERRPCION
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;_RX.c,228 :: 		TMR1ON_bit=1; //prende
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;_RX.c,229 :: 		TMR1IP_bit=1; // prioridad alta
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;_RX.c,233 :: 		T0CON=0;
	CLRF        T0CON+0 
;_RX.c,235 :: 		TMR0H=11;
	MOVLW       11
	MOVWF       TMR0H+0 
;_RX.c,236 :: 		TMR0L=220;
	MOVLW       220
	MOVWF       TMR0L+0 
;_RX.c,239 :: 		T0PS2_bit=0;
	BCF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;_RX.c,240 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;_RX.c,241 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;_RX.c,244 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;_RX.c,245 :: 		TMR0IE_bit=1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;_RX.c,247 :: 		T08BIT_bit=0; // trabaja 16 bit
	BCF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;_RX.c,248 :: 		TMR0ON_bit=1;  // prende timer 0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;_RX.c,249 :: 		TMR0IP_bit=0;// prioridad alta
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;_RX.c,252 :: 		RCIP_bit=1; // alta prioridad
	BSF         RCIP_bit+0, BitPos(RCIP_bit+0) 
;_RX.c,253 :: 		RCIF_bit=0;//limpia la bansera
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;_RX.c,254 :: 		RCIE_bit=1; // habilita la interrupcion
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;_RX.c,256 :: 		CREN_bit=1; // habilita la recepcion continua
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;_RX.c,261 :: 		IPEN_bit=1;  // autoroizsa prioridas
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;_RX.c,265 :: 		GIEL_bit=1; // aurotiza las bajas
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
;_RX.c,266 :: 		GIE_bit=1; // AUTORIZA LAS INTERRPCIONES  altas
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;_RX.c,271 :: 		while (1)
L_main22:
;_RX.c,273 :: 		ledmain=!ledmain;
	BTG         RE2_bit+0, BitPos(RE2_bit+0) 
;_RX.c,278 :: 		if(flag_rx==1)
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;_RX.c,280 :: 		procesa_rx();
	CALL        _procesa_rx+0, 0
;_RX.c,281 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;_RX.c,282 :: 		puntero_rx=0;
	CLRF        _puntero_rx+0 
;_RX.c,285 :: 		CREN_bit=0; //limpia buffer
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;_RX.c,286 :: 		CREN_bit=1;  // habilitar la recpcion
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;_RX.c,288 :: 		RCIE_bit=1; // habilita la interrpcion
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;_RX.c,290 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;_RX.c,292 :: 		}
L_main24:
;_RX.c,298 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
;_RX.c,300 :: 		}
	GOTO        L_main22
;_RX.c,305 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
