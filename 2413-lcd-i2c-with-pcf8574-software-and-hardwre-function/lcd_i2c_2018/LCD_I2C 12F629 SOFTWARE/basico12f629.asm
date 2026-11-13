
_I2C_PCF8574_Write:

;basico12f629.c,32 :: 		I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
;basico12f629.c,35 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;basico12f629.c,36 :: 		Soft_I2C_Write ( LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;basico12f629.c,37 :: 		Soft_I2C_Write (value);
	MOVF       FARG_I2C_PCF8574_Write_value+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;basico12f629.c,38 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;basico12f629.c,39 :: 		}
L_end_I2C_PCF8574_Write:
	RETURN
; end of _I2C_PCF8574_Write

_I2C_LCD_Cmd:

;basico12f629.c,41 :: 		void I2C_LCD_Cmd(char out_char)
;basico12f629.c,45 :: 		lcddata = (out_char & 0xF0)|LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;basico12f629.c,46 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,47 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd0:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd0
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd0
;basico12f629.c,49 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,50 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd1:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd1
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd1
;basico12f629.c,53 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
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
;basico12f629.c,54 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,55 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd2:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd2
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd2
;basico12f629.c,57 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,58 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Cmd3:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd3
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd3
;basico12f629.c,60 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_init:

;basico12f629.c,62 :: 		void I2C_LCD_init()
;basico12f629.c,68 :: 		Delay_ms(20); //retardo de inicializacion
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
;basico12f629.c,70 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,71 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,72 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init5:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init5
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init5
;basico12f629.c,73 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,74 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init6:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init6
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init6
;basico12f629.c,76 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,77 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,78 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init7:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init7
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init7
;basico12f629.c,79 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,80 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init8:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init8
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init8
;basico12f629.c,82 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,83 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,84 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init9:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init9
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init9
;basico12f629.c,85 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,86 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init10:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init10
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init10
;basico12f629.c,90 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,91 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,92 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init11:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init11
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init11
;basico12f629.c,93 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,94 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init12:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init12
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init12
;basico12f629.c,97 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,98 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,99 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init13:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init13
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init13
;basico12f629.c,100 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,101 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init14:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init14
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init14
;basico12f629.c,102 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,103 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,104 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init15:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init15
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init15
;basico12f629.c,105 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,106 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_I2C_LCD_init16:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init16
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init16
;basico12f629.c,109 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f629.c,110 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,111 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init17:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init17
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init17
;basico12f629.c,112 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,113 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init18:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init18
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init18
;basico12f629.c,114 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,115 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,116 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init19:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init19
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init19
;basico12f629.c,117 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,118 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init20:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init20
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init20
;basico12f629.c,122 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f629.c,123 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,124 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init21:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init21
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init21
;basico12f629.c,125 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,126 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init22:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init22
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init22
;basico12f629.c,127 :: 		lcddata=0xC0;
	MOVLW      192
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,128 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      196
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,129 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init23:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init23
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init23
;basico12f629.c,130 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,131 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init24:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init24
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init24
;basico12f629.c,134 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f629.c,135 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,136 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init25:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init25
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init25
;basico12f629.c,137 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,138 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init26:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init26
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init26
;basico12f629.c,139 :: 		lcddata=0x20 | LCD_BL;
	MOVLW      40
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,140 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      44
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,141 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init27:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init27
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init27
;basico12f629.c,142 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,143 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init28:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init28
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init28
;basico12f629.c,148 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f629.c,149 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,150 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init29:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init29
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init29
;basico12f629.c,151 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,152 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init30:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init30
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init30
;basico12f629.c,153 :: 		lcddata=0x10;
	MOVLW      16
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f629.c,154 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      20
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,155 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init31:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init31
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init31
;basico12f629.c,156 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,157 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_init32:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_init32
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_init32
;basico12f629.c,158 :: 		}
L_end_I2C_LCD_init:
	RETURN
; end of _I2C_LCD_init

_I2C_LCD_Chr:

;basico12f629.c,161 :: 		void I2C_LCD_Chr(char row, char column, char out_char)
;basico12f629.c,166 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr33
;basico12f629.c,168 :: 		case 1:
L_I2C_LCD_Chr35:
;basico12f629.c,169 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f629.c,170 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f629.c,171 :: 		case 2:
L_I2C_LCD_Chr36:
;basico12f629.c,172 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f629.c,173 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f629.c,174 :: 		case 3:
L_I2C_LCD_Chr37:
;basico12f629.c,175 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f629.c,176 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f629.c,177 :: 		case 4:
L_I2C_LCD_Chr38:
;basico12f629.c,178 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f629.c,179 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f629.c,180 :: 		}
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
;basico12f629.c,183 :: 		lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;basico12f629.c,184 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,185 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr39:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr39
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr39
;basico12f629.c,186 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,187 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr40:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr40
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr40
;basico12f629.c,189 :: 		lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
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
;basico12f629.c,190 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,191 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr41:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr41
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr41
;basico12f629.c,192 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,193 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,194 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr42:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr42
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr42
;basico12f629.c,197 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;basico12f629.c,199 :: 		void I2C_LCD_Chr_Cp(char out_char)
;basico12f629.c,202 :: 		lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0+0
	BSF        R0+0, 0
	BSF        R0+0, 3
	MOVF       R0+0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;basico12f629.c,203 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,204 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp43:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp43
;basico12f629.c,205 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,206 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp44:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp44
;basico12f629.c,208 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
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
;basico12f629.c,209 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,210 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp45:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp45
;basico12f629.c,211 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,212 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f629.c,213 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp46:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr_Cp46
;basico12f629.c,217 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Out:

;basico12f629.c,220 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;basico12f629.c,221 :: 		while(*text)
L_I2C_LCD_Out47:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out48
;basico12f629.c,222 :: 		I2C_LCD_Chr(row, col++, *text++);
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
;basico12f629.c,223 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;basico12f629.c,225 :: 		void I2C_LCD_Out_Cp(char *text) {
;basico12f629.c,226 :: 		while(*text)
L_I2C_LCD_Out_Cp49:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp50
;basico12f629.c,227 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
	INCF       FARG_I2C_LCD_Out_Cp_text+0, 1
	GOTO       L_I2C_LCD_Out_Cp49
L_I2C_LCD_Out_Cp50:
;basico12f629.c,228 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp

_main:

;basico12f629.c,231 :: 		void main() {
;basico12f629.c,234 :: 		intcon=0; //limpia registro para deshabilitar interrupcciones y banderas
	CLRF       INTCON+0
;basico12f629.c,235 :: 		ioc=0 ;
	CLRF       IOC+0
;basico12f629.c,238 :: 		OPTION_REG=0;// limpia registro opciones por seguridad
	CLRF       OPTION_REG+0
;basico12f629.c,240 :: 		TRISIO=0b000000; //salidas
	CLRF       TRISIO+0
;basico12f629.c,241 :: 		trisio.b3=1;// este pin si se usa solo puede hacerse como entrada
	BSF        TRISIO+0, 3
;basico12f629.c,243 :: 		OPTION_REG.b7=1;//habilitador glogal de las pyull up
	BSF        OPTION_REG+0, 7
;basico12f629.c,244 :: 		WPU=0; //para habilitar resistencias pull up individuasles;  cero para deshabilitarlas
	CLRF       WPU+0
;basico12f629.c,248 :: 		OSCCAL=osci;  //Carga el valor de calibracion del oscilador interno
	MOVLW      48
	MOVWF      OSCCAL+0
;basico12f629.c,250 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;basico12f629.c,253 :: 		Soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;basico12f629.c,254 :: 		Delay_ms(100);
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
;basico12f629.c,256 :: 		I2C_LCD_init();
	CALL       _I2C_LCD_init+0
;basico12f629.c,257 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f629.c,258 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f629.c,259 :: 		I2C_LCD_Out(1,1,"Hola mundo");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_basico12f629+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;basico12f629.c,260 :: 		I2C_LCD_Out(2,1,"Todo Bien");
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_basico12f629+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;basico12f629.c,263 :: 		while (1)
L_main52:
;basico12f629.c,268 :: 		}//fin while(1)
	GOTO       L_main52
;basico12f629.c,270 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
