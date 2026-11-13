
_interrupcion:

;sllep_modo.c,8 :: 		void interrupcion() iv 0x0004 ics ICS_AUTO
;sllep_modo.c,10 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupcion0
;sllep_modo.c,12 :: 		led_f=1;
	BSF        LATC2_bit+0, BitPos(LATC2_bit+0)
;sllep_modo.c,14 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;sllep_modo.c,15 :: 		}
L_interrupcion0:
;sllep_modo.c,18 :: 		if (RCIF_bit==1)
	BTFSS      RCIF_bit+0, BitPos(RCIF_bit+0)
	GOTO       L_interrupcion1
;sllep_modo.c,20 :: 		dato=RCREG;
	MOVF       RCREG+0, 0
	MOVWF      _dato+0
;sllep_modo.c,21 :: 		led_s=1;
	BSF        LATC3_bit+0, BitPos(LATC3_bit+0)
;sllep_modo.c,23 :: 		RCIF_bit=0;
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;sllep_modo.c,25 :: 		}
L_interrupcion1:
;sllep_modo.c,30 :: 		}
L_end_interrupcion:
L__interrupcion11:
	RETFIE     %s
; end of _interrupcion

_main:

;sllep_modo.c,32 :: 		void main()
;sllep_modo.c,36 :: 		ANSELA=0;
	CLRF       ANSELA+0
;sllep_modo.c,37 :: 		ANSELC=0;
	CLRF       ANSELC+0
;sllep_modo.c,39 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      103
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sllep_modo.c,40 :: 		TRISC=0;
	CLRF       TRISC+0
;sllep_modo.c,41 :: 		TRISA=0;
	CLRF       TRISA+0
;sllep_modo.c,42 :: 		TRISA1_bit=1;   // entrada serial
	BSF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;sllep_modo.c,43 :: 		TRISA2_bit=1;   // entrada por flanco
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;sllep_modo.c,45 :: 		RXDTSEL_bit=1; // RX en RA1  sino RC5
	BSF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
;sllep_modo.c,46 :: 		TXCKSEL_bit=1; // tX en RA0  sino RC4
	BSF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;sllep_modo.c,48 :: 		INTCON=0b01000000;// habilita interrpciones de perifericos
	MOVLW      64
	MOVWF      INTCON+0
;sllep_modo.c,50 :: 		NOT_WPUEN_bit=0; // AUTORIZA LA PULL UP INDIVIDUALES
	BCF        NOT_WPUEN_bit+0, BitPos(NOT_WPUEN_bit+0)
;sllep_modo.c,51 :: 		WPUA2_bit=1; // HABILITA PULL UP EN RA2_bit
	BSF        WPUA2_bit+0, BitPos(WPUA2_bit+0)
;sllep_modo.c,54 :: 		led1=0;
	BCF        LATC4_bit+0, BitPos(LATC4_bit+0)
;sllep_modo.c,55 :: 		led2=0;
	BCF        LATC5_bit+0, BitPos(LATC5_bit+0)
;sllep_modo.c,56 :: 		led_f=0;
	BCF        LATC2_bit+0, BitPos(LATC2_bit+0)
;sllep_modo.c,57 :: 		led_s=0;
	BCF        LATC3_bit+0, BitPos(LATC3_bit+0)
;sllep_modo.c,61 :: 		UART1_Write_Text("Iniciando\r\n");
	MOVLW      ?lstr1_sllep_modo+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_sllep_modo+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;sllep_modo.c,64 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;sllep_modo.c,65 :: 		INTEDG_bit=0; // falco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;sllep_modo.c,66 :: 		INTE_bit=1; //habilita la INTERRPCION por flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;sllep_modo.c,69 :: 		RCIF_bit=0;
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;sllep_modo.c,70 :: 		RCIE_bit=1;
	BSF        RCIE_bit+0, BitPos(RCIE_bit+0)
;sllep_modo.c,73 :: 		GIE_bit=1; // autorizar las interrpciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;sllep_modo.c,74 :: 		while (1)
L_main2:
;sllep_modo.c,78 :: 		led1=!led1;
	MOVLW
	XORWF      LATC4_bit+0, 1
;sllep_modo.c,79 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main4:
	DECFSZ     R13, 1
	GOTO       L_main4
	DECFSZ     R12, 1
	GOTO       L_main4
	DECFSZ     R11, 1
	GOTO       L_main4
	NOP
;sllep_modo.c,80 :: 		led1=!led1;
	MOVLW
	XORWF      LATC4_bit+0, 1
;sllep_modo.c,81 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	DECFSZ     R11, 1
	GOTO       L_main5
	NOP
;sllep_modo.c,82 :: 		LED1=!led1;
	MOVLW
	XORWF      LATC4_bit+0, 1
;sllep_modo.c,83 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main6:
	DECFSZ     R13, 1
	GOTO       L_main6
	DECFSZ     R12, 1
	GOTO       L_main6
	DECFSZ     R11, 1
	GOTO       L_main6
	NOP
;sllep_modo.c,84 :: 		LED1=!led1;
	MOVLW
	XORWF      LATC4_bit+0, 1
;sllep_modo.c,85 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main7:
	DECFSZ     R13, 1
	GOTO       L_main7
	DECFSZ     R12, 1
	GOTO       L_main7
	DECFSZ     R11, 1
	GOTO       L_main7
	NOP
;sllep_modo.c,86 :: 		LED1=!led1;
	MOVLW
	XORWF      LATC4_bit+0, 1
;sllep_modo.c,87 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main8:
	DECFSZ     R13, 1
	GOTO       L_main8
	DECFSZ     R12, 1
	GOTO       L_main8
	DECFSZ     R11, 1
	GOTO       L_main8
	NOP
;sllep_modo.c,88 :: 		UART1_Write_Text("Dormido\r\n");
	MOVLW      ?lstr2_sllep_modo+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_sllep_modo+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;sllep_modo.c,89 :: 		asm  sleep;
	SLEEP
;sllep_modo.c,90 :: 		UART1_Write_Text("Despertado\r\n");
	MOVLW      ?lstr3_sllep_modo+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_sllep_modo+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;sllep_modo.c,91 :: 		led2=1;
	BSF        LATC5_bit+0, BitPos(LATC5_bit+0)
;sllep_modo.c,92 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main9:
	DECFSZ     R13, 1
	GOTO       L_main9
	DECFSZ     R12, 1
	GOTO       L_main9
	DECFSZ     R11, 1
	GOTO       L_main9
	NOP
	NOP
;sllep_modo.c,93 :: 		led2=0;
	BCF        LATC5_bit+0, BitPos(LATC5_bit+0)
;sllep_modo.c,94 :: 		led_f=0;
	BCF        LATC2_bit+0, BitPos(LATC2_bit+0)
;sllep_modo.c,95 :: 		led_s=0;
	BCF        LATC3_bit+0, BitPos(LATC3_bit+0)
;sllep_modo.c,101 :: 		}
	GOTO       L_main2
;sllep_modo.c,104 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
