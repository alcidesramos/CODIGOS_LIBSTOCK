
_Hash_algoritmo:

;IR.c,25 :: 		unsigned long  Hash_algoritmo ()
;IR.c,27 :: 		unsigned long  hash_acum = FNV_BASIS;
	MOVLW      197
	MOVWF      Hash_algoritmo_hash_acum_L0+0
	MOVLW      157
	MOVWF      Hash_algoritmo_hash_acum_L0+1
	MOVLW      28
	MOVWF      Hash_algoritmo_hash_acum_L0+2
	MOVLW      129
	MOVWF      Hash_algoritmo_hash_acum_L0+3
;IR.c,29 :: 		for (cont=0;cont<cuenta-1;cont++)
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
	GOTO       L__Hash_algoritmo30
	MOVF       R1, 0
	SUBWF      _cont+0, 0
L__Hash_algoritmo30:
	BTFSC      STATUS+0, 0
	GOTO       L_Hash_algoritmo1
;IR.c,32 :: 		hash_acum = (hash_acum * FNV_PRIME) ^ tiempo[cont];
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
;IR.c,29 :: 		for (cont=0;cont<cuenta-1;cont++)
	INCF       _cont+0, 1
;IR.c,33 :: 		}
	GOTO       L_Hash_algoritmo0
L_Hash_algoritmo1:
;IR.c,35 :: 		return (hash_acum);
	MOVF       Hash_algoritmo_hash_acum_L0+0, 0
	MOVWF      R0
	MOVF       Hash_algoritmo_hash_acum_L0+1, 0
	MOVWF      R1
	MOVF       Hash_algoritmo_hash_acum_L0+2, 0
	MOVWF      R2
	MOVF       Hash_algoritmo_hash_acum_L0+3, 0
	MOVWF      R3
;IR.c,36 :: 		}
L_end_Hash_algoritmo:
	RETURN
; end of _Hash_algoritmo

_Interrpcion:

;IR.c,39 :: 		void Interrpcion() iv 0x0004 ics ICS_AUTO
;IR.c,41 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_Interrpcion3
;IR.c,46 :: 		if (flag_codigo==0)
	MOVF       _flag_codigo+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Interrpcion4
;IR.c,49 :: 		if (cuenta!=0)
	MOVLW      0
	XORWF      _cuenta+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrpcion33
	MOVLW      0
	XORWF      _cuenta+0, 0
L__Interrpcion33:
	BTFSC      STATUS+0, 2
	GOTO       L_Interrpcion5
;IR.c,51 :: 		timer_aux=TMR0; //captura el valor del timer
	MOVF       TMR0+0, 0
	MOVWF      _timer_aux+0
;IR.c,52 :: 		TMR0=0; // resetea el timer para otra lectura
	CLRF       TMR0+0
;IR.c,53 :: 		tiempo[cuenta-1]=timer_aux;     // CARGA UN BUUFER CON LOS DATOS
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
;IR.c,54 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,55 :: 		INTEDG_bit=!INTEDG_bit;
	MOVLW
	XORWF      INTEDG_bit+0, 1
;IR.c,57 :: 		if (TMR0IF_bit==1)  // si hubo desborde del timer , fin de datos
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrpcion6
;IR.c,59 :: 		cuenta--;// omite el codigo de ultimo desborde
	MOVLW      1
	SUBWF      _cuenta+0, 1
	MOVLW      0
	SUBWFB     _cuenta+1, 1
;IR.c,60 :: 		flag_codigo=1;
	MOVLW      1
	MOVWF      _flag_codigo+0
;IR.c,61 :: 		INTE_bit=0; //deshabilita la interrpcuion
	BCF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,62 :: 		}
L_Interrpcion6:
;IR.c,63 :: 		}
	GOTO       L_Interrpcion7
L_Interrpcion5:
;IR.c,66 :: 		TMR0IF_bit=0;// limpia la bansera timer
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;IR.c,67 :: 		TMR0=0;   // resetea el timer
	CLRF       TMR0+0
;IR.c,68 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,69 :: 		}
L_Interrpcion7:
;IR.c,71 :: 		}
L_Interrpcion4:
;IR.c,72 :: 		}
L_Interrpcion3:
;IR.c,78 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,87 :: 		}
L_end_Interrpcion:
L__Interrpcion32:
	RETFIE     %s
; end of _Interrpcion

_verifica:

;IR.c,89 :: 		unsigned char  verifica(const unsigned char  *vector,unsigned char size)
;IR.c,93 :: 		for (cu=0;cu<size;cu++)
	CLRF       R2+0
L_verifica8:
	MOVF       FARG_verifica_size+0, 0
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_verifica9
;IR.c,95 :: 		if (vector[cu]!=tiempo[cu])
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
;IR.c,98 :: 		return(0);
	CLRF       R0
	GOTO       L_end_verifica
;IR.c,99 :: 		}
L_verifica11:
;IR.c,93 :: 		for (cu=0;cu<size;cu++)
	INCF       R2+0, 1
;IR.c,101 :: 		}
	GOTO       L_verifica8
L_verifica9:
;IR.c,103 :: 		return(1);
	MOVLW      1
	MOVWF      R0
;IR.c,105 :: 		}
L_end_verifica:
	RETURN
; end of _verifica

_normaliza:

;IR.c,110 :: 		void normaliza()
;IR.c,116 :: 		for (cont=0;cont<cuenta-1+2;cont++)      //toma dos datos adicionales
	CLRF       _cont+0
L_normaliza12:
	MOVLW      1
	SUBWF      _cuenta+0, 0
	MOVWF      R0
	MOVLW      0
	SUBWFB     _cuenta+1, 0
	MOVWF      R1
	MOVLW      2
	ADDWF      R0, 0
	MOVWF      R2
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      R3
	MOVF       R3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza36
	MOVF       R2, 0
	SUBWF      _cont+0, 0
L__normaliza36:
	BTFSC      STATUS+0, 0
	GOTO       L_normaliza13
;IR.c,118 :: 		if   (tiempo[cont+2] <(float)tiempo[cont] * .8)  tiempo[cont]=0 ;
	MOVLW      2
	ADDWF      _cont+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	ADDWFC     R1, 1
	MOVLW      _tiempo+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FLOC__normaliza+4
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	CALL       _byte2double+0
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__normaliza+0
	MOVF       R1, 0
	MOVWF      FLOC__normaliza+1
	MOVF       R2, 0
	MOVWF      FLOC__normaliza+2
	MOVF       R3, 0
	MOVWF      FLOC__normaliza+3
	MOVF       FLOC__normaliza+4, 0
	MOVWF      R0
	CALL       _byte2double+0
	MOVF       FLOC__normaliza+0, 0
	MOVWF      R4
	MOVF       FLOC__normaliza+1, 0
	MOVWF      R5
	MOVF       FLOC__normaliza+2, 0
	MOVWF      R6
	MOVF       FLOC__normaliza+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_normaliza15
	MOVLW      _tiempo+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR1H
	MOVF       _cont+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
	GOTO       L_normaliza16
L_normaliza15:
;IR.c,119 :: 		else if (tiempo[cont] <(float)tiempo[cont+2] * .8)  tiempo[cont]= 2 ;
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__normaliza+4
	MOVLW      2
	ADDWF      _cont+0, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      0
	ADDWFC     R1, 1
	MOVLW      _tiempo+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	CALL       _byte2double+0
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__normaliza+0
	MOVF       R1, 0
	MOVWF      FLOC__normaliza+1
	MOVF       R2, 0
	MOVWF      FLOC__normaliza+2
	MOVF       R3, 0
	MOVWF      FLOC__normaliza+3
	MOVF       FLOC__normaliza+4, 0
	MOVWF      R0
	CALL       _byte2double+0
	MOVF       FLOC__normaliza+0, 0
	MOVWF      R4
	MOVF       FLOC__normaliza+1, 0
	MOVWF      R5
	MOVF       FLOC__normaliza+2, 0
	MOVWF      R6
	MOVF       FLOC__normaliza+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_normaliza17
	MOVLW      _tiempo+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR1H
	MOVF       _cont+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      2
	MOVWF      INDF1+0
	GOTO       L_normaliza18
L_normaliza17:
;IR.c,120 :: 		else  tiempo[cont]=1 ;
	MOVLW      _tiempo+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR1H
	MOVF       _cont+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      1
	MOVWF      INDF1+0
L_normaliza18:
L_normaliza16:
;IR.c,116 :: 		for (cont=0;cont<cuenta-1+2;cont++)      //toma dos datos adicionales
	INCF       _cont+0, 1
;IR.c,124 :: 		}
	GOTO       L_normaliza12
L_normaliza13:
;IR.c,131 :: 		}
L_end_normaliza:
	RETURN
; end of _normaliza

_main:

;IR.c,134 :: 		void main()
;IR.c,137 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;IR.c,138 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;IR.c,139 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;IR.c,140 :: 		IRCF0_bit=1;
	BSF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;IR.c,144 :: 		ansela=0;
	CLRF       ANSELA+0
;IR.c,145 :: 		anselc=0;
	CLRF       ANSELC+0
;IR.c,147 :: 		TRISA=0;
	CLRF       TRISA+0
;IR.c,148 :: 		trisc=0;
	CLRF       TRISC+0
;IR.c,150 :: 		TRISA2_bit=1; // entrada de INT
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;IR.c,156 :: 		TXCKSEL_bit=0; // tX en RC4  sino RA0
	BCF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;IR.c,158 :: 		UART1_Init(19200);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;IR.c,160 :: 		LATA=0;
	CLRF       LATA+0
;IR.c,162 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr1_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,163 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,166 :: 		OPTION_REG=0;      // preescalador asigando al timer 0
	CLRF       OPTION_REG+0
;IR.c,169 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;IR.c,170 :: 		PS1_bit=1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;IR.c,171 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;IR.c,173 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr2_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,174 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,178 :: 		INTCON=0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;IR.c,179 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,180 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,181 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,183 :: 		GIE_bit=1; // autoriza todas las interrpciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;IR.c,185 :: 		while (1)
L_main19:
;IR.c,187 :: 		if (flag_codigo==1)
	MOVF       _flag_codigo+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;IR.c,191 :: 		UART1_Write_Text("son=");
	MOVLW      ?lstr3_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,192 :: 		ByteToStr(cuenta,texto);
	MOVF       _cuenta+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _texto+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;IR.c,193 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,194 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,195 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,211 :: 		normaliza();
	CALL       _normaliza+0
;IR.c,212 :: 		codigo_ir=Hash_algoritmo();
	CALL       _Hash_algoritmo+0
	MOVF       R0, 0
	MOVWF      _codigo_ir+0
	MOVF       R1, 0
	MOVWF      _codigo_ir+1
	MOVF       R2, 0
	MOVWF      _codigo_ir+2
	MOVF       R3, 0
	MOVWF      _codigo_ir+3
;IR.c,213 :: 		LongIntToHex(codigo_ir,texto);
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
;IR.c,214 :: 		UART1_Write_Text("CODIGO_IR=");
	MOVLW      ?lstr4_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr4_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,215 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,216 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,217 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,219 :: 		if (codigo_ir==0XBF681DA0)
	MOVF       _codigo_ir+3, 0
	XORLW      191
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       _codigo_ir+2, 0
	XORLW      104
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       _codigo_ir+1, 0
	XORLW      29
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       _codigo_ir+0, 0
	XORLW      160
L__main38:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;IR.c,221 :: 		led1=~led1;
	MOVLW
	XORWF      LATC0_bit+0, 1
;IR.c,222 :: 		UART1_Write_Text("COMANDO1");
	MOVLW      ?lstr5_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr5_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,224 :: 		}
	GOTO       L_main23
L_main22:
;IR.c,225 :: 		else if (codigo_ir==0x4A6A4222)
	MOVF       _codigo_ir+3, 0
	XORLW      74
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _codigo_ir+2, 0
	XORLW      106
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _codigo_ir+1, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _codigo_ir+0, 0
	XORLW      34
L__main39:
	BTFSS      STATUS+0, 2
	GOTO       L_main24
;IR.c,227 :: 		led2=~led2;
	MOVLW
	XORWF      LATC1_bit+0, 1
;IR.c,228 :: 		UART1_Write_Text("COMANDO2");
	MOVLW      ?lstr6_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr6_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,230 :: 		}
	GOTO       L_main25
L_main24:
;IR.c,232 :: 		else if (codigo_ir==0X330894A4)
	MOVF       _codigo_ir+3, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       _codigo_ir+2, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       _codigo_ir+1, 0
	XORLW      148
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       _codigo_ir+0, 0
	XORLW      164
L__main40:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;IR.c,234 :: 		led3=~led3;
	MOVLW
	XORWF      LATC2_bit+0, 1
;IR.c,235 :: 		UART1_Write_Text("COMANDO3");
	MOVLW      ?lstr7_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr7_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,237 :: 		}
L_main26:
L_main25:
L_main23:
;IR.c,239 :: 		codigo_ir=0;
	CLRF       _codigo_ir+0
	CLRF       _codigo_ir+1
	CLRF       _codigo_ir+2
	CLRF       _codigo_ir+3
;IR.c,246 :: 		Delay_ms(2000);
	MOVLW      41
	MOVWF      R11
	MOVLW      150
	MOVWF      R12
	MOVLW      127
	MOVWF      R13
L_main27:
	DECFSZ     R13, 1
	GOTO       L_main27
	DECFSZ     R12, 1
	GOTO       L_main27
	DECFSZ     R11, 1
	GOTO       L_main27
;IR.c,248 :: 		flag_codigo=0;
	CLRF       _flag_codigo+0
;IR.c,249 :: 		cuenta=0;
	CLRF       _cuenta+0
	CLRF       _cuenta+1
;IR.c,250 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,251 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,252 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,257 :: 		}
L_main21:
;IR.c,258 :: 		Delay_ms(80);
	MOVLW      2
	MOVWF      R11
	MOVLW      160
	MOVWF      R12
	MOVLW      146
	MOVWF      R13
L_main28:
	DECFSZ     R13, 1
	GOTO       L_main28
	DECFSZ     R12, 1
	GOTO       L_main28
	DECFSZ     R11, 1
	GOTO       L_main28
	NOP
;IR.c,259 :: 		LATA0_bit=~LATA0_bit;
	MOVLW
	XORWF      LATA0_bit+0, 1
;IR.c,261 :: 		}
	GOTO       L_main19
;IR.c,265 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
