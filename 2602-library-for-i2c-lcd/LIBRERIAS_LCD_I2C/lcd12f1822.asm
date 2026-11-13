
_main:

;lcd12f1822.c,12 :: 		void main()
;lcd12f1822.c,15 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;lcd12f1822.c,16 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;lcd12f1822.c,17 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;lcd12f1822.c,18 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;lcd12f1822.c,24 :: 		ansela=0;
	CLRF       ANSELA+0
;lcd12f1822.c,25 :: 		TRISA=0;
	CLRF       TRISA+0
;lcd12f1822.c,26 :: 		LATA=0;
	CLRF       LATA+0
;lcd12f1822.c,29 :: 		i2c_lcd_Init();                        // Initialize LCD
	CALL       _I2C_LCD_init+0
;lcd12f1822.c,30 :: 		i2c_lcd_Cmd(_lcd_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd12f1822.c,31 :: 		i2c_lcd_Cmd(_lcd_CURSOR_OFF);          // Cursor off  opcinal
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd12f1822.c,34 :: 		i2c_lcd_Out(1,5,"ESTO ES UNA" );
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      5
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_lcd12f1822+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	MOVLW      hi_addr(?lstr1_lcd12f1822+0)
	MOVWF      FARG_I2C_LCD_Out_text+1
	CALL       _I2C_LCD_Out+0
;lcd12f1822.c,35 :: 		i2c_lcd_Out(2,1,"    PRUEBA" );
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_lcd12f1822+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	MOVLW      hi_addr(?lstr2_lcd12f1822+0)
	MOVWF      FARG_I2C_LCD_Out_text+1
	CALL       _I2C_LCD_Out+0
;lcd12f1822.c,37 :: 		i2c_lcd_Out(3,1,"temp=30" );
	MOVLW      3
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr3_lcd12f1822+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	MOVLW      hi_addr(?lstr3_lcd12f1822+0)
	MOVWF      FARG_I2C_LCD_Out_text+1
	CALL       _I2C_LCD_Out+0
;lcd12f1822.c,38 :: 		i2c_lcd_Chr_CP(223);
	MOVLW      223
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
;lcd12f1822.c,42 :: 		while (1)
L_main0:
;lcd12f1822.c,46 :: 		}
	GOTO       L_main0
;lcd12f1822.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
