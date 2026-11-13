
_m1derecha:

;_RX.c,29 :: 		void m1derecha()
;_RX.c,31 :: 		m11=1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,32 :: 		m12=0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,33 :: 		}
L_end_m1derecha:
	RETURN      0
; end of _m1derecha

_m1izquierda:

;_RX.c,35 :: 		void m1izquierda()
;_RX.c,37 :: 		m11=0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,38 :: 		m12=1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,40 :: 		}
L_end_m1izquierda:
	RETURN      0
; end of _m1izquierda

_m1quieto:

;_RX.c,42 :: 		void m1quieto()
;_RX.c,44 :: 		m11=0;
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;_RX.c,45 :: 		m12=0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;_RX.c,46 :: 		}
L_end_m1quieto:
	RETURN      0
; end of _m1quieto

_int_bajas:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;_RX.c,49 :: 		void  int_bajas() iv 0x0018 ics ICS_AUTO
;_RX.c,52 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_int_bajas0
;_RX.c,54 :: 		TMR0H=11;
	MOVLW       11
	MOVWF       TMR0H+0 
;_RX.c,55 :: 		TMR0L=220;
	MOVLW       220
	MOVWF       TMR0L+0 
;_RX.c,57 :: 		led2=!led2;
	BTG         RD4_bit+0, BitPos(RD4_bit+0) 
;_RX.c,60 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;_RX.c,61 :: 		}
L_int_bajas0:
;_RX.c,63 :: 		if(INT1F_bit==1)
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_int_bajas1
;_RX.c,65 :: 		led=!led;
	BTG         RD3_bit+0, BitPos(RD3_bit+0) 
;_RX.c,68 :: 		INT1F_bit=0; // limpia la bandera
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;_RX.c,69 :: 		}
L_int_bajas1:
;_RX.c,72 :: 		}
L_end_int_bajas:
L__int_bajas26:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _int_bajas

_INTERRPCION_altas:

;_RX.c,76 :: 		void INTERRPCION_altas() iv 0x0008 ics ICS_AUTO
;_RX.c,79 :: 		if(INT0F_bit==1)
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_INTERRPCION_altas2
;_RX.c,81 :: 		led3=!led3;
	BTG         RA0_bit+0, BitPos(RA0_bit+0) 
;_RX.c,84 :: 		INT0F_bit=0; // limpia la bandera
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;_RX.c,85 :: 		}
L_INTERRPCION_altas2:
;_RX.c,88 :: 		if (TMR1IF_bit==1)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_INTERRPCION_altas3
;_RX.c,94 :: 		TMR1H=60;
	MOVLW       60
	MOVWF       TMR1H+0 
;_RX.c,95 :: 		TMR1L=175;
	MOVLW       175
	MOVWF       TMR1L+0 
;_RX.c,97 :: 		led1=!led1;
	BTG         RD5_bit+0, BitPos(RD5_bit+0) 
;_RX.c,99 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;_RX.c,100 :: 		}
L_INTERRPCION_altas3:
;_RX.c,104 :: 		}
L_end_INTERRPCION_altas:
L__INTERRPCION_altas28:
	RETFIE      1
; end of _INTERRPCION_altas

_main:

;_RX.c,106 :: 		void main()
;_RX.c,110 :: 		ADCON1=0b1111;
	MOVLW       15
	MOVWF       ADCON1+0 
;_RX.c,112 :: 		TRISA=0;
	CLRF        TRISA+0 
;_RX.c,113 :: 		TRISB=0 ;
	CLRF        TRISB+0 
;_RX.c,114 :: 		TRISC=0;
	CLRF        TRISC+0 
;_RX.c,115 :: 		TRISD=0;
	CLRF        TRISD+0 
;_RX.c,116 :: 		TRISC7_bit=1; // enbtrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;_RX.c,117 :: 		TRISB0_bit=1; // entrda pulsador
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;_RX.c,118 :: 		TRISB1_bit=1; // entrda pulsador
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;_RX.c,121 :: 		INTCON=0B00000000;//
	CLRF        INTCON+0 
;_RX.c,123 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;_RX.c,124 :: 		PWM1_Init(300);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       208
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;_RX.c,125 :: 		PWM1_Set_Duty(127);
	MOVLW       127
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;_RX.c,126 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;_RX.c,127 :: 		UART1_Write_Text("HOLA MUNDO");
	MOVLW       ?lstr1__RX+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1__RX+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_RX.c,128 :: 		RCEN_bit=1; // habilita la recepcion continua
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;_RX.c,131 :: 		INT0F_bit=0; /// LIMPIA LA BENDERA
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;_RX.c,132 :: 		INT0E_bit=1; // AUTORIZA INT PROPIA
	BSF         INT0E_bit+0, BitPos(INT0E_bit+0) 
;_RX.c,133 :: 		INTEDG0_bit=0; // FLANCO DE BAJADOS
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;_RX.c,136 :: 		INT1F_bit=0; /// LIMPIA LA BENDERA
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;_RX.c,137 :: 		INT1E_bit=1; // AUTORIZA INT PROPIA
	BSF         INT1E_bit+0, BitPos(INT1E_bit+0) 
;_RX.c,138 :: 		INTEDG1_bit=0; // FLANCO DE BAJADOS
	BCF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;_RX.c,139 :: 		INT1IP_bit=0;  // baja priorida
	BCF         INT1IP_bit+0, BitPos(INT1IP_bit+0) 
;_RX.c,142 :: 		T1CON=0;
	CLRF        T1CON+0 
;_RX.c,144 :: 		TMR1H=60;
	MOVLW       60
	MOVWF       TMR1H+0 
;_RX.c,145 :: 		TMR1L=175;
	MOVLW       175
	MOVWF       TMR1L+0 
;_RX.c,147 :: 		T1CKPS1_bit=1;
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;_RX.c,148 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;_RX.c,151 :: 		TMR1IF_bit=0;  //limpia bandera
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;_RX.c,152 :: 		TMR1IE_bit=1;// habilita la INTERRPCION
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;_RX.c,154 :: 		TMR1ON_bit=1; //prende
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;_RX.c,155 :: 		TMR1IP_bit=1; // prioridad alta
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;_RX.c,159 :: 		T0CON=0;
	CLRF        T0CON+0 
;_RX.c,161 :: 		TMR0H=11;
	MOVLW       11
	MOVWF       TMR0H+0 
;_RX.c,162 :: 		TMR0L=220;
	MOVLW       220
	MOVWF       TMR0L+0 
;_RX.c,165 :: 		T0PS2_bit=0;
	BCF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;_RX.c,166 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;_RX.c,167 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;_RX.c,170 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;_RX.c,171 :: 		TMR0IE_bit=1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;_RX.c,173 :: 		T08BIT_bit=0; // trabaja 16 bit
	BCF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;_RX.c,174 :: 		TMR0ON_bit=1;  // prende timer 0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;_RX.c,175 :: 		TMR0IP_bit=0;// prioridad alta
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;_RX.c,179 :: 		IPEN_bit=1;  // autoroizsa prioridas
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;_RX.c,183 :: 		GIEL_bit=1; // aurotiza las bajas
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
;_RX.c,184 :: 		GIE_bit=1; // AUTORIZA LAS INTERRPCIONES  altas
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;_RX.c,189 :: 		while (1)
L_main4:
;_RX.c,192 :: 		UART1_read_Text(trama_rx,"*",30);   //  semibloqueante
	MOVLW       _trama_rx+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr2__RX+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr2__RX+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       30
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;_RX.c,193 :: 		if (strstr(trama_rx,"led1="))      //led1=on*
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
	GOTO        L_main6
;_RX.c,195 :: 		if (strstr(trama_rx,"on")) led1=1;
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
	GOTO        L_main7
	BSF         RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_main8
L_main7:
;_RX.c,196 :: 		else led1=0;
	BCF         RD5_bit+0, BitPos(RD5_bit+0) 
L_main8:
;_RX.c,197 :: 		}
	GOTO        L_main9
L_main6:
;_RX.c,199 :: 		else if (strstr(trama_rx,"led2="))      //led1=on*
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
	GOTO        L_main10
;_RX.c,201 :: 		if (strstr(trama_rx,"on")) led2=1;
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
	GOTO        L_main11
	BSF         RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_main12
L_main11:
;_RX.c,202 :: 		else led2=0;
	BCF         RD4_bit+0, BitPos(RD4_bit+0) 
L_main12:
;_RX.c,203 :: 		}
	GOTO        L_main13
L_main10:
;_RX.c,205 :: 		else if (strstr(trama_rx,"m1der"))  m1derecha();
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
	GOTO        L_main14
	CALL        _m1derecha+0, 0
	GOTO        L_main15
L_main14:
;_RX.c,206 :: 		else if (strstr(trama_rx,"m1izq"))  m1izquierda();
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
	GOTO        L_main16
	CALL        _m1izquierda+0, 0
	GOTO        L_main17
L_main16:
;_RX.c,207 :: 		else if (strstr(trama_rx,"m1stop"))  m1quieto();
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr9__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr9__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	CALL        _m1quieto+0, 0
	GOTO        L_main19
L_main18:
;_RX.c,212 :: 		else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr10__RX+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr10__RX+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
;_RX.c,214 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr11__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr11__RX+0)
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
;_RX.c,215 :: 		strcpy(procesa, strtok(0, "*"));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr12__RX+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr12__RX+0)
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
;_RX.c,217 :: 		dato_rx=atoi(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx+0 
;_RX.c,218 :: 		PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;_RX.c,221 :: 		}
L_main20:
L_main19:
L_main17:
L_main15:
L_main13:
L_main9:
;_RX.c,228 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
	NOP
;_RX.c,230 :: 		}
	GOTO        L_main4
;_RX.c,235 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
