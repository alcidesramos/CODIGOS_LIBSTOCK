
_main:

;ANALOGO.c,30 :: 		void main()
;ANALOGO.c,33 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ANALOGO.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ANALOGO.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ANALOGO.c,36 :: 		Lcd_Out(5,1,"Voltaje=");
	MOVLW      5
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      86
	MOVWF      ?lstr1_ANALOGO+0
	MOVLW      111
	MOVWF      ?lstr1_ANALOGO+1
	MOVLW      108
	MOVWF      ?lstr1_ANALOGO+2
	MOVLW      116
	MOVWF      ?lstr1_ANALOGO+3
	MOVLW      97
	MOVWF      ?lstr1_ANALOGO+4
	MOVLW      106
	MOVWF      ?lstr1_ANALOGO+5
	MOVLW      101
	MOVWF      ?lstr1_ANALOGO+6
	MOVLW      61
	MOVWF      ?lstr1_ANALOGO+7
	CLRF       ?lstr1_ANALOGO+8
	MOVLW      ?lstr1_ANALOGO+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_ANALOGO+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;ANALOGO.c,38 :: 		ADC_Init();     // inica el adc
	CALL       _ADC_Init+0
;ANALOGO.c,40 :: 		ANSELA=0;   // todo digital
	CLRF       ANSELA+0
;ANALOGO.c,41 :: 		ANSELC=0;  //todo digital
	CLRF       ANSELC+0
;ANALOGO.c,43 :: 		ANSA0_bit=1; // entrada analoga
	BSF        ANSA0_bit+0, BitPos(ANSA0_bit+0)
;ANALOGO.c,45 :: 		while(1)
L_main0:
;ANALOGO.c,48 :: 		mayor=0;
	CLRF       _mayor+0
	CLRF       _mayor+1
;ANALOGO.c,49 :: 		mayor1=0;
	CLRF       _mayor1+0
	CLRF       _mayor1+1
;ANALOGO.c,51 :: 		lectura=ADC_Get_Sample(0); //realiza primeralectura;
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0, 0
	MOVWF      _lectura+0
	MOVF       R1, 0
	MOVWF      _lectura+1
;ANALOGO.c,52 :: 		Delay_us(10);
	MOVLW      8
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
;ANALOGO.c,53 :: 		voltaje=lectura*5.0/1023.0;          //calcula el voltaje
	MOVF       _lectura+0, 0
	MOVWF      R0
	MOVF       _lectura+1, 0
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
;ANALOGO.c,54 :: 		suma+=voltaje*voltaje;
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       _suma+0, 0
	MOVWF      R4
	MOVF       _suma+1, 0
	MOVWF      R5
	MOVF       _suma+2, 0
	MOVWF      R6
	MOVF       _suma+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _suma+0
	MOVF       R1, 0
	MOVWF      _suma+1
	MOVF       R2, 0
	MOVWF      _suma+2
	MOVF       R3, 0
	MOVWF      _suma+3
;ANALOGO.c,55 :: 		muestras++;
	INCF       _muestras+0, 1
	BTFSC      STATUS+0, 2
	INCF       _muestras+1, 1
;ANALOGO.c,56 :: 		if (muestras==1500)
	MOVF       _muestras+1, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      220
	XORWF      _muestras+0, 0
L__main6:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;ANALOGO.c,58 :: 		voltaje=sqrt(suma/(float)muestras);
	MOVF       _muestras+0, 0
	MOVWF      R0
	MOVF       _muestras+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       _suma+0, 0
	MOVWF      R0
	MOVF       _suma+1, 0
	MOVWF      R1
	MOVF       _suma+2, 0
	MOVWF      R2
	MOVF       _suma+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_sqrt_x+0
	MOVF       R1, 0
	MOVWF      FARG_sqrt_x+1
	MOVF       R2, 0
	MOVWF      FARG_sqrt_x+2
	MOVF       R3, 0
	MOVWF      FARG_sqrt_x+3
	CALL       _sqrt+0
	MOVF       R0, 0
	MOVWF      _voltaje+0
	MOVF       R1, 0
	MOVWF      _voltaje+1
	MOVF       R2, 0
	MOVWF      _voltaje+2
	MOVF       R3, 0
	MOVWF      _voltaje+3
;ANALOGO.c,60 :: 		voltaje=voltaje*(res1+res2)/res2;  //aplica el divisor resistivo
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
;ANALOGO.c,62 :: 		muestras=0;
	CLRF       _muestras+0
	CLRF       _muestras+1
;ANALOGO.c,63 :: 		suma=0;
	CLRF       _suma+0
	CLRF       _suma+1
	CLRF       _suma+2
	CLRF       _suma+3
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
L_main4:
	DECFSZ     R13, 1
	GOTO       L_main4
	DECFSZ     R12, 1
	GOTO       L_main4
	DECFSZ     R11, 1
	GOTO       L_main4
	NOP
	NOP
;ANALOGO.c,68 :: 		}
L_main3:
;ANALOGO.c,73 :: 		}
	GOTO       L_main0
;ANALOGO.c,75 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
