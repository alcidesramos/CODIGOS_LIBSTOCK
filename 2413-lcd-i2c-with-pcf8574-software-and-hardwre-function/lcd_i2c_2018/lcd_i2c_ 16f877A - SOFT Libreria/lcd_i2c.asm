
_I2C_PCF8574_Write:

;soft_i2c_lcd.h,23 :: 		I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
;soft_i2c_lcd.h,25 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;soft_i2c_lcd.h,26 :: 		Soft_I2C_Write ( LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;soft_i2c_lcd.h,27 :: 		Soft_I2C_Write (value);
	MOVF       FARG_I2C_PCF8574_Write_value+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;soft_i2c_lcd.h,28 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;soft_i2c_lcd.h,30 :: 		}
L_end_I2C_PCF8574_Write:
	RETURN
; end of _I2C_PCF8574_Write

_I2C_LCD_Cmd:

;soft_i2c_lcd.h,32 :: 		void I2C_LCD_Cmd(char out_char)
;soft_i2c_lcd.h,36 :: 		lcddata = (out_char & 0xF0)|LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;soft_i2c_lcd.h,37 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,38 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd0:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd0
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd0
;soft_i2c_lcd.h,40 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,41 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd1:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd1
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd1
;soft_i2c_lcd.h,44 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
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
;soft_i2c_lcd.h,45 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,46 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd2:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd2
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd2
;soft_i2c_lcd.h,48 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,49 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd3:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd3
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd3
;soft_i2c_lcd.h,51 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_init:

;soft_i2c_lcd.h,53 :: 		void I2C_LCD_init()
;soft_i2c_lcd.h,59 :: 		Delay_ms(20); //retardo de inicializacion
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
;soft_i2c_lcd.h,61 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,62 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,63 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init5:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init5
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init5
;soft_i2c_lcd.h,64 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,65 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init6:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init6
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init6
;soft_i2c_lcd.h,67 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,68 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,69 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init7:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init7
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init7
;soft_i2c_lcd.h,70 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,71 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init8:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init8
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init8
;soft_i2c_lcd.h,73 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,74 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,75 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init9:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init9
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init9
;soft_i2c_lcd.h,76 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,77 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init10:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init10
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init10
;soft_i2c_lcd.h,81 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,82 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,83 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init11:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init11
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init11
;soft_i2c_lcd.h,84 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,85 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init12:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init12
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init12
;soft_i2c_lcd.h,88 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,89 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,90 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init13:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init13
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init13
;soft_i2c_lcd.h,91 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,92 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init14:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init14
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init14
;soft_i2c_lcd.h,93 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,94 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,95 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init15:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init15
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init15
;soft_i2c_lcd.h,96 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,97 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init16:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init16
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init16
;soft_i2c_lcd.h,100 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,101 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,102 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init17:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init17
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init17
;soft_i2c_lcd.h,103 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,104 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init18:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init18
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init18
;soft_i2c_lcd.h,105 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,106 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,107 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init19:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init19
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init19
;soft_i2c_lcd.h,108 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,109 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init20:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init20
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init20
;soft_i2c_lcd.h,113 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,114 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,115 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init21:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init21
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init21
;soft_i2c_lcd.h,116 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,117 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init22:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init22
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init22
;soft_i2c_lcd.h,118 :: 		lcddata=0xC0;
	MOVLW      192
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,119 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      196
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,120 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init23:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init23
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init23
;soft_i2c_lcd.h,121 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,122 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init24:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init24
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init24
;soft_i2c_lcd.h,125 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,126 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,127 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init25:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init25
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init25
;soft_i2c_lcd.h,128 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,129 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init26:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init26
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init26
;soft_i2c_lcd.h,130 :: 		lcddata=0x20 | LCD_BL;
	MOVLW      40
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,131 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      44
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,132 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init27:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init27
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init27
;soft_i2c_lcd.h,133 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,134 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init28:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init28
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init28
;soft_i2c_lcd.h,139 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,140 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,141 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init29:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init29
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init29
;soft_i2c_lcd.h,142 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,143 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init30:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init30
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init30
;soft_i2c_lcd.h,144 :: 		lcddata=0x10;
	MOVLW      16
	MOVWF      I2C_LCD_init_lcddata_L0+0
;soft_i2c_lcd.h,145 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      20
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,146 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init31:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init31
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init31
;soft_i2c_lcd.h,147 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,148 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init32:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init32
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init32
;soft_i2c_lcd.h,149 :: 		}
L_end_I2C_LCD_init:
	RETURN
; end of _I2C_LCD_init

_I2C_LCD_Chr:

;soft_i2c_lcd.h,152 :: 		void I2C_LCD_Chr(char row, char column, char out_char)
;soft_i2c_lcd.h,157 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr33
;soft_i2c_lcd.h,159 :: 		case 1:
L_I2C_LCD_Chr35:
;soft_i2c_lcd.h,160 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.h,161 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;soft_i2c_lcd.h,162 :: 		case 2:
L_I2C_LCD_Chr36:
;soft_i2c_lcd.h,163 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.h,164 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;soft_i2c_lcd.h,165 :: 		case 3:
L_I2C_LCD_Chr37:
;soft_i2c_lcd.h,166 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.h,167 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;soft_i2c_lcd.h,168 :: 		case 4:
L_I2C_LCD_Chr38:
;soft_i2c_lcd.h,169 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;soft_i2c_lcd.h,170 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;soft_i2c_lcd.h,171 :: 		}
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
;soft_i2c_lcd.h,174 :: 		lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;soft_i2c_lcd.h,175 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,176 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr39:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr39
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr39
;soft_i2c_lcd.h,177 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,178 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr40:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr40
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr40
;soft_i2c_lcd.h,180 :: 		lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
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
;soft_i2c_lcd.h,181 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,182 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr41:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr41
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr41
;soft_i2c_lcd.h,183 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,184 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,185 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr42:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr42
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr42
;soft_i2c_lcd.h,188 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;soft_i2c_lcd.h,190 :: 		void I2C_LCD_Chr_Cp(char out_char)
;soft_i2c_lcd.h,193 :: 		lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;soft_i2c_lcd.h,194 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,195 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp43:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
;soft_i2c_lcd.h,196 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,197 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp44:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
;soft_i2c_lcd.h,199 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
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
;soft_i2c_lcd.h,200 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,201 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp45:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
;soft_i2c_lcd.h,202 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,203 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;soft_i2c_lcd.h,204 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp46:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
;soft_i2c_lcd.h,208 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Out:

;soft_i2c_lcd.h,211 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;soft_i2c_lcd.h,212 :: 		while(*text)
L_I2C_LCD_Out47:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out48
;soft_i2c_lcd.h,213 :: 		I2C_LCD_Chr(row, col++, *text++);
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
;soft_i2c_lcd.h,214 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;soft_i2c_lcd.h,216 :: 		void I2C_LCD_Out_Cp(char *text) {
;soft_i2c_lcd.h,217 :: 		while(*text)
L_I2C_LCD_Out_Cp49:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp50
;soft_i2c_lcd.h,218 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
	INCF       FARG_I2C_LCD_Out_Cp_text+0, 1
	GOTO       L_I2C_LCD_Out_Cp49
L_I2C_LCD_Out_Cp50:
;soft_i2c_lcd.h,219 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp

_main:

;lcd_i2c.c,8 :: 		void main()
;lcd_i2c.c,10 :: 		trisb=0;
	CLRF       TRISB+0
;lcd_i2c.c,12 :: 		Soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;lcd_i2c.c,13 :: 		Delay_ms(100);
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
;lcd_i2c.c,17 :: 		I2C_LCD_init();
	CALL       _I2C_LCD_init+0
;lcd_i2c.c,18 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,19 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,20 :: 		I2C_LCD_Out(1,1,"Hola mundo");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_lcd_i2c+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;lcd_i2c.c,21 :: 		I2C_LCD_Out(2,1,"Todo Bien");
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_lcd_i2c+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;lcd_i2c.c,24 :: 		while (1)
L_main52:
;lcd_i2c.c,26 :: 		RB7_bit=~RB7_bit;
	MOVLW
	XORWF      RB7_bit+0, 1
;lcd_i2c.c,27 :: 		Delay_ms(1000);
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
;lcd_i2c.c,28 :: 		}
	GOTO       L_main52
;lcd_i2c.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
