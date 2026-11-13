
_I2C_PCF8574_Write:

;soft_i2c_lcd.c,6 :: 		void I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
;soft_i2c_lcd.c,8 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;soft_i2c_lcd.c,9 :: 		Soft_I2C_Write ( LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;soft_i2c_lcd.c,10 :: 		Soft_I2C_Write (value);
	MOVF       FARG_I2C_PCF8574_Write_value+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;soft_i2c_lcd.c,11 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;soft_i2c_lcd.c,13 :: 		}
L_end_I2C_PCF8574_Write:
	RETURN
; end of _I2C_PCF8574_Write

_I2C_LCD_Cmd:

;soft_i2c_lcd.c,15 :: 		void I2C_LCD_Cmd(char out_char)
;soft_i2c_lcd.c,19 :: 		lcddata = (out_char & 0xF0)|LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;soft_i2c_lcd.c,20 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,21 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,23 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,24 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,27 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
	MOVF       FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	MOVLW      240
	ANDWF      R0, 1
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;soft_i2c_lcd.c,28 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,29 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,31 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,32 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,34 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_init:

;soft_i2c_lcd.c,36 :: 		void I2C_LCD_init()
;soft_i2c_lcd.c,41 :: 		Soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;soft_i2c_lcd.c,42 :: 		Delay_ms(20); //retardo de inicializacion
	MOVLW      52
	MOVWF      R12
	MOVLW      241
	MOVWF      R13
L_I2C_LCD_init0:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init0
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init0
	NOP
	NOP
;soft_i2c_lcd.c,44 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,45 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,46 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init1:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init1
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init1
	NOP
	NOP
;soft_i2c_lcd.c,47 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,48 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_I2C_LCD_init2:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init2
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init2
	NOP
	NOP
;soft_i2c_lcd.c,50 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,51 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,52 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init3:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init3
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init3
	NOP
	NOP
;soft_i2c_lcd.c,53 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,54 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_I2C_LCD_init4:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init4
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init4
	NOP
	NOP
;soft_i2c_lcd.c,56 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,57 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,58 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init5:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init5
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init5
	NOP
	NOP
;soft_i2c_lcd.c,59 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,60 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_I2C_LCD_init6:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init6
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init6
	NOP
	NOP
;soft_i2c_lcd.c,64 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,65 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,66 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init7:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init7
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init7
	NOP
	NOP
;soft_i2c_lcd.c,67 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,68 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init8:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init8
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init8
	NOP
	NOP
;soft_i2c_lcd.c,71 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,72 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,73 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init9:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init9
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init9
	NOP
	NOP
;soft_i2c_lcd.c,74 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,75 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init10:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init10
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init10
	NOP
	NOP
;soft_i2c_lcd.c,76 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,77 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,78 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_I2C_LCD_init11:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init11
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init11
	NOP
	NOP
;soft_i2c_lcd.c,79 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,80 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_I2C_LCD_init12:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init12
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init12
	NOP
	NOP
;soft_i2c_lcd.c,83 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,84 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,85 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,86 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,87 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,88 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,89 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,90 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,91 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,92 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,96 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,97 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,98 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,99 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,100 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,101 :: 		lcddata=0xC0;
	MOVLW      192
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,102 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      196
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,103 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,104 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,105 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,108 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,109 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,110 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,111 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,112 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,113 :: 		lcddata=0x20 | LCD_BL;
	MOVLW      40
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,114 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      44
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,115 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,116 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,117 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,122 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,123 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,124 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,125 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,126 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,127 :: 		lcddata=0x10;
	MOVLW      16
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.c,128 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      20
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,129 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,130 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,131 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,132 :: 		}
L_end_I2C_LCD_init:
	RETURN
; end of _I2C_LCD_init

_I2C_LCD_Chr:

;soft_i2c_lcd.c,135 :: 		void I2C_LCD_Chr(char row, char column, char out_char)
;soft_i2c_lcd.c,140 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr13
;soft_i2c_lcd.c,142 :: 		case 1:
L_I2C_LCD_Chr15:
;soft_i2c_lcd.c,143 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.c,144 :: 		break;
	GOTO       L_I2C_LCD_Chr14
;soft_i2c_lcd.c,145 :: 		case 2:
L_I2C_LCD_Chr16:
;soft_i2c_lcd.c,146 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.c,147 :: 		break;
	GOTO       L_I2C_LCD_Chr14
;soft_i2c_lcd.c,148 :: 		case 3:
L_I2C_LCD_Chr17:
;soft_i2c_lcd.c,149 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.c,150 :: 		break;
	GOTO       L_I2C_LCD_Chr14
;soft_i2c_lcd.c,151 :: 		case 4:
L_I2C_LCD_Chr18:
;soft_i2c_lcd.c,152 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.c,153 :: 		break;
	GOTO       L_I2C_LCD_Chr14
;soft_i2c_lcd.c,154 :: 		}
L_I2C_LCD_Chr13:
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr15
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr16
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr17
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr18
L_I2C_LCD_Chr14:
;soft_i2c_lcd.c,157 :: 		lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0
	BSF        R0, 0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;soft_i2c_lcd.c,158 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,159 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,160 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,161 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,163 :: 		lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
	MOVF       FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	MOVLW      240
	ANDWF      R0, 1
	BSF        R0, 0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;soft_i2c_lcd.c,164 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,165 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,166 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,167 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,168 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,171 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;soft_i2c_lcd.c,173 :: 		void I2C_LCD_Chr_Cp(char out_char)
;soft_i2c_lcd.c,176 :: 		lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0
	BSF        R0, 0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;soft_i2c_lcd.c,177 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,178 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,179 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,180 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,182 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
	MOVF       FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	MOVLW      240
	ANDWF      R0, 1
	BSF        R0, 0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;soft_i2c_lcd.c,183 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,184 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,185 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,186 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.c,187 :: 		Delay_us(1);
	NOP
	NOP
;soft_i2c_lcd.c,191 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Out:

;soft_i2c_lcd.c,194 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;soft_i2c_lcd.c,195 :: 		while(*text)
L_I2C_LCD_Out19:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR0L
	MOVF       FARG_I2C_LCD_Out_text+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out20
;soft_i2c_lcd.c,196 :: 		I2C_LCD_Chr(row, col++, *text++);
	MOVF       FARG_I2C_LCD_Out_row+0, 0
	MOVWF      FARG_I2C_LCD_Chr_row+0
	MOVF       FARG_I2C_LCD_Out_col+0, 0
	MOVWF      FARG_I2C_LCD_Chr_column+0
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR0L
	MOVF       FARG_I2C_LCD_Out_text+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_I2C_LCD_Chr_out_char+0
	CALL       _I2C_LCD_Chr+0
	INCF       FARG_I2C_LCD_Out_col+0, 1
	INCF       FARG_I2C_LCD_Out_text+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_I2C_LCD_Out_text+1, 1
	GOTO       L_I2C_LCD_Out19
L_I2C_LCD_Out20:
;soft_i2c_lcd.c,197 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;soft_i2c_lcd.c,199 :: 		void I2C_LCD_Out_Cp(char *text) {
;soft_i2c_lcd.c,200 :: 		while(*text)
L_I2C_LCD_Out_Cp21:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR0L
	MOVF       FARG_I2C_LCD_Out_Cp_text+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp22
;soft_i2c_lcd.c,201 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR0L
	MOVF       FARG_I2C_LCD_Out_Cp_text+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
	INCF       FARG_I2C_LCD_Out_Cp_text+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_I2C_LCD_Out_Cp_text+1, 1
	GOTO       L_I2C_LCD_Out_Cp21
L_I2C_LCD_Out_Cp22:
;soft_i2c_lcd.c,202 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp
