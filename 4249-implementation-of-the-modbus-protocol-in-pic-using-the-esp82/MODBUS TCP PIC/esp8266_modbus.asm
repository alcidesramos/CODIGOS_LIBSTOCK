
_soft_Uart_write_text:

;esp8266_modbus.c,38 :: 		void soft_Uart_write_text(char *info)
;esp8266_modbus.c,40 :: 		while(*info) Soft_UART_Write(*info++);
L_soft_Uart_write_text0:
	MOVFF       FARG_soft_Uart_write_text_info+0, FSR0L+0
	MOVFF       FARG_soft_Uart_write_text_info+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_soft_Uart_write_text1
	MOVFF       FARG_soft_Uart_write_text_info+0, FSR0L+0
	MOVFF       FARG_soft_Uart_write_text_info+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
	INFSNZ      FARG_soft_Uart_write_text_info+0, 1 
	INCF        FARG_soft_Uart_write_text_info+1, 1 
	GOTO        L_soft_Uart_write_text0
L_soft_Uart_write_text1:
;esp8266_modbus.c,41 :: 		}
L_end_soft_Uart_write_text:
	RETURN      0
; end of _soft_Uart_write_text

_soft_Uart_write_text_const:

;esp8266_modbus.c,44 :: 		void soft_Uart_write_text_const(const char *info)
;esp8266_modbus.c,46 :: 		while(*info) Soft_UART_Write(*info++);
L_soft_Uart_write_text_const2:
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
	GOTO        L_soft_Uart_write_text_const3
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
	GOTO        L_soft_Uart_write_text_const2
L_soft_Uart_write_text_const3:
;esp8266_modbus.c,47 :: 		}
L_end_soft_Uart_write_text_const:
	RETURN      0
; end of _soft_Uart_write_text_const

_soft_Uart_write_buff:

;esp8266_modbus.c,49 :: 		void soft_Uart_write_buff(char *info, unsigned char cuant1)
;esp8266_modbus.c,52 :: 		for (conta=0;conta<cuant1;conta++) Soft_UART_Write(*info++);
	CLRF        soft_Uart_write_buff_conta_L0+0 
L_soft_Uart_write_buff4:
	MOVF        FARG_soft_Uart_write_buff_cuant1+0, 0 
	SUBWF       soft_Uart_write_buff_conta_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_soft_Uart_write_buff5
	MOVFF       FARG_soft_Uart_write_buff_info+0, FSR0L+0
	MOVFF       FARG_soft_Uart_write_buff_info+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
	INFSNZ      FARG_soft_Uart_write_buff_info+0, 1 
	INCF        FARG_soft_Uart_write_buff_info+1, 1 
	INCF        soft_Uart_write_buff_conta_L0+0, 1 
	GOTO        L_soft_Uart_write_buff4
L_soft_Uart_write_buff5:
;esp8266_modbus.c,53 :: 		}
L_end_soft_Uart_write_buff:
	RETURN      0
; end of _soft_Uart_write_buff

_Interrucciones:

;esp8266_modbus.c,55 :: 		void Interrucciones() iv 0x0008 ics ICS_AUTO
;esp8266_modbus.c,57 :: 		esp82666_interrupcion();
	CALL        _esp82666_interrupcion+0, 0
;esp8266_modbus.c,58 :: 		}
L_end_Interrucciones:
L__Interrucciones16:
	RETFIE      1
; end of _Interrucciones

_main:

;esp8266_modbus.c,61 :: 		void main()
;esp8266_modbus.c,63 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;esp8266_modbus.c,64 :: 		ADCON1=0B1101;   // 2 canales analogos
	MOVLW       13
	MOVWF       ADCON1+0 
;esp8266_modbus.c,66 :: 		TRISA0_bit=1;// ENTRADA ANALOGA 1
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;esp8266_modbus.c,67 :: 		TRISA1_bit=1;  // ENTRADA ANALOGA 1
	BSF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;esp8266_modbus.c,69 :: 		TRISB4_bit=1;   // ENTRADA SUICHE1
	BSF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;esp8266_modbus.c,70 :: 		TRISB5_bit=1;   // ENTRADA SUICHE2
	BSF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;esp8266_modbus.c,71 :: 		TRISB6_bit=1;   // ENTRADA SUICHE4
	BSF         TRISB6_bit+0, BitPos(TRISB6_bit+0) 
;esp8266_modbus.c,72 :: 		TRISB7_bit=1;   // ENTRADA SUICHE4
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;esp8266_modbus.c,74 :: 		TRISC0_bit=0; //SALIDA LED 0
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;esp8266_modbus.c,75 :: 		TRISC1_bit=0; //SALIDA LED 1
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;esp8266_modbus.c,76 :: 		TRISC2_bit=0; //SALIDA LED 1
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;esp8266_modbus.c,79 :: 		TRISC6_bit=0; // salida tc
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;esp8266_modbus.c,80 :: 		TRISC7_bit=1; // entrada rx
	BSF         TRISC7_bit+0, BitPos(TRISC7_bit+0) 
;esp8266_modbus.c,82 :: 		NOT_RBPU_bit=0; // habilita puul up
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
;esp8266_modbus.c,84 :: 		INTCON=0B01000000; // HAB INTERRPCION DE PERIFERICOS
	MOVLW       64
	MOVWF       INTCON+0 
;esp8266_modbus.c,86 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;esp8266_modbus.c,87 :: 		Soft_UART_Init(&PORTa, 3,2, 9600, 0);    //inica ouerto uart por software
	MOVLW       PORTA+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       3
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       2
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
;esp8266_modbus.c,89 :: 		soft_Uart_write_text("INCIIANDO\r\n");
	MOVLW       ?lstr1_esp8266_modbus+0
	MOVWF       FARG_soft_Uart_write_text_info+0 
	MOVLW       hi_addr(?lstr1_esp8266_modbus+0)
	MOVWF       FARG_soft_Uart_write_text_info+1 
	CALL        _soft_Uart_write_text+0, 0
;esp8266_modbus.c,92 :: 		led1=0;
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;esp8266_modbus.c,93 :: 		led2=0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;esp8266_modbus.c,98 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;esp8266_modbus.c,99 :: 		RCIE_bit=1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;esp8266_modbus.c,103 :: 		GIE_bit=1; // autiliza interrcpiones
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;esp8266_modbus.c,106 :: 		manda_AT_COMANDO("ATE0","OK", "ERROR", 500);
	MOVLW       ?lstr2_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr2_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr3_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr3_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr4_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr4_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       244
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       1
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;esp8266_modbus.c,107 :: 		manda_AT_COMANDO("AT+CWMODE=1","OK", "no change", 1000); // se conecta a una red existente
	MOVLW       ?lstr5_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr5_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr6_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr6_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr7_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr7_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       232
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       3
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;esp8266_modbus.c,109 :: 		manda_AT_COMANDO("AT+CWJAP=\"Familia_Ramos_Zambrano\",\"forever17\"","OK","OK",10000);  //se conecta a una red WIFI
	MOVLW       ?lstr8_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr8_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr9_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr9_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr10_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr10_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       16
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       39
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;esp8266_modbus.c,111 :: 		manda_AT_COMANDO("AT+CIPMUX=1","OK","OK",3000);  //Permite multiples conexiones
	MOVLW       ?lstr11_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr11_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr12_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr12_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr13_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr13_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       184
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       11
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;esp8266_modbus.c,112 :: 		manda_AT_COMANDO("AT+CIFSR","OK","OK",5000);  //muestra la ip del modulo
	MOVLW       ?lstr14_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_coman+0 
	MOVLW       hi_addr(?lstr14_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_coman+1 
	MOVLW       ?lstr15_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap+0 
	MOVLW       hi_addr(?lstr15_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap+1 
	MOVLW       ?lstr16_esp8266_modbus+0
	MOVWF       FARG_manda_AT_COMANDO_cap1+0 
	MOVLW       hi_addr(?lstr16_esp8266_modbus+0)
	MOVWF       FARG_manda_AT_COMANDO_cap1+1 
	MOVLW       136
	MOVWF       FARG_manda_AT_COMANDO_retardo+0 
	MOVLW       19
	MOVWF       FARG_manda_AT_COMANDO_retardo+1 
	CALL        _manda_AT_COMANDO+0, 0
;esp8266_modbus.c,113 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;esp8266_modbus.c,115 :: 		conecta("192.168.1.15");
	MOVLW       ?lstr17_esp8266_modbus+0
	MOVWF       FARG_conecta_ip_dir+0 
	MOVLW       hi_addr(?lstr17_esp8266_modbus+0)
	MOVWF       FARG_conecta_ip_dir+1 
	CALL        _conecta+0, 0
;esp8266_modbus.c,117 :: 		while(1)
L_main8:
;esp8266_modbus.c,119 :: 		codigo=ADC_Get_Sample(0);
	CLRF        FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;esp8266_modbus.c,120 :: 		val1=codigo*100.0/1023.0; // lo escala de o a 100
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
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
	MOVWF       _val1+0 
	MOVF        R1, 0 
	MOVWF       _val1+1 
	MOVF        R2, 0 
	MOVWF       _val1+2 
	MOVF        R3, 0 
	MOVWF       _val1+3 
;esp8266_modbus.c,121 :: 		Delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
;esp8266_modbus.c,122 :: 		codigo=ADC_Get_Sample(1);
	MOVLW       1
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;esp8266_modbus.c,123 :: 		val2=codigo*100.0/1023.0; // lo escala de o a 100
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
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
	MOVWF       _val2+0 
	MOVF        R1, 0 
	MOVWF       _val2+1 
	MOVF        R2, 0 
	MOVWF       _val2+2 
	MOVF        R3, 0 
	MOVWF       _val2+3 
;esp8266_modbus.c,124 :: 		Delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
;esp8266_modbus.c,134 :: 		buff_tx[0]=val1;
	MOVF        _val1+0, 0 
	MOVWF       R0 
	MOVF        _val1+1, 0 
	MOVWF       R1 
	MOVF        _val1+2, 0 
	MOVWF       R2 
	MOVF        _val1+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _buff_tx+0 
	MOVF        R1, 0 
	MOVWF       _buff_tx+1 
;esp8266_modbus.c,135 :: 		buff_tx[1]=val2;
	MOVF        _val2+0, 0 
	MOVWF       R0 
	MOVF        _val2+1, 0 
	MOVWF       R1 
	MOVF        _val2+2, 0 
	MOVWF       R2 
	MOVF        _val2+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _buff_tx+2 
	MOVF        R1, 0 
	MOVWF       _buff_tx+3 
;esp8266_modbus.c,136 :: 		modbus_write_holding_varios(0,buff_tx,2);// manda desde la direccion cero dos datos
	CLRF        FARG_modbus_write_holding_varios_dir_mod+0 
	CLRF        FARG_modbus_write_holding_varios_dir_mod+1 
	MOVLW       _buff_tx+0
	MOVWF       FARG_modbus_write_holding_varios_buff_datos+0 
	MOVLW       hi_addr(_buff_tx+0)
	MOVWF       FARG_modbus_write_holding_varios_buff_datos+1 
	MOVLW       2
	MOVWF       FARG_modbus_write_holding_varios_cuantos+0 
	MOVLW       0
	MOVWF       FARG_modbus_write_holding_varios_cuantos+1 
	CALL        _modbus_write_holding_varios+0, 0
;esp8266_modbus.c,139 :: 		digi1=!sw1;
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__main18
	BSF         _digital_out+0, 0 
	GOTO        L__main19
L__main18:
	BCF         _digital_out+0, 0 
L__main19:
;esp8266_modbus.c,140 :: 		digi2=!sw2;
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__main20
	BSF         _digital_out+0, 1 
	GOTO        L__main21
L__main20:
	BCF         _digital_out+0, 1 
L__main21:
;esp8266_modbus.c,141 :: 		digi3=!sw3;
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__main22
	BSF         _digital_out+0, 2 
	GOTO        L__main23
L__main22:
	BCF         _digital_out+0, 2 
L__main23:
;esp8266_modbus.c,142 :: 		digi4=!sw4;
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__main24
	BSF         _digital_out+0, 3 
	GOTO        L__main25
L__main24:
	BCF         _digital_out+0, 3 
L__main25:
;esp8266_modbus.c,143 :: 		modbus_write_digitalcoils(0,digital_out);  //  saca desde la direccion cero las salidas digiles  permite 15
	CLRF        FARG_modbus_write_digitalcoils_dir_mod+0 
	CLRF        FARG_modbus_write_digitalcoils_dir_mod+1 
	MOVF        _digital_out+0, 0 
	MOVWF       FARG_modbus_write_digitalcoils_dat_dig+0 
	MOVF        _digital_out+1, 0 
	MOVWF       FARG_modbus_write_digitalcoils_dat_dig+1 
	CALL        _modbus_write_digitalcoils+0, 0
;esp8266_modbus.c,147 :: 		}
	GOTO        L_main8
;esp8266_modbus.c,151 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
