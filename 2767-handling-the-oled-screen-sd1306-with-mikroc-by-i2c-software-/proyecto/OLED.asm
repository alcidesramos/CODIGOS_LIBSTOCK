
_OLED_init:

;ssd1306.c,6 :: 		void OLED_init()
;ssd1306.c,15 :: 		I2C__Init();
	CALL        _Soft_I2C_Init+0, 0
;ssd1306.c,16 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_OLED_init0:
	DECFSZ      R13, 1, 1
	BRA         L_OLED_init0
	DECFSZ      R12, 1, 1
	BRA         L_OLED_init0
	NOP
	NOP
;ssd1306.c,18 :: 		OLED_clear_buffer();
	CALL        _OLED_clear_buffer+0, 0
;ssd1306.c,19 :: 		OLED_reset_sequence();
	CALL        _OLED_reset_sequence+0, 0
;ssd1306.c,21 :: 		OLED_write(0X3C, CMD);
	MOVLW       60
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,24 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_OFF) , CMD);
	MOVLW       174
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,26 :: 		OLED_write(Set_Display_Clock_CMD, CMD);
	MOVLW       213
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,27 :: 		OLED_write(0x80, CMD);
	MOVLW       128
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,29 :: 		OLED_write(Set_Multiplex_Ratio_CMD, CMD);
	MOVLW       168
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,30 :: 		OLED_write(0x3F, CMD);
	MOVLW       63
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,32 :: 		OLED_write(Set_Display_Offset_CMD, CMD);
	MOVLW       211
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,33 :: 		OLED_write(0x00, CMD);
	CLRF        FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,35 :: 		OLED_write((Set_Display_Start_Line_CMD | 0x00), CMD);
	MOVLW       64
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,37 :: 		OLED_write(Set_Charge_Pump_CMD, CMD);
	MOVLW       141
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,38 :: 		OLED_write((Set_Higher_Column_Start_Address_CMD | Enable_Charge_Pump), CMD);
	MOVLW       20
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,40 :: 		OLED_write(Set_Memory_Addressing_Mode_CMD, CMD);
	MOVLW       32
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,41 :: 		OLED_write(Page_Addressing_Mode, CMD);
	MOVLW       2
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,43 :: 		OLED_write((Set_Segment_Remap_CMD | Column_Address_0_Mapped_to_SEG127), CMD);
	MOVLW       161
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,45 :: 		OLED_write((Set_COM_Output_Scan_Direction_CMD | Scan_from_COM63_to_0), CMD);
	MOVLW       200
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,47 :: 		OLED_write(Set_Common_HW_Config_CMD, CMD);
	MOVLW       218
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,48 :: 		OLED_write(0x12, CMD);
	MOVLW       18
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,50 :: 		OLED_write(Set_Contrast_Control_CMD, CMD);
	MOVLW       129
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,51 :: 		OLED_write(0xCF, CMD);
	MOVLW       207
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,53 :: 		OLED_write(Set_Pre_charge_Period_CMD, CMD);
	MOVLW       217
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,54 :: 		OLED_write(0xF1, CMD);
	MOVLW       241
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,56 :: 		OLED_write(Set_VCOMH_Level_CMD, CMD);
	MOVLW       219
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,57 :: 		OLED_write(0x40, CMD);
	MOVLW       64
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,59 :: 		OLED_write((Set_Entire_Display_ON_CMD | Normal_Display), CMD);
	MOVLW       164
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,61 :: 		OLED_write((Set_Normal_or_Inverse_Display_CMD | Non_Inverted_Display), CMD);
	MOVLW       166
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,63 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_ON) , CMD);
	MOVLW       175
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_type+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,65 :: 		OLED_gotoxy(0, 0);
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	CLRF        FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,67 :: 		OLED_clear_screen();
	CALL        _OLED_clear_screen+0, 0
;ssd1306.c,68 :: 		}
L_end_OLED_init:
	RETURN      0
; end of _OLED_init

_OLED_reset_sequence:

;ssd1306.c,71 :: 		void OLED_reset_sequence()
;ssd1306.c,81 :: 		}
L_end_OLED_reset_sequence:
	RETURN      0
; end of _OLED_reset_sequence

_OLED_write:

;ssd1306.c,83 :: 		void OLED_write(unsigned char value, unsigned char control_byte)
;ssd1306.c,85 :: 		I2C__Start();
	CALL        _Soft_I2C_Start+0, 0
;ssd1306.c,86 :: 		I2C__Write(SSD1306_I2C_Address);
	MOVLW       122
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,87 :: 		I2C__Write(control_byte);
	MOVF        FARG_OLED_write_control_byte+0, 0 
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,88 :: 		I2C__Write(value);
	MOVF        FARG_OLED_write_value+0, 0 
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,89 :: 		I2C__Stop();
	CALL        _Soft_I2C_Stop+0, 0
;ssd1306.c,90 :: 		}
L_end_OLED_write:
	RETURN      0
; end of _OLED_write

_OLED_gotoxy:

;ssd1306.c,93 :: 		void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
;ssd1306.c,95 :: 		OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
	MOVF        FARG_OLED_gotoxy_y_pos+0, 0 
	ADDLW       176
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,96 :: 		OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
	MOVLW       15
	ANDWF       FARG_OLED_gotoxy_x_pos+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	CLRF        FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,97 :: 		OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
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
;ssd1306.c,98 :: 		}
L_end_OLED_gotoxy:
	RETURN      0
; end of _OLED_gotoxy

_OLED_fill:

;ssd1306.c,101 :: 		void OLED_fill(unsigned char bmp_data)
;ssd1306.c,103 :: 		unsigned char x_pos = 0x00;
	CLRF        OLED_fill_x_pos_L0+0 
	CLRF        OLED_fill_page_L0+0 
;ssd1306.c,106 :: 		for(page = 0; page < y_max; page++)
	CLRF        OLED_fill_page_L0+0 
L_OLED_fill1:
	MOVLW       8
	SUBWF       OLED_fill_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_fill2
;ssd1306.c,108 :: 		OLED_gotoxy(x_min, page);
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	MOVF        OLED_fill_page_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,110 :: 		I2C__Start();
	CALL        _Soft_I2C_Start+0, 0
;ssd1306.c,111 :: 		I2C__Write(SSD1306_I2C_Address);
	MOVLW       122
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,112 :: 		I2C__Write(DAT);
	MOVLW       96
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,114 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	CLRF        OLED_fill_x_pos_L0+0 
L_OLED_fill4:
	MOVLW       128
	SUBWF       OLED_fill_x_pos_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_fill5
;ssd1306.c,116 :: 		I2C__Write(bmp_data);
	MOVF        FARG_OLED_fill_bmp_data+0, 0 
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,114 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	INCF        OLED_fill_x_pos_L0+0, 1 
;ssd1306.c,117 :: 		}
	GOTO        L_OLED_fill4
L_OLED_fill5:
;ssd1306.c,119 :: 		I2C__Stop();
	CALL        _Soft_I2C_Stop+0, 0
;ssd1306.c,106 :: 		for(page = 0; page < y_max; page++)
	INCF        OLED_fill_page_L0+0, 1 
;ssd1306.c,120 :: 		}
	GOTO        L_OLED_fill1
L_OLED_fill2:
;ssd1306.c,121 :: 		}
L_end_OLED_fill:
	RETURN      0
; end of _OLED_fill

_OLED_print_Image:

;ssd1306.c,124 :: 		void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
;ssd1306.c,126 :: 		unsigned char x_pos = 0;
	CLRF        OLED_print_Image_x_pos_L0+0 
	CLRF        OLED_print_Image_page_L0+0 
;ssd1306.c,129 :: 		if(pixel != OFF)
	MOVF        FARG_OLED_print_Image_pixel+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_Image7
;ssd1306.c,131 :: 		pixel = 0xFF;
	MOVLW       255
	MOVWF       FARG_OLED_print_Image_pixel+0 
;ssd1306.c,132 :: 		}
	GOTO        L_OLED_print_Image8
L_OLED_print_Image7:
;ssd1306.c,135 :: 		pixel = 0x00;
	CLRF        FARG_OLED_print_Image_pixel+0 
;ssd1306.c,136 :: 		}
L_OLED_print_Image8:
;ssd1306.c,138 :: 		for(page = 0; page < y_max; page++)
	CLRF        OLED_print_Image_page_L0+0 
L_OLED_print_Image9:
	MOVLW       8
	SUBWF       OLED_print_Image_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_Image10
;ssd1306.c,140 :: 		OLED_gotoxy(x_min, page);
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	MOVF        OLED_print_Image_page_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,142 :: 		I2C__Start();
	CALL        _Soft_I2C_Start+0, 0
;ssd1306.c,143 :: 		I2C__Write(SSD1306_I2C_Address);
	MOVLW       122
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,144 :: 		I2C__Write(DAT);
	MOVLW       96
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;ssd1306.c,146 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	CLRF        OLED_print_Image_x_pos_L0+0 
L_OLED_print_Image12:
	MOVLW       128
	SUBWF       OLED_print_Image_x_pos_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_Image13
;ssd1306.c,148 :: 		I2C__Write((*bmp++ ^ pixel));
	MOVF        FARG_OLED_print_Image_bmp+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_OLED_print_Image_bmp+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_OLED_print_Image_bmp+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        FARG_OLED_print_Image_pixel+0, 0 
	XORWF       R0, 0 
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
	MOVLW       1
	ADDWF       FARG_OLED_print_Image_bmp+0, 1 
	MOVLW       0
	ADDWFC      FARG_OLED_print_Image_bmp+1, 1 
	ADDWFC      FARG_OLED_print_Image_bmp+2, 1 
;ssd1306.c,146 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
	INCF        OLED_print_Image_x_pos_L0+0, 1 
;ssd1306.c,149 :: 		}
	GOTO        L_OLED_print_Image12
L_OLED_print_Image13:
;ssd1306.c,151 :: 		I2C__Stop();
	CALL        _Soft_I2C_Stop+0, 0
;ssd1306.c,138 :: 		for(page = 0; page < y_max; page++)
	INCF        OLED_print_Image_page_L0+0, 1 
;ssd1306.c,152 :: 		}
	GOTO        L_OLED_print_Image9
L_OLED_print_Image10:
;ssd1306.c,153 :: 		}
L_end_OLED_print_Image:
	RETURN      0
; end of _OLED_print_Image

_OLED_clear_screen:

;ssd1306.c,156 :: 		void OLED_clear_screen()
;ssd1306.c,158 :: 		OLED_fill(0x00);
	CLRF        FARG_OLED_fill_bmp_data+0 
	CALL        _OLED_fill+0, 0
;ssd1306.c,159 :: 		}
L_end_OLED_clear_screen:
	RETURN      0
; end of _OLED_clear_screen

_OLED_clear_buffer:

;ssd1306.c,162 :: 		void OLED_clear_buffer()
;ssd1306.c,164 :: 		unsigned int s = 0x0000;
	CLRF        OLED_clear_buffer_s_L0+0 
	CLRF        OLED_clear_buffer_s_L0+1 
;ssd1306.c,166 :: 		for(s = 0; s < buffer_size; s++)
	CLRF        OLED_clear_buffer_s_L0+0 
	CLRF        OLED_clear_buffer_s_L0+1 
L_OLED_clear_buffer15:
	MOVLW       4
	SUBWF       OLED_clear_buffer_s_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_clear_buffer148
	MOVLW       0
	SUBWF       OLED_clear_buffer_s_L0+0, 0 
L__OLED_clear_buffer148:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_clear_buffer16
;ssd1306.c,168 :: 		buffer[s] = 0x00;
	MOVLW       _buffer+0
	ADDWF       OLED_clear_buffer_s_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_buffer+0)
	ADDWFC      OLED_clear_buffer_s_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;ssd1306.c,166 :: 		for(s = 0; s < buffer_size; s++)
	INFSNZ      OLED_clear_buffer_s_L0+0, 1 
	INCF        OLED_clear_buffer_s_L0+1, 1 
;ssd1306.c,169 :: 		}
	GOTO        L_OLED_clear_buffer15
L_OLED_clear_buffer16:
;ssd1306.c,170 :: 		}
L_end_OLED_clear_buffer:
	RETURN      0
; end of _OLED_clear_buffer

_OLED_cursor:

;ssd1306.c,173 :: 		void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
;ssd1306.c,175 :: 		unsigned char s = 0x00;
	CLRF        OLED_cursor_s_L0+0 
;ssd1306.c,177 :: 		if(y_pos != 0x00)
	MOVF        FARG_OLED_cursor_y_pos+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_cursor18
;ssd1306.c,179 :: 		if(x_pos == 1)
	MOVF        FARG_OLED_cursor_x_pos+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_OLED_cursor19
;ssd1306.c,181 :: 		OLED_gotoxy(0x00, (y_pos + 0x02));
	CLRF        FARG_OLED_gotoxy_x_pos+0 
	MOVLW       2
	ADDWF       FARG_OLED_cursor_y_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,182 :: 		}
	GOTO        L_OLED_cursor20
L_OLED_cursor19:
;ssd1306.c,185 :: 		OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
	MOVLW       2
	SUBWF       FARG_OLED_cursor_x_pos+0, 0 
	MOVWF       R0 
	MOVLW       6
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       80
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVLW       2
	ADDWF       FARG_OLED_cursor_y_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,186 :: 		}
L_OLED_cursor20:
;ssd1306.c,188 :: 		for(s = 0x00; s < 0x06; s++)
	CLRF        OLED_cursor_s_L0+0 
L_OLED_cursor21:
	MOVLW       6
	SUBWF       OLED_cursor_s_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_cursor22
;ssd1306.c,190 :: 		OLED_write(0xFF, DAT);
	MOVLW       255
	MOVWF       FARG_OLED_write_value+0 
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,188 :: 		for(s = 0x00; s < 0x06; s++)
	INCF        OLED_cursor_s_L0+0, 1 
;ssd1306.c,191 :: 		}
	GOTO        L_OLED_cursor21
L_OLED_cursor22:
;ssd1306.c,192 :: 		}
L_OLED_cursor18:
;ssd1306.c,193 :: 		}
L_end_OLED_cursor:
	RETURN      0
; end of _OLED_cursor

_OLED_draw_bitmap:

;ssd1306.c,196 :: 		void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, const unsigned char *bmp_img)
;ssd1306.c,198 :: 		unsigned int s = 0x0000;
	CLRF        OLED_draw_bitmap_s_L0+0 
	CLRF        OLED_draw_bitmap_s_L0+1 
	CLRF        OLED_draw_bitmap_x_pos_L0+0 
	CLRF        OLED_draw_bitmap_y_pos_L0+0 
;ssd1306.c,202 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
	MOVF        FARG_OLED_draw_bitmap_yb+0, 0 
	MOVWF       OLED_draw_bitmap_y_pos_L0+0 
L_OLED_draw_bitmap24:
	MOVF        OLED_draw_bitmap_y_pos_L0+0, 0 
	SUBWF       FARG_OLED_draw_bitmap_ye+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_draw_bitmap25
;ssd1306.c,204 :: 		OLED_gotoxy(xb, y_pos);
	MOVF        FARG_OLED_draw_bitmap_xb+0, 0 
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVF        OLED_draw_bitmap_y_pos_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,205 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
	MOVF        FARG_OLED_draw_bitmap_xb+0, 0 
	MOVWF       OLED_draw_bitmap_x_pos_L0+0 
L_OLED_draw_bitmap27:
	MOVF        FARG_OLED_draw_bitmap_xe+0, 0 
	SUBWF       OLED_draw_bitmap_x_pos_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_draw_bitmap28
;ssd1306.c,207 :: 		OLED_write(bmp_img[s++], DAT);
	MOVF        OLED_draw_bitmap_s_L0+0, 0 
	ADDWF       FARG_OLED_draw_bitmap_bmp_img+0, 0 
	MOVWF       TBLPTRL 
	MOVF        OLED_draw_bitmap_s_L0+1, 0 
	ADDWFC      FARG_OLED_draw_bitmap_bmp_img+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_OLED_draw_bitmap_bmp_img+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_OLED_write_value+0
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
	INFSNZ      OLED_draw_bitmap_s_L0+0, 1 
	INCF        OLED_draw_bitmap_s_L0+1, 1 
;ssd1306.c,205 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
	INCF        OLED_draw_bitmap_x_pos_L0+0, 1 
;ssd1306.c,208 :: 		}
	GOTO        L_OLED_draw_bitmap27
L_OLED_draw_bitmap28:
;ssd1306.c,202 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
	INCF        OLED_draw_bitmap_y_pos_L0+0, 1 
;ssd1306.c,209 :: 		}
	GOTO        L_OLED_draw_bitmap24
L_OLED_draw_bitmap25:
;ssd1306.c,210 :: 		}
L_end_OLED_draw_bitmap:
	RETURN      0
; end of _OLED_draw_bitmap

_OLED_print_char:

;ssd1306.c,213 :: 		void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
;ssd1306.c,215 :: 		unsigned char chr = 0x00;
	CLRF        OLED_print_char_chr_L0+0 
	CLRF        OLED_print_char_s_L0+0 
;ssd1306.c,218 :: 		chr = (ch - 0x20);
	MOVLW       32
	SUBWF       FARG_OLED_print_char_ch+0, 0 
	MOVWF       OLED_print_char_chr_L0+0 
;ssd1306.c,220 :: 		if(x_pos > (x_max - 0x06))
	MOVLW       128
	XORLW       0
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_char152
	MOVF        FARG_OLED_print_char_x_pos+0, 0 
	SUBLW       122
L__OLED_print_char152:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_char30
;ssd1306.c,222 :: 		x_pos = 0x00;
	CLRF        FARG_OLED_print_char_x_pos+0 
;ssd1306.c,223 :: 		y_pos++;
	INCF        FARG_OLED_print_char_y_pos+0, 1 
;ssd1306.c,224 :: 		}
L_OLED_print_char30:
;ssd1306.c,225 :: 		OLED_gotoxy(x_pos, y_pos);
	MOVF        FARG_OLED_print_char_x_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVF        FARG_OLED_print_char_y_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,227 :: 		for(s = 0x00; s < 0x06; s++)
	CLRF        OLED_print_char_s_L0+0 
L_OLED_print_char31:
	MOVLW       6
	SUBWF       OLED_print_char_s_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_char32
;ssd1306.c,229 :: 		OLED_write(font_regular[chr][s], DAT);
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        OLED_print_char_chr_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _font_regular+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_font_regular+0)
	ADDWFC      R1, 1 
	MOVLW       higher_addr(_font_regular+0)
	ADDWFC      R2, 1 
	MOVF        OLED_print_char_s_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_OLED_write_value+0
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,227 :: 		for(s = 0x00; s < 0x06; s++)
	INCF        OLED_print_char_s_L0+0, 1 
;ssd1306.c,230 :: 		}
	GOTO        L_OLED_print_char31
L_OLED_print_char32:
;ssd1306.c,231 :: 		}
L_end_OLED_print_char:
	RETURN      0
; end of _OLED_print_char

_OLED_print_string:

;ssd1306.c,234 :: 		void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
;ssd1306.c,236 :: 		unsigned char s = 0x00;
	CLRF        OLED_print_string_s_L0+0 
;ssd1306.c,238 :: 		do
L_OLED_print_string34:
;ssd1306.c,240 :: 		OLED_print_char(x_pos, y_pos, ch[s++]);
	MOVF        FARG_OLED_print_string_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_string_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        OLED_print_string_s_L0+0, 0 
	ADDWF       FARG_OLED_print_string_ch+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_OLED_print_string_ch+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
	INCF        OLED_print_string_s_L0+0, 1 
;ssd1306.c,241 :: 		x_pos += 0x06;
	MOVLW       6
	ADDWF       FARG_OLED_print_string_x_pos+0, 1 
;ssd1306.c,242 :: 		}while((ch[s] >= 0x20) && (ch[s] <= 0x7F));
	MOVF        OLED_print_string_s_L0+0, 0 
	ADDWF       FARG_OLED_print_string_ch+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_OLED_print_string_ch+1, 0 
	MOVWF       FSR0H 
	MOVLW       32
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__OLED_print_string129
	MOVF        OLED_print_string_s_L0+0, 0 
	ADDWF       FARG_OLED_print_string_ch+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_OLED_print_string_ch+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	SUBLW       127
	BTFSS       STATUS+0, 0 
	GOTO        L__OLED_print_string129
	GOTO        L_OLED_print_string34
L__OLED_print_string129:
;ssd1306.c,243 :: 		}
L_end_OLED_print_string:
	RETURN      0
; end of _OLED_print_string

_OLED_print_chr:

;ssd1306.c,246 :: 		void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
;ssd1306.c,248 :: 		unsigned char ch = 0x00;
;ssd1306.c,250 :: 		if(value < 0x00)
	MOVLW       128
	XORWF       FARG_OLED_print_chr_value+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_chr155
	MOVLW       0
	SUBWF       FARG_OLED_print_chr_value+0, 0 
L__OLED_print_chr155:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_chr39
;ssd1306.c,252 :: 		OLED_print_char(x_pos, y_pos, '-');
	MOVF        FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       45
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,253 :: 		value = -value;
	MOVF        FARG_OLED_print_chr_value+0, 0 
	SUBLW       0
	MOVWF       FARG_OLED_print_chr_value+0 
	MOVF        FARG_OLED_print_chr_value+1, 0 
	MOVWF       FARG_OLED_print_chr_value+1 
	MOVLW       0
	SUBFWB      FARG_OLED_print_chr_value+1, 1 
;ssd1306.c,254 :: 		}
	GOTO        L_OLED_print_chr40
L_OLED_print_chr39:
;ssd1306.c,257 :: 		OLED_print_char(x_pos, y_pos,' ');
	MOVF        FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,258 :: 		}
L_OLED_print_chr40:
;ssd1306.c,260 :: 		if((value > 99) && (value <= 999))
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_chr_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_chr156
	MOVF        FARG_OLED_print_chr_value+0, 0 
	SUBLW       99
L__OLED_print_chr156:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_chr43
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_chr_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_chr157
	MOVF        FARG_OLED_print_chr_value+0, 0 
	SUBLW       231
L__OLED_print_chr157:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_chr43
L__OLED_print_chr132:
;ssd1306.c,262 :: 		ch = (value / 100);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_chr_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_chr_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
;ssd1306.c,263 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,264 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_chr_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_chr_value+1, 0 
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
;ssd1306.c,265 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
	MOVLW       12
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,266 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_chr_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_chr_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;ssd1306.c,267 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
	MOVLW       18
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,268 :: 		}
	GOTO        L_OLED_print_chr44
L_OLED_print_chr43:
;ssd1306.c,269 :: 		else if((value > 9) && (value <= 99))
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_chr_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_chr158
	MOVF        FARG_OLED_print_chr_value+0, 0 
	SUBLW       9
L__OLED_print_chr158:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_chr47
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_chr_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_chr159
	MOVF        FARG_OLED_print_chr_value+0, 0 
	SUBLW       99
L__OLED_print_chr159:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_chr47
L__OLED_print_chr131:
;ssd1306.c,271 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_chr_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_chr_value+1, 0 
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
;ssd1306.c,272 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,273 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_chr_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_chr_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;ssd1306.c,274 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
	MOVLW       12
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,275 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
	MOVLW       18
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,276 :: 		}
	GOTO        L_OLED_print_chr48
L_OLED_print_chr47:
;ssd1306.c,277 :: 		else if((value >= 0) && (value <= 9))
	MOVLW       128
	XORWF       FARG_OLED_print_chr_value+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_chr160
	MOVLW       0
	SUBWF       FARG_OLED_print_chr_value+0, 0 
L__OLED_print_chr160:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_chr51
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_chr_value+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_chr161
	MOVF        FARG_OLED_print_chr_value+0, 0 
	SUBLW       9
L__OLED_print_chr161:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_chr51
L__OLED_print_chr130:
;ssd1306.c,279 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_chr_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_chr_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;ssd1306.c,280 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,281 :: 		OLED_print_char((x_pos + 12), y_pos , 32);
	MOVLW       12
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,282 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
	MOVLW       18
	ADDWF       FARG_OLED_print_chr_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_chr_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,283 :: 		}
L_OLED_print_chr51:
L_OLED_print_chr48:
L_OLED_print_chr44:
;ssd1306.c,284 :: 		}
L_end_OLED_print_chr:
	RETURN      0
; end of _OLED_print_chr

_OLED_print_int:

;ssd1306.c,287 :: 		void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
;ssd1306.c,289 :: 		unsigned char ch = 0x00;
;ssd1306.c,291 :: 		if(value < 0)
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int163
	MOVLW       0
	SUBWF       FARG_OLED_print_int_value+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int163
	MOVLW       0
	SUBWF       FARG_OLED_print_int_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int163
	MOVLW       0
	SUBWF       FARG_OLED_print_int_value+0, 0 
L__OLED_print_int163:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_int52
;ssd1306.c,293 :: 		OLED_print_char(x_pos, y_pos, '-');
	MOVF        FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       45
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,294 :: 		value = -value;
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBWF       R0, 1 
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBWFB      R1, 1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBWFB      R2, 1 
	MOVF        FARG_OLED_print_int_value+3, 0 
	SUBWFB      R3, 1 
	MOVF        R0, 0 
	MOVWF       FARG_OLED_print_int_value+0 
	MOVF        R1, 0 
	MOVWF       FARG_OLED_print_int_value+1 
	MOVF        R2, 0 
	MOVWF       FARG_OLED_print_int_value+2 
	MOVF        R3, 0 
	MOVWF       FARG_OLED_print_int_value+3 
;ssd1306.c,295 :: 		}
	GOTO        L_OLED_print_int53
L_OLED_print_int52:
;ssd1306.c,298 :: 		OLED_print_char(x_pos, y_pos,' ');
	MOVF        FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,299 :: 		}
L_OLED_print_int53:
;ssd1306.c,301 :: 		if(value > 9999)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int164
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int164
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBLW       39
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int164
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBLW       15
L__OLED_print_int164:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_int54
;ssd1306.c,303 :: 		ch = (value / 10000);
	MOVLW       16
	MOVWF       R4 
	MOVLW       39
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,304 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,306 :: 		ch = ((value % 10000)/ 1000);
	MOVLW       16
	MOVWF       R4 
	MOVLW       39
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,307 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
	MOVLW       12
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,309 :: 		ch = ((value % 1000) / 100);
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,310 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
	MOVLW       18
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,312 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,313 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
	MOVLW       24
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,315 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
;ssd1306.c,316 :: 		OLED_print_char((x_pos + 30), y_pos , (48 + ch));
	MOVLW       30
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,317 :: 		}
	GOTO        L_OLED_print_int55
L_OLED_print_int54:
;ssd1306.c,319 :: 		else if((value > 999) && (value <= 9999))
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int165
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int165
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int165
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBLW       231
L__OLED_print_int165:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_int58
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int166
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int166
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBLW       39
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int166
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBLW       15
L__OLED_print_int166:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_int58
L__OLED_print_int135:
;ssd1306.c,321 :: 		ch = ((value % 10000)/ 1000);
	MOVLW       16
	MOVWF       R4 
	MOVLW       39
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,322 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,324 :: 		ch = ((value % 1000) / 100);
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,325 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
	MOVLW       12
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,327 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,328 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
	MOVLW       18
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,330 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
;ssd1306.c,331 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
	MOVLW       24
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,332 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
	MOVLW       30
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,333 :: 		}
	GOTO        L_OLED_print_int59
L_OLED_print_int58:
;ssd1306.c,334 :: 		else if((value > 99) && (value <= 999))
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int167
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int167
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int167
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBLW       99
L__OLED_print_int167:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_int62
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int168
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int168
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int168
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBLW       231
L__OLED_print_int168:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_int62
L__OLED_print_int134:
;ssd1306.c,336 :: 		ch = ((value % 1000) / 100);
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,337 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,339 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,340 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
	MOVLW       12
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,342 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
;ssd1306.c,343 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
	MOVLW       18
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,344 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
	MOVLW       24
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,345 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
	MOVLW       30
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,346 :: 		}
	GOTO        L_OLED_print_int63
L_OLED_print_int62:
;ssd1306.c,347 :: 		else if((value > 9) && (value <= 99))
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int169
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int169
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int169
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBLW       9
L__OLED_print_int169:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_int66
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_OLED_print_int_value+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int170
	MOVF        FARG_OLED_print_int_value+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int170
	MOVF        FARG_OLED_print_int_value+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_int170
	MOVF        FARG_OLED_print_int_value+0, 0 
	SUBLW       99
L__OLED_print_int170:
	BTFSS       STATUS+0, 0 
	GOTO        L_OLED_print_int66
L__OLED_print_int133:
;ssd1306.c,349 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
;ssd1306.c,350 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,352 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
;ssd1306.c,353 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
	MOVLW       12
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,355 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
	MOVLW       18
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,356 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
	MOVLW       24
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,357 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
	MOVLW       30
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,358 :: 		}
	GOTO        L_OLED_print_int67
L_OLED_print_int66:
;ssd1306.c,361 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_OLED_print_int_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_int_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_int_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_int_value+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
;ssd1306.c,362 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,363 :: 		OLED_print_char((x_pos + 12), y_pos , 32);
	MOVLW       12
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,364 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
	MOVLW       18
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,365 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
	MOVLW       24
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,366 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
	MOVLW       30
	ADDWF       FARG_OLED_print_int_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_int_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,367 :: 		}
L_OLED_print_int67:
L_OLED_print_int63:
L_OLED_print_int59:
L_OLED_print_int55:
;ssd1306.c,368 :: 		}
L_end_OLED_print_int:
	RETURN      0
; end of _OLED_print_int

_OLED_print_decimal:

;ssd1306.c,371 :: 		void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
;ssd1306.c,373 :: 		unsigned char ch = 0x00;
;ssd1306.c,375 :: 		OLED_print_char(x_pos, y_pos, '.');
	MOVF        FARG_OLED_print_decimal_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_decimal_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       46
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,377 :: 		ch = (value / 1000);
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_OLED_print_decimal_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_decimal_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
;ssd1306.c,378 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
	MOVLW       6
	ADDWF       FARG_OLED_print_decimal_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_decimal_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,380 :: 		if(points > 1)
	MOVF        FARG_OLED_print_decimal_points+0, 0 
	SUBLW       1
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_decimal68
;ssd1306.c,382 :: 		ch = ((value % 1000) / 100);
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_OLED_print_decimal_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_decimal_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
;ssd1306.c,383 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
	MOVLW       12
	ADDWF       FARG_OLED_print_decimal_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_decimal_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,386 :: 		if(points > 2)
	MOVF        FARG_OLED_print_decimal_points+0, 0 
	SUBLW       2
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_decimal69
;ssd1306.c,388 :: 		ch = ((value % 100) / 10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_decimal_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_decimal_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
;ssd1306.c,389 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
	MOVLW       18
	ADDWF       FARG_OLED_print_decimal_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_decimal_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,391 :: 		if(points > 3)
	MOVF        FARG_OLED_print_decimal_points+0, 0 
	SUBLW       3
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_decimal70
;ssd1306.c,393 :: 		ch = (value % 10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_OLED_print_decimal_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_decimal_value+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;ssd1306.c,394 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
	MOVLW       24
	ADDWF       FARG_OLED_print_decimal_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_decimal_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,395 :: 		}
L_OLED_print_decimal70:
;ssd1306.c,396 :: 		}
L_OLED_print_decimal69:
;ssd1306.c,397 :: 		}
L_OLED_print_decimal68:
;ssd1306.c,398 :: 		}
L_end_OLED_print_decimal:
	RETURN      0
; end of _OLED_print_decimal

_OLED_print_float:

;ssd1306.c,401 :: 		void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
;ssd1306.c,403 :: 		signed long tmp = 0x00;
	CLRF        OLED_print_float_tmp_L0+0 
	CLRF        OLED_print_float_tmp_L0+1 
	CLRF        OLED_print_float_tmp_L0+2 
	CLRF        OLED_print_float_tmp_L0+3 
;ssd1306.c,405 :: 		tmp = value;
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       OLED_print_float_tmp_L0+0 
	MOVF        R1, 0 
	MOVWF       OLED_print_float_tmp_L0+1 
	MOVF        R2, 0 
	MOVWF       OLED_print_float_tmp_L0+2 
	MOVF        R3, 0 
	MOVWF       OLED_print_float_tmp_L0+3 
;ssd1306.c,406 :: 		OLED_print_int(x_pos, y_pos, tmp);
	MOVF        FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_int_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_int_y_pos+0 
	MOVF        R0, 0 
	MOVWF       FARG_OLED_print_int_value+0 
	MOVF        R1, 0 
	MOVWF       FARG_OLED_print_int_value+1 
	MOVF        R2, 0 
	MOVWF       FARG_OLED_print_int_value+2 
	MOVF        R3, 0 
	MOVWF       FARG_OLED_print_int_value+3 
	CALL        _OLED_print_int+0, 0
;ssd1306.c,407 :: 		tmp = ((value - tmp) * 10000);
	MOVF        OLED_print_float_tmp_L0+0, 0 
	MOVWF       R0 
	MOVF        OLED_print_float_tmp_L0+1, 0 
	MOVWF       R1 
	MOVF        OLED_print_float_tmp_L0+2, 0 
	MOVWF       R2 
	MOVF        OLED_print_float_tmp_L0+3, 0 
	MOVWF       R3 
	CALL        _longint2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       OLED_print_float_tmp_L0+0 
	MOVF        R1, 0 
	MOVWF       OLED_print_float_tmp_L0+1 
	MOVF        R2, 0 
	MOVWF       OLED_print_float_tmp_L0+2 
	MOVF        R3, 0 
	MOVWF       OLED_print_float_tmp_L0+3 
;ssd1306.c,409 :: 		if(tmp < 0)
	MOVLW       128
	XORWF       R3, 0 
	MOVWF       R4 
	MOVLW       128
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_float173
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_float173
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OLED_print_float173
	MOVLW       0
	SUBWF       R0, 0 
L__OLED_print_float173:
	BTFSC       STATUS+0, 0 
	GOTO        L_OLED_print_float71
;ssd1306.c,411 :: 		tmp = -tmp;
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVF        OLED_print_float_tmp_L0+0, 0 
	SUBWF       R0, 1 
	MOVF        OLED_print_float_tmp_L0+1, 0 
	SUBWFB      R1, 1 
	MOVF        OLED_print_float_tmp_L0+2, 0 
	SUBWFB      R2, 1 
	MOVF        OLED_print_float_tmp_L0+3, 0 
	SUBWFB      R3, 1 
	MOVF        R0, 0 
	MOVWF       OLED_print_float_tmp_L0+0 
	MOVF        R1, 0 
	MOVWF       OLED_print_float_tmp_L0+1 
	MOVF        R2, 0 
	MOVWF       OLED_print_float_tmp_L0+2 
	MOVF        R3, 0 
	MOVWF       OLED_print_float_tmp_L0+3 
;ssd1306.c,412 :: 		}
L_OLED_print_float71:
;ssd1306.c,414 :: 		if((value >= 9999) && (value < 99999))
	MOVLW       0
	MOVWF       R4 
	MOVLW       60
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float74
	MOVLW       128
	MOVWF       R4 
	MOVLW       79
	MOVWF       R5 
	MOVLW       67
	MOVWF       R6 
	MOVLW       143
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float74
L__OLED_print_float139:
;ssd1306.c,416 :: 		OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
	MOVLW       36
	ADDWF       FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_y_pos+0 
	MOVF        OLED_print_float_tmp_L0+0, 0 
	MOVWF       FARG_OLED_print_decimal_value+0 
	MOVF        OLED_print_float_tmp_L0+1, 0 
	MOVWF       FARG_OLED_print_decimal_value+1 
	MOVF        FARG_OLED_print_float_points+0, 0 
	MOVWF       FARG_OLED_print_decimal_points+0 
	CALL        _OLED_print_decimal+0, 0
;ssd1306.c,417 :: 		}
	GOTO        L_OLED_print_float75
L_OLED_print_float74:
;ssd1306.c,418 :: 		else if((value >= 999) && (value < 9999))
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float78
	MOVLW       0
	MOVWF       R4 
	MOVLW       60
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float78
L__OLED_print_float138:
;ssd1306.c,420 :: 		OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
	MOVLW       30
	ADDWF       FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_y_pos+0 
	MOVF        OLED_print_float_tmp_L0+0, 0 
	MOVWF       FARG_OLED_print_decimal_value+0 
	MOVF        OLED_print_float_tmp_L0+1, 0 
	MOVWF       FARG_OLED_print_decimal_value+1 
	MOVF        FARG_OLED_print_float_points+0, 0 
	MOVWF       FARG_OLED_print_decimal_points+0 
	CALL        _OLED_print_decimal+0, 0
;ssd1306.c,421 :: 		}
	GOTO        L_OLED_print_float79
L_OLED_print_float78:
;ssd1306.c,422 :: 		else if((value >= 99) && (value < 999))
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       70
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float82
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float82
L__OLED_print_float137:
;ssd1306.c,424 :: 		OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
	MOVLW       24
	ADDWF       FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_y_pos+0 
	MOVF        OLED_print_float_tmp_L0+0, 0 
	MOVWF       FARG_OLED_print_decimal_value+0 
	MOVF        OLED_print_float_tmp_L0+1, 0 
	MOVWF       FARG_OLED_print_decimal_value+1 
	MOVF        FARG_OLED_print_float_points+0, 0 
	MOVWF       FARG_OLED_print_decimal_points+0 
	CALL        _OLED_print_decimal+0, 0
;ssd1306.c,425 :: 		}
	GOTO        L_OLED_print_float83
L_OLED_print_float82:
;ssd1306.c,426 :: 		else if((value >= 9) && (value < 99))
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       16
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float86
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       70
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float86
L__OLED_print_float136:
;ssd1306.c,428 :: 		OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
	MOVLW       18
	ADDWF       FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_y_pos+0 
	MOVF        OLED_print_float_tmp_L0+0, 0 
	MOVWF       FARG_OLED_print_decimal_value+0 
	MOVF        OLED_print_float_tmp_L0+1, 0 
	MOVWF       FARG_OLED_print_decimal_value+1 
	MOVF        FARG_OLED_print_float_points+0, 0 
	MOVWF       FARG_OLED_print_decimal_points+0 
	CALL        _OLED_print_decimal+0, 0
;ssd1306.c,429 :: 		}
	GOTO        L_OLED_print_float87
L_OLED_print_float86:
;ssd1306.c,430 :: 		else if(value < 9)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       16
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float88
;ssd1306.c,432 :: 		OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
	MOVLW       12
	ADDWF       FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_decimal_y_pos+0 
	MOVF        OLED_print_float_tmp_L0+0, 0 
	MOVWF       FARG_OLED_print_decimal_value+0 
	MOVF        OLED_print_float_tmp_L0+1, 0 
	MOVWF       FARG_OLED_print_decimal_value+1 
	MOVF        FARG_OLED_print_float_points+0, 0 
	MOVWF       FARG_OLED_print_decimal_points+0 
	CALL        _OLED_print_decimal+0, 0
;ssd1306.c,433 :: 		if((value) < 0)
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        FARG_OLED_print_float_value+0, 0 
	MOVWF       R0 
	MOVF        FARG_OLED_print_float_value+1, 0 
	MOVWF       R1 
	MOVF        FARG_OLED_print_float_value+2, 0 
	MOVWF       R2 
	MOVF        FARG_OLED_print_float_value+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_OLED_print_float89
;ssd1306.c,435 :: 		OLED_print_char(x_pos, y_pos, '-');
	MOVF        FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       45
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,436 :: 		}
	GOTO        L_OLED_print_float90
L_OLED_print_float89:
;ssd1306.c,439 :: 		OLED_print_char(x_pos, y_pos, ' ');
	MOVF        FARG_OLED_print_float_x_pos+0, 0 
	MOVWF       FARG_OLED_print_char_x_pos+0 
	MOVF        FARG_OLED_print_float_y_pos+0, 0 
	MOVWF       FARG_OLED_print_char_y_pos+0 
	MOVLW       32
	MOVWF       FARG_OLED_print_char_ch+0 
	CALL        _OLED_print_char+0, 0
;ssd1306.c,440 :: 		}
L_OLED_print_float90:
;ssd1306.c,441 :: 		}
L_OLED_print_float88:
L_OLED_print_float87:
L_OLED_print_float83:
L_OLED_print_float79:
L_OLED_print_float75:
;ssd1306.c,442 :: 		}
L_end_OLED_print_float:
	RETURN      0
; end of _OLED_print_float

_Draw_Pixel:

;ssd1306.c,445 :: 		void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
;ssd1306.c,447 :: 		unsigned char value = 0x00;
	CLRF        Draw_Pixel_value_L0+0 
	CLRF        Draw_Pixel_page_L0+0 
	CLRF        Draw_Pixel_bit_pos_L0+0 
;ssd1306.c,451 :: 		page = (y_pos / y_max);
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
;ssd1306.c,452 :: 		bit_pos = (y_pos - (page * y_max));
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
;ssd1306.c,453 :: 		value = buffer[((page * x_max) + x_pos)];
	MOVLW       7
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__Draw_Pixel175:
	BZ          L__Draw_Pixel176
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Draw_Pixel175
L__Draw_Pixel176:
	MOVF        FARG_Draw_Pixel_x_pos+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _buffer+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_buffer+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       Draw_Pixel_value_L0+0 
;ssd1306.c,455 :: 		if((colour & YES) != NO)
	MOVLW       1
	ANDWF       FARG_Draw_Pixel_colour+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Pixel91
;ssd1306.c,457 :: 		value |= (1 << bit_pos);
	MOVF        Draw_Pixel_bit_pos_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__Draw_Pixel177:
	BZ          L__Draw_Pixel178
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__Draw_Pixel177
L__Draw_Pixel178:
	MOVF        R0, 0 
	IORWF       Draw_Pixel_value_L0+0, 1 
;ssd1306.c,458 :: 		}
	GOTO        L_Draw_Pixel92
L_Draw_Pixel91:
;ssd1306.c,461 :: 		value &= (~(1 << bit_pos));
	MOVF        Draw_Pixel_bit_pos_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__Draw_Pixel179:
	BZ          L__Draw_Pixel180
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__Draw_Pixel179
L__Draw_Pixel180:
	COMF        R0, 1 
	MOVF        R0, 0 
	ANDWF       Draw_Pixel_value_L0+0, 1 
;ssd1306.c,462 :: 		}
L_Draw_Pixel92:
;ssd1306.c,464 :: 		buffer[((page * x_max) + x_pos)] = value;
	MOVLW       7
	MOVWF       R2 
	MOVF        Draw_Pixel_page_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__Draw_Pixel181:
	BZ          L__Draw_Pixel182
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Draw_Pixel181
L__Draw_Pixel182:
	MOVF        FARG_Draw_Pixel_x_pos+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _buffer+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_buffer+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        Draw_Pixel_value_L0+0, 0 
	MOVWF       POSTINC1+0 
;ssd1306.c,465 :: 		OLED_gotoxy(x_pos, page);
	MOVF        FARG_Draw_Pixel_x_pos+0, 0 
	MOVWF       FARG_OLED_gotoxy_x_pos+0 
	MOVF        Draw_Pixel_page_L0+0, 0 
	MOVWF       FARG_OLED_gotoxy_y_pos+0 
	CALL        _OLED_gotoxy+0, 0
;ssd1306.c,466 :: 		OLED_write(value, DAT);
	MOVF        Draw_Pixel_value_L0+0, 0 
	MOVWF       FARG_OLED_write_value+0 
	MOVLW       96
	MOVWF       FARG_OLED_write_control_byte+0 
	CALL        _OLED_write+0, 0
;ssd1306.c,467 :: 		}
L_end_Draw_Pixel:
	RETURN      0
; end of _Draw_Pixel

_Draw_Line:

;ssd1306.c,470 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
;ssd1306.c,472 :: 		signed int dx = 0x0000;
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
;ssd1306.c,478 :: 		dy = (y2 - y1);
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
;ssd1306.c,479 :: 		dx = (x2 - x1);
	MOVF        FARG_Draw_Line_x1+0, 0 
	SUBWF       FARG_Draw_Line_x2+0, 0 
	MOVWF       Draw_Line_dx_L0+0 
	MOVF        FARG_Draw_Line_x1+1, 0 
	SUBWFB      FARG_Draw_Line_x2+1, 0 
	MOVWF       Draw_Line_dx_L0+1 
;ssd1306.c,481 :: 		if (dy < 0)
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line184
	MOVLW       0
	SUBWF       R1, 0 
L__Draw_Line184:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Line93
;ssd1306.c,483 :: 		dy = -dy;
	MOVF        Draw_Line_dy_L0+0, 0 
	SUBLW       0
	MOVWF       Draw_Line_dy_L0+0 
	MOVF        Draw_Line_dy_L0+1, 0 
	MOVWF       Draw_Line_dy_L0+1 
	MOVLW       0
	SUBFWB      Draw_Line_dy_L0+1, 1 
;ssd1306.c,484 :: 		stepy = -1;
	MOVLW       255
	MOVWF       Draw_Line_stepy_L0+0 
	MOVLW       255
	MOVWF       Draw_Line_stepy_L0+1 
;ssd1306.c,485 :: 		}
	GOTO        L_Draw_Line94
L_Draw_Line93:
;ssd1306.c,488 :: 		stepy = 1;
	MOVLW       1
	MOVWF       Draw_Line_stepy_L0+0 
	MOVLW       0
	MOVWF       Draw_Line_stepy_L0+1 
;ssd1306.c,489 :: 		}
L_Draw_Line94:
;ssd1306.c,491 :: 		if (dx < 0)
	MOVLW       128
	XORWF       Draw_Line_dx_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line185
	MOVLW       0
	SUBWF       Draw_Line_dx_L0+0, 0 
L__Draw_Line185:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Line95
;ssd1306.c,493 :: 		dx = -dx;
	MOVF        Draw_Line_dx_L0+0, 0 
	SUBLW       0
	MOVWF       Draw_Line_dx_L0+0 
	MOVF        Draw_Line_dx_L0+1, 0 
	MOVWF       Draw_Line_dx_L0+1 
	MOVLW       0
	SUBFWB      Draw_Line_dx_L0+1, 1 
;ssd1306.c,494 :: 		stepx = -1;
	MOVLW       255
	MOVWF       Draw_Line_stepx_L0+0 
	MOVLW       255
	MOVWF       Draw_Line_stepx_L0+1 
;ssd1306.c,495 :: 		}
	GOTO        L_Draw_Line96
L_Draw_Line95:
;ssd1306.c,498 :: 		stepx = 1;
	MOVLW       1
	MOVWF       Draw_Line_stepx_L0+0 
	MOVLW       0
	MOVWF       Draw_Line_stepx_L0+1 
;ssd1306.c,499 :: 		}
L_Draw_Line96:
;ssd1306.c,501 :: 		dx <<= 1;
	RLCF        Draw_Line_dx_L0+0, 1 
	BCF         Draw_Line_dx_L0+0, 0 
	RLCF        Draw_Line_dx_L0+1, 1 
;ssd1306.c,502 :: 		dy <<= 1;
	RLCF        Draw_Line_dy_L0+0, 1 
	BCF         Draw_Line_dy_L0+0, 0 
	RLCF        Draw_Line_dy_L0+1, 1 
;ssd1306.c,504 :: 		Draw_Pixel(x1, y1, colour);
	MOVF        FARG_Draw_Line_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Line_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Line_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,506 :: 		if(dx > dy)
	MOVLW       128
	XORWF       Draw_Line_dy_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       Draw_Line_dx_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line186
	MOVF        Draw_Line_dx_L0+0, 0 
	SUBWF       Draw_Line_dy_L0+0, 0 
L__Draw_Line186:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Line97
;ssd1306.c,508 :: 		fraction = (dy - (dx >> 1));
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
;ssd1306.c,509 :: 		while (x1 != x2)
L_Draw_Line98:
	MOVF        FARG_Draw_Line_x1+1, 0 
	XORWF       FARG_Draw_Line_x2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line187
	MOVF        FARG_Draw_Line_x2+0, 0 
	XORWF       FARG_Draw_Line_x1+0, 0 
L__Draw_Line187:
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Line99
;ssd1306.c,511 :: 		if(fraction >= 0)
	MOVLW       128
	XORWF       Draw_Line_fraction_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line188
	MOVLW       0
	SUBWF       Draw_Line_fraction_L0+0, 0 
L__Draw_Line188:
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Line100
;ssd1306.c,513 :: 		y1 += stepy;
	MOVF        Draw_Line_stepy_L0+0, 0 
	ADDWF       FARG_Draw_Line_y1+0, 1 
	MOVF        Draw_Line_stepy_L0+1, 0 
	ADDWFC      FARG_Draw_Line_y1+1, 1 
;ssd1306.c,514 :: 		fraction -= dx;
	MOVF        Draw_Line_dx_L0+0, 0 
	SUBWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dx_L0+1, 0 
	SUBWFB      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,515 :: 		}
L_Draw_Line100:
;ssd1306.c,517 :: 		x1 += stepx;
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
;ssd1306.c,518 :: 		fraction += dy;
	MOVF        Draw_Line_dy_L0+0, 0 
	ADDWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dy_L0+1, 0 
	ADDWFC      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,520 :: 		Draw_Pixel(x1, y1, colour);
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Line_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Line_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,521 :: 		}
	GOTO        L_Draw_Line98
L_Draw_Line99:
;ssd1306.c,522 :: 		}
	GOTO        L_Draw_Line101
L_Draw_Line97:
;ssd1306.c,525 :: 		fraction = (dx - (dy >> 1));
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
;ssd1306.c,526 :: 		while (y1 != y2)
L_Draw_Line102:
	MOVF        FARG_Draw_Line_y1+1, 0 
	XORWF       FARG_Draw_Line_y2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line189
	MOVF        FARG_Draw_Line_y2+0, 0 
	XORWF       FARG_Draw_Line_y1+0, 0 
L__Draw_Line189:
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Line103
;ssd1306.c,528 :: 		if (fraction >= 0)
	MOVLW       128
	XORWF       Draw_Line_fraction_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Line190
	MOVLW       0
	SUBWF       Draw_Line_fraction_L0+0, 0 
L__Draw_Line190:
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Line104
;ssd1306.c,530 :: 		x1 += stepx;
	MOVF        Draw_Line_stepx_L0+0, 0 
	ADDWF       FARG_Draw_Line_x1+0, 1 
	MOVF        Draw_Line_stepx_L0+1, 0 
	ADDWFC      FARG_Draw_Line_x1+1, 1 
;ssd1306.c,531 :: 		fraction -= dy;
	MOVF        Draw_Line_dy_L0+0, 0 
	SUBWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dy_L0+1, 0 
	SUBWFB      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,532 :: 		}
L_Draw_Line104:
;ssd1306.c,534 :: 		y1 += stepy;
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
;ssd1306.c,535 :: 		fraction += dx;
	MOVF        Draw_Line_dx_L0+0, 0 
	ADDWF       Draw_Line_fraction_L0+0, 1 
	MOVF        Draw_Line_dx_L0+1, 0 
	ADDWFC      Draw_Line_fraction_L0+1, 1 
;ssd1306.c,537 :: 		Draw_Pixel(x1, y1, colour);
	MOVF        FARG_Draw_Line_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        R0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Line_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,538 :: 		}
	GOTO        L_Draw_Line102
L_Draw_Line103:
;ssd1306.c,539 :: 		}
L_Draw_Line101:
;ssd1306.c,540 :: 		}
L_end_Draw_Line:
	RETURN      0
; end of _Draw_Line

_Draw_Rectangle:

;ssd1306.c,543 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
;ssd1306.c,545 :: 		unsigned short i = 0x00;
	CLRF        Draw_Rectangle_i_L0+0 
	CLRF        Draw_Rectangle_xmin_L0+0 
	CLRF        Draw_Rectangle_xmax_L0+0 
	CLRF        Draw_Rectangle_ymin_L0+0 
	CLRF        Draw_Rectangle_ymax_L0+0 
;ssd1306.c,551 :: 		if(fill != NO)
	MOVF        FARG_Draw_Rectangle_fill+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Rectangle105
;ssd1306.c,553 :: 		if(x1 < x2)
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_x1+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_x2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Rectangle192
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	SUBWF       FARG_Draw_Rectangle_x1+0, 0 
L__Draw_Rectangle192:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Rectangle106
;ssd1306.c,555 :: 		xmin = x1;
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       Draw_Rectangle_xmin_L0+0 
;ssd1306.c,556 :: 		xmax = x2;
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       Draw_Rectangle_xmax_L0+0 
;ssd1306.c,557 :: 		}
	GOTO        L_Draw_Rectangle107
L_Draw_Rectangle106:
;ssd1306.c,560 :: 		xmin = x2;
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       Draw_Rectangle_xmin_L0+0 
;ssd1306.c,561 :: 		xmax = x1;
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       Draw_Rectangle_xmax_L0+0 
;ssd1306.c,562 :: 		}
L_Draw_Rectangle107:
;ssd1306.c,564 :: 		if(y1 < y2)
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_y1+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_Draw_Rectangle_y2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Rectangle193
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	SUBWF       FARG_Draw_Rectangle_y1+0, 0 
L__Draw_Rectangle193:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Rectangle108
;ssd1306.c,566 :: 		ymin = y1;
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       Draw_Rectangle_ymin_L0+0 
;ssd1306.c,567 :: 		ymax = y2;
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       Draw_Rectangle_ymax_L0+0 
;ssd1306.c,568 :: 		}
	GOTO        L_Draw_Rectangle109
L_Draw_Rectangle108:
;ssd1306.c,571 :: 		ymin = y2;
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       Draw_Rectangle_ymin_L0+0 
;ssd1306.c,572 :: 		ymax = y1;
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       Draw_Rectangle_ymax_L0+0 
;ssd1306.c,573 :: 		}
L_Draw_Rectangle109:
;ssd1306.c,575 :: 		for(; xmin <= xmax; ++xmin)
L_Draw_Rectangle110:
	MOVF        Draw_Rectangle_xmin_L0+0, 0 
	SUBWF       Draw_Rectangle_xmax_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Rectangle111
;ssd1306.c,577 :: 		for(i = ymin; i <= ymax; ++i)
	MOVF        Draw_Rectangle_ymin_L0+0, 0 
	MOVWF       Draw_Rectangle_i_L0+0 
L_Draw_Rectangle113:
	MOVF        Draw_Rectangle_i_L0+0, 0 
	SUBWF       Draw_Rectangle_ymax_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Draw_Rectangle114
;ssd1306.c,579 :: 		Draw_Pixel(xmin, i, colour);
	MOVF        Draw_Rectangle_xmin_L0+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Rectangle_i_L0+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,577 :: 		for(i = ymin; i <= ymax; ++i)
	INCF        Draw_Rectangle_i_L0+0, 1 
;ssd1306.c,580 :: 		}
	GOTO        L_Draw_Rectangle113
L_Draw_Rectangle114:
;ssd1306.c,575 :: 		for(; xmin <= xmax; ++xmin)
	INCF        Draw_Rectangle_xmin_L0+0, 1 
;ssd1306.c,581 :: 		}
	GOTO        L_Draw_Rectangle110
L_Draw_Rectangle111:
;ssd1306.c,582 :: 		}
	GOTO        L_Draw_Rectangle116
L_Draw_Rectangle105:
;ssd1306.c,586 :: 		Draw_Line(x1, y1, x2, y1, colour);
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
;ssd1306.c,587 :: 		Draw_Line(x1, y2, x2, y2, colour);
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
;ssd1306.c,588 :: 		Draw_Line(x1, y1, x1, y2, colour);
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
;ssd1306.c,589 :: 		Draw_Line(x2, y1, x2, y2, colour);
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
;ssd1306.c,590 :: 		}
L_Draw_Rectangle116:
;ssd1306.c,592 :: 		if(type != SQUARE)
	MOVF        FARG_Draw_Rectangle_type+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Rectangle117
;ssd1306.c,594 :: 		Draw_Pixel(x1, y1, ~colour);
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,595 :: 		Draw_Pixel(x1, y2, ~colour);
	MOVF        FARG_Draw_Rectangle_x1+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,596 :: 		Draw_Pixel(x2, y1, ~colour);
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y1+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,597 :: 		Draw_Pixel(x2, y2, ~colour);
	MOVF        FARG_Draw_Rectangle_x2+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        FARG_Draw_Rectangle_y2+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	COMF        FARG_Draw_Rectangle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,598 :: 		}
L_Draw_Rectangle117:
;ssd1306.c,599 :: 		}
L_end_Draw_Rectangle:
	RETURN      0
; end of _Draw_Rectangle

_Draw_Circle:

;ssd1306.c,602 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
;ssd1306.c,604 :: 		signed int a = 0x0000;
	CLRF        Draw_Circle_a_L0+0 
	CLRF        Draw_Circle_a_L0+1 
	CLRF        Draw_Circle_b_L0+0 
	CLRF        Draw_Circle_b_L0+1 
	CLRF        Draw_Circle_P_L0+0 
	CLRF        Draw_Circle_P_L0+1 
;ssd1306.c,608 :: 		b = radius;
	MOVF        FARG_Draw_Circle_radius+0, 0 
	MOVWF       Draw_Circle_b_L0+0 
	MOVF        FARG_Draw_Circle_radius+1, 0 
	MOVWF       Draw_Circle_b_L0+1 
;ssd1306.c,609 :: 		P = (1 - b);
	MOVF        FARG_Draw_Circle_radius+0, 0 
	SUBLW       1
	MOVWF       Draw_Circle_P_L0+0 
	MOVF        FARG_Draw_Circle_radius+1, 0 
	MOVWF       Draw_Circle_P_L0+1 
	MOVLW       0
	SUBFWB      Draw_Circle_P_L0+1, 1 
;ssd1306.c,611 :: 		do
L_Draw_Circle118:
;ssd1306.c,613 :: 		if(fill != NO)
	MOVF        FARG_Draw_Circle_fill+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Draw_Circle121
;ssd1306.c,615 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
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
;ssd1306.c,616 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
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
;ssd1306.c,617 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
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
;ssd1306.c,618 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
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
;ssd1306.c,619 :: 		}
	GOTO        L_Draw_Circle122
L_Draw_Circle121:
;ssd1306.c,622 :: 		Draw_Pixel((xc + a), (yc + b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,623 :: 		Draw_Pixel((xc + b), (yc + a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,624 :: 		Draw_Pixel((xc - a), (yc + b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,625 :: 		Draw_Pixel((xc - b), (yc + a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,626 :: 		Draw_Pixel((xc + b), (yc - a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,627 :: 		Draw_Pixel((xc + a), (yc - b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	ADDWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,628 :: 		Draw_Pixel((xc - a), (yc - b), colour);
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,629 :: 		Draw_Pixel((xc - b), (yc - a), colour);
	MOVF        Draw_Circle_b_L0+0, 0 
	SUBWF       FARG_Draw_Circle_xc+0, 0 
	MOVWF       FARG_Draw_Pixel_x_pos+0 
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       FARG_Draw_Circle_yc+0, 0 
	MOVWF       FARG_Draw_Pixel_y_pos+0 
	MOVF        FARG_Draw_Circle_colour+0, 0 
	MOVWF       FARG_Draw_Pixel_colour+0 
	CALL        _Draw_Pixel+0, 0
;ssd1306.c,630 :: 		}
L_Draw_Circle122:
;ssd1306.c,632 :: 		if(P < 0)
	MOVLW       128
	XORWF       Draw_Circle_P_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Circle195
	MOVLW       0
	SUBWF       Draw_Circle_P_L0+0, 0 
L__Draw_Circle195:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Circle123
;ssd1306.c,634 :: 		P += (3 + (2 * a++));
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
;ssd1306.c,635 :: 		}
	GOTO        L_Draw_Circle124
L_Draw_Circle123:
;ssd1306.c,638 :: 		P += (5 + (2 * ((a++) - (b--))));
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
;ssd1306.c,639 :: 		}
L_Draw_Circle124:
;ssd1306.c,640 :: 		}while(a <= b);
	MOVLW       128
	XORWF       Draw_Circle_b_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       Draw_Circle_a_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Draw_Circle196
	MOVF        Draw_Circle_a_L0+0, 0 
	SUBWF       Draw_Circle_b_L0+0, 0 
L__Draw_Circle196:
	BTFSC       STATUS+0, 0 
	GOTO        L_Draw_Circle118
;ssd1306.c,641 :: 		}
L_end_Draw_Circle:
	RETURN      0
; end of _Draw_Circle

_main:

;OLED.c,26 :: 		void main()
;OLED.c,28 :: 		adcon1=0b1111; // todo dIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;OLED.c,30 :: 		OLED_init();
	CALL        _OLED_init+0, 0
;OLED.c,31 :: 		OLED_print_string(0,0,"HOLA");
	CLRF        FARG_OLED_print_string_x_pos+0 
	CLRF        FARG_OLED_print_string_y_pos+0 
	MOVLW       ?lstr1_OLED+0
	MOVWF       FARG_OLED_print_string_ch+0 
	MOVLW       hi_addr(?lstr1_OLED+0)
	MOVWF       FARG_OLED_print_string_ch+1 
	CALL        _OLED_print_string+0, 0
;OLED.c,33 :: 		OLED_print_string(0,7,"probando");
	CLRF        FARG_OLED_print_string_x_pos+0 
	MOVLW       7
	MOVWF       FARG_OLED_print_string_y_pos+0 
	MOVLW       ?lstr2_OLED+0
	MOVWF       FARG_OLED_print_string_ch+0 
	MOVLW       hi_addr(?lstr2_OLED+0)
	MOVWF       FARG_OLED_print_string_ch+1 
	CALL        _OLED_print_string+0, 0
;OLED.c,34 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main125:
	DECFSZ      R13, 1, 1
	BRA         L_main125
	DECFSZ      R12, 1, 1
	BRA         L_main125
	DECFSZ      R11, 1, 1
	BRA         L_main125
	NOP
	NOP
;OLED.c,35 :: 		OLED_clear_screen();
	CALL        _OLED_clear_screen+0, 0
;OLED.c,39 :: 		OLED_print_Image(&truck,OFF);
	MOVLW       _truck+0
	MOVWF       FARG_OLED_print_Image_bmp+0 
	MOVLW       hi_addr(_truck+0)
	MOVWF       FARG_OLED_print_Image_bmp+1 
	MOVLW       higher_addr(_truck+0)
	MOVWF       FARG_OLED_print_Image_bmp+2 
	CLRF        FARG_OLED_print_Image_pixel+0 
	CALL        _OLED_print_Image+0, 0
;OLED.c,44 :: 		Delay_ms(3000);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main126:
	DECFSZ      R13, 1, 1
	BRA         L_main126
	DECFSZ      R12, 1, 1
	BRA         L_main126
	DECFSZ      R11, 1, 1
	BRA         L_main126
	NOP
	NOP
;OLED.c,45 :: 		OLED_clear_screen();
	CALL        _OLED_clear_screen+0, 0
;OLED.c,49 :: 		OLED_print_Image(&carsun,ON);
	MOVLW       _carsun+0
	MOVWF       FARG_OLED_print_Image_bmp+0 
	MOVLW       hi_addr(_carsun+0)
	MOVWF       FARG_OLED_print_Image_bmp+1 
	MOVLW       higher_addr(_carsun+0)
	MOVWF       FARG_OLED_print_Image_bmp+2 
	MOVLW       1
	MOVWF       FARG_OLED_print_Image_pixel+0 
	CALL        _OLED_print_Image+0, 0
;OLED.c,53 :: 		while (1)
L_main127:
;OLED.c,57 :: 		}
	GOTO        L_main127
;OLED.c,61 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
