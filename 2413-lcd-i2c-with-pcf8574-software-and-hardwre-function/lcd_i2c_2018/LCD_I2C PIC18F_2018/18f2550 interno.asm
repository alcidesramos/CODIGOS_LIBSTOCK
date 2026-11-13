
_I2C_PCF8574_Write:

;18f2550 interno.c,16 :: 		I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
;18f2550 interno.c,19 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;18f2550 interno.c,20 :: 		I2C1_Wr( Adr );
	MOVF        FARG_I2C_PCF8574_Write_Adr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;18f2550 interno.c,21 :: 		I2C1_Wr(value);
	MOVF        FARG_I2C_PCF8574_Write_value+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;18f2550 interno.c,22 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;18f2550 interno.c,23 :: 		}
L_end_I2C_PCF8574_Write:
	RETURN      0
; end of _I2C_PCF8574_Write

_I2C_LCD_Cmd:

;18f2550 interno.c,25 :: 		void I2C_LCD_Cmd(char out_char)
;18f2550 interno.c,29 :: 		lcddata = (out_char & 0xF0)|LCD_BL;
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Cmd_out_char+0, 0 
	MOVWF       R0 
	BSF         R0, 3 
	MOVF        R0, 0 
	MOVWF       I2C_LCD_Cmd_lcddata_L0+0 
;18f2550 interno.c,30 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,31 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Cmd0:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd0
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Cmd0
	NOP
;18f2550 interno.c,33 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_Cmd_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,34 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Cmd1:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd1
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Cmd1
	NOP
;18f2550 interno.c,37 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
	MOVF        FARG_I2C_LCD_Cmd_out_char+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVLW       240
	ANDWF       R0, 1 
	BSF         R0, 3 
	MOVF        R0, 0 
	MOVWF       I2C_LCD_Cmd_lcddata_L0+0 
;18f2550 interno.c,38 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,39 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Cmd2:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd2
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Cmd2
	NOP
;18f2550 interno.c,41 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_Cmd_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,42 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Cmd3:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd3
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Cmd3
	NOP
;18f2550 interno.c,44 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN      0
; end of _I2C_LCD_Cmd

_I2C_LCD_init:

;18f2550 interno.c,46 :: 		void I2C_LCD_init()
;18f2550 interno.c,52 :: 		Delay_ms(20); //retardo de inicializacion
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_I2C_LCD_init4:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init4
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init4
	DECFSZ      R11, 1, 1
	BRA         L_I2C_LCD_init4
;18f2550 interno.c,54 :: 		lcddata=0x30;
	MOVLW       48
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,55 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       52
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,56 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init5:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init5
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init5
	NOP
;18f2550 interno.c,57 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,58 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_I2C_LCD_init6:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init6
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init6
;18f2550 interno.c,60 :: 		lcddata=0x30;
	MOVLW       48
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,61 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       52
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,62 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init7:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init7
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init7
	NOP
;18f2550 interno.c,63 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,64 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_I2C_LCD_init8:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init8
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init8
;18f2550 interno.c,66 :: 		lcddata=0x30;
	MOVLW       48
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,67 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       52
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,68 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init9:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init9
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init9
	NOP
;18f2550 interno.c,69 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,70 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_I2C_LCD_init10:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init10
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init10
;18f2550 interno.c,74 :: 		lcddata=0x20;
	MOVLW       32
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,75 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       36
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,76 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init11:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init11
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init11
	NOP
;18f2550 interno.c,77 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,78 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init12:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init12
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init12
	NOP
;18f2550 interno.c,81 :: 		lcddata=0x20;
	MOVLW       32
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,82 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       36
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,83 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init13:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init13
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init13
	NOP
;18f2550 interno.c,84 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,85 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init14:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init14
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init14
	NOP
;18f2550 interno.c,86 :: 		lcddata=0x80;
	MOVLW       128
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,87 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       132
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,88 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init15:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init15
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init15
	NOP
;18f2550 interno.c,89 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,90 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_I2C_LCD_init16:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init16
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init16
;18f2550 interno.c,93 :: 		lcddata=0x00;
	CLRF        I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,94 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,95 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init17:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init17
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init17
	NOP
;18f2550 interno.c,96 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,97 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init18:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init18
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init18
	NOP
;18f2550 interno.c,98 :: 		lcddata=0x80;
	MOVLW       128
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,99 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       132
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,100 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init19:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init19
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init19
	NOP
;18f2550 interno.c,101 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,102 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init20:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init20
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init20
	NOP
;18f2550 interno.c,106 :: 		lcddata=0x00;
	CLRF        I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,107 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,108 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init21:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init21
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init21
	NOP
;18f2550 interno.c,109 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,110 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init22:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init22
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init22
	NOP
;18f2550 interno.c,111 :: 		lcddata=0xC0;
	MOVLW       192
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,112 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       196
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,113 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init23:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init23
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init23
	NOP
;18f2550 interno.c,114 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,115 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init24:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init24
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init24
	NOP
;18f2550 interno.c,118 :: 		lcddata=0x00;
	CLRF        I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,119 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,120 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init25:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init25
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init25
	NOP
;18f2550 interno.c,121 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,122 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init26:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init26
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init26
	NOP
;18f2550 interno.c,123 :: 		lcddata=0x20 | LCD_BL;
	MOVLW       40
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,124 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       44
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,125 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init27:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init27
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init27
	NOP
;18f2550 interno.c,126 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,127 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init28:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init28
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init28
	NOP
;18f2550 interno.c,132 :: 		lcddata=0x00;
	CLRF        I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,133 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,134 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init29:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init29
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init29
	NOP
;18f2550 interno.c,135 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,136 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init30:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init30
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init30
	NOP
;18f2550 interno.c,137 :: 		lcddata=0x10;
	MOVLW       16
	MOVWF       I2C_LCD_init_lcddata_L0+0 
;18f2550 interno.c,138 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       20
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,139 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init31:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init31
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init31
	NOP
;18f2550 interno.c,140 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_init_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,141 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_init32:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_init32
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_init32
	NOP
;18f2550 interno.c,142 :: 		}
L_end_I2C_LCD_init:
	RETURN      0
; end of _I2C_LCD_init

_I2C_LCD_Chr:

;18f2550 interno.c,145 :: 		void I2C_LCD_Chr(char row, char column, char out_char)
;18f2550 interno.c,150 :: 		switch(row){
	GOTO        L_I2C_LCD_Chr33
;18f2550 interno.c,152 :: 		case 1:
L_I2C_LCD_Chr35:
;18f2550 interno.c,153 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       128
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;18f2550 interno.c,154 :: 		break;
	GOTO        L_I2C_LCD_Chr34
;18f2550 interno.c,155 :: 		case 2:
L_I2C_LCD_Chr36:
;18f2550 interno.c,156 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       192
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;18f2550 interno.c,157 :: 		break;
	GOTO        L_I2C_LCD_Chr34
;18f2550 interno.c,158 :: 		case 3:
L_I2C_LCD_Chr37:
;18f2550 interno.c,159 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       148
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;18f2550 interno.c,160 :: 		break;
	GOTO        L_I2C_LCD_Chr34
;18f2550 interno.c,161 :: 		case 4:
L_I2C_LCD_Chr38:
;18f2550 interno.c,162 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       212
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;18f2550 interno.c,163 :: 		break;
	GOTO        L_I2C_LCD_Chr34
;18f2550 interno.c,164 :: 		}
L_I2C_LCD_Chr33:
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr35
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr36
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr37
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr38
L_I2C_LCD_Chr34:
;18f2550 interno.c,167 :: 		lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Chr_out_char+0, 0 
	MOVWF       R0 
	BSF         R0, 0 
	BSF         R0, 3 
	MOVF        R0, 0 
	MOVWF       I2C_LCD_Chr_lcddata_L0+0 
;18f2550 interno.c,168 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,169 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr39:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr39
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr39
	NOP
;18f2550 interno.c,170 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_Chr_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,171 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr40:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr40
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr40
	NOP
;18f2550 interno.c,173 :: 		lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
	MOVF        FARG_I2C_LCD_Chr_out_char+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVLW       240
	ANDWF       R0, 1 
	BSF         R0, 0 
	BSF         R0, 3 
	MOVF        R0, 0 
	MOVWF       I2C_LCD_Chr_lcddata_L0+0 
;18f2550 interno.c,174 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,175 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr41:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr41
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr41
	NOP
;18f2550 interno.c,176 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_Chr_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,177 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       254
	ANDWF       I2C_LCD_Chr_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,178 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr42:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr42
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr42
	NOP
;18f2550 interno.c,181 :: 		}
L_end_I2C_LCD_Chr:
	RETURN      0
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;18f2550 interno.c,183 :: 		void I2C_LCD_Chr_Cp(char out_char)
;18f2550 interno.c,186 :: 		lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Chr_Cp_out_char+0, 0 
	MOVWF       R0 
	BSF         R0, 0 
	BSF         R0, 3 
	MOVF        R0, 0 
	MOVWF       I2C_LCD_Chr_Cp_lcddata_L0+0 
;18f2550 interno.c,187 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,188 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr_Cp43:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr_Cp43
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr_Cp43
	NOP
;18f2550 interno.c,189 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_Chr_Cp_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,190 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr_Cp44:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr_Cp44
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr_Cp44
	NOP
;18f2550 interno.c,192 :: 		lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
	MOVF        FARG_I2C_LCD_Chr_Cp_out_char+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVLW       240
	ANDWF       R0, 1 
	BSF         R0, 0 
	BSF         R0, 3 
	MOVF        R0, 0 
	MOVWF       I2C_LCD_Chr_Cp_lcddata_L0+0 
;18f2550 interno.c,193 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,194 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr_Cp45:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr_Cp45
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr_Cp45
	NOP
;18f2550 interno.c,195 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       251
	ANDWF       I2C_LCD_Chr_Cp_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,196 :: 		I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
	MOVLW       78
	MOVWF       FARG_I2C_PCF8574_Write_Adr+0 
	MOVLW       254
	ANDWF       I2C_LCD_Chr_Cp_lcddata_L0+0, 0 
	MOVWF       FARG_I2C_PCF8574_Write_value+0 
	CALL        _I2C_PCF8574_Write+0, 0
;18f2550 interno.c,197 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_I2C_LCD_Chr_Cp46:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr_Cp46
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Chr_Cp46
	NOP
;18f2550 interno.c,201 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN      0
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Out:

;18f2550 interno.c,204 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;18f2550 interno.c,205 :: 		while(*text)
L_I2C_LCD_Out47:
	MOVFF       FARG_I2C_LCD_Out_text+0, FSR0
	MOVFF       FARG_I2C_LCD_Out_text+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Out48
;18f2550 interno.c,206 :: 		I2C_LCD_Chr(row, col++, *text++);
	MOVF        FARG_I2C_LCD_Out_row+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_row+0 
	MOVF        FARG_I2C_LCD_Out_col+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_column+0 
	MOVFF       FARG_I2C_LCD_Out_text+0, FSR0
	MOVFF       FARG_I2C_LCD_Out_text+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_out_char+0 
	CALL        _I2C_LCD_Chr+0, 0
	INCF        FARG_I2C_LCD_Out_col+0, 1 
	INFSNZ      FARG_I2C_LCD_Out_text+0, 1 
	INCF        FARG_I2C_LCD_Out_text+1, 1 
	GOTO        L_I2C_LCD_Out47
L_I2C_LCD_Out48:
;18f2550 interno.c,207 :: 		}
L_end_I2C_LCD_Out:
	RETURN      0
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;18f2550 interno.c,209 :: 		void I2C_LCD_Out_Cp(char *text) {
;18f2550 interno.c,210 :: 		while(*text)
L_I2C_LCD_Out_Cp49:
	MOVFF       FARG_I2C_LCD_Out_Cp_text+0, FSR0
	MOVFF       FARG_I2C_LCD_Out_Cp_text+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Out_Cp50
;18f2550 interno.c,211 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVFF       FARG_I2C_LCD_Out_Cp_text+0, FSR0
	MOVFF       FARG_I2C_LCD_Out_Cp_text+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_Cp_out_char+0 
	CALL        _I2C_LCD_Chr_Cp+0, 0
	INFSNZ      FARG_I2C_LCD_Out_Cp_text+0, 1 
	INCF        FARG_I2C_LCD_Out_Cp_text+1, 1 
	GOTO        L_I2C_LCD_Out_Cp49
L_I2C_LCD_Out_Cp50:
;18f2550 interno.c,212 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN      0
; end of _I2C_LCD_Out_Cp

_main:

;18f2550 interno.c,215 :: 		void main()
;18f2550 interno.c,220 :: 		ADCON1=0b1111;// TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;18f2550 interno.c,221 :: 		TRISB=0;
	CLRF        TRISB+0 
;18f2550 interno.c,222 :: 		trisb.b0=1;
	BSF         TRISB+0, 0 
;18f2550 interno.c,223 :: 		trisb.b1=1;
	BSF         TRISB+0, 1 
;18f2550 interno.c,224 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;18f2550 interno.c,227 :: 		I2C_LCD_init();
	CALL        _I2C_LCD_init+0, 0
;18f2550 interno.c,228 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;18f2550 interno.c,229 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;18f2550 interno.c,230 :: 		I2C_LCD_Out(1,1,"Hola mundo");
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       ?lstr1_18f2550_32interno+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(?lstr1_18f2550_32interno+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;18f2550 interno.c,231 :: 		I2C_LCD_Out(2,1,"Todo Bien");
	MOVLW       2
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       ?lstr2_18f2550_32interno+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(?lstr2_18f2550_32interno+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;18f2550 interno.c,233 :: 		LATC=0;
	CLRF        LATC+0 
;18f2550 interno.c,234 :: 		while (1)
L_main51:
;18f2550 interno.c,236 :: 		LATB7_bit=~LATB7_bit;
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;18f2550 interno.c,237 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
	NOP
	NOP
;18f2550 interno.c,238 :: 		}
	GOTO        L_main51
;18f2550 interno.c,242 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
