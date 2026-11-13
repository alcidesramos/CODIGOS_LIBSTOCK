
_main:

;ADC1.c,21 :: 		void main()
;ADC1.c,47 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;ADC1.c,48 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;ADC1.c,49 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;ADC1.c,50 :: 		ANSELD=0;
	CLRF        ANSELD+0 
;ADC1.c,51 :: 		ANSELE=0;
	CLRF        ANSELE+0 
;ADC1.c,53 :: 		ANSELA.B0=1; //AN0 ES ANALOGO
	BSF         ANSELA+0, 0 
;ADC1.c,54 :: 		ANSA0_bit=1;  // ANO ANALOGO
	BSF         ANSA0_bit+0, BitPos(ANSA0_bit+0) 
;ADC1.c,56 :: 		ANSB1_bit=1; // ANLOGO AN10 ANALOGO
	BSF         ANSB1_bit+0, BitPos(ANSB1_bit+0) 
;ADC1.c,57 :: 		ANSELB.B1=1; // ANLOGO AN10 ANALOGO
	BSF         ANSELB+0, 1 
;ADC1.c,60 :: 		TRISA0_bit=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;ADC1.c,61 :: 		TRISB2_bit=1;
	BSF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;ADC1.c,63 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;ADC1.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ADC1.c,66 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);         // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ADC1.c,70 :: 		while (1)
L_main0:
;ADC1.c,72 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;ADC1.c,73 :: 		voltaje=codigo*5.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
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
	MOVWF       _voltaje+0 
	MOVF        R1, 0 
	MOVWF       _voltaje+1 
	MOVF        R2, 0 
	MOVWF       _voltaje+2 
	MOVF        R3, 0 
	MOVWF       _voltaje+3 
;ADC1.c,74 :: 		floattostr_(voltaje,texto,3);
	MOVF        R0, 0 
	MOVWF       FARG_floattostr__numero_+0 
	MOVF        R1, 0 
	MOVWF       FARG_floattostr__numero_+1 
	MOVF        R2, 0 
	MOVWF       FARG_floattostr__numero_+2 
	MOVF        R3, 0 
	MOVWF       FARG_floattostr__numero_+3 
	MOVLW       _texto+0
	MOVWF       FARG_floattostr__cadena_+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_floattostr__cadena_+1 
	MOVLW       3
	MOVWF       FARG_floattostr__decimales_+0 
	CALL        _floattostr_+0, 0
;ADC1.c,81 :: 		sprintf(texto,"volt=%5.3f V", voltaje);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_ADC1+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_ADC1+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_ADC1+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _voltaje+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _voltaje+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _voltaje+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _voltaje+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;ADC1.c,82 :: 		Lcd_Out(1,1,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC1.c,85 :: 		codigo=ADC_Read(10);
	MOVLW       10
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;ADC1.c,86 :: 		temperatura=codigo*500.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       135
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
;ADC1.c,87 :: 		floattostr_(temperatura,texto,2);
	MOVF        R0, 0 
	MOVWF       FARG_floattostr__numero_+0 
	MOVF        R1, 0 
	MOVWF       FARG_floattostr__numero_+1 
	MOVF        R2, 0 
	MOVWF       FARG_floattostr__numero_+2 
	MOVF        R3, 0 
	MOVWF       FARG_floattostr__numero_+3 
	MOVLW       _texto+0
	MOVWF       FARG_floattostr__cadena_+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_floattostr__cadena_+1 
	MOVLW       2
	MOVWF       FARG_floattostr__decimales_+0 
	CALL        _floattostr_+0, 0
;ADC1.c,88 :: 		Lcd_Out(2,1,"temp=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ADC1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ADC1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC1.c,89 :: 		Lcd_Out_CP(texto);
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ADC1.c,90 :: 		Lcd_Chr_CP(223);
	MOVLW       223
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;ADC1.c,91 :: 		Lcd_Chr_CP('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;ADC1.c,94 :: 		Delay_ms(600);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;ADC1.c,97 :: 		}
	GOTO        L_main0
;ADC1.c,99 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
