
_en_serial1:

;SERIAL2.c,18 :: 		void en_serial1()
;SERIAL2.c,21 :: 		RXDTSEL_bit=1; // RX en RA1
	BSF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
;SERIAL2.c,22 :: 		TXCKSEL_bit=1; // tX en RA0
	BSF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;SERIAL2.c,23 :: 		}
L_end_en_serial1:
	RETURN
; end of _en_serial1

_en_serial2:

;SERIAL2.c,25 :: 		void en_serial2()
;SERIAL2.c,28 :: 		RXDTSEL_bit=0; // RX en RC5
	BCF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
;SERIAL2.c,29 :: 		TXCKSEL_bit=0; // tX en RC4
	BCF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;SERIAL2.c,30 :: 		}
L_end_en_serial2:
	RETURN
; end of _en_serial2

_main:

;SERIAL2.c,33 :: 		void main()
;SERIAL2.c,37 :: 		OSCCON=0;
	CLRF       OSCCON+0
;SERIAL2.c,39 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;SERIAL2.c,40 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;SERIAL2.c,43 :: 		ansela=0;
	CLRF       ANSELA+0
;SERIAL2.c,44 :: 		anselc=0;
	CLRF       ANSELC+0
;SERIAL2.c,49 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;SERIAL2.c,50 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;SERIAL2.c,51 :: 		IRCF1_bit=0;
	BCF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;SERIAL2.c,52 :: 		IRCF0_bit=1;
	BSF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;SERIAL2.c,55 :: 		TRISA2_bit=0; //salida led
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;SERIAL2.c,57 :: 		TRISA0_bit=0;  //SALIDA TX
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;SERIAL2.c,58 :: 		TRISC4_bit=0; //SALIDA TX_AUX
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;SERIAL2.c,60 :: 		TRISA1_bit=1; //ENTRADA RX
	BSF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;SERIAL2.c,61 :: 		TRISC5_bit=1; // ENTRADA RX_AUX
	BSF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
;SERIAL2.c,63 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;SERIAL2.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SERIAL2.c,65 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SERIAL2.c,66 :: 		Lcd_Out(1,2, "DOS PUERTOS SERIAL");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_SERIAL2+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_SERIAL2+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;SERIAL2.c,67 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      103
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;SERIAL2.c,70 :: 		while(1)
L_main0:
;SERIAL2.c,73 :: 		en_serial1();
	CALL       _en_serial1+0
;SERIAL2.c,74 :: 		UART1_Write_Text("SOY EL 1\r\n");
	MOVLW      ?lstr2_SERIAL2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_SERIAL2+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;SERIAL2.c,75 :: 		en_serial2();
	CALL       _en_serial2+0
;SERIAL2.c,76 :: 		UART1_Write_Text("SOY EL 2\r\n");
	MOVLW      ?lstr3_SERIAL2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_SERIAL2+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;SERIAL2.c,79 :: 		led_op=!led_op;
	MOVLW
	XORWF      LATA2_bit+0, 1
;SERIAL2.c,80 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	DECFSZ     R12, 1
	GOTO       L_main2
	DECFSZ     R11, 1
	GOTO       L_main2
	NOP
;SERIAL2.c,84 :: 		}
	GOTO       L_main0
;SERIAL2.c,88 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
