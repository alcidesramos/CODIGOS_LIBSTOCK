
_m1derecha:

;serial1.c,17 :: 		void m1derecha()
;serial1.c,19 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;serial1.c,20 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;serial1.c,21 :: 		}
L_end_m1derecha:
	RETURN
; end of _m1derecha

_m1izquierda:

;serial1.c,23 :: 		void m1izquierda()
;serial1.c,25 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;serial1.c,26 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;serial1.c,27 :: 		}
L_end_m1izquierda:
	RETURN
; end of _m1izquierda

_m1quieto:

;serial1.c,29 :: 		void m1quieto()
;serial1.c,31 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;serial1.c,32 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;serial1.c,33 :: 		}
L_end_m1quieto:
	RETURN
; end of _m1quieto

_main:

;serial1.c,37 :: 		void main()
;serial1.c,41 :: 		uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;serial1.c,42 :: 		trisb.b0=0;//salida m11
	BCF        TRISB+0, 0
;serial1.c,43 :: 		trisb.b1=0;//salida m12
	BCF        TRISB+0, 1
;serial1.c,44 :: 		trisc.b2=0; //salida pin PWM
	BCF        TRISC+0, 2
;serial1.c,45 :: 		trisc.B4=0; //salida led2
	BCF        TRISC+0, 4
;serial1.c,46 :: 		trisc.b5=0; //salida led 1
	BCF        TRISC+0, 5
;serial1.c,50 :: 		pwm1_init(300);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      208
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;serial1.c,51 :: 		PWM1_Set_Duty(100);//inia un valor inicial en el pwm
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;serial1.c,52 :: 		PWM1_Start();// prende el modulo pwm
	CALL       _PWM1_Start+0
;serial1.c,55 :: 		m1quieto();
	CALL       _m1quieto+0
;serial1.c,58 :: 		while (1)
L_main0:
;serial1.c,61 :: 		UART1_read_Text(trama,"*",30);
	MOVLW      _trama+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr1_serial1+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      30
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;serial1.c,64 :: 		if (strstr(trama,"led1="))
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr2_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;serial1.c,66 :: 		if (strstr(trama,"on")) led1=1;
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr3_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main4
L_main3:
;serial1.c,67 :: 		else led1=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
L_main4:
;serial1.c,68 :: 		}
	GOTO       L_main5
L_main2:
;serial1.c,70 :: 		else if (strstr(trama,"led2="))
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr4_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;serial1.c,72 :: 		if (strstr(trama,"on")) led2=1;
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr5_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main8
L_main7:
;serial1.c,73 :: 		else led2=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
L_main8:
;serial1.c,74 :: 		}
	GOTO       L_main9
L_main6:
;serial1.c,76 :: 		else if (strstr(trama,"m1der"))  m1derecha();
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr6_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	CALL       _m1derecha+0
	GOTO       L_main11
L_main10:
;serial1.c,78 :: 		else if (strstr(trama,"m1izq"))  m1izquierda();
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr7_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	CALL       _m1izquierda+0
	GOTO       L_main13
L_main12:
;serial1.c,80 :: 		else if (strstr(trama,"m1stop"))  m1quieto();
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr8_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	CALL       _m1quieto+0
	GOTO       L_main15
L_main14:
;serial1.c,82 :: 		else if (strstr(trama,"m1pwm="))
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr9_serial1+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
;serial1.c,84 :: 		strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
	MOVLW      _trama+0
	MOVWF      FARG_strtok_s1+0
	MOVLW      ?lstr10_serial1+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;serial1.c,85 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	MOVLW      ?lstr11_serial1+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;serial1.c,87 :: 		dato=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
;serial1.c,88 :: 		PWM1_Set_Duty(dato);// aplica la velocidad al pwm
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;serial1.c,91 :: 		}
L_main16:
L_main15:
L_main13:
L_main11:
L_main9:
L_main5:
;serial1.c,96 :: 		}
	GOTO       L_main0
;serial1.c,101 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
