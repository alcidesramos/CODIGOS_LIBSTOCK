
rfid_MFRC522_Wr:

;rc522.h,102 :: 		static void MFRC522_Wr( char addr, char value )
;rc522.h,104 :: 		MFRC522_CS = 0;
	BCF         MFRC522_CS+0, BitPos(MFRC522_CS+0) 
;rc522.h,105 :: 		Soft_SPI_Write( ( addr << 1 ) & 0x7E );
	MOVF        FARG_rfid_MFRC522_Wr_addr+0, 0 
	MOVWF       FARG_Soft_SPI_Write_sdata+0 
	RLCF        FARG_Soft_SPI_Write_sdata+0, 1 
	BCF         FARG_Soft_SPI_Write_sdata+0, 0 
	MOVLW       126
	ANDWF       FARG_Soft_SPI_Write_sdata+0, 1 
	CALL        _Soft_SPI_Write+0, 0
;rc522.h,106 :: 		Soft_SPI_Write( value );
	MOVF        FARG_rfid_MFRC522_Wr_value+0, 0 
	MOVWF       FARG_Soft_SPI_Write_sdata+0 
	CALL        _Soft_SPI_Write+0, 0
;rc522.h,107 :: 		MFRC522_CS = 1;
	BSF         MFRC522_CS+0, BitPos(MFRC522_CS+0) 
;rc522.h,108 :: 		}
L_end_MFRC522_Wr:
	RETURN      0
; end of rfid_MFRC522_Wr

rfid_MFRC522_Rd:

;rc522.h,109 :: 		static char MFRC522_Rd( char addr )
;rc522.h,112 :: 		MFRC522_CS = 0;
	BCF         MFRC522_CS+0, BitPos(MFRC522_CS+0) 
;rc522.h,113 :: 		Soft_SPI_Write( (( addr << 1 ) & 0x7E) | 0x80 );
	MOVF        FARG_rfid_MFRC522_Rd_addr+0, 0 
	MOVWF       FARG_Soft_SPI_Write_sdata+0 
	RLCF        FARG_Soft_SPI_Write_sdata+0, 1 
	BCF         FARG_Soft_SPI_Write_sdata+0, 0 
	MOVLW       126
	ANDWF       FARG_Soft_SPI_Write_sdata+0, 1 
	BSF         FARG_Soft_SPI_Write_sdata+0, 7 
	CALL        _Soft_SPI_Write+0, 0
;rc522.h,114 :: 		value = Soft_SPI_Read( 0x00 );
	CLRF        FARG_Soft_SPI_Read_sdata+0 
	CALL        _Soft_SPI_Read+0, 0
;rc522.h,115 :: 		MFRC522_CS = 1;
	BSF         MFRC522_CS+0, BitPos(MFRC522_CS+0) 
;rc522.h,116 :: 		return value;
;rc522.h,117 :: 		}
L_end_MFRC522_Rd:
	RETURN      0
; end of rfid_MFRC522_Rd

rfid_MFRC522_Clear_Bit:

;rc522.h,118 :: 		static void MFRC522_Clear_Bit( char addr, char mask )
;rc522.h,120 :: 		MFRC522_Wr( addr, MFRC522_Rd( addr ) & (~mask) );
	MOVF        FARG_rfid_MFRC522_Clear_Bit_addr+0, 0 
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	COMF        FARG_rfid_MFRC522_Clear_Bit_mask+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	ANDWF       R0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	MOVF        FARG_rfid_MFRC522_Clear_Bit_addr+0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,121 :: 		}
L_end_MFRC522_Clear_Bit:
	RETURN      0
; end of rfid_MFRC522_Clear_Bit

rfid_MFRC522_Set_Bit:

;rc522.h,122 :: 		static void MFRC522_Set_Bit( char addr, char mask )
;rc522.h,124 :: 		MFRC522_Wr( addr, MFRC522_Rd( addr ) | mask );
	MOVF        FARG_rfid_MFRC522_Set_Bit_addr+0, 0 
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVF        FARG_rfid_MFRC522_Set_Bit_mask+0, 0 
	IORWF       R0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	MOVF        FARG_rfid_MFRC522_Set_Bit_addr+0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,125 :: 		}
L_end_MFRC522_Set_Bit:
	RETURN      0
; end of rfid_MFRC522_Set_Bit

_MFRC522_Reset:

;rc522.h,126 :: 		void MFRC522_Reset()
;rc522.h,128 :: 		MFRC522_Wr( COMMANDREG, PCD_RESETPHASE );
	MOVLW       1
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       15
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,129 :: 		}
L_end_MFRC522_Reset:
	RETURN      0
; end of _MFRC522_Reset

_MFRC522_AntennaOn:

;rc522.h,130 :: 		void MFRC522_AntennaOn()
;rc522.h,132 :: 		MFRC522_Set_Bit( TXCONTROLREG, 0x03 );
	MOVLW       20
	MOVWF       FARG_rfid_MFRC522_Set_Bit_addr+0 
	MOVLW       3
	MOVWF       FARG_rfid_MFRC522_Set_Bit_mask+0 
	CALL        rfid_MFRC522_Set_Bit+0, 0
;rc522.h,133 :: 		}
L_end_MFRC522_AntennaOn:
	RETURN      0
; end of _MFRC522_AntennaOn

_MFRC522_AntennaOff:

;rc522.h,134 :: 		void MFRC522_AntennaOff()
;rc522.h,136 :: 		MFRC522_Clear_Bit( TXCONTROLREG, 0x03 );
	MOVLW       20
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_addr+0 
	MOVLW       3
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_mask+0 
	CALL        rfid_MFRC522_Clear_Bit+0, 0
;rc522.h,137 :: 		}
L_end_MFRC522_AntennaOff:
	RETURN      0
; end of _MFRC522_AntennaOff

_MFRC522_Init:

;rc522.h,138 :: 		void MFRC522_Init()
;rc522.h,140 :: 		MFRC522_CS_Direction = 0;
	BCF         MFRC522_CS_Direction+0, BitPos(MFRC522_CS_Direction+0) 
;rc522.h,141 :: 		MFRC522_Rst_Direction = 0;
	BCF         MFRC522_Rst_Direction+0, BitPos(MFRC522_Rst_Direction+0) 
;rc522.h,142 :: 		MFRC522_CS = 1;
	BSF         MFRC522_CS+0, BitPos(MFRC522_CS+0) 
;rc522.h,143 :: 		MFRC522_Rst = 1;
	BSF         MFRC522_Rst+0, BitPos(MFRC522_Rst+0) 
;rc522.h,145 :: 		MFRC522_Reset();
	CALL        _MFRC522_Reset+0, 0
;rc522.h,147 :: 		MFRC522_Wr( TMODEREG, 0x8D );      //Tauto=1; f(Timer) = 6.78MHz/TPreScaler
	MOVLW       42
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       141
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,148 :: 		MFRC522_Wr( TPRESCALERREG, 0x3E ); //TModeReg[3..0] + TPrescalerReg
	MOVLW       43
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       62
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,149 :: 		MFRC522_Wr( TRELOADREGL, 30 );
	MOVLW       45
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       30
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,150 :: 		MFRC522_Wr( TRELOADREGH, 0 );
	MOVLW       44
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	CLRF        FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,152 :: 		MFRC522_Wr( TXAUTOREG, 0x40 );    //100%ASK
	MOVLW       21
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       64
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,153 :: 		MFRC522_Wr( MODEREG, 0x3D );      // CRC valor inicial de 0x6363
	MOVLW       17
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       61
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,158 :: 		MFRC522_AntennaOn();
	CALL        _MFRC522_AntennaOn+0, 0
;rc522.h,159 :: 		}
L_end_MFRC522_Init:
	RETURN      0
; end of _MFRC522_Init

_MFRC522_ToCard:

;rc522.h,160 :: 		char MFRC522_ToCard( char command, char *sendData, char sendLen, char *backData, unsigned *backLen )
;rc522.h,162 :: 		char _status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_ToCard__status_L0+0 
	CLRF        MFRC522_ToCard_irqEn_L0+0 
	CLRF        MFRC522_ToCard_waitIRq_L0+0 
;rc522.h,169 :: 		switch (command)
	GOTO        L_MFRC522_ToCard0
;rc522.h,171 :: 		case PCD_AUTHENT:       //Certification cards close
L_MFRC522_ToCard2:
;rc522.h,173 :: 		irqEn = 0x12;
	MOVLW       18
	MOVWF       MFRC522_ToCard_irqEn_L0+0 
;rc522.h,174 :: 		waitIRq = 0x10;
	MOVLW       16
	MOVWF       MFRC522_ToCard_waitIRq_L0+0 
;rc522.h,175 :: 		break;
	GOTO        L_MFRC522_ToCard1
;rc522.h,177 :: 		case PCD_TRANSCEIVE:    //Transmit FIFO data
L_MFRC522_ToCard3:
;rc522.h,179 :: 		irqEn = 0x77;
	MOVLW       119
	MOVWF       MFRC522_ToCard_irqEn_L0+0 
;rc522.h,180 :: 		waitIRq = 0x30;
	MOVLW       48
	MOVWF       MFRC522_ToCard_waitIRq_L0+0 
;rc522.h,181 :: 		break;
	GOTO        L_MFRC522_ToCard1
;rc522.h,183 :: 		default:
L_MFRC522_ToCard4:
;rc522.h,184 :: 		break;
	GOTO        L_MFRC522_ToCard1
;rc522.h,185 :: 		}
L_MFRC522_ToCard0:
	MOVF        FARG_MFRC522_ToCard_command+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard2
	MOVF        FARG_MFRC522_ToCard_command+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard3
	GOTO        L_MFRC522_ToCard4
L_MFRC522_ToCard1:
;rc522.h,186 :: 		MFRC522_Wr( COMMIENREG, irqEn | 0x80 );  //Interrupt request
	MOVLW       2
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       128
	IORWF       MFRC522_ToCard_irqEn_L0+0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,187 :: 		MFRC522_Clear_Bit( COMMIRQREG, 0x80 );   //Clear all interrupt request bit
	MOVLW       4
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_addr+0 
	MOVLW       128
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_mask+0 
	CALL        rfid_MFRC522_Clear_Bit+0, 0
;rc522.h,188 :: 		MFRC522_Set_Bit( FIFOLEVELREG, 0x80 );   //FlushBuffer=1, FIFO Initialization
	MOVLW       10
	MOVWF       FARG_rfid_MFRC522_Set_Bit_addr+0 
	MOVLW       128
	MOVWF       FARG_rfid_MFRC522_Set_Bit_mask+0 
	CALL        rfid_MFRC522_Set_Bit+0, 0
;rc522.h,189 :: 		MFRC522_Wr( COMMANDREG, PCD_IDLE );      //NO action; Cancel the current command???
	MOVLW       1
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	CLRF        FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,194 :: 		for ( i=0; i < sendLen; i++ )
	CLRF        MFRC522_ToCard_i_L0+0 
	CLRF        MFRC522_ToCard_i_L0+1 
L_MFRC522_ToCard5:
	MOVLW       0
	SUBWF       MFRC522_ToCard_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_ToCard107
	MOVF        FARG_MFRC522_ToCard_sendLen+0, 0 
	SUBWF       MFRC522_ToCard_i_L0+0, 0 
L__MFRC522_ToCard107:
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_ToCard6
;rc522.h,196 :: 		MFRC522_Wr( FIFODATAREG, sendData[i] );
	MOVLW       9
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVF        MFRC522_ToCard_i_L0+0, 0 
	ADDWF       FARG_MFRC522_ToCard_sendData+0, 0 
	MOVWF       FSR0L+0 
	MOVF        MFRC522_ToCard_i_L0+1, 0 
	ADDWFC      FARG_MFRC522_ToCard_sendData+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,194 :: 		for ( i=0; i < sendLen; i++ )
	INFSNZ      MFRC522_ToCard_i_L0+0, 1 
	INCF        MFRC522_ToCard_i_L0+1, 1 
;rc522.h,197 :: 		}
	GOTO        L_MFRC522_ToCard5
L_MFRC522_ToCard6:
;rc522.h,199 :: 		MFRC522_Wr( COMMANDREG, command );
	MOVLW       1
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVF        FARG_MFRC522_ToCard_command+0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,200 :: 		if (command == PCD_TRANSCEIVE )
	MOVF        FARG_MFRC522_ToCard_command+0, 0 
	XORLW       12
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard8
;rc522.h,202 :: 		MFRC522_Set_Bit( BITFRAMINGREG, 0x80 ); //StartSend=1,transmission of data starts
	MOVLW       13
	MOVWF       FARG_rfid_MFRC522_Set_Bit_addr+0 
	MOVLW       128
	MOVWF       FARG_rfid_MFRC522_Set_Bit_mask+0 
	CALL        rfid_MFRC522_Set_Bit+0, 0
;rc522.h,203 :: 		}
L_MFRC522_ToCard8:
;rc522.h,206 :: 		i = 0xFFFF;
	MOVLW       255
	MOVWF       MFRC522_ToCard_i_L0+0 
	MOVLW       255
	MOVWF       MFRC522_ToCard_i_L0+1 
;rc522.h,207 :: 		do
L_MFRC522_ToCard9:
;rc522.h,211 :: 		n = MFRC522_Rd( COMMIRQREG );
	MOVLW       4
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_ToCard_n_L0+0 
;rc522.h,212 :: 		i--;
	MOVLW       1
	SUBWF       MFRC522_ToCard_i_L0+0, 1 
	MOVLW       0
	SUBWFB      MFRC522_ToCard_i_L0+1, 1 
;rc522.h,214 :: 		while ( i && !(n & 0x01) && !( n & waitIRq ) );
	MOVF        MFRC522_ToCard_i_L0+0, 0 
	IORWF       MFRC522_ToCard_i_L0+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__MFRC522_ToCard90
	BTFSC       MFRC522_ToCard_n_L0+0, 0 
	GOTO        L__MFRC522_ToCard90
	MOVF        MFRC522_ToCard_waitIRq_L0+0, 0 
	ANDWF       MFRC522_ToCard_n_L0+0, 0 
	MOVWF       R0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_ToCard90
	GOTO        L_MFRC522_ToCard9
L__MFRC522_ToCard90:
;rc522.h,215 :: 		MFRC522_Clear_Bit( BITFRAMINGREG, 0x80 );    //StartSend=0
	MOVLW       13
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_addr+0 
	MOVLW       128
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_mask+0 
	CALL        rfid_MFRC522_Clear_Bit+0, 0
;rc522.h,216 :: 		if (i != 0)
	MOVLW       0
	XORWF       MFRC522_ToCard_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_ToCard108
	MOVLW       0
	XORWF       MFRC522_ToCard_i_L0+0, 0 
L__MFRC522_ToCard108:
	BTFSC       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard14
;rc522.h,218 :: 		if( !( MFRC522_Rd( ERRORREG ) & 0x1B ) ) //BufferOvfl Collerr CRCErr ProtecolErr
	MOVLW       6
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVLW       27
	ANDWF       R0, 1 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard15
;rc522.h,220 :: 		_status = MI_OK;
	CLRF        MFRC522_ToCard__status_L0+0 
;rc522.h,221 :: 		if ( n & irqEn & 0x01 )
	MOVF        MFRC522_ToCard_irqEn_L0+0, 0 
	ANDWF       MFRC522_ToCard_n_L0+0, 0 
	MOVWF       R1 
	BTFSS       R1, 0 
	GOTO        L_MFRC522_ToCard16
;rc522.h,223 :: 		_status = MI_NOTAGERR;       //??
	MOVLW       1
	MOVWF       MFRC522_ToCard__status_L0+0 
;rc522.h,224 :: 		}
L_MFRC522_ToCard16:
;rc522.h,225 :: 		if ( command == PCD_TRANSCEIVE )
	MOVF        FARG_MFRC522_ToCard_command+0, 0 
	XORLW       12
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard17
;rc522.h,227 :: 		n = MFRC522_Rd( FIFOLEVELREG );
	MOVLW       10
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_ToCard_n_L0+0 
;rc522.h,228 :: 		lastBits = MFRC522_Rd( CONTROLREG ) & 0x07;
	MOVLW       12
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       MFRC522_ToCard_lastBits_L0+0 
;rc522.h,229 :: 		if (lastBits)
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard18
;rc522.h,231 :: 		*backLen = (n-1) * 8 + lastBits;
	DECF        MFRC522_ToCard_n_L0+0, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	SUBWFB      R4, 1 
	MOVLW       3
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__MFRC522_ToCard109:
	BZ          L__MFRC522_ToCard110
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__MFRC522_ToCard109
L__MFRC522_ToCard110:
	MOVF        MFRC522_ToCard_lastBits_L0+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVFF       FARG_MFRC522_ToCard_backLen+0, FSR1L+0
	MOVFF       FARG_MFRC522_ToCard_backLen+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;rc522.h,232 :: 		}
	GOTO        L_MFRC522_ToCard19
L_MFRC522_ToCard18:
;rc522.h,235 :: 		*backLen = n * 8;
	MOVLW       3
	MOVWF       R2 
	MOVF        MFRC522_ToCard_n_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__MFRC522_ToCard111:
	BZ          L__MFRC522_ToCard112
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__MFRC522_ToCard111
L__MFRC522_ToCard112:
	MOVFF       FARG_MFRC522_ToCard_backLen+0, FSR1L+0
	MOVFF       FARG_MFRC522_ToCard_backLen+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;rc522.h,236 :: 		}
L_MFRC522_ToCard19:
;rc522.h,237 :: 		if (n == 0)
	MOVF        MFRC522_ToCard_n_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_ToCard20
;rc522.h,239 :: 		n = 1;
	MOVLW       1
	MOVWF       MFRC522_ToCard_n_L0+0 
;rc522.h,240 :: 		}
L_MFRC522_ToCard20:
;rc522.h,241 :: 		if (n > 16)
	MOVF        MFRC522_ToCard_n_L0+0, 0 
	SUBLW       16
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_ToCard21
;rc522.h,243 :: 		n = 16;
	MOVLW       16
	MOVWF       MFRC522_ToCard_n_L0+0 
;rc522.h,244 :: 		}
L_MFRC522_ToCard21:
;rc522.h,246 :: 		for (i=0; i < n; i++)
	CLRF        MFRC522_ToCard_i_L0+0 
	CLRF        MFRC522_ToCard_i_L0+1 
L_MFRC522_ToCard22:
	MOVLW       0
	SUBWF       MFRC522_ToCard_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_ToCard113
	MOVF        MFRC522_ToCard_n_L0+0, 0 
	SUBWF       MFRC522_ToCard_i_L0+0, 0 
L__MFRC522_ToCard113:
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_ToCard23
;rc522.h,248 :: 		backData[i] = MFRC522_Rd( FIFODATAREG );
	MOVF        MFRC522_ToCard_i_L0+0, 0 
	ADDWF       FARG_MFRC522_ToCard_backData+0, 0 
	MOVWF       FLOC__MFRC522_ToCard+0 
	MOVF        MFRC522_ToCard_i_L0+1, 0 
	ADDWFC      FARG_MFRC522_ToCard_backData+1, 0 
	MOVWF       FLOC__MFRC522_ToCard+1 
	MOVLW       9
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVFF       FLOC__MFRC522_ToCard+0, FSR1L+0
	MOVFF       FLOC__MFRC522_ToCard+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,246 :: 		for (i=0; i < n; i++)
	INFSNZ      MFRC522_ToCard_i_L0+0, 1 
	INCF        MFRC522_ToCard_i_L0+1, 1 
;rc522.h,249 :: 		}
	GOTO        L_MFRC522_ToCard22
L_MFRC522_ToCard23:
;rc522.h,251 :: 		backData[i] = 0;
	MOVF        MFRC522_ToCard_i_L0+0, 0 
	ADDWF       FARG_MFRC522_ToCard_backData+0, 0 
	MOVWF       FSR1L+0 
	MOVF        MFRC522_ToCard_i_L0+1, 0 
	ADDWFC      FARG_MFRC522_ToCard_backData+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;rc522.h,252 :: 		}
L_MFRC522_ToCard17:
;rc522.h,253 :: 		}
	GOTO        L_MFRC522_ToCard25
L_MFRC522_ToCard15:
;rc522.h,256 :: 		_status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_ToCard__status_L0+0 
;rc522.h,257 :: 		}
L_MFRC522_ToCard25:
;rc522.h,258 :: 		}
L_MFRC522_ToCard14:
;rc522.h,261 :: 		return _status;
	MOVF        MFRC522_ToCard__status_L0+0, 0 
	MOVWF       R0 
;rc522.h,262 :: 		}
L_end_MFRC522_ToCard:
	RETURN      0
; end of _MFRC522_ToCard

_MFRC522_Request:

;rc522.h,263 :: 		char MFRC522_Request( char reqMode, char *TagType )
;rc522.h,267 :: 		MFRC522_Wr( BITFRAMINGREG, 0x07 ); //TxLastBists = BitFramingReg[2..0]   ???
	MOVLW       13
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       7
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,268 :: 		TagType[0] = reqMode;
	MOVFF       FARG_MFRC522_Request_TagType+0, FSR1L+0
	MOVFF       FARG_MFRC522_Request_TagType+1, FSR1H+0
	MOVF        FARG_MFRC522_Request_reqMode+0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,269 :: 		_status = MFRC522_ToCard( PCD_TRANSCEIVE, TagType, 1, TagType, &backBits );
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVF        FARG_MFRC522_Request_TagType+0, 0 
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVF        FARG_MFRC522_Request_TagType+1, 0 
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       1
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVF        FARG_MFRC522_Request_TagType+0, 0 
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVF        FARG_MFRC522_Request_TagType+1, 0 
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_Request_backBits_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_Request_backBits_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_Request__status_L0+0 
;rc522.h,270 :: 		if ( (_status != MI_OK) || (backBits != 0x10) )
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Request91
	MOVLW       0
	XORWF       MFRC522_Request_backBits_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Request115
	MOVLW       16
	XORWF       MFRC522_Request_backBits_L0+0, 0 
L__MFRC522_Request115:
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Request91
	GOTO        L_MFRC522_Request28
L__MFRC522_Request91:
;rc522.h,272 :: 		_status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_Request__status_L0+0 
;rc522.h,273 :: 		}
L_MFRC522_Request28:
;rc522.h,274 :: 		return _status;
	MOVF        MFRC522_Request__status_L0+0, 0 
	MOVWF       R0 
;rc522.h,275 :: 		}
L_end_MFRC522_Request:
	RETURN      0
; end of _MFRC522_Request

_MFRC522_CRC:

;rc522.h,276 :: 		void MFRC522_CRC( char *dataIn, char length, char *dataOut )
;rc522.h,279 :: 		MFRC522_Clear_Bit( DIVIRQREG, 0x04 );
	MOVLW       5
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_addr+0 
	MOVLW       4
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_mask+0 
	CALL        rfid_MFRC522_Clear_Bit+0, 0
;rc522.h,280 :: 		MFRC522_Set_Bit( FIFOLEVELREG, 0x80 );
	MOVLW       10
	MOVWF       FARG_rfid_MFRC522_Set_Bit_addr+0 
	MOVLW       128
	MOVWF       FARG_rfid_MFRC522_Set_Bit_mask+0 
	CALL        rfid_MFRC522_Set_Bit+0, 0
;rc522.h,283 :: 		for ( i = 0; i < length; i++ )
	CLRF        MFRC522_CRC_i_L0+0 
L_MFRC522_CRC29:
	MOVF        FARG_MFRC522_CRC_length+0, 0 
	SUBWF       MFRC522_CRC_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_CRC30
;rc522.h,285 :: 		MFRC522_Wr( FIFODATAREG, *dataIn++ );
	MOVLW       9
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVFF       FARG_MFRC522_CRC_dataIn+0, FSR0L+0
	MOVFF       FARG_MFRC522_CRC_dataIn+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
	INFSNZ      FARG_MFRC522_CRC_dataIn+0, 1 
	INCF        FARG_MFRC522_CRC_dataIn+1, 1 
;rc522.h,283 :: 		for ( i = 0; i < length; i++ )
	INCF        MFRC522_CRC_i_L0+0, 1 
;rc522.h,286 :: 		}
	GOTO        L_MFRC522_CRC29
L_MFRC522_CRC30:
;rc522.h,288 :: 		MFRC522_Wr( COMMANDREG, PCD_CALCCRC );
	MOVLW       1
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	MOVLW       3
	MOVWF       FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,290 :: 		i = 0xFF;
	MOVLW       255
	MOVWF       MFRC522_CRC_i_L0+0 
;rc522.h,292 :: 		do
L_MFRC522_CRC32:
;rc522.h,294 :: 		n = MFRC522_Rd( DIVIRQREG );
	MOVLW       5
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_CRC_n_L0+0 
;rc522.h,295 :: 		i--;
	DECF        MFRC522_CRC_i_L0+0, 1 
;rc522.h,297 :: 		while( i && !(n & 0x04) );        //CRCIrq = 1
	MOVF        MFRC522_CRC_i_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__MFRC522_CRC92
	BTFSC       MFRC522_CRC_n_L0+0, 2 
	GOTO        L__MFRC522_CRC92
	GOTO        L_MFRC522_CRC32
L__MFRC522_CRC92:
;rc522.h,299 :: 		dataOut[0] = MFRC522_Rd( CRCRESULTREGL );
	MOVF        FARG_MFRC522_CRC_dataOut+0, 0 
	MOVWF       FLOC__MFRC522_CRC+0 
	MOVF        FARG_MFRC522_CRC_dataOut+1, 0 
	MOVWF       FLOC__MFRC522_CRC+1 
	MOVLW       34
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVFF       FLOC__MFRC522_CRC+0, FSR1L+0
	MOVFF       FLOC__MFRC522_CRC+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,300 :: 		dataOut[1] = MFRC522_Rd( CRCRESULTREGM );
	MOVLW       1
	ADDWF       FARG_MFRC522_CRC_dataOut+0, 0 
	MOVWF       FLOC__MFRC522_CRC+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_CRC_dataOut+1, 0 
	MOVWF       FLOC__MFRC522_CRC+1 
	MOVLW       33
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	MOVFF       FLOC__MFRC522_CRC+0, FSR1L+0
	MOVFF       FLOC__MFRC522_CRC+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,301 :: 		}
L_end_MFRC522_CRC:
	RETURN      0
; end of _MFRC522_CRC

_MFRC522_SelectTag:

;rc522.h,302 :: 		char MFRC522_SelectTag( char *serNum )
;rc522.h,312 :: 		buffer[0] = PICC_SElECTTAG;
	MOVLW       147
	MOVWF       MFRC522_SelectTag_buffer_L0+0 
;rc522.h,313 :: 		buffer[1] = 0x70;
	MOVLW       112
	MOVWF       MFRC522_SelectTag_buffer_L0+1 
;rc522.h,315 :: 		for ( i=2; i < 7; i++ )
	MOVLW       2
	MOVWF       MFRC522_SelectTag_i_L0+0 
L_MFRC522_SelectTag37:
	MOVLW       7
	SUBWF       MFRC522_SelectTag_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_SelectTag38
;rc522.h,317 :: 		buffer[i] = *serNum++;
	MOVLW       MFRC522_SelectTag_buffer_L0+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(MFRC522_SelectTag_buffer_L0+0)
	MOVWF       FSR1L+1 
	MOVF        MFRC522_SelectTag_i_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVFF       FARG_MFRC522_SelectTag_serNum+0, FSR0L+0
	MOVFF       FARG_MFRC522_SelectTag_serNum+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_MFRC522_SelectTag_serNum+0, 1 
	INCF        FARG_MFRC522_SelectTag_serNum+1, 1 
;rc522.h,315 :: 		for ( i=2; i < 7; i++ )
	INCF        MFRC522_SelectTag_i_L0+0, 1 
;rc522.h,318 :: 		}
	GOTO        L_MFRC522_SelectTag37
L_MFRC522_SelectTag38:
;rc522.h,320 :: 		MFRC522_CRC( buffer, 7, &buffer[7] );
	MOVLW       MFRC522_SelectTag_buffer_L0+0
	MOVWF       FARG_MFRC522_CRC_dataIn+0 
	MOVLW       hi_addr(MFRC522_SelectTag_buffer_L0+0)
	MOVWF       FARG_MFRC522_CRC_dataIn+1 
	MOVLW       7
	MOVWF       FARG_MFRC522_CRC_length+0 
	MOVLW       MFRC522_SelectTag_buffer_L0+7
	MOVWF       FARG_MFRC522_CRC_dataOut+0 
	MOVLW       hi_addr(MFRC522_SelectTag_buffer_L0+7)
	MOVWF       FARG_MFRC522_CRC_dataOut+1 
	CALL        _MFRC522_CRC+0, 0
;rc522.h,322 :: 		_status = MFRC522_ToCard( PCD_TRANSCEIVE, buffer, 9, buffer, &recvBits );
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVLW       MFRC522_SelectTag_buffer_L0+0
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVLW       hi_addr(MFRC522_SelectTag_buffer_L0+0)
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       9
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVLW       MFRC522_SelectTag_buffer_L0+0
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVLW       hi_addr(MFRC522_SelectTag_buffer_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_SelectTag_recvBits_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_SelectTag_recvBits_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
;rc522.h,323 :: 		if ( (_status == MI_OK) && (recvBits == 0x18) )
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_SelectTag42
	MOVLW       0
	XORWF       MFRC522_SelectTag_recvBits_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_SelectTag118
	MOVLW       24
	XORWF       MFRC522_SelectTag_recvBits_L0+0, 0 
L__MFRC522_SelectTag118:
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_SelectTag42
L__MFRC522_SelectTag93:
;rc522.h,325 :: 		size = buffer[0];
	MOVF        MFRC522_SelectTag_buffer_L0+0, 0 
	MOVWF       MFRC522_SelectTag_size_L0+0 
;rc522.h,326 :: 		}
	GOTO        L_MFRC522_SelectTag43
L_MFRC522_SelectTag42:
;rc522.h,329 :: 		size = 0;
	CLRF        MFRC522_SelectTag_size_L0+0 
;rc522.h,330 :: 		}
L_MFRC522_SelectTag43:
;rc522.h,331 :: 		return size;
	MOVF        MFRC522_SelectTag_size_L0+0, 0 
	MOVWF       R0 
;rc522.h,332 :: 		}
L_end_MFRC522_SelectTag:
	RETURN      0
; end of _MFRC522_SelectTag

_MFRC522_Halt:

;rc522.h,334 :: 		void MFRC522_Halt()
;rc522.h,339 :: 		buff[0] = PICC_HALT;
	MOVLW       80
	MOVWF       MFRC522_Halt_buff_L0+0 
;rc522.h,340 :: 		buff[1] = 0;
	CLRF        MFRC522_Halt_buff_L0+1 
;rc522.h,341 :: 		MFRC522_CRC( buff, 2, &buff[2] );
	MOVLW       MFRC522_Halt_buff_L0+0
	MOVWF       FARG_MFRC522_CRC_dataIn+0 
	MOVLW       hi_addr(MFRC522_Halt_buff_L0+0)
	MOVWF       FARG_MFRC522_CRC_dataIn+1 
	MOVLW       2
	MOVWF       FARG_MFRC522_CRC_length+0 
	MOVLW       MFRC522_Halt_buff_L0+2
	MOVWF       FARG_MFRC522_CRC_dataOut+0 
	MOVLW       hi_addr(MFRC522_Halt_buff_L0+2)
	MOVWF       FARG_MFRC522_CRC_dataOut+1 
	CALL        _MFRC522_CRC+0, 0
;rc522.h,342 :: 		MFRC522_Clear_Bit( STATUS2REG, 0x80 );
	MOVLW       8
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_addr+0 
	MOVLW       128
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_mask+0 
	CALL        rfid_MFRC522_Clear_Bit+0, 0
;rc522.h,343 :: 		MFRC522_ToCard( PCD_TRANSCEIVE, buff, 4, buff, &unLen );
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVLW       MFRC522_Halt_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVLW       hi_addr(MFRC522_Halt_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       4
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVLW       MFRC522_Halt_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVLW       hi_addr(MFRC522_Halt_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_Halt_unLen_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_Halt_unLen_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
;rc522.h,344 :: 		MFRC522_Clear_Bit( STATUS2REG, 0x08 );
	MOVLW       8
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_addr+0 
	MOVLW       8
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_mask+0 
	CALL        rfid_MFRC522_Clear_Bit+0, 0
;rc522.h,345 :: 		}
L_end_MFRC522_Halt:
	RETURN      0
; end of _MFRC522_Halt

_MFRC522_Auth:

;rc522.h,346 :: 		char MFRC522_Auth( char authMode, char BlockAddr, char *Sectorkey, char *serNum )
;rc522.h,354 :: 		buff[0] = authMode;
	MOVF        FARG_MFRC522_Auth_authMode+0, 0 
	MOVWF       MFRC522_Auth_buff_L0+0 
;rc522.h,355 :: 		buff[1] = BlockAddr;
	MOVF        FARG_MFRC522_Auth_BlockAddr+0, 0 
	MOVWF       MFRC522_Auth_buff_L0+1 
;rc522.h,357 :: 		for ( i = 2; i < 8; i++ )
	MOVLW       2
	MOVWF       MFRC522_Auth_i_L0+0 
L_MFRC522_Auth44:
	MOVLW       8
	SUBWF       MFRC522_Auth_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_Auth45
;rc522.h,359 :: 		buff[i] = Sectorkey[i-2];
	MOVLW       MFRC522_Auth_buff_L0+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(MFRC522_Auth_buff_L0+0)
	MOVWF       FSR1L+1 
	MOVF        MFRC522_Auth_i_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVLW       2
	SUBWF       MFRC522_Auth_i_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_MFRC522_Auth_Sectorkey+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      FARG_MFRC522_Auth_Sectorkey+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,357 :: 		for ( i = 2; i < 8; i++ )
	INCF        MFRC522_Auth_i_L0+0, 1 
;rc522.h,360 :: 		}
	GOTO        L_MFRC522_Auth44
L_MFRC522_Auth45:
;rc522.h,362 :: 		for ( i = 8; i < 12; i++ )
	MOVLW       8
	MOVWF       MFRC522_Auth_i_L0+0 
L_MFRC522_Auth47:
	MOVLW       12
	SUBWF       MFRC522_Auth_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_Auth48
;rc522.h,364 :: 		buff[i] = serNum[i-8];
	MOVLW       MFRC522_Auth_buff_L0+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(MFRC522_Auth_buff_L0+0)
	MOVWF       FSR1L+1 
	MOVF        MFRC522_Auth_i_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVLW       8
	SUBWF       MFRC522_Auth_i_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_MFRC522_Auth_serNum+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      FARG_MFRC522_Auth_serNum+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,362 :: 		for ( i = 8; i < 12; i++ )
	INCF        MFRC522_Auth_i_L0+0, 1 
;rc522.h,365 :: 		}
	GOTO        L_MFRC522_Auth47
L_MFRC522_Auth48:
;rc522.h,367 :: 		_status = MFRC522_ToCard( PCD_AUTHENT, buff, 12, buff, &recvBits );
	MOVLW       14
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVLW       MFRC522_Auth_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVLW       hi_addr(MFRC522_Auth_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVLW       MFRC522_Auth_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVLW       hi_addr(MFRC522_Auth_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_Auth_recvBits_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_Auth_recvBits_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_Auth__status_L0+0 
;rc522.h,369 :: 		if ( ( _status != MI_OK ) || !( MFRC522_Rd( STATUS2REG ) & 0x08 ) )
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Auth94
	MOVLW       8
	MOVWF       FARG_rfid_MFRC522_Rd_addr+0 
	CALL        rfid_MFRC522_Rd+0, 0
	BTFSS       R0, 3 
	GOTO        L__MFRC522_Auth94
	GOTO        L_MFRC522_Auth52
L__MFRC522_Auth94:
;rc522.h,371 :: 		_status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_Auth__status_L0+0 
;rc522.h,372 :: 		}
L_MFRC522_Auth52:
;rc522.h,374 :: 		return _status;
	MOVF        MFRC522_Auth__status_L0+0, 0 
	MOVWF       R0 
;rc522.h,375 :: 		}
L_end_MFRC522_Auth:
	RETURN      0
; end of _MFRC522_Auth

_MFRC522_Write:

;rc522.h,376 :: 		char MFRC522_Write( char blockAddr, char *writeData )
;rc522.h,382 :: 		buff[0] = PICC_WRITE;
	MOVLW       160
	MOVWF       MFRC522_Write_buff_L0+0 
;rc522.h,383 :: 		buff[1] = blockAddr;
	MOVF        FARG_MFRC522_Write_blockAddr+0, 0 
	MOVWF       MFRC522_Write_buff_L0+1 
;rc522.h,385 :: 		MFRC522_CRC( buff, 2, &buff[2] );
	MOVLW       MFRC522_Write_buff_L0+0
	MOVWF       FARG_MFRC522_CRC_dataIn+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+0)
	MOVWF       FARG_MFRC522_CRC_dataIn+1 
	MOVLW       2
	MOVWF       FARG_MFRC522_CRC_length+0 
	MOVLW       MFRC522_Write_buff_L0+2
	MOVWF       FARG_MFRC522_CRC_dataOut+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+2)
	MOVWF       FARG_MFRC522_CRC_dataOut+1 
	CALL        _MFRC522_CRC+0, 0
;rc522.h,386 :: 		_status = MFRC522_ToCard( PCD_TRANSCEIVE, buff, 4, buff, &recvBits );
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVLW       MFRC522_Write_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       4
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVLW       MFRC522_Write_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_Write_recvBits_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_Write_recvBits_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_Write__status_L0+0 
;rc522.h,387 :: 		if ( (_status != MI_OK) || (recvBits != 4) || ( (buff[0] & 0x0F) != 0x0A) )
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write96
	MOVLW       0
	XORWF       MFRC522_Write_recvBits_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write122
	MOVLW       4
	XORWF       MFRC522_Write_recvBits_L0+0, 0 
L__MFRC522_Write122:
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write96
	MOVLW       15
	ANDWF       MFRC522_Write_buff_L0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write96
	GOTO        L_MFRC522_Write55
L__MFRC522_Write96:
;rc522.h,389 :: 		_status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_Write__status_L0+0 
;rc522.h,390 :: 		}
L_MFRC522_Write55:
;rc522.h,391 :: 		if (_status == MI_OK)
	MOVF        MFRC522_Write__status_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_Write56
;rc522.h,393 :: 		for ( i = 0; i < 16; i++ )                //Data to the FIFO write 16Byte
	CLRF        MFRC522_Write_i_L0+0 
L_MFRC522_Write57:
	MOVLW       16
	SUBWF       MFRC522_Write_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_Write58
;rc522.h,395 :: 		buff[i] = writeData[i];
	MOVLW       MFRC522_Write_buff_L0+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+0)
	MOVWF       FSR1L+1 
	MOVF        MFRC522_Write_i_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        MFRC522_Write_i_L0+0, 0 
	ADDWF       FARG_MFRC522_Write_writeData+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_Write_writeData+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,393 :: 		for ( i = 0; i < 16; i++ )                //Data to the FIFO write 16Byte
	INCF        MFRC522_Write_i_L0+0, 1 
;rc522.h,396 :: 		}
	GOTO        L_MFRC522_Write57
L_MFRC522_Write58:
;rc522.h,398 :: 		MFRC522_CRC( buff, 16, &buff[16] );
	MOVLW       MFRC522_Write_buff_L0+0
	MOVWF       FARG_MFRC522_CRC_dataIn+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+0)
	MOVWF       FARG_MFRC522_CRC_dataIn+1 
	MOVLW       16
	MOVWF       FARG_MFRC522_CRC_length+0 
	MOVLW       MFRC522_Write_buff_L0+16
	MOVWF       FARG_MFRC522_CRC_dataOut+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+16)
	MOVWF       FARG_MFRC522_CRC_dataOut+1 
	CALL        _MFRC522_CRC+0, 0
;rc522.h,399 :: 		_status = MFRC522_ToCard( PCD_TRANSCEIVE, buff, 18, buff, &recvBits );
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVLW       MFRC522_Write_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       18
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVLW       MFRC522_Write_buff_L0+0
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVLW       hi_addr(MFRC522_Write_buff_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_Write_recvBits_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_Write_recvBits_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_Write__status_L0+0 
;rc522.h,400 :: 		if ( (_status != MI_OK) || (recvBits != 4) || ( (buff[0] & 0x0F) != 0x0A ) )
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write95
	MOVLW       0
	XORWF       MFRC522_Write_recvBits_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write123
	MOVLW       4
	XORWF       MFRC522_Write_recvBits_L0+0, 0 
L__MFRC522_Write123:
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write95
	MOVLW       15
	ANDWF       MFRC522_Write_buff_L0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Write95
	GOTO        L_MFRC522_Write62
L__MFRC522_Write95:
;rc522.h,402 :: 		_status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_Write__status_L0+0 
;rc522.h,403 :: 		}
L_MFRC522_Write62:
;rc522.h,404 :: 		}
L_MFRC522_Write56:
;rc522.h,405 :: 		return _status;
	MOVF        MFRC522_Write__status_L0+0, 0 
	MOVWF       R0 
;rc522.h,406 :: 		}
L_end_MFRC522_Write:
	RETURN      0
; end of _MFRC522_Write

_MFRC522_Read:

;rc522.h,407 :: 		char MFRC522_Read( char blockAddr, char *recvData )
;rc522.h,411 :: 		recvData[0] = PICC_READ;
	MOVFF       FARG_MFRC522_Read_recvData+0, FSR1L+0
	MOVFF       FARG_MFRC522_Read_recvData+1, FSR1H+0
	MOVLW       48
	MOVWF       POSTINC1+0 
;rc522.h,412 :: 		recvData[1] = blockAddr;
	MOVLW       1
	ADDWF       FARG_MFRC522_Read_recvData+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_Read_recvData+1, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG_MFRC522_Read_blockAddr+0, 0 
	MOVWF       POSTINC1+0 
;rc522.h,414 :: 		MFRC522_CRC( recvData, 2, &recvData[2] );
	MOVF        FARG_MFRC522_Read_recvData+0, 0 
	MOVWF       FARG_MFRC522_CRC_dataIn+0 
	MOVF        FARG_MFRC522_Read_recvData+1, 0 
	MOVWF       FARG_MFRC522_CRC_dataIn+1 
	MOVLW       2
	MOVWF       FARG_MFRC522_CRC_length+0 
	MOVLW       2
	ADDWF       FARG_MFRC522_Read_recvData+0, 0 
	MOVWF       FARG_MFRC522_CRC_dataOut+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_Read_recvData+1, 0 
	MOVWF       FARG_MFRC522_CRC_dataOut+1 
	CALL        _MFRC522_CRC+0, 0
;rc522.h,416 :: 		_status = MFRC522_ToCard( PCD_TRANSCEIVE, recvData, 4, recvData, &unLen );
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVF        FARG_MFRC522_Read_recvData+0, 0 
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVF        FARG_MFRC522_Read_recvData+1, 0 
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       4
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVF        FARG_MFRC522_Read_recvData+0, 0 
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVF        FARG_MFRC522_Read_recvData+1, 0 
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_Read_unLen_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_Read_unLen_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_Read__status_L0+0 
;rc522.h,417 :: 		if ( (_status != MI_OK) || (unLen != 0x90) )
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Read97
	MOVLW       0
	XORWF       MFRC522_Read_unLen_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Read125
	MOVLW       144
	XORWF       MFRC522_Read_unLen_L0+0, 0 
L__MFRC522_Read125:
	BTFSS       STATUS+0, 2 
	GOTO        L__MFRC522_Read97
	GOTO        L_MFRC522_Read65
L__MFRC522_Read97:
;rc522.h,419 :: 		_status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_Read__status_L0+0 
;rc522.h,420 :: 		}
L_MFRC522_Read65:
;rc522.h,421 :: 		return _status;
	MOVF        MFRC522_Read__status_L0+0, 0 
	MOVWF       R0 
;rc522.h,422 :: 		}
L_end_MFRC522_Read:
	RETURN      0
; end of _MFRC522_Read

_MFRC522_AntiColl:

;rc522.h,423 :: 		char MFRC522_AntiColl( char *serNum )
;rc522.h,427 :: 		char serNumCheck = 0;
	CLRF        MFRC522_AntiColl_serNumCheck_L0+0 
;rc522.h,429 :: 		MFRC522_Wr( BITFRAMINGREG, 0x00 );                //TxLastBists = BitFramingReg[2..0]
	MOVLW       13
	MOVWF       FARG_rfid_MFRC522_Wr_addr+0 
	CLRF        FARG_rfid_MFRC522_Wr_value+0 
	CALL        rfid_MFRC522_Wr+0, 0
;rc522.h,430 :: 		serNum[0] = PICC_ANTICOLL;
	MOVFF       FARG_MFRC522_AntiColl_serNum+0, FSR1L+0
	MOVFF       FARG_MFRC522_AntiColl_serNum+1, FSR1H+0
	MOVLW       147
	MOVWF       POSTINC1+0 
;rc522.h,431 :: 		serNum[1] = 0x20;
	MOVLW       1
	ADDWF       FARG_MFRC522_AntiColl_serNum+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_AntiColl_serNum+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       32
	MOVWF       POSTINC1+0 
;rc522.h,432 :: 		MFRC522_Clear_Bit( STATUS2REG, 0x08 );
	MOVLW       8
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_addr+0 
	MOVLW       8
	MOVWF       FARG_rfid_MFRC522_Clear_Bit_mask+0 
	CALL        rfid_MFRC522_Clear_Bit+0, 0
;rc522.h,433 :: 		_status = MFRC522_ToCard( PCD_TRANSCEIVE, serNum, 2, serNum, &unLen );
	MOVLW       12
	MOVWF       FARG_MFRC522_ToCard_command+0 
	MOVF        FARG_MFRC522_AntiColl_serNum+0, 0 
	MOVWF       FARG_MFRC522_ToCard_sendData+0 
	MOVF        FARG_MFRC522_AntiColl_serNum+1, 0 
	MOVWF       FARG_MFRC522_ToCard_sendData+1 
	MOVLW       2
	MOVWF       FARG_MFRC522_ToCard_sendLen+0 
	MOVF        FARG_MFRC522_AntiColl_serNum+0, 0 
	MOVWF       FARG_MFRC522_ToCard_backData+0 
	MOVF        FARG_MFRC522_AntiColl_serNum+1, 0 
	MOVWF       FARG_MFRC522_ToCard_backData+1 
	MOVLW       MFRC522_AntiColl_unLen_L0+0
	MOVWF       FARG_MFRC522_ToCard_backLen+0 
	MOVLW       hi_addr(MFRC522_AntiColl_unLen_L0+0)
	MOVWF       FARG_MFRC522_ToCard_backLen+1 
	CALL        _MFRC522_ToCard+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_AntiColl__status_L0+0 
;rc522.h,434 :: 		if (_status == MI_OK)
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_AntiColl66
;rc522.h,436 :: 		for ( i=0; i < 4; i++ )
	CLRF        MFRC522_AntiColl_i_L0+0 
L_MFRC522_AntiColl67:
	MOVLW       4
	SUBWF       MFRC522_AntiColl_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_MFRC522_AntiColl68
;rc522.h,438 :: 		serNumCheck ^= serNum[i];
	MOVF        MFRC522_AntiColl_i_L0+0, 0 
	ADDWF       FARG_MFRC522_AntiColl_serNum+0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_AntiColl_serNum+1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	XORWF       MFRC522_AntiColl_serNumCheck_L0+0, 1 
;rc522.h,436 :: 		for ( i=0; i < 4; i++ )
	INCF        MFRC522_AntiColl_i_L0+0, 1 
;rc522.h,439 :: 		}
	GOTO        L_MFRC522_AntiColl67
L_MFRC522_AntiColl68:
;rc522.h,441 :: 		if ( serNumCheck != serNum[4] )
	MOVLW       4
	ADDWF       FARG_MFRC522_AntiColl_serNum+0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_AntiColl_serNum+1, 0 
	MOVWF       FSR2L+1 
	MOVF        MFRC522_AntiColl_serNumCheck_L0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_MFRC522_AntiColl70
;rc522.h,443 :: 		_status = MI_ERR;
	MOVLW       2
	MOVWF       MFRC522_AntiColl__status_L0+0 
;rc522.h,444 :: 		}
L_MFRC522_AntiColl70:
;rc522.h,445 :: 		}
L_MFRC522_AntiColl66:
;rc522.h,446 :: 		return _status;
	MOVF        MFRC522_AntiColl__status_L0+0, 0 
	MOVWF       R0 
;rc522.h,447 :: 		}
L_end_MFRC522_AntiColl:
	RETURN      0
; end of _MFRC522_AntiColl

_MFRC522_isCard:

;rc522.h,453 :: 		char MFRC522_isCard( char *TagType )
;rc522.h,455 :: 		if (MFRC522_Request( PICC_REQIDL, TagType ) == MI_OK)
	MOVLW       38
	MOVWF       FARG_MFRC522_Request_reqMode+0 
	MOVF        FARG_MFRC522_isCard_TagType+0, 0 
	MOVWF       FARG_MFRC522_Request_TagType+0 
	MOVF        FARG_MFRC522_isCard_TagType+1, 0 
	MOVWF       FARG_MFRC522_Request_TagType+1 
	CALL        _MFRC522_Request+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_isCard71
;rc522.h,456 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_MFRC522_isCard
L_MFRC522_isCard71:
;rc522.h,458 :: 		return 0;
	CLRF        R0 
;rc522.h,459 :: 		}
L_end_MFRC522_isCard:
	RETURN      0
; end of _MFRC522_isCard

_MFRC522_ReadCardSerial:

;rc522.h,460 :: 		char MFRC522_ReadCardSerial( char *str )
;rc522.h,463 :: 		_status = MFRC522_AntiColl( str );
	MOVF        FARG_MFRC522_ReadCardSerial_str+0, 0 
	MOVWF       FARG_MFRC522_AntiColl_serNum+0 
	MOVF        FARG_MFRC522_ReadCardSerial_str+1, 0 
	MOVWF       FARG_MFRC522_AntiColl_serNum+1 
	CALL        _MFRC522_AntiColl+0, 0
	MOVF        R0, 0 
	MOVWF       MFRC522_ReadCardSerial__status_L0+0 
;rc522.h,464 :: 		str[5] = 0;
	MOVLW       5
	ADDWF       FARG_MFRC522_ReadCardSerial_str+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_MFRC522_ReadCardSerial_str+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;rc522.h,465 :: 		if (_status == MI_OK)
	MOVF        MFRC522_ReadCardSerial__status_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_MFRC522_ReadCardSerial73
;rc522.h,466 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_MFRC522_ReadCardSerial
L_MFRC522_ReadCardSerial73:
;rc522.h,468 :: 		return 0;
	CLRF        R0 
;rc522.h,469 :: 		}
L_end_MFRC522_ReadCardSerial:
	RETURN      0
; end of _MFRC522_ReadCardSerial

_Hash_algoritmo:

;rfid.c,39 :: 		unsigned long  Hash_algoritmo ()
;rfid.c,41 :: 		unsigned long  hash_acum = FNV_BASIS;
	MOVLW       197
	MOVWF       Hash_algoritmo_hash_acum_L0+0 
	MOVLW       157
	MOVWF       Hash_algoritmo_hash_acum_L0+1 
	MOVLW       28
	MOVWF       Hash_algoritmo_hash_acum_L0+2 
	MOVLW       129
	MOVWF       Hash_algoritmo_hash_acum_L0+3 
;rfid.c,43 :: 		for (cont=0;cont<=4;cont++)   // se guardan cinco datos del uid
	CLRF        _cont+0 
L_Hash_algoritmo75:
	MOVF        _cont+0, 0 
	SUBLW       4
	BTFSS       STATUS+0, 0 
	GOTO        L_Hash_algoritmo76
;rfid.c,46 :: 		hash_acum = (hash_acum * FNV_PRIME) ^ UID[cont];
	MOVF        Hash_algoritmo_hash_acum_L0+0, 0 
	MOVWF       R0 
	MOVF        Hash_algoritmo_hash_acum_L0+1, 0 
	MOVWF       R1 
	MOVF        Hash_algoritmo_hash_acum_L0+2, 0 
	MOVWF       R2 
	MOVF        Hash_algoritmo_hash_acum_L0+3, 0 
	MOVWF       R3 
	MOVLW       147
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       1
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       _UID+0
	MOVWF       FSR2L+0 
	MOVLW       hi_addr(_UID+0)
	MOVWF       FSR2L+1 
	MOVF        _cont+0, 0 
	ADDWF       FSR2L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2L+1, 1 
	MOVF        POSTINC2+0, 0 
	XORWF       R0, 0 
	MOVWF       Hash_algoritmo_hash_acum_L0+0 
	MOVF        R1, 0 
	MOVWF       Hash_algoritmo_hash_acum_L0+1 
	MOVF        R2, 0 
	MOVWF       Hash_algoritmo_hash_acum_L0+2 
	MOVF        R3, 0 
	MOVWF       Hash_algoritmo_hash_acum_L0+3 
	MOVLW       0
	XORWF       Hash_algoritmo_hash_acum_L0+1, 1 
	XORWF       Hash_algoritmo_hash_acum_L0+2, 1 
	XORWF       Hash_algoritmo_hash_acum_L0+3, 1 
;rfid.c,43 :: 		for (cont=0;cont<=4;cont++)   // se guardan cinco datos del uid
	INCF        _cont+0, 1 
;rfid.c,47 :: 		}
	GOTO        L_Hash_algoritmo75
L_Hash_algoritmo76:
;rfid.c,49 :: 		return (hash_acum);
	MOVF        Hash_algoritmo_hash_acum_L0+0, 0 
	MOVWF       R0 
	MOVF        Hash_algoritmo_hash_acum_L0+1, 0 
	MOVWF       R1 
	MOVF        Hash_algoritmo_hash_acum_L0+2, 0 
	MOVWF       R2 
	MOVF        Hash_algoritmo_hash_acum_L0+3, 0 
	MOVWF       R3 
;rfid.c,50 :: 		}
L_end_Hash_algoritmo:
	RETURN      0
; end of _Hash_algoritmo

_main:

;rfid.c,53 :: 		void main()
;rfid.c,58 :: 		ADCON1=0B1111;// TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;rfid.c,61 :: 		CMCON=7; // APAGA EL COMPARADOR.
	MOVLW       7
	MOVWF       CMCON+0 
;rfid.c,63 :: 		trisb=0;
	CLRF        TRISB+0 
;rfid.c,64 :: 		trisc=0;
	CLRF        TRISC+0 
;rfid.c,66 :: 		trisc.b7=1; //entrada rx
	BSF         TRISC+0, 7 
;rfid.c,67 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;rfid.c,68 :: 		RCEN_bit=1; //recepcion continua.
	BSF         RCEN_bit+0, BitPos(RCEN_bit+0) 
;rfid.c,71 :: 		UART1_Write_Text( "Iniciando\r\n" );
	MOVLW       ?lstr1_rfid+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_rfid+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;rfid.c,73 :: 		LATB=0;
	CLRF        LATB+0 
;rfid.c,75 :: 		Soft_SPI_Init();    //inicia modulo SPI
	CALL        _Soft_SPI_Init+0, 0
;rfid.c,77 :: 		MFRC522_Init();  //inicializa la tarjeta
	CALL        _MFRC522_Init+0, 0
;rfid.c,79 :: 		while (1)
L_main78:
;rfid.c,81 :: 		if( MFRC522_isCard( &TagType ) )
	MOVLW       _TagType+0
	MOVWF       FARG_MFRC522_isCard_TagType+0 
	MOVLW       hi_addr(_TagType+0)
	MOVWF       FARG_MFRC522_isCard_TagType+1 
	CALL        _MFRC522_isCard+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main80
;rfid.c,83 :: 		if( MFRC522_ReadCardSerial( &UID ) )
	MOVLW       _UID+0
	MOVWF       FARG_MFRC522_ReadCardSerial_str+0 
	MOVLW       hi_addr(_UID+0)
	MOVWF       FARG_MFRC522_ReadCardSerial_str+1 
	CALL        _MFRC522_ReadCardSerial+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main81
;rfid.c,86 :: 		codigo_rfid=Hash_algoritmo();
	CALL        _Hash_algoritmo+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo_rfid+0 
	MOVF        R1, 0 
	MOVWF       _codigo_rfid+1 
	MOVF        R2, 0 
	MOVWF       _codigo_rfid+2 
	MOVF        R3, 0 
	MOVWF       _codigo_rfid+3 
;rfid.c,87 :: 		LongIntToHex(codigo_rfid,texto);
	MOVF        R0, 0 
	MOVWF       FARG_LongIntToHex_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_LongIntToHex_input+1 
	MOVF        R2, 0 
	MOVWF       FARG_LongIntToHex_input+2 
	MOVF        R3, 0 
	MOVWF       FARG_LongIntToHex_input+3 
	MOVLW       _texto+0
	MOVWF       FARG_LongIntToHex_output+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_LongIntToHex_output+1 
	CALL        _LongIntToHex+0, 0
;rfid.c,88 :: 		UART1_Write_Text("CODIGO_RFID=");
	MOVLW       ?lstr2_rfid+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_rfid+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;rfid.c,89 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;rfid.c,90 :: 		UART1_Write('\r');
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;rfid.c,91 :: 		UART1_Write('\n');
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;rfid.c,95 :: 		if (codigo_rfid==0XE753E97B)
	MOVF        _codigo_rfid+3, 0 
	XORLW       231
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVF        _codigo_rfid+2, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVF        _codigo_rfid+1, 0 
	XORLW       233
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVF        _codigo_rfid+0, 0 
	XORLW       123
L__main131:
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
;rfid.c,97 :: 		led1=~led1;
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;rfid.c,98 :: 		UART1_Write_Text("TAG1\r\n");
	MOVLW       ?lstr3_rfid+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_rfid+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;rfid.c,100 :: 		}
	GOTO        L_main83
L_main82:
;rfid.c,101 :: 		else if (codigo_rfid==0xC34A02A9)
	MOVF        _codigo_rfid+3, 0 
	XORLW       195
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVF        _codigo_rfid+2, 0 
	XORLW       74
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVF        _codigo_rfid+1, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVF        _codigo_rfid+0, 0 
	XORLW       169
L__main132:
	BTFSS       STATUS+0, 2 
	GOTO        L_main84
;rfid.c,103 :: 		led2=~led2;
	BTG         LATB6_bit+0, BitPos(LATB6_bit+0) 
;rfid.c,104 :: 		UART1_Write_Text("TAG2\r\n");
	MOVLW       ?lstr4_rfid+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_rfid+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;rfid.c,106 :: 		}
	GOTO        L_main85
L_main84:
;rfid.c,108 :: 		else if (codigo_rfid==0XDE2ADFD3)
	MOVF        _codigo_rfid+3, 0 
	XORLW       222
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVF        _codigo_rfid+2, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVF        _codigo_rfid+1, 0 
	XORLW       223
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVF        _codigo_rfid+0, 0 
	XORLW       211
L__main133:
	BTFSS       STATUS+0, 2 
	GOTO        L_main86
;rfid.c,110 :: 		led3=~led3;
	BTG         LATB5_bit+0, BitPos(LATB5_bit+0) 
;rfid.c,111 :: 		UART1_Write_Text("TAG3\r\n");
	MOVLW       ?lstr5_rfid+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_rfid+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;rfid.c,113 :: 		}
	GOTO        L_main87
L_main86:
;rfid.c,115 :: 		else if (codigo_rfid==0XABED0215)
	MOVF        _codigo_rfid+3, 0 
	XORLW       171
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVF        _codigo_rfid+2, 0 
	XORLW       237
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVF        _codigo_rfid+1, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVF        _codigo_rfid+0, 0 
	XORLW       21
L__main134:
	BTFSS       STATUS+0, 2 
	GOTO        L_main88
;rfid.c,117 :: 		led4=~led4;
	BTG         LATB4_bit+0, BitPos(LATB4_bit+0) 
;rfid.c,118 :: 		UART1_Write_Text("TAG4\r\n");
	MOVLW       ?lstr6_rfid+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_rfid+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;rfid.c,120 :: 		}
L_main88:
L_main87:
L_main85:
L_main83:
;rfid.c,122 :: 		codigo_rfid=0;
	CLRF        _codigo_rfid+0 
	CLRF        _codigo_rfid+1 
	CLRF        _codigo_rfid+2 
	CLRF        _codigo_rfid+3 
;rfid.c,125 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main89:
	DECFSZ      R13, 1, 1
	BRA         L_main89
	DECFSZ      R12, 1, 1
	BRA         L_main89
	DECFSZ      R11, 1, 1
	BRA         L_main89
	NOP
	NOP
;rfid.c,127 :: 		} // lee el codigo de la tarjeta
L_main81:
;rfid.c,129 :: 		}//  detecta precencia RFID
L_main80:
;rfid.c,132 :: 		}
	GOTO        L_main78
;rfid.c,135 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
