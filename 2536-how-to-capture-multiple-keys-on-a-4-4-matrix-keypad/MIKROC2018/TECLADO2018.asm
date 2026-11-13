
_teclado_deco:

;TECLADO2018.c,34 :: 		char teclado_deco()
;TECLADO2018.c,36 :: 		char tec=0;
	CLRF        teclado_deco_tec_L0+0 
;TECLADO2018.c,37 :: 		tec = Keypad_Key_Press();     //mejor
	CALL        _Keypad_Key_Press+0, 0
	MOVF        R0, 0 
	MOVWF       teclado_deco_tec_L0+0 
;TECLADO2018.c,38 :: 		if (tec!=0)
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco0
;TECLADO2018.c,40 :: 		switch (tec)
	GOTO        L_teclado_deco1
;TECLADO2018.c,42 :: 		case 1:tec='7';break;
L_teclado_deco3:
	MOVLW       55
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,43 :: 		case 2:tec='8';break;
L_teclado_deco4:
	MOVLW       56
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,44 :: 		case 3:tec='9';break;
L_teclado_deco5:
	MOVLW       57
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,45 :: 		case 4:tec='/';break;
L_teclado_deco6:
	MOVLW       47
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,46 :: 		case 5:tec='4';break;
L_teclado_deco7:
	MOVLW       52
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,47 :: 		case 6:tec='5';break;
L_teclado_deco8:
	MOVLW       53
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,48 :: 		case 7:tec='6';break;
L_teclado_deco9:
	MOVLW       54
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,49 :: 		case 8:tec='*';break;
L_teclado_deco10:
	MOVLW       42
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,50 :: 		case 9:tec='1';break;
L_teclado_deco11:
	MOVLW       49
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,51 :: 		case 10:tec='2';break;
L_teclado_deco12:
	MOVLW       50
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,52 :: 		case 11:tec='3';break;
L_teclado_deco13:
	MOVLW       51
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,53 :: 		case 12:tec='-';break;
L_teclado_deco14:
	MOVLW       45
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,54 :: 		case 13:tec='E';break;
L_teclado_deco15:
	MOVLW       69
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,55 :: 		case 14:tec='0';break;
L_teclado_deco16:
	MOVLW       48
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,56 :: 		case 15:tec='=';break;
L_teclado_deco17:
	MOVLW       61
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,57 :: 		case 16:tec='+';break;
L_teclado_deco18:
	MOVLW       43
	MOVWF       teclado_deco_tec_L0+0 
	GOTO        L_teclado_deco2
;TECLADO2018.c,58 :: 		}//Fin del switch
L_teclado_deco1:
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco3
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco4
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco5
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco6
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco7
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco8
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco9
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco10
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco11
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco12
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco13
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco14
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco15
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco16
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco17
	MOVF        teclado_deco_tec_L0+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_deco18
L_teclado_deco2:
;TECLADO2018.c,59 :: 		return (tec);
	MOVF        teclado_deco_tec_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_teclado_deco
;TECLADO2018.c,61 :: 		}//si hay una tecla valida
L_teclado_deco0:
;TECLADO2018.c,63 :: 		}
L_end_teclado_deco:
	RETURN      0
; end of _teclado_deco

_teclado_estado:

;TECLADO2018.c,66 :: 		void teclado_estado()
;TECLADO2018.c,68 :: 		tecla=teclado_deco();
	CALL        _teclado_deco+0, 0
	MOVF        R0, 0 
	MOVWF       _tecla+0 
;TECLADO2018.c,70 :: 		switch (estado_teclado)
	GOTO        L_teclado_estado19
;TECLADO2018.c,72 :: 		case n1:
L_teclado_estado21:
;TECLADO2018.c,74 :: 		if ( (tecla!=0)  && (isdigit(tecla)))
	MOVF        _tecla+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado24
	MOVF        _tecla+0, 0 
	MOVWF       FARG_isdigit_character+0 
	CALL        _isdigit+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado24
L__teclado_estado61:
;TECLADO2018.c,76 :: 		led1=1;
	BSF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;TECLADO2018.c,77 :: 		retardo_cad[0]=tecla;
	MOVF        _tecla+0, 0 
	MOVWF       _retardo_cad+0 
;TECLADO2018.c,78 :: 		estado_teclado=n2;
	MOVLW       1
	MOVWF       _estado_teclado+0 
;TECLADO2018.c,79 :: 		Lcd_Chr(2,8,tecla);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _tecla+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TECLADO2018.c,80 :: 		Delay_ms(400); // retardo antirrebote
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_teclado_estado25:
	DECFSZ      R13, 1, 1
	BRA         L_teclado_estado25
	DECFSZ      R12, 1, 1
	BRA         L_teclado_estado25
	DECFSZ      R11, 1, 1
	BRA         L_teclado_estado25
;TECLADO2018.c,81 :: 		}
L_teclado_estado24:
;TECLADO2018.c,82 :: 		break;
	GOTO        L_teclado_estado20
;TECLADO2018.c,86 :: 		case n2:
L_teclado_estado26:
;TECLADO2018.c,87 :: 		if ((tecla!=0)  && (isdigit(tecla)))
	MOVF        _tecla+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado29
	MOVF        _tecla+0, 0 
	MOVWF       FARG_isdigit_character+0 
	CALL        _isdigit+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado29
L__teclado_estado60:
;TECLADO2018.c,89 :: 		retardo_cad[1]=tecla;
	MOVF        _tecla+0, 0 
	MOVWF       _retardo_cad+1 
;TECLADO2018.c,90 :: 		estado_teclado=n3;
	MOVLW       2
	MOVWF       _estado_teclado+0 
;TECLADO2018.c,91 :: 		Lcd_Chr(2,9,tecla);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _tecla+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TECLADO2018.c,92 :: 		Delay_ms(400); // retardo antirrebote
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_teclado_estado30:
	DECFSZ      R13, 1, 1
	BRA         L_teclado_estado30
	DECFSZ      R12, 1, 1
	BRA         L_teclado_estado30
	DECFSZ      R11, 1, 1
	BRA         L_teclado_estado30
;TECLADO2018.c,93 :: 		}
L_teclado_estado29:
;TECLADO2018.c,94 :: 		break;
	GOTO        L_teclado_estado20
;TECLADO2018.c,97 :: 		case n3:
L_teclado_estado31:
;TECLADO2018.c,99 :: 		if ((tecla!=0)  && (isdigit(tecla)))
	MOVF        _tecla+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado34
	MOVF        _tecla+0, 0 
	MOVWF       FARG_isdigit_character+0 
	CALL        _isdigit+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado34
L__teclado_estado59:
;TECLADO2018.c,101 :: 		retardo_cad[2]=tecla;
	MOVF        _tecla+0, 0 
	MOVWF       _retardo_cad+2 
;TECLADO2018.c,102 :: 		estado_teclado=n4;
	MOVLW       3
	MOVWF       _estado_teclado+0 
;TECLADO2018.c,103 :: 		Lcd_Chr(2,10,tecla);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _tecla+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TECLADO2018.c,104 :: 		Delay_ms(400); // retardo antirrebote
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_teclado_estado35:
	DECFSZ      R13, 1, 1
	BRA         L_teclado_estado35
	DECFSZ      R12, 1, 1
	BRA         L_teclado_estado35
	DECFSZ      R11, 1, 1
	BRA         L_teclado_estado35
;TECLADO2018.c,105 :: 		}
L_teclado_estado34:
;TECLADO2018.c,106 :: 		break;
	GOTO        L_teclado_estado20
;TECLADO2018.c,109 :: 		case n4:
L_teclado_estado36:
;TECLADO2018.c,110 :: 		if ((tecla!=0)  && (isdigit(tecla)))
	MOVF        _tecla+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado39
	MOVF        _tecla+0, 0 
	MOVWF       FARG_isdigit_character+0 
	CALL        _isdigit+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado39
L__teclado_estado58:
;TECLADO2018.c,112 :: 		retardo_cad[3]=tecla;
	MOVF        _tecla+0, 0 
	MOVWF       _retardo_cad+3 
;TECLADO2018.c,113 :: 		estado_teclado=en;
	MOVLW       4
	MOVWF       _estado_teclado+0 
;TECLADO2018.c,114 :: 		Lcd_Chr(2,11,tecla);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _tecla+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TECLADO2018.c,115 :: 		Delay_ms(400); // retardo antirrebote
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_teclado_estado40:
	DECFSZ      R13, 1, 1
	BRA         L_teclado_estado40
	DECFSZ      R12, 1, 1
	BRA         L_teclado_estado40
	DECFSZ      R11, 1, 1
	BRA         L_teclado_estado40
;TECLADO2018.c,117 :: 		}
L_teclado_estado39:
;TECLADO2018.c,118 :: 		break;
	GOTO        L_teclado_estado20
;TECLADO2018.c,120 :: 		case en:
L_teclado_estado41:
;TECLADO2018.c,122 :: 		if ((tecla!=0)  && (tecla!='='))  // no se presiono el igual
	MOVF        _tecla+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado44
	MOVF        _tecla+0, 0 
	XORLW       61
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado44
L__teclado_estado57:
;TECLADO2018.c,124 :: 		led1=0;
	BCF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;TECLADO2018.c,125 :: 		estado_teclado=n1; // vuelve al estado de  captura del primer numero
	CLRF        _estado_teclado+0 
;TECLADO2018.c,126 :: 		Lcd_Out(2,8,"      ");// borra la pantalla
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_TECLADO2018+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_TECLADO2018+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TECLADO2018.c,127 :: 		Delay_ms(600); // retardo antirrebote
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_teclado_estado45:
	DECFSZ      R13, 1, 1
	BRA         L_teclado_estado45
	DECFSZ      R12, 1, 1
	BRA         L_teclado_estado45
	DECFSZ      R11, 1, 1
	BRA         L_teclado_estado45
	NOP
	NOP
;TECLADO2018.c,130 :: 		}
	GOTO        L_teclado_estado46
L_teclado_estado44:
;TECLADO2018.c,132 :: 		else if ((tecla!=0)  && (tecla=='='))  //si se presiono el igual
	MOVF        _tecla+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado49
	MOVF        _tecla+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_teclado_estado49
L__teclado_estado56:
;TECLADO2018.c,134 :: 		led1=0;
	BCF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;TECLADO2018.c,135 :: 		retardo_cad[4]=0;  //final de cadena
	CLRF        _retardo_cad+4 
;TECLADO2018.c,136 :: 		retardo=atoi(retardo_cad); // lo pasa a numero y calcula el retardo deseado
	MOVLW       _retardo_cad+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_retardo_cad+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _retardo+0 
	MOVF        R1, 0 
	MOVWF       _retardo+1 
;TECLADO2018.c,137 :: 		estado_teclado=n1; // vuelve al estado de caprura del primer numero.
	CLRF        _estado_teclado+0 
;TECLADO2018.c,138 :: 		Lcd_Out(2,8,"      ");// borra la pantalla
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_TECLADO2018+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_TECLADO2018+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TECLADO2018.c,139 :: 		Delay_ms(600); // retardo antirrebote
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_teclado_estado50:
	DECFSZ      R13, 1, 1
	BRA         L_teclado_estado50
	DECFSZ      R12, 1, 1
	BRA         L_teclado_estado50
	DECFSZ      R11, 1, 1
	BRA         L_teclado_estado50
	NOP
	NOP
;TECLADO2018.c,140 :: 		}
L_teclado_estado49:
L_teclado_estado46:
;TECLADO2018.c,142 :: 		break;
	GOTO        L_teclado_estado20
;TECLADO2018.c,145 :: 		}
L_teclado_estado19:
	MOVF        _estado_teclado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado21
	MOVF        _estado_teclado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado26
	MOVF        _estado_teclado+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado31
	MOVF        _estado_teclado+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado36
	MOVF        _estado_teclado+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado_estado41
L_teclado_estado20:
;TECLADO2018.c,147 :: 		}
L_end_teclado_estado:
	RETURN      0
; end of _teclado_estado

_miretardo:

;TECLADO2018.c,151 :: 		void miretardo(signed int valor)
;TECLADO2018.c,154 :: 		while (valor>0)
L_miretardo51:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_miretardo_valor+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__miretardo65
	MOVF        FARG_miretardo_valor+0, 0 
	SUBLW       0
L__miretardo65:
	BTFSC       STATUS+0, 0 
	GOTO        L_miretardo52
;TECLADO2018.c,156 :: 		Delay_us(800);
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       8
	MOVWF       R13, 0
L_miretardo53:
	DECFSZ      R13, 1, 1
	BRA         L_miretardo53
	DECFSZ      R12, 1, 1
	BRA         L_miretardo53
	NOP
;TECLADO2018.c,157 :: 		teclado_estado();
	CALL        _teclado_estado+0, 0
;TECLADO2018.c,158 :: 		valor--;
	MOVLW       1
	SUBWF       FARG_miretardo_valor+0, 1 
	MOVLW       0
	SUBWFB      FARG_miretardo_valor+1, 1 
;TECLADO2018.c,159 :: 		}
	GOTO        L_miretardo51
L_miretardo52:
;TECLADO2018.c,161 :: 		}
L_end_miretardo:
	RETURN      0
; end of _miretardo

_main:

;TECLADO2018.c,163 :: 		void main()
;TECLADO2018.c,166 :: 		ANSELA=0;
	CLRF        ANSELA+0 
;TECLADO2018.c,167 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;TECLADO2018.c,168 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;TECLADO2018.c,169 :: 		ANSELD=0;
	CLRF        ANSELD+0 
;TECLADO2018.c,170 :: 		ANSELE=0;
	CLRF        ANSELE+0 
;TECLADO2018.c,171 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;TECLADO2018.c,172 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TECLADO2018.c,173 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TECLADO2018.c,174 :: 		Lcd_Out(1,6,"TECLADO");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_TECLADO2018+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_TECLADO2018+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TECLADO2018.c,176 :: 		Keypad_Init();
	CALL        _Keypad_Init+0, 0
;TECLADO2018.c,180 :: 		TRISC0_bit=0; //salida led
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;TECLADO2018.c,181 :: 		TRISA0_bit=0; //salida led1
	BCF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;TECLADO2018.c,182 :: 		led=1;
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;TECLADO2018.c,183 :: 		led1=0;
	BCF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;TECLADO2018.c,186 :: 		while (1)
L_main54:
;TECLADO2018.c,189 :: 		led=~led;//invierte el led
	BTG         LATC0_bit+0, BitPos(LATC0_bit+0) 
;TECLADO2018.c,190 :: 		miretardo(retardo);
	MOVF        _retardo+0, 0 
	MOVWF       FARG_miretardo_valor+0 
	MOVF        _retardo+1, 0 
	MOVWF       FARG_miretardo_valor+1 
	CALL        _miretardo+0, 0
;TECLADO2018.c,193 :: 		}
	GOTO        L_main54
;TECLADO2018.c,198 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
