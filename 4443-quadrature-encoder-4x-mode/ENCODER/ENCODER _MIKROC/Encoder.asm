
_PUNTO5:

	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_PUNTO50
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L__PUNTO511
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L__PUNTO512
	GOTO        L_PUNTO51
L__PUNTO511:
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_PUNTO51
L__PUNTO512:
	INFSNZ      _pulso+0, 1 
	INCF        _pulso+1, 1 
	GOTO        L_PUNTO52
L_PUNTO51:
	MOVLW       1
	SUBWF       _pulso+0, 1 
	MOVLW       0
	SUBWFB      _pulso+1, 1 
L_PUNTO52:
	BTG         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
L_PUNTO50:
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_PUNTO53
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L__PUNTO513
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L__PUNTO514
	GOTO        L_PUNTO54
L__PUNTO513:
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_PUNTO54
L__PUNTO514:
	MOVLW       1
	SUBWF       _pulso+0, 1 
	MOVLW       0
	SUBWFB      _pulso+1, 1 
	GOTO        L_PUNTO55
L_PUNTO54:
	INFSNZ      _pulso+0, 1 
	INCF        _pulso+1, 1 
L_PUNTO55:
	BTG         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
L_PUNTO53:
L_end_PUNTO5:
L__PUNTO510:
	RETFIE      1
; end of _PUNTO5

_main:

	MOVLW       15
	MOVWF       ADCON1+0 
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
	MOVLW       64
	MOVWF       INTCON+0 
	CALL        _Lcd_Init+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       69
	MOVWF       ?lstr1_Encoder+0 
	MOVLW       78
	MOVWF       ?lstr1_Encoder+1 
	MOVLW       67
	MOVWF       ?lstr1_Encoder+2 
	MOVLW       79
	MOVWF       ?lstr1_Encoder+3 
	MOVLW       68
	MOVWF       ?lstr1_Encoder+4 
	MOVLW       69
	MOVWF       ?lstr1_Encoder+5 
	MOVLW       82
	MOVWF       ?lstr1_Encoder+6 
	MOVLW       61
	MOVWF       ?lstr1_Encoder+7 
	CLRF        ?lstr1_Encoder+8 
	MOVLW       ?lstr1_Encoder+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Encoder+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
	BSF         INT0E_bit+0, BitPos(INT0E_bit+0) 
	BSF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
	BSF         INT1E_bit+0, BitPos(INT1E_bit+0) 
	BSF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
L_main6:
	MOVF        _pulso+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _pulso+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _texto+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _texto+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	GOTO        L_main6
L_end_main:
	GOTO        $+0
; end of _main
