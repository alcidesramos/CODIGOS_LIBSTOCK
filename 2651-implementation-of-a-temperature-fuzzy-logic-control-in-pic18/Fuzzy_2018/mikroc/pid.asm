
_main:

;pid.c,42 :: 		void main()
;pid.c,44 :: 		ADCON1=0b1101;// dos canales analogos    an0  y an1
	MOVLW       13
	MOVWF       ADCON1+0 
;pid.c,45 :: 		TRISB7_bit=0;// salida de  frecuencia de muestreo
	BCF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;pid.c,47 :: 		trisc=0;// salida portc
	CLRF        TRISC+0 
;pid.c,50 :: 		TRISA0_bit=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;pid.c,51 :: 		TRISA1_bit=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;pid.c,53 :: 		LATC2_bit=1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;pid.c,55 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;pid.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pid.c,58 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pid.c,59 :: 		Lcd_Out(1,1,"TEMP=  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_pid+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_pid+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,60 :: 		Lcd_Out(2,1,"SET P= ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_pid+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_pid+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,61 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;pid.c,63 :: 		PWM1_Init(1250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;pid.c,64 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pid.c,65 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;pid.c,69 :: 		while (1)
L_main0:
;pid.c,71 :: 		codigo=ADC_Get_Sample(0);
	CLRF        FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;pid.c,72 :: 		temperatura=codigo*1850.0/1023.0 ;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       103
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;pid.c,73 :: 		WordToStr (temperatura,texto);
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _texto+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;pid.c,74 :: 		Lcd_Out(1,9,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,75 :: 		Delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
;pid.c,76 :: 		codigo=ADC_Get_Sample(1);
	MOVLW       1
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;pid.c,77 :: 		set_point=codigo*1500.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       128
	MOVWF       R5 
	MOVLW       59
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _set_point+0 
	MOVF        R1, 0 
	MOVWF       _set_point+1 
	MOVF        R2, 0 
	MOVWF       _set_point+2 
	MOVF        R3, 0 
	MOVWF       _set_point+3 
;pid.c,78 :: 		WordToStr(set_point,texto);
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _texto+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;pid.c,79 :: 		Lcd_Out(2,9,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,88 :: 		error=set_point-temperatura;
	MOVF        _temperatura+0, 0 
	MOVWF       R4 
	MOVF        _temperatura+1, 0 
	MOVWF       R5 
	MOVF        _temperatura+2, 0 
	MOVWF       R6 
	MOVF        _temperatura+3, 0 
	MOVWF       R7 
	MOVF        _set_point+0, 0 
	MOVWF       R0 
	MOVF        _set_point+1, 0 
	MOVWF       R1 
	MOVF        _set_point+2, 0 
	MOVWF       R2 
	MOVF        _set_point+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _error+0 
	MOVF        R1, 0 
	MOVWF       _error+1 
	MOVF        R2, 0 
	MOVWF       _error+2 
	MOVF        R3, 0 
	MOVWF       _error+3 
;pid.c,89 :: 		controladorInferenceEngine(error,error-error_,&salida);
	MOVF        R0, 0 
	MOVWF       FARG_controladorInferenceEngine_error+0 
	MOVF        R1, 0 
	MOVWF       FARG_controladorInferenceEngine_error+1 
	MOVF        R2, 0 
	MOVWF       FARG_controladorInferenceEngine_error+2 
	MOVF        R3, 0 
	MOVWF       FARG_controladorInferenceEngine_error+3 
	MOVF        _error_+0, 0 
	MOVWF       R4 
	MOVF        _error_+1, 0 
	MOVWF       R5 
	MOVF        _error_+2, 0 
	MOVWF       R6 
	MOVF        _error_+3, 0 
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_controladorInferenceEngine_Cambio_e+0 
	MOVF        R1, 0 
	MOVWF       FARG_controladorInferenceEngine_Cambio_e+1 
	MOVF        R2, 0 
	MOVWF       FARG_controladorInferenceEngine_Cambio_e+2 
	MOVF        R3, 0 
	MOVWF       FARG_controladorInferenceEngine_Cambio_e+3 
	MOVLW       _salida+0
	MOVWF       FARG_controladorInferenceEngine_pwm+0 
	MOVLW       hi_addr(_salida+0)
	MOVWF       FARG_controladorInferenceEngine_pwm+1 
	CALL        _controladorInferenceEngine+0, 0
;pid.c,92 :: 		PWM1_Set_Duty(salida);
	MOVF        _salida+0, 0 
	MOVWF       R0 
	MOVF        _salida+1, 0 
	MOVWF       R1 
	MOVF        _salida+2, 0 
	MOVWF       R2 
	MOVF        _salida+3, 0 
	MOVWF       R3 
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pid.c,93 :: 		error_=error;
	MOVF        _error+0, 0 
	MOVWF       _error_+0 
	MOVF        _error+1, 0 
	MOVWF       _error_+1 
	MOVF        _error+2, 0 
	MOVWF       _error_+2 
	MOVF        _error+3, 0 
	MOVWF       _error_+3 
;pid.c,95 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
;pid.c,97 :: 		LATB7_bit=~LATB7_bit;
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;pid.c,101 :: 		}
	GOTO        L_main0
;pid.c,104 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
