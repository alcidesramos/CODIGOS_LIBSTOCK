
_Uart1_write_text_const:

;serial.c,7 :: 		void Uart1_write_text_const(const char *info)
;serial.c,9 :: 		while(*info) UART1_Write(*info++);
L_Uart1_write_text_const0:
	MOVF        FARG_Uart1_write_text_const_info+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_Uart1_write_text_const_info+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_Uart1_write_text_const_info+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Uart1_write_text_const1
	MOVF        FARG_Uart1_write_text_const_info+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_Uart1_write_text_const_info+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_Uart1_write_text_const_info+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_UART1_Write_data_+0
	CALL        _UART1_Write+0, 0
	MOVLW       1
	ADDWF       FARG_Uart1_write_text_const_info+0, 1 
	MOVLW       0
	ADDWFC      FARG_Uart1_write_text_const_info+1, 1 
	ADDWFC      FARG_Uart1_write_text_const_info+2, 1 
	GOTO        L_Uart1_write_text_const0
L_Uart1_write_text_const1:
;serial.c,10 :: 		}
L_end_Uart1_write_text_const:
	RETURN      0
; end of _Uart1_write_text_const

_main:

;serial.c,13 :: 		void main()
;serial.c,17 :: 		adcon1=0b1101;// 2 analogos en el 18f25x
	MOVLW       13
	MOVWF       ADCON1+0 
;serial.c,20 :: 		TRISA0_bit=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;serial.c,21 :: 		TRISA1_bit=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;serial.c,24 :: 		TRISC6_bit=0;// saluida tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;serial.c,25 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;serial.c,26 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;serial.c,27 :: 		Uart1_write_text_const("INICIANDO\r\n");
	MOVLW       ?lstr_1_serial+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_1_serial+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_1_serial+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;serial.c,29 :: 		while (1)
L_main2:
;serial.c,31 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;serial.c,32 :: 		voltaje=codigo*5.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _voltaje+0 
	MOVF        R1, 0 
	MOVWF       _voltaje+1 
	MOVF        R2, 0 
	MOVWF       _voltaje+2 
	MOVF        R3, 0 
	MOVWF       _voltaje+3 
;serial.c,38 :: 		sprintf(texto,"Voltaje=%.2f V\r\n",voltaje);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_serial+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_serial+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_serial+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;serial.c,39 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial.c,45 :: 		codigo=ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;serial.c,46 :: 		temperatura=codigo*500.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;serial.c,47 :: 		sprintf(texto,"Temperatura=%.1f \r\n",temperatura);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_3_serial+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_3_serial+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_3_serial+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;serial.c,48 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;serial.c,58 :: 		Delay_ms(800);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;serial.c,60 :: 		}
	GOTO        L_main2
;serial.c,64 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
