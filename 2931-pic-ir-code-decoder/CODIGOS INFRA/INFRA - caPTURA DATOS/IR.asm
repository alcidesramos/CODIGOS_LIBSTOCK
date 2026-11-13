
_Interrpcion:

;IR.c,10 :: 		void Interrpcion() iv 0x0004 ics ICS_AUTO
;IR.c,12 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_Interrpcion0
;IR.c,15 :: 		if (flag_codigo==0)
	MOVF       _flag_codigo+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Interrpcion1
;IR.c,18 :: 		if (cuenta!=0)   // omite el primer dato de interrpcion
	MOVLW      0
	XORWF      _cuenta+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrpcion12
	MOVLW      0
	XORWF      _cuenta+0, 0
L__Interrpcion12:
	BTFSC      STATUS+0, 2
	GOTO       L_Interrpcion2
;IR.c,20 :: 		timer_aux=TMR0; //captura el valor del timer
	MOVF       TMR0+0, 0
	MOVWF      _timer_aux+0
;IR.c,21 :: 		TMR0=0; // resetea el timer para otra lectura
	CLRF       TMR0+0
;IR.c,23 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,24 :: 		INTEDG_bit=!INTEDG_bit;      // cambia el flanco a detectar
	MOVLW
	XORWF      INTEDG_bit+0, 1
;IR.c,26 :: 		if (TMR0IF_bit==1)  // mas 16 ms si hubo desborde del timer , fin de datos
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrpcion3
;IR.c,28 :: 		flag_codigo=1;
	MOVLW      1
	MOVWF      _flag_codigo+0
;IR.c,29 :: 		INTE_bit=0; //deshabilita la interrpcuion
	BCF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,30 :: 		}
L_Interrpcion3:
;IR.c,31 :: 		}
	GOTO       L_Interrpcion4
L_Interrpcion2:
;IR.c,34 :: 		TMR0IF_bit=0;// limpia la bansera timer
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;IR.c,35 :: 		TMR0=0;   // resetea el timer
	CLRF       TMR0+0
;IR.c,36 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,37 :: 		}
L_Interrpcion4:
;IR.c,39 :: 		}
L_Interrpcion1:
;IR.c,40 :: 		}
L_Interrpcion0:
;IR.c,46 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,56 :: 		}
L_end_Interrpcion:
L__Interrpcion11:
	RETFIE     %s
; end of _Interrpcion

_main:

;IR.c,59 :: 		void main()
;IR.c,62 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;IR.c,63 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;IR.c,64 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;IR.c,65 :: 		IRCF0_bit=1;
	BSF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;IR.c,69 :: 		ansela=0;
	CLRF       ANSELA+0
;IR.c,70 :: 		anselc=0;
	CLRF       ANSELC+0
;IR.c,72 :: 		TRISA=0;
	CLRF       TRISA+0
;IR.c,73 :: 		trisc=0;
	CLRF       TRISC+0
;IR.c,75 :: 		TRISA2_bit=1; // entrada de INT
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;IR.c,81 :: 		TXCKSEL_bit=0; // tX en RC4  sino RA0
	BCF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;IR.c,83 :: 		UART1_Init(19200);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;IR.c,85 :: 		LATA=0;
	CLRF       LATA+0
;IR.c,87 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr1_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,88 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,91 :: 		OPTION_REG=0;      // preescalador asigando al timer 0
	CLRF       OPTION_REG+0
;IR.c,94 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;IR.c,95 :: 		PS1_bit=1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;IR.c,96 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;IR.c,98 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr2_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,99 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,103 :: 		INTCON=0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;IR.c,104 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,105 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,106 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,108 :: 		GIE_bit=1; // autoriza todas las interrpciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;IR.c,110 :: 		while (1)
L_main5:
;IR.c,112 :: 		if (flag_codigo==1)
	MOVF       _flag_codigo+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;IR.c,116 :: 		UART1_Write_Text("son=");
	MOVLW      ?lstr3_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,117 :: 		ByteToStr(cuenta,texto);
	MOVF       _cuenta+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _texto+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;IR.c,118 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,119 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,120 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,122 :: 		Delay_ms(2000);
	MOVLW      41
	MOVWF      R11
	MOVLW      150
	MOVWF      R12
	MOVLW      127
	MOVWF      R13
L_main8:
	DECFSZ     R13, 1
	GOTO       L_main8
	DECFSZ     R12, 1
	GOTO       L_main8
	DECFSZ     R11, 1
	GOTO       L_main8
;IR.c,124 :: 		flag_codigo=0;
	CLRF       _flag_codigo+0
;IR.c,125 :: 		cuenta=0;
	CLRF       _cuenta+0
	CLRF       _cuenta+1
;IR.c,126 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,127 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,128 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,133 :: 		}
L_main7:
;IR.c,134 :: 		Delay_ms(80);
	MOVLW      2
	MOVWF      R11
	MOVLW      160
	MOVWF      R12
	MOVLW      146
	MOVWF      R13
L_main9:
	DECFSZ     R13, 1
	GOTO       L_main9
	DECFSZ     R12, 1
	GOTO       L_main9
	DECFSZ     R11, 1
	GOTO       L_main9
	NOP
;IR.c,135 :: 		LATA0_bit=~LATA0_bit;
	MOVLW
	XORWF      LATA0_bit+0, 1
;IR.c,137 :: 		}
	GOTO       L_main5
;IR.c,141 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
