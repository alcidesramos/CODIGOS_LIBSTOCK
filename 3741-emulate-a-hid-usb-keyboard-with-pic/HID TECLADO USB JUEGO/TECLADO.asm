
_interrupt:

;TECLADO.c,7 :: 		void interrupt()
;TECLADO.c,9 :: 		USB_Interrupt_Proc();        // INTERRPCION POR USB
	CALL        _USB_Interrupt_Proc+0, 0
;TECLADO.c,10 :: 		}
L_end_interrupt:
L__interrupt22:
	RETFIE      1
; end of _interrupt

_main:

;TECLADO.c,14 :: 		void main()
;TECLADO.c,17 :: 		ADCON1=0b1111;   // todo digital
	MOVLW       15
	MOVWF       ADCON1+0 
;TECLADO.c,18 :: 		TRISB=0x0F;//  RB0 -RB7 ENTRADAS
	MOVLW       15
	MOVWF       TRISB+0 
;TECLADO.c,19 :: 		NOT_RBPU_bit=0; //HABILITA PULL UPS
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
;TECLADO.c,20 :: 		HID_Enable(readbuff,writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;TECLADO.c,21 :: 		LATB=0;
	CLRF        LATB+0 
;TECLADO.c,22 :: 		while(1)
L_main0:
;TECLADO.c,24 :: 		memset(writebuff,0,8);      /// borra buffer
	MOVLW       _writebuff+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       8
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;TECLADO.c,26 :: 		writebuff[0]=0;  // mofificador modifier keys (SHIFT, CTRL, etc)
	CLRF        1289 
;TECLADO.c,27 :: 		writebuff[1]=0;  //releno o  padding  siempre cero
	CLRF        1290 
;TECLADO.c,29 :: 		if (RB0_bit==0)
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;TECLADO.c,31 :: 		writebuff[2]=4;   //manda la 'A'
	MOVLW       4
	MOVWF       1291 
;TECLADO.c,32 :: 		while(!HID_Write(writebuff,8));
L_main3:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;TECLADO.c,33 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;TECLADO.c,34 :: 		writebuff[2]=0;
	CLRF        1291 
;TECLADO.c,35 :: 		while(!HID_Write(writebuff,8));   // deja de mandar
L_main6:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
	GOTO        L_main6
L_main7:
;TECLADO.c,37 :: 		}
L_main2:
;TECLADO.c,39 :: 		if (RB1_bit==0)
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main8
;TECLADO.c,41 :: 		writebuff[2]=7;   //manda la 'D'
	MOVLW       7
	MOVWF       1291 
;TECLADO.c,42 :: 		while(!HID_Write(writebuff,8));
L_main9:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
	GOTO        L_main9
L_main10:
;TECLADO.c,43 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;TECLADO.c,44 :: 		writebuff[2]=0;
	CLRF        1291 
;TECLADO.c,45 :: 		while(!HID_Write(writebuff,8));   // deja de mandar
L_main12:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
	GOTO        L_main12
L_main13:
;TECLADO.c,47 :: 		}
L_main8:
;TECLADO.c,49 :: 		if (RB2_bit==0)
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main14
;TECLADO.c,51 :: 		writebuff[2]=26;   //manda la 'W
	MOVLW       26
	MOVWF       1291 
;TECLADO.c,52 :: 		while(!HID_Write(writebuff,8));
L_main15:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
	GOTO        L_main15
L_main16:
;TECLADO.c,53 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
;TECLADO.c,54 :: 		writebuff[2]=0;
	CLRF        1291 
;TECLADO.c,55 :: 		while(!HID_Write(writebuff,8));   // deja de mandar
L_main18:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
	GOTO        L_main18
L_main19:
;TECLADO.c,57 :: 		}
L_main14:
;TECLADO.c,59 :: 		LATB7_bit=~LATB7_bit;
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;TECLADO.c,61 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
	NOP
;TECLADO.c,65 :: 		}
	GOTO        L_main0
;TECLADO.c,67 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
