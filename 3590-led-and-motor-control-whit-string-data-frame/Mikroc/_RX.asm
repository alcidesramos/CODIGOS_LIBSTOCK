
_m1derecha:

;_RX.c,17 :: 		void m1derecha()
;_RX.c,19 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,20 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,21 :: 		}
L_end_m1derecha:
	RETURN
; end of _m1derecha

_m1izquierda:

;_RX.c,23 :: 		void m1izquierda()
;_RX.c,25 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,26 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,28 :: 		}
L_end_m1izquierda:
	RETURN
; end of _m1izquierda

_m1quieto:

;_RX.c,30 :: 		void m1quieto()
;_RX.c,32 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,33 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,34 :: 		}
L_end_m1quieto:
	RETURN
; end of _m1quieto

_main:

;_RX.c,37 :: 		void main()
;_RX.c,40 :: 		TRISB=0 ;
	CLRF       TRISB+0
;_RX.c,41 :: 		TRISC=0;
	CLRF       TRISC+0
;_RX.c,42 :: 		TRISC7_bit=1; // enbtrada rx
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;_RX.c,44 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;_RX.c,45 :: 		PWM1_Init(300);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      208
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;_RX.c,46 :: 		PWM1_Set_Duty(127);
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;_RX.c,47 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;_RX.c,48 :: 		UART1_Write_Text("HOLA MUNDO");
	MOVLW      ?lstr1__RX+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;_RX.c,49 :: 		RCEN_bit=1; // habilita la recepcion continua
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;_RX.c,51 :: 		while (1)
L_main0:
;_RX.c,54 :: 		UART1_read_Text(trama_rx,"*",30);   //  semibloqueante
	MOVLW      _trama_rx+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr2__RX+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      30
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;_RX.c,55 :: 		if (strstr(trama_rx,"led1="))      //led1=on*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr3__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;_RX.c,57 :: 		if (strstr(trama_rx,"on")) led1=1;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr4__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main4
L_main3:
;_RX.c,58 :: 		else led1=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
L_main4:
;_RX.c,59 :: 		}
	GOTO       L_main5
L_main2:
;_RX.c,61 :: 		else if (strstr(trama_rx,"led2="))      //led1=on*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr5__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;_RX.c,63 :: 		if (strstr(trama_rx,"on")) led2=1;
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr6__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main8
L_main7:
;_RX.c,64 :: 		else led2=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
L_main8:
;_RX.c,65 :: 		}
	GOTO       L_main9
L_main6:
;_RX.c,67 :: 		else if (strstr(trama_rx,"m1der"))  m1derecha();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr7__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	CALL       _m1derecha+0
	GOTO       L_main11
L_main10:
;_RX.c,68 :: 		else if (strstr(trama_rx,"m1izq"))  m1izquierda();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr8__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	CALL       _m1izquierda+0
	GOTO       L_main13
L_main12:
;_RX.c,69 :: 		else if (strstr(trama_rx,"m1stop"))  m1quieto();
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr9__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	CALL       _m1quieto+0
	GOTO       L_main15
L_main14:
;_RX.c,74 :: 		else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
	MOVLW      _trama_rx+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr10__RX+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
;_RX.c,76 :: 		strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
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
;_RX.c,77 :: 		strcpy(procesa, strtok(0, "*"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	MOVLW      ?lstr12__RX+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;_RX.c,79 :: 		dato_rx=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _dato_rx+0
;_RX.c,80 :: 		PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;_RX.c,83 :: 		}
L_main16:
L_main15:
L_main13:
L_main11:
L_main9:
L_main5:
;_RX.c,89 :: 		led=!led;
	MOVLW
	XORWF      RC0_bit+0, 1
;_RX.c,90 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;_RX.c,92 :: 		}
	GOTO       L_main0
;_RX.c,97 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
