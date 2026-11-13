
_ds18b20_read:

;ds18b20.h,5 :: 		float ds18b20_read(char *puerto,char pin)
;ds18b20.h,10 :: 		float signo=1.0;
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+0 
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+1 
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+2 
	MOVLW       127
	MOVWF       ds18b20_read_signo_L0+3 
;ds18b20.h,15 :: 		Ow_Reset(puerto, pin);                         // Onewire reset signal
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Reset_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Reset_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;ds18b20.h,16 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_ds18b20_read0:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read0
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read0
	NOP
	NOP
;ds18b20.h,17 :: 		Ow_Write(puerto, pin, 0xCC);                   // dirrecciona todos sensores
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,18 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_ds18b20_read1:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read1
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read1
	NOP
	NOP
;ds18b20.h,19 :: 		Ow_Write(puerto, pin, 0x44);                   //iniica conversion
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       68
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,20 :: 		Delay_ms(150);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_ds18b20_read2:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read2
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read2
	DECFSZ      R11, 1, 1
	BRA         L_ds18b20_read2
;ds18b20.h,22 :: 		Ow_Reset(puerto, pin);
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Reset_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Reset_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;ds18b20.h,23 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_ds18b20_read3:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read3
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read3
	NOP
	NOP
;ds18b20.h,24 :: 		Ow_Write(puerto, pin, 0xCC);
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,25 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_ds18b20_read4:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read4
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read4
	NOP
	NOP
;ds18b20.h,26 :: 		Ow_Write(puerto, pin, 0xBE);
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       190
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,27 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_ds18b20_read5:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read5
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read5
	NOP
	NOP
;ds18b20.h,28 :: 		t1_ =  Ow_Read(puerto, pin);        //lee parte baja
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Read_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Read_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ds18b20_read_t1__L0+0 
;ds18b20.h,29 :: 		t2_ =  Ow_Read(puerto, pin);       //lee parte alta
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Read_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Read_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
;ds18b20.h,31 :: 		temp_=( (unsigned int)t2_<<8) | t1_;
	MOVF        R0, 0 
	MOVWF       ds18b20_read_temp__L0+0 
	MOVLW       0
	MOVWF       ds18b20_read_temp__L0+1 
	MOVF        ds18b20_read_temp__L0+0, 0 
	MOVWF       ds18b20_read_temp__L0+1 
	CLRF        ds18b20_read_temp__L0+0 
	MOVF        ds18b20_read_t1__L0+0, 0 
	IORWF       ds18b20_read_temp__L0+0, 1 
	MOVLW       0
	IORWF       ds18b20_read_temp__L0+1, 1 
;ds18b20.h,34 :: 		if ( t2_ & 0x80)
	BTFSS       R0, 7 
	GOTO        L_ds18b20_read6
;ds18b20.h,36 :: 		temp_=~temp_+1;
	COMF        ds18b20_read_temp__L0+0, 1 
	COMF        ds18b20_read_temp__L0+1, 1 
	INFSNZ      ds18b20_read_temp__L0+0, 1 
	INCF        ds18b20_read_temp__L0+1, 1 
;ds18b20.h,37 :: 		signo=-1.0;
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+0 
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+1 
	MOVLW       128
	MOVWF       ds18b20_read_signo_L0+2 
	MOVLW       127
	MOVWF       ds18b20_read_signo_L0+3 
;ds18b20.h,38 :: 		}
L_ds18b20_read6:
;ds18b20.h,39 :: 		temp_=temp_>>4; //quita la parte decimal
	RRCF        ds18b20_read_temp__L0+1, 1 
	RRCF        ds18b20_read_temp__L0+0, 1 
	BCF         ds18b20_read_temp__L0+1, 7 
	RRCF        ds18b20_read_temp__L0+1, 1 
	RRCF        ds18b20_read_temp__L0+0, 1 
	BCF         ds18b20_read_temp__L0+1, 7 
	RRCF        ds18b20_read_temp__L0+1, 1 
	RRCF        ds18b20_read_temp__L0+0, 1 
	BCF         ds18b20_read_temp__L0+1, 7 
	RRCF        ds18b20_read_temp__L0+1, 1 
	RRCF        ds18b20_read_temp__L0+0, 1 
	BCF         ds18b20_read_temp__L0+1, 7 
;ds18b20.h,41 :: 		td__=t1_ & 0x0f;    //saca parte decima
	MOVLW       15
	ANDWF       ds18b20_read_t1__L0+0, 0 
	MOVWF       ds18b20_read_td___L0+0 
;ds18b20.h,43 :: 		tempo__=0;
	CLRF        ds18b20_read_tempo___L0+0 
	CLRF        ds18b20_read_tempo___L0+1 
	CLRF        ds18b20_read_tempo___L0+2 
	CLRF        ds18b20_read_tempo___L0+3 
;ds18b20.h,44 :: 		if (td__.b3==1)tempo__=tempo__+0.5;
	BTFSS       ds18b20_read_td___L0+0, 3 
	GOTO        L_ds18b20_read7
	MOVF        ds18b20_read_tempo___L0+0, 0 
	MOVWF       R0 
	MOVF        ds18b20_read_tempo___L0+1, 0 
	MOVWF       R1 
	MOVF        ds18b20_read_tempo___L0+2, 0 
	MOVWF       R2 
	MOVF        ds18b20_read_tempo___L0+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       ds18b20_read_tempo___L0+0 
	MOVF        R1, 0 
	MOVWF       ds18b20_read_tempo___L0+1 
	MOVF        R2, 0 
	MOVWF       ds18b20_read_tempo___L0+2 
	MOVF        R3, 0 
	MOVWF       ds18b20_read_tempo___L0+3 
L_ds18b20_read7:
;ds18b20.h,45 :: 		if (td__.b2==1) tempo__=tempo__+0.25;
	BTFSS       ds18b20_read_td___L0+0, 2 
	GOTO        L_ds18b20_read8
	MOVF        ds18b20_read_tempo___L0+0, 0 
	MOVWF       R0 
	MOVF        ds18b20_read_tempo___L0+1, 0 
	MOVWF       R1 
	MOVF        ds18b20_read_tempo___L0+2, 0 
	MOVWF       R2 
	MOVF        ds18b20_read_tempo___L0+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       ds18b20_read_tempo___L0+0 
	MOVF        R1, 0 
	MOVWF       ds18b20_read_tempo___L0+1 
	MOVF        R2, 0 
	MOVWF       ds18b20_read_tempo___L0+2 
	MOVF        R3, 0 
	MOVWF       ds18b20_read_tempo___L0+3 
L_ds18b20_read8:
;ds18b20.h,46 :: 		if (td__.b1==1) tempo__=tempo__+0.125;
	BTFSS       ds18b20_read_td___L0+0, 1 
	GOTO        L_ds18b20_read9
	MOVF        ds18b20_read_tempo___L0+0, 0 
	MOVWF       R0 
	MOVF        ds18b20_read_tempo___L0+1, 0 
	MOVWF       R1 
	MOVF        ds18b20_read_tempo___L0+2, 0 
	MOVWF       R2 
	MOVF        ds18b20_read_tempo___L0+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       ds18b20_read_tempo___L0+0 
	MOVF        R1, 0 
	MOVWF       ds18b20_read_tempo___L0+1 
	MOVF        R2, 0 
	MOVWF       ds18b20_read_tempo___L0+2 
	MOVF        R3, 0 
	MOVWF       ds18b20_read_tempo___L0+3 
L_ds18b20_read9:
;ds18b20.h,47 :: 		if (td__.b0==1) tempo__=tempo__+0.0625;
	BTFSS       ds18b20_read_td___L0+0, 0 
	GOTO        L_ds18b20_read10
	MOVF        ds18b20_read_tempo___L0+0, 0 
	MOVWF       R0 
	MOVF        ds18b20_read_tempo___L0+1, 0 
	MOVWF       R1 
	MOVF        ds18b20_read_tempo___L0+2, 0 
	MOVWF       R2 
	MOVF        ds18b20_read_tempo___L0+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       ds18b20_read_tempo___L0+0 
	MOVF        R1, 0 
	MOVWF       ds18b20_read_tempo___L0+1 
	MOVF        R2, 0 
	MOVWF       ds18b20_read_tempo___L0+2 
	MOVF        R3, 0 
	MOVWF       ds18b20_read_tempo___L0+3 
L_ds18b20_read10:
;ds18b20.h,48 :: 		if (signo<0) tempo__=-tempo__;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        ds18b20_read_signo_L0+0, 0 
	MOVWF       R0 
	MOVF        ds18b20_read_signo_L0+1, 0 
	MOVWF       R1 
	MOVF        ds18b20_read_signo_L0+2, 0 
	MOVWF       R2 
	MOVF        ds18b20_read_signo_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_ds18b20_read11
	BTG         ds18b20_read_tempo___L0+2, 7 
L_ds18b20_read11:
;ds18b20.h,49 :: 		sensor_temp_=(temp_*signo)+tempo__;  //calcula vlor final
	MOVF        ds18b20_read_temp__L0+0, 0 
	MOVWF       R0 
	MOVF        ds18b20_read_temp__L0+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        ds18b20_read_signo_L0+0, 0 
	MOVWF       R4 
	MOVF        ds18b20_read_signo_L0+1, 0 
	MOVWF       R5 
	MOVF        ds18b20_read_signo_L0+2, 0 
	MOVWF       R6 
	MOVF        ds18b20_read_signo_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        ds18b20_read_tempo___L0+0, 0 
	MOVWF       R4 
	MOVF        ds18b20_read_tempo___L0+1, 0 
	MOVWF       R5 
	MOVF        ds18b20_read_tempo___L0+2, 0 
	MOVWF       R6 
	MOVF        ds18b20_read_tempo___L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
;ds18b20.h,51 :: 		return (sensor_temp_);
;ds18b20.h,53 :: 		}
L_end_ds18b20_read:
	RETURN      0
; end of _ds18b20_read

_m1derecha:

;VIRTUINO.c,55 :: 		void m1derecha()
;VIRTUINO.c,57 :: 		m11=1;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;VIRTUINO.c,58 :: 		m12=0;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;VIRTUINO.c,59 :: 		}
L_end_m1derecha:
	RETURN      0
; end of _m1derecha

_m1izquierda:

;VIRTUINO.c,61 :: 		void m1izquierda()
;VIRTUINO.c,63 :: 		m11=0;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;VIRTUINO.c,64 :: 		m12=1;
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
;VIRTUINO.c,65 :: 		}
L_end_m1izquierda:
	RETURN      0
; end of _m1izquierda

_m1quieto:

;VIRTUINO.c,67 :: 		void m1quieto()
;VIRTUINO.c,69 :: 		m11=0;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;VIRTUINO.c,70 :: 		m12=0;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;VIRTUINO.c,71 :: 		}
L_end_m1quieto:
	RETURN      0
; end of _m1quieto

_Uart1_write_text_const:

;VIRTUINO.c,74 :: 		void Uart1_write_text_const(const char *info)
;VIRTUINO.c,76 :: 		while(*info) UART1_Write(*info++);
L_Uart1_write_text_const12:
	MOVF        FARG_Uart1_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_Uart1_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_Uart1_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Uart1_write_text_const13
	MOVF        FARG_Uart1_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_Uart1_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_Uart1_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_UART1_Write_data_+0
	CALL        _UART1_Write+0, 0
	MOVLW       1
	ADDWF       FARG_Uart1_write_text_const_info+0, 1 
	MOVLW       0
	ADDWFC      FARG_Uart1_write_text_const_info+1, 1 
	ADDWFC      FARG_Uart1_write_text_const_info+2, 1 
	GOTO        L_Uart1_write_text_const12
L_Uart1_write_text_const13:
;VIRTUINO.c,77 :: 		}
L_end_Uart1_write_text_const:
	RETURN      0
; end of _Uart1_write_text_const

_soft_Uart_write_text:

;VIRTUINO.c,79 :: 		void soft_Uart_write_text(char *info)
;VIRTUINO.c,81 :: 		while(*info) Soft_UART_Write(*info++);
L_soft_Uart_write_text14:
	MOVFF       FARG_soft_Uart_write_text_info+0, FSR0L+0
	MOVFF       FARG_soft_Uart_write_text_info+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_soft_Uart_write_text15
	MOVFF       FARG_soft_Uart_write_text_info+0, FSR0L+0
	MOVFF       FARG_soft_Uart_write_text_info+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
	INFSNZ      FARG_soft_Uart_write_text_info+0, 1 
	INCF        FARG_soft_Uart_write_text_info+1, 1 
	GOTO        L_soft_Uart_write_text14
L_soft_Uart_write_text15:
;VIRTUINO.c,82 :: 		}
L_end_soft_Uart_write_text:
	RETURN      0
; end of _soft_Uart_write_text

_soft_Uart_write_text_const:

;VIRTUINO.c,85 :: 		void soft_Uart_write_text_const(const char *info)
;VIRTUINO.c,87 :: 		while(*info) Soft_UART_Write(*info++);
L_soft_Uart_write_text_const16:
	MOVF        FARG_soft_Uart_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_soft_Uart_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_soft_Uart_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_soft_Uart_write_text_const17
	MOVF        FARG_soft_Uart_write_text_const_info+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_soft_Uart_write_text_const_info+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_soft_Uart_write_text_const_info+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Soft_UART_Write_udata+0
	CALL        _Soft_UART_Write+0, 0
	MOVLW       1
	ADDWF       FARG_soft_Uart_write_text_const_info+0, 1 
	MOVLW       0
	ADDWFC      FARG_soft_Uart_write_text_const_info+1, 1 
	ADDWFC      FARG_soft_Uart_write_text_const_info+2, 1 
	GOTO        L_soft_Uart_write_text_const16
L_soft_Uart_write_text_const17:
;VIRTUINO.c,88 :: 		}
L_end_soft_Uart_write_text_const:
	RETURN      0
; end of _soft_Uart_write_text_const

_procesarx:

;VIRTUINO.c,92 :: 		void procesarx()
;VIRTUINO.c,101 :: 		strcpy(procesa, strtok(trama_rx, "V"));  //inicia captura de tokens desde el V
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr1_VIRTUINO+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr1_VIRTUINO+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;VIRTUINO.c,103 :: 		for (son=0; son<total_variables-1;son++)
	CLRF        procesarx_son_L0+0 
L_procesarx18:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORLW       0
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__procesarx66
	MOVLW       5
	SUBWF       procesarx_son_L0+0, 0 
L__procesarx66:
	BTFSC       STATUS+0, 0 
	GOTO        L_procesarx19
;VIRTUINO.c,107 :: 		strcpy(procesa, strtok(0, "="));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr2_VIRTUINO+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr2_VIRTUINO+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;VIRTUINO.c,108 :: 		variable=atoi(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       procesarx_variable_L0+0 
;VIRTUINO.c,110 :: 		strcpy(procesa, strtok(0, "$"));  //captura hasta el $
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr3_VIRTUINO+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr3_VIRTUINO+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;VIRTUINO.c,113 :: 		if (procesa[0]!='?')
	MOVF        _procesa+0, 0 
	XORLW       63
	BTFSC       STATUS+0, 2 
	GOTO        L_procesarx21
;VIRTUINO.c,115 :: 		if (variable==0) led1=atoi(procesa);
	MOVF        procesarx_variable_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_procesarx22
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	BTFSC       R0, 0 
	GOTO        L__procesarx67
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
	GOTO        L__procesarx68
L__procesarx67:
	BSF         RC5_bit+0, BitPos(RC5_bit+0) 
L__procesarx68:
	GOTO        L_procesarx23
L_procesarx22:
;VIRTUINO.c,116 :: 		else if (variable==1)  led2=atoi(procesa);
	MOVF        procesarx_variable_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_procesarx24
	MOVLW       _procesa+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	BTFSC       R0, 0 
	GOTO        L__procesarx69
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__procesarx70
L__procesarx69:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__procesarx70:
	GOTO        L_procesarx25
L_procesarx24:
;VIRTUINO.c,117 :: 		else if (variable==2)
	MOVF        procesarx_variable_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_procesarx26
;VIRTUINO.c,119 :: 		pwm=atof(procesa);
	MOVLW       _procesa+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _pwm+0 
	MOVF        R1, 0 
	MOVWF       _pwm+1 
	MOVF        R2, 0 
	MOVWF       _pwm+2 
	MOVF        R3, 0 
	MOVWF       _pwm+3 
;VIRTUINO.c,120 :: 		PWM1_Set_Duty(pwm);
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;VIRTUINO.c,121 :: 		}
L_procesarx26:
L_procesarx25:
L_procesarx23:
;VIRTUINO.c,122 :: 		} //si del     ?
L_procesarx21:
;VIRTUINO.c,125 :: 		strcpy(procesa, strtok(0, "V"));  //apunta a la otra varaible V
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr4_VIRTUINO+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr4_VIRTUINO+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _procesa+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_procesa+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;VIRTUINO.c,103 :: 		for (son=0; son<total_variables-1;son++)
	INCF        procesarx_son_L0+0, 1 
;VIRTUINO.c,127 :: 		}// fin del for de son
	GOTO        L_procesarx18
L_procesarx19:
;VIRTUINO.c,129 :: 		}
L_end_procesarx:
	RETURN      0
; end of _procesarx

_manda_AT_COMANDO:

;VIRTUINO.c,132 :: 		void manda_AT_COMANDO(char *coman)
;VIRTUINO.c,135 :: 		Uart1_write_text(coman);//manda el comando
	MOVF        FARG_manda_AT_COMANDO_coman+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_AT_COMANDO_coman+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;VIRTUINO.c,136 :: 		Uart1_write_text_const("\r\n"); // manda final de linea
	MOVLW       ?lstr_5_VIRTUINO+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_5_VIRTUINO+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_5_VIRTUINO+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;VIRTUINO.c,137 :: 		}
L_end_manda_AT_COMANDO:
	RETURN      0
; end of _manda_AT_COMANDO

_manda_esp8266:

;VIRTUINO.c,140 :: 		void manda_esp8266(char *info)
;VIRTUINO.c,143 :: 		Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_6_VIRTUINO+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_6_VIRTUINO+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_6_VIRTUINO+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;VIRTUINO.c,144 :: 		UART1_Write('0');    //manda el socket  el cual se conecto
	MOVLW       48
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;VIRTUINO.c,145 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;VIRTUINO.c,146 :: 		largo=strlen(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
;VIRTUINO.c,147 :: 		sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_7_VIRTUINO+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_7_VIRTUINO+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_7_VIRTUINO+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;VIRTUINO.c,148 :: 		UART1_Write_Text(captu); //envia el largo d ela trama
	MOVLW       _captu+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;VIRTUINO.c,149 :: 		Uart1_write_text_const("\r\n");
	MOVLW       ?lstr_8_VIRTUINO+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_8_VIRTUINO+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_8_VIRTUINO+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;VIRTUINO.c,150 :: 		Delay_ms(300); //retardo antes de enviar la trama
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_manda_esp826627:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp826627
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp826627
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp826627
	NOP
	NOP
;VIRTUINO.c,151 :: 		Uart1_write_text(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;VIRTUINO.c,152 :: 		Delay_ms(300); //retardo antes de enviar la trama
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_manda_esp826628:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp826628
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp826628
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp826628
	NOP
	NOP
;VIRTUINO.c,154 :: 		}
L_end_manda_esp8266:
	RETURN      0
; end of _manda_esp8266

_interrupcion:

;VIRTUINO.c,158 :: 		void interrupcion() iv 0x0008 ics ICS_AUTO
;VIRTUINO.c,161 :: 		if (RCIF_bit==1)       // si es serial
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion29
;VIRTUINO.c,164 :: 		datorx=UART1_Read();  //lee el dato
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datorx+0 
;VIRTUINO.c,166 :: 		switch (estado)
	GOTO        L_interrupcion30
;VIRTUINO.c,169 :: 		case Adm:
L_interrupcion32:
;VIRTUINO.c,170 :: 		trama_rx[puntero]=datorx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _datorx+0, 0 
	MOVWF       POSTINC1+0 
;VIRTUINO.c,171 :: 		if (datorx!='!') puntero=0;    //no fue el dato que me interesa
	MOVF        _datorx+0, 0 
	XORLW       33
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion33
	CLRF        _puntero+0 
	GOTO        L_interrupcion34
L_interrupcion33:
;VIRTUINO.c,174 :: 		puntero++;//incrementa contador para proximo dato
	INCF        _puntero+0, 1 
;VIRTUINO.c,175 :: 		estado=V_; //pasa al estado de capturar la u
	MOVLW       1
	MOVWF       _estado+0 
;VIRTUINO.c,176 :: 		}
L_interrupcion34:
;VIRTUINO.c,177 :: 		break;
	GOTO        L_interrupcion31
;VIRTUINO.c,180 :: 		case V_:
L_interrupcion35:
;VIRTUINO.c,181 :: 		trama_rx[puntero]=datorx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _datorx+0, 0 
	MOVWF       POSTINC1+0 
;VIRTUINO.c,182 :: 		if (datorx!='V')
	MOVF        _datorx+0, 0 
	XORLW       86
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion36
;VIRTUINO.c,184 :: 		puntero=0;
	CLRF        _puntero+0 
;VIRTUINO.c,185 :: 		estado=Adm; //regresa al estado inical
	CLRF        _estado+0 
;VIRTUINO.c,186 :: 		}
	GOTO        L_interrupcion37
L_interrupcion36:
;VIRTUINO.c,189 :: 		puntero++;//incrementa contador para proximo dato
	INCF        _puntero+0, 1 
;VIRTUINO.c,192 :: 		flag_timer=0;
	CLRF        _flag_timer+0 
;VIRTUINO.c,195 :: 		TMR1H=158;
	MOVLW       158
	MOVWF       TMR1H+0 
;VIRTUINO.c,196 :: 		TMR1L=88;
	MOVLW       88
	MOVWF       TMR1L+0 
;VIRTUINO.c,197 :: 		TMR1IF_bit=0;// limpia la bendera
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;VIRTUINO.c,198 :: 		TMR1IE_bit=1;// habilita la inetrrpcion
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;VIRTUINO.c,199 :: 		TMR1ON_bit=1;//prende el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;VIRTUINO.c,201 :: 		estado=fin; //pasa al estado de capturar el prmer 0  en este cado digito del primer
	MOVLW       2
	MOVWF       _estado+0 
;VIRTUINO.c,202 :: 		}
L_interrupcion37:
;VIRTUINO.c,203 :: 		break;
	GOTO        L_interrupcion31
;VIRTUINO.c,205 :: 		case fin:
L_interrupcion38:
;VIRTUINO.c,206 :: 		trama_rx[puntero]=datorx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _datorx+0, 0 
	MOVWF       POSTINC1+0 
;VIRTUINO.c,207 :: 		puntero++;
	INCF        _puntero+0, 1 
;VIRTUINO.c,208 :: 		if (puntero>=100)
	MOVLW       100
	SUBWF       _puntero+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion39
;VIRTUINO.c,209 :: 		{ puntero=0;
	CLRF        _puntero+0 
;VIRTUINO.c,210 :: 		estado=Adm;
	CLRF        _estado+0 
;VIRTUINO.c,211 :: 		}
L_interrupcion39:
;VIRTUINO.c,213 :: 		if (flag_timer==1)
	MOVF        _flag_timer+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion40
;VIRTUINO.c,216 :: 		trama_rx[puntero]=0;    // agrega final d ela linea
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _puntero+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	CLRF        POSTINC1+0 
;VIRTUINO.c,218 :: 		RCIE_bit=0; //deshabilita la interrucion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;VIRTUINO.c,219 :: 		flag_rx=1;  //activa la bandera de que hat una trama valida
	MOVLW       1
	MOVWF       _flag_rx+0 
;VIRTUINO.c,220 :: 		estado=Adm;// RESETEA EL ESTADO
	CLRF        _estado+0 
;VIRTUINO.c,221 :: 		flag_timer=0;//limpia la bandera tiemr
	CLRF        _flag_timer+0 
;VIRTUINO.c,223 :: 		}
L_interrupcion40:
;VIRTUINO.c,224 :: 		break;
	GOTO        L_interrupcion31
;VIRTUINO.c,227 :: 		}  // fin de switch estado
L_interrupcion30:
	MOVF        _estado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion32
	MOVF        _estado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion35
	MOVF        _estado+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion38
L_interrupcion31:
;VIRTUINO.c,228 :: 		RCIF_bit=0; /// limpia la bandera de interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;VIRTUINO.c,229 :: 		}  // fin de la interrucpion serial
L_interrupcion29:
;VIRTUINO.c,232 :: 		if (TMR1IF_bit==1)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupcion41
;VIRTUINO.c,234 :: 		timer_cont++; // varible
	INCF        _timer_cont+0, 1 
;VIRTUINO.c,235 :: 		if (timer_cont>=4)  // tiempo de espero 50ms*4= 200msseg  // colocat para que pueda captura toda la trama
	MOVLW       4
	SUBWF       _timer_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion42
;VIRTUINO.c,237 :: 		TMR1IE_bit=0;// deshabilita la interrpcion de tiner
	BCF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;VIRTUINO.c,238 :: 		TMR1ON_bit=0;// para el timer
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;VIRTUINO.c,239 :: 		timer_cont=0;     // limpia el contador de timer
	CLRF        _timer_cont+0 
;VIRTUINO.c,240 :: 		flag_timer=1;
	MOVLW       1
	MOVWF       _flag_timer+0 
;VIRTUINO.c,241 :: 		}
L_interrupcion42:
;VIRTUINO.c,244 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;VIRTUINO.c,245 :: 		}
L_interrupcion41:
;VIRTUINO.c,249 :: 		}
L_end_interrupcion:
L__interrupcion74:
	RETFIE      1
; end of _interrupcion

_main:

;VIRTUINO.c,251 :: 		void main()
;VIRTUINO.c,254 :: 		ANSEL=0;
	CLRF        ANSEL+0 
;VIRTUINO.c,255 :: 		ANSELH=0;
	CLRF        ANSELH+0 
;VIRTUINO.c,257 :: 		trisb.b0=0;//salida m11
	BCF         TRISB+0, 0 
;VIRTUINO.c,258 :: 		trisb.b1=0;//salida m12
	BCF         TRISB+0, 1 
;VIRTUINO.c,259 :: 		trisc.b2=0; //salida pin PWM
	BCF         TRISC+0, 2 
;VIRTUINO.c,260 :: 		trisc.B4=0; //salida led2
	BCF         TRISC+0, 4 
;VIRTUINO.c,261 :: 		trisc.b5=0; //salida led 1
	BCF         TRISC+0, 5 
;VIRTUINO.c,262 :: 		trisc.b3=0; //salida led 3
	BCF         TRISC+0, 3 
;VIRTUINO.c,264 :: 		trisb.b6=1; //entrada del suiche1
	BSF         TRISB+0, 6 
;VIRTUINO.c,266 :: 		trisb.b7=1; //entrada del suiche2
	BSF         TRISB+0, 7 
;VIRTUINO.c,269 :: 		NOT_RBPU_bit=0;
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
;VIRTUINO.c,272 :: 		uart1_init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;VIRTUINO.c,275 :: 		pwm1_init(1250);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;VIRTUINO.c,276 :: 		PWM1_Set_Duty(100);//inia un valor inicial en el pwm
	MOVLW       100
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;VIRTUINO.c,277 :: 		PWM1_Start();// prende el modulo pwm
	CALL        _PWM1_Start+0, 0
;VIRTUINO.c,280 :: 		m1quieto();
	CALL        _m1quieto+0, 0
;VIRTUINO.c,281 :: 		led1=0;
	BCF         RC5_bit+0, BitPos(RC5_bit+0) 
;VIRTUINO.c,282 :: 		led2=0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;VIRTUINO.c,284 :: 		Soft_UART_Init(&PORTA, 2, 1, 9600, 0);  // inicializa un puerto por software
	MOVLW       PORTA+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       2
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       1
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       128
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       37
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
;VIRTUINO.c,287 :: 		manda_AT_COMANDO("ATE0");  //SIN ECO
	MOVLW       ?lstr9_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr9_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,288 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	DECFSZ      R11, 1, 1
	BRA         L_main43
	NOP
;VIRTUINO.c,289 :: 		manda_AT_COMANDO("AT+CWMODE=2"); //ACTUA COMO  ROUTER CREA UNA RED PROPIA
	MOVLW       ?lstr10_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr10_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,290 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	DECFSZ      R11, 1, 1
	BRA         L_main44
;VIRTUINO.c,294 :: 		manda_AT_COMANDO("AT+CIPSERVER=0");  //cierra sevidores
	MOVLW       ?lstr11_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr11_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,295 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main45:
	DECFSZ      R13, 1, 1
	BRA         L_main45
	DECFSZ      R12, 1, 1
	BRA         L_main45
	DECFSZ      R11, 1, 1
	BRA         L_main45
;VIRTUINO.c,296 :: 		manda_AT_COMANDO("AT+CIPMUX=0");   //pone conexion un unica
	MOVLW       ?lstr12_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr12_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,297 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main46:
	DECFSZ      R13, 1, 1
	BRA         L_main46
	DECFSZ      R12, 1, 1
	BRA         L_main46
	DECFSZ      R11, 1, 1
	BRA         L_main46
;VIRTUINO.c,298 :: 		manda_AT_COMANDO("AT+CIPMODE=0"); //Trabaja en modo normal
	MOVLW       ?lstr13_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr13_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,299 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main47:
	DECFSZ      R13, 1, 1
	BRA         L_main47
	DECFSZ      R12, 1, 1
	BRA         L_main47
	DECFSZ      R11, 1, 1
	BRA         L_main47
;VIRTUINO.c,302 :: 		manda_AT_COMANDO("AT+CWSAP=\"ESP8266_ARZ\",\"noconectar\",5,3");
	MOVLW       ?lstr14_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr14_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,303 :: 		delay_ms(600);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main48:
	DECFSZ      R13, 1, 1
	BRA         L_main48
	DECFSZ      R12, 1, 1
	BRA         L_main48
	DECFSZ      R11, 1, 1
	BRA         L_main48
	NOP
;VIRTUINO.c,305 :: 		manda_AT_COMANDO("AT+CIPAP=\"192.168.1.254\"");
	MOVLW       ?lstr15_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr15_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,306 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main49:
	DECFSZ      R13, 1, 1
	BRA         L_main49
	DECFSZ      R12, 1, 1
	BRA         L_main49
	DECFSZ      R11, 1, 1
	BRA         L_main49
;VIRTUINO.c,307 :: 		manda_AT_COMANDO("AT+CIPMUX=1");  //habilita multiples conexiones
	MOVLW       ?lstr16_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr16_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,308 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main50:
	DECFSZ      R13, 1, 1
	BRA         L_main50
	DECFSZ      R12, 1, 1
	BRA         L_main50
	DECFSZ      R11, 1, 1
	BRA         L_main50
;VIRTUINO.c,311 :: 		manda_AT_COMANDO("AT+CIPSERVER=1,100");
	MOVLW       ?lstr17_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr17_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,312 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main51:
	DECFSZ      R13, 1, 1
	BRA         L_main51
	DECFSZ      R12, 1, 1
	BRA         L_main51
	DECFSZ      R11, 1, 1
	BRA         L_main51
;VIRTUINO.c,314 :: 		manda_AT_COMANDO("AT+CIPSTO=0");    //0  siempre(todo el tiempo)
	MOVLW       ?lstr18_VIRTUINO+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr18_VIRTUINO+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	CALL        _manda_AT_COMANDO+0, 0
;VIRTUINO.c,315 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main52:
	DECFSZ      R13, 1, 1
	BRA         L_main52
	DECFSZ      R12, 1, 1
	BRA         L_main52
	DECFSZ      R11, 1, 1
	BRA         L_main52
;VIRTUINO.c,317 :: 		INTCON=0b01000000;//habilita interrpciones de perifericos
	MOVLW       64
	MOVWF       INTCON+0 
;VIRTUINO.c,319 :: 		RCIF_bit=0; //limpia bandesta interrpcion serial
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;VIRTUINO.c,320 :: 		RCIE_bit=1; // habilite la interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;VIRTUINO.c,323 :: 		RCEN_bit=0;
	BCF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;VIRTUINO.c,324 :: 		RCEN_bit=1;
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;VIRTUINO.c,327 :: 		T1CON=0;
	CLRF        T1CON+0 
;VIRTUINO.c,329 :: 		TMR1H=158;
	MOVLW       158
	MOVWF       TMR1H+0 
;VIRTUINO.c,330 :: 		TMR1L=88;
	MOVLW       88
	MOVWF       TMR1L+0 
;VIRTUINO.c,332 :: 		T1CKPS1_bit=1;
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;VIRTUINO.c,333 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;VIRTUINO.c,335 :: 		TMR1ON_bit=0;  // pago timer
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;VIRTUINO.c,336 :: 		TMR1IF_bit=0;   // limpia bandera
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;VIRTUINO.c,339 :: 		GIE_bit=1; //autoriza todas las interrepciones programadas
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;VIRTUINO.c,340 :: 		temperatura=ds18b20_read(&portb,5); // lectura neecsaria para calibarar els ensor
	MOVLW       PORTB+0
	MOVWF       FARG_ds18b20_read_puerto+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_ds18b20_read_puerto+1 
	MOVLW       5
	MOVWF       FARG_ds18b20_read_pin+0 
	CALL        _ds18b20_read+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;VIRTUINO.c,341 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
	NOP
;VIRTUINO.c,342 :: 		soft_Uart_write_text_const("INICIANDO\r\n");
	MOVLW       ?lstr_19_VIRTUINO+0
	MOVWF       FARG_soft_Uart_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_19_VIRTUINO+0)
	MOVWF       FARG_soft_Uart_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_19_VIRTUINO+0)
	MOVWF       FARG_soft_Uart_write_text_const_info+2 
	CALL        _soft_Uart_write_text_const+0, 0
;VIRTUINO.c,346 :: 		while (1)
L_main54:
;VIRTUINO.c,349 :: 		temperatura=ds18b20_read(&portb,5); // lectura neecsaria para calibarar els ensor
	MOVLW       PORTB+0
	MOVWF       FARG_ds18b20_read_puerto+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_ds18b20_read_puerto+1 
	MOVLW       5
	MOVWF       FARG_ds18b20_read_pin+0 
	CALL        _ds18b20_read+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;VIRTUINO.c,352 :: 		if (flag_rx==1)
	MOVF        _flag_rx+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
;VIRTUINO.c,354 :: 		soft_Uart_write_text_const("\r\n ME LLEGO=");
	MOVLW       ?lstr_20_VIRTUINO+0
	MOVWF       FARG_soft_Uart_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_20_VIRTUINO+0)
	MOVWF       FARG_soft_Uart_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_20_VIRTUINO+0)
	MOVWF       FARG_soft_Uart_write_text_const_info+2 
	CALL        _soft_Uart_write_text_const+0, 0
;VIRTUINO.c,355 :: 		soft_Uart_write_text(trama_rx);
	MOVLW       _trama_rx+0
	MOVWF       FARG_soft_Uart_write_text_info+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_soft_Uart_write_text_info+1 
	CALL        _soft_Uart_write_text+0, 0
;VIRTUINO.c,356 :: 		procesarx();
	CALL        _procesarx+0, 0
;VIRTUINO.c,357 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main57:
	DECFSZ      R13, 1, 1
	BRA         L_main57
	DECFSZ      R12, 1, 1
	BRA         L_main57
	DECFSZ      R11, 1, 1
	BRA         L_main57
	NOP
;VIRTUINO.c,358 :: 		sprintf(trama_tx,"!V03=%d$!V04=%d$!V05=%.1f$",(unsigned int)!suiche1,(unsigned int)!suiche2,temperatura);
	MOVLW       _trama_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_21_VIRTUINO+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_21_VIRTUINO+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_21_VIRTUINO+0)
	MOVWF       FARG_sprintf_f+2 
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__main76
	BSF         STATUS+0, 0 
	GOTO        L__main77
L__main76:
	BCF         STATUS+0, 0 
L__main77:
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       FARG_sprintf_wh+5 
	CLRF        FARG_sprintf_wh+6 
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__main78
	BSF         STATUS+0, 0 
	GOTO        L__main79
L__main78:
	BCF         STATUS+0, 0 
L__main79:
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       FARG_sprintf_wh+7 
	CLRF        FARG_sprintf_wh+8 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+12 
	CALL        _sprintf+0, 0
;VIRTUINO.c,359 :: 		manda_esp8266(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_manda_esp8266_info+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_manda_esp8266_info+1 
	CALL        _manda_esp8266+0, 0
;VIRTUINO.c,361 :: 		puntero=0; //inicializa el conteo
	CLRF        _puntero+0 
;VIRTUINO.c,362 :: 		memset(trama_rx,0,100); //limpia la trama
	MOVLW       _trama_rx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       100
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;VIRTUINO.c,363 :: 		flag_rx=0;
	CLRF        _flag_rx+0 
;VIRTUINO.c,366 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;VIRTUINO.c,367 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;VIRTUINO.c,369 :: 		RCIF_bit=0;    //limpia la bandera de la interrpcion
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;VIRTUINO.c,370 :: 		RCIE_bit=1;   //habilita la Interrpcion serial
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;VIRTUINO.c,371 :: 		}
L_main56:
;VIRTUINO.c,375 :: 		}
	GOTO        L_main54
;VIRTUINO.c,378 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
