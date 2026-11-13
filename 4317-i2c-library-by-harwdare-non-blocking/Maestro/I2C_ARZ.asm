
_I2C_CONFIG_master:

;I2C_ARZ.c,6 :: 		void I2C_CONFIG_master(unsigned long  i2c_velo)
;I2C_ARZ.c,9 :: 		SSP1STAT =0;// limpia registro de estado
	CLRF       SSP1STAT+0
;I2C_ARZ.c,10 :: 		SSP1CON1=0b1000; // i2c en modo master
	MOVLW      8
	MOVWF      SSP1CON1+0
;I2C_ARZ.c,11 :: 		SSP1CON2 =0;
	CLRF       SSP1CON2+0
;I2C_ARZ.c,12 :: 		SSP1ADD  = (cristal/i2c_velo)-1;    // carga valor del registro de velocidad
	MOVF       FARG_I2C_CONFIG_master_i2c_velo+0, 0
	MOVWF      R4
	MOVF       FARG_I2C_CONFIG_master_i2c_velo+1, 0
	MOVWF      R5
	MOVF       FARG_I2C_CONFIG_master_i2c_velo+2, 0
	MOVWF      R6
	MOVF       FARG_I2C_CONFIG_master_i2c_velo+3, 0
	MOVWF      R7
	MOVLW      128
	MOVWF      R0
	MOVLW      132
	MOVWF      R1
	MOVLW      30
	MOVWF      R2
	MOVLW      0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	DECF       R0, 0
	MOVWF      SSP1ADD+0
;I2C_ARZ.c,13 :: 		SSPEN_bit=1; // habilita el i2c
	BSF        SSPEN_bit+0, BitPos(SSPEN_bit+0)
;I2C_ARZ.c,15 :: 		}
L_end_I2C_CONFIG_master:
	RETURN
; end of _I2C_CONFIG_master

_I2C_WAIT:

;I2C_ARZ.c,17 :: 		void I2C_WAIT()
;I2C_ARZ.c,19 :: 		while (SSP1IF_bit==0);
L_I2C_WAIT0:
	BTFSC      SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
	GOTO       L_I2C_WAIT1
	GOTO       L_I2C_WAIT0
L_I2C_WAIT1:
;I2C_ARZ.c,20 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,21 :: 		}
L_end_I2C_WAIT:
	RETURN
; end of _I2C_WAIT

_I2C_STARTBIT:

;I2C_ARZ.c,23 :: 		void I2C_STARTBIT()
;I2C_ARZ.c,25 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,26 :: 		SEN_bit=1;
	BSF        SEN_bit+0, BitPos(SEN_bit+0)
;I2C_ARZ.c,27 :: 		while(SEN_bit==1);
L_I2C_STARTBIT2:
	BTFSS      SEN_bit+0, BitPos(SEN_bit+0)
	GOTO       L_I2C_STARTBIT3
	GOTO       L_I2C_STARTBIT2
L_I2C_STARTBIT3:
;I2C_ARZ.c,29 :: 		}
L_end_I2C_STARTBIT:
	RETURN
; end of _I2C_STARTBIT

_I2C_STOPBIT:

;I2C_ARZ.c,31 :: 		void I2C_STOPBIT()
;I2C_ARZ.c,33 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,34 :: 		PEN_bit=1;
	BSF        PEN_bit+0, BitPos(PEN_bit+0)
;I2C_ARZ.c,35 :: 		while(PEN_bit==1);
L_I2C_STOPBIT4:
	BTFSS      PEN_bit+0, BitPos(PEN_bit+0)
	GOTO       L_I2C_STOPBIT5
	GOTO       L_I2C_STOPBIT4
L_I2C_STOPBIT5:
;I2C_ARZ.c,37 :: 		}
L_end_I2C_STOPBIT:
	RETURN
; end of _I2C_STOPBIT

_I2C_REPEATSTARTBIT:

;I2C_ARZ.c,39 :: 		void I2C_REPEATSTARTBIT()
;I2C_ARZ.c,41 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,42 :: 		RSEN_bit=1;
	BSF        RSEN_bit+0, BitPos(RSEN_bit+0)
;I2C_ARZ.c,43 :: 		while (RSEN_bit==1);
L_I2C_REPEATSTARTBIT6:
	BTFSS      RSEN_bit+0, BitPos(RSEN_bit+0)
	GOTO       L_I2C_REPEATSTARTBIT7
	GOTO       L_I2C_REPEATSTARTBIT6
L_I2C_REPEATSTARTBIT7:
;I2C_ARZ.c,44 :: 		}
L_end_I2C_REPEATSTARTBIT:
	RETURN
; end of _I2C_REPEATSTARTBIT

_I2C_ACKBIT:

;I2C_ARZ.c,47 :: 		void I2C_ACKBIT()
;I2C_ARZ.c,50 :: 		ACKDT_bit=0;
	BCF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
;I2C_ARZ.c,51 :: 		ACKEN_bit=1; // inicia secuencia de envio;
	BSF        ACKEN_bit+0, BitPos(ACKEN_bit+0)
;I2C_ARZ.c,52 :: 		while(ACKEN_bit==1); // espera que termine
L_I2C_ACKBIT8:
	BTFSS      ACKEN_bit+0, BitPos(ACKEN_bit+0)
	GOTO       L_I2C_ACKBIT9
	GOTO       L_I2C_ACKBIT8
L_I2C_ACKBIT9:
;I2C_ARZ.c,53 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,55 :: 		}
L_end_I2C_ACKBIT:
	RETURN
; end of _I2C_ACKBIT

_I2C_NOACKBIT:

;I2C_ARZ.c,58 :: 		void I2C_NOACKBIT()
;I2C_ARZ.c,61 :: 		ACKDT_bit=1;
	BSF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
;I2C_ARZ.c,62 :: 		ACKEN_bit=1; // inicia secuencia de envio;
	BSF        ACKEN_bit+0, BitPos(ACKEN_bit+0)
;I2C_ARZ.c,63 :: 		while(ACKEN_bit==1); // espera que termine
L_I2C_NOACKBIT10:
	BTFSS      ACKEN_bit+0, BitPos(ACKEN_bit+0)
	GOTO       L_I2C_NOACKBIT11
	GOTO       L_I2C_NOACKBIT10
L_I2C_NOACKBIT11:
;I2C_ARZ.c,64 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,66 :: 		}
L_end_I2C_NOACKBIT:
	RETURN
; end of _I2C_NOACKBIT

_I2C_ACK_READBIT:

;I2C_ARZ.c,68 :: 		char  I2C_ACK_READBIT() //LEE BIT DE RECONOCIMIENTO
;I2C_ARZ.c,70 :: 		return (ACKSTAT);
	MOVLW      6
	MOVWF      R0
;I2C_ARZ.c,71 :: 		}
L_end_I2C_ACK_READBIT:
	RETURN
; end of _I2C_ACK_READBIT

_I2C_WRITE_BYTE:

;I2C_ARZ.c,73 :: 		char I2C_WRITE_BYTE(unsigned char dato_i2c)
;I2C_ARZ.c,75 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,76 :: 		SSP1BUF=dato_i2c;
	MOVF       FARG_I2C_WRITE_BYTE_dato_i2c+0, 0
	MOVWF      SSP1BUF+0
;I2C_ARZ.c,77 :: 		I2C_WAIT();
	CALL       _I2C_WAIT+0
;I2C_ARZ.c,78 :: 		if (ACKSTAT_bit==0) return (1); else return (0);
	BTFSC      ACKSTAT_bit+0, BitPos(ACKSTAT_bit+0)
	GOTO       L_I2C_WRITE_BYTE12
	MOVLW      1
	MOVWF      R0
	GOTO       L_end_I2C_WRITE_BYTE
L_I2C_WRITE_BYTE12:
	CLRF       R0
;I2C_ARZ.c,79 :: 		}
L_end_I2C_WRITE_BYTE:
	RETURN
; end of _I2C_WRITE_BYTE

_I2C_READ_BYTE:

;I2C_ARZ.c,81 :: 		unsigned char I2C_READ_BYTE(char ack_bit)
;I2C_ARZ.c,85 :: 		RCEN_bit=1; // SE PROGRAMA COMO RECEPTOR
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;I2C_ARZ.c,87 :: 		while (RCEN_bit==1);  // espera que lleguen los datos
L_I2C_READ_BYTE14:
	BTFSS      RCEN_bit+0, BitPos(RCEN_bit+0)
	GOTO       L_I2C_READ_BYTE15
	GOTO       L_I2C_READ_BYTE14
L_I2C_READ_BYTE15:
;I2C_ARZ.c,88 :: 		SSP1IF_bit=0;
	BCF        SSP1IF_bit+0, BitPos(SSP1IF_bit+0)
;I2C_ARZ.c,89 :: 		i2c_dato_read1=SSP1BUF; // lee el dato  // PROCEDE A LEER EL DATO
	MOVF       SSP1BUF+0, 0
	MOVWF      I2C_READ_BYTE_i2c_dato_read1_L0+0
;I2C_ARZ.c,90 :: 		if (ack_bit==0) I2C_NOACKBIT();else I2C_ACKBIT();  // manda el bit asociado al reconocimiento
	MOVF       FARG_I2C_READ_BYTE_ack_bit+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_READ_BYTE16
	CALL       _I2C_NOACKBIT+0
	GOTO       L_I2C_READ_BYTE17
L_I2C_READ_BYTE16:
	CALL       _I2C_ACKBIT+0
L_I2C_READ_BYTE17:
;I2C_ARZ.c,91 :: 		return(i2c_dato_read1); // retorna el dato leido
	MOVF       I2C_READ_BYTE_i2c_dato_read1_L0+0, 0
	MOVWF      R0
;I2C_ARZ.c,93 :: 		}
L_end_I2C_READ_BYTE:
	RETURN
; end of _I2C_READ_BYTE
