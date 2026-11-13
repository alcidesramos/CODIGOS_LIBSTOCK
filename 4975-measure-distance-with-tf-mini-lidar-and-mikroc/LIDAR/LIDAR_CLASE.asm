
_INTERRUPCION:

;LIDAR_CLASE.c,33 :: 		void INTERRUPCION() iv 0x0008 ics ICS_AUTO
;LIDAR_CLASE.c,39 :: 		tf_mini_interrupcion_str();
	CALL        _tf_mini_interrupcion_str+0, 0
;LIDAR_CLASE.c,42 :: 		}
L_end_INTERRUPCION:
L__INTERRUPCION5:
	RETFIE      1
; end of _INTERRUPCION

_main:

;LIDAR_CLASE.c,44 :: 		void main()
;LIDAR_CLASE.c,46 :: 		INTCON=0;
	CLRF        INTCON+0 
;LIDAR_CLASE.c,47 :: 		INTCON.b6=1;
	BSF         INTCON+0, 6 
;LIDAR_CLASE.c,48 :: 		ADCON1=0B1111; //TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;LIDAR_CLASE.c,49 :: 		TRISC6_bit=0; // TX   SALIDA
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;LIDAR_CLASE.c,50 :: 		TRISC7_bit=1;  //RX ENTRADA
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;LIDAR_CLASE.c,51 :: 		TRISB0_bit=0;     //salida led1
	BCF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;LIDAR_CLASE.c,55 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;LIDAR_CLASE.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LIDAR_CLASE.c,57 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LIDAR_CLASE.c,58 :: 		Lcd_Out(1,9,"LIDAR");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_LIDAR_CLASE+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_LIDAR_CLASE+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LIDAR_CLASE.c,60 :: 		tf_mini_config();      //entra en configuracion
	CALL        _tf_mini_config+0, 0
;LIDAR_CLASE.c,65 :: 		tf_mini_out_str(); //salida en string
	CALL        _tf_mini_out_str+0, 0
;LIDAR_CLASE.c,69 :: 		RCIF_bit=0 ;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;LIDAR_CLASE.c,71 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;LIDAR_CLASE.c,72 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;LIDAR_CLASE.c,73 :: 		RCIE_bit=1;//HABILITA INT SERIAL
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;LIDAR_CLASE.c,74 :: 		GIE_bit=1; //AUTORIZA INTERRUPCIONES
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;LIDAR_CLASE.c,75 :: 		while(1)
L_main0:
;LIDAR_CLASE.c,77 :: 		if (flag_rx_lidar==1)
	MOVF        _flag_rx_lidar+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;LIDAR_CLASE.c,87 :: 		procesa_lidar_str();
	CALL        _procesa_lidar_str+0, 0
;LIDAR_CLASE.c,88 :: 		sprintf(texto,"DIST=%.1f",distancia_float);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_LIDAR_CLASE+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_LIDAR_CLASE+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_LIDAR_CLASE+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _distancia_float+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _distancia_float+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _distancia_float+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _distancia_float+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;LIDAR_CLASE.c,89 :: 		Lcd_Out(3,5,"            ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_LIDAR_CLASE+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_LIDAR_CLASE+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LIDAR_CLASE.c,90 :: 		Lcd_Out(3,5,texto);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LIDAR_CLASE.c,95 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;LIDAR_CLASE.c,96 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;LIDAR_CLASE.c,97 :: 		RCIF_bit=0;   // limnpia la bandera de interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;LIDAR_CLASE.c,98 :: 		RCIE_bit=1;// habilita la interrpcion nuevamente
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;LIDAR_CLASE.c,100 :: 		flag_rx_lidar=0;
	CLRF        _flag_rx_lidar+0 
;LIDAR_CLASE.c,102 :: 		}
L_main2:
;LIDAR_CLASE.c,103 :: 		led1=!led1;
	BTG         LATB0_bit+0, BitPos(LATB0_bit+0) 
;LIDAR_CLASE.c,104 :: 		Delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;LIDAR_CLASE.c,107 :: 		}
	GOTO        L_main0
;LIDAR_CLASE.c,109 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
