
_main:

;dac18f.c,4 :: 		void main()
;dac18f.c,6 :: 		ADCON1=0; // todo analogo;
	CLRF        ADCON1+0 
;dac18f.c,7 :: 		TRISA=0b1111111; // todo entrada
	MOVLW       127
	MOVWF       TRISA+0 
;dac18f.c,8 :: 		trisc=0; // todo salida
	CLRF        TRISC+0 
;dac18f.c,9 :: 		PWM1_Init(100000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       19
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;dac18f.c,10 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;dac18f.c,12 :: 		while(1)
L_main0:
;dac18f.c,14 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;dac18f.c,15 :: 		DAC=codigo/4.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _DAC+0 
	MOVF        R1, 0 
	MOVWF       _DAC+1 
	MOVF        R2, 0 
	MOVWF       _DAC+2 
	MOVF        R3, 0 
	MOVWF       _DAC+3 
;dac18f.c,16 :: 		PWM1_Set_Duty(DAC);
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;dac18f.c,20 :: 		}
	GOTO        L_main0
;dac18f.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
