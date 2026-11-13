
_interrupciones:

;buque.c,41 :: 		void interrupciones() iv 0x0008 ics ICS_AUTO
;buque.c,43 :: 		servos_interrupcion();
	CALL        _servos_interrupcion+0, 0
;buque.c,44 :: 		interrupcion_serial();
	CALL        _interrupcion_serial+0, 0
;buque.c,45 :: 		}
L_end_interrupciones:
L__interrupciones4:
	RETFIE      1
; end of _interrupciones

_procesa_rx1:

;buque.c,48 :: 		void procesa_rx1()
;buque.c,51 :: 		strcpy(Captura_rx1, strtok(trama_rx1, "/"));  //inicia captura de tokens desde el /
	MOVLW       _Trama_rx1+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_Trama_rx1+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr1_buque+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr1_buque+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;buque.c,52 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr2_buque+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr2_buque+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;buque.c,53 :: 		serv1=atof(Captura_rx1);
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _serV1+0 
	MOVF        R1, 0 
	MOVWF       _serV1+1 
	MOVF        R2, 0 
	MOVWF       _serV1+2 
	MOVF        R3, 0 
	MOVWF       _serV1+3 
;buque.c,55 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr3_buque+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr3_buque+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;buque.c,56 :: 		serv2=atof(Captura_rx1);
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _serV2+0 
	MOVF        R1, 0 
	MOVWF       _serV2+1 
	MOVF        R2, 0 
	MOVWF       _serV2+2 
	MOVF        R3, 0 
	MOVWF       _serV2+3 
;buque.c,58 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr4_buque+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr4_buque+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;buque.c,59 :: 		led_verde=atoi(Captura_rx1);
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	BTFSC       R0, 0 
	GOTO        L__procesa_rx16
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L__procesa_rx17
L__procesa_rx16:
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
L__procesa_rx17:
;buque.c,61 :: 		strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr5_buque+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr5_buque+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;buque.c,62 :: 		led_rojo=atoi(Captura_rx1);
	MOVLW       _Captura_rx1+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_Captura_rx1+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	BTFSC       R0, 0 
	GOTO        L__procesa_rx18
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L__procesa_rx19
L__procesa_rx18:
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
L__procesa_rx19:
;buque.c,66 :: 		servo_valor(dir,serv1);
	MOVLW       1
	MOVWF       FARG_servo_valor_servo_num+0 
	MOVF        _serV1+0, 0 
	MOVWF       FARG_servo_valor_servo_ang+0 
	MOVF        _serV1+1, 0 
	MOVWF       FARG_servo_valor_servo_ang+1 
	MOVF        _serV1+2, 0 
	MOVWF       FARG_servo_valor_servo_ang+2 
	MOVF        _serV1+3, 0 
	MOVWF       FARG_servo_valor_servo_ang+3 
	CALL        _servo_valor+0, 0
;buque.c,67 :: 		servo_valor(vel,serv2*90.0/100.0);
	MOVLW       2
	MOVWF       FARG_servo_valor_servo_num+0 
	MOVF        _serV2+0, 0 
	MOVWF       R0 
	MOVF        _serV2+1, 0 
	MOVWF       R1 
	MOVF        _serV2+2, 0 
	MOVWF       R2 
	MOVF        _serV2+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_servo_valor_servo_ang+0 
	MOVF        R1, 0 
	MOVWF       FARG_servo_valor_servo_ang+1 
	MOVF        R2, 0 
	MOVWF       FARG_servo_valor_servo_ang+2 
	MOVF        R3, 0 
	MOVWF       FARG_servo_valor_servo_ang+3 
	CALL        _servo_valor+0, 0
;buque.c,69 :: 		}
L_end_procesa_rx1:
	RETURN      0
; end of _procesa_rx1

_main:

;buque.c,72 :: 		void main()
;buque.c,75 :: 		ADCON1=0b1111; // todo digital
	MOVLW       15
	MOVWF       ADCON1+0 
;buque.c,76 :: 		TRISC=0;
	CLRF        TRISC+0 
;buque.c,77 :: 		TRISB=0;
	CLRF        TRISB+0 
;buque.c,78 :: 		TRISC7_bit=1; // ENTRADA RX
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;buque.c,80 :: 		INTCON=0b01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;buque.c,82 :: 		config_serial();
	CALL        _config_serial+0, 0
;buque.c,84 :: 		init_servos(1.0,2.0); // inciia los servos
	MOVLW       0
	MOVWF       FARG_init_servos_pwm_min+0 
	MOVLW       0
	MOVWF       FARG_init_servos_pwm_min+1 
	MOVLW       0
	MOVWF       FARG_init_servos_pwm_min+2 
	MOVLW       127
	MOVWF       FARG_init_servos_pwm_min+3 
	MOVLW       0
	MOVWF       FARG_init_servos_pwm_min+0 
	MOVLW       0
	MOVWF       FARG_init_servos_pwm_min+1 
	MOVLW       0
	MOVWF       FARG_init_servos_pwm_min+2 
	MOVLW       128
	MOVWF       FARG_init_servos_pwm_min+3 
	CALL        _init_servos+0, 0
;buque.c,86 :: 		servo_valor(dir,0);
	MOVLW       1
	MOVWF       FARG_servo_valor_servo_num+0 
	CLRF        FARG_servo_valor_servo_ang+0 
	CLRF        FARG_servo_valor_servo_ang+1 
	CLRF        FARG_servo_valor_servo_ang+2 
	CLRF        FARG_servo_valor_servo_ang+3 
	CALL        _servo_valor+0, 0
;buque.c,87 :: 		servo_valor(vel,0);
	MOVLW       2
	MOVWF       FARG_servo_valor_servo_num+0 
	CLRF        FARG_servo_valor_servo_ang+0 
	CLRF        FARG_servo_valor_servo_ang+1 
	CLRF        FARG_servo_valor_servo_ang+2 
	CLRF        FARG_servo_valor_servo_ang+3 
	CALL        _servo_valor+0, 0
;buque.c,88 :: 		GIE_bit=1; //autoriza iinetrrupciones
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;buque.c,89 :: 		while (1)
L_main0:
;buque.c,92 :: 		if (flag_rx1==1)
	MOVF        _flag_rx1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;buque.c,95 :: 		procesa_rx1();
	CALL        _procesa_rx1+0, 0
;buque.c,96 :: 		flag_rx1=0;
	CLRF        _flag_rx1+0 
;buque.c,97 :: 		memset(Trama_rx1,0,50);// limpia la trama
	MOVLW       _Trama_rx1+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_Trama_rx1+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;buque.c,99 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;buque.c,100 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;buque.c,102 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;buque.c,103 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;buque.c,105 :: 		}
L_main2:
;buque.c,109 :: 		}
	GOTO        L_main0
;buque.c,110 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
