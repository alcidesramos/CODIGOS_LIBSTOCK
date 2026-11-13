
_main:

;converisoens.c,26 :: 		void main()
;converisoens.c,29 :: 		ADCON1=0b1111; //todo digital
	MOVLW       15
	MOVWF       ADCON1+0 
;converisoens.c,31 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;converisoens.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;converisoens.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);         // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;converisoens.c,37 :: 		while (1)
L_main0:
;converisoens.c,41 :: 		dia=23;
	MOVLW       23
	MOVWF       _dia+0 
;converisoens.c,42 :: 		mes=10;
	MOVLW       10
	MOVWF       _mes+0 
;converisoens.c,43 :: 		ano=18;
	MOVLW       18
	MOVWF       _ano+0 
;converisoens.c,45 :: 		sprintf(texto,"fecha=%02u/%02u/20%02u",(unsigned int)dia,(unsigned int)mes,(unsigned int)ano);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_converisoens+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_converisoens+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_converisoens+0)
	MOVWF       FARG_sprintf_f+2 
	MOVLW       23
	MOVWF       FARG_sprintf_wh+5 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+6 
	MOVLW       10
	MOVWF       FARG_sprintf_wh+7 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+8 
	MOVLW       18
	MOVWF       FARG_sprintf_wh+9 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+10 
	CALL        _sprintf+0, 0
;converisoens.c,47 :: 		Lcd_Out(3,1,texto);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;converisoens.c,49 :: 		for (cuenta=0.125;cuenta<=10.250;cuenta=cuenta+0.1)
	MOVLW       0
	MOVWF       _cuenta+0 
	MOVLW       0
	MOVWF       _cuenta+1 
	MOVLW       0
	MOVWF       _cuenta+2 
	MOVLW       124
	MOVWF       _cuenta+3 
L_main2:
	MOVF        _cuenta+0, 0 
	MOVWF       R4 
	MOVF        _cuenta+1, 0 
	MOVWF       R5 
	MOVF        _cuenta+2, 0 
	MOVWF       R6 
	MOVF        _cuenta+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       36
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;converisoens.c,52 :: 		sprintf(texto,"contador=%4.2f",cuenta);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_converisoens+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_converisoens+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_converisoens+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _cuenta+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _cuenta+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _cuenta+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _cuenta+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;converisoens.c,54 :: 		Lcd_Out(1,1,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;converisoens.c,55 :: 		Delay_ms(80);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
;converisoens.c,49 :: 		for (cuenta=0.125;cuenta<=10.250;cuenta=cuenta+0.1)
	MOVF        _cuenta+0, 0 
	MOVWF       R0 
	MOVF        _cuenta+1, 0 
	MOVWF       R1 
	MOVF        _cuenta+2, 0 
	MOVWF       R2 
	MOVF        _cuenta+3, 0 
	MOVWF       R3 
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _cuenta+0 
	MOVF        R1, 0 
	MOVWF       _cuenta+1 
	MOVF        R2, 0 
	MOVWF       _cuenta+2 
	MOVF        R3, 0 
	MOVWF       _cuenta+3 
;converisoens.c,59 :: 		}
	GOTO        L_main2
L_main3:
;converisoens.c,61 :: 		}
	GOTO        L_main0
;converisoens.c,63 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
