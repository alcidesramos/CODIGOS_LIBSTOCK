
_InitTimer0:

;multiplexacion 7 segmentos.c,4 :: 		void InitTimer0(){
;multiplexacion 7 segmentos.c,5 :: 		OPTION_REG         = 0x82;
	MOVLW      130
	MOVWF      OPTION_REG+0
;multiplexacion 7 segmentos.c,6 :: 		TMR0                 = 6;
	MOVLW      6
	MOVWF      TMR0+0
;multiplexacion 7 segmentos.c,7 :: 		INTCON         = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;multiplexacion 7 segmentos.c,8 :: 		}
L_end_InitTimer0:
	RETURN
; end of _InitTimer0

_limpia_display:

;multiplexacion 7 segmentos.c,33 :: 		void limpia_display()
;multiplexacion 7 segmentos.c,35 :: 		dis1=0;
	BCF        PORTB+0, 0
;multiplexacion 7 segmentos.c,36 :: 		dis2=0;
	BCF        PORTB+0, 1
;multiplexacion 7 segmentos.c,37 :: 		dis3=0;
	BCF        PORTB+0, 2
;multiplexacion 7 segmentos.c,38 :: 		dis4=0;
	BCF        PORTB+0, 3
;multiplexacion 7 segmentos.c,39 :: 		}
L_end_limpia_display:
	RETURN
; end of _limpia_display

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;multiplexacion 7 segmentos.c,41 :: 		void Interrupt()
;multiplexacion 7 segmentos.c,44 :: 		if (TMR0IF_bit)
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt0
;multiplexacion 7 segmentos.c,46 :: 		TMR0IF_bit         = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;multiplexacion 7 segmentos.c,47 :: 		TMR0                 = 100;
	MOVLW      100
	MOVWF      TMR0+0
;multiplexacion 7 segmentos.c,48 :: 		limpia_display();
	CALL       _limpia_display+0
;multiplexacion 7 segmentos.c,49 :: 		habilita= habilita | mux_siete;
	MOVF       _mux_siete+0, 0
	IORWF      PORTB+0, 1
;multiplexacion 7 segmentos.c,51 :: 		switch (mux_siete)
	GOTO       L_Interrupt1
;multiplexacion 7 segmentos.c,54 :: 		case 0b1:
L_Interrupt3:
;multiplexacion 7 segmentos.c,56 :: 		displays=codigo_siete[num_dis1];
	MOVF       _num_dis1+0, 0
	ADDLW      _codigo_siete+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;multiplexacion 7 segmentos.c,57 :: 		}break;//del 1
	GOTO       L_Interrupt2
;multiplexacion 7 segmentos.c,60 :: 		case 0b10:
L_Interrupt4:
;multiplexacion 7 segmentos.c,62 :: 		displays=codigo_siete[num_dis2];
	MOVF       _num_dis2+0, 0
	ADDLW      _codigo_siete+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;multiplexacion 7 segmentos.c,63 :: 		}break;//del 2
	GOTO       L_Interrupt2
;multiplexacion 7 segmentos.c,65 :: 		case 0b100:
L_Interrupt5:
;multiplexacion 7 segmentos.c,67 :: 		displays=codigo_siete[num_dis3];
	MOVF       _num_dis3+0, 0
	ADDLW      _codigo_siete+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;multiplexacion 7 segmentos.c,68 :: 		}break;//del3
	GOTO       L_Interrupt2
;multiplexacion 7 segmentos.c,71 :: 		case 0b1000:
L_Interrupt6:
;multiplexacion 7 segmentos.c,73 :: 		displays=codigo_siete[num_dis4];
	MOVF       _num_dis4+0, 0
	ADDLW      _codigo_siete+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;multiplexacion 7 segmentos.c,74 :: 		}break;//del 4
	GOTO       L_Interrupt2
;multiplexacion 7 segmentos.c,78 :: 		}//del switch
L_Interrupt1:
	MOVF       _mux_siete+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt3
	MOVF       _mux_siete+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt4
	MOVF       _mux_siete+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt5
	MOVF       _mux_siete+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt6
L_Interrupt2:
;multiplexacion 7 segmentos.c,80 :: 		mux_siete=mux_siete<<1;
	MOVF       _mux_siete+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	MOVWF      _mux_siete+0
;multiplexacion 7 segmentos.c,81 :: 		if (mux_siete==0b10000) mux_siete=1;
	MOVF       R1+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt7
	MOVLW      1
	MOVWF      _mux_siete+0
L_Interrupt7:
;multiplexacion 7 segmentos.c,84 :: 		}
L_Interrupt0:
;multiplexacion 7 segmentos.c,85 :: 		}
L_end_Interrupt:
L__Interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;multiplexacion 7 segmentos.c,87 :: 		void main()
;multiplexacion 7 segmentos.c,90 :: 		trisb=0;
	CLRF       TRISB+0
;multiplexacion 7 segmentos.c,91 :: 		TRISD=0;
	CLRF       TRISD+0
;multiplexacion 7 segmentos.c,93 :: 		INTCON = 0b01000000;
	MOVLW      64
	MOVWF      INTCON+0
;multiplexacion 7 segmentos.c,94 :: 		InitTimer0(); //habilita interrupcion del timer cero
	CALL       _InitTimer0+0
;multiplexacion 7 segmentos.c,95 :: 		GIE_bit=1;  //habilita todas ls interrpciones
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;multiplexacion 7 segmentos.c,97 :: 		while (1)
L_main8:
;multiplexacion 7 segmentos.c,100 :: 		numero++;
	INCF       _numero+0, 1
	BTFSC      STATUS+0, 2
	INCF       _numero+1, 1
;multiplexacion 7 segmentos.c,101 :: 		if (numero>9999) numero=0;
	MOVF       _numero+1, 0
	SUBLW      39
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVF       _numero+0, 0
	SUBLW      15
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
	CLRF       _numero+0
	CLRF       _numero+1
L_main10:
;multiplexacion 7 segmentos.c,102 :: 		WordToStrWithZeros(numero,dis_caracteres);
	MOVF       _numero+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _numero+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _dis_caracteres+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;multiplexacion 7 segmentos.c,103 :: 		num_dis1=dis_caracteres[4]-48;  //conversion aschis a numero
	MOVLW      48
	SUBWF      _dis_caracteres+4, 0
	MOVWF      _num_dis1+0
;multiplexacion 7 segmentos.c,104 :: 		num_dis2=dis_caracteres[3]-48;  //conversion aschis a numero
	MOVLW      48
	SUBWF      _dis_caracteres+3, 0
	MOVWF      _num_dis2+0
;multiplexacion 7 segmentos.c,105 :: 		num_dis3=dis_caracteres[2]-48;  //conversion aschis a numero
	MOVLW      48
	SUBWF      _dis_caracteres+2, 0
	MOVWF      _num_dis3+0
;multiplexacion 7 segmentos.c,106 :: 		num_dis4=dis_caracteres[1]-48;  //conversion aschis a numero
	MOVLW      48
	SUBWF      _dis_caracteres+1, 0
	MOVWF      _num_dis4+0
;multiplexacion 7 segmentos.c,107 :: 		Delay_ms(500);//para que cuenta cada segudo
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;multiplexacion 7 segmentos.c,110 :: 		}
	GOTO       L_main8
;multiplexacion 7 segmentos.c,112 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
