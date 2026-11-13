
_derecha1:

;MyProject.c,42 :: 		void derecha1()
;MyProject.c,44 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,45 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,46 :: 		}
L_end_derecha1:
	RETURN
; end of _derecha1

_izquierda1:

;MyProject.c,49 :: 		void izquierda1()
;MyProject.c,51 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,52 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,53 :: 		}
L_end_izquierda1:
	RETURN
; end of _izquierda1

_derecha2:

;MyProject.c,55 :: 		void derecha2()
;MyProject.c,57 :: 		m21=1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,58 :: 		m22=0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;MyProject.c,59 :: 		}
L_end_derecha2:
	RETURN
; end of _derecha2

_izquierda2:

;MyProject.c,62 :: 		void izquierda2()
;MyProject.c,64 :: 		m21=0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,65 :: 		m22=1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;MyProject.c,66 :: 		}
L_end_izquierda2:
	RETURN
; end of _izquierda2

_main:

;MyProject.c,69 :: 		void main()
;MyProject.c,71 :: 		ADCON1=0B1111; // AN0 ANLOGO
	MOVLW      15
	MOVWF      ADCON1+0
;MyProject.c,72 :: 		TRISA=0B111111;//  A ENTRADA
	MOVLW      63
	MOVWF      TRISA+0
;MyProject.c,73 :: 		TRISB=0; // TODO SALIDA
	CLRF       TRISB+0
;MyProject.c,75 :: 		TRISB4_bit=1;
	BSF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;MyProject.c,76 :: 		TRISB5_bit=1;
	BSF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;MyProject.c,78 :: 		TRISB6_bit=1;
	BSF        TRISB6_bit+0, BitPos(TRISB6_bit+0)
;MyProject.c,79 :: 		TRISB7_bit=1;
	BSF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;MyProject.c,84 :: 		RC1_bit=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,85 :: 		RC2_bit=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,87 :: 		PWM1_Init(245);   // INICIALIZA A LA FRECUENICA
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      255
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,88 :: 		PWM2_Init(245);   // INICIALIZA A LA FRECUENICA
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      255
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;MyProject.c,89 :: 		PWM1_Set_Duty(40);
	MOVLW      40
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,90 :: 		PWM2_Set_Duty(200);
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,92 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;MyProject.c,93 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;MyProject.c,94 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject.c,95 :: 		TRISA1_bit=1;
	BSF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;MyProject.c,96 :: 		TRISA2_bit=1;
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;MyProject.c,97 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,99 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,100 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,102 :: 		Lcd_Out(1,1,"Ve1=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,103 :: 		Lcd_Out(2,1,"Ve2=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,105 :: 		Lcd_Out(1,11,"G1=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,106 :: 		Lcd_Out(2,11,"G2=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,107 :: 		NOT_RBPU_bit=0; // HABILIA PULL UP PORT B
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;MyProject.c,109 :: 		while (1)
L_main0:
;MyProject.c,111 :: 		codigo=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;MyProject.c,112 :: 		velo1=codigo*255.0/1023.0;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _velo1+0
	MOVF       R0+1, 0
	MOVWF      _velo1+1
;MyProject.c,113 :: 		PWM1_Set_Duty(velo1);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,116 :: 		if (sube2==0)
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main2
;MyProject.c,118 :: 		velo2=velo2+10;
	MOVLW      10
	ADDWF      _velo2+0, 0
	MOVWF      R1+0
	MOVF       _velo2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _velo2+0
	MOVF       R1+1, 0
	MOVWF      _velo2+1
;MyProject.c,119 :: 		if (velo2>=255) velo2=255;
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      255
	SUBWF      R1+0, 0
L__main17:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
	MOVLW      255
	MOVWF      _velo2+0
	CLRF       _velo2+1
L_main3:
;MyProject.c,120 :: 		PWM2_Set_Duty(velo2);
	MOVF       _velo2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,121 :: 		Delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;MyProject.c,122 :: 		}
L_main2:
;MyProject.c,124 :: 		if (baja2==0)
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main5
;MyProject.c,126 :: 		velo2=velo2-10;
	MOVLW      10
	SUBWF      _velo2+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _velo2+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _velo2+0
	MOVF       R1+1, 0
	MOVWF      _velo2+1
;MyProject.c,127 :: 		if (velo2<=0) velo2=0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVF       R1+0, 0
	SUBLW      0
L__main18:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
	CLRF       _velo2+0
	CLRF       _velo2+1
L_main6:
;MyProject.c,128 :: 		PWM2_Set_Duty(velo2);
	MOVF       _velo2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,129 :: 		Delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;MyProject.c,130 :: 		}
L_main5:
;MyProject.c,132 :: 		if (giro1==0)
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main8
;MyProject.c,134 :: 		derecha1();
	CALL       _derecha1+0
;MyProject.c,135 :: 		Lcd_Chr(1,14,'D');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      68
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,136 :: 		}
	GOTO       L_main9
L_main8:
;MyProject.c,140 :: 		izquierda1();
	CALL       _izquierda1+0
;MyProject.c,141 :: 		Lcd_Chr(1,14,'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,143 :: 		}
L_main9:
;MyProject.c,145 :: 		if (giro2==0)
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main10
;MyProject.c,147 :: 		derecha2();
	CALL       _derecha2+0
;MyProject.c,148 :: 		Lcd_Chr(2,14,'D');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      68
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,149 :: 		}
	GOTO       L_main11
L_main10:
;MyProject.c,153 :: 		izquierda2();
	CALL       _izquierda2+0
;MyProject.c,154 :: 		Lcd_Chr(2,14,'I');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,156 :: 		}
L_main11:
;MyProject.c,158 :: 		floattostr_(velo1*100.0/255.0,texto,1);
	MOVF       _velo1+0, 0
	MOVWF      R0+0
	MOVF       _velo1+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      1
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;MyProject.c,159 :: 		Lcd_Out(1,5,texto);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,160 :: 		floattostr_(velo2*100.0/255.0,texto,1);
	MOVF       _velo2+0, 0
	MOVWF      R0+0
	MOVF       _velo2+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floattostr__numero_+0
	MOVF       R0+1, 0
	MOVWF      FARG_floattostr__numero_+1
	MOVF       R0+2, 0
	MOVWF      FARG_floattostr__numero_+2
	MOVF       R0+3, 0
	MOVWF      FARG_floattostr__numero_+3
	MOVLW      _texto+0
	MOVWF      FARG_floattostr__cadena_+0
	MOVLW      1
	MOVWF      FARG_floattostr__decimales_+0
	CALL       _floattostr_+0
;MyProject.c,161 :: 		Lcd_Out(2,5,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,165 :: 		}
	GOTO       L_main0
;MyProject.c,172 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
