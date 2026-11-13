
_interrpciones:

;billitero.c,7 :: 		void interrpciones() iv 0x0008 ics ICS_AUTO
;billitero.c,9 :: 		if (INT0IF_bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrpciones0
;billitero.c,11 :: 		flag_bill=0;
	CLRF        _flag_bill+0 
;billitero.c,12 :: 		TMR0H=146;
	MOVLW       146
	MOVWF       TMR0H+0 
;billitero.c,13 :: 		TMR0L=35;
	MOVLW       35
	MOVWF       TMR0L+0 
;billitero.c,14 :: 		TMR0ON_bit=1; // enciende el timer para medor desborde y saber si ya terminó los pulsos
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;billitero.c,15 :: 		pulsos_var++;
	INCF        _pulsos_var+0, 1 
;billitero.c,16 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;billitero.c,18 :: 		}
L_interrpciones0:
;billitero.c,20 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrpciones1
;billitero.c,22 :: 		TMR0H=146;
	MOVLW       146
	MOVWF       TMR0H+0 
;billitero.c,23 :: 		TMR0L=35;
	MOVLW       35
	MOVWF       TMR0L+0 
;billitero.c,25 :: 		TMR0ON_bit=0; // Apaga  el timer
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;billitero.c,26 :: 		flag_bill=1;
	MOVLW       1
	MOVWF       _flag_bill+0 
;billitero.c,27 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;billitero.c,29 :: 		}
L_interrpciones1:
;billitero.c,33 :: 		}
L_end_interrpciones:
L__interrpciones7:
	RETFIE      1
; end of _interrpciones

_billetero:

;billitero.c,35 :: 		void billetero ()
;billitero.c,37 :: 		if (flag_bill==1)
	MOVF        _flag_bill+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_billetero2
;billitero.c,40 :: 		flag_bill=0;
	CLRF        _flag_bill+0 
;billitero.c,41 :: 		dinero=pulsos_var*1000;
	MOVF        _pulsos_var+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _dinero+0 
	MOVF        R1, 0 
	MOVWF       _dinero+1 
;billitero.c,42 :: 		sprinti(texto,"SALDO=%u\r\n",dinero);
	MOVLW       _texto+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_1_billitero+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_1_billitero+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_1_billitero+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;billitero.c,43 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;billitero.c,45 :: 		}
L_billetero2:
;billitero.c,49 :: 		}
L_end_billetero:
	RETURN      0
; end of _billetero

_main:

;billitero.c,53 :: 		void main()
;billitero.c,57 :: 		INTCON=0b01000000; //deshabilitadas
	MOVLW       64
	MOVWF       INTCON+0 
;billitero.c,58 :: 		ADCON1=0x0F;// TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;billitero.c,61 :: 		CMCON=7; // APAGA EL COMPARADOR.
	MOVLW       7
	MOVWF       CMCON+0 
;billitero.c,65 :: 		TRISA=255;// TODO SALIDA
	MOVLW       255
	MOVWF       TRISA+0 
;billitero.c,66 :: 		TRISB=255;
	MOVLW       255
	MOVWF       TRISB+0 
;billitero.c,67 :: 		trisc=255;
	MOVLW       255
	MOVWF       TRISC+0 
;billitero.c,69 :: 		TRISB7_bit=0;
	BCF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;billitero.c,71 :: 		TRISB1_bit=0;  // PIN HABILITAR EL BILLETERO
	BCF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;billitero.c,73 :: 		LATB1_bit=0; // HABILITA EL BILLETERO
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;billitero.c,75 :: 		RC6_bit=0; // TX SERIAL
	BCF         RC6_bit+0, BitPos(RC6_bit+0) 
;billitero.c,77 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;billitero.c,81 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;billitero.c,82 :: 		INTEDG0_bit=0;// FALCO DE BAJADA
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;billitero.c,83 :: 		INT0IE_bit=1; // HABILITA INTERROCION FLANCO
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;billitero.c,87 :: 		T0CON=0;//LIMPIA REGISTRO DEL TIMER CERO
	CLRF        T0CON+0 
;billitero.c,88 :: 		TMR0ON_bit=0; // lo mantiene apagado
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;billitero.c,90 :: 		TMR0H=146;
	MOVLW       146
	MOVWF       TMR0H+0 
;billitero.c,91 :: 		TMR0L=35;
	MOVLW       35
	MOVWF       TMR0L+0 
;billitero.c,93 :: 		T0PS2_bit=1;
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;billitero.c,94 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;billitero.c,95 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;billitero.c,97 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;billitero.c,98 :: 		TMR0IE_bit=1;// habilita la interrpcion
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;billitero.c,99 :: 		TMR0ON_bit=0;//Apaga el Timer
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;billitero.c,102 :: 		GIE_bit=1;// habilita laS INTERRUPCIONES
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;billitero.c,104 :: 		UART1_Write_Text("Iniciando\r\n");
	MOVLW       ?lstr2_billitero+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_billitero+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;billitero.c,106 :: 		while(1)
L_main3:
;billitero.c,108 :: 		billetero();
	CALL        _billetero+0, 0
;billitero.c,109 :: 		UART1_Write_Text("FUNCIONANDO\r\n");
	MOVLW       ?lstr3_billitero+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_billitero+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;billitero.c,110 :: 		LATB7_bit=~LATB7_bit;
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;billitero.c,111 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;billitero.c,114 :: 		}
	GOTO        L_main3
;billitero.c,117 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
