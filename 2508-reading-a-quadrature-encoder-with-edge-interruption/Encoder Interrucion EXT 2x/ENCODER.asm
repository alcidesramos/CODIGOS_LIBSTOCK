
_Interrpciones:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ENCODER.c,22 :: 		void Interrpciones() iv 0x0004 ics ICS_AUTO
;ENCODER.c,24 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_Interrpciones0
;ENCODER.c,26 :: 		if (PORTB.RB1==PORTB.RB0) pulsos++; else pulsos--;
	BTFSC      PORTB+0, 1
	GOTO       L__Interrpciones8
	BTFSS      PORTB+0, 0
	GOTO       L__Interrpciones9
	GOTO       L_Interrpciones1
L__Interrpciones8:
	BTFSS      PORTB+0, 0
	GOTO       L_Interrpciones1
L__Interrpciones9:
	INCF       _pulsos+0, 1
	BTFSC      STATUS+0, 2
	INCF       _pulsos+1, 1
	GOTO       L_Interrpciones2
L_Interrpciones1:
	MOVLW      1
	SUBWF      _pulsos+0, 1
	BTFSS      STATUS+0, 0
	DECF       _pulsos+1, 1
L_Interrpciones2:
;ENCODER.c,27 :: 		INTEDG_bit=~INTEDG_bit; //cambia el flanco a detectar modo 2x
	MOVLW
	XORWF      INTEDG_bit+0, 1
;ENCODER.c,28 :: 		INTF_bit=0; //limpia bandera de interrupcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;ENCODER.c,29 :: 		}
L_Interrpciones0:
;ENCODER.c,31 :: 		}
L_end_Interrpciones:
L__Interrpciones7:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrpciones

_main:

;ENCODER.c,33 :: 		void main()
;ENCODER.c,35 :: 		TRISB=255;  //TODO ENTRADAS
	MOVLW      255
	MOVWF      TRISB+0
;ENCODER.c,36 :: 		TRISC=0;    //TODOS SALIDAS
	CLRF       TRISC+0
;ENCODER.c,38 :: 		adcon0.b0=0;
	BCF        ADCON0+0, 0
;ENCODER.c,39 :: 		adcon1=0b110;
	MOVLW      6
	MOVWF      ADCON1+0
;ENCODER.c,40 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;ENCODER.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ENCODER.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ENCODER.c,44 :: 		Lcd_Out(1,1,"    ENCODER ARZ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ENCODER+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,47 :: 		INTCON=0B01000000;
	MOVLW      64
	MOVWF      INTCON+0
;ENCODER.c,49 :: 		INTF_bit=0; //limpia la bansera e interrupcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;ENCODER.c,50 :: 		INTEDG_bit=0; //por flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;ENCODER.c,51 :: 		INTE_bit=1; //habilita interrpcion por flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;ENCODER.c,52 :: 		GIE_bit=1; //Autoriza interrupciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;ENCODER.c,57 :: 		while (1)
L_main3:
;ENCODER.c,59 :: 		inttostr(pulsos,texto);
	MOVF       _pulsos+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _pulsos+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ENCODER.c,60 :: 		Lcd_Out(3,5,texto);
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ENCODER.c,61 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;ENCODER.c,63 :: 		}
	GOTO       L_main3
;ENCODER.c,67 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
