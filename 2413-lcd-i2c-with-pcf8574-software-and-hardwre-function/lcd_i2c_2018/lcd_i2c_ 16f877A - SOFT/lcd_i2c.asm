
_I2C_PCF8574_Write:

;lcd_i2c.c,24 :: 		I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
;lcd_i2c.c,26 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;lcd_i2c.c,27 :: 		Soft_I2C_Write ( LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;lcd_i2c.c,28 :: 		Soft_I2C_Write (value);
	MOVF       FARG_I2C_PCF8574_Write_value+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;lcd_i2c.c,29 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;lcd_i2c.c,31 :: 		}
L_end_I2C_PCF8574_Write:
	RETURN
; end of _I2C_PCF8574_Write

_I2C_LCD_Cmd:

;lcd_i2c.c,33 :: 		void I2C_LCD_Cmd(char out_char)
;lcd_i2c.c,37 :: 		lcddata = (out_char & 0xF0)|LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;lcd_i2c.c,38 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,39 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd0:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd0
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd0
;lcd_i2c.c,41 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,42 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd1:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd1
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd1
;lcd_i2c.c,45 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
	MOVF       FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      240
	ANDWF      R0+0, 1
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;lcd_i2c.c,46 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,47 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd2:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd2
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd2
;lcd_i2c.c,49 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,50 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd3:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd3
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd3
;lcd_i2c.c,52 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_init:

;lcd_i2c.c,54 :: 		void I2C_LCD_init()
;lcd_i2c.c,60 :: 		Delay_ms(20); //retardo de inicializacion
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_I2C_LCD_init4:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init4
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init4
	NOP
;lcd_i2c.c,62 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,63 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,64 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init5:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init5
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init5
;lcd_i2c.c,65 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,66 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init6:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init6
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init6
;lcd_i2c.c,68 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,69 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,70 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init7:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init7
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init7
;lcd_i2c.c,71 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,72 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init8:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init8
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init8
;lcd_i2c.c,74 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,75 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,76 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init9:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init9
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init9
;lcd_i2c.c,77 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,78 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init10:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init10
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init10
;lcd_i2c.c,82 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,83 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,84 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init11:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init11
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init11
;lcd_i2c.c,85 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,86 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init12:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init12
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init12
;lcd_i2c.c,89 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,90 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,91 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init13:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init13
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init13
;lcd_i2c.c,92 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,93 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init14:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init14
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init14
;lcd_i2c.c,94 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,95 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,96 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init15:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init15
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init15
;lcd_i2c.c,97 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,98 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init16:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init16
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init16
;lcd_i2c.c,101 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,102 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,103 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init17:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init17
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init17
;lcd_i2c.c,104 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,105 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init18:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init18
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init18
;lcd_i2c.c,106 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,107 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,108 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init19:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init19
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init19
;lcd_i2c.c,109 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,110 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init20:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init20
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init20
;lcd_i2c.c,114 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,115 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,116 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init21:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init21
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init21
;lcd_i2c.c,117 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,118 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init22:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init22
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init22
;lcd_i2c.c,119 :: 		lcddata=0xC0;
	MOVLW      192
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,120 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      196
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,121 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init23:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init23
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init23
;lcd_i2c.c,122 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,123 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init24:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init24
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init24
;lcd_i2c.c,126 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,127 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,128 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init25:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init25
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init25
;lcd_i2c.c,129 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,130 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init26:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init26
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init26
;lcd_i2c.c,131 :: 		lcddata=0x20 | LCD_BL;
	MOVLW      40
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,132 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      44
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,133 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init27:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init27
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init27
;lcd_i2c.c,134 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,135 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init28:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init28
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init28
;lcd_i2c.c,140 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,141 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,142 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init29:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init29
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init29
;lcd_i2c.c,143 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,144 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init30:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init30
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init30
;lcd_i2c.c,145 :: 		lcddata=0x10;
	MOVLW      16
	MOVWF      I2C_LCD_init_lcddata_L0+0
;lcd_i2c.c,146 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      20
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,147 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init31:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init31
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init31
;lcd_i2c.c,148 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,149 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init32:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init32
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init32
;lcd_i2c.c,150 :: 		}
L_end_I2C_LCD_init:
	RETURN
; end of _I2C_LCD_init

_I2C_LCD_Chr:

;lcd_i2c.c,153 :: 		void I2C_LCD_Chr(char row, char column, char out_char)
;lcd_i2c.c,158 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr33
;lcd_i2c.c,160 :: 		case 1:
L_I2C_LCD_Chr35:
;lcd_i2c.c,161 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,162 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;lcd_i2c.c,163 :: 		case 2:
L_I2C_LCD_Chr36:
;lcd_i2c.c,164 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,165 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;lcd_i2c.c,166 :: 		case 3:
L_I2C_LCD_Chr37:
;lcd_i2c.c,167 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,168 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;lcd_i2c.c,169 :: 		case 4:
L_I2C_LCD_Chr38:
;lcd_i2c.c,170 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,171 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;lcd_i2c.c,172 :: 		}
L_I2C_LCD_Chr33:
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr35
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr36
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr37
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr38
L_I2C_LCD_Chr34:
;lcd_i2c.c,175 :: 		lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;lcd_i2c.c,176 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,177 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr39:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr39
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr39
;lcd_i2c.c,178 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,179 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr40:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr40
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr40
;lcd_i2c.c,181 :: 		lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
	MOVF       FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      240
	ANDWF      R0+0, 1
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;lcd_i2c.c,182 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,183 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr41:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr41
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr41
;lcd_i2c.c,184 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,185 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,186 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr42:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr42
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr42
;lcd_i2c.c,189 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;lcd_i2c.c,191 :: 		void I2C_LCD_Chr_Cp(char out_char)
;lcd_i2c.c,194 :: 		lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;lcd_i2c.c,195 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,196 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp43:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
;lcd_i2c.c,197 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,198 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp44:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
;lcd_i2c.c,200 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
	MOVF       FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      240
	ANDWF      R0+0, 1
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;lcd_i2c.c,201 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,202 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp45:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
;lcd_i2c.c,203 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,204 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;lcd_i2c.c,205 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp46:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
;lcd_i2c.c,209 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Out:

;lcd_i2c.c,212 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;lcd_i2c.c,213 :: 		while(*text)
L_I2C_LCD_Out47:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out48
;lcd_i2c.c,214 :: 		I2C_LCD_Chr(row, col++, *text++);
	MOVF       FARG_I2C_LCD_Out_row+0, 0
	MOVWF      FARG_I2C_LCD_Chr_row+0
	MOVF       FARG_I2C_LCD_Out_col+0, 0
	MOVWF      FARG_I2C_LCD_Chr_column+0
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_out_char+0
	CALL       _I2C_LCD_Chr+0
	INCF       FARG_I2C_LCD_Out_col+0, 1
	INCF       FARG_I2C_LCD_Out_text+0, 1
	GOTO       L_I2C_LCD_Out47
L_I2C_LCD_Out48:
;lcd_i2c.c,215 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;lcd_i2c.c,217 :: 		void I2C_LCD_Out_Cp(char *text) {
;lcd_i2c.c,218 :: 		while(*text)
L_I2C_LCD_Out_Cp49:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp50
;lcd_i2c.c,219 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
	INCF       FARG_I2C_LCD_Out_Cp_text+0, 1
	GOTO       L_I2C_LCD_Out_Cp49
L_I2C_LCD_Out_Cp50:
;lcd_i2c.c,220 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp

_main:

;lcd_i2c.c,223 :: 		void main()
;lcd_i2c.c,225 :: 		trisb=0;
	CLRF       TRISB+0
;lcd_i2c.c,227 :: 		Soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;lcd_i2c.c,228 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	NOP
	NOP
;lcd_i2c.c,232 :: 		I2C_LCD_init();
	CALL       _I2C_LCD_init+0
;lcd_i2c.c,233 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,234 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,235 :: 		I2C_LCD_Out(1,1,"Hola mundo");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_lcd_i2c+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;lcd_i2c.c,236 :: 		I2C_LCD_Out(2,1,"Todo Bien");
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_lcd_i2c+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;lcd_i2c.c,239 :: 		while (1)
L_main52:
;lcd_i2c.c,241 :: 		RB7_bit=~RB7_bit;
	MOVLW
	XORWF      RB7_bit+0, 1
;lcd_i2c.c,242 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	DECFSZ     R11+0, 1
	GOTO       L_main54
	NOP
	NOP
;lcd_i2c.c,243 :: 		}
	GOTO       L_main52
;lcd_i2c.c,247 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
