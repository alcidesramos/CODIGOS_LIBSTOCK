
_pid:

;ENCODER.c,31 :: 		void pid(float pid_in)
;ENCODER.c,38 :: 		error=setpoint-pid_in;
	MOVF       FARG_pid_pid_in+0, 0
	MOVWF      R4+0
	MOVF       FARG_pid_pid_in+1, 0
	MOVWF      R4+1
	MOVF       FARG_pid_pid_in+2, 0
	MOVWF      R4+2
	MOVF       FARG_pid_pid_in+3, 0
	MOVWF      R4+3
	MOVF       _setpoint+0, 0
	MOVWF      R0+0
	MOVF       _setpoint+1, 0
	MOVWF      R0+1
	MOVF       _setpoint+2, 0
	MOVWF      R0+2
	MOVF       _setpoint+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _error+0
	MOVF       R0+1, 0
	MOVWF      _error+1
	MOVF       R0+2, 0
	MOVWF      _error+2
	MOVF       R0+3, 0
	MOVWF      _error+3
;ENCODER.c,39 :: 		up=kp*error;
	MOVF       _kp+0, 0
	MOVWF      R4+0
	MOVF       _kp+1, 0
	MOVWF      R4+1
	MOVF       _kp+2, 0
	MOVWF      R4+2
	MOVF       _kp+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _up+0
	MOVF       R0+1, 0
	MOVWF      _up+1
	MOVF       R0+2, 0
	MOVWF      _up+2
	MOVF       R0+3, 0
	MOVWF      _up+3
;ENCODER.c,40 :: 		if (ti!=0) ki=(kp/ti);
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _ti+0, 0
	MOVWF      R0+0
	MOVF       _ti+1, 0
	MOVWF      R0+1
	MOVF       _ti+2, 0
	MOVWF      R0+2
	MOVF       _ti+3, 0
	MOVWF      R0+3
	CALL       _Equals_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_pid0
	MOVF       _ti+0, 0
	MOVWF      R4+0
	MOVF       _ti+1, 0
	MOVWF      R4+1
	MOVF       _ti+2, 0
	MOVWF      R4+2
	MOVF       _ti+3, 0
	MOVWF      R4+3
	MOVF       _kp+0, 0
	MOVWF      R0+0
	MOVF       _kp+1, 0
	MOVWF      R0+1
	MOVF       _kp+2, 0
	MOVWF      R0+2
	MOVF       _kp+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _ki+0
	MOVF       R0+1, 0
	MOVWF      _ki+1
	MOVF       R0+2, 0
	MOVWF      _ki+2
	MOVF       R0+3, 0
	MOVWF      _ki+3
	GOTO       L_pid1
L_pid0:
;ENCODER.c,41 :: 		else ki=0;
	CLRF       _ki+0
	CLRF       _ki+1
	CLRF       _ki+2
	CLRF       _ki+3
L_pid1:
;ENCODER.c,42 :: 		ui=ui_ + (ki*t_muestreo*error);
	MOVF       _ki+0, 0
	MOVWF      R0+0
	MOVF       _ki+1, 0
	MOVWF      R0+1
	MOVF       _ki+2, 0
	MOVWF      R0+2
	MOVF       _ki+3, 0
	MOVWF      R0+3
	MOVF       _error+0, 0
	MOVWF      R4+0
	MOVF       _error+1, 0
	MOVWF      R4+1
	MOVF       _error+2, 0
	MOVWF      R4+2
	MOVF       _error+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       _ui_+0, 0
	MOVWF      R4+0
	MOVF       _ui_+1, 0
	MOVWF      R4+1
	MOVF       _ui_+2, 0
	MOVWF      R4+2
	MOVF       _ui_+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__pid+4
	MOVF       R0+1, 0
	MOVWF      FLOC__pid+5
	MOVF       R0+2, 0
	MOVWF      FLOC__pid+6
	MOVF       R0+3, 0
	MOVWF      FLOC__pid+7
	MOVF       FLOC__pid+4, 0
	MOVWF      _ui+0
	MOVF       FLOC__pid+5, 0
	MOVWF      _ui+1
	MOVF       FLOC__pid+6, 0
	MOVWF      _ui+2
	MOVF       FLOC__pid+7, 0
	MOVWF      _ui+3
;ENCODER.c,44 :: 		kd=kp*td;
	MOVF       _kp+0, 0
	MOVWF      R0+0
	MOVF       _kp+1, 0
	MOVWF      R0+1
	MOVF       _kp+2, 0
	MOVWF      R0+2
	MOVF       _kp+3, 0
	MOVWF      R0+3
	MOVF       _td+0, 0
	MOVWF      R4+0
	MOVF       _td+1, 0
	MOVWF      R4+1
	MOVF       _td+2, 0
	MOVWF      R4+2
	MOVF       _td+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__pid+0
	MOVF       R0+1, 0
	MOVWF      FLOC__pid+1
	MOVF       R0+2, 0
	MOVWF      FLOC__pid+2
	MOVF       R0+3, 0
	MOVWF      FLOC__pid+3
	MOVF       FLOC__pid+0, 0
	MOVWF      _kd+0
	MOVF       FLOC__pid+1, 0
	MOVWF      _kd+1
	MOVF       FLOC__pid+2, 0
	MOVWF      _kd+2
	MOVF       FLOC__pid+3, 0
	MOVWF      _kd+3
;ENCODER.c,45 :: 		d_error=error-error_;
	MOVF       _error_+0, 0
	MOVWF      R4+0
	MOVF       _error_+1, 0
	MOVWF      R4+1
	MOVF       _error_+2, 0
	MOVWF      R4+2
	MOVF       _error_+3, 0
	MOVWF      R4+3
	MOVF       _error+0, 0
	MOVWF      R0+0
	MOVF       _error+1, 0
	MOVWF      R0+1
	MOVF       _error+2, 0
	MOVWF      R0+2
	MOVF       _error+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _d_error+0
	MOVF       R0+1, 0
	MOVWF      _d_error+1
	MOVF       R0+2, 0
	MOVWF      _d_error+2
	MOVF       R0+3, 0
	MOVWF      _d_error+3
;ENCODER.c,46 :: 		ud=kd*(d_error)/t_muestreo;
	MOVF       FLOC__pid+0, 0
	MOVWF      R4+0
	MOVF       FLOC__pid+1, 0
	MOVWF      R4+1
	MOVF       FLOC__pid+2, 0
	MOVWF      R4+2
	MOVF       FLOC__pid+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__pid+0
	MOVF       R0+1, 0
	MOVWF      FLOC__pid+1
	MOVF       R0+2, 0
	MOVWF      FLOC__pid+2
	MOVF       R0+3, 0
	MOVWF      FLOC__pid+3
	MOVF       FLOC__pid+0, 0
	MOVWF      _ud+0
	MOVF       FLOC__pid+1, 0
	MOVWF      _ud+1
	MOVF       FLOC__pid+2, 0
	MOVWF      _ud+2
	MOVF       FLOC__pid+3, 0
	MOVWF      _ud+3
;ENCODER.c,48 :: 		ut=up+ui+ud;
	MOVF       _up+0, 0
	MOVWF      R0+0
	MOVF       _up+1, 0
	MOVWF      R0+1
	MOVF       _up+2, 0
	MOVWF      R0+2
	MOVF       _up+3, 0
	MOVWF      R0+3
	MOVF       FLOC__pid+4, 0
	MOVWF      R4+0
	MOVF       FLOC__pid+5, 0
	MOVWF      R4+1
	MOVF       FLOC__pid+6, 0
	MOVWF      R4+2
	MOVF       FLOC__pid+7, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       FLOC__pid+0, 0
	MOVWF      R4+0
	MOVF       FLOC__pid+1, 0
	MOVWF      R4+1
	MOVF       FLOC__pid+2, 0
	MOVWF      R4+2
	MOVF       FLOC__pid+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _ut+0
	MOVF       R0+1, 0
	MOVWF      _ut+1
	MOVF       R0+2, 0
	MOVWF      _ut+2
	MOVF       R0+3, 0
	MOVWF      _ut+3
;ENCODER.c,50 :: 		if (ut>max_x) ut=max_x;
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      127
	MOVWF      R0+2
	MOVLW      134
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_pid2
	MOVLW      0
	MOVWF      _ut+0
	MOVLW      0
	MOVWF      _ut+1
	MOVLW      127
	MOVWF      _ut+2
	MOVLW      134
	MOVWF      _ut+3
L_pid2:
;ENCODER.c,51 :: 		if (ut<min_x) ut=min_x;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      255
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	MOVF       _ut+0, 0
	MOVWF      R0+0
	MOVF       _ut+1, 0
	MOVWF      R0+1
	MOVF       _ut+2, 0
	MOVWF      R0+2
	MOVF       _ut+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_pid3
	MOVLW      0
	MOVWF      _ut+0
	MOVLW      0
	MOVWF      _ut+1
	MOVLW      255
	MOVWF      _ut+2
	MOVLW      134
	MOVWF      _ut+3
L_pid3:
;ENCODER.c,53 :: 		ui_=ui;
	MOVF       _ui+0, 0
	MOVWF      _ui_+0
	MOVF       _ui+1, 0
	MOVWF      _ui_+1
	MOVF       _ui+2, 0
	MOVWF      _ui_+2
	MOVF       _ui+3, 0
	MOVWF      _ui_+3
;ENCODER.c,54 :: 		error_=error;
	MOVF       _error+0, 0
	MOVWF      _error_+0
	MOVF       _error+1, 0
	MOVWF      _error_+1
	MOVF       _error+2, 0
	MOVWF      _error_+2
	MOVF       _error+3, 0
	MOVWF      _error_+3
;ENCODER.c,56 :: 		}
L_end_pid:
	RETURN
; end of _pid

_Interrpciones:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ENCODER.c,64 :: 		void Interrpciones() iv 0x0004 ics ICS_AUTO
;ENCODER.c,66 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_Interrpciones4
;ENCODER.c,68 :: 		if (PORTB.RB1==PORTB.RB0) pulsos++; else pulsos--;
	BTFSC      PORTB+0, 1
	GOTO       L__Interrpciones17
	BTFSS      PORTB+0, 0
	GOTO       L__Interrpciones18
	GOTO       L_Interrpciones5
L__Interrpciones17:
	BTFSS      PORTB+0, 0
	GOTO       L_Interrpciones5
L__Interrpciones18:
	INCF       _pulsos+0, 1
	BTFSC      STATUS+0, 2
	INCF       _pulsos+1, 1
	GOTO       L_Interrpciones6
L_Interrpciones5:
	MOVLW      1
	SUBWF      _pulsos+0, 1
	BTFSS      STATUS+0, 0
	DECF       _pulsos+1, 1
L_Interrpciones6:
;ENCODER.c,69 :: 		if (pulsos>50) PULSOS=50;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _pulsos+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrpciones19
	MOVF       _pulsos+0, 0
	SUBLW      50
L__Interrpciones19:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrpciones7
	MOVLW      50
	MOVWF      _pulsos+0
	MOVLW      0
	MOVWF      _pulsos+1
	GOTO       L_Interrpciones8
L_Interrpciones7:
;ENCODER.c,70 :: 		else if  (pulsos<-50) PULSOS=-50;
	MOVLW      128
	XORWF      _pulsos+1, 0
	MOVWF      R0+0
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrpciones20
	MOVLW      206
	SUBWF      _pulsos+0, 0
L__Interrpciones20:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrpciones9
	MOVLW      206
	MOVWF      _pulsos+0
	MOVLW      255
	MOVWF      _pulsos+1
L_Interrpciones9:
L_Interrpciones8:
;ENCODER.c,71 :: 		INTEDG_bit=~INTEDG_bit; //cambia el flanco a detectar modo 2x
	MOVLW
	XORWF      INTEDG_bit+0, 1
;ENCODER.c,72 :: 		INTF_bit=0; //limpia bandera de interrupcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;ENCODER.c,73 :: 		}
L_Interrpciones4:
;ENCODER.c,75 :: 		}
L_end_Interrpciones:
L__Interrpciones16:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrpciones

_main:

;ENCODER.c,77 :: 		void main()
;ENCODER.c,79 :: 		TRISB=255;  //TODO ENTRADAS
	MOVLW      255
	MOVWF      TRISB+0
;ENCODER.c,80 :: 		TRISC=0;    //TODOS SALIDAS
	CLRF       TRISC+0
;ENCODER.c,81 :: 		trisa=255; //todo entradas
	MOVLW      255
	MOVWF      TRISA+0
;ENCODER.c,83 :: 		trisb.b3=0;   //salida control de giro
	BCF        TRISB+0, 3
;ENCODER.c,84 :: 		trisb.b4=0;  //Salida Contro de giro
	BCF        TRISB+0, 4
;ENCODER.c,87 :: 		adcon0.b0=0;
	BCF        ADCON0+0, 0
;ENCODER.c,88 :: 		adcon1=0;
	CLRF       ADCON1+0
;ENCODER.c,89 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;ENCODER.c,91 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ENCODER.c,92 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ENCODER.c,93 :: 		Lcd_Out(1,1,"    CONTROL ARZ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ENCODER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,94 :: 		Lcd_Out(2,1,"SET_POINT=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ENCODER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,95 :: 		Lcd_Out(4,1,"PULSOS=");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_ENCODER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,97 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ENCODER.c,98 :: 		PWM1_Init(400);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      156
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;ENCODER.c,99 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ENCODER.c,100 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;ENCODER.c,105 :: 		INTCON=0B01000000;
	MOVLW      64
	MOVWF      INTCON+0
;ENCODER.c,107 :: 		INTF_bit=0; //limpia la bansera e interrupcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;ENCODER.c,108 :: 		INTEDG_bit=0; //por flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;ENCODER.c,109 :: 		INTE_bit=1; //habilita interrpcion por flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;ENCODER.c,110 :: 		GIE_bit=1; //Autoriza interrupciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;ENCODER.c,116 :: 		while (1)
L_main10:
;ENCODER.c,118 :: 		codigo=ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;ENCODER.c,121 :: 		setpoint=  0.0978*codigo-50.0;
	CALL       _word2double+0
	MOVLW      94
	MOVWF      R4+0
	MOVLW      75
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _setpoint+0
	MOVF       R0+1, 0
	MOVWF      _setpoint+1
	MOVF       R0+2, 0
	MOVWF      _setpoint+2
	MOVF       R0+3, 0
	MOVWF      _setpoint+3
;ENCODER.c,123 :: 		pid(pulsos);
	MOVF       _pulsos+0, 0
	MOVWF      R0+0
	MOVF       _pulsos+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_pid_pid_in+0
	MOVF       R0+1, 0
	MOVWF      FARG_pid_pid_in+1
	MOVF       R0+2, 0
	MOVWF      FARG_pid_pid_in+2
	MOVF       R0+3, 0
	MOVWF      FARG_pid_pid_in+3
	CALL       _pid+0
;ENCODER.c,125 :: 		if (ut<0)    //gira a la derecha     analiza la salida para determinar giro
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _ut+0, 0
	MOVWF      R0+0
	MOVF       _ut+1, 0
	MOVWF      R0+1
	MOVF       _ut+2, 0
	MOVWF      R0+2
	MOVF       _ut+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;ENCODER.c,127 :: 		ut=-ut;   // el valor del pwm en cada sentido debe ser solo positivo
	MOVLW      0
	XORWF      _ut+0, 1
	MOVLW      0
	XORWF      _ut+1, 1
	MOVLW      128
	XORWF      _ut+2, 1
	MOVLW      0
	XORWF      _ut+3, 1
;ENCODER.c,128 :: 		m11=1;
	BSF        PORTB+0, 3
;ENCODER.c,129 :: 		m12=0;
	BCF        PORTB+0, 4
;ENCODER.c,130 :: 		}
	GOTO       L_main13
L_main12:
;ENCODER.c,133 :: 		m11=0;
	BCF        PORTB+0, 3
;ENCODER.c,134 :: 		m12=1;
	BSF        PORTB+0, 4
;ENCODER.c,136 :: 		}
L_main13:
;ENCODER.c,140 :: 		PWM1_Set_Duty(ut); //salida pid   po PWM
	MOVF       _ut+0, 0
	MOVWF      R0+0
	MOVF       _ut+1, 0
	MOVWF      R0+1
	MOVF       _ut+2, 0
	MOVWF      R0+2
	MOVF       _ut+3, 0
	MOVWF      R0+3
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ENCODER.c,142 :: 		inttostr(setpoint,texto);
	MOVF       _setpoint+0, 0
	MOVWF      R0+0
	MOVF       _setpoint+1, 0
	MOVWF      R0+1
	MOVF       _setpoint+2, 0
	MOVWF      R0+2
	MOVF       _setpoint+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ENCODER.c,144 :: 		lcd_Out(2,11,"       ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_ENCODER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,145 :: 		Lcd_Out(2,11,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,147 :: 		inttostr(pulsos,texto);
	MOVF       _pulsos+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _pulsos+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ENCODER.c,148 :: 		lcd_Out(4,8,"      ");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_ENCODER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,149 :: 		lcd_Out(4,8,texto);
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,154 :: 		}
	GOTO       L_main10
;ENCODER.c,158 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
