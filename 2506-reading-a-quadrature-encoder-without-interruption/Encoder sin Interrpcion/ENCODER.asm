
_main:

;ENCODER.c,30 :: 		void main()
;ENCODER.c,32 :: 		TRISB=255;  //TODO ENTRADAS
	MOVLW      255
	MOVWF      TRISB+0
;ENCODER.c,33 :: 		TRISC=0;    //TODOS SALIDAS
	CLRF       TRISC+0
;ENCODER.c,35 :: 		adcon0.b0=0;
	BCF        ADCON0+0, 0
;ENCODER.c,36 :: 		adcon1=0b110;
	MOVLW      6
	MOVWF      ADCON1+0
;ENCODER.c,37 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;ENCODER.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ENCODER.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ENCODER.c,41 :: 		Lcd_Out(1,1,"    ENCODER ARZ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ENCODER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,44 :: 		while (1)
L_main0:
;ENCODER.c,48 :: 		bits_actual=(encoder_A<<1)  |  encoder_B;    //lee el encoder
	CLRF       R2+0
	BTFSC      PORTB+0, 0
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	CLRF       R0+0
	BTFSC      PORTB+0, 1
	INCF       R0+0, 1
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      _bits_actual+0
;ENCODER.c,49 :: 		bits_armado= (bits_anterior<<2) | bits_actual;  //arma bits analizar con el  leido anteriormente
	MOVF       _bits_anterior+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R2+0, 0
	IORWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      _bits_armado+0
;ENCODER.c,52 :: 		if ((bits_armado == 13) || ( bits_armado== 4) || (bits_armado== 2)|| ( bits_armado==11)) pulsos++;
	MOVF       R1+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	MOVF       _bits_armado+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	MOVF       _bits_armado+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	MOVF       _bits_armado+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	GOTO       L_main4
L__main9:
	INCF       _pulsos+0, 1
	BTFSC      STATUS+0, 2
	INCF       _pulsos+1, 1
L_main4:
;ENCODER.c,53 :: 		if ((bits_armado == 14) || ( bits_armado== 7) || (bits_armado== 1)|| ( bits_armado==8)) pulsos--;
	MOVF       _bits_armado+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L__main8
	MOVF       _bits_armado+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L__main8
	MOVF       _bits_armado+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main8
	MOVF       _bits_armado+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__main8
	GOTO       L_main7
L__main8:
	MOVLW      1
	SUBWF      _pulsos+0, 1
	BTFSS      STATUS+0, 0
	DECF       _pulsos+1, 1
L_main7:
;ENCODER.c,55 :: 		inttostr(pulsos,texto);
	MOVF       _pulsos+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _pulsos+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ENCODER.c,56 :: 		Lcd_Out(3,5,texto);
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,58 :: 		bits_anterior=bits_actual;
	MOVF       _bits_actual+0, 0
	MOVWF      _bits_anterior+0
;ENCODER.c,62 :: 		}
	GOTO       L_main0
;ENCODER.c,66 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
