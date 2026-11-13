
_ds18b20_read:

;ds18b20.h,4 :: 		float ds18b20_read(char *puerto,char pin)
;ds18b20.h,9 :: 		float signo=1.0;
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+0 
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+1 
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+2 
	MOVLW       127
	MOVWF       ds18b20_read_signo_L0+3 
;ds18b20.h,14 :: 		Ow_Reset(puerto, pin);                         // Onewire reset signal
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Reset_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Reset_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;ds18b20.h,15 :: 		Delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_ds18b20_read0:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read0
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read0
;ds18b20.h,16 :: 		Ow_Write(puerto, pin, 0xCC);                   // dirrecciona todos sensores
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,17 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_ds18b20_read1:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read1
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read1
;ds18b20.h,18 :: 		Ow_Write(puerto, pin, 0x44);                   //iniica conversion
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       68
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,19 :: 		Delay_ms(150);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       207
	MOVWF       R12, 0
	MOVLW       1
	MOVWF       R13, 0
L_ds18b20_read2:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read2
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read2
	DECFSZ      R11, 1, 1
	BRA         L_ds18b20_read2
	NOP
	NOP
;ds18b20.h,21 :: 		Ow_Reset(puerto, pin);
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Reset_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Reset_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;ds18b20.h,22 :: 		Delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_ds18b20_read3:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read3
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read3
;ds18b20.h,23 :: 		Ow_Write(puerto, pin, 0xCC);
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,24 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_ds18b20_read4:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read4
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read4
;ds18b20.h,25 :: 		Ow_Write(puerto, pin, 0xBE);
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Write_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Write_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       190
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.h,26 :: 		Delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_ds18b20_read5:
	DECFSZ      R13, 1, 1
	BRA         L_ds18b20_read5
	DECFSZ      R12, 1, 1
	BRA         L_ds18b20_read5
;ds18b20.h,27 :: 		t1_ =  Ow_Read(puerto, pin);        //lee parte baja
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Read_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Read_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ds18b20_read_t1__L0+0 
;ds18b20.h,28 :: 		t2_ =  Ow_Read(puerto, pin);       //lee parte alta
	MOVF        FARG_ds18b20_read_puerto+0, 0 
	MOVWF       FARG_Ow_Read_port+0 
	MOVF        FARG_ds18b20_read_puerto+1, 0 
	MOVWF       FARG_Ow_Read_port+1 
	MOVF        FARG_ds18b20_read_pin+0, 0 
	MOVWF       FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
;ds18b20.h,30 :: 		temp_=( (unsigned int)t2_<<8) | t1_;
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
;ds18b20.h,33 :: 		if ( t2_ & 0x80)
	BTFSS       R0, 7 
	GOTO        L_ds18b20_read6
;ds18b20.h,35 :: 		temp_=~temp_+1;
	COMF        ds18b20_read_temp__L0+0, 1 
	COMF        ds18b20_read_temp__L0+1, 1 
	INFSNZ      ds18b20_read_temp__L0+0, 1 
	INCF        ds18b20_read_temp__L0+1, 1 
;ds18b20.h,36 :: 		signo=-1.0;
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+0 
	MOVLW       0
	MOVWF       ds18b20_read_signo_L0+1 
	MOVLW       128
	MOVWF       ds18b20_read_signo_L0+2 
	MOVLW       127
	MOVWF       ds18b20_read_signo_L0+3 
;ds18b20.h,37 :: 		}
L_ds18b20_read6:
;ds18b20.h,38 :: 		temp_=temp_>>4; //quita la parte decimal
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
;ds18b20.h,40 :: 		td__=t1_ & 0x0f;    //saca parte decima
	MOVLW       15
	ANDWF       ds18b20_read_t1__L0+0, 0 
	MOVWF       ds18b20_read_td___L0+0 
;ds18b20.h,42 :: 		tempo__=0;
	CLRF        ds18b20_read_tempo___L0+0 
	CLRF        ds18b20_read_tempo___L0+1 
	CLRF        ds18b20_read_tempo___L0+2 
	CLRF        ds18b20_read_tempo___L0+3 
;ds18b20.h,43 :: 		if (td__.b3==1)tempo__=tempo__+0.5;
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
;ds18b20.h,44 :: 		if (td__.b2==1) tempo__=tempo__+0.25;
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
;ds18b20.h,45 :: 		if (td__.b1==1) tempo__=tempo__+0.125;
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
;ds18b20.h,46 :: 		if (td__.b0==1) tempo__=tempo__+0.0625;
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
;ds18b20.h,47 :: 		if (signo<0) tempo__=-tempo__;
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
;ds18b20.h,48 :: 		sensor_temp_=(temp_*signo)+tempo__;  //calcula vlor final
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
;ds18b20.h,50 :: 		return (sensor_temp_);
;ds18b20.h,52 :: 		}
L_end_ds18b20_read:
	RETURN      0
; end of _ds18b20_read

_reloj_carga_inicial:

;datalogger.c,27 :: 		void reloj_carga_inicial()
;datalogger.c,29 :: 		ds1307._hora=9;
	MOVLW       9
	MOVWF       _ds1307+2 
;datalogger.c,30 :: 		ds1307._minuto=10;
	MOVLW       10
	MOVWF       _ds1307+1 
;datalogger.c,31 :: 		ds1307._segundo=0;
	CLRF        _ds1307+0 
;datalogger.c,32 :: 		ds1307._fecha=11;
	MOVLW       11
	MOVWF       _ds1307+4 
;datalogger.c,33 :: 		ds1307._mes=8;
	MOVLW       8
	MOVWF       _ds1307+5 
;datalogger.c,34 :: 		ds1307._anho=18;
	MOVLW       18
	MOVWF       _ds1307+6 
;datalogger.c,35 :: 		ds1307._dia=6;  //dia de la semana
	MOVLW       6
	MOVWF       _ds1307+3 
;datalogger.c,36 :: 		guardatodo_s();
	CALL        _guardatodo_s+0, 0
;datalogger.c,37 :: 		}
L_end_reloj_carga_inicial:
	RETURN      0
; end of _reloj_carga_inicial

_main:

;datalogger.c,42 :: 		void main()
;datalogger.c,45 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;datalogger.c,46 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;datalogger.c,47 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;datalogger.c,50 :: 		TRISA=0;
	CLRF        TRISA+0 
;datalogger.c,51 :: 		TRISB=0;
	CLRF        TRISB+0 
;datalogger.c,52 :: 		TRISC=0;
	CLRF        TRISC+0 
;datalogger.c,54 :: 		RBPU_bit=0; //HABILITA LAS PULL UP POR B
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;datalogger.c,55 :: 		TRISB7_bit=1; //ENTRADA PULSADOR
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;datalogger.c,57 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;datalogger.c,59 :: 		TRISB0_bit=1; //SDI ENTRADA
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;datalogger.c,60 :: 		TRISB3_bit=0; //SD0 SALIDA
	BCF         TRISB3_bit+0, BitPos(TRISB3_bit+0) 
;datalogger.c,61 :: 		TRISB1_bit=0; //SCK SALIDA
	BCF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;datalogger.c,63 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW       ?lstr1_datalogger+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_datalogger+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;datalogger.c,68 :: 		ds18b20_read(&porta,0);
	MOVLW       PORTA+0
	MOVWF       FARG_ds18b20_read_puerto+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_ds18b20_read_puerto+1 
	CLRF        FARG_ds18b20_read_pin+0 
	CALL        _ds18b20_read+0, 0
;datalogger.c,69 :: 		Delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
;datalogger.c,70 :: 		ds18b20_read(&porta,0);
	MOVLW       PORTA+0
	MOVWF       FARG_ds18b20_read_puerto+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_ds18b20_read_puerto+1 
	CLRF        FARG_ds18b20_read_pin+0 
	CALL        _ds18b20_read+0, 0
;datalogger.c,71 :: 		Delay_ms(800);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
;datalogger.c,77 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	MOVLW       2
	MOVWF       FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;datalogger.c,79 :: 		while (Mmc_Fat_Init()!=0) ;
L_main14:
	CALL        _Mmc_Fat_Init+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
	GOTO        L_main14
L_main15:
;datalogger.c,82 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	CLRF        FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;datalogger.c,83 :: 		UART1_Write_Text("MEMORIA INICIADA\r\n");
	MOVLW       ?lstr2_datalogger+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_datalogger+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;datalogger.c,88 :: 		Mmc_Fat_Assign("Datos.TXT",0xA0);
	MOVLW       ?lstr3_datalogger+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(?lstr3_datalogger+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	MOVLW       160
	MOVWF       FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;datalogger.c,89 :: 		Mmc_Fat_Write("TEMPE\t", 6);
	MOVLW       ?lstr4_datalogger+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(?lstr4_datalogger+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       6
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;datalogger.c,90 :: 		Mmc_Fat_Write("HORA\t\t", 6);
	MOVLW       ?lstr5_datalogger+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(?lstr5_datalogger+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       6
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;datalogger.c,91 :: 		Mmc_Fat_Write("FECHA\r\n", 7);
	MOVLW       ?lstr6_datalogger+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(?lstr6_datalogger+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       7
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;datalogger.c,93 :: 		reloj_init_s();
	CALL        _reloj_init_s+0, 0
;datalogger.c,99 :: 		while (1)
L_main16:
;datalogger.c,102 :: 		temperatura=ds18b20_read(&porta,0);
	MOVLW       PORTA+0
	MOVWF       FARG_ds18b20_read_puerto+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_ds18b20_read_puerto+1 
	CLRF        FARG_ds18b20_read_pin+0 
	CALL        _ds18b20_read+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;datalogger.c,103 :: 		memset(texto,0,50);  //limpia la trama
	MOVLW       _texto+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;datalogger.c,105 :: 		sprintf(texto,"%06.3f\t",temperatura);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_7_datalogger+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_7_datalogger+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_7_datalogger+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;datalogger.c,107 :: 		if(RB7_bit==1)   Mmc_Fat_Write(texto, strlen(texto));
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main18
	MOVLW       _texto+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVF        R1, 0 
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	MOVLW       _texto+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	CALL        _Mmc_Fat_Write+0, 0
L_main18:
;datalogger.c,109 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;datalogger.c,112 :: 		leertodo_s();
	CALL        _leertodo_s+0, 0
;datalogger.c,114 :: 		memset(texto,0,50);  //limpia la trama
	MOVLW       _texto+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;datalogger.c,115 :: 		sprintf(texto,"%02u:%02u:%02u\t",(unsigned int)ds1307._hora,(unsigned int)ds1307._minuto,(unsigned int)ds1307._segundo);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_8_datalogger+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_8_datalogger+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_8_datalogger+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _ds1307+2, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _ds1307+1, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _ds1307+0, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+10 
	CALL        _sprintf+0, 0
;datalogger.c,117 :: 		if(RB7_bit==1)    Mmc_Fat_Write(texto, strlen(texto));
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main19
	MOVLW       _texto+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVF        R1, 0 
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	MOVLW       _texto+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	CALL        _Mmc_Fat_Write+0, 0
L_main19:
;datalogger.c,119 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;datalogger.c,121 :: 		memset(texto,0,50);  //limpia la trama
	MOVLW       _texto+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       50
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;datalogger.c,122 :: 		sprintf(texto,"%02u/%02u/20%02u\r\n",(unsigned int)ds1307._fecha,(unsigned int)ds1307._mes,(unsigned int)ds1307._anho);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_9_datalogger+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_9_datalogger+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_9_datalogger+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _ds1307+4, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _ds1307+5, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _ds1307+6, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVLW       0
	MOVWF       FARG_sprintf_wh+10 
	CALL        _sprintf+0, 0
;datalogger.c,124 :: 		if(RB7_bit==1)    Mmc_Fat_Write(texto, strlen(texto));
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main20
	MOVLW       _texto+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVF        R1, 0 
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	MOVLW       _texto+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	CALL        _Mmc_Fat_Write+0, 0
L_main20:
;datalogger.c,126 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;datalogger.c,127 :: 		if(RB7_bit==0) Mmc_Fat_Close();
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main21
	CALL        _Mmc_Fat_Close+0, 0
L_main21:
;datalogger.c,129 :: 		Delay_ms(2000);//retardo de adquisicion de datos
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
;datalogger.c,131 :: 		}
	GOTO        L_main16
;datalogger.c,134 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
