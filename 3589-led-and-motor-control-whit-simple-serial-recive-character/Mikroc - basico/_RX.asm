
_m1derecha:

;_RX.c,14 :: 		void m1derecha()
;_RX.c,16 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,17 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,18 :: 		}
L_end_m1derecha:
	RETURN
; end of _m1derecha

_m1izquierda:

;_RX.c,20 :: 		void m1izquierda()
;_RX.c,22 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,23 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,25 :: 		}
L_end_m1izquierda:
	RETURN
; end of _m1izquierda

_m1quieto:

;_RX.c,27 :: 		void m1quieto()
;_RX.c,29 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;_RX.c,30 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;_RX.c,31 :: 		}
L_end_m1quieto:
	RETURN
; end of _m1quieto

_main:

;_RX.c,34 :: 		void main()
;_RX.c,37 :: 		TRISB=0 ;
	CLRF       TRISB+0
;_RX.c,38 :: 		TRISC=0;
	CLRF       TRISC+0
;_RX.c,39 :: 		TRISC7_bit=1; // enbtrada rx
	BSF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;_RX.c,41 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;_RX.c,42 :: 		PWM1_Init(300);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      208
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;_RX.c,43 :: 		PWM1_Set_Duty(127);
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;_RX.c,44 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;_RX.c,45 :: 		UART1_Write_Text("HOLA MUNDO");
	MOVLW      ?lstr1__RX+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;_RX.c,46 :: 		RCEN_bit=1; // habilita la recepcion continua
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;_RX.c,48 :: 		while (1)
L_main0:
;_RX.c,50 :: 		while (UART1_Data_Ready() == 0) ;// bloqueado esperando dato
L_main2:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;_RX.c,52 :: 		dato_rx = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_rx+0
;_RX.c,54 :: 		switch (dato_rx)
	GOTO       L_main4
;_RX.c,56 :: 		case 'a':
L_main6:
;_RX.c,57 :: 		led1=1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;_RX.c,58 :: 		break;
	GOTO       L_main5
;_RX.c,60 :: 		case 'b':
L_main7:
;_RX.c,61 :: 		led1=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;_RX.c,62 :: 		break;
	GOTO       L_main5
;_RX.c,64 :: 		case 'c':
L_main8:
;_RX.c,65 :: 		led2=1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;_RX.c,66 :: 		break;
	GOTO       L_main5
;_RX.c,68 :: 		case 'd':
L_main9:
;_RX.c,69 :: 		led2=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;_RX.c,70 :: 		break;
	GOTO       L_main5
;_RX.c,72 :: 		case '0':
L_main10:
;_RX.c,73 :: 		m1derecha();
	CALL       _m1derecha+0
;_RX.c,74 :: 		break;
	GOTO       L_main5
;_RX.c,77 :: 		case '1':
L_main11:
;_RX.c,78 :: 		m1izquierda();
	CALL       _m1izquierda+0
;_RX.c,79 :: 		break;
	GOTO       L_main5
;_RX.c,81 :: 		case '2':
L_main12:
;_RX.c,82 :: 		m1quieto();
	CALL       _m1quieto+0
;_RX.c,83 :: 		break;
	GOTO       L_main5
;_RX.c,89 :: 		}
L_main4:
	MOVF       _dato_rx+0, 0
	XORLW      97
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _dato_rx+0, 0
	XORLW      98
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _dato_rx+0, 0
	XORLW      99
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _dato_rx+0, 0
	XORLW      100
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _dato_rx+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _dato_rx+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _dato_rx+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main12
L_main5:
;_RX.c,93 :: 		led=!led;
	MOVLW
	XORWF      RC0_bit+0, 1
;_RX.c,94 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;_RX.c,96 :: 		}
	GOTO       L_main0
;_RX.c,101 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
