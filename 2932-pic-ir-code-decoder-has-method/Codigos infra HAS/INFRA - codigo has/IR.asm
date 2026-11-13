
_Hash_algoritmo:

;IR.c,34 :: 		unsigned long  Hash_algoritmo ()
;IR.c,36 :: 		unsigned long  hash_acum = FNV_BASIS;
	MOVLW      197
	MOVWF      Hash_algoritmo_hash_acum_L0+0
	MOVLW      157
	MOVWF      Hash_algoritmo_hash_acum_L0+1
	MOVLW      28
	MOVWF      Hash_algoritmo_hash_acum_L0+2
	MOVLW      129
	MOVWF      Hash_algoritmo_hash_acum_L0+3
;IR.c,38 :: 		for (cont=0;cont<cuenta-1;cont++)
	CLRF       _cont+0
L_Hash_algoritmo0:
	MOVLW      1
	SUBWF      _cuenta+0, 0
	MOVWF      R1
	MOVLW      0
	SUBWFB     _cuenta+1, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Hash_algoritmo41
	MOVF       R1, 0
	SUBWF      _cont+0, 0
L__Hash_algoritmo41:
	BTFSC      STATUS+0, 0
	GOTO       L_Hash_algoritmo1
;IR.c,41 :: 		hash_acum = (hash_acum * FNV_PRIME) ^ tiempo[cont];
	MOVF       Hash_algoritmo_hash_acum_L0+0, 0
	MOVWF      R0
	MOVF       Hash_algoritmo_hash_acum_L0+1, 0
	MOVWF      R1
	MOVF       Hash_algoritmo_hash_acum_L0+2, 0
	MOVWF      R2
	MOVF       Hash_algoritmo_hash_acum_L0+3, 0
	MOVWF      R3
	MOVLW      147
	MOVWF      R4
	MOVLW      1
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      1
	MOVWF      R7
	CALL       _Mul_32x32_U+0
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	XORWF      R0, 0
	MOVWF      Hash_algoritmo_hash_acum_L0+0
	MOVF       R1, 0
	MOVWF      Hash_algoritmo_hash_acum_L0+1
	MOVF       R2, 0
	MOVWF      Hash_algoritmo_hash_acum_L0+2
	MOVF       R3, 0
	MOVWF      Hash_algoritmo_hash_acum_L0+3
	MOVLW      0
	XORWF      Hash_algoritmo_hash_acum_L0+1, 1
	XORWF      Hash_algoritmo_hash_acum_L0+2, 1
	XORWF      Hash_algoritmo_hash_acum_L0+3, 1
;IR.c,38 :: 		for (cont=0;cont<cuenta-1;cont++)
	INCF       _cont+0, 1
;IR.c,42 :: 		}
	GOTO       L_Hash_algoritmo0
L_Hash_algoritmo1:
;IR.c,44 :: 		return (hash_acum);
	MOVF       Hash_algoritmo_hash_acum_L0+0, 0
	MOVWF      R0
	MOVF       Hash_algoritmo_hash_acum_L0+1, 0
	MOVWF      R1
	MOVF       Hash_algoritmo_hash_acum_L0+2, 0
	MOVWF      R2
	MOVF       Hash_algoritmo_hash_acum_L0+3, 0
	MOVWF      R3
;IR.c,45 :: 		}
L_end_Hash_algoritmo:
	RETURN
; end of _Hash_algoritmo

_Interrpcion:

;IR.c,48 :: 		void Interrpcion() iv 0x0004 ics ICS_AUTO
;IR.c,50 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_Interrpcion3
;IR.c,55 :: 		if (flag_codigo==0)
	MOVF       _flag_codigo+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Interrpcion4
;IR.c,58 :: 		if (cuenta!=0)
	MOVLW      0
	XORWF      _cuenta+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrpcion44
	MOVLW      0
	XORWF      _cuenta+0, 0
L__Interrpcion44:
	BTFSC      STATUS+0, 2
	GOTO       L_Interrpcion5
;IR.c,60 :: 		timer_aux=TMR0; //captura el valor del timer
	MOVF       TMR0+0, 0
	MOVWF      _timer_aux+0
;IR.c,61 :: 		TMR0=0; // resetea el timer para otra lectura
	CLRF       TMR0+0
;IR.c,62 :: 		tiempo[cuenta-1]=timer_aux;     // CARGA UN BUUFER CON LOS DATOS
	MOVLW      1
	SUBWF      _cuenta+0, 0
	MOVWF      R0
	MOVLW      0
	SUBWFB     _cuenta+1, 0
	MOVWF      R1
	MOVLW      _tiempo+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVF       _timer_aux+0, 0
	MOVWF      INDF1+0
;IR.c,63 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,64 :: 		INTEDG_bit=!INTEDG_bit;
	MOVLW
	XORWF      INTEDG_bit+0, 1
;IR.c,66 :: 		if (TMR0IF_bit==1)  // si hubo desborde del timer , fin de datos
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrpcion6
;IR.c,68 :: 		cuenta--;// omite el codigo de ultimo desborde
	MOVLW      1
	SUBWF      _cuenta+0, 1
	MOVLW      0
	SUBWFB     _cuenta+1, 1
;IR.c,69 :: 		flag_codigo=1;
	MOVLW      1
	MOVWF      _flag_codigo+0
;IR.c,70 :: 		INTE_bit=0; //deshabilita la interrpcuion
	BCF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,71 :: 		}
L_Interrpcion6:
;IR.c,72 :: 		}
	GOTO       L_Interrpcion7
L_Interrpcion5:
;IR.c,75 :: 		TMR0IF_bit=0;// limpia la bansera timer
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;IR.c,76 :: 		TMR0=0;   // resetea el timer
	CLRF       TMR0+0
;IR.c,77 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,78 :: 		}
L_Interrpcion7:
;IR.c,80 :: 		}
L_Interrpcion4:
;IR.c,81 :: 		}
L_Interrpcion3:
;IR.c,87 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,96 :: 		}
L_end_Interrpcion:
L__Interrpcion43:
	RETFIE     %s
; end of _Interrpcion

_verifica:

;IR.c,98 :: 		unsigned char  verifica(const unsigned char  *vector,unsigned char size)
;IR.c,102 :: 		for (cu=0;cu<size;cu++)
	CLRF       R2+0
L_verifica8:
	MOVF       FARG_verifica_size+0, 0
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_verifica9
;IR.c,104 :: 		if (vector[cu]!=tiempo[cu])
	MOVF       R2+0, 0
	ADDWF      FARG_verifica_vector+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_verifica_vector+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       R2+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       R1, 0
	XORWF      INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_verifica11
;IR.c,107 :: 		return(0);
	CLRF       R0
	GOTO       L_end_verifica
;IR.c,108 :: 		}
L_verifica11:
;IR.c,102 :: 		for (cu=0;cu<size;cu++)
	INCF       R2+0, 1
;IR.c,110 :: 		}
	GOTO       L_verifica8
L_verifica9:
;IR.c,112 :: 		return(1);
	MOVLW      1
	MOVWF      R0
;IR.c,114 :: 		}
L_end_verifica:
	RETURN
; end of _verifica

_normaliza:

;IR.c,119 :: 		void normaliza()
;IR.c,125 :: 		for (cont=0;cont<cuenta-1;cont++)
	CLRF       _cont+0
L_normaliza12:
	MOVLW      1
	SUBWF      _cuenta+0, 0
	MOVWF      R1
	MOVLW      0
	SUBWFB     _cuenta+1, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza47
	MOVF       R1, 0
	SUBWF      _cont+0, 0
L__normaliza47:
	BTFSC      STATUS+0, 0
	GOTO       L_normaliza13
;IR.c,127 :: 		if ( (tiempo[cont]>=cod1-paso1) &&   (tiempo[cont]<=cod1+paso))  tiempo[cont]=cod1;
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza48
	MOVLW      3
	SUBWF      R1, 0
L__normaliza48:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza17
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	XORLW      0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza49
	MOVF       R1, 0
	SUBLW      8
L__normaliza49:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza17
L__normaliza39:
	MOVLW      _tiempo+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR1H
	MOVF       _cont+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      6
	MOVWF      INDF1+0
	GOTO       L_normaliza18
L_normaliza17:
;IR.c,128 :: 		else if ( (tiempo[cont]>=cod2-paso1) &&   (tiempo[cont]<=cod2+paso))  tiempo[cont]=cod2;
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza50
	MOVLW      7
	SUBWF      R1, 0
L__normaliza50:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza21
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	XORLW      0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza51
	MOVF       R1, 0
	SUBLW      12
L__normaliza51:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza21
L__normaliza38:
	MOVLW      _tiempo+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR1H
	MOVF       _cont+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      10
	MOVWF      INDF1+0
	GOTO       L_normaliza22
L_normaliza21:
;IR.c,129 :: 		else if ( (tiempo[cont]>=cod3-paso1) &&   (tiempo[cont]<=cod3+paso1))  tiempo[cont]=cod3;
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza52
	MOVLW      19
	SUBWF      R1, 0
L__normaliza52:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza25
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	XORLW      0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza53
	MOVF       R1, 0
	SUBLW      25
L__normaliza53:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza25
L__normaliza37:
	MOVLW      _tiempo+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR1H
	MOVF       _cont+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      22
	MOVWF      INDF1+0
	GOTO       L_normaliza26
L_normaliza25:
;IR.c,130 :: 		else    tiempo[cont]=cod1;
	MOVLW      _tiempo+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR1H
	MOVF       _cont+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      6
	MOVWF      INDF1+0
L_normaliza26:
L_normaliza22:
L_normaliza18:
;IR.c,125 :: 		for (cont=0;cont<cuenta-1;cont++)
	INCF       _cont+0, 1
;IR.c,134 :: 		}
	GOTO       L_normaliza12
L_normaliza13:
;IR.c,140 :: 		}
L_end_normaliza:
	RETURN
; end of _normaliza

_main:

;IR.c,143 :: 		void main()
;IR.c,146 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;IR.c,147 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;IR.c,148 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;IR.c,149 :: 		IRCF0_bit=1;
	BSF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;IR.c,153 :: 		ansela=0;
	CLRF       ANSELA+0
;IR.c,154 :: 		anselc=0;
	CLRF       ANSELC+0
;IR.c,156 :: 		TRISA=0;
	CLRF       TRISA+0
;IR.c,157 :: 		trisc=0;
	CLRF       TRISC+0
;IR.c,159 :: 		TRISA2_bit=1; // entrada de INT
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;IR.c,165 :: 		TXCKSEL_bit=0; // tX en RC4  sino RA0
	BCF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;IR.c,167 :: 		UART1_Init(19200);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;IR.c,169 :: 		LATA=0;
	CLRF       LATA+0
;IR.c,171 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr1_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,172 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,175 :: 		OPTION_REG=0;      // preescalador asigando al timer 0
	CLRF       OPTION_REG+0
;IR.c,178 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;IR.c,179 :: 		PS1_bit=1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;IR.c,180 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;IR.c,182 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr2_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,183 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,187 :: 		INTCON=0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;IR.c,188 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,189 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,190 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,192 :: 		GIE_bit=1; // autoriza todas las interrpciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;IR.c,194 :: 		while (1)
L_main27:
;IR.c,196 :: 		if (flag_codigo==1)
	MOVF       _flag_codigo+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main29
;IR.c,200 :: 		UART1_Write_Text("son=");
	MOVLW      ?lstr3_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,201 :: 		ByteToStr(cuenta,texto);
	MOVF       _cuenta+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _texto+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;IR.c,202 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,203 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,204 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,220 :: 		normaliza();
	CALL       _normaliza+0
;IR.c,221 :: 		codigo_ir=Hash_algoritmo();
	CALL       _Hash_algoritmo+0
	MOVF       R0, 0
	MOVWF      _codigo_ir+0
	MOVF       R1, 0
	MOVWF      _codigo_ir+1
	MOVF       R2, 0
	MOVWF      _codigo_ir+2
	MOVF       R3, 0
	MOVWF      _codigo_ir+3
;IR.c,222 :: 		LongIntToHex(codigo_ir,texto);
	MOVF       R0, 0
	MOVWF      FARG_LongIntToHex_input+0
	MOVF       R1, 0
	MOVWF      FARG_LongIntToHex_input+1
	MOVF       R2, 0
	MOVWF      FARG_LongIntToHex_input+2
	MOVF       R3, 0
	MOVWF      FARG_LongIntToHex_input+3
	MOVLW      _texto+0
	MOVWF      FARG_LongIntToHex_output+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_LongIntToHex_output+1
	CALL       _LongIntToHex+0
;IR.c,223 :: 		UART1_Write_Text("CODIGO_IR=");
	MOVLW      ?lstr4_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr4_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,224 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,225 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,226 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,228 :: 		if (codigo_ir==0X18A54851)
	MOVF       _codigo_ir+3, 0
	XORLW      24
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVF       _codigo_ir+2, 0
	XORLW      165
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVF       _codigo_ir+1, 0
	XORLW      72
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVF       _codigo_ir+0, 0
	XORLW      81
L__main55:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;IR.c,230 :: 		led1=~led1;
	MOVLW
	XORWF      LATC0_bit+0, 1
;IR.c,231 :: 		UART1_Write_Text("COMANDO1");
	MOVLW      ?lstr5_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr5_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,233 :: 		}
	GOTO       L_main31
L_main30:
;IR.c,234 :: 		else if (codigo_ir==0XB3488D11)
	MOVF       _codigo_ir+3, 0
	XORLW      179
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       _codigo_ir+2, 0
	XORLW      72
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       _codigo_ir+1, 0
	XORLW      141
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       _codigo_ir+0, 0
	XORLW      17
L__main56:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;IR.c,236 :: 		led2=~led2;
	MOVLW
	XORWF      LATC1_bit+0, 1
;IR.c,237 :: 		UART1_Write_Text("COMANDO2");
	MOVLW      ?lstr6_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr6_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,239 :: 		}
	GOTO       L_main33
L_main32:
;IR.c,241 :: 		else if (codigo_ir==0X6070AD11)
	MOVF       _codigo_ir+3, 0
	XORLW      96
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       _codigo_ir+2, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       _codigo_ir+1, 0
	XORLW      173
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       _codigo_ir+0, 0
	XORLW      17
L__main57:
	BTFSS      STATUS+0, 2
	GOTO       L_main34
;IR.c,243 :: 		led3=~led3;
	MOVLW
	XORWF      LATC2_bit+0, 1
;IR.c,244 :: 		UART1_Write_Text("COMANDO3");
	MOVLW      ?lstr7_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr7_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,246 :: 		}
L_main34:
L_main33:
L_main31:
;IR.c,255 :: 		Delay_ms(2000);
	MOVLW      41
	MOVWF      R11
	MOVLW      150
	MOVWF      R12
	MOVLW      127
	MOVWF      R13
L_main35:
	DECFSZ     R13, 1
	GOTO       L_main35
	DECFSZ     R12, 1
	GOTO       L_main35
	DECFSZ     R11, 1
	GOTO       L_main35
;IR.c,257 :: 		flag_codigo=0;
	CLRF       _flag_codigo+0
;IR.c,258 :: 		cuenta=0;
	CLRF       _cuenta+0
	CLRF       _cuenta+1
;IR.c,259 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,260 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,261 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,266 :: 		}
L_main29:
;IR.c,267 :: 		Delay_ms(80);
	MOVLW      2
	MOVWF      R11
	MOVLW      160
	MOVWF      R12
	MOVLW      146
	MOVWF      R13
L_main36:
	DECFSZ     R13, 1
	GOTO       L_main36
	DECFSZ     R12, 1
	GOTO       L_main36
	DECFSZ     R11, 1
	GOTO       L_main36
	NOP
;IR.c,268 :: 		LATA0_bit=~LATA0_bit;
	MOVLW
	XORWF      LATA0_bit+0, 1
;IR.c,270 :: 		}
	GOTO       L_main27
;IR.c,274 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
