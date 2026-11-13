
_interrupt:

;HID_WRITE.c,10 :: 		void interrupt()
;HID_WRITE.c,12 :: 		USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;HID_WRITE.c,15 :: 		}
L_end_interrupt:
L__interrupt11:
	RETFIE      1
; end of _interrupt

_main:

;HID_WRITE.c,18 :: 		void main()
;HID_WRITE.c,20 :: 		ADCON1=0B1101;// DOS CANALES ANALOGOS
	MOVLW       13
	MOVWF       ADCON1+0 
;HID_WRITE.c,22 :: 		TRISA=255;
	MOVLW       255
	MOVWF       TRISA+0 
;HID_WRITE.c,23 :: 		TRISB=255;
	MOVLW       255
	MOVWF       TRISB+0 
;HID_WRITE.c,24 :: 		RBPU_bit=0; // HABILITA PULL UP
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;HID_WRITE.c,27 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;HID_WRITE.c,29 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;HID_WRITE.c,31 :: 		while (1)
L_main0:
;HID_WRITE.c,33 :: 		codigo=ADC_Get_Sample(0);
	CLRF        FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;HID_WRITE.c,34 :: 		temperatura=codigo*500.0/1023.0;
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
;HID_WRITE.c,35 :: 		Delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	NOP
;HID_WRITE.c,36 :: 		codigo=ADC_Get_Sample(1);
	MOVLW       1
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;HID_WRITE.c,37 :: 		voltaje=codigo*5.0/1023.0;
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
;HID_WRITE.c,38 :: 		memset(&writebuff,0,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       64
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;HID_WRITE.c,40 :: 		sprintf(&writebuff,"%.3f/%.2f/",temperatura,voltaje);
	MOVLW       _writebuff+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_HID_WRITE+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_HID_WRITE+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_HID_WRITE+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _voltaje+0, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _voltaje+1, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _voltaje+2, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _voltaje+3, 0 
	MOVWF       FARG_sprintf_wh+12 
	CALL        _sprintf+0, 0
;HID_WRITE.c,42 :: 		if (sw==0) strcat(&writebuff,"1/"); else strcat(&writebuff,"0/") ;
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_main3
	MOVLW       _writebuff+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr2_HID_WRITE+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr2_HID_WRITE+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_main4
L_main3:
	MOVLW       _writebuff+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr3_HID_WRITE+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr3_HID_WRITE+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_main4:
;HID_WRITE.c,44 :: 		if (sw1==0) strcat(&writebuff,"1/"); else strcat(&writebuff,"0/") ;
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main5
	MOVLW       _writebuff+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr4_HID_WRITE+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr4_HID_WRITE+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_main6
L_main5:
	MOVLW       _writebuff+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr5_HID_WRITE+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr5_HID_WRITE+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_main6:
;HID_WRITE.c,46 :: 		strcat(&writebuff,"\0"); // final de cadena
	MOVLW       _writebuff+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr6_HID_WRITE+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr6_HID_WRITE+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;HID_WRITE.c,48 :: 		while(!HID_Write(&writebuff,64));
L_main7:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
;HID_WRITE.c,51 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;HID_WRITE.c,58 :: 		}
	GOTO        L_main0
;HID_WRITE.c,61 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
