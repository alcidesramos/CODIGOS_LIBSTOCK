
_interrupt:

;HID_READ.c,17 :: 		void interrupt(){
;HID_READ.c,18 :: 		USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;HID_READ.c,19 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;HID_READ.c,24 :: 		void main()
;HID_READ.c,26 :: 		ADCON1=0b1111; // todo digital
	MOVLW       15
	MOVWF       ADCON1+0 
;HID_READ.c,28 :: 		TRISB0_bit=0;
	BCF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;HID_READ.c,29 :: 		TRISB1_bit=0;
	BCF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;HID_READ.c,32 :: 		TRISC1_bit=0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;HID_READ.c,33 :: 		TRISC2_bit=0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;HID_READ.c,36 :: 		PWM1_Init(500);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;HID_READ.c,37 :: 		PWM2_Init(500);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;HID_READ.c,38 :: 		PWM1_Set_Duty(100);
	MOVLW       100
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;HID_READ.c,39 :: 		PWM2_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;HID_READ.c,41 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;HID_READ.c,42 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;HID_READ.c,46 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;HID_READ.c,50 :: 		while (1)
L_main0:
;HID_READ.c,52 :: 		while(!HID_Read());
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;HID_READ.c,54 :: 		if (strstr(&readbuff,"dat="))
	MOVLW       _readbuff+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1_HID_READ+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1_HID_READ+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;HID_READ.c,57 :: 		strcpy(tramita, strtok(&readbuff, "="));  //inicia captura de tokens
	MOVLW       _readbuff+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr2_HID_READ+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr2_HID_READ+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _tramita+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;HID_READ.c,59 :: 		strcpy(tramita, strtok(0, "/"));  //  primer dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr3_HID_READ+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr3_HID_READ+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _tramita+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;HID_READ.c,60 :: 		pwm1= atoi(tramita) ;
	MOVLW       _tramita+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _pwm1+0 
	MOVF        R1, 0 
	MOVWF       _pwm1+1 
;HID_READ.c,61 :: 		PWM1_Set_Duty(pwm1*255/100);
	MOVLW       255
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;HID_READ.c,63 :: 		strcpy(tramita, strtok(0, "/"));  //  2 dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr4_HID_READ+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr4_HID_READ+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _tramita+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;HID_READ.c,64 :: 		pwm2= atof(tramita) ;
	MOVLW       _tramita+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _pwm2+0 
	MOVF        R1, 0 
	MOVWF       _pwm2+1 
	MOVF        R2, 0 
	MOVWF       _pwm2+2 
	MOVF        R3, 0 
	MOVWF       _pwm2+3 
;HID_READ.c,65 :: 		PWM2_Set_Duty(pwm2*255/100);
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       134
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
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;HID_READ.c,67 :: 		strcpy(tramita, strtok(0, "/"));  //  3  dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr5_HID_READ+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr5_HID_READ+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _tramita+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;HID_READ.c,68 :: 		led= atoi(tramita) ;
	MOVLW       _tramita+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _led+0 
;HID_READ.c,70 :: 		if (led==1) led1=1; else led1=0;
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
	GOTO        L_main6
L_main5:
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
L_main6:
;HID_READ.c,72 :: 		strcpy(tramita, strtok(0, "/"));  //  4  dato
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr6_HID_READ+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr6_HID_READ+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _tramita+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;HID_READ.c,73 :: 		led= atoi(tramita) ;
	MOVLW       _tramita+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_tramita+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _led+0 
;HID_READ.c,75 :: 		if (led==1) led2=1; else led2=0;
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
	GOTO        L_main8
L_main7:
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
L_main8:
;HID_READ.c,80 :: 		}
L_main4:
;HID_READ.c,89 :: 		}
	GOTO        L_main0
;HID_READ.c,94 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
