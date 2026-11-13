
_pid:

;pid.c,35 :: 		void pid(float pid_in)
;pid.c,43 :: 		error=set_point-pid_in;
	MOVF        FARG_pid_pid_in+0, 0 
	MOVWF       R4 
	MOVF        FARG_pid_pid_in+1, 0 
	MOVWF       R5 
	MOVF        FARG_pid_pid_in+2, 0 
	MOVWF       R6 
	MOVF        FARG_pid_pid_in+3, 0 
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
	MOVWF       FLOC__pid+0 
	MOVF        R1, 0 
	MOVWF       FLOC__pid+1 
	MOVF        R2, 0 
	MOVWF       FLOC__pid+2 
	MOVF        R3, 0 
	MOVWF       FLOC__pid+3 
	MOVF        FLOC__pid+0, 0 
	MOVWF       _error+0 
	MOVF        FLOC__pid+1, 0 
	MOVWF       _error+1 
	MOVF        FLOC__pid+2, 0 
	MOVWF       _error+2 
	MOVF        FLOC__pid+3, 0 
	MOVWF       _error+3 
;pid.c,44 :: 		up=kp*error;
	MOVF        _kp+0, 0 
	MOVWF       R0 
	MOVF        _kp+1, 0 
	MOVWF       R1 
	MOVF        _kp+2, 0 
	MOVWF       R2 
	MOVF        _kp+3, 0 
	MOVWF       R3 
	MOVF        FLOC__pid+0, 0 
	MOVWF       R4 
	MOVF        FLOC__pid+1, 0 
	MOVWF       R5 
	MOVF        FLOC__pid+2, 0 
	MOVWF       R6 
	MOVF        FLOC__pid+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__pid+8 
	MOVF        R1, 0 
	MOVWF       FLOC__pid+9 
	MOVF        R2, 0 
	MOVWF       FLOC__pid+10 
	MOVF        R3, 0 
	MOVWF       FLOC__pid+11 
	MOVF        FLOC__pid+8, 0 
	MOVWF       _up+0 
	MOVF        FLOC__pid+9, 0 
	MOVWF       _up+1 
	MOVF        FLOC__pid+10, 0 
	MOVWF       _up+2 
	MOVF        FLOC__pid+11, 0 
	MOVWF       _up+3 
;pid.c,45 :: 		ui=ui_ + (ki*t_muestreo*error);
	MOVF        _ki+0, 0 
	MOVWF       R0 
	MOVF        _ki+1, 0 
	MOVWF       R1 
	MOVF        _ki+2, 0 
	MOVWF       R2 
	MOVF        _ki+3, 0 
	MOVWF       R3 
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__pid+0, 0 
	MOVWF       R4 
	MOVF        FLOC__pid+1, 0 
	MOVWF       R5 
	MOVF        FLOC__pid+2, 0 
	MOVWF       R6 
	MOVF        FLOC__pid+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _ui_+0, 0 
	MOVWF       R4 
	MOVF        _ui_+1, 0 
	MOVWF       R5 
	MOVF        _ui_+2, 0 
	MOVWF       R6 
	MOVF        _ui_+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__pid+4 
	MOVF        R1, 0 
	MOVWF       FLOC__pid+5 
	MOVF        R2, 0 
	MOVWF       FLOC__pid+6 
	MOVF        R3, 0 
	MOVWF       FLOC__pid+7 
	MOVF        FLOC__pid+4, 0 
	MOVWF       _ui+0 
	MOVF        FLOC__pid+5, 0 
	MOVWF       _ui+1 
	MOVF        FLOC__pid+6, 0 
	MOVWF       _ui+2 
	MOVF        FLOC__pid+7, 0 
	MOVWF       _ui+3 
;pid.c,46 :: 		ud=kd*(error-error_)/t_muestreo;
	MOVF        _error_+0, 0 
	MOVWF       R4 
	MOVF        _error_+1, 0 
	MOVWF       R5 
	MOVF        _error_+2, 0 
	MOVWF       R6 
	MOVF        _error_+3, 0 
	MOVWF       R7 
	MOVF        FLOC__pid+0, 0 
	MOVWF       R0 
	MOVF        FLOC__pid+1, 0 
	MOVWF       R1 
	MOVF        FLOC__pid+2, 0 
	MOVWF       R2 
	MOVF        FLOC__pid+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        _kd+0, 0 
	MOVWF       R4 
	MOVF        _kd+1, 0 
	MOVWF       R5 
	MOVF        _kd+2, 0 
	MOVWF       R6 
	MOVF        _kd+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__pid+0 
	MOVF        R1, 0 
	MOVWF       FLOC__pid+1 
	MOVF        R2, 0 
	MOVWF       FLOC__pid+2 
	MOVF        R3, 0 
	MOVWF       FLOC__pid+3 
	MOVF        FLOC__pid+0, 0 
	MOVWF       _ud+0 
	MOVF        FLOC__pid+1, 0 
	MOVWF       _ud+1 
	MOVF        FLOC__pid+2, 0 
	MOVWF       _ud+2 
	MOVF        FLOC__pid+3, 0 
	MOVWF       _ud+3 
;pid.c,47 :: 		ut=up+ui+ud;
	MOVF        FLOC__pid+8, 0 
	MOVWF       R0 
	MOVF        FLOC__pid+9, 0 
	MOVWF       R1 
	MOVF        FLOC__pid+10, 0 
	MOVWF       R2 
	MOVF        FLOC__pid+11, 0 
	MOVWF       R3 
	MOVF        FLOC__pid+4, 0 
	MOVWF       R4 
	MOVF        FLOC__pid+5, 0 
	MOVWF       R5 
	MOVF        FLOC__pid+6, 0 
	MOVWF       R6 
	MOVF        FLOC__pid+7, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        FLOC__pid+0, 0 
	MOVWF       R4 
	MOVF        FLOC__pid+1, 0 
	MOVWF       R5 
	MOVF        FLOC__pid+2, 0 
	MOVWF       R6 
	MOVF        FLOC__pid+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ut+0 
	MOVF        R1, 0 
	MOVWF       _ut+1 
	MOVF        R2, 0 
	MOVWF       _ut+2 
	MOVF        R3, 0 
	MOVWF       _ut+3 
;pid.c,48 :: 		if (ut>max_x) ut=max_x;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pid0
	MOVLW       0
	MOVWF       _ut+0 
	MOVLW       0
	MOVWF       _ut+1 
	MOVLW       127
	MOVWF       _ut+2 
	MOVLW       134
	MOVWF       _ut+3 
L_pid0:
;pid.c,49 :: 		if (ut<min_x) ut=min_x;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _ut+0, 0 
	MOVWF       R0 
	MOVF        _ut+1, 0 
	MOVWF       R1 
	MOVF        _ut+2, 0 
	MOVWF       R2 
	MOVF        _ut+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pid1
	CLRF        _ut+0 
	CLRF        _ut+1 
	CLRF        _ut+2 
	CLRF        _ut+3 
L_pid1:
;pid.c,51 :: 		ui_=ui;
	MOVF        _ui+0, 0 
	MOVWF       _ui_+0 
	MOVF        _ui+1, 0 
	MOVWF       _ui_+1 
	MOVF        _ui+2, 0 
	MOVWF       _ui_+2 
	MOVF        _ui+3, 0 
	MOVWF       _ui_+3 
;pid.c,52 :: 		error_=error;
	MOVF        _error+0, 0 
	MOVWF       _error_+0 
	MOVF        _error+1, 0 
	MOVWF       _error_+1 
	MOVF        _error+2, 0 
	MOVWF       _error_+2 
	MOVF        _error+3, 0 
	MOVWF       _error_+3 
;pid.c,54 :: 		}
L_end_pid:
	RETURN      0
; end of _pid

_interrupt:

;pid.c,58 :: 		void interrupt()
;pid.c,60 :: 		USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;pid.c,61 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_main:

;pid.c,64 :: 		void main()
;pid.c,66 :: 		ADCON1=0b1101;// dos canales analogos    an0  y an1
	MOVLW       13
	MOVWF       ADCON1+0 
;pid.c,67 :: 		TRISB7_bit=0;// salida de  frecuencia de muestreo
	BCF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;pid.c,69 :: 		trisc=0;// salida portc
	CLRF        TRISC+0 
;pid.c,72 :: 		TRISA0_bit=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;pid.c,73 :: 		TRISA1_bit=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;pid.c,75 :: 		LATC2_bit=1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;pid.c,77 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;pid.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pid.c,80 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pid.c,81 :: 		Lcd_Out(1,1,"TEMP=  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_pid+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_pid+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,82 :: 		Lcd_Out(2,1,"SET P= ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_pid+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_pid+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,83 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;pid.c,85 :: 		PWM1_Init(1250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;pid.c,86 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pid.c,87 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;pid.c,89 :: 		HID_Enable(&readbuff,&writebuff);       // Enable
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;pid.c,91 :: 		while (1)
L_main2:
;pid.c,93 :: 		codigo=ADC_Get_Sample(0);
	CLRF        FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;pid.c,94 :: 		temperatura=codigo*1850.0/1023.0 ;
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
;pid.c,95 :: 		WordToStr (temperatura,texto);
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
;pid.c,96 :: 		Lcd_Out(1,9,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,97 :: 		Delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
;pid.c,98 :: 		codigo=ADC_Get_Sample(1);
	MOVLW       1
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;pid.c,99 :: 		set_point=codigo*1500.0/1023.0;
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
;pid.c,100 :: 		WordToStr(set_point,texto);
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
;pid.c,101 :: 		Lcd_Out(2,9,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pid.c,109 :: 		pid(temperatura);
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_pid_pid_in+0 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_pid_pid_in+1 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_pid_pid_in+2 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_pid_pid_in+3 
	CALL        _pid+0, 0
;pid.c,110 :: 		PWM1_Set_Duty(ut);
	MOVF        _ut+0, 0 
	MOVWF       R0 
	MOVF        _ut+1, 0 
	MOVWF       R1 
	MOVF        _ut+2, 0 
	MOVWF       R2 
	MOVF        _ut+3, 0 
	MOVWF       R3 
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pid.c,111 :: 		Delay_ms(86);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       109
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;pid.c,113 :: 		LATB7_bit=~LATB7_bit;
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;pid.c,117 :: 		}
	GOTO        L_main2
;pid.c,120 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
