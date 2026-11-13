
_Interrpcion:

;IR.c,33 :: 		void Interrpcion() iv 0x0004 ics ICS_AUTO
;IR.c,35 :: 		if (INTF_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_Interrpcion0
;IR.c,40 :: 		if (flag_codigo==0)
	MOVF       _flag_codigo+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Interrpcion1
;IR.c,43 :: 		if (cuenta!=0)
	MOVLW      0
	XORWF      _cuenta+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrpcion42
	MOVLW      0
	XORWF      _cuenta+0, 0
L__Interrpcion42:
	BTFSC      STATUS+0, 2
	GOTO       L_Interrpcion2
;IR.c,45 :: 		timer_aux=TMR0; //captura el valor del timer
	MOVF       TMR0+0, 0
	MOVWF      _timer_aux+0
;IR.c,46 :: 		TMR0=0; // resetea el timer para otra lectura
	CLRF       TMR0+0
;IR.c,47 :: 		tiempo[cuenta-1]=timer_aux;     // CARGA UN BUUFER CON LOS DATOS
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
;IR.c,48 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,49 :: 		INTEDG_bit=!INTEDG_bit;
	MOVLW
	XORWF      INTEDG_bit+0, 1
;IR.c,51 :: 		if (TMR0IF_bit==1)  // si hubo desborde del timer , fin de datos
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrpcion3
;IR.c,53 :: 		cuenta--;// omite el codigo de ultimo desborde
	MOVLW      1
	SUBWF      _cuenta+0, 1
	MOVLW      0
	SUBWFB     _cuenta+1, 1
;IR.c,54 :: 		flag_codigo=1;
	MOVLW      1
	MOVWF      _flag_codigo+0
;IR.c,55 :: 		INTE_bit=0; //deshabilita la interrpcuion
	BCF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,56 :: 		}
L_Interrpcion3:
;IR.c,57 :: 		}
	GOTO       L_Interrpcion4
L_Interrpcion2:
;IR.c,60 :: 		TMR0IF_bit=0;// limpia la bansera timer
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;IR.c,61 :: 		TMR0=0;   // resetea el timer
	CLRF       TMR0+0
;IR.c,62 :: 		cuenta++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;IR.c,63 :: 		}
L_Interrpcion4:
;IR.c,65 :: 		}
L_Interrpcion1:
;IR.c,66 :: 		}
L_Interrpcion0:
;IR.c,72 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,81 :: 		}
L_end_Interrpcion:
L__Interrpcion41:
	RETFIE     %s
; end of _Interrpcion

_verifica:

;IR.c,83 :: 		unsigned char  verifica(const unsigned char  *vector,unsigned char size)
;IR.c,87 :: 		for (cu=0;cu<size;cu++)
	CLRF       R2+0
L_verifica5:
	MOVF       FARG_verifica_size+0, 0
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_verifica6
;IR.c,89 :: 		if (vector[cu]!=tiempo[cu])
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
	GOTO       L_verifica8
;IR.c,92 :: 		return(0);
	CLRF       R0
	GOTO       L_end_verifica
;IR.c,93 :: 		}
L_verifica8:
;IR.c,87 :: 		for (cu=0;cu<size;cu++)
	INCF       R2+0, 1
;IR.c,95 :: 		}
	GOTO       L_verifica5
L_verifica6:
;IR.c,97 :: 		return(1);
	MOVLW      1
	MOVWF      R0
;IR.c,99 :: 		}
L_end_verifica:
	RETURN
; end of _verifica

_normaliza:

;IR.c,104 :: 		void normaliza()
;IR.c,110 :: 		for (cont=0;cont<cuenta-1;cont++)
	CLRF       _cont+0
L_normaliza9:
	MOVLW      1
	SUBWF      _cuenta+0, 0
	MOVWF      R1
	MOVLW      0
	SUBWFB     _cuenta+1, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__normaliza45
	MOVF       R1, 0
	SUBWF      _cont+0, 0
L__normaliza45:
	BTFSC      STATUS+0, 0
	GOTO       L_normaliza10
;IR.c,112 :: 		if ( (tiempo[cont]>=cod1-paso1) &&   (tiempo[cont]<=cod1+paso))  tiempo[cont]=cod1;
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
	GOTO       L__normaliza46
	MOVLW      3
	SUBWF      R1, 0
L__normaliza46:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza14
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
	GOTO       L__normaliza47
	MOVF       R1, 0
	SUBLW      8
L__normaliza47:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza14
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
	GOTO       L_normaliza15
L_normaliza14:
;IR.c,113 :: 		else if ( (tiempo[cont]>=cod2-paso1) &&   (tiempo[cont]<=cod2+paso))  tiempo[cont]=cod2;
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
	MOVLW      7
	SUBWF      R1, 0
L__normaliza48:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza18
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
	SUBLW      12
L__normaliza49:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza18
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
	GOTO       L_normaliza19
L_normaliza18:
;IR.c,114 :: 		else if ( (tiempo[cont]>=cod3-paso1) &&   (tiempo[cont]<=cod3+paso1))  tiempo[cont]=cod3;
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
	MOVLW      19
	SUBWF      R1, 0
L__normaliza50:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza22
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
	SUBLW      25
L__normaliza51:
	BTFSS      STATUS+0, 0
	GOTO       L_normaliza22
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
	GOTO       L_normaliza23
L_normaliza22:
;IR.c,115 :: 		else    tiempo[cont]=cod1;
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
L_normaliza23:
L_normaliza19:
L_normaliza15:
;IR.c,116 :: 		ByteToStr(tiempo[cont],texto);
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _texto+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;IR.c,117 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,118 :: 		UART1_Write(',');
	MOVLW      44
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,110 :: 		for (cont=0;cont<cuenta-1;cont++)
	INCF       _cont+0, 1
;IR.c,119 :: 		}
	GOTO       L_normaliza9
L_normaliza10:
;IR.c,121 :: 		UART1_Write('}');
	MOVLW      125
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,122 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,123 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,125 :: 		}
L_end_normaliza:
	RETURN
; end of _normaliza

_main:

;IR.c,128 :: 		void main()
;IR.c,131 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;IR.c,132 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;IR.c,133 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;IR.c,134 :: 		IRCF0_bit=1;
	BSF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;IR.c,138 :: 		ansela=0;
	CLRF       ANSELA+0
;IR.c,139 :: 		anselc=0;
	CLRF       ANSELC+0
;IR.c,141 :: 		TRISA=0;
	CLRF       TRISA+0
;IR.c,142 :: 		trisc=0;
	CLRF       TRISC+0
;IR.c,144 :: 		TRISA2_bit=1; // entrada de INT
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;IR.c,150 :: 		TXCKSEL_bit=0; // tX en RC4  sino RA0
	BCF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;IR.c,152 :: 		UART1_Init(19200);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;IR.c,154 :: 		LATA=0;
	CLRF       LATA+0
;IR.c,156 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr1_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,157 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,160 :: 		OPTION_REG=0;      // preescalador asigando al timer 0
	CLRF       OPTION_REG+0
;IR.c,163 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;IR.c,164 :: 		PS1_bit=1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;IR.c,165 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;IR.c,167 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW      ?lstr2_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,168 :: 		LATC=0;
	CLRF       LATC+0
;IR.c,172 :: 		INTCON=0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;IR.c,173 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,174 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,175 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,177 :: 		GIE_bit=1; // autoriza todas las interrpciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;IR.c,179 :: 		while (1)
L_main24:
;IR.c,181 :: 		if (flag_codigo==1)
	MOVF       _flag_codigo+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;IR.c,185 :: 		UART1_Write_Text("son=");
	MOVLW      ?lstr3_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,186 :: 		ByteToStr(cuenta,texto);
	MOVF       _cuenta+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _texto+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;IR.c,187 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,188 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,189 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,191 :: 		UART1_Write_Text("TIEMPOS=\r\n");
	MOVLW      ?lstr4_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr4_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,192 :: 		UART1_Write('{');
	MOVLW      123
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,194 :: 		for (cont=0;cont<cuenta-1;cont++)
	CLRF       _cont+0
L_main27:
	MOVLW      1
	SUBWF      _cuenta+0, 0
	MOVWF      R1
	MOVLW      0
	SUBWFB     _cuenta+1, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       R1, 0
	SUBWF      _cont+0, 0
L__main53:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;IR.c,196 :: 		ByteToStr(tiempo[cont],texto);
	MOVLW      _tiempo+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FSR0H
	MOVF       _cont+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _texto+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;IR.c,197 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_texto+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,198 :: 		UART1_Write(',');
	MOVLW      44
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,194 :: 		for (cont=0;cont<cuenta-1;cont++)
	INCF       _cont+0, 1
;IR.c,199 :: 		}
	GOTO       L_main27
L_main28:
;IR.c,201 :: 		UART1_Write('}');
	MOVLW      125
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,202 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,203 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;IR.c,205 :: 		normaliza();
	CALL       _normaliza+0
;IR.c,207 :: 		if (verifica(&codigo1,cuenta-1)==1)
	MOVLW      _codigo1+0
	MOVWF      FARG_verifica_vector+0
	MOVLW      hi_addr(_codigo1+0)
	MOVWF      FARG_verifica_vector+1
	DECF       _cuenta+0, 0
	MOVWF      FARG_verifica_size+0
	CALL       _verifica+0
	MOVF       R0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;IR.c,209 :: 		led1=~led1;
	MOVLW
	XORWF      LATC0_bit+0, 1
;IR.c,210 :: 		UART1_Write_Text("COMANDO1");
	MOVLW      ?lstr5_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr5_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,212 :: 		}
	GOTO       L_main31
L_main30:
;IR.c,213 :: 		else if (verifica(&codigo2,cuenta-1)==1)
	MOVLW      _codigo2+0
	MOVWF      FARG_verifica_vector+0
	MOVLW      hi_addr(_codigo2+0)
	MOVWF      FARG_verifica_vector+1
	DECF       _cuenta+0, 0
	MOVWF      FARG_verifica_size+0
	CALL       _verifica+0
	MOVF       R0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;IR.c,215 :: 		led2=~led2;
	MOVLW
	XORWF      LATC1_bit+0, 1
;IR.c,216 :: 		UART1_Write_Text("COMANDO2");
	MOVLW      ?lstr6_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr6_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,218 :: 		}
	GOTO       L_main33
L_main32:
;IR.c,220 :: 		else if (verifica(&codigo3,cuenta-1)==1)
	MOVLW      _codigo3+0
	MOVWF      FARG_verifica_vector+0
	MOVLW      hi_addr(_codigo3+0)
	MOVWF      FARG_verifica_vector+1
	DECF       _cuenta+0, 0
	MOVWF      FARG_verifica_size+0
	CALL       _verifica+0
	MOVF       R0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main34
;IR.c,222 :: 		led3=~led3;
	MOVLW
	XORWF      LATC2_bit+0, 1
;IR.c,223 :: 		UART1_Write_Text("COMANDO3");
	MOVLW      ?lstr7_IR+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr7_IR+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;IR.c,225 :: 		}
L_main34:
L_main33:
L_main31:
;IR.c,226 :: 		memset(tiempo,66,'0'); // limpia le buffer
	MOVLW      _tiempo+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(_tiempo+0)
	MOVWF      FARG_memset_p1+1
	MOVLW      66
	MOVWF      FARG_memset_character+0
	MOVLW      48
	MOVWF      FARG_memset_n+0
	CLRF       FARG_memset_n+1
	CALL       _memset+0
;IR.c,233 :: 		Delay_ms(2000);
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
;IR.c,235 :: 		flag_codigo=0;
	CLRF       _flag_codigo+0
;IR.c,236 :: 		cuenta=0;
	CLRF       _cuenta+0
	CLRF       _cuenta+1
;IR.c,237 :: 		INTEDG_bit=0; // for flanco de bajada
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;IR.c,238 :: 		INTF_bit=0; // limpia la badera de interrpcion
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IR.c,239 :: 		INTE_bit=1; //  habilita la interrpcion for flanco
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IR.c,244 :: 		}
L_main26:
;IR.c,245 :: 		Delay_ms(80);
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
;IR.c,246 :: 		LATA0_bit=~LATA0_bit;
	MOVLW
	XORWF      LATA0_bit+0, 1
;IR.c,248 :: 		}
	GOTO       L_main24
;IR.c,252 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
