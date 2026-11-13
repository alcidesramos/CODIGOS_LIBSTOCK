
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
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_ds18b20_read0:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read0
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read0
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
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_ds18b20_read1:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read1
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read1
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
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
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
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_ds18b20_read3:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read3
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read3
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
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_ds18b20_read4:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read4
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read4
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
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_ds18b20_read5:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read5
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read5
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

_Uart1_write_text_const:

;ESP8266.c,79 :: 		void Uart1_write_text_const(const char *info)
;ESP8266.c,81 :: 		while(*info) UART1_Write(*info++);
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
;ESP8266.c,82 :: 		}
L_end_Uart1_write_text_const:
	RETURN      0
; end of _Uart1_write_text_const

_soft_Uart_write_text:

;ESP8266.c,84 :: 		void soft_Uart_write_text(char *info)
;ESP8266.c,86 :: 		while(*info) Soft_UART_Write(*info++);
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
;ESP8266.c,87 :: 		}
L_end_soft_Uart_write_text:
	RETURN      0
; end of _soft_Uart_write_text

_soft_Uart_write_text_const:

;ESP8266.c,90 :: 		void soft_Uart_write_text_const(const char *info)
;ESP8266.c,92 :: 		while(*info) Soft_UART_Write(*info++);
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
;ESP8266.c,93 :: 		}
L_end_soft_Uart_write_text_const:
	RETURN      0
; end of _soft_Uart_write_text_const

_Soft_UART_Read_Text:

;ESP8266.c,95 :: 		void Soft_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama,char cuanto)
;ESP8266.c,97 :: 		unsigned int con_t=0;
	CLRF        Soft_UART_Read_Text_con_t_L0+0 
	CLRF        Soft_UART_Read_Text_con_t_L0+1 
;ESP8266.c,100 :: 		while(*(Buffer-1)!=StopChar)   //mientras no llegue el caracter deseado
L_Soft_UART_Read_Text18:
	MOVLW       1
	SUBWF       FARG_Soft_UART_Read_Text_Buffer+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	SUBWFB      FARG_Soft_UART_Read_Text_Buffer+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORWF       FARG_Soft_UART_Read_Text_StopChar+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Soft_UART_Read_Text19
;ESP8266.c,102 :: 		con_t++;
	INFSNZ      Soft_UART_Read_Text_con_t_L0+0, 1 
	INCF        Soft_UART_Read_Text_con_t_L0+1, 1 
;ESP8266.c,103 :: 		dato=Soft_UART_Read(&error);  //sigue almacenando en el buffer
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
;ESP8266.c,104 :: 		*Buffer++=dato;
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+0, FSR1L+0
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Soft_UART_Read_Text_Buffer+0, 1 
	INCF        FARG_Soft_UART_Read_Text_Buffer+1, 1 
;ESP8266.c,105 :: 		if (con_t>=tama) break;
	MOVF        FARG_Soft_UART_Read_Text_tama+1, 0 
	SUBWF       Soft_UART_Read_Text_con_t_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Soft_UART_Read_Text116
	MOVF        FARG_Soft_UART_Read_Text_tama+0, 0 
	SUBWF       Soft_UART_Read_Text_con_t_L0+0, 0 
L__Soft_UART_Read_Text116:
	BTFSS       STATUS+0, 0 
	GOTO        L_Soft_UART_Read_Text20
	GOTO        L_Soft_UART_Read_Text19
L_Soft_UART_Read_Text20:
;ESP8266.c,106 :: 		}
	GOTO        L_Soft_UART_Read_Text18
L_Soft_UART_Read_Text19:
;ESP8266.c,107 :: 		*--Buffer=0; //coloca un cero al final para que sea una cadena
	MOVLW       1
	SUBWF       FARG_Soft_UART_Read_Text_Buffer+0, 1 
	MOVLW       0
	SUBWFB      FARG_Soft_UART_Read_Text_Buffer+1, 1 
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+0, FSR1L+0
	MOVFF       FARG_Soft_UART_Read_Text_Buffer+1, FSR1H+0
	CLRF        POSTINC1+0 
;ESP8266.c,108 :: 		}
L_end_Soft_UART_Read_Text:
	RETURN      0
; end of _Soft_UART_Read_Text

_tiempo:

;ESP8266.c,110 :: 		char tiempo(unsigned int milis, char cap[15], char cap1[15])
;ESP8266.c,114 :: 		estado_rec=normal;
	CLRF        _estado_rec+0 
;ESP8266.c,115 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;ESP8266.c,116 :: 		memset(trama_rx,0,100);// LIMPIA LA TRAMA
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
;ESP8266.c,117 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;ESP8266.c,119 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,120 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,121 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,122 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo21:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo21
	DECFSZ      R12, 1, 1
	BRA         L_tiempo21
;ESP8266.c,123 :: 		for (cont1=1;cont1<=milis;cont1++)
	MOVLW       1
	MOVWF       tiempo_cont1_L0+0 
	MOVLW       0
	MOVWF       tiempo_cont1_L0+1 
L_tiempo22:
	MOVF        tiempo_cont1_L0+1, 0 
	SUBWF       FARG_tiempo_milis+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo118
	MOVF        tiempo_cont1_L0+0, 0 
	SUBWF       FARG_tiempo_milis+0, 0 
L__tiempo118:
	BTFSS       STATUS+0, 0 
	GOTO        L_tiempo23
;ESP8266.c,125 :: 		delay_Ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_tiempo25:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo25
	DECFSZ      R12, 1, 1
	BRA         L_tiempo25
	NOP
;ESP8266.c,127 :: 		if (strstr(trama_rx,cap)!=0 )
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_tiempo_cap+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_tiempo_cap+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo119
	MOVLW       0
	XORWF       R0, 0 
L__tiempo119:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo26
;ESP8266.c,129 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,130 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo27:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo27
	DECFSZ      R12, 1, 1
	BRA         L_tiempo27
;ESP8266.c,131 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_tiempo
;ESP8266.c,132 :: 		}
L_tiempo26:
;ESP8266.c,133 :: 		else  if (strstr(trama_rx,cap1)!=0 )
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVF        FARG_tiempo_cap1+0, 0 
	MOVWF       FARG_strstr_s2+0 
	MOVF        FARG_tiempo_cap1+1, 0 
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo120
	MOVLW       0
	XORWF       R0, 0 
L__tiempo120:
	BTFSC       STATUS+0, 2 
	GOTO        L_tiempo29
;ESP8266.c,135 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,136 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo30:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo30
	DECFSZ      R12, 1, 1
	BRA         L_tiempo30
;ESP8266.c,137 :: 		return(2);
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_tiempo
;ESP8266.c,138 :: 		}
L_tiempo29:
;ESP8266.c,123 :: 		for (cont1=1;cont1<=milis;cont1++)
	INFSNZ      tiempo_cont1_L0+0, 1 
	INCF        tiempo_cont1_L0+1, 1 
;ESP8266.c,139 :: 		}
	GOTO        L_tiempo22
L_tiempo23:
;ESP8266.c,141 :: 		RCIE_bit=0; // deshabilita la interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,142 :: 		return(0);
	CLRF        R0 
;ESP8266.c,143 :: 		}
L_end_tiempo:
	RETURN      0
; end of _tiempo

_manda_AT_COMANDO:

;ESP8266.c,146 :: 		char manda_AT_COMANDO(char *coman, char cap[15], char cap1[15],unsigned int retardo)
;ESP8266.c,149 :: 		Uart1_write_text(coman);//manda el comando
	MOVF        FARG_manda_AT_COMANDO_coman+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_AT_COMANDO_coman+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP8266.c,150 :: 		Uart1_write_text_const("\r\n"); // manda final de linea
	MOVLW       ?lstr_1_ESP8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_1_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_1_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;ESP8266.c,151 :: 		return (tiempo(retardo,cap,cap1));
	MOVF        FARG_manda_AT_COMANDO_retardo+0, 0 
	MOVWF       FARG_tiempo_milis+0 
	MOVF        FARG_manda_AT_COMANDO_retardo+1, 0 
	MOVWF       FARG_tiempo_milis+1 
	MOVF        FARG_manda_AT_COMANDO_cap+0, 0 
	MOVWF       FARG_tiempo_cap+0 
	MOVF        FARG_manda_AT_COMANDO_cap+1, 0 
	MOVWF       FARG_tiempo_cap+1 
	MOVF        FARG_manda_AT_COMANDO_cap1+0, 0 
	MOVWF       FARG_tiempo_cap1+0 
	MOVF        FARG_manda_AT_COMANDO_cap1+1, 0 
	MOVWF       FARG_tiempo_cap1+1 
	CALL        _tiempo+0, 0
;ESP8266.c,152 :: 		}
L_end_manda_AT_COMANDO:
	RETURN      0
; end of _manda_AT_COMANDO

_strlen_const:

;ESP8266.c,155 :: 		unsigned long strlen_const(const char *const_pun)
;ESP8266.c,157 :: 		unsigned int cuen_const=0;
	CLRF        strlen_const_cuen_const_L0+0 
	CLRF        strlen_const_cuen_const_L0+1 
;ESP8266.c,159 :: 		while (*const_pun++!=0) cuen_const++;
L_strlen_const31:
	MOVF        FARG_strlen_const_const_pun+0, 0 
	MOVWF       R0 
	MOVF        FARG_strlen_const_const_pun+1, 0 
	MOVWF       R1 
	MOVF        FARG_strlen_const_const_pun+2, 0 
	MOVWF       R2 
	MOVLW       1
	ADDWF       FARG_strlen_const_const_pun+0, 1 
	MOVLW       0
	ADDWFC      FARG_strlen_const_const_pun+1, 1 
	ADDWFC      FARG_strlen_const_const_pun+2, 1 
	MOVF        R0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        R1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        R2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_strlen_const32
	INFSNZ      strlen_const_cuen_const_L0+0, 1 
	INCF        strlen_const_cuen_const_L0+1, 1 
	GOTO        L_strlen_const31
L_strlen_const32:
;ESP8266.c,160 :: 		return (cuen_const);
	MOVF        strlen_const_cuen_const_L0+0, 0 
	MOVWF       R0 
	MOVF        strlen_const_cuen_const_L0+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
;ESP8266.c,162 :: 		}
L_end_strlen_const:
	RETURN      0
; end of _strlen_const

_manda_esp8266_const:

;ESP8266.c,165 :: 		void manda_esp8266_const(const char *info)
;ESP8266.c,168 :: 		Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_2_ESP8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_2_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_2_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;ESP8266.c,169 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ESP8266.c,170 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ESP8266.c,171 :: 		largo=strlen_const(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_strlen_const_const_pun+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_strlen_const_const_pun+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_strlen_const_const_pun+2 
	CALL        _strlen_const+0, 0
;ESP8266.c,172 :: 		sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_3_ESP8266+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_3_ESP8266+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_3_ESP8266+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;ESP8266.c,173 :: 		UART1_Write_Text(captu); //envia el largo d ela trama
	MOVLW       _captu+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP8266.c,174 :: 		Uart1_write_text_const("\r\n");
	MOVLW       ?lstr_4_ESP8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_4_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_4_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;ESP8266.c,175 :: 		Delay_ms(100); //retardo antes de enviar la trama
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_manda_esp8266_const33:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp8266_const33
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp8266_const33
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp8266_const33
	NOP
;ESP8266.c,176 :: 		Uart1_write_text_const(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_const_info+0, 0 
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVF        FARG_manda_esp8266_const_info+1, 0 
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVF        FARG_manda_esp8266_const_info+2, 0 
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;ESP8266.c,177 :: 		}
L_end_manda_esp8266_const:
	RETURN      0
; end of _manda_esp8266_const

_manda_esp8266:

;ESP8266.c,180 :: 		void manda_esp8266(char *info)
;ESP8266.c,183 :: 		Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
	MOVLW       ?lstr_5_ESP8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_5_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_5_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;ESP8266.c,184 :: 		UART1_Write('4');    //manda el socket  el cual se conecto
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ESP8266.c,185 :: 		UART1_Write(',');
	MOVLW       44
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ESP8266.c,186 :: 		largo=strlen(info);  //calcula el largo de la cadena a enviar
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
;ESP8266.c,187 :: 		sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
	MOVLW       _captu+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_6_ESP8266+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_6_ESP8266+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_6_ESP8266+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;ESP8266.c,188 :: 		UART1_Write_Text(captu); //envia el largo d ela trama
	MOVLW       _captu+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP8266.c,189 :: 		Uart1_write_text_const("\r\n"); // estos son los dos que se adicionaron
	MOVLW       ?lstr_7_ESP8266+0
	MOVWF       FARG_Uart1_write_text_const_info+0 
	MOVLW       hi_addr(?lstr_7_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+1 
	MOVLW       higher_addr(?lstr_7_ESP8266+0)
	MOVWF       FARG_Uart1_write_text_const_info+2 
	CALL        _Uart1_write_text_const+0, 0
;ESP8266.c,190 :: 		Delay_ms(100); //retardo antes de enviar la trama
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_manda_esp826634:
	DECFSZ      R13, 1, 1
	BRA         L_manda_esp826634
	DECFSZ      R12, 1, 1
	BRA         L_manda_esp826634
	DECFSZ      R11, 1, 1
	BRA         L_manda_esp826634
	NOP
;ESP8266.c,191 :: 		UART1_Write_Text(info);     //manda envia solo constantes
	MOVF        FARG_manda_esp8266_info+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_manda_esp8266_info+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP8266.c,192 :: 		}
L_end_manda_esp8266:
	RETURN      0
; end of _manda_esp8266

_interrupcion:

;ESP8266.c,194 :: 		void interrupcion() iv 0x0008 ics ICS_AUTO
;ESP8266.c,198 :: 		if (RCIF_bit==1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupcion35
;ESP8266.c,200 :: 		dato_rx=RCREG; // lee el dato
	MOVF        RCREG+0, 0 
	MOVWF       _dato_rx+0 
;ESP8266.c,202 :: 		switch (estado_rec)
	GOTO        L_interrupcion36
;ESP8266.c,204 :: 		case normal:
L_interrupcion38:
;ESP8266.c,205 :: 		trama_rx[trama_cont]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,206 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;ESP8266.c,207 :: 		if (trama_cont>=100) trama_cont=0;
	MOVLW       100
	SUBWF       _trama_cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion39
	CLRF        _trama_cont+0 
L_interrupcion39:
;ESP8266.c,208 :: 		break;
	GOTO        L_interrupcion37
;ESP8266.c,210 :: 		case cap_l:
L_interrupcion40:
;ESP8266.c,211 :: 		trama_rx[trama_cont]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,212 :: 		if (dato_rx!='l') trama_cont=0;    //no fue el dato que me interesa
	MOVF        _dato_rx+0, 0 
	XORLW       108
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion41
	CLRF        _trama_cont+0 
	GOTO        L_interrupcion42
L_interrupcion41:
;ESP8266.c,215 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;ESP8266.c,216 :: 		estado_rec=cap_u; //pasa al estado de capturar la u
	MOVLW       2
	MOVWF       _estado_rec+0 
;ESP8266.c,217 :: 		}
L_interrupcion42:
;ESP8266.c,218 :: 		break;
	GOTO        L_interrupcion37
;ESP8266.c,220 :: 		case cap_u:
L_interrupcion43:
;ESP8266.c,221 :: 		trama_rx[trama_cont]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,222 :: 		if (dato_rx!='u')
	MOVF        _dato_rx+0, 0 
	XORLW       117
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion44
;ESP8266.c,224 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;ESP8266.c,225 :: 		estado_rec=cap_l; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;ESP8266.c,226 :: 		}
	GOTO        L_interrupcion45
L_interrupcion44:
;ESP8266.c,229 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;ESP8266.c,230 :: 		estado_rec=cap_e; //pasa al estado de capturar la u
	MOVLW       3
	MOVWF       _estado_rec+0 
;ESP8266.c,231 :: 		}
L_interrupcion45:
;ESP8266.c,232 :: 		break;
	GOTO        L_interrupcion37
;ESP8266.c,234 :: 		case cap_e:
L_interrupcion46:
;ESP8266.c,235 :: 		trama_rx[trama_cont]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,236 :: 		if (dato_rx!='e')
	MOVF        _dato_rx+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion47
;ESP8266.c,238 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;ESP8266.c,239 :: 		estado_rec=cap_l; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;ESP8266.c,240 :: 		}
	GOTO        L_interrupcion48
L_interrupcion47:
;ESP8266.c,243 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;ESP8266.c,244 :: 		estado_rec=cap_co; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec+0 
;ESP8266.c,245 :: 		}
L_interrupcion48:
;ESP8266.c,246 :: 		break;
	GOTO        L_interrupcion37
;ESP8266.c,248 :: 		case cap_co:
L_interrupcion49:
;ESP8266.c,249 :: 		trama_rx[trama_cont]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,250 :: 		if (dato_rx!='\"')
	MOVF        _dato_rx+0, 0 
	XORLW       34
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion50
;ESP8266.c,252 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;ESP8266.c,253 :: 		estado_rec=cap_l; //regresa al estado inical
	MOVLW       1
	MOVWF       _estado_rec+0 
;ESP8266.c,254 :: 		}
	GOTO        L_interrupcion51
L_interrupcion50:
;ESP8266.c,257 :: 		trama_cont++;//incrementa contador para proximo dato
	INCF        _trama_cont+0, 1 
;ESP8266.c,258 :: 		estado_rec=esp_final; //pasa al estado de capturar la u
	MOVLW       5
	MOVWF       _estado_rec+0 
;ESP8266.c,259 :: 		}
L_interrupcion51:
;ESP8266.c,260 :: 		break;
	GOTO        L_interrupcion37
;ESP8266.c,262 :: 		case esp_final:
L_interrupcion52:
;ESP8266.c,263 :: 		trama_rx[trama_cont]=dato_rx;
	MOVLW       _trama_rx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,264 :: 		trama_cont++;
	INCF        _trama_cont+0, 1 
;ESP8266.c,266 :: 		if (dato_rx==',')
	MOVF        _dato_rx+0, 0 
	XORLW       44
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcion53
;ESP8266.c,268 :: 		RCIE_bit=0; //desactiva interrupcion serial
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,269 :: 		trama_cont=0;//limpia contador de trama
	CLRF        _trama_cont+0 
;ESP8266.c,270 :: 		estado_rec=normal;// para que pase al estado de recepcion normal a la proxima
	CLRF        _estado_rec+0 
;ESP8266.c,271 :: 		flag_ubi=1; //activa la bandera de que tiene un dato valido de ubidots
	MOVLW       1
	MOVWF       _flag_ubi+0 
;ESP8266.c,272 :: 		}
L_interrupcion53:
;ESP8266.c,274 :: 		break;
	GOTO        L_interrupcion37
;ESP8266.c,276 :: 		}//fin del switch
L_interrupcion36:
	MOVF        _estado_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion38
	MOVF        _estado_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion40
	MOVF        _estado_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion43
	MOVF        _estado_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion46
	MOVF        _estado_rec+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion49
	MOVF        _estado_rec+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupcion52
L_interrupcion37:
;ESP8266.c,278 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;ESP8266.c,279 :: 		}
L_interrupcion35:
;ESP8266.c,284 :: 		if (TMR0IF_bit==1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupcion54
;ESP8266.c,286 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;ESP8266.c,287 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;ESP8266.c,289 :: 		timer_cont++;
	INFSNZ      _timer_cont+0, 1 
	INCF        _timer_cont+1, 1 
;ESP8266.c,291 :: 		if (timer_cont>=espera)
	MOVLW       0
	SUBWF       _timer_cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupcion127
	MOVF        _espera+0, 0 
	SUBWF       _timer_cont+0, 0 
L__interrupcion127:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupcion55
;ESP8266.c,293 :: 		Soft_UART_Break();    // le dice que salga en caso que este leyendo datos seriales por software
	CALL        _Soft_UART_Break+0, 0
;ESP8266.c,294 :: 		timer_cont=0;
	CLRF        _timer_cont+0 
	CLRF        _timer_cont+1 
;ESP8266.c,295 :: 		TMR0IE_bit=0; // DESHABILITA LA INTERRPCION
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;ESP8266.c,296 :: 		flag_timer=1;// habilita bandera que se cumplió el tiempo
	MOVLW       1
	MOVWF       _flag_timer+0 
	MOVLW       0
	MOVWF       _flag_timer+1 
;ESP8266.c,297 :: 		}
L_interrupcion55:
;ESP8266.c,298 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;ESP8266.c,299 :: 		}
L_interrupcion54:
;ESP8266.c,302 :: 		}
L_end_interrupcion:
L__interrupcion126:
	RETFIE      1
; end of _interrupcion

_timer_enable:

;ESP8266.c,304 :: 		void timer_enable(char tiempo)
;ESP8266.c,306 :: 		espera=tiempo;
	MOVF        FARG_timer_enable_tiempo+0, 0 
	MOVWF       _espera+0 
;ESP8266.c,307 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;ESP8266.c,308 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;ESP8266.c,309 :: 		TMR0ON_bit=1;// prende el timer
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;ESP8266.c,310 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;ESP8266.c,311 :: 		TMR0IE_bit=1;// habilita la interrpcion
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;ESP8266.c,313 :: 		}
L_end_timer_enable:
	RETURN      0
; end of _timer_enable

_tiempo_rec:

;ESP8266.c,315 :: 		char tiempo_rec(unsigned int milis)
;ESP8266.c,319 :: 		flag_ubi=0;
	CLRF        _flag_ubi+0 
;ESP8266.c,320 :: 		estado_rec=cap_l;
	MOVLW       1
	MOVWF       _estado_rec+0 
;ESP8266.c,321 :: 		trama_cont=0;
	CLRF        _trama_cont+0 
;ESP8266.c,322 :: 		memset(trama_rx,0,100);// LIMPIA LA TRAMA
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
;ESP8266.c,323 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;ESP8266.c,325 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,326 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,327 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,328 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_tiempo_rec56:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo_rec56
	DECFSZ      R12, 1, 1
	BRA         L_tiempo_rec56
;ESP8266.c,329 :: 		for (cont1=1;cont1<=milis;cont1++)
	MOVLW       1
	MOVWF       tiempo_rec_cont1_L0+0 
	MOVLW       0
	MOVWF       tiempo_rec_cont1_L0+1 
L_tiempo_rec57:
	MOVF        tiempo_rec_cont1_L0+1, 0 
	SUBWF       FARG_tiempo_rec_milis+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tiempo_rec130
	MOVF        tiempo_rec_cont1_L0+0, 0 
	SUBWF       FARG_tiempo_rec_milis+0, 0 
L__tiempo_rec130:
	BTFSS       STATUS+0, 0 
	GOTO        L_tiempo_rec58
;ESP8266.c,331 :: 		delay_Ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_tiempo_rec60:
	DECFSZ      R13, 1, 1
	BRA         L_tiempo_rec60
	DECFSZ      R12, 1, 1
	BRA         L_tiempo_rec60
	NOP
;ESP8266.c,332 :: 		if (flag_ubi==1) return(1);
	MOVF        _flag_ubi+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_tiempo_rec61
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_tiempo_rec
L_tiempo_rec61:
;ESP8266.c,329 :: 		for (cont1=1;cont1<=milis;cont1++)
	INFSNZ      tiempo_rec_cont1_L0+0, 1 
	INCF        tiempo_rec_cont1_L0+1, 1 
;ESP8266.c,333 :: 		}
	GOTO        L_tiempo_rec57
L_tiempo_rec58:
;ESP8266.c,334 :: 		RCIE_bit=0; // deshabilita la interrupcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,335 :: 		return(0);
	CLRF        R0 
;ESP8266.c,336 :: 		}
L_end_tiempo_rec:
	RETURN      0
; end of _tiempo_rec

_conecta:

;ESP8266.c,341 :: 		unsigned char conecta()
;ESP8266.c,343 :: 		tempo=manda_AT_COMANDO("AT+CIPSTART=4,\"TCP\",\"things.ubidots.com\",80", "OK", "CONNECT", 10000);
	MOVLW       ?lstr8_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr8_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr9_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr9_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr10_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr10_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       16
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       39
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;ESP8266.c,344 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_conecta62:
	DECFSZ      R13, 1, 1
	BRA         L_conecta62
	DECFSZ      R12, 1, 1
	BRA         L_conecta62
	DECFSZ      R11, 1, 1
	BRA         L_conecta62
	NOP
	NOP
;ESP8266.c,345 :: 		if ((tempo==1) ||(tempo==2)) return(1);
	MOVF        _tempo+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta109
	MOVF        _tempo+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__conecta109
	GOTO        L_conecta65
L__conecta109:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_conecta
L_conecta65:
;ESP8266.c,346 :: 		else return(0);
	CLRF        R0 
;ESP8266.c,349 :: 		}
L_end_conecta:
	RETURN      0
; end of _conecta

_conectar:

;ESP8266.c,352 :: 		void conectar()
;ESP8266.c,355 :: 		if (conecta()==1)
	CALL        _conecta+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_conectar67
;ESP8266.c,357 :: 		memset(trama_tx,0,100);//limpia la trama de tranmision
	MOVLW       _trama_tx+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       100
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;ESP8266.c,358 :: 		sprintf(trama_tx,"{\"led\": %1d,\"temperatura\": %5.2f,\"gps\":{\"lat\":%11.7f, \"lng\":%12.7f}}",(unsigned int)led_ubidot,temperatura,latitud,longitud);
	MOVLW       _trama_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_11_ESP8266+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_11_ESP8266+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_11_ESP8266+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _led_ubidot+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _latitud+0, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _latitud+1, 0 
	MOVWF       FARG_sprintf_wh+12 
	MOVF        _latitud+2, 0 
	MOVWF       FARG_sprintf_wh+13 
	MOVF        _latitud+3, 0 
	MOVWF       FARG_sprintf_wh+14 
	MOVF        _longitud+0, 0 
	MOVWF       FARG_sprintf_wh+15 
	MOVF        _longitud+1, 0 
	MOVWF       FARG_sprintf_wh+16 
	MOVF        _longitud+2, 0 
	MOVWF       FARG_sprintf_wh+17 
	MOVF        _longitud+3, 0 
	MOVWF       FARG_sprintf_wh+18 
	CALL        _sprintf+0, 0
;ESP8266.c,359 :: 		largo=strlen(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       _largo+0 
;ESP8266.c,360 :: 		sprintf(largo_str,"%u\n\n",largo);
	MOVLW       _largo_str+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_largo_str+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_12_ESP8266+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_12_ESP8266+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_12_ESP8266+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	CALL        _sprintf+0, 0
;ESP8266.c,361 :: 		manda_esp8266_const("POST /api/v1.6/devices/pruebas/?token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
	MOVLW       ?lstr_13_ESP8266+0
	MOVWF       FARG_manda_esp8266_const_info+0 
	MOVLW       hi_addr(?lstr_13_ESP8266+0)
	MOVWF       FARG_manda_esp8266_const_info+1 
	MOVLW       higher_addr(?lstr_13_ESP8266+0)
	MOVWF       FARG_manda_esp8266_const_info+2 
	CALL        _manda_esp8266_const+0, 0
;ESP8266.c,363 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar68:
	DECFSZ      R13, 1, 1
	BRA         L_conectar68
	DECFSZ      R12, 1, 1
	BRA         L_conectar68
	DECFSZ      R11, 1, 1
	BRA         L_conectar68
	NOP
	NOP
;ESP8266.c,365 :: 		manda_esp8266(largo_str);
	MOVLW       _largo_str+0
	MOVWF       FARG_manda_esp8266_info+0 
	MOVLW       hi_addr(_largo_str+0)
	MOVWF       FARG_manda_esp8266_info+1 
	CALL        _manda_esp8266+0, 0
;ESP8266.c,366 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_conectar69:
	DECFSZ      R13, 1, 1
	BRA         L_conectar69
	DECFSZ      R12, 1, 1
	BRA         L_conectar69
	DECFSZ      R11, 1, 1
	BRA         L_conectar69
	NOP
;ESP8266.c,368 :: 		manda_esp8266(trama_tx);
	MOVLW       _trama_tx+0
	MOVWF       FARG_manda_esp8266_info+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_manda_esp8266_info+1 
	CALL        _manda_esp8266+0, 0
;ESP8266.c,369 :: 		Delay_ms(5000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_conectar70:
	DECFSZ      R13, 1, 1
	BRA         L_conectar70
	DECFSZ      R12, 1, 1
	BRA         L_conectar70
	DECFSZ      R11, 1, 1
	BRA         L_conectar70
	DECFSZ      R10, 1, 1
	BRA         L_conectar70
;ESP8266.c,372 :: 		manda_esp8266_const("GET /api/v1.6/devices/pruebas/suiche/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_14_ESP8266+0
	MOVWF       FARG_manda_esp8266_const_info+0 
	MOVLW       hi_addr(?lstr_14_ESP8266+0)
	MOVWF       FARG_manda_esp8266_const_info+1 
	MOVLW       higher_addr(?lstr_14_ESP8266+0)
	MOVWF       FARG_manda_esp8266_const_info+2 
	CALL        _manda_esp8266_const+0, 0
;ESP8266.c,374 :: 		tempo=tiempo_rec(6000); // espera un tiempo o hasta que tenga una respeusta valida
	MOVLW       112
	MOVWF       FARG_tiempo_rec_milis+0 
	MOVLW       23
	MOVWF       FARG_tiempo_rec_milis+1 
	CALL        _tiempo_rec+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;ESP8266.c,376 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr15_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr15_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,377 :: 		strcpy(captu, strtok(0, ","));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr16_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr16_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,379 :: 		suiche_ubi=atof(captu);
	MOVLW       _captu+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _suiche_ubi+0 
	MOVF        R1, 0 
	MOVWF       _suiche_ubi+1 
;ESP8266.c,383 :: 		manda_esp8266_const("GET /api/v1.6/devices/pruebas/pwm/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");
	MOVLW       ?lstr_17_ESP8266+0
	MOVWF       FARG_manda_esp8266_const_info+0 
	MOVLW       hi_addr(?lstr_17_ESP8266+0)
	MOVWF       FARG_manda_esp8266_const_info+1 
	MOVLW       higher_addr(?lstr_17_ESP8266+0)
	MOVWF       FARG_manda_esp8266_const_info+2 
	CALL        _manda_esp8266_const+0, 0
;ESP8266.c,385 :: 		tempo=tiempo_rec(6000); // espera un tiempo o hasta que tenga una respeusta valida
	MOVLW       112
	MOVWF       FARG_tiempo_rec_milis+0 
	MOVLW       23
	MOVWF       FARG_tiempo_rec_milis+1 
	CALL        _tiempo_rec+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
;ESP8266.c,387 :: 		strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
	MOVLW       _trama_rx+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr18_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr18_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,388 :: 		strcpy(captu, strtok(0, ","));  //captura hasta el /
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr19_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr19_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,390 :: 		pwm_ubi=atof(captu);
	MOVLW       _captu+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _pwm_ubi+0 
	MOVF        R1, 0 
	MOVWF       _pwm_ubi+1 
;ESP8266.c,391 :: 		Delay_us(4000);
	MOVLW       63
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_conectar71:
	DECFSZ      R13, 1, 1
	BRA         L_conectar71
	DECFSZ      R12, 1, 1
	BRA         L_conectar71
;ESP8266.c,393 :: 		manda_AT_COMANDO("AT+CIPCLOSE=4", "OK", "OK", 3000);
	MOVLW       ?lstr20_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr20_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr21_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr21_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr22_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr22_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       184
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       11
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;ESP8266.c,396 :: 		sprintf(texto,"sw=%1d  pwm=%3d\r\n",suiche_ubi,pwm_ubi);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_23_ESP8266+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_23_ESP8266+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_23_ESP8266+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _suiche_ubi+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _suiche_ubi+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _pwm_ubi+0, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _pwm_ubi+1, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;ESP8266.c,397 :: 		soft_Uart_write_text(texto);    // debe quitarse despues
	MOVLW       _texto+0
	MOVWF       FARG_soft_Uart_write_text_info+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_soft_Uart_write_text_info+1 
	CALL        _soft_Uart_write_text+0, 0
;ESP8266.c,401 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_conectar72:
	DECFSZ      R13, 1, 1
	BRA         L_conectar72
	DECFSZ      R12, 1, 1
	BRA         L_conectar72
	DECFSZ      R11, 1, 1
	BRA         L_conectar72
	NOP
	NOP
;ESP8266.c,403 :: 		}
L_conectar67:
;ESP8266.c,405 :: 		}
L_end_conectar:
	RETURN      0
; end of _conectar

_lee_trama_soft:

;ESP8266.c,407 :: 		char lee_trama_soft()   //funcion que retorna 1 si hay dato sino 0    en el GPS
;ESP8266.c,413 :: 		memset(trama_GPS,100,0);
	MOVLW       _trama_GPS+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_memset_p1+1 
	MOVLW       100
	MOVWF       FARG_memset_character+0 
	CLRF        FARG_memset_n+0 
	CLRF        FARG_memset_n+1 
	CALL        _memset+0, 0
;ESP8266.c,414 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;ESP8266.c,415 :: 		estado_rec_GPS=cap_P;
	CLRF        _estado_rec_GPS+0 
;ESP8266.c,416 :: 		flag_timer=0;
	CLRF        _flag_timer+0 
	CLRF        _flag_timer+1 
;ESP8266.c,417 :: 		timer_enable(4);
	MOVLW       4
	MOVWF       FARG_timer_enable_tiempo+0 
	CALL        _timer_enable+0, 0
;ESP8266.c,419 :: 		while (flag_timer==0)
L_lee_trama_soft73:
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft134
	MOVLW       0
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft134:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft74
;ESP8266.c,421 :: 		switch (estado_rec_GPS)
	GOTO        L_lee_trama_soft75
;ESP8266.c,423 :: 		case cap_P:
L_lee_trama_soft77:
;ESP8266.c,424 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;ESP8266.c,425 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft135
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft135:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft78
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft78:
;ESP8266.c,426 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,427 :: 		if (dato_rx_GPS!='P') trama_cont_GPS=0;    //no fue el dato que me interesa
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft79
	CLRF        _trama_cont_GPS+0 
	GOTO        L_lee_trama_soft80
L_lee_trama_soft79:
;ESP8266.c,430 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;ESP8266.c,431 :: 		estado_rec_GPS=cap_G; //pasa al estado de capturar la g
	MOVLW       1
	MOVWF       _estado_rec_GPS+0 
;ESP8266.c,432 :: 		}
L_lee_trama_soft80:
;ESP8266.c,434 :: 		break;
	GOTO        L_lee_trama_soft76
;ESP8266.c,436 :: 		case cap_G:
L_lee_trama_soft81:
;ESP8266.c,437 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;ESP8266.c,438 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft136
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft136:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft82
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft82:
;ESP8266.c,439 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,440 :: 		if (dato_rx_GPS!='G')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft83
;ESP8266.c,442 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;ESP8266.c,443 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;ESP8266.c,444 :: 		}
	GOTO        L_lee_trama_soft84
L_lee_trama_soft83:
;ESP8266.c,447 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;ESP8266.c,448 :: 		estado_rec_GPS=cap_G2; //pasa al estado de capturar la g
	MOVLW       2
	MOVWF       _estado_rec_GPS+0 
;ESP8266.c,449 :: 		}
L_lee_trama_soft84:
;ESP8266.c,452 :: 		break;
	GOTO        L_lee_trama_soft76
;ESP8266.c,455 :: 		case cap_G2:
L_lee_trama_soft85:
;ESP8266.c,456 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;ESP8266.c,457 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft137
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft137:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft86
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft86:
;ESP8266.c,458 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,459 :: 		if (dato_rx_GPS!='G')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft87
;ESP8266.c,461 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;ESP8266.c,462 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;ESP8266.c,463 :: 		}
	GOTO        L_lee_trama_soft88
L_lee_trama_soft87:
;ESP8266.c,466 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;ESP8266.c,467 :: 		estado_rec_GPS=cap_A; //pasa al estado de capturar la a
	MOVLW       3
	MOVWF       _estado_rec_GPS+0 
;ESP8266.c,468 :: 		}
L_lee_trama_soft88:
;ESP8266.c,470 :: 		break;
	GOTO        L_lee_trama_soft76
;ESP8266.c,473 :: 		case cap_A:
L_lee_trama_soft89:
;ESP8266.c,475 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;ESP8266.c,476 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft138
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft138:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft90
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft90:
;ESP8266.c,477 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,478 :: 		if (dato_rx_GPS!='A')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft91
;ESP8266.c,480 :: 		trama_cont_GPS=0;
	CLRF        _trama_cont_GPS+0 
;ESP8266.c,481 :: 		estado_rec_GPS=cap_P; //regresa al estado inical
	CLRF        _estado_rec_GPS+0 
;ESP8266.c,483 :: 		}
	GOTO        L_lee_trama_soft92
L_lee_trama_soft91:
;ESP8266.c,486 :: 		trama_cont_GPS++;//incrementa contador para proximo dato
	INCF        _trama_cont_GPS+0, 1 
;ESP8266.c,487 :: 		estado_rec_GPS=esp_final_GPS; //pasa al estado de capturar la u
	MOVLW       4
	MOVWF       _estado_rec_GPS+0 
;ESP8266.c,488 :: 		}
L_lee_trama_soft92:
;ESP8266.c,491 :: 		break;
	GOTO        L_lee_trama_soft76
;ESP8266.c,493 :: 		case esp_final_GPS:
L_lee_trama_soft93:
;ESP8266.c,494 :: 		dato_rx_GPS=Soft_UART_Read(&error); //lee el dato
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _dato_rx_GPS+0 
;ESP8266.c,495 :: 		if (flag_timer==1) return(0);
	MOVLW       0
	XORWF       _flag_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_trama_soft139
	MOVLW       1
	XORWF       _flag_timer+0, 0 
L__lee_trama_soft139:
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft94
	CLRF        R0 
	GOTO        L_end_lee_trama_soft
L_lee_trama_soft94:
;ESP8266.c,496 :: 		trama_GPS[trama_cont_GPS]=dato_rx_GPS;
	MOVLW       _trama_GPS+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FSR1L+1 
	MOVF        _trama_cont_GPS+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _dato_rx_GPS+0, 0 
	MOVWF       POSTINC1+0 
;ESP8266.c,497 :: 		trama_cont_GPS++;
	INCF        _trama_cont_GPS+0, 1 
;ESP8266.c,498 :: 		if (trama_cont_GPS>=100) trama_cont_GPS=0;// si supera el buffer
	MOVLW       100
	SUBWF       _trama_cont_GPS+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_lee_trama_soft95
	CLRF        _trama_cont_GPS+0 
L_lee_trama_soft95:
;ESP8266.c,499 :: 		if (dato_rx_GPS=='*')
	MOVF        _dato_rx_GPS+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_trama_soft96
;ESP8266.c,501 :: 		estado_rec_GPS=cap_P;
	CLRF        _estado_rec_GPS+0 
;ESP8266.c,502 :: 		timer_cont=0;
	CLRF        _timer_cont+0 
	CLRF        _timer_cont+1 
;ESP8266.c,503 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;ESP8266.c,504 :: 		TMR0IE_bit=0;
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;ESP8266.c,505 :: 		flag_timer=0;
	CLRF        _flag_timer+0 
	CLRF        _flag_timer+1 
;ESP8266.c,506 :: 		return(1); //sale del procedimiento
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_trama_soft
;ESP8266.c,507 :: 		}
L_lee_trama_soft96:
;ESP8266.c,509 :: 		break;
	GOTO        L_lee_trama_soft76
;ESP8266.c,512 :: 		}//fin del switch
L_lee_trama_soft75:
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft77
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft81
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft85
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft89
	MOVF        _estado_rec_GPS+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_lee_trama_soft93
L_lee_trama_soft76:
;ESP8266.c,513 :: 		} //fin del while
	GOTO        L_lee_trama_soft73
L_lee_trama_soft74:
;ESP8266.c,514 :: 		return(0);
	CLRF        R0 
;ESP8266.c,516 :: 		}
L_end_lee_trama_soft:
	RETURN      0
; end of _lee_trama_soft

_lee_cordenadas:

;ESP8266.c,520 :: 		unsigned char lee_cordenadas()
;ESP8266.c,524 :: 		RCIE_bit=0;  /// deshabilita int serial
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,525 :: 		if (lee_trama_soft()==1)
	CALL        _lee_trama_soft+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas97
;ESP8266.c,529 :: 		memset (trama_GPS1,0,100);
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       100
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;ESP8266.c,530 :: 		memset (captu_GPS,0,30);
	MOVLW       _captu_GPS+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       30
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;ESP8266.c,532 :: 		strcpy(trama_GPS1,trama_GPS);//almacena en otro buffer  poruqe primero debe ller el fix y luego si los datos
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _trama_GPS+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP8266.c,534 :: 		strcpy(captu_GPS, strtok(trama_GPS, ","));  //captura 1 coma
	MOVLW       _trama_GPS+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_GPS+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr24_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr24_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,535 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr25_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr25_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,536 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr26_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr26_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,537 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr27_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr27_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,538 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr28_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr28_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,539 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr29_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr29_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,540 :: 		strcpy(captu_GPS, strtok(0, ","));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr30_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr30_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,542 :: 		fix=atoi(captu_GPS);
	MOVLW       _captu_GPS+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _fix+0 
	MOVF        R1, 0 
	MOVWF       _fix+1 
;ESP8266.c,543 :: 		if ((fix==1) ||(fix==2) )// solo si ya tiene un dato valido
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_cordenadas141
	MOVLW       1
	XORWF       R0, 0 
L__lee_cordenadas141:
	BTFSC       STATUS+0, 2 
	GOTO        L__lee_cordenadas110
	MOVLW       0
	XORWF       _fix+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lee_cordenadas142
	MOVLW       2
	XORWF       _fix+0, 0 
L__lee_cordenadas142:
	BTFSC       STATUS+0, 2 
	GOTO        L__lee_cordenadas110
	GOTO        L_lee_cordenadas100
L__lee_cordenadas110:
;ESP8266.c,546 :: 		strcpy(captu_GPS, strtok(trama_GPS1, ","));  //captura 1 coma
	MOVLW       _trama_GPS1+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_trama_GPS1+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr31_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr31_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,547 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura hasta segunda coma
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr32_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr32_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,548 :: 		strcpy(captu_GPS, strtok(0, ",")); //captura latitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr33_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr33_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,549 :: 		memset(c_grados,0,10);//limpía los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       10
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;ESP8266.c,550 :: 		strncpy(c_grados,captu_GPS,2);//captura los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       2
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;ESP8266.c,551 :: 		grados=atof(c_grados);
	MOVLW       _c_grados+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _grados+0 
	MOVF        R1, 0 
	MOVWF       _grados+1 
	MOVF        R2, 0 
	MOVWF       _grados+2 
	MOVF        R3, 0 
	MOVWF       _grados+3 
;ESP8266.c,553 :: 		minutos=atof(&captu_GPS[2])/60.0;  //lo pasa a grados
	MOVLW       _captu_GPS+2
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu_GPS+2)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _minutos+0 
	MOVF        R1, 0 
	MOVWF       _minutos+1 
	MOVF        R2, 0 
	MOVWF       _minutos+2 
	MOVF        R3, 0 
	MOVWF       _minutos+3 
;ESP8266.c,554 :: 		latitud=grados+minutos;
	MOVF        _grados+0, 0 
	MOVWF       R4 
	MOVF        _grados+1, 0 
	MOVWF       R5 
	MOVF        _grados+2, 0 
	MOVWF       R6 
	MOVF        _grados+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _latitud+0 
	MOVF        R1, 0 
	MOVWF       _latitud+1 
	MOVF        R2, 0 
	MOVWF       _latitud+2 
	MOVF        R3, 0 
	MOVWF       _latitud+3 
;ESP8266.c,555 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr34_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr34_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,556 :: 		if (captu_GPS[0]=='S') latitud=-latitud;
	MOVF        _captu_GPS+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas101
	BTG         _latitud+2, 7 
L_lee_cordenadas101:
;ESP8266.c,559 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma la longitud
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr35_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr35_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,560 :: 		memset(c_grados,0,10);//limpía los grados
	MOVLW       _c_grados+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       10
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;ESP8266.c,561 :: 		strncpy(c_grados,captu_GPS,3);//captura los grados  3 posiciones
	MOVLW       _c_grados+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_strncpy_to+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strncpy_from+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strncpy_from+1 
	MOVLW       3
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;ESP8266.c,562 :: 		grados=atof(c_grados);
	MOVLW       _c_grados+0
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_c_grados+0)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVF        R0, 0 
	MOVWF       _grados+0 
	MOVF        R1, 0 
	MOVWF       _grados+1 
	MOVF        R2, 0 
	MOVWF       _grados+2 
	MOVF        R3, 0 
	MOVWF       _grados+3 
;ESP8266.c,564 :: 		minutos=atof(&captu_GPS[3])/60.0;  //lo pasa a grados
	MOVLW       _captu_GPS+3
	MOVWF       FARG_atof_s+0 
	MOVLW       hi_addr(_captu_GPS+3)
	MOVWF       FARG_atof_s+1 
	CALL        _atof+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _minutos+0 
	MOVF        R1, 0 
	MOVWF       _minutos+1 
	MOVF        R2, 0 
	MOVWF       _minutos+2 
	MOVF        R3, 0 
	MOVWF       _minutos+3 
;ESP8266.c,565 :: 		longitud=grados+minutos;
	MOVF        _grados+0, 0 
	MOVWF       R4 
	MOVF        _grados+1, 0 
	MOVWF       R5 
	MOVF        _grados+2, 0 
	MOVWF       R6 
	MOVF        _grados+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _longitud+0 
	MOVF        R1, 0 
	MOVWF       _longitud+1 
	MOVF        R2, 0 
	MOVWF       _longitud+2 
	MOVF        R3, 0 
	MOVWF       _longitud+3 
;ESP8266.c,566 :: 		strcpy(captu_GPS, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr36_ESP8266+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr36_ESP8266+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _captu_GPS+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_captu_GPS+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;ESP8266.c,567 :: 		if (captu_GPS[0]=='W') longitud=-longitud;
	MOVF        _captu_GPS+0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_lee_cordenadas102
	BTG         _longitud+2, 7 
L_lee_cordenadas102:
;ESP8266.c,568 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,569 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,570 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;ESP8266.c,571 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,572 :: 		return(1);
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_lee_cordenadas
;ESP8266.c,573 :: 		}// si es valida la trama
L_lee_cordenadas100:
;ESP8266.c,576 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,577 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,578 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;ESP8266.c,579 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,580 :: 		return(0);
	CLRF        R0 
	GOTO        L_end_lee_cordenadas
;ESP8266.c,583 :: 		}
L_lee_cordenadas97:
;ESP8266.c,584 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,585 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;ESP8266.c,586 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;ESP8266.c,587 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,588 :: 		return(0);
	CLRF        R0 
;ESP8266.c,589 :: 		}
L_end_lee_cordenadas:
	RETURN      0
; end of _lee_cordenadas

_main:

;ESP8266.c,591 :: 		void main()
;ESP8266.c,594 :: 		ADCON1=0B1111; // TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;ESP8266.c,595 :: 		TRISB=0;
	CLRF        TRISB+0 
;ESP8266.c,596 :: 		TRISC=0;
	CLRF        TRISC+0 
;ESP8266.c,597 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;ESP8266.c,598 :: 		TRISB0_bit=1; // entrada suiche
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;ESP8266.c,600 :: 		UART1_Init(9600); // velocidad del esp8266
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ESP8266.c,603 :: 		INTCON=0b01000000;
	MOVLW       64
	MOVWF       INTCON+0 
;ESP8266.c,605 :: 		Soft_UART_Init(&PORTB, 2, 1, 9600, 0);  // inicializa un puerto por software
	MOVLW       PORTB+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTB+0)
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
;ESP8266.c,608 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;ESP8266.c,609 :: 		RCIE_bit=0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;ESP8266.c,611 :: 		LATB=0;
	CLRF        LATB+0 
;ESP8266.c,615 :: 		T0CON=0;//LIMPIA REGISTRO DEL TIMER CERO
	CLRF        T0CON+0 
;ESP8266.c,616 :: 		TMR0ON_bit=0; // lo mantiene apagado
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;ESP8266.c,617 :: 		TMR0H=72;
	MOVLW       72
	MOVWF       TMR0H+0 
;ESP8266.c,618 :: 		TMR0L=228;
	MOVLW       228
	MOVWF       TMR0L+0 
;ESP8266.c,620 :: 		T0PS2_bit=1;
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;ESP8266.c,621 :: 		T0PS1_bit=1;
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;ESP8266.c,622 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;ESP8266.c,624 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;ESP8266.c,625 :: 		TMR0IE_bit=0;// deshabilita la interrpcion
	BCF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;ESP8266.c,628 :: 		GIE_bit=1;// HABILITA INTERPCIONES GLOBALES
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;ESP8266.c,631 :: 		RCEN_bit=0;
	BCF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;ESP8266.c,632 :: 		RCEN_bit=1;
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;ESP8266.c,635 :: 		manda_AT_COMANDO("ATE1","OK", "ERROR", 500); // coloca eco  a los camando
	MOVLW       ?lstr37_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr37_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr38_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr38_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr39_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr39_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;ESP8266.c,636 :: 		manda_AT_COMANDO("AT+CWMODE=1","OK", "no change", 1000); // se conecta a una red existente
	MOVLW       ?lstr40_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr40_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr41_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr41_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr42_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr42_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       232
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       3
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;ESP8266.c,637 :: 		manda_AT_COMANDO("AT+CWJAP=\"Familia_Ramos_Zambrano\",\"forever17\"","OK","OK",10000);  //se conecta a una red WIFI
	MOVLW       ?lstr43_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr43_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr44_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr44_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr45_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr45_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       16
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       39
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;ESP8266.c,638 :: 		manda_AT_COMANDO("AT+CIPMUX=1","OK","OK",1000);  //Permite multiples conexiones
	MOVLW       ?lstr46_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr46_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr47_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr47_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr48_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr48_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       232
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       3
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;ESP8266.c,639 :: 		manda_AT_COMANDO("AT+CIFSR","OK","OK",1000);  //muestra la ip del modulo
	MOVLW       ?lstr49_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr49_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr50_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr50_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr51_ESP8266+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr51_ESP8266+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       232
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       3
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;ESP8266.c,641 :: 		temperatura=ds18b20_read(&portb,7); // lectura neecsaria para calibarar els ensor
	MOVLW       PORTB+0
	MOVWF       FARG_ds18b20_read_puerto+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_ds18b20_read_puerto+1 
	MOVLW       7
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
;ESP8266.c,643 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main104:
	DECFSZ      R13, 1, 1
	BRA         L_main104
	DECFSZ      R12, 1, 1
	BRA         L_main104
	DECFSZ      R11, 1, 1
	BRA         L_main104
	NOP
	NOP
;ESP8266.c,644 :: 		while (1)
L_main105:
;ESP8266.c,646 :: 		temperatura=ds18b20_read(&portb,7); // manda la temperatura
	MOVLW       PORTB+0
	MOVWF       FARG_ds18b20_read_puerto+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_ds18b20_read_puerto+1 
	MOVLW       7
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
;ESP8266.c,648 :: 		led_ubidot=sw;   // el led de ubidot es igual al suiche
	MOVLW       0
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	MOVLW       1
	MOVWF       _led_ubidot+0 
;ESP8266.c,651 :: 		if (lee_cordenadas()==1) conectar();
	CALL        _lee_cordenadas+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main107
	CALL        _conectar+0, 0
L_main107:
;ESP8266.c,652 :: 		led1=suiche_ubi;   // saca el valor de suicge de ubidot al led
	BTFSC       _suiche_ubi+0, 0 
	GOTO        L__main144
	BCF         LATB6_bit+0, BitPos(LATB6_bit+0) 
	GOTO        L__main145
L__main144:
	BSF         LATB6_bit+0, BitPos(LATB6_bit+0) 
L__main145:
;ESP8266.c,653 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main108:
	DECFSZ      R13, 1, 1
	BRA         L_main108
	DECFSZ      R12, 1, 1
	BRA         L_main108
	DECFSZ      R11, 1, 1
	BRA         L_main108
	NOP
	NOP
;ESP8266.c,655 :: 		}
	GOTO        L_main105
;ESP8266.c,658 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
