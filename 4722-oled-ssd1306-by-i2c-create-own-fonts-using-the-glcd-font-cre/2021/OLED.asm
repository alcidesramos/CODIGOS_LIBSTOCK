
_OLED_init:

;ssd1306.c,7 :: 		void OLED_init()
;ssd1306.c,16 :: 		I2C__Init();
	MOVLW       12
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;ssd1306.c,17 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_OLED_init0:
	DECFSZ      R13, 1, 1
	BRA         L_OLED_init0
	DECFSZ      R12, 1, 1
	BRA         L_OLED_init0
	DECFSZ      R11, 1, 1
	BRA         L_OLED_init0
	NOP
	NOP
;ssd1306.c,19 :: 		OLED_clear_buffer();
	CALL        _OLED_clear_buffer+0, 0
;ssd1306.c,20 :: 		OLED_reset_sequence();
	CALL        _OLED_reset_sequence+0, 0
;ssd1306.c,22 :: 		OLED_write(0X3C, CMD);
	MOVLW       60
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,25 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_OFF) , CMD);
	MOVLW       174
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,27 :: 		OLED_write(Set_Display_Clock_CMD, CMD);
	MOVLW       213
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,28 :: 		OLED_write(0x80, CMD);
	MOVLW       128
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,30 :: 		OLED_write(Set_Multiplex_Ratio_CMD, CMD);
	MOVLW       168
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,31 :: 		OLED_write(0x3F, CMD);
	MOVLW       63
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,33 :: 		OLED_write(Set_Display_Offset_CMD, CMD);
	MOVLW       211
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,34 :: 		OLED_write(0x00, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,36 :: 		OLED_write((Set_Display_Start_Line_CMD | 0x00), CMD);
	MOVLW       64
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,38 :: 		OLED_write(Set_Charge_Pump_CMD, CMD);
	MOVLW       141
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,39 :: 		OLED_write((Set_Higher_Column_Start_Address_CMD | Enable_Charge_Pump), CMD);
	MOVLW       20
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,41 :: 		OLED_write(Set_Memory_Addressing_Mode_CMD, CMD);
	MOVLW       32
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,42 :: 		OLED_write(Page_Addressing_Mode, CMD);
	MOVLW       2
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,44 :: 		OLED_write((Set_Segment_Remap_CMD | Column_Address_0_Mapped_to_SEG127), CMD);
	MOVLW       161
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,46 :: 		OLED_write((Set_COM_Output_Scan_Direction_CMD | Scan_from_COM63_to_0), CMD);
	MOVLW       200
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,48 :: 		OLED_write(Set_Common_HW_Config_CMD, CMD);
	MOVLW       218
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,49 :: 		OLED_write(0x12, CMD);
	MOVLW       18
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,51 :: 		OLED_write(Set_Contrast_Control_CMD, CMD);
	MOVLW       129
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,52 :: 		OLED_write(0xCF, CMD);
	MOVLW       207
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,54 :: 		OLED_write(Set_Pre_charge_Period_CMD, CMD);
	MOVLW       217
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,55 :: 		OLED_write(0xF1, CMD);
	MOVLW       241
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,57 :: 		OLED_write(Set_VCOMH_Level_CMD, CMD);
	MOVLW       219
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,58 :: 		OLED_write(0x40, CMD);
	MOVLW       64
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,60 :: 		OLED_write((Set_Entire_Display_ON_CMD | Normal_Display), CMD);
	MOVLW       164
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,62 :: 		OLED_write((Set_Normal_or_Inverse_Display_CMD | Non_Inverted_Display), CMD);
	MOVLW       166
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,64 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_ON) , CMD);
	MOVLW       175
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,66 :: 		OLED_gotoxy(0, 0);
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	CLRF        FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,68 :: 		OLED_clear_screen();
	CALL        _OLED_clear_screen+0, 0
;ssd1306.c,69 :: 		}
L_end_OLED_init:
	RETURN      0
; end of _OLED_init

_OLED_reset_sequence:

;ssd1306.c,72 :: 		void OLED_reset_sequence()
;ssd1306.c,82 :: 		}
L_end_OLED_reset_sequence:
	RETURN      0
; end of _OLED_reset_sequence

_OLED_write:

;ssd1306.c,84 :: 		void OLED_write(unsigned char value, unsigned char control_byte)
;ssd1306.c,86 :: 		I2C__Start();
	CALL        _I2C1_Start+0, 0
;ssd1306.c,87 :: 		I2C__Write(SSD1306_I2C_Address);
	MOVLW       120
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,88 :: 		I2C__Write(control_byte);
	MOVF        FARG_OLED_write_control_byte+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,89 :: 		I2C__Write(value);
	MOVF        FARG_OLED_write_value+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,90 :: 		I2C__Stop();
	CALL        _I2C1_Stop+0, 0
;ssd1306.c,91 :: 		}
L_end_OLED_write:
	RETURN      0
; end of _OLED_write

_OLED_gotoxy:

;ssd1306.c,94 :: 		void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
;ssd1306.c,96 :: 		OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
	MOVF        FARG_OLED_gotoxy_y_pos+0, 0 
	ADDLW       176
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,97 :: 		OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
	MOVLW       15
	ANDWF       FARG_OLED_gotoxy_x_pos+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,98 :: 		OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
	MOVLW       240
	ANDWF       FARG_OLED_gotoxy_x_pos+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	RRCF        FARG_OLED_write_value+0, 1 
	BCF         FARG_OLED_write_value+0, 7 
	RRCF        FARG_OLED_write_value+0, 1 
	BCF         FARG_OLED_write_value+0, 7 
	RRCF        FARG_OLED_write_value+0, 1 
	BCF         FARG_OLED_write_value+0, 7 
	RRCF        FARG_OLED_write_value+0, 1 
	BCF         FARG_OLED_write_value+0, 7 
	BSF         FARG_OLED_write_value+0, 4 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,99 :: 		}
L_end_OLED_gotoxy:
	RETURN      0
; end of _OLED_gotoxy

_OLED_fill:

;ssd1306.c,102 :: 		void OLED_fill(unsigned char bmp_data)
;ssd1306.c,104 :: 		unsigned char x_pos = 0x00;
	CLRF        OLED_fill_x_pos_L0+0 
	CLRF        OLED_fill_page_L0+0 
;ssd1306.c,107 :: 		for(page = 0; page < y_max; page++)
	CLRF        OLED_fill_page_L0+0 
L_OLED_fill1:
	MOVLW       8
	SUBWF       OLED_fill_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_fill2
;ssd1306.c,109 :: 		OLED_gotoxy(x_min, page);
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	MOVF        OLED_fill_page_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,111 :: 		I2C__Start();
	CALL        _I2C1_Start+0, 0
;ssd1306.c,112 :: 		I2C__Write(SSD1306_I2C_Address);
	MOVLW       120
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,113 :: 		I2C__Write(DAT);
	MOVLW       96
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,115 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	CLRF        OLED_fill_x_pos_L0+0 
L_OLED_fill4:
	MOVLW       128
	SUBWF       OLED_fill_x_pos_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_fill5
;ssd1306.c,117 :: 		I2C__Write(bmp_data);
	MOVF        FARG_OLED_fill_bmp_data+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,115 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	INCF        OLED_fill_x_pos_L0+0, 1 
;ssd1306.c,118 :: 		}
	GOTO        L_OLED_fill4
L_OLED_fill5:
;ssd1306.c,120 :: 		I2C__Stop();
	CALL        _I2C1_Stop+0, 0
;ssd1306.c,107 :: 		for(page = 0; page < y_max; page++)
	INCF        OLED_fill_page_L0+0, 1 
;ssd1306.c,121 :: 		}
	GOTO        L_OLED_fill1
L_OLED_fill2:
;ssd1306.c,122 :: 		}
L_end_OLED_fill:
	RETURN      0
; end of _OLED_fill

_OLED_print_Image:

;ssd1306.c,125 :: 		void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
;ssd1306.c,127 :: 		unsigned char x_pos = 0;
	CLRF        OLED_print_Image_x_pos_L0+0 
	CLRF        OLED_print_Image_page_L0+0 
;ssd1306.c,130 :: 		if(pixel != OFF)
	MOVF        FARG_OLED_print_Image_pixel+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_Image7
;ssd1306.c,132 :: 		pixel = 0xFF;
	MOVLW       255
	MOVWF       FARG_OLED_print_Image_pixel+0 
;ssd1306.c,133 :: 		}
	GOTO        L_OLED_print_Image8
L_OLED_print_Image7:
;ssd1306.c,136 :: 		pixel = 0x00;
	CLRF        FARG_OLED_print_Image_pixel+0 
;ssd1306.c,137 :: 		}
L_OLED_print_Image8:
;ssd1306.c,139 :: 		for(page = 0; page < y_max; page++)
	CLRF        OLED_print_Image_page_L0+0 
L_OLED_print_Image9:
	MOVLW       8
	SUBWF       OLED_print_Image_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_Image10
;ssd1306.c,141 :: 		OLED_gotoxy(x_min, page);
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	MOVF        OLED_print_Image_page_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,143 :: 		I2C__Start();
	CALL        _I2C1_Start+0, 0
;ssd1306.c,144 :: 		I2C__Write(SSD1306_I2C_Address);
	MOVLW       120
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,145 :: 		I2C__Write(DAT);
	MOVLW       96
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ssd1306.c,147 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	CLRF        OLED_print_Image_x_pos_L0+0 
L_OLED_print_Image12:
	MOVLW       128
	SUBWF       OLED_print_Image_x_pos_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_Image13
;ssd1306.c,149 :: 		I2C__Write((*bmp++ ^ pixel));
	MOVF        FARG_OLED_print_Image_bmp+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_OLED_print_Image_bmp+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_OLED_print_Image_bmp+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        FARG_OLED_print_Image_pixel+0, 0 
	XORWF       R0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
	MOVLW       1
	ADDWF       FARG_OLED_print_Image_bmp+0, 1 
	MOVLW       0
	ADDWFC      FARG_OLED_print_Image_bmp+1, 1 
	ADDWFC      FARG_OLED_print_Image_bmp+2, 1 
;ssd1306.c,147 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	INCF        OLED_print_Image_x_pos_L0+0, 1 
;ssd1306.c,150 :: 		}
	GOTO        L_OLED_print_Image12
L_OLED_print_Image13:
;ssd1306.c,152 :: 		I2C__Stop();
	CALL        _I2C1_Stop+0, 0
;ssd1306.c,139 :: 		for(page = 0; page < y_max; page++)
	INCF        OLED_print_Image_page_L0+0, 1 
;ssd1306.c,153 :: 		}
	GOTO        L_OLED_print_Image9
L_OLED_print_Image10:
;ssd1306.c,154 :: 		}
L_end_OLED_print_Image:
	RETURN      0
; end of _OLED_print_Image

_OLED_clear_screen:

;ssd1306.c,157 :: 		void OLED_clear_screen()
;ssd1306.c,159 :: 		OLED_fill(0x00);
	CLRF        FARG_OLED_fill_bmp_data+0 
	CALL        _OLED_fill+0, 0
;ssd1306.c,160 :: 		}
L_end_OLED_clear_screen:
	RETURN      0
; end of _OLED_clear_screen

_OLED_clear_buffer:

;ssd1306.c,163 :: 		void OLED_clear_buffer()
;ssd1306.c,165 :: 		unsigned int s = 0x0000;
	CLRF        OLED_clear_buffer_s_L0+0 
	CLRF        OLED_clear_buffer_s_L0+1 
;ssd1306.c,167 :: 		for(s = 0; s < buffer_size; s++)
	CLRF        OLED_clear_buffer_s_L0+0 
	CLRF        OLED_clear_buffer_s_L0+1 
L_OLED_clear_buffer15:
	MOVLW       4
	SUBWF       OLED_clear_buffer_s_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_clear_buffer112
	MOVLW       0
	SUBWF       OLED_clear_buffer_s_L0+0, 0 
L__OLED_clear_buffer112:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_clear_buffer16
;ssd1306.c,169 :: 		buffer[s] = 0x00;
	MOVLW       _buffer+0
	ADDWF       OLED_clear_buffer_s_L0+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_buffer+0)
	ADDWFC      OLED_clear_buffer_s_L0+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;ssd1306.c,167 :: 		for(s = 0; s < buffer_size; s++)
	INFSNZ      OLED_clear_buffer_s_L0+0, 1 
	INCF        OLED_clear_buffer_s_L0+1, 1 
;ssd1306.c,170 :: 		}
	GOTO        L_OLED_clear_buffer15
L_OLED_clear_buffer16:
;ssd1306.c,171 :: 		}
L_end_OLED_clear_buffer:
	RETURN      0
; end of _OLED_clear_buffer

_OLED_cursor:

;ssd1306.c,174 :: 		void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
;ssd1306.c,176 :: 		unsigned char s = 0x00;
	CLRF        OLED_cursor_s_L0+0 
;ssd1306.c,178 :: 		if(y_pos != 0x00)
	MOVF        FARG_OLED_cursor_y_pos+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_cursor18
;ssd1306.c,180 :: 		if(x_pos == 1)
	MOVF        FARG_OLED_cursor_x_pos+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_OLED_cursor19
;ssd1306.c,182 :: 		OLED_gotoxy(0x00, (y_pos + 0x02));
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	MOVLW       2
	ADDWF       FARG_OLED_cursor_y_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,183 :: 		}
	GOTO        L_OLED_cursor20
L_OLED_cursor19:
;ssd1306.c,186 :: 		OLED_gotoxy((0x50 + ((x_pos - 0x02) * columnas)), (y_pos + 0x02));
	MOVLW       2
	SUBWF       FARG_OLED_cursor_x_pos+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MULWF       _columnas+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       80
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVLW       2
	ADDWF       FARG_OLED_cursor_y_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,187 :: 		}
L_OLED_cursor20:
;ssd1306.c,189 :: 		for(s = 0x00; s < columnas; s++)
	CLRF        OLED_cursor_s_L0+0 
L_OLED_cursor21:
	MOVF        _columnas+0, 0 
	SUBWF       OLED_cursor_s_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_cursor22
;ssd1306.c,191 :: 		OLED_write(0xFF, DAT);
	MOVLW       255
	MOVWF       FARG_OLED_write_value+0 
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,189 :: 		for(s = 0x00; s < columnas; s++)
	INCF        OLED_cursor_s_L0+0, 1 
;ssd1306.c,192 :: 		}
	GOTO        L_OLED_cursor21
L_OLED_cursor22:
;ssd1306.c,193 :: 		}
L_OLED_cursor18:
;ssd1306.c,194 :: 		}
L_end_OLED_cursor:
	RETURN      0
; end of _OLED_cursor

_OLED_draw_bitmap:

;ssd1306.c,197 :: 		void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, const unsigned char *bmp_img)
;ssd1306.c,199 :: 		unsigned int s = 0x0000;
	CLRF        OLED_draw_bitmap_s_L0+0 
	CLRF        OLED_draw_bitmap_s_L0+1 
	CLRF        OLED_draw_bitmap_x_pos_L0+0 
	CLRF        OLED_draw_bitmap_y_pos_L0+0 
;ssd1306.c,203 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
	MOVF        FARG_OLED_draw_bitmap_yb+0, 0 
	MOVWF       OLED_draw_bitmap_y_pos_L0+0 
L_OLED_draw_bitmap24:
	MOVF        OLED_draw_bitmap_y_pos_L0+0, 0 
	SUBWF       FARG_OLED_draw_bitmap_ye+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_draw_bitmap25
;ssd1306.c,205 :: 		OLED_gotoxy(xb, y_pos);
	MOVF        FARG_OLED_draw_bitmap_xb+0, 0 
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVF        OLED_draw_bitmap_y_pos_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,206 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
	MOVF        FARG_OLED_draw_bitmap_xb+0, 0 
	MOVWF       OLED_draw_bitmap_x_pos_L0+0 
L_OLED_draw_bitmap27:
	MOVF        FARG_OLED_draw_bitmap_xe+0, 0 
	SUBWF       OLED_draw_bitmap_x_pos_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_draw_bitmap28
;ssd1306.c,208 :: 		OLED_write(bmp_img[s++], DAT);
	MOVF        OLED_draw_bitmap_s_L0+0, 0 
	ADDWF       FARG_OLED_draw_bitmap_bmp_img+0, 0 
	MOVWF       TBLPTR+0 
	MOVF        OLED_draw_bitmap_s_L0+1, 0 
	ADDWFC      FARG_OLED_draw_bitmap_bmp_img+1, 0 
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      FARG_OLED_draw_bitmap_bmp_img+2, 0 
	MOVWF       TBLPTR+2 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_OLED_write_value+0
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
	INFSNZ      OLED_draw_bitmap_s_L0+0, 1 
	INCF        OLED_draw_bitmap_s_L0+1, 1 
;ssd1306.c,206 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
	INCF        OLED_draw_bitmap_x_pos_L0+0, 1 
;ssd1306.c,209 :: 		}
	GOTO        L_OLED_draw_bitmap27
L_OLED_draw_bitmap28:
;ssd1306.c,203 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
	INCF        OLED_draw_bitmap_y_pos_L0+0, 1 
;ssd1306.c,210 :: 		}
	GOTO        L_OLED_draw_bitmap24
L_OLED_draw_bitmap25:
;ssd1306.c,211 :: 		}
L_end_OLED_draw_bitmap:
	RETURN      0
; end of _OLED_draw_bitmap

_OLED_print_char:

;ssd1306.c,214 :: 		void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch,const unsigned char *font_t)
;ssd1306.c,216 :: 		unsigned char chr = 0x00;
	CLRF        OLED_print_char_chr_L0+0 
;ssd1306.c,222 :: 		columnas=font_t[0] *font_t[1] +1;
	MOVF        FARG_OLED_print_char_font_t+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_OLED_print_char_font_t+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_OLED_print_char_font_t+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       1
	ADDWF       FARG_OLED_print_char_font_t+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_OLED_print_char_font_t+1, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      FARG_OLED_print_char_font_t+2, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       TBLPTRL+0 
	MOVF        R2, 0 
	MOVWF       TBLPTRH+0 
	MOVF        R3, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R4, 0 
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       _columnas+0 
	INCF        _columnas+0, 1 
;ssd1306.c,223 :: 		columnas_med=font_t[0];
	MOVF        FARG_OLED_print_char_font_t+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_OLED_print_char_font_t+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_OLED_print_char_font_t+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	MOVWF       _columnas_med+0 
;ssd1306.c,224 :: 		page_colum=font_t[1] ;
	MOVF        R1, 0 
	MOVWF       TBLPTRL+0 
	MOVF        R2, 0 
	MOVWF       TBLPTRH+0 
	MOVF        R3, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, OLED_print_char_page_colum_L0+0
;ssd1306.c,230 :: 		chr = (ch - 32);   // reste offset de asccis
	MOVLW       32
	SUBWF       FARG_OLED_print_char_ch+0, 0 
	MOVWF       OLED_print_char_chr_L0+0 
;ssd1306.c,234 :: 		if(x_pos > (x_max - columnas_med))
	MOVF        R0, 0 
	SUBLW       128
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_char116
	MOVF        FARG_OLED_print_char_x_pos+0, 0 
	SUBWF       R1, 0 
L__OLED_print_char116:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_char30
;ssd1306.c,236 :: 		x_pos = 0x00;
	CLRF        FARG_OLED_print_char_x_pos+0 
;ssd1306.c,237 :: 		y_pos++;
	INCF        FARG_OLED_print_char_y_pos+0, 1 
;ssd1306.c,238 :: 		}
L_OLED_print_char30:
;ssd1306.c,241 :: 		if(y_pos > (y_max - page_colum))
	MOVF        OLED_print_char_page_colum_L0+0, 0 
	SUBLW       8
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_char117
	MOVF        FARG_OLED_print_char_y_pos+0, 0 
	SUBWF       R1, 0 
L__OLED_print_char117:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_char31
;ssd1306.c,243 :: 		x_pos = 0x00;
	CLRF        FARG_OLED_print_char_x_pos+0 
;ssd1306.c,244 :: 		y_pos=0;
	CLRF        FARG_OLED_print_char_y_pos+0 
;ssd1306.c,245 :: 		}
L_OLED_print_char31:
;ssd1306.c,246 :: 		posi=chr*columnas+3;   // calcula la ubicación de inicio del caracter deseado
	MOVF        OLED_print_char_chr_L0+0, 0 
	MULWF       _columnas+0 
	MOVF        PRODL+0, 0 
	MOVWF       OLED_print_char_posi_L0+0 
	MOVF        PRODH+0, 0 
	MOVWF       OLED_print_char_posi_L0+1 
	MOVLW       0
	BTFSC       OLED_print_char_posi_L0+1, 7 
	MOVLW       255
	MOVWF       OLED_print_char_posi_L0+2 
	MOVWF       OLED_print_char_posi_L0+3 
	MOVLW       3
	ADDWF       OLED_print_char_posi_L0+0, 1 
	MOVLW       0
	ADDWFC      OLED_print_char_posi_L0+1, 1 
	MOVLW       0
	BTFSC       OLED_print_char_posi_L0+1, 7 
	MOVLW       255
	MOVWF       OLED_print_char_posi_L0+2 
	MOVWF       OLED_print_char_posi_L0+3 
;ssd1306.c,248 :: 		x_pos--;
	DECF        FARG_OLED_print_char_x_pos+0, 1 
;ssd1306.c,249 :: 		for(s = 0; s < columnas_med; s++)    // for para las filas
	CLRF        OLED_print_char_s_L0+0 
	CLRF        OLED_print_char_s_L0+1 
	CLRF        OLED_print_char_s_L0+2 
	CLRF        OLED_print_char_s_L0+3 
L_OLED_print_char32:
	MOVLW       0
	SUBWF       OLED_print_char_s_L0+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_char118
	MOVLW       0
	SUBWF       OLED_print_char_s_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_char118
	MOVLW       0
	SUBWF       OLED_print_char_s_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_char118
	MOVF        _columnas_med+0, 0 
	SUBWF       OLED_print_char_s_L0+0, 0 
L__OLED_print_char118:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_char33
;ssd1306.c,251 :: 		x_pos++;
	INCF        FARG_OLED_print_char_x_pos+0, 1 
;ssd1306.c,252 :: 		for (s1=y_pos;s1<y_pos+page_colum;s1++)   // for por pagina del oles en el eje y
	MOVF        FARG_OLED_print_char_y_pos+0, 0 
	MOVWF       OLED_print_char_s1_L0+0 
L_OLED_print_char35:
	MOVF        OLED_print_char_page_colum_L0+0, 0 
	ADDWF       FARG_OLED_print_char_y_pos+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_char119
	MOVF        R1, 0 
	SUBWF       OLED_print_char_s1_L0+0, 0 
L__OLED_print_char119:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_char36
;ssd1306.c,254 :: 		OLED_gotoxy(x_pos,s1);
	MOVF        FARG_OLED_print_char_x_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVF        OLED_print_char_s1_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,255 :: 		OLED_write(font_t[posi++], DAT);
	MOVF        FARG_OLED_print_char_font_t+0, 0 
	ADDWF       OLED_print_char_posi_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVF        FARG_OLED_print_char_font_t+1, 0 
	ADDWFC      OLED_print_char_posi_L0+1, 0 
	MOVWF       TBLPTR+1 
	MOVF        FARG_OLED_print_char_font_t+2, 0 
	ADDWFC      OLED_print_char_posi_L0+2, 0 
	MOVWF       TBLPTR+2 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_OLED_write_value+0
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
	MOVLW       1
	ADDWF       OLED_print_char_posi_L0+0, 1 
	MOVLW       0
	ADDWFC      OLED_print_char_posi_L0+1, 1 
	ADDWFC      OLED_print_char_posi_L0+2, 1 
	ADDWFC      OLED_print_char_posi_L0+3, 1 
;ssd1306.c,252 :: 		for (s1=y_pos;s1<y_pos+page_colum;s1++)   // for por pagina del oles en el eje y
	INCF        OLED_print_char_s1_L0+0, 1 
;ssd1306.c,256 :: 		}
	GOTO        L_OLED_print_char35
L_OLED_print_char36:
;ssd1306.c,249 :: 		for(s = 0; s < columnas_med; s++)    // for para las filas
	MOVLW       1
	ADDWF       OLED_print_char_s_L0+0, 1 
	MOVLW       0
	ADDWFC      OLED_print_char_s_L0+1, 1 
	ADDWFC      OLED_print_char_s_L0+2, 1 
	ADDWFC      OLED_print_char_s_L0+3, 1 
;ssd1306.c,257 :: 		}
	GOTO        L_OLED_print_char32
L_OLED_print_char33:
;ssd1306.c,258 :: 		}
L_end_OLED_print_char:
	RETURN      0
; end of _OLED_print_char

_OLED_print_text:

;ssd1306.c,262 :: 		void OLED_print_text(unsigned char x_pos, unsigned char y_pos, unsigned char *ch,const unsigned char *font_t)
;ssd1306.c,264 :: 		unsigned char s = 0x00;
	CLRF        OLED_print_text_s_L0+0 
;ssd1306.c,266 :: 		do
L_OLED_print_text38:
;ssd1306.c,268 :: 		OLED_print_char(x_pos, y_pos, ch[s++],font_t);
	MOVF        FARG_OLED_print_text_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_text_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        OLED_print_text_s_L0+0, 0 
	ADDWF       FARG_OLED_print_text_ch+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_OLED_print_text_ch+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_text_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_text_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_text_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
	INCF        OLED_print_text_s_L0+0, 1 
;ssd1306.c,269 :: 		x_pos += columnas_med;
	MOVF        _columnas_med+0, 0 
	ADDWF       FARG_OLED_print_text_x_pos+0, 1 
;ssd1306.c,270 :: 		}while((ch[s] >= 0x20) && (ch[s] <= 0x7F));
	MOVF        OLED_print_text_s_L0+0, 0 
	ADDWF       FARG_OLED_print_text_ch+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_OLED_print_text_ch+1, 0 
	MOVWF       FSR0L+1 
	MOVLW       32
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__OLED_print_text100
	MOVF        OLED_print_text_s_L0+0, 0 
	ADDWF       FARG_OLED_print_text_ch+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_OLED_print_text_ch+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	SUBLW       127
	BTFSS       STATUS+0, 0 
	GOTO        L__OLED_print_text100
	GOTO        L_OLED_print_text38
L__OLED_print_text100:
;ssd1306.c,271 :: 		}
L_end_OLED_print_text:
	RETURN      0
; end of _OLED_print_text

_OLED_print_short:

;ssd1306.c,274 :: 		void OLED_print_short(unsigned char x_pos, unsigned char y_pos, signed int value,const unsigned char *font_t)
;ssd1306.c,276 :: 		unsigned char ch = 0x00;
;ssd1306.c,278 :: 		if(value < 0x00)
	MOVLW       128
	XORWF       FARG_OLED_print_short_value+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_short122
	MOVLW       0
	SUBWF       FARG_OLED_print_short_value+0, 0 
L__OLED_print_short122:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_short43
;ssd1306.c,280 :: 		OLED_print_char(x_pos, y_pos, '-',font_t);
	MOVF        FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       45
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,281 :: 		value = -value;
	MOVF        FARG_OLED_print_short_value+0, 0 
	SUBLW       0
	MOVWF       FARG_OLED_print_short_value+0 
	MOVF        FARG_OLED_print_short_value+1, 0 
	MOVWF       FARG_OLED_print_short_value+1 
	MOVLW       0
	SUBFWB      FARG_OLED_print_short_value+1, 1 
;ssd1306.c,282 :: 		}
	GOTO        L_OLED_print_short44
L_OLED_print_short43:
;ssd1306.c,285 :: 		OLED_print_char(x_pos, y_pos,' ',font_t);
	MOVF        FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,286 :: 		}
L_OLED_print_short44:
;ssd1306.c,288 :: 		if((value > 99) && (value <= 999))
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_short_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_short123
	MOVF        FARG_OLED_print_short_value+0, 0 
	SUBLW       99
L__OLED_print_short123:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_short47
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_short_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_short124
	MOVF        FARG_OLED_print_short_value+0, 0 
	SUBLW       231
L__OLED_print_short124:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_short47
L__OLED_print_short103:
;ssd1306.c,290 :: 		ch = (value / 100);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_short_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_short_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
;ssd1306.c,291 :: 		OLED_print_char((x_pos + columnas_med), y_pos , (48 + ch),font_t);
	MOVF        _columnas_med+0, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,292 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_short_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_short_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
;ssd1306.c,293 :: 		OLED_print_char((x_pos + columnas_med*2), y_pos , (48 + ch),font_t);
	MOVF        _columnas_med+0, 0 
	MOVWF       R2 
	RLCF        R2, 1 
	BCF         R2, 0 
	MOVF        R2, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,294 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_short_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_short_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;ssd1306.c,295 :: 		OLED_print_char((x_pos + columnas_med*3), y_pos , (48 + ch),font_t);
	MOVLW       3
	MULWF       _columnas_med+0 
	MOVF        PRODL+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,296 :: 		}
	GOTO        L_OLED_print_short48
L_OLED_print_short47:
;ssd1306.c,297 :: 		else if((value > 9) && (value <= 99))
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_short_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_short125
	MOVF        FARG_OLED_print_short_value+0, 0 
	SUBLW       9
L__OLED_print_short125:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_short51
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_short_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_short126
	MOVF        FARG_OLED_print_short_value+0, 0 
	SUBLW       99
L__OLED_print_short126:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_short51
L__OLED_print_short102:
;ssd1306.c,299 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_short_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_short_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
;ssd1306.c,300 :: 		OLED_print_char((x_pos + columnas_med), y_pos , (48 + ch),font_t);
	MOVF        _columnas_med+0, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,301 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_short_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_short_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;ssd1306.c,302 :: 		OLED_print_char((x_pos + columnas_med*2), y_pos , (48 + ch),font_t);
	MOVF        _columnas_med+0, 0 
	MOVWF       R2 
	RLCF        R2, 1 
	BCF         R2, 0 
	MOVF        R2, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,303 :: 		OLED_print_char((x_pos + columnas_med*3), y_pos , 32,font_t);
	MOVLW       3
	MULWF       _columnas_med+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,304 :: 		}
	GOTO        L_OLED_print_short52
L_OLED_print_short51:
;ssd1306.c,305 :: 		else if((value >= 0) && (value <= 9))
	MOVLW       128
	XORWF       FARG_OLED_print_short_value+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_short127
	MOVLW       0
	SUBWF       FARG_OLED_print_short_value+0, 0 
L__OLED_print_short127:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_short55
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_short_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_short128
	MOVF        FARG_OLED_print_short_value+0, 0 
	SUBLW       9
L__OLED_print_short128:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_short55
L__OLED_print_short101:
;ssd1306.c,307 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_short_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_short_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;ssd1306.c,308 :: 		OLED_print_char((x_pos + columnas_med), y_pos , (48 + ch),font_t);
	MOVF        _columnas_med+0, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,309 :: 		OLED_print_char((x_pos + columnas_med*2), y_pos , 32,font_t);
	MOVF        _columnas_med+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,310 :: 		OLED_print_char((x_pos + columnas_med*3), y_pos , 32,font_t);
	MOVLW       3
	MULWF       _columnas_med+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       FARG_OLED_print_short_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_short_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	MOVF        FARG_OLED_print_short_font_t+0, 0 
	MOVWF       FARG_OLED_print_char_font_t+0 
	MOVF        FARG_OLED_print_short_font_t+1, 0 
	MOVWF       FARG_OLED_print_char_font_t+1 
	MOVF        FARG_OLED_print_short_font_t+2, 0 
	MOVWF       FARG_OLED_print_char_font_t+2 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,311 :: 		}
L_OLED_print_short55:
L_OLED_print_short52:
L_OLED_print_short48:
;ssd1306.c,312 :: 		}
L_end_OLED_print_short:
	RETURN      0
; end of _OLED_print_short

_Draw_Pixel:

;ssd1306.c,317 :: 		void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
;ssd1306.c,319 :: 		unsigned char value = 0x00;
	CLRF        Draw_Pixel_value_L0+0 
	CLRF        Draw_Pixel_page_L0+0 
	CLRF        Draw_Pixel_bit_pos_L0+0 
;ssd1306.c,323 :: 		page = (y_pos / y_max);
	MOVF        FARG_Draw_Pixel_y_pos+0, 0 
	MOVWF       R3 
	RRCF        R3, 1 
	BCF         R3, 7 
	RRCF        R3, 1 
	BCF         R3, 7 
	RRCF        R3, 1 
	BCF         R3, 7 
	MOVF        R3, 0 
	MOVWF       Draw_Pixel_page_L0+0 
;ssd1306.c,324 :: 		bit_pos = (y_pos - (page * y_max));
	MOVF        R3, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	SUBWF       FARG_Draw_Pixel_y_pos+0, 0 
	MOVWF       Draw_Pixel_bit_pos_L0+0 
;ssd1306.c,325 :: 		value = buffer[((page * x_max) + x_pos)];
	MOVLW       7
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__Draw_Pixel130:
	BZ          L__Draw_Pixel131
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Draw_Pixel130
L__Draw_Pixel131:
	MOVF        FARG_Draw_Pixel_x_pos+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _buffer+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_buffer+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Draw_Pixel_value_L0+0 
;ssd1306.c,327 :: 		if((colour & YES) != NO)
	MOVLW       1
	ANDWF       FARG_Draw_Pixel_colour+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Pixel56
;ssd1306.c,329 :: 		value |= (1 << bit_pos);
	MOVF        Draw_Pixel_bit_pos_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__Draw_Pixel132:
	BZ          L__Draw_Pixel133
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__Draw_Pixel132
L__Draw_Pixel133:
	MOVF        R0, 0 
	IORWF       Draw_Pixel_value_L0+0, 1 
;ssd1306.c,330 :: 		}
	GOTO        L_Draw_Pixel57
L_Draw_Pixel56:
;ssd1306.c,333 :: 		value &= (~(1 << bit_pos));
	MOVF        Draw_Pixel_bit_pos_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__Draw_Pixel134:
	BZ          L__Draw_Pixel135
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__Draw_Pixel134
L__Draw_Pixel135:
	COMF        R0, 1 
	MOVF        R0, 0 
	ANDWF       Draw_Pixel_value_L0+0, 1 
;ssd1306.c,334 :: 		}
L_Draw_Pixel57:
;ssd1306.c,336 :: 		buffer[((page * x_max) + x_pos)] = value;
	MOVLW       7
	MOVWF       R2 
	MOVF        Draw_Pixel_page_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__Draw_Pixel136:
	BZ          L__Draw_Pixel137
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Draw_Pixel136
L__Draw_Pixel137:
	MOVF        FARG_Draw_Pixel_x_pos+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _buffer+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_buffer+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVF        Draw_Pixel_value_L0+0, 0 
	MOVWF       POSTINC1+0 
;ssd1306.c,337 :: 		OLED_gotoxy(x_pos, page);
	MOVF        FARG_Draw_Pixel_x_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVF        Draw_Pixel_page_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,338 :: 		OLED_write(value, DAT);
	MOVF        Draw_Pixel_value_L0+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,339 :: 		}
L_end_Draw_Pixel:
	RETURN      0
; end of _Draw_Pixel

_Draw_Line:

;ssd1306.c,342 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
;ssd1306.c,344 :: 		signed int dx = 0x0000;
	CLRF        Draw_Line_dx_L0+0 
	CLRF        Draw_Line_dx_L0+1 
	CLRF        Draw_Line_dy_L0+0 
	CLRF        Draw_Line_dy_L0+1 
	CLRF        Draw_Line_stepx_L0+0 
	CLRF        Draw_Line_stepx_L0+1 
	CLRF        Draw_Line_stepy_L0+0 
	CLRF        Draw_Line_stepy_L0+1 
	CLRF        Draw_Line_fraction_L0+0 
	CLRF        Draw_Line_fraction_L0+1 
;ssd1306.c,350 :: 		dy = (y2 - y1);
	MOVF        FARG_Draw_Line_y1+0, 0 
	SUBWF       FARG_Draw_Line_y2+0, 0 
	MOVWF       R1 
	MOVF        FARG_Draw_Line_y1+1, 0 
	SUBWFB      FARG_Draw_Line_y2+1, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       Draw_Line_dy_L0+0 
	MOVF        R2, 0 
	MOVWF       Draw_Line_dy_L0+1 
;ssd1306.c,351 :: 		dx = (x2 - x1);
	MOVF        FARG_Draw_Line_x1+0, 0 
	SUBWF       FARG_Draw_Line_x2+0, 0 
	MOVWF       Draw_Line_dx_L0+0 
	MOVF        FARG_Draw_Line_x1+1, 0 
	SUBWFB      FARG_Draw_Line_x2+1, 0 
	MOVWF       Draw_Line_dx_L0+1 
;ssd1306.c,353 :: 		if (dy < 0)
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line139
	MOVLW       0
	SUBWF       R1, 0 
L__Draw_Line139:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Line58
;ssd1306.c,355 :: 		dy = -dy;
	MOVF        Draw_Line_dy_L0+0, 0 
	SUBLW       0
	MOVWF       Draw_Line_dy_L0+0 
	MOVF        Draw_Line_dy_L0+1, 0 
	MOVWF       Draw_Line_dy_L0+1 
	MOVLW       0
	SUBFWB      Draw_Line_dy_L0+1, 1 
;ssd1306.c,356 :: 		stepy = -1;
	MOVLW       255
	MOVWF       Draw_Line_stepy_L0+0 
	MOVLW       255
	MOVWF       Draw_Line_stepy_L0+1 
;ssd1306.c,357 :: 		}
	GOTO        L_Draw_Line59
L_Draw_Line58:
;ssd1306.c,360 :: 		stepy = 1;
	MOVLW       1
	MOVWF       Draw_Line_stepy_L0+0 
	MOVLW       0
	MOVWF       Draw_Line_stepy_L0+1 
;ssd1306.c,361 :: 		}
L_Draw_Line59:
;ssd1306.c,363 :: 		if (dx < 0)
	MOVLW       128
	XORWF       Draw_Line_dx_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line140
	MOVLW       0
	SUBWF       Draw_Line_dx_L0+0, 0 
L__Draw_Line140:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Line60
;ssd1306.c,365 :: 		dx = -dx;
	MOVF        Draw_Line_dx_L0+0, 0 
	SUBLW       0
	MOVWF       Draw_Line_dx_L0+0 
	MOVF        Draw_Line_dx_L0+1, 0 
	MOVWF       Draw_Line_dx_L0+1 
	MOVLW       0
	SUBFWB      Draw_Line_dx_L0+1, 1 
;ssd1306.c,366 :: 		stepx = -1;
	MOVLW       255
	MOVWF       Draw_Line_stepx_L0+0 
	MOVLW       255
	MOVWF       Draw_Line_stepx_L0+1 
;ssd1306.c,367 :: 		}
	GOTO        L_Draw_Line61
L_Draw_Line60:
;ssd1306.c,370 :: 		stepx = 1;
	MOVLW       1
	MOVWF       Draw_Line_stepx_L0+0 
	MOVLW       0
	MOVWF       Draw_Line_stepx_L0+1 
;ssd1306.c,371 :: 		}
L_Draw_Line61:
;ssd1306.c,373 :: 		dx <<= 1;
	RLCF        Draw_Line_dx_L0+0, 1 
	BCF         Draw_Line_dx_L0+0, 0 
	RLCF        Draw_Line_dx_L0+1, 1 
;ssd1306.c,374 :: 		dy <<= 1;
	RLCF        Draw_Line_dy_L0+0, 1 
	BCF         Draw_Line_dy_L0+0, 0 
	RLCF        Draw_Line_dy_L0+1, 1 
;ssd1306.c,376 :: 		Draw_Pixel(x1, y1, colour);
	MOVF        FARG_Draw_Line_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Line_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Line_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,378 :: 		if(dx > dy)
	MOVLW       128
	XORWF       Draw_Line_dy_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       Draw_Line_dx_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line141
	MOVF        Draw_Line_dx_L0+0, 0 
	SUBWF       Draw_Line_dy_L0+0, 0 
L__Draw_Line141:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Line62
;ssd1306.c,380 :: 		fraction = (dy - (dx >> 1));
	MOVF        Draw_Line_dx_L0+0, 0 
	MOVWF       R0 
	MOVF        Draw_Line_dx_L0+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	MOVF        R0, 0 
	SUBWF       Draw_Line_dy_L0+0, 0 
	MOVWF       Draw_Line_fraction_L0+0 
	MOVF        R1, 0 
	SUBWFB      Draw_Line_dy_L0+1, 0 
	MOVWF       Draw_Line_fraction_L0+1 
;ssd1306.c,381 :: 		while (x1 != x2)
L_Draw_Line63:
	MOVF        FARG_Draw_Line_x1+1, 0 
	XORWF       FARG_Draw_Line_x2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line142
	MOVF        FARG_Draw_Line_x2+0, 0 
	XORWF       FARG_Draw_Line_x1+0, 0 
L__Draw_Line142:
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Line64
;ssd1306.c,383 :: 		if(fraction >= 0)
	MOVLW       128
	XORWF       Draw_Line_fraction_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line143
	MOVLW       0
	SUBWF       Draw_Line_fraction_L0+0, 0 
L__Draw_Line143:
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Line65
;ssd1306.c,385 :: 		y1 += stepy;
	MOVF        Draw_Line_stepy_L0+0, 0 
	ADDWF       FARG_Draw_Line_y1+0, 1 
	MOVF        Draw_Line_stepy_L0+1, 0 
	ADDWFC      FARG_Draw_Line_y1+1, 1 
;ssd1306.c,386 :: 		fraction -= dx;
	MOVF        Draw_Line_dx_L0+0, 0 
	SUBWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dx_L0+1, 0 
	SUBWFB      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,387 :: 		}
L_Draw_Line65:
;ssd1306.c,389 :: 		x1 += stepx;
	MOVF        Draw_Line_stepx_L0+0, 0 
	ADDWF       FARG_Draw_Line_x1+0, 0 
	MOVWF       R0 
	MOVF        Draw_Line_stepx_L0+1, 0 
	ADDWFC      FARG_Draw_Line_x1+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
;ssd1306.c,390 :: 		fraction += dy;
	MOVF        Draw_Line_dy_L0+0, 0 
	ADDWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dy_L0+1, 0 
	ADDWFC      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,392 :: 		Draw_Pixel(x1, y1, colour);
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Line_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Line_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,393 :: 		}
	GOTO        L_Draw_Line63
L_Draw_Line64:
;ssd1306.c,394 :: 		}
	GOTO        L_Draw_Line66
L_Draw_Line62:
;ssd1306.c,397 :: 		fraction = (dx - (dy >> 1));
	MOVF        Draw_Line_dy_L0+0, 0 
	MOVWF       R0 
	MOVF        Draw_Line_dy_L0+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	MOVF        R0, 0 
	SUBWF       Draw_Line_dx_L0+0, 0 
	MOVWF       Draw_Line_fraction_L0+0 
	MOVF        R1, 0 
	SUBWFB      Draw_Line_dx_L0+1, 0 
	MOVWF       Draw_Line_fraction_L0+1 
;ssd1306.c,398 :: 		while (y1 != y2)
L_Draw_Line67:
	MOVF        FARG_Draw_Line_y1+1, 0 
	XORWF       FARG_Draw_Line_y2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line144
	MOVF        FARG_Draw_Line_y2+0, 0 
	XORWF       FARG_Draw_Line_y1+0, 0 
L__Draw_Line144:
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Line68
;ssd1306.c,400 :: 		if (fraction >= 0)
	MOVLW       128
	XORWF       Draw_Line_fraction_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line145
	MOVLW       0
	SUBWF       Draw_Line_fraction_L0+0, 0 
L__Draw_Line145:
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Line69
;ssd1306.c,402 :: 		x1 += stepx;
	MOVF        Draw_Line_stepx_L0+0, 0 
	ADDWF       FARG_Draw_Line_x1+0, 1 
	MOVF        Draw_Line_stepx_L0+1, 0 
	ADDWFC      FARG_Draw_Line_x1+1, 1 
;ssd1306.c,403 :: 		fraction -= dy;
	MOVF        Draw_Line_dy_L0+0, 0 
	SUBWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dy_L0+1, 0 
	SUBWFB      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,404 :: 		}
L_Draw_Line69:
;ssd1306.c,406 :: 		y1 += stepy;
	MOVF        Draw_Line_stepy_L0+0, 0 
	ADDWF       FARG_Draw_Line_y1+0, 0 
	MOVWF       R0 
	MOVF        Draw_Line_stepy_L0+1, 0 
	ADDWFC      FARG_Draw_Line_y1+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
;ssd1306.c,407 :: 		fraction += dx;
	MOVF        Draw_Line_dx_L0+0, 0 
	ADDWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dx_L0+1, 0 
	ADDWFC      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,409 :: 		Draw_Pixel(x1, y1, colour);
	MOVF        FARG_Draw_Line_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Line_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,410 :: 		}
	GOTO        L_Draw_Line67
L_Draw_Line68:
;ssd1306.c,411 :: 		}
L_Draw_Line66:
;ssd1306.c,412 :: 		}
L_end_Draw_Line:
	RETURN      0
; end of _Draw_Line

_Draw_Rectangle:

;ssd1306.c,415 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
;ssd1306.c,417 :: 		unsigned short i = 0x00;
	CLRF        Draw_Rectangle_i_L0+0 
	CLRF        Draw_Rectangle_xmin_L0+0 
	CLRF        Draw_Rectangle_xmax_L0+0 
	CLRF        Draw_Rectangle_ymin_L0+0 
	CLRF        Draw_Rectangle_ymax_L0+0 
;ssd1306.c,423 :: 		if(fill != NO)
	MOVF        FARG_Draw_Rectangle_fill+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Rectangle70
;ssd1306.c,425 :: 		if(x1 < x2)
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_x1+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_x2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Rectangle147
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	SUBWF       FARG_Draw_Rectangle_x1+0, 0 
L__Draw_Rectangle147:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Rectangle71
;ssd1306.c,427 :: 		xmin = x1;
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       Draw_Rectangle_xmin_L0+0 
;ssd1306.c,428 :: 		xmax = x2;
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       Draw_Rectangle_xmax_L0+0 
;ssd1306.c,429 :: 		}
	GOTO        L_Draw_Rectangle72
L_Draw_Rectangle71:
;ssd1306.c,432 :: 		xmin = x2;
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       Draw_Rectangle_xmin_L0+0 
;ssd1306.c,433 :: 		xmax = x1;
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       Draw_Rectangle_xmax_L0+0 
;ssd1306.c,434 :: 		}
L_Draw_Rectangle72:
;ssd1306.c,436 :: 		if(y1 < y2)
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_y1+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_y2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Rectangle148
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	SUBWF       FARG_Draw_Rectangle_y1+0, 0 
L__Draw_Rectangle148:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Rectangle73
;ssd1306.c,438 :: 		ymin = y1;
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       Draw_Rectangle_ymin_L0+0 
;ssd1306.c,439 :: 		ymax = y2;
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       Draw_Rectangle_ymax_L0+0 
;ssd1306.c,440 :: 		}
	GOTO        L_Draw_Rectangle74
L_Draw_Rectangle73:
;ssd1306.c,443 :: 		ymin = y2;
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       Draw_Rectangle_ymin_L0+0 
;ssd1306.c,444 :: 		ymax = y1;
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       Draw_Rectangle_ymax_L0+0 
;ssd1306.c,445 :: 		}
L_Draw_Rectangle74:
;ssd1306.c,447 :: 		for(; xmin <= xmax; ++xmin)
L_Draw_Rectangle75:
	MOVF        Draw_Rectangle_xmin_L0+0, 0 
	SUBWF       Draw_Rectangle_xmax_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Rectangle76
;ssd1306.c,449 :: 		for(i = ymin; i <= ymax; ++i)
	MOVF        Draw_Rectangle_ymin_L0+0, 0 
	MOVWF       Draw_Rectangle_i_L0+0 
L_Draw_Rectangle78:
	MOVF        Draw_Rectangle_i_L0+0, 0 
	SUBWF       Draw_Rectangle_ymax_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Rectangle79
;ssd1306.c,451 :: 		Draw_Pixel(xmin, i, colour);
	MOVF        Draw_Rectangle_xmin_L0+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Rectangle_i_L0+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,449 :: 		for(i = ymin; i <= ymax; ++i)
	INCF        Draw_Rectangle_i_L0+0, 1 
;ssd1306.c,452 :: 		}
	GOTO        L_Draw_Rectangle78
L_Draw_Rectangle79:
;ssd1306.c,447 :: 		for(; xmin <= xmax; ++xmin)
	INCF        Draw_Rectangle_xmin_L0+0, 1 
;ssd1306.c,453 :: 		}
	GOTO        L_Draw_Rectangle75
L_Draw_Rectangle76:
;ssd1306.c,454 :: 		}
	GOTO        L_Draw_Rectangle81
L_Draw_Rectangle70:
;ssd1306.c,458 :: 		Draw_Line(x1, y1, x2, y1, colour);
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        FARG_Draw_Rectangle_x1+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        FARG_Draw_Rectangle_y1+1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        FARG_Draw_Rectangle_x2+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        FARG_Draw_Rectangle_y1+1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,459 :: 		Draw_Line(x1, y2, x2, y2, colour);
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        FARG_Draw_Rectangle_x1+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        FARG_Draw_Rectangle_y2+1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        FARG_Draw_Rectangle_x2+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        FARG_Draw_Rectangle_y2+1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,460 :: 		Draw_Line(x1, y1, x1, y2, colour);
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        FARG_Draw_Rectangle_x1+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        FARG_Draw_Rectangle_y1+1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        FARG_Draw_Rectangle_x1+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        FARG_Draw_Rectangle_y2+1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,461 :: 		Draw_Line(x2, y1, x2, y2, colour);
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        FARG_Draw_Rectangle_x2+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        FARG_Draw_Rectangle_y1+1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        FARG_Draw_Rectangle_x2+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        FARG_Draw_Rectangle_y2+1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,462 :: 		}
L_Draw_Rectangle81:
;ssd1306.c,464 :: 		if(type != SQUARE)
	MOVF        FARG_Draw_Rectangle_type+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Rectangle82
;ssd1306.c,466 :: 		Draw_Pixel(x1, y1, ~colour);
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,467 :: 		Draw_Pixel(x1, y2, ~colour);
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,468 :: 		Draw_Pixel(x2, y1, ~colour);
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,469 :: 		Draw_Pixel(x2, y2, ~colour);
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,470 :: 		}
L_Draw_Rectangle82:
;ssd1306.c,471 :: 		}
L_end_Draw_Rectangle:
	RETURN      0
; end of _Draw_Rectangle

_Draw_Circle:

;ssd1306.c,474 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
;ssd1306.c,476 :: 		signed int a = 0x0000;
	CLRF        Draw_Circle_a_L0+0 
	CLRF        Draw_Circle_a_L0+1 
	CLRF        Draw_Circle_b_L0+0 
	CLRF        Draw_Circle_b_L0+1 
	CLRF        Draw_Circle_P_L0+0 
	CLRF        Draw_Circle_P_L0+1 
;ssd1306.c,480 :: 		b = radius;
	MOVF        FARG_Draw_Circle_radius+0, 0 
	MOVWF       Draw_Circle_b_L0+0 
	MOVF        FARG_Draw_Circle_radius+1, 0 
	MOVWF       Draw_Circle_b_L0+1 
;ssd1306.c,481 :: 		P = (1 - b);
	MOVF        FARG_Draw_Circle_radius+0, 0 
	SUBLW       1
	MOVWF       Draw_Circle_P_L0+0 
	MOVF        FARG_Draw_Circle_radius+1, 0 
	MOVWF       Draw_Circle_P_L0+1 
	MOVLW       0
	SUBFWB      Draw_Circle_P_L0+1, 1 
;ssd1306.c,483 :: 		do
L_Draw_Circle83:
;ssd1306.c,485 :: 		if(fill != NO)
	MOVF        FARG_Draw_Circle_fill+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Circle86
;ssd1306.c,487 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        Draw_Circle_a_L0+1, 0 
	SUBWFB      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       R0 
	MOVF        Draw_Circle_b_L0+1, 0 
	ADDWFC      FARG_Draw_Circle_yc+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        Draw_Circle_a_L0+1, 0 
	ADDWFC      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,488 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        Draw_Circle_a_L0+1, 0 
	SUBWFB      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       R0 
	MOVF        Draw_Circle_b_L0+1, 0 
	SUBWFB      FARG_Draw_Circle_yc+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        Draw_Circle_a_L0+1, 0 
	ADDWFC      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,489 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        Draw_Circle_b_L0+1, 0 
	SUBWFB      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       R0 
	MOVF        Draw_Circle_a_L0+1, 0 
	ADDWFC      FARG_Draw_Circle_yc+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        Draw_Circle_b_L0+1, 0 
	ADDWFC      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,490 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x1+0 
	MOVF        Draw_Circle_b_L0+1, 0 
	SUBWFB      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x1+1 
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       R0 
	MOVF        Draw_Circle_a_L0+1, 0 
	SUBWFB      FARG_Draw_Circle_yc+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y1+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y1+1 
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Line_x2+0 
	MOVF        Draw_Circle_b_L0+1, 0 
	ADDWFC      FARG_Draw_Circle_xc+1, 0 
	MOVWF       FARG_Draw_Line_x2+1 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Line_y2+0 
	MOVF        R1, 0 
	MOVWF       FARG_Draw_Line_y2+1 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Line_colour+0 
	CALL        _Draw_Line+0, 0
;ssd1306.c,491 :: 		}
	GOTO        L_Draw_Circle87
L_Draw_Circle86:
;ssd1306.c,494 :: 		Draw_Pixel((xc + a), (yc + b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,495 :: 		Draw_Pixel((xc + b), (yc + a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,496 :: 		Draw_Pixel((xc - a), (yc + b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,497 :: 		Draw_Pixel((xc - b), (yc + a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,498 :: 		Draw_Pixel((xc + b), (yc - a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,499 :: 		Draw_Pixel((xc + a), (yc - b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,500 :: 		Draw_Pixel((xc - a), (yc - b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,501 :: 		Draw_Pixel((xc - b), (yc - a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,502 :: 		}
L_Draw_Circle87:
;ssd1306.c,504 :: 		if(P < 0)
	MOVLW       128
	XORWF       Draw_Circle_P_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Circle150
	MOVLW       0
	SUBWF       Draw_Circle_P_L0+0, 0 
L__Draw_Circle150:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Circle88
;ssd1306.c,506 :: 		P += (3 + (2 * a++));
	MOVF        Draw_Circle_a_L0+0, 0 
	MOVWF       R0 
	MOVF        Draw_Circle_a_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       3
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	ADDWF       Draw_Circle_P_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      Draw_Circle_P_L0+1, 1 
	INFSNZ      Draw_Circle_a_L0+0, 1 
	INCF        Draw_Circle_a_L0+1, 1 
;ssd1306.c,507 :: 		}
	GOTO        L_Draw_Circle89
L_Draw_Circle88:
;ssd1306.c,510 :: 		P += (5 + (2 * ((a++) - (b--))));
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       Draw_Circle_a_L0+0, 0 
	MOVWF       R3 
	MOVF        Draw_Circle_b_L0+1, 0 
	SUBWFB      Draw_Circle_a_L0+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       5
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	ADDWF       Draw_Circle_P_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      Draw_Circle_P_L0+1, 1 
	INFSNZ      Draw_Circle_a_L0+0, 1 
	INCF        Draw_Circle_a_L0+1, 1 
	MOVLW       1
	SUBWF       Draw_Circle_b_L0+0, 1 
	MOVLW       0
	SUBWFB      Draw_Circle_b_L0+1, 1 
;ssd1306.c,511 :: 		}
L_Draw_Circle89:
;ssd1306.c,512 :: 		}while(a <= b);
	MOVLW       128
	XORWF       Draw_Circle_b_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       Draw_Circle_a_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Circle151
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       Draw_Circle_b_L0+0, 0 
L__Draw_Circle151:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Circle83
;ssd1306.c,513 :: 		}
L_end_Draw_Circle:
	RETURN      0
; end of _Draw_Circle

_OLED_scroll_der:

;ssd1306.c,515 :: 		void  OLED_scroll_der(unsigned char inicio, unsigned char fin)
;ssd1306.c,517 :: 		OLED_write(RIGHT_HORIZONTAL_SCROLL, CMD);
	MOVLW       38
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,518 :: 		OLED_write(00, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,519 :: 		OLED_write(inicio, CMD);
	MOVF        FARG_OLED_scroll_der_inicio+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,520 :: 		OLED_write(0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,521 :: 		OLED_write(fin, CMD);
	MOVF        FARG_OLED_scroll_der_fin+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,522 :: 		OLED_write(0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,523 :: 		OLED_write(0xff, CMD);
	MOVLW       255
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,524 :: 		OLED_write(ACTIVATE_SCROLL, CMD);
	MOVLW       47
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,526 :: 		}
L_end_OLED_scroll_der:
	RETURN      0
; end of _OLED_scroll_der

_OLED_scroll_izq:

;ssd1306.c,528 :: 		void  OLED_scroll_izq(unsigned char inicio, unsigned char fin)
;ssd1306.c,530 :: 		OLED_write(LEFT_HORIZONTAL_SCROLL, CMD);
	MOVLW       39
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,531 :: 		OLED_write(00, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,532 :: 		OLED_write(inicio, CMD);
	MOVF        FARG_OLED_scroll_izq_inicio+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,533 :: 		OLED_write(0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,534 :: 		OLED_write(fin, CMD);
	MOVF        FARG_OLED_scroll_izq_fin+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,535 :: 		OLED_write(0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,536 :: 		OLED_write(0xff, CMD);
	MOVLW       255
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,537 :: 		OLED_write(ACTIVATE_SCROLL, CMD);
	MOVLW       47
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,539 :: 		}
L_end_OLED_scroll_izq:
	RETURN      0
; end of _OLED_scroll_izq

_OLED_scroll_diag_der:

;ssd1306.c,541 :: 		void  OLED_scroll_diag_der(unsigned char inicio, unsigned char fin)
;ssd1306.c,543 :: 		OLED_write(SET_VERTICAL_SCROLL_AREA, CMD);
	MOVLW       163
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,544 :: 		OLED_write(0x0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,545 :: 		OLED_write(y_size, CMD);
	MOVLW       64
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,546 :: 		OLED_write(VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL, CMD);
	MOVLW       41
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,547 :: 		OLED_write(0x0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,548 :: 		OLED_write(inicio, CMD);
	MOVF        FARG_OLED_scroll_diag_der_inicio+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,549 :: 		OLED_write(0x0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,550 :: 		OLED_write(fin, CMD);
	MOVF        FARG_OLED_scroll_diag_der_fin+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,551 :: 		OLED_write(0x1, CMD);
	MOVLW       1
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,552 :: 		OLED_write(ACTIVATE_SCROLL, CMD);
	MOVLW       47
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,553 :: 		}
L_end_OLED_scroll_diag_der:
	RETURN      0
; end of _OLED_scroll_diag_der

_OLED_scroll_diag_izq:

;ssd1306.c,556 :: 		void  OLED_scroll_diag_izq(unsigned char inicio, unsigned char fin)
;ssd1306.c,558 :: 		OLED_write(SET_VERTICAL_SCROLL_AREA, CMD);
	MOVLW       163
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,559 :: 		OLED_write(0x0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,560 :: 		OLED_write(y_size, CMD);
	MOVLW       64
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,561 :: 		OLED_write(VERTICAL_AND_LEFT_HORIZONTAL_SCROLL, CMD);
	MOVLW       42
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,562 :: 		OLED_write(0x0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,563 :: 		OLED_write(inicio, CMD);
	MOVF        FARG_OLED_scroll_diag_izq_inicio+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,564 :: 		OLED_write(0x0, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,565 :: 		OLED_write(fin, CMD);
	MOVF        FARG_OLED_scroll_diag_izq_fin+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,566 :: 		OLED_write(0x1, CMD);
	MOVLW       1
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,567 :: 		OLED_write(ACTIVATE_SCROLL, CMD);
	MOVLW       47
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,569 :: 		}
L_end_OLED_scroll_diag_izq:
	RETURN      0
; end of _OLED_scroll_diag_izq

_OLED_stop_scroll:

;ssd1306.c,571 :: 		void  OLED_stop_scroll()
;ssd1306.c,573 :: 		OLED_write(DEACTIVATE_SCROLL, CMD);
	MOVLW       46
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,575 :: 		}
L_end_OLED_stop_scroll:
	RETURN      0
; end of _OLED_stop_scroll

_main:

;OLED.c,27 :: 		void main()
;OLED.c,29 :: 		adcon1=0b1111; // todo dIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;OLED.c,31 :: 		OLED_init();
	CALL        _OLED_init+0, 0
;OLED.c,32 :: 		OLED_print_text(0,0,"HOLA",&font1);
	CLRF        FARG_OLED_print_text_x_pos+0 
	CLRF        FARG_OLED_print_text_y_pos+0 
	MOVLW       ?lstr1_OLED+0
	MOVWF       FARG_OLED_print_text_ch+0 
	MOVLW       hi_addr(?lstr1_OLED+0)
	MOVWF       FARG_OLED_print_text_ch+1 
	MOVLW       _font1+0
	MOVWF       FARG_OLED_print_text_font_t+0 
	MOVLW       hi_addr(_font1+0)
	MOVWF       FARG_OLED_print_text_font_t+1 
	MOVLW       higher_addr(_font1+0)
	MOVWF       FARG_OLED_print_text_font_t+2 
	CALL        _OLED_print_text+0, 0
;OLED.c,34 :: 		OLED_print_text(6,3,"ARZ",&font2);
	MOVLW       6
	MOVWF       FARG_OLED_print_text_x_pos+0 
	MOVLW       3
	MOVWF       FARG_OLED_print_text_y_pos+0 
	MOVLW       ?lstr2_OLED+0
	MOVWF       FARG_OLED_print_text_ch+0 
	MOVLW       hi_addr(?lstr2_OLED+0)
	MOVWF       FARG_OLED_print_text_ch+1 
	MOVLW       _font2+0
	MOVWF       FARG_OLED_print_text_font_t+0 
	MOVLW       hi_addr(_font2+0)
	MOVWF       FARG_OLED_print_text_font_t+1 
	MOVLW       higher_addr(_font2+0)
	MOVWF       FARG_OLED_print_text_font_t+2 
	CALL        _OLED_print_text+0, 0
;OLED.c,36 :: 		OLED_scroll_der(0,5);
	CLRF        FARG_OLED_scroll_der_inicio+0 
	MOVLW       5
	MOVWF       FARG_OLED_scroll_der_fin+0 
	CALL        _OLED_scroll_der+0, 0
;OLED.c,37 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main90:
	DECFSZ      R13, 1, 1
	BRA         L_main90
	DECFSZ      R12, 1, 1
	BRA         L_main90
	DECFSZ      R11, 1, 1
	BRA         L_main90
	NOP
	NOP
;OLED.c,38 :: 		OLED_scroll_izq(0,5);
	CLRF        FARG_OLED_scroll_izq_inicio+0 
	MOVLW       5
	MOVWF       FARG_OLED_scroll_izq_fin+0 
	CALL        _OLED_scroll_izq+0, 0
;OLED.c,39 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main91:
	DECFSZ      R13, 1, 1
	BRA         L_main91
	DECFSZ      R12, 1, 1
	BRA         L_main91
	DECFSZ      R11, 1, 1
	BRA         L_main91
	NOP
	NOP
;OLED.c,42 :: 		while(1)
L_main92:
;OLED.c,44 :: 		sprintf(texto,"%3d",cuenta++);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_3_OLED+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_3_OLED+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_3_OLED+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _cuenta+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _cuenta+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	CALL        _sprintf+0, 0
	INFSNZ      _cuenta+0, 1 
	INCF        _cuenta+1, 1 
;OLED.c,45 :: 		OLED_print_text(5,6,texto,&font1);
	MOVLW       5
	MOVWF       FARG_OLED_print_text_x_pos+0 
	MOVLW       6
	MOVWF       FARG_OLED_print_text_y_pos+0 
	MOVLW       _texto+0
	MOVWF       FARG_OLED_print_text_ch+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_OLED_print_text_ch+1 
	MOVLW       _font1+0
	MOVWF       FARG_OLED_print_text_font_t+0 
	MOVLW       hi_addr(_font1+0)
	MOVWF       FARG_OLED_print_text_font_t+1 
	MOVLW       higher_addr(_font1+0)
	MOVWF       FARG_OLED_print_text_font_t+2 
	CALL        _OLED_print_text+0, 0
;OLED.c,46 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main94:
	DECFSZ      R13, 1, 1
	BRA         L_main94
	DECFSZ      R12, 1, 1
	BRA         L_main94
	DECFSZ      R11, 1, 1
	BRA         L_main94
	NOP
	NOP
;OLED.c,48 :: 		if (cuenta==8) OLED_stop_scroll();
	MOVLW       0
	XORWF       _cuenta+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main158
	MOVLW       8
	XORWF       _cuenta+0, 0 
L__main158:
	BTFSS       STATUS+0, 2 
	GOTO        L_main95
	CALL        _OLED_stop_scroll+0, 0
L_main95:
;OLED.c,52 :: 		}
	GOTO        L_main92
;OLED.c,56 :: 		Delay_ms(1000);
L_main96:
	DECFSZ      R13, 1, 1
	BRA         L_main96
	DECFSZ      R12, 1, 1
	BRA         L_main96
	DECFSZ      R11, 1, 1
	BRA         L_main96
	NOP
;OLED.c,57 :: 		OLED_clear_screen();
	CALL        _OLED_clear_screen+0, 0
;OLED.c,61 :: 		OLED_print_Image(&truck,OFF);
	MOVLW       _truck+0
	MOVWF       FARG_OLED_print_Image_bmp+0 
	MOVLW       hi_addr(_truck+0)
	MOVWF       FARG_OLED_print_Image_bmp+1 
	MOVLW       higher_addr(_truck+0)
	MOVWF       FARG_OLED_print_Image_bmp+2 
	CLRF        FARG_OLED_print_Image_pixel+0 
	CALL        _OLED_print_Image+0, 0
;OLED.c,66 :: 		Delay_ms(3000);
	MOVLW       77
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       79
	MOVWF       R13, 0
L_main97:
	DECFSZ      R13, 1, 1
	BRA         L_main97
	DECFSZ      R12, 1, 1
	BRA         L_main97
	DECFSZ      R11, 1, 1
	BRA         L_main97
	NOP
	NOP
;OLED.c,67 :: 		OLED_clear_screen();
	CALL        _OLED_clear_screen+0, 0
;OLED.c,71 :: 		OLED_print_Image(&carsun,ON);
	MOVLW       _carsun+0
	MOVWF       FARG_OLED_print_Image_bmp+0 
	MOVLW       hi_addr(_carsun+0)
	MOVWF       FARG_OLED_print_Image_bmp+1 
	MOVLW       higher_addr(_carsun+0)
	MOVWF       FARG_OLED_print_Image_bmp+2 
	MOVLW       1
	MOVWF       FARG_OLED_print_Image_pixel+0 
	CALL        _OLED_print_Image+0, 0
;OLED.c,75 :: 		while (1)
L_main98:
;OLED.c,79 :: 		}
	GOTO        L_main98
;OLED.c,83 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
