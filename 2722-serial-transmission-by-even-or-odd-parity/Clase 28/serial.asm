
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

_UART1_Write_pa:

;serial.c,13 :: 		void UART1_Write_pa(char dat_)
;serial.c,15 :: 		char cont_,pari,p_cont=0;
	CLRF        UART1_Write_pa_p_cont_L0+0 
;serial.c,17 :: 		pari=0;     //cambie a 0 para paridad impar
	CLRF        UART1_Write_pa_pari_L0+0 
;serial.c,18 :: 		for (cont_=0;cont_<=7;cont_++)
	CLRF        UART1_Write_pa_cont__L0+0 
L_UART1_Write_pa2:
	MOVF        UART1_Write_pa_cont__L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_UART1_Write_pa3
;serial.c,21 :: 		if ((dat_ & 1<<cont_)!=0) p_cont++;
	MOVF        UART1_Write_pa_cont__L0+0, 0 
	MOVWF       R2 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__UART1_Write_pa16:
	BZ          L__UART1_Write_pa17
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__UART1_Write_pa16
L__UART1_Write_pa17:
	MOVF        R0, 0 
	ANDWF       FARG_UART1_Write_pa_dat_+0, 0 
	MOVWF       R2 
	MOVLW       0
	ANDWF       R1, 0 
	MOVWF       R3 
	MOVLW       0
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__UART1_Write_pa18
	MOVLW       0
	XORWF       R2, 0 
L__UART1_Write_pa18:
	BTFSC       STATUS+0, 2 
	GOTO        L_UART1_Write_pa5
	INCF        UART1_Write_pa_p_cont_L0+0, 1 
L_UART1_Write_pa5:
;serial.c,18 :: 		for (cont_=0;cont_<=7;cont_++)
	INCF        UART1_Write_pa_cont__L0+0, 1 
;serial.c,23 :: 		}
	GOTO        L_UART1_Write_pa2
L_UART1_Write_pa3:
;serial.c,25 :: 		if (p_cont%2!=0) pari=~pari;       // dicision por residuo
	MOVLW       1
	ANDWF       UART1_Write_pa_p_cont_L0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_UART1_Write_pa6
	COMF        UART1_Write_pa_pari_L0+0, 1 
L_UART1_Write_pa6:
;serial.c,27 :: 		TX9D_bit=pari;
	BTFSC       UART1_Write_pa_pari_L0+0, 0 
	GOTO        L__UART1_Write_pa19
	BCF         TX9D_bit+0, BitPos(TX9D_bit+0) 
	GOTO        L__UART1_Write_pa20
L__UART1_Write_pa19:
	BSF         TX9D_bit+0, BitPos(TX9D_bit+0) 
L__UART1_Write_pa20:
;serial.c,28 :: 		UART1_Write(dat_);
	MOVF        FARG_UART1_Write_pa_dat_+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;serial.c,30 :: 		}
L_end_UART1_Write_pa:
	RETURN      0
; end of _UART1_Write_pa

_UART1_Write_text_pa:

;serial.c,33 :: 		void UART1_Write_text_pa(char *info)
;serial.c,35 :: 		while(*info) UART1_Write_pa(*info++);
L_UART1_Write_text_pa7:
	MOVFF       FARG_UART1_Write_text_pa_info+0, FSR0
	MOVFF       FARG_UART1_Write_text_pa_info+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UART1_Write_text_pa8
	MOVFF       FARG_UART1_Write_text_pa_info+0, FSR0
	MOVFF       FARG_UART1_Write_text_pa_info+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_pa_dat_+0 
	CALL        _UART1_Write_pa+0, 0
	INFSNZ      FARG_UART1_Write_text_pa_info+0, 1 
	INCF        FARG_UART1_Write_text_pa_info+1, 1 
	GOTO        L_UART1_Write_text_pa7
L_UART1_Write_text_pa8:
;serial.c,36 :: 		}
L_end_UART1_Write_text_pa:
	RETURN      0
; end of _UART1_Write_text_pa

_UART1_Write_text_pa_const:

;serial.c,38 :: 		void UART1_Write_text_pa_const(const char *info)
;serial.c,40 :: 		while(*info) UART1_Write_pa(*info++);
L_UART1_Write_text_pa_const9:
	MOVF        FARG_UART1_Write_text_pa_const_info+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_UART1_Write_text_pa_const_info+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_UART1_Write_text_pa_const_info+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UART1_Write_text_pa_const10
	MOVF        FARG_UART1_Write_text_pa_const_info+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_UART1_Write_text_pa_const_info+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_UART1_Write_text_pa_const_info+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_UART1_Write_pa_dat_+0
	CALL        _UART1_Write_pa+0, 0
	MOVLW       1
	ADDWF       FARG_UART1_Write_text_pa_const_info+0, 1 
	MOVLW       0
	ADDWFC      FARG_UART1_Write_text_pa_const_info+1, 1 
	ADDWFC      FARG_UART1_Write_text_pa_const_info+2, 1 
	GOTO        L_UART1_Write_text_pa_const9
L_UART1_Write_text_pa_const10:
;serial.c,41 :: 		}
L_end_UART1_Write_text_pa_const:
	RETURN      0
; end of _UART1_Write_text_pa_const

_main:

;serial.c,44 :: 		void main()
;serial.c,48 :: 		adcon1=0b1101;// 2 analogos en el 18f25x
	MOVLW       13
	MOVWF       ADCON1+0 
;serial.c,51 :: 		TRISA0_bit=1;
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;serial.c,52 :: 		TRISA1_bit=1;
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;serial.c,55 :: 		TRISC6_bit=0;// saluida tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;serial.c,56 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;serial.c,57 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;serial.c,58 :: 		TX9_bit=1; //habilita transmitir 9 bits
	BSF         TX9_bit+0, BitPos(TX9_bit+0) 
;serial.c,61 :: 		UART1_Write_text_pa_const("INICIANDO\r\n");
	MOVLW       ?lstr_1_serial+0
	MOVWF       FARG_UART1_Write_text_pa_const_info+0 
	MOVLW       hi_addr(?lstr_1_serial+0)
	MOVWF       FARG_UART1_Write_text_pa_const_info+1 
	MOVLW       higher_addr(?lstr_1_serial+0)
	MOVWF       FARG_UART1_Write_text_pa_const_info+2 
	CALL        _UART1_Write_text_pa_const+0, 0
;serial.c,64 :: 		while (1)
L_main11:
;serial.c,66 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;serial.c,67 :: 		voltaje=codigo*5.0/1023.0;
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
;serial.c,73 :: 		sprintf(texto,"Voltaje=%.2f V\r\n",voltaje);
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
;serial.c,74 :: 		UART1_Write_text_pa(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_text_pa_info+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_text_pa_info+1 
	CALL        _UART1_Write_text_pa+0, 0
;serial.c,80 :: 		codigo=ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;serial.c,81 :: 		temperatura=codigo*500.0/1023.0;
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
;serial.c,82 :: 		sprintf(texto,"Temperatura=%.1f \r\n",temperatura);
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
;serial.c,83 :: 		UART1_Write_text_pa(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_text_pa_info+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_text_pa_info+1 
	CALL        _UART1_Write_text_pa+0, 0
;serial.c,93 :: 		Delay_ms(800);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
;serial.c,95 :: 		}
	GOTO        L_main11
;serial.c,99 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
