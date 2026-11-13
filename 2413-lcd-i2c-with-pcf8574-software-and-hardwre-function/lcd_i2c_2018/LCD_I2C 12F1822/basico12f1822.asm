
_I2C_PCF8574_Write:

;basico12f1822.c,16 :: 		I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
;basico12f1822.c,19 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;basico12f1822.c,20 :: 		I2C1_Wr( Adr );
	MOVF       FARG_I2C_PCF8574_Write_Adr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;basico12f1822.c,21 :: 		I2C1_Wr(value);
	MOVF       FARG_I2C_PCF8574_Write_value+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;basico12f1822.c,22 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;basico12f1822.c,23 :: 		}
L_end_I2C_PCF8574_Write:
	RETURN
; end of _I2C_PCF8574_Write

_I2C_LCD_Cmd:

;basico12f1822.c,25 :: 		void I2C_LCD_Cmd(char out_char)
;basico12f1822.c,29 :: 		lcddata = (out_char & 0xF0)|LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      R0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Cmd_lcddata_L0+0
;basico12f1822.c,30 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,31 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Cmd0:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Cmd0
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Cmd0
;basico12f1822.c,33 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,34 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Cmd1:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Cmd1
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Cmd1
;basico12f1822.c,37 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
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
;basico12f1822.c,38 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,39 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Cmd2:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Cmd2
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Cmd2
;basico12f1822.c,41 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Cmd_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,42 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Cmd3:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Cmd3
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Cmd3
;basico12f1822.c,44 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_init:

;basico12f1822.c,46 :: 		void I2C_LCD_init()
;basico12f1822.c,52 :: 		Delay_ms(20); //retardo de inicializacion
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_I2C_LCD_init4:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init4
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init4
	NOP
;basico12f1822.c,54 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,55 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,56 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init5:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init5
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init5
;basico12f1822.c,57 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,58 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12
	MOVLW      125
	MOVWF      R13
L_I2C_LCD_init6:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init6
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init6
;basico12f1822.c,60 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,61 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,62 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init7:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init7
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init7
;basico12f1822.c,63 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,64 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12
	MOVLW      125
	MOVWF      R13
L_I2C_LCD_init8:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init8
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init8
;basico12f1822.c,66 :: 		lcddata=0x30;
	MOVLW      48
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,67 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      52
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,68 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init9:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init9
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init9
;basico12f1822.c,69 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,70 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12
	MOVLW      125
	MOVWF      R13
L_I2C_LCD_init10:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init10
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init10
;basico12f1822.c,74 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,75 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,76 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init11:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init11
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init11
;basico12f1822.c,77 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,78 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init12:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init12
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init12
;basico12f1822.c,81 :: 		lcddata=0x20;
	MOVLW      32
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,82 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      36
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,83 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init13:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init13
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init13
;basico12f1822.c,84 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,85 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init14:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init14
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init14
;basico12f1822.c,86 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,87 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,88 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init15:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init15
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init15
;basico12f1822.c,89 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,90 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12
	MOVLW      125
	MOVWF      R13
L_I2C_LCD_init16:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init16
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init16
;basico12f1822.c,93 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,94 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,95 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init17:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init17
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init17
;basico12f1822.c,96 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,97 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init18:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init18
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init18
;basico12f1822.c,98 :: 		lcddata=0x80;
	MOVLW      128
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,99 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      132
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,100 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init19:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init19
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init19
;basico12f1822.c,101 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,102 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init20:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init20
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init20
;basico12f1822.c,106 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,107 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,108 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init21:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init21
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init21
;basico12f1822.c,109 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,110 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init22:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init22
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init22
;basico12f1822.c,111 :: 		lcddata=0xC0;
	MOVLW      192
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,112 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      196
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,113 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init23:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init23
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init23
;basico12f1822.c,114 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,115 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init24:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init24
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init24
;basico12f1822.c,118 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,119 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,120 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init25:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init25
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init25
;basico12f1822.c,121 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,122 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init26:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init26
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init26
;basico12f1822.c,123 :: 		lcddata=0x20 | LCD_BL;
	MOVLW      40
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,124 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      44
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,125 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init27:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init27
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init27
;basico12f1822.c,126 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,127 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init28:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init28
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init28
;basico12f1822.c,132 :: 		lcddata=0x00;
	CLRF       I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,133 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,134 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init29:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init29
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init29
;basico12f1822.c,135 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,136 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init30:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init30
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init30
;basico12f1822.c,137 :: 		lcddata=0x10;
	MOVLW      16
	MOVWF      I2C_LCD_init_lcddata_L0+0
;basico12f1822.c,138 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      20
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,139 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init31:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init31
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init31
;basico12f1822.c,140 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_init_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,141 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_init32:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_init32
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_init32
;basico12f1822.c,142 :: 		}
L_end_I2C_LCD_init:
	RETURN
; end of _I2C_LCD_init

_I2C_LCD_Chr:

;basico12f1822.c,145 :: 		void I2C_LCD_Chr(char row, char column, char out_char)
;basico12f1822.c,150 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr33
;basico12f1822.c,152 :: 		case 1:
L_I2C_LCD_Chr35:
;basico12f1822.c,153 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f1822.c,154 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f1822.c,155 :: 		case 2:
L_I2C_LCD_Chr36:
;basico12f1822.c,156 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f1822.c,157 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f1822.c,158 :: 		case 3:
L_I2C_LCD_Chr37:
;basico12f1822.c,159 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f1822.c,160 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f1822.c,161 :: 		case 4:
L_I2C_LCD_Chr38:
;basico12f1822.c,162 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0
	MOVF       R0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f1822.c,163 :: 		break;
	GOTO       L_I2C_LCD_Chr34
;basico12f1822.c,164 :: 		}
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
;basico12f1822.c,167 :: 		lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      R0
	BSF        R0, 0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Chr_lcddata_L0+0
;basico12f1822.c,168 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,169 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr39:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr39
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr39
;basico12f1822.c,170 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,171 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr40:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr40
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr40
;basico12f1822.c,173 :: 		lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
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
;basico12f1822.c,174 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,175 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr41:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr41
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr41
;basico12f1822.c,176 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,177 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,178 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr42:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr42
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr42
;basico12f1822.c,181 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;basico12f1822.c,183 :: 		void I2C_LCD_Chr_Cp(char out_char)
;basico12f1822.c,186 :: 		lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      R0
	BSF        R0, 0
	BSF        R0, 3
	MOVF       R0, 0
	MOVWF      I2C_LCD_Chr_Cp_lcddata_L0+0
;basico12f1822.c,187 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,188 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr_Cp43:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr_Cp43
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr_Cp43
;basico12f1822.c,189 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,190 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr_Cp44:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr_Cp44
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr_Cp44
;basico12f1822.c,192 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
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
;basico12f1822.c,193 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      4
	IORWF       R0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,194 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr_Cp45:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr_Cp45
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr_Cp45
;basico12f1822.c,195 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      251
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,196 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW      78
	MOVWF      FARG_I2C_PCF8574_Write_Adr+0
	MOVLW      254
	ANDWF      I2C_LCD_Chr_Cp_lcddata_L0+0, 0
	MOVWF      FARG_I2C_PCF8574_Write_value+0
	CALL       _I2C_PCF8574_Write+0
;basico12f1822.c,197 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12
	MOVLW      75
	MOVWF      R13
L_I2C_LCD_Chr_Cp46:
	DECFSZ     R13, 1
	GOTO       L_I2C_LCD_Chr_Cp46
	DECFSZ     R12, 1
	GOTO       L_I2C_LCD_Chr_Cp46
;basico12f1822.c,201 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Out:

;basico12f1822.c,204 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;basico12f1822.c,205 :: 		while(*text)
L_I2C_LCD_Out47:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR0L
	MOVF       FARG_I2C_LCD_Out_text+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out48
;basico12f1822.c,206 :: 		I2C_LCD_Chr(row, col++, *text++);
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
	GOTO       L_I2C_LCD_Out47
L_I2C_LCD_Out48:
;basico12f1822.c,207 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;basico12f1822.c,209 :: 		void I2C_LCD_Out_Cp(char *text) {
;basico12f1822.c,210 :: 		while(*text)
L_I2C_LCD_Out_Cp49:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR0L
	MOVF       FARG_I2C_LCD_Out_Cp_text+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp50
;basico12f1822.c,211 :: 		I2C_LCD_Chr_Cp(*text++);
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
	GOTO       L_I2C_LCD_Out_Cp49
L_I2C_LCD_Out_Cp50:
;basico12f1822.c,212 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp

_main:

;basico12f1822.c,216 :: 		void main()
;basico12f1822.c,252 :: 		INTCON=0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;basico12f1822.c,255 :: 		ansela=0;
	CLRF       ANSELA+0
;basico12f1822.c,257 :: 		TRISA0_bit=0;  //Salida PWM
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;basico12f1822.c,260 :: 		trisa=255;
	MOVLW      255
	MOVWF      TRISA+0
;basico12f1822.c,261 :: 		TRISA.B0=1;
	BSF        TRISA+0, 0
;basico12f1822.c,262 :: 		TRISA.B1=1;
	BSF        TRISA+0, 1
;basico12f1822.c,264 :: 		I2C1_Init(100000);
	MOVLW      10
	MOVWF      SSP1ADD+0
	CALL       _I2C1_Init+0
;basico12f1822.c,265 :: 		I2C_LCD_init();
	CALL       _I2C_LCD_init+0
;basico12f1822.c,266 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f1822.c,267 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;basico12f1822.c,268 :: 		I2C_LCD_Out(1,1,"Hola mundo");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_basico12f1822+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	MOVLW      hi_addr(?lstr1_basico12f1822+0)
	MOVWF      FARG_I2C_LCD_Out_text+1
	CALL       _I2C_LCD_Out+0
;basico12f1822.c,269 :: 		I2C_LCD_Out(2,1,"Todo Bien");
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_basico12f1822+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	MOVLW      hi_addr(?lstr2_basico12f1822+0)
	MOVWF      FARG_I2C_LCD_Out_text+1
	CALL       _I2C_LCD_Out+0
;basico12f1822.c,272 :: 		while (1)
L_main51:
;basico12f1822.c,277 :: 		}
	GOTO       L_main51
;basico12f1822.c,279 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
