
_main:

;perro.c,2 :: 		void main()
;perro.c,4 :: 		SWDTEN_bit=0; // APAGA EL PERRO GUARDIAN
	BCF        SWDTEN_bit+0, BitPos(SWDTEN_bit+0)
;perro.c,6 :: 		WDTPS4_bit=0;
	BCF        WDTPS4_bit+0, BitPos(WDTPS4_bit+0)
;perro.c,7 :: 		WDTPS3_bit=1;
	BSF        WDTPS3_bit+0, BitPos(WDTPS3_bit+0)
;perro.c,8 :: 		WDTPS2_bit=1;
	BSF        WDTPS2_bit+0, BitPos(WDTPS2_bit+0)
;perro.c,9 :: 		WDTPS1_bit=0;
	BCF        WDTPS1_bit+0, BitPos(WDTPS1_bit+0)
;perro.c,10 :: 		WDTPS0_bit=0;
	BCF        WDTPS0_bit+0, BitPos(WDTPS0_bit+0)
;perro.c,14 :: 		TRISA=0;
	CLRF       TRISA+0
;perro.c,15 :: 		TRISC=0;
	CLRF       TRISC+0
;perro.c,17 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      103
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;perro.c,18 :: 		LATC1_bit=1;
	BSF        LATC1_bit+0, BitPos(LATC1_bit+0)
;perro.c,19 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main0:
	DECFSZ     R13, 1
	GOTO       L_main0
	DECFSZ     R12, 1
	GOTO       L_main0
	NOP
	NOP
;perro.c,20 :: 		LATC1_bit=0;
	BCF        LATC1_bit+0, BitPos(LATC1_bit+0)
;perro.c,21 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main1:
	DECFSZ     R13, 1
	GOTO       L_main1
	DECFSZ     R12, 1
	GOTO       L_main1
	NOP
	NOP
;perro.c,24 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr1_perro+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_perro+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;perro.c,27 :: 		UART1_Write_Text("WHILE\r\n");
	MOVLW      ?lstr2_perro+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_perro+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;perro.c,28 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11
	MOVLW      134
	MOVWF      R12
	MOVLW      153
	MOVWF      R13
L_main4:
	DECFSZ     R13, 1
	GOTO       L_main4
	DECFSZ     R12, 1
	GOTO       L_main4
	DECFSZ     R11, 1
	GOTO       L_main4
;perro.c,29 :: 		SWDTEN_bit=1; // prende el perro
	BSF        SWDTEN_bit+0, BitPos(SWDTEN_bit+0)
;perro.c,32 :: 		while(1==1)
L_main5:
;perro.c,34 :: 		UART1_Write_Text("for\r\n");
	MOVLW      ?lstr3_perro+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_perro+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;perro.c,36 :: 		LATC0_bit=!LATC0_bit;
	MOVLW
	XORWF      LATC0_bit+0, 1
;perro.c,37 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main7:
	DECFSZ     R13, 1
	GOTO       L_main7
	DECFSZ     R12, 1
	GOTO       L_main7
	NOP
	NOP
;perro.c,38 :: 		}
	GOTO       L_main5
;perro.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
