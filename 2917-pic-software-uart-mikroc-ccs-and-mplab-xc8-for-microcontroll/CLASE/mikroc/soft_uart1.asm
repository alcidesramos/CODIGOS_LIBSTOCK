
_main:

;soft_uart1.c,15 :: 		void main()
;soft_uart1.c,17 :: 		CMCON = 7;   // desgsabilita el comparador
	MOVLW      7
	MOVWF      CMCON+0
;soft_uart1.c,19 :: 		SoftWareUart_Init();
	CALL       _SoftWareUart_Init+0
;soft_uart1.c,21 :: 		dato=Software_UART_Read(); //lee un Dato
	CALL       _Software_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
;soft_uart1.c,23 :: 		Software_UART_Write_Text_Const("INICIANDO");
	MOVLW      ?lstr_1_soft_uart1+0
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+0
	MOVLW      hi_addr(?lstr_1_soft_uart1+0)
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+1
	CALL       _Software_UART_Write_Text_Const+0
;soft_uart1.c,27 :: 		while (1)
L_main0:
;soft_uart1.c,30 :: 		Software_UART_Read_Text(texto,'*',10); //lee una cadeda hasta que llegue el  asterisco
	MOVLW      _texto+0
	MOVWF      FARG_Software_UART_Read_Text_Buffer+0
	MOVLW      42
	MOVWF      FARG_Software_UART_Read_Text_StopChar+0
	MOVLW      10
	MOVWF      FARG_Software_UART_Read_Text_tama+0
	MOVLW      0
	MOVWF      FARG_Software_UART_Read_Text_tama+1
	CALL       _Software_UART_Read_Text+0
;soft_uart1.c,31 :: 		Software_UART_Write_text(texto);     //reenvia lo que recibido
	MOVLW      _texto+0
	MOVWF      FARG_Software_UART_Write_Text_Text+0
	CALL       _Software_UART_Write_Text+0
;soft_uart1.c,32 :: 		Software_UART_Write_Text("\r\n\r\n") ;
	MOVLW      ?lstr2_soft_uart1+0
	MOVWF      FARG_Software_UART_Write_Text_Text+0
	CALL       _Software_UART_Write_Text+0
;soft_uart1.c,35 :: 		dato=Software_UART_Read(); //lee un Dato
	CALL       _Software_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
;soft_uart1.c,36 :: 		Software_UART_Write_Text_Const("Mandaste=");
	MOVLW      ?lstr_3_soft_uart1+0
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+0
	MOVLW      hi_addr(?lstr_3_soft_uart1+0)
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+1
	CALL       _Software_UART_Write_Text_Const+0
;soft_uart1.c,37 :: 		Software_UART_Write(dato); //  lo reenvia
	MOVF       _dato+0, 0
	MOVWF      FARG_Software_UART_Write_Data+0
	CALL       _Software_UART_Write+0
;soft_uart1.c,39 :: 		Software_UART_Write_Text_Const("\r\n\r\n") ;
	MOVLW      ?lstr_4_soft_uart1+0
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+0
	MOVLW      hi_addr(?lstr_4_soft_uart1+0)
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+1
	CALL       _Software_UART_Write_Text_Const+0
;soft_uart1.c,42 :: 		Software_UART_Write_Text_Const("Contador=");
	MOVLW      ?lstr_5_soft_uart1+0
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+0
	MOVLW      hi_addr(?lstr_5_soft_uart1+0)
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+1
	CALL       _Software_UART_Write_Text_Const+0
;soft_uart1.c,43 :: 		wordtostr(contador,texto);
	MOVF       _contador+0, 0
	MOVWF      FARG_WordToStr_input+0
	CLRF       FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;soft_uart1.c,44 :: 		Software_UART_Write_text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_Software_UART_Write_Text_Text+0
	CALL       _Software_UART_Write_Text+0
;soft_uart1.c,46 :: 		Software_UART_Write_Text_Const("\r\n\r\n") ;
	MOVLW      ?lstr_6_soft_uart1+0
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+0
	MOVLW      hi_addr(?lstr_6_soft_uart1+0)
	MOVWF      FARG_Software_UART_Write_Text_Const_Text+1
	CALL       _Software_UART_Write_Text_Const+0
;soft_uart1.c,47 :: 		contador++;
	INCF       _contador+0, 1
;soft_uart1.c,48 :: 		Delay_ms(20);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;soft_uart1.c,51 :: 		}
	GOTO       L_main0
;soft_uart1.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
