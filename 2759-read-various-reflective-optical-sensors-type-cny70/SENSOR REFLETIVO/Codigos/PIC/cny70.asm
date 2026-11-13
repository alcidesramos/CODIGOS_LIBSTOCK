
_config_timer1:

;cny70.c,49 :: 		void config_timer1 ()
;cny70.c,51 :: 		T1CON=0;
	CLRF        T1CON+0 
;cny70.c,52 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;cny70.c,53 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;cny70.c,55 :: 		T1CKPS1_bit=0;
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;cny70.c,56 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;cny70.c,57 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;cny70.c,58 :: 		TMR1ON_bit=0;
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;cny70.c,59 :: 		}
L_end_config_timer1:
	RETURN      0
; end of _config_timer1

_config_salidas:

;cny70.c,61 :: 		void config_salidas()//salida todos los sensores
;cny70.c,63 :: 		trisb.b0=0;
	BCF         TRISB+0, 0 
;cny70.c,64 :: 		trisb.b1=0;
	BCF         TRISB+0, 1 
;cny70.c,65 :: 		trisb.b2=0;
	BCF         TRISB+0, 2 
;cny70.c,66 :: 		trisb.b3=0;
	BCF         TRISB+0, 3 
;cny70.c,67 :: 		trisb.b4=0;
	BCF         TRISB+0, 4 
;cny70.c,68 :: 		trisb.b5=0;
	BCF         TRISB+0, 5 
;cny70.c,69 :: 		trisb.b6=0;
	BCF         TRISB+0, 6 
;cny70.c,70 :: 		trisb.b7=0;
	BCF         TRISB+0, 7 
;cny70.c,72 :: 		}
L_end_config_salidas:
	RETURN      0
; end of _config_salidas

_config_entradas:

;cny70.c,75 :: 		void config_entradas()//entrada todos los sensores
;cny70.c,77 :: 		trisb.b0=1;
	BSF         TRISB+0, 0 
;cny70.c,78 :: 		trisb.b1=1;
	BSF         TRISB+0, 1 
;cny70.c,79 :: 		trisb.b2=1;
	BSF         TRISB+0, 2 
;cny70.c,80 :: 		trisb.b3=1;
	BSF         TRISB+0, 3 
;cny70.c,81 :: 		trisb.b4=1;
	BSF         TRISB+0, 4 
;cny70.c,82 :: 		trisb.b5=1;
	BSF         TRISB+0, 5 
;cny70.c,83 :: 		trisb.b6=1;
	BSF         TRISB+0, 6 
;cny70.c,84 :: 		trisb.b7=1;
	BSF         TRISB+0, 7 
;cny70.c,87 :: 		}
L_end_config_entradas:
	RETURN      0
; end of _config_entradas

_saca_uno:

;cny70.c,90 :: 		void saca_uno()
;cny70.c,92 :: 		s1_out=1;
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;cny70.c,93 :: 		s2_out=1;
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;cny70.c,94 :: 		s3_out=1;
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;cny70.c,95 :: 		s4_out=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;cny70.c,96 :: 		s5_out=1;
	BSF         LATB4_bit+0, BitPos(LATB4_bit+0) 
;cny70.c,97 :: 		s6_out=1;
	BSF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;cny70.c,98 :: 		s7_out=1;
	BSF         LATB6_bit+0, BitPos(LATB6_bit+0) 
;cny70.c,99 :: 		s8_out=1;
	BSF         LATB7_bit+0, BitPos(LATB7_bit+0) 
;cny70.c,101 :: 		}
L_end_saca_uno:
	RETURN      0
; end of _saca_uno

_analizasensoresir:

;cny70.c,104 :: 		void analizasensoresir()
;cny70.c,106 :: 		config_timer1();// TIMER 13MS
	CALL        _config_timer1+0, 0
;cny70.c,107 :: 		config_salidas();
	CALL        _config_salidas+0, 0
;cny70.c,108 :: 		saca_uno();
	CALL        _saca_uno+0, 0
;cny70.c,109 :: 		Delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_analizasensoresir0:
	DECFSZ      R13, 1, 1
	BRA         L_analizasensoresir0
	NOP
;cny70.c,110 :: 		config_entradas();
	CALL        _config_entradas+0, 0
;cny70.c,111 :: 		TMR1ON_bit=1; //prende el timer
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;cny70.c,112 :: 		lectura1=lectura2=lectura3=lectura4=lectura5=lectura6=lectura7=0;  //limpia los registro de lectura
	CLRF        _lectura7+0 
	CLRF        _lectura7+1 
	CLRF        _lectura6+0 
	CLRF        _lectura6+1 
	CLRF        _lectura5+0 
	CLRF        _lectura5+1 
	CLRF        _lectura4+0 
	CLRF        _lectura4+1 
	CLRF        _lectura3+0 
	CLRF        _lectura3+1 
	CLRF        _lectura2+0 
	CLRF        _lectura2+1 
	CLRF        _lectura1+0 
	CLRF        _lectura1+1 
;cny70.c,113 :: 		banderas=0;    //limpi las bandera de los sesnores
	CLRF        _banderas+0 
;cny70.c,115 :: 		while (TMR1IF_bit==0)
L_analizasensoresir1:
	BTFSC       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_analizasensoresir2
;cny70.c,117 :: 		if ((s1_in==0) && ( flag_s1==0))
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_analizasensoresir5
	BTFSC       _banderas+0, 0 
	GOTO        L_analizasensoresir5
L__analizasensoresir37:
;cny70.c,119 :: 		lectura1=(unsigned int)TMR1H<<8 | TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura1+0 
	MOVLW       0
	MOVWF       _lectura1+1 
	MOVF        _lectura1+0, 0 
	MOVWF       _lectura1+1 
	CLRF        _lectura1+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura1+0, 1 
	MOVLW       0
	IORWF       _lectura1+1, 1 
;cny70.c,120 :: 		flag_s1=1;
	BSF         _banderas+0, 0 
;cny70.c,121 :: 		}
L_analizasensoresir5:
;cny70.c,122 :: 		if ((s2_in==0) && ( flag_s2==0))
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_analizasensoresir8
	BTFSC       _banderas+0, 1 
	GOTO        L_analizasensoresir8
L__analizasensoresir36:
;cny70.c,124 :: 		lectura2=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura2+0 
	MOVLW       0
	MOVWF       _lectura2+1 
	MOVF        _lectura2+0, 0 
	MOVWF       _lectura2+1 
	CLRF        _lectura2+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura2+0, 1 
	MOVLW       0
	IORWF       _lectura2+1, 1 
;cny70.c,125 :: 		flag_s2=1;
	BSF         _banderas+0, 1 
;cny70.c,126 :: 		}
L_analizasensoresir8:
;cny70.c,128 :: 		if ((s3_in==0) && ( flag_s3==0))
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_analizasensoresir11
	BTFSC       _banderas+0, 2 
	GOTO        L_analizasensoresir11
L__analizasensoresir35:
;cny70.c,130 :: 		lectura3=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura3+0 
	MOVLW       0
	MOVWF       _lectura3+1 
	MOVF        _lectura3+0, 0 
	MOVWF       _lectura3+1 
	CLRF        _lectura3+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura3+0, 1 
	MOVLW       0
	IORWF       _lectura3+1, 1 
;cny70.c,131 :: 		flag_s3=1;
	BSF         _banderas+0, 2 
;cny70.c,132 :: 		}
L_analizasensoresir11:
;cny70.c,134 :: 		if ((s4_in==0) && ( flag_s4==0))
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_analizasensoresir14
	BTFSC       _banderas+0, 3 
	GOTO        L_analizasensoresir14
L__analizasensoresir34:
;cny70.c,136 :: 		lectura4=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura4+0 
	MOVLW       0
	MOVWF       _lectura4+1 
	MOVF        _lectura4+0, 0 
	MOVWF       _lectura4+1 
	CLRF        _lectura4+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura4+0, 1 
	MOVLW       0
	IORWF       _lectura4+1, 1 
;cny70.c,137 :: 		flag_s4=1;
	BSF         _banderas+0, 3 
;cny70.c,138 :: 		}
L_analizasensoresir14:
;cny70.c,140 :: 		if ((s5_in==0) && ( flag_s5==0))
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_analizasensoresir17
	BTFSC       _banderas+0, 4 
	GOTO        L_analizasensoresir17
L__analizasensoresir33:
;cny70.c,142 :: 		lectura5=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura5+0 
	MOVLW       0
	MOVWF       _lectura5+1 
	MOVF        _lectura5+0, 0 
	MOVWF       _lectura5+1 
	CLRF        _lectura5+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura5+0, 1 
	MOVLW       0
	IORWF       _lectura5+1, 1 
;cny70.c,143 :: 		flag_s5=1;
	BSF         _banderas+0, 4 
;cny70.c,144 :: 		}
L_analizasensoresir17:
;cny70.c,146 :: 		if ((s6_in==0) && ( flag_s6==0))
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_analizasensoresir20
	BTFSC       _banderas+0, 5 
	GOTO        L_analizasensoresir20
L__analizasensoresir32:
;cny70.c,148 :: 		lectura6=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura6+0 
	MOVLW       0
	MOVWF       _lectura6+1 
	MOVF        _lectura6+0, 0 
	MOVWF       _lectura6+1 
	CLRF        _lectura6+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura6+0, 1 
	MOVLW       0
	IORWF       _lectura6+1, 1 
;cny70.c,149 :: 		flag_s6=1;
	BSF         _banderas+0, 5 
;cny70.c,150 :: 		}
L_analizasensoresir20:
;cny70.c,152 :: 		if ((s7_in==0) && ( flag_s7==0))
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_analizasensoresir23
	BTFSC       _banderas+0, 6 
	GOTO        L_analizasensoresir23
L__analizasensoresir31:
;cny70.c,154 :: 		lectura7=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura7+0 
	MOVLW       0
	MOVWF       _lectura7+1 
	MOVF        _lectura7+0, 0 
	MOVWF       _lectura7+1 
	CLRF        _lectura7+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura7+0, 1 
	MOVLW       0
	IORWF       _lectura7+1, 1 
;cny70.c,155 :: 		flag_s7=1;
	BSF         _banderas+0, 6 
;cny70.c,156 :: 		}
L_analizasensoresir23:
;cny70.c,159 :: 		if ((s8_in==0) && ( flag_s8==0))
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_analizasensoresir26
	BTFSC       _banderas+0, 7 
	GOTO        L_analizasensoresir26
L__analizasensoresir30:
;cny70.c,161 :: 		lectura8=(unsigned int)TMR1H<<8 |TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _lectura8+0 
	MOVLW       0
	MOVWF       _lectura8+1 
	MOVF        _lectura8+0, 0 
	MOVWF       _lectura8+1 
	CLRF        _lectura8+0 
	MOVF        TMR1L+0, 0 
	IORWF       _lectura8+0, 1 
	MOVLW       0
	IORWF       _lectura8+1, 1 
;cny70.c,162 :: 		flag_s8=1;
	BSF         _banderas+0, 7 
;cny70.c,163 :: 		}
L_analizasensoresir26:
;cny70.c,166 :: 		}
	GOTO        L_analizasensoresir1
L_analizasensoresir2:
;cny70.c,170 :: 		}
L_end_analizasensoresir:
	RETURN      0
; end of _analizasensoresir

_main:

;cny70.c,172 :: 		void main()
;cny70.c,174 :: 		adcon1=0b1111;// TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;cny70.c,175 :: 		trisc.b0=0; //led salida
	BCF         TRISC+0, 0 
;cny70.c,177 :: 		trisc.b6=0;
	BCF         TRISC+0, 6 
;cny70.c,178 :: 		trisb=0;
	CLRF        TRISB+0 
;cny70.c,179 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;cny70.c,180 :: 		UART1_Write_Text("iniciando");
	MOVLW       ?lstr1_cny70+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_cny70+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;cny70.c,182 :: 		while (1)
L_main27:
;cny70.c,184 :: 		analizasensoresir();
	CALL        _analizasensoresir+0, 0
;cny70.c,185 :: 		sprintf(texto,"lecturas=%d  %d    %d %d \r\n",lectura1,lectura2,lectura3,lectura4);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_cny70+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_cny70+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_cny70+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _lectura1+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _lectura1+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _lectura2+0, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _lectura2+1, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        _lectura3+0, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        _lectura3+1, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        _lectura4+0, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        _lectura4+1, 0 
	MOVWF       FARG_sprintf_wh+12 
	CALL        _sprintf+0, 0
;cny70.c,186 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;cny70.c,187 :: 		Delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
	NOP
;cny70.c,192 :: 		}
	GOTO        L_main27
;cny70.c,194 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
