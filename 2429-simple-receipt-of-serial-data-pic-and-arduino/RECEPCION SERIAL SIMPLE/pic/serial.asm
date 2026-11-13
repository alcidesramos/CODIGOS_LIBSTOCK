
_m1derecha:

;serial.c,20 :: 		void m1derecha()
;serial.c,22 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;serial.c,23 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;serial.c,24 :: 		}
L_end_m1derecha:
	RETURN
; end of _m1derecha

_m1izquierda:

;serial.c,26 :: 		void m1izquierda()
;serial.c,28 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;serial.c,29 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;serial.c,31 :: 		}
L_end_m1izquierda:
	RETURN
; end of _m1izquierda

_m1quieto:

;serial.c,33 :: 		void m1quieto()
;serial.c,35 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;serial.c,36 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;serial.c,37 :: 		}
L_end_m1quieto:
	RETURN
; end of _m1quieto

_main:

;serial.c,42 :: 		void main()
;serial.c,45 :: 		uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;serial.c,46 :: 		trisb.b0=0;//salida m11
	BCF        TRISB+0, 0
;serial.c,47 :: 		trisb.b1=0;//salida m12
	BCF        TRISB+0, 1
;serial.c,48 :: 		trisc.b2=0; //salida pin PWM
	BCF        TRISC+0, 2
;serial.c,49 :: 		trisc.B4=0; //salida led2
	BCF        TRISC+0, 4
;serial.c,50 :: 		trisc.b5=0; //salida led 1
	BCF        TRISC+0, 5
;serial.c,53 :: 		pwm1_init(300);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      208
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;serial.c,54 :: 		PWM1_Set_Duty(100);//inia un valor inicial en el pwm
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;serial.c,55 :: 		PWM1_Start();// prende el modulo pwm
	CALL       _PWM1_Start+0
;serial.c,58 :: 		m1quieto();
	CALL       _m1quieto+0
;serial.c,59 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;serial.c,60 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;serial.c,63 :: 		while (1)
L_main0:
;serial.c,66 :: 		UART1_read_Text(trama,"*",30);
	MOVLW      _trama+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr1_serial+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      30
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;serial.c,68 :: 		if (strstr(trama,"led1="))
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr2_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;serial.c,70 :: 		if (strstr(trama,"on")) led1=1;
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr3_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main4
L_main3:
;serial.c,71 :: 		else led1=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
L_main4:
;serial.c,72 :: 		}
L_main2:
;serial.c,75 :: 		if (strstr(trama,"led2="))
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr4_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;serial.c,77 :: 		if (strstr(trama,"on")) led2=1;
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr5_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main7
L_main6:
;serial.c,78 :: 		else led2=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
L_main7:
;serial.c,79 :: 		}
	GOTO       L_main8
L_main5:
;serial.c,81 :: 		else if (strstr(trama,"m1der"))  m1derecha();
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr6_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	CALL       _m1derecha+0
	GOTO       L_main10
L_main9:
;serial.c,82 :: 		else if (strstr(trama,"m1izq"))  m1izquierda();
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr7_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	CALL       _m1izquierda+0
	GOTO       L_main12
L_main11:
;serial.c,83 :: 		else if (strstr(trama,"m1stop"))  m1quieto();
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr8_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	CALL       _m1quieto+0
	GOTO       L_main14
L_main13:
;serial.c,87 :: 		else if (strstr(trama,"m1pwm="))
	MOVLW      _trama+0
	MOVWF      FARG_strstr_s1+0
	MOVLW      ?lstr9_serial+0
	MOVWF      FARG_strstr_s2+0
	CALL       _strstr+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
;serial.c,89 :: 		strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
	MOVLW      _trama+0
	MOVWF      FARG_strtok_s1+0
	MOVLW      ?lstr10_serial+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;serial.c,90 :: 		strcpy(procesa, strtok(0, "/"));  //captura hasta el /
	CLRF       FARG_strtok_s1+0
	MOVLW      ?lstr11_serial+0
	MOVWF      FARG_strtok_s2+0
	CALL       _strtok+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _procesa+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
;serial.c,92 :: 		dato=atoi(procesa);
	MOVLW      _procesa+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
;serial.c,93 :: 		PWM1_Set_Duty(dato);// aplica la velocidad al pwm
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;serial.c,96 :: 		}
L_main15:
L_main14:
L_main12:
L_main10:
L_main8:
;serial.c,99 :: 		}
	GOTO       L_main0
;serial.c,107 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
