
_main:

;ANALOGO.c,25 :: 		void main()
;ANALOGO.c,28 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ANALOGO.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ANALOGO.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ANALOGO.c,31 :: 		Lcd_Out(5,1,"Voltaje=");
	MOVLW      5
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ANALOGO+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_ANALOGO+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;ANALOGO.c,33 :: 		ADC_Init();     // inica el adc
	CALL       _ADC_Init+0
;ANALOGO.c,35 :: 		ANSELA=0;   // todo digital
	CLRF       ANSELA+0
;ANALOGO.c,36 :: 		ANSELC=0;  //todo digital
	CLRF       ANSELC+0
;ANALOGO.c,38 :: 		ANSA0_bit=1; // entrada analoga
	BSF        ANSA0_bit+0, BitPos(ANSA0_bit+0)
;ANALOGO.c,40 :: 		while(1)
L_main0:
;ANALOGO.c,43 :: 		mayor=0;
	CLRF       _mayor+0
	CLRF       _mayor+1
;ANALOGO.c,44 :: 		mayor1=0;
	CLRF       _mayor1+0
	CLRF       _mayor1+1
;ANALOGO.c,46 :: 		for (cont=0;cont<200;cont++)
	CLRF       _cont+0
L_main2:
	MOVLW      200
	SUBWF      _cont+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;ANALOGO.c,48 :: 		lectura_1=ADC_Get_Sample(0); //realiza primeralectura;
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0, 0
	MOVWF      _lectura_1+0
	MOVF       R1, 0
	MOVWF      _lectura_1+1
;ANALOGO.c,49 :: 		Delay_us(10);
	MOVLW      8
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
;ANALOGO.c,50 :: 		lectura_2=ADC_Get_Sample(0); //realiza segundalectura;
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0, 0
	MOVWF      _lectura_2+0
	MOVF       R1, 0
	MOVWF      _lectura_2+1
;ANALOGO.c,51 :: 		Delay_us(10);
	MOVLW      8
	MOVWF      R13
L_main6:
	DECFSZ     R13, 1
	GOTO       L_main6
;ANALOGO.c,52 :: 		if (lectura_2>lectura_1)  mayor=lectura_1;
	MOVF       _lectura_2+1, 0
	SUBWF      _lectura_1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _lectura_2+0, 0
	SUBWF      _lectura_1+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVF       _lectura_1+0, 0
	MOVWF      _mayor+0
	MOVF       _lectura_1+1, 0
	MOVWF      _mayor+1
	GOTO       L_main8
L_main7:
;ANALOGO.c,53 :: 		else mayor=lectura_2;
	MOVF       _lectura_2+0, 0
	MOVWF      _mayor+0
	MOVF       _lectura_2+1, 0
	MOVWF      _mayor+1
L_main8:
;ANALOGO.c,54 :: 		if (mayor>mayor1) mayor1=mayor;
	MOVF       _mayor+1, 0
	SUBWF      _mayor1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _mayor+0, 0
	SUBWF      _mayor1+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
	MOVF       _mayor+0, 0
	MOVWF      _mayor1+0
	MOVF       _mayor+1, 0
	MOVWF      _mayor1+1
L_main9:
;ANALOGO.c,46 :: 		for (cont=0;cont<200;cont++)
	INCF       _cont+0, 1
;ANALOGO.c,55 :: 		}
	GOTO       L_main2
L_main3:
;ANALOGO.c,57 :: 		voltaje=mayor1*5.0/1023.0;          //calcula el voltaje
	MOVF       _mayor1+0, 0
	MOVWF      R0
	MOVF       _mayor1+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      192
	MOVWF      R5
	MOVLW      127
	MOVWF      R6
	MOVLW      136
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _voltaje+0
	MOVF       R1, 0
	MOVWF      _voltaje+1
	MOVF       R2, 0
	MOVWF      _voltaje+2
	MOVF       R3, 0
	MOVWF      _voltaje+3
;ANALOGO.c,59 :: 		voltaje=voltaje*(res1+res2)/res2;  //aplica el divisor resistivo
	MOVLW      0
	MOVWF      R4
	MOVLW      116
	MOVWF      R5
	MOVLW      36
	MOVWF      R6
	MOVLW      145
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      128
	MOVWF      R5
	MOVLW      84
	MOVWF      R6
	MOVLW      139
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _voltaje+0
	MOVF       R1, 0
	MOVWF      _voltaje+1
	MOVF       R2, 0
	MOVWF      _voltaje+2
	MOVF       R3, 0
	MOVWF      _voltaje+3
;ANALOGO.c,61 :: 		voltaje=voltaje+1.4;              //suma caida en el puente rectificador
	MOVLW      51
	MOVWF      R4
	MOVLW      51
	MOVWF      R5
	MOVLW      51
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _voltaje+0
	MOVF       R1, 0
	MOVWF      _voltaje+1
	MOVF       R2, 0
	MOVWF      _voltaje+2
	MOVF       R3, 0
	MOVWF      _voltaje+3
;ANALOGO.c,62 :: 		voltaje=voltaje /1.4142;         // saca RMS
	MOVLW      129
	MOVWF      R4
	MOVLW      4
	MOVWF      R5
	MOVLW      53
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _voltaje+0
	MOVF       R1, 0
	MOVWF      _voltaje+1
	MOVF       R2, 0
	MOVWF      _voltaje+2
	MOVF       R3, 0
	MOVWF      _voltaje+3
;ANALOGO.c,64 :: 		FloatToStr_FixLen(voltaje,texto,6); // Toma 6 Digitos
	MOVF       R0, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+0
	MOVF       R1, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+1
	MOVF       R2, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+2
	MOVF       R3, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+3
	MOVLW      _texto+0
	MOVWF      FARG_FloatToStr_FixLen_str+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_FloatToStr_FixLen_str+1
	MOVLW      6
	MOVWF      FARG_FloatToStr_FixLen_len+0
	CALL       _FloatToStr_FixLen+0
;ANALOGO.c,65 :: 		Lcd_Out(1,9,texto);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;ANALOGO.c,66 :: 		Delay_ms(100);    ///retardo de refresco
	MOVLW      2
	MOVWF      R11
	MOVLW      69
	MOVWF      R12
	MOVLW      169
	MOVWF      R13
L_main10:
	DECFSZ     R13, 1
	GOTO       L_main10
	DECFSZ     R12, 1
	GOTO       L_main10
	DECFSZ     R11, 1
	GOTO       L_main10
	NOP
	NOP
;ANALOGO.c,73 :: 		}
	GOTO       L_main0
;ANALOGO.c,75 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
