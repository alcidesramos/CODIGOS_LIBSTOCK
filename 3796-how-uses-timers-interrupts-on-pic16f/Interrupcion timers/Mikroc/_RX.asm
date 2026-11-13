
_m1derecha:

;_RX.c,29 :: 		void m1derecha()
;_RX.c,31 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,32 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,33 :: 		}
L_end_m1derecha:
	RETURN
; end of _m1derecha

_m1izquierda:

;_RX.c,35 :: 		void m1izquierda()
;_RX.c,37 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,38 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,40 :: 		}
L_end_m1izquierda:
	RETURN
; end of _m1izquierda

_m1quieto:

;_RX.c,42 :: 		void m1quieto()
;_RX.c,44 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,45 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,46 :: 		}
L_end_m1quieto:
	RETURN
; end of _m1quieto

_INTERRPCION:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;_RX.c,49 :: 		void INTERRPCION() iv 0x0004 ics ICS_AUTO
;_RX.c,51 :: 		if(INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_INTERRPCION0
;_RX.c,53 :: 		led3=!led3;
	MOVLW
	XORWF      RA0_bit+0, 1
;_RX.c,56 :: 		INTF_bit=0; // limpia la bandera
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;_RX.c,57 :: 		}
L_INTERRPCION0:
;_RX.c,60 :: 		if (TMR1IF_bit==1)
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_INTERRPCION1
;_RX.c,66 :: 		TMR1H=60;
	MOVLW      60
	MOVWF      TMR1H+0
;_RX.c,67 :: 		TMR1L=175;
	MOVLW      175
	MOVWF      TMR1L+0
;_RX.c,69 :: 		led1=!led1;
	MOVLW
	XORWF      RC5_bit+0, 1
;_RX.c,71 :: 		TMR1IF_bit=0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;_RX.c,72 :: 		}
L_INTERRPCION1:
;_RX.c,75 :: 		if (TMR0IF_bit==1)
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_INTERRPCION2
;_RX.c,77 :: 		TMR0=100;
	MOVLW      100
	MOVWF      TMR0+0
;_RX.c,78 :: 		alargue++;
	INCF       _alargue+0, 1
;_RX.c,79 :: 		if (alargue>=100)      //10ms*100     1seg
	MOVLW      100
	SUBWF      _alargue+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_INTERRPCION3
;_RX.c,81 :: 		led2=!led2;
	MOVLW
	XORWF      RC4_bit+0, 1
;_RX.c,82 :: 		alargue=0;
	CLRF       _alargue+0
;_RX.c,84 :: 		}
L_INTERRPCION3:
;_RX.c,86 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;_RX.c,87 :: 		}
L_INTERRPCION2:
;_RX.c,90 :: 		}
L_end_INTERRPCION:
L__INTERRPCION26:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _INTERRPCION

_main:

;_RX.c,92 :: 		void main()
;_RX.c,97 :: 		ADCON1=0b0111;
	MOVLW      7
	MOVWF      ADCON1+0
;_RX.c,99 :: 		TRISA=0;
	CLRF       TRISA+0
;_RX.c,100 :: 		TRISB=0 ;
	CLRF       TRISB+0
;_RX.c,101 :: 		TRISC=0;
	CLRF       TRISC+0
;_RX.c,102 :: 		TRISC7_bit=1; // enbtrada rx
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;_RX.c,103 :: 		TRISB0_bit=1; // entrda pulsador
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;_RX.c,104 :: 		INTCON=0B01000000;//  BIT 6 =1  AUTORIZA INT PERIFERICOS MANDOS MEDIOS
	MOVLW      64
	MOVWF      INTCON+0
;_RX.c,107 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;_RX.c,108 :: 		PWM1_Init(300);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      208
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;_RX.c,109 :: 		PWM1_Set_Duty(127);
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;_RX.c,110 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;_RX.c,111 :: 		UART1_Write_Text("HOLA MUNDO");
	MOVLW      ?lstr1__RX+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;_RX.c,112 :: 		RCEN_bit=1; // habilita la recepcion continua
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;_RX.c,115 :: 		INTF_bit=0; /// LIMPIA LA BENDERA
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;_RX.c,116 :: 		INTE_bit=1; // AUTORIZA INT PROPIA
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;_RX.c,117 :: 		INTEDG_bit=0; // FLANCO DE BAJADOS
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;_RX.c,120 :: 		T1CON=0;
	CLRF       T1CON+0
;_RX.c,122 :: 		TMR1H=60;
	MOVLW      60
	MOVWF      TMR1H+0
;_RX.c,123 :: 		TMR1L=175;
	MOVLW      175
	MOVWF      TMR1L+0
;_RX.c,125 :: 		T1CKPS1_bit=1;
	BSF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;_RX.c,126 :: 		T1CKPS0_bit=0;
	BCF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;_RX.c,129 :: 		TMR1IF_bit=0;  //limpia bandera
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;_RX.c,130 :: 		TMR1IE_bit=1;// habilita la INTERRPCION
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;_RX.c,132 :: 		TMR1ON_bit=1; //prende
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;_RX.c,135 :: 		OPTION_REG=0;
	CLRF       OPTION_REG+0
;_RX.c,137 :: 		TMR0=100;
	MOVLW      100
	MOVWF      TMR0+0
;_RX.c,139 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;_RX.c,140 :: 		PS1_bit=0;
	BCF        PS1_bit+0, BitPos(PS1_bit+0)
;_RX.c,141 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;_RX.c,144 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;_RX.c,145 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;_RX.c,151 :: 		GIE_bit=1; // AUTORIZA LAS INTERRPCIONES
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;_RX.c,155 :: 		while (1)
L_main4:
;_RX.c,158 :: 		UART1_read_Text(trama_rx,"*",30);   //  semibloqueante
	MOVLW      _trama_rx+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr2__RX+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      30
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;_RX.c,159 :: 		if (strstr(trama_rx,"led1="))      //led1=on*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr3__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;_RX.c,161 :: 		if (strstr(trama_rx,"on")) led1=1;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr4__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main8
L_main7:
;_RX.c,162 :: 		else led1=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
L_main8:
;_RX.c,163 :: 		}
	GOTO       L_main9
L_main6:
;_RX.c,165 :: 		else if (strstr(trama_rx,"led2="))      //led1=on*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr5__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;_RX.c,167 :: 		if (strstr(trama_rx,"on")) led2=1;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr6__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main12
L_main11:
;_RX.c,168 :: 		else led2=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
L_main12:
;_RX.c,169 :: 		}
	GOTO       L_main13
L_main10:
;_RX.c,171 :: 		else if (strstr(trama_rx,"m1der"))  m1derecha();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr7__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	CALL       _m1derecha+0
	GOTO       L_main15
L_main14:
;_RX.c,172 :: 		else if (strstr(trama_rx,"m1izq"))  m1izquierda();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr8__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	CALL       _m1izquierda+0
	GOTO       L_main17
L_main16:
;_RX.c,173 :: 		else if (strstr(trama_rx,"m1stop"))  m1quieto();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr9__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	CALL       _m1quieto+0
	GOTO       L_main19
L_main18:
;_RX.c,178 :: 		else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr10__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
;_RX.c,180 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
	MOVLW      _trama_rx+0
	MOVWF      FARG_strtok_s1+0
	MOVLW      ?lstr11__RX+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;_RX.c,181 :: 		strcpy(procesa, strtok(0, "*"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	MOVLW      ?lstr12__RX+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;_RX.c,183 :: 		dato_rx=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _dato_rx+0
;_RX.c,184 :: 		PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;_RX.c,187 :: 		}
L_main20:
L_main19:
L_main17:
L_main15:
L_main13:
L_main9:
;_RX.c,194 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;_RX.c,196 :: 		}
	GOTO       L_main4
;_RX.c,201 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
