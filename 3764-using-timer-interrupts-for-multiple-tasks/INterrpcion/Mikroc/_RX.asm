
_m1derecha:

;_RX.c,27 :: 		void m1derecha()
;_RX.c,29 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,30 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,31 :: 		}
L_end_m1derecha:
	RETURN
; end of _m1derecha

_m1izquierda:

;_RX.c,33 :: 		void m1izquierda()
;_RX.c,35 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,36 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,38 :: 		}
L_end_m1izquierda:
	RETURN
; end of _m1izquierda

_m1quieto:

;_RX.c,40 :: 		void m1quieto()
;_RX.c,42 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,43 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,44 :: 		}
L_end_m1quieto:
	RETURN
; end of _m1quieto

_InitTimer1:

;_RX.c,51 :: 		void InitTimer1(){
;_RX.c,52 :: 		T1CON	 = 0x11;
	MOVLW      17
	MOVWF      T1CON+0
;_RX.c,53 :: 		TMR1IF_bit	 = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;_RX.c,54 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;_RX.c,55 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;_RX.c,56 :: 		TMR1IE_bit	 = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;_RX.c,57 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;_RX.c,58 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;_RX.c,60 :: 		void Interrupt(){
;_RX.c,61 :: 		if (TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;_RX.c,62 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;_RX.c,63 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;_RX.c,64 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;_RX.c,66 :: 		PORTB=luces[cuenta1];
	MOVF       _cuenta1+0, 0
	ADDLW      _luces+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;_RX.c,68 :: 		if (cuenta1>=7) cuenta1=0;     // 7 es el  numero de efectos empezando en cero
	MOVLW      7
	SUBWF      _cuenta1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt1
	CLRF       _cuenta1+0
L_Interrupt1:
;_RX.c,69 :: 		cuenta1++;
	INCF       _cuenta1+0, 1
;_RX.c,71 :: 		if (sw==0) led3=1;
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_Interrupt2
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_Interrupt3
L_Interrupt2:
;_RX.c,72 :: 		else led3=0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
L_Interrupt3:
;_RX.c,73 :: 		cuenta++;
	INCF       _cuenta+0, 1
;_RX.c,74 :: 		if (cuenta>=10)   /// si va 1 segundp
	MOVLW      10
	SUBWF      _cuenta+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt4
;_RX.c,76 :: 		led=!led;
	MOVLW
	XORWF      RC0_bit+0, 1
;_RX.c,77 :: 		cuenta=0;
	CLRF       _cuenta+0
;_RX.c,78 :: 		}
L_Interrupt4:
;_RX.c,81 :: 		}
L_Interrupt0:
;_RX.c,82 :: 		}
L_end_Interrupt:
L__Interrupt28:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;_RX.c,86 :: 		void main()
;_RX.c,91 :: 		ADCON1=0b0111;
	MOVLW      7
	MOVWF      ADCON1+0
;_RX.c,93 :: 		TRISA=0;
	CLRF       TRISA+0
;_RX.c,94 :: 		TRISB=0 ;
	CLRF       TRISB+0
;_RX.c,95 :: 		TRISC=0;
	CLRF       TRISC+0
;_RX.c,96 :: 		TRISC7_bit=1; // enbtrada rx
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;_RX.c,97 :: 		TRISA1_bit=1; //entrada suiche
	BSF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;_RX.c,100 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;_RX.c,101 :: 		PWM1_Init(300);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      208
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;_RX.c,102 :: 		PWM1_Set_Duty(127);
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;_RX.c,103 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;_RX.c,104 :: 		UART1_Write_Text("HOLA MUNDO");
	MOVLW      ?lstr1__RX+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;_RX.c,105 :: 		RCEN_bit=1; // habilita la recepcion continua
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;_RX.c,107 :: 		InitTimer1();
	CALL       _InitTimer1+0
;_RX.c,109 :: 		while (1)
L_main5:
;_RX.c,112 :: 		UART1_read_Text(trama_rx,"*",30);   //  semibloqueante
	MOVLW      _trama_rx+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr2__RX+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      30
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;_RX.c,113 :: 		if (strstr(trama_rx,"led1="))      //led1=on*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr3__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;_RX.c,115 :: 		if (strstr(trama_rx,"on")) led1=1;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr4__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main9
L_main8:
;_RX.c,116 :: 		else led1=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
L_main9:
;_RX.c,117 :: 		}
	GOTO       L_main10
L_main7:
;_RX.c,119 :: 		else if (strstr(trama_rx,"led2="))      //led1=on*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr5__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;_RX.c,121 :: 		if (strstr(trama_rx,"on")) led2=1;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr6__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main13
L_main12:
;_RX.c,122 :: 		else led2=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
L_main13:
;_RX.c,123 :: 		}
	GOTO       L_main14
L_main11:
;_RX.c,125 :: 		else if (strstr(trama_rx,"m1der"))  m1derecha();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr7__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	CALL       _m1derecha+0
	GOTO       L_main16
L_main15:
;_RX.c,126 :: 		else if (strstr(trama_rx,"m1izq"))  m1izquierda();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr8__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	CALL       _m1izquierda+0
	GOTO       L_main18
L_main17:
;_RX.c,127 :: 		else if (strstr(trama_rx,"m1stop"))  m1quieto();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr9__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	CALL       _m1quieto+0
	GOTO       L_main20
L_main19:
;_RX.c,132 :: 		else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr10__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
;_RX.c,134 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
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
;_RX.c,135 :: 		strcpy(procesa, strtok(0, "*"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	MOVLW      ?lstr12__RX+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;_RX.c,137 :: 		dato_rx=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _dato_rx+0
;_RX.c,138 :: 		PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;_RX.c,141 :: 		}
L_main21:
L_main20:
L_main18:
L_main16:
L_main14:
L_main10:
;_RX.c,148 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;_RX.c,150 :: 		}
	GOTO       L_main5
;_RX.c,155 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
