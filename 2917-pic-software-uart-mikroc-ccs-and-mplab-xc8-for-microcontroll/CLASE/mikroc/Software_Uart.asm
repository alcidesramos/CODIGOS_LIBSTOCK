
_SoftWareUart_Init:

;Software_Uart.c,28 :: 		void  SoftWareUart_Init()
;Software_Uart.c,30 :: 		SoftWare_Uart_Tx=1;
	BSF        SoftWare_Uart_Tx+0, BitPos(SoftWare_Uart_Tx+0)
;Software_Uart.c,31 :: 		SoftWare_Uart_Rx=1;
	BSF        SoftWare_Uart_Rx+0, BitPos(SoftWare_Uart_Rx+0)
;Software_Uart.c,32 :: 		SoftWare_Uart_Tx_Direction=0;
	BCF        SoftWare_Uart_Tx_Direction+0, BitPos(SoftWare_Uart_Tx_Direction+0)
;Software_Uart.c,33 :: 		SoftWare_Uart_Rx_Direction=1;
	BSF        SoftWare_Uart_Rx_Direction+0, BitPos(SoftWare_Uart_Rx_Direction+0)
;Software_Uart.c,34 :: 		SoftWare_Uart_Tx=1;
	BSF        SoftWare_Uart_Tx+0, BitPos(SoftWare_Uart_Tx+0)
;Software_Uart.c,35 :: 		delay_us(BITPERIOD);
	MOVLW      13
	MOVWF      R13+0
L_SoftWareUart_Init0:
	DECFSZ     R13+0, 1
	GOTO       L_SoftWareUart_Init0
;Software_Uart.c,36 :: 		}
L_end_SoftWareUart_Init:
	RETURN
; end of _SoftWareUart_Init

_Software_UART_Write:

;Software_Uart.c,39 :: 		void Software_UART_Write(unsigned char Data)
;Software_Uart.c,42 :: 		SoftWare_Uart_Tx = 0;
	BCF        SoftWare_Uart_Tx+0, BitPos(SoftWare_Uart_Tx+0)
;Software_Uart.c,43 :: 		delay_us(BITPERIOD);
	MOVLW      13
	MOVWF      R13+0
L_Software_UART_Write1:
	DECFSZ     R13+0, 1
	GOTO       L_Software_UART_Write1
;Software_Uart.c,46 :: 		for (mask=0x01;mask!=0;mask=mask<<1)
	MOVLW      1
	MOVWF      R1+0
L_Software_UART_Write2:
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Software_UART_Write3
;Software_Uart.c,48 :: 		if(Data&mask) SoftWare_Uart_Tx = 1;
	MOVF       R1+0, 0
	ANDWF      FARG_Software_UART_Write_Data+0, 0
	MOVWF      R0+0
	BTFSC      STATUS+0, 2
	GOTO       L_Software_UART_Write5
	BSF        SoftWare_Uart_Tx+0, BitPos(SoftWare_Uart_Tx+0)
	GOTO       L_Software_UART_Write6
L_Software_UART_Write5:
;Software_Uart.c,49 :: 		else SoftWare_Uart_Tx = 0;
	BCF        SoftWare_Uart_Tx+0, BitPos(SoftWare_Uart_Tx+0)
L_Software_UART_Write6:
;Software_Uart.c,50 :: 		delay_us(BITPERIOD_FOR);  //para mayor precision acorde al cristal   porque son 14 cilcos de reloj
	MOVLW      8
	MOVWF      R13+0
L_Software_UART_Write7:
	DECFSZ     R13+0, 1
	GOTO       L_Software_UART_Write7
;Software_Uart.c,46 :: 		for (mask=0x01;mask!=0;mask=mask<<1)
	RLF        R1+0, 1
	BCF        R1+0, 0
;Software_Uart.c,51 :: 		}
	GOTO       L_Software_UART_Write2
L_Software_UART_Write3:
;Software_Uart.c,52 :: 		SoftWare_Uart_Tx = 1;
	BSF        SoftWare_Uart_Tx+0, BitPos(SoftWare_Uart_Tx+0)
;Software_Uart.c,53 :: 		delay_us(BITPERIOD);
	MOVLW      13
	MOVWF      R13+0
L_Software_UART_Write8:
	DECFSZ     R13+0, 1
	GOTO       L_Software_UART_Write8
;Software_Uart.c,54 :: 		}
L_end_Software_UART_Write:
	RETURN
; end of _Software_UART_Write

_Software_UART_Write_Text:

;Software_Uart.c,57 :: 		void Software_UART_Write_Text(char* Text)
;Software_Uart.c,59 :: 		while(*Text)Software_UART_Write(*Text++);
L_Software_UART_Write_Text9:
	MOVF       FARG_Software_UART_Write_Text_Text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Software_UART_Write_Text10
	MOVF       FARG_Software_UART_Write_Text_Text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Software_UART_Write_Data+0
	CALL       _Software_UART_Write+0
	INCF       FARG_Software_UART_Write_Text_Text+0, 1
	GOTO       L_Software_UART_Write_Text9
L_Software_UART_Write_Text10:
;Software_Uart.c,60 :: 		}
L_end_Software_UART_Write_Text:
	RETURN
; end of _Software_UART_Write_Text

_Software_UART_Write_Text_Const:

;Software_Uart.c,63 :: 		void Software_UART_Write_Text_Const(const char* Text)
;Software_Uart.c,65 :: 		while(*Text)Software_UART_Write(*Text++);
L_Software_UART_Write_Text_Const11:
	MOVF       FARG_Software_UART_Write_Text_Const_Text+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_Software_UART_Write_Text_Const_Text+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Software_UART_Write_Text_Const12
	MOVF       FARG_Software_UART_Write_Text_Const_Text+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_Software_UART_Write_Text_Const_Text+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Software_UART_Write_Data+0
	CALL       _Software_UART_Write+0
	INCF       FARG_Software_UART_Write_Text_Const_Text+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Software_UART_Write_Text_Const_Text+1, 1
	GOTO       L_Software_UART_Write_Text_Const11
L_Software_UART_Write_Text_Const12:
;Software_Uart.c,66 :: 		}
L_end_Software_UART_Write_Text_Const:
	RETURN
; end of _Software_UART_Write_Text_Const

_Software_UART_Read:

;Software_Uart.c,71 :: 		unsigned char Software_UART_Read ()
;Software_Uart.c,74 :: 		char Data=0;
	CLRF       Software_UART_Read_Data_L0+0
;Software_Uart.c,76 :: 		while(SoftWare_Uart_Rx==1); //sino llega el bit de star se queda a esperarlo
L_Software_UART_Read13:
	BTFSS      SoftWare_Uart_Rx+0, BitPos(SoftWare_Uart_Rx+0)
	GOTO       L_Software_UART_Read14
	GOTO       L_Software_UART_Read13
L_Software_UART_Read14:
;Software_Uart.c,77 :: 		delay_us(HALFBITPERIOD);
	MOVLW      6
	MOVWF      R13+0
L_Software_UART_Read15:
	DECFSZ     R13+0, 1
	GOTO       L_Software_UART_Read15
	NOP
;Software_Uart.c,78 :: 		for(mask=0x01;mask!=0;mask=mask<<1)
	MOVLW      1
	MOVWF      R1+0
L_Software_UART_Read16:
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Software_UART_Read17
;Software_Uart.c,80 :: 		delay_us(BITPERIOD_FOR_READ);   //retardo teniendo en cuenta os del for y el if es de 4 ciclos de reloj
	MOVLW      9
	MOVWF      R13+0
L_Software_UART_Read19:
	DECFSZ     R13+0, 1
	GOTO       L_Software_UART_Read19
	NOP
	NOP
;Software_Uart.c,81 :: 		if(SoftWare_Uart_Rx)Data=Data|mask;
	BTFSS      SoftWare_Uart_Rx+0, BitPos(SoftWare_Uart_Rx+0)
	GOTO       L_Software_UART_Read20
	MOVF       R1+0, 0
	IORWF      Software_UART_Read_Data_L0+0, 1
L_Software_UART_Read20:
;Software_Uart.c,78 :: 		for(mask=0x01;mask!=0;mask=mask<<1)
	RLF        R1+0, 1
	BCF        R1+0, 0
;Software_Uart.c,82 :: 		}
	GOTO       L_Software_UART_Read16
L_Software_UART_Read17:
;Software_Uart.c,83 :: 		Delay_us(BITPERIOD);
	MOVLW      13
	MOVWF      R13+0
L_Software_UART_Read21:
	DECFSZ     R13+0, 1
	GOTO       L_Software_UART_Read21
;Software_Uart.c,84 :: 		return Data;
	MOVF       Software_UART_Read_Data_L0+0, 0
	MOVWF      R0+0
;Software_Uart.c,85 :: 		}
L_end_Software_UART_Read:
	RETURN
; end of _Software_UART_Read

_Software_UART_Read_Text:

;Software_Uart.c,88 :: 		void Software_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama)
;Software_Uart.c,90 :: 		unsigned int con_t=0;
	CLRF       Software_UART_Read_Text_con_t_L0+0
	CLRF       Software_UART_Read_Text_con_t_L0+1
;Software_Uart.c,92 :: 		while(*(Buffer-1)!=StopChar)   //mientras no llegue el caracter deseado
L_Software_UART_Read_Text22:
	DECF       FARG_Software_UART_Read_Text_Buffer+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      FARG_Software_UART_Read_Text_StopChar+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Software_UART_Read_Text23
;Software_Uart.c,94 :: 		con_t++;
	INCF       Software_UART_Read_Text_con_t_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Software_UART_Read_Text_con_t_L0+1, 1
;Software_Uart.c,95 :: 		*Buffer++=Software_UART_Read();  //sigue almacenando en el buffer
	CALL       _Software_UART_Read+0
	MOVF       FARG_Software_UART_Read_Text_Buffer+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_Software_UART_Read_Text_Buffer+0, 1
;Software_Uart.c,96 :: 		if (con_t>=tama) break;
	MOVF       FARG_Software_UART_Read_Text_tama+1, 0
	SUBWF      Software_UART_Read_Text_con_t_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Software_UART_Read_Text31
	MOVF       FARG_Software_UART_Read_Text_tama+0, 0
	SUBWF      Software_UART_Read_Text_con_t_L0+0, 0
L__Software_UART_Read_Text31:
	BTFSS      STATUS+0, 0
	GOTO       L_Software_UART_Read_Text24
	GOTO       L_Software_UART_Read_Text23
L_Software_UART_Read_Text24:
;Software_Uart.c,97 :: 		}
	GOTO       L_Software_UART_Read_Text22
L_Software_UART_Read_Text23:
;Software_Uart.c,98 :: 		*--Buffer=0; //coloca un cero al final para que sea una cadena
	DECF       FARG_Software_UART_Read_Text_Buffer+0, 1
	MOVF       FARG_Software_UART_Read_Text_Buffer+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;Software_Uart.c,99 :: 		}
L_end_Software_UART_Read_Text:
	RETURN
; end of _Software_UART_Read_Text
