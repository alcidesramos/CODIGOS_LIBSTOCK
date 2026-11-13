
_I2C_PCF8574_Write:

;i2c_lcd.h,17 :: 		I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
;i2c_lcd.h,20 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;i2c_lcd.h,21 :: 		I2C1_Wr( Adr );
	MOVF       FARG_I2C_PCF8574_Write_Adr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c_lcd.h,22 :: 		I2C1_Wr(value);
	MOVF       FARG_I2C_PCF8574_Write_value+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c_lcd.h,23 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;i2c_lcd.h,24 :: 		}
L_end_I2C_PCF8574_Write:
	RETURN
; end of _I2C_PCF8574_Write

_I2C_LCD_Cmd:

;i2c_lcd.h,26 :: 		void I2C_LCD_Cmd(char out_char)
;i2c_lcd.h,30 :: 		lcddata = (out_char & 0xF0)|LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;i2c_lcd.h,31 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,32 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd0:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd0
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd0
;i2c_lcd.h,34 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,35 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd1:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd1
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd1
;i2c_lcd.h,38 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
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
;i2c_lcd.h,39 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,40 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd2:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd2
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd2
;i2c_lcd.h,42 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,43 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd3:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd3
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd3
;i2c_lcd.h,45 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_init:

;i2c_lcd.h,47 :: 		void I2C_LCD_init()
;i2c_lcd.h,53 :: 		Delay_ms(20); //retardo de inicializacion
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
;i2c_lcd.h,55 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,56 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,57 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init5:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init5
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init5
;i2c_lcd.h,58 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,59 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init6:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init6
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init6
;i2c_lcd.h,61 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,62 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,63 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init7:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init7
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init7
;i2c_lcd.h,64 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,65 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init8:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init8
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init8
;i2c_lcd.h,67 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,68 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,69 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init9:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init9
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init9
;i2c_lcd.h,70 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,71 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init10:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init10
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init10
;i2c_lcd.h,75 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,76 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,77 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init11:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init11
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init11
;i2c_lcd.h,78 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,79 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init12:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init12
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init12
;i2c_lcd.h,82 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,83 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,84 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init13:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init13
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init13
;i2c_lcd.h,85 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,86 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init14:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init14
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init14
;i2c_lcd.h,87 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,88 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,89 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init15:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init15
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init15
;i2c_lcd.h,90 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,91 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init16:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init16
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init16
;i2c_lcd.h,94 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,95 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,96 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init17:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init17
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init17
;i2c_lcd.h,97 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,98 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init18:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init18
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init18
;i2c_lcd.h,99 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,100 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,101 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init19:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init19
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init19
;i2c_lcd.h,102 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,103 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init20:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init20
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init20
;i2c_lcd.h,107 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,108 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,109 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init21:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init21
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init21
;i2c_lcd.h,110 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,111 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init22:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init22
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init22
;i2c_lcd.h,112 :: 		lcddata=0xC0;
	MOVLW      192
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,113 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      196
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,114 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init23:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init23
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init23
;i2c_lcd.h,115 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,116 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init24:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init24
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init24
;i2c_lcd.h,119 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,120 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,121 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init25:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init25
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init25
;i2c_lcd.h,122 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,123 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init26:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init26
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init26
;i2c_lcd.h,124 :: 		lcddata=0x20 | LCD_BL;
	MOVLW      40
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,125 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      44
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,126 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init27:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init27
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init27
;i2c_lcd.h,127 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,128 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init28:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init28
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init28
;i2c_lcd.h,133 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,134 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,135 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init29:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init29
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init29
;i2c_lcd.h,136 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,137 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init30:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init30
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init30
;i2c_lcd.h,138 :: 		lcddata=0x10;
	MOVLW      16
	MOVWF      I2C_LCD_init_lcddata_L0+0
;i2c_lcd.h,139 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      20
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,140 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init31:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init31
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init31
;i2c_lcd.h,141 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,142 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init32:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init32
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init32
;i2c_lcd.h,143 :: 		}
L_end_I2C_LCD_init:
	RETURN
; end of _I2C_LCD_init

_I2C_LCD_Chr:

;i2c_lcd.h,146 :: 		void I2C_LCD_Chr(char row, char column, char out_char)
;i2c_lcd.h,151 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr33
;i2c_lcd.h,153 :: 		case 1:
L_I2C_LCD_Chr35:
;i2c_lcd.h,154 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;i2c_lcd.h,155 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;i2c_lcd.h,156 :: 		case 2:
L_I2C_LCD_Chr36:
;i2c_lcd.h,157 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;i2c_lcd.h,158 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;i2c_lcd.h,159 :: 		case 3:
L_I2C_LCD_Chr37:
;i2c_lcd.h,160 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;i2c_lcd.h,161 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;i2c_lcd.h,162 :: 		case 4:
L_I2C_LCD_Chr38:
;i2c_lcd.h,163 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;i2c_lcd.h,164 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;i2c_lcd.h,165 :: 		}
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
;i2c_lcd.h,168 :: 		lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;i2c_lcd.h,169 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,170 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr39:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr39
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr39
;i2c_lcd.h,171 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,172 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr40:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr40
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr40
;i2c_lcd.h,174 :: 		lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
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
;i2c_lcd.h,175 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,176 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr41:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr41
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr41
;i2c_lcd.h,177 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,178 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,179 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr42:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr42
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr42
;i2c_lcd.h,182 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;i2c_lcd.h,184 :: 		void I2C_LCD_Chr_Cp(char out_char)
;i2c_lcd.h,187 :: 		lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;i2c_lcd.h,188 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,189 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp43:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
;i2c_lcd.h,190 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,191 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp44:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
;i2c_lcd.h,193 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
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
;i2c_lcd.h,194 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,195 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp45:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
;i2c_lcd.h,196 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,197 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;i2c_lcd.h,198 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp46:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
;i2c_lcd.h,202 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Out:

;i2c_lcd.h,205 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;i2c_lcd.h,206 :: 		while(*text)
L_I2C_LCD_Out47:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out48
;i2c_lcd.h,207 :: 		I2C_LCD_Chr(row, col++, *text++);
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
;i2c_lcd.h,208 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;i2c_lcd.h,210 :: 		void I2C_LCD_Out_Cp(char *text) {
;i2c_lcd.h,211 :: 		while(*text)
L_I2C_LCD_Out_Cp49:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp50
;i2c_lcd.h,212 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
	INCF       FARG_I2C_LCD_Out_Cp_text+0, 1
	GOTO       L_I2C_LCD_Out_Cp49
L_I2C_LCD_Out_Cp50:
;i2c_lcd.h,213 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp

_main:

;lcd_i2c.c,3 :: 		void main()
;lcd_i2c.c,5 :: 		trisb=0;
	CLRF       TRISB+0
;lcd_i2c.c,7 :: 		trisc.b3=1;
	BSF        TRISC+0, 3
;lcd_i2c.c,8 :: 		trisc.b4=1;
	BSF        TRISC+0, 4
;lcd_i2c.c,11 :: 		I2C1_Init(100000);
	MOVLW      10
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;lcd_i2c.c,14 :: 		I2C_LCD_init();
	CALL       _I2C_LCD_init+0
;lcd_i2c.c,15 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,16 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.c,17 :: 		I2C_LCD_Out(1,1,"Hola mundo");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_lcd_i2c+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;lcd_i2c.c,18 :: 		I2C_LCD_Out(2,1,"Todo Bien");
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_lcd_i2c+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;lcd_i2c.c,21 :: 		while (1)
L_main51:
;lcd_i2c.c,23 :: 		RB7_bit=~RB7_bit;
	MOVLW
	XORWF      RB7_bit+0, 1
;lcd_i2c.c,24 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	NOP
;lcd_i2c.c,25 :: 		}
	GOTO       L_main51
;lcd_i2c.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
