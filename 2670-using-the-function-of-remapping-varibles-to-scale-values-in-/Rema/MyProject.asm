
_map1:

;MyProject.c,43 :: 		float map1(float x, float in_min, float in_max, float out_min, float out_max)
;MyProject.c,46 :: 		pendiente=(out_max - out_min) / (in_max - in_min);
	MOVF       FARG_map1_out_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_out_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_out_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_out_min+3, 0
	MOVWF      R4+3
	MOVF       FARG_map1_out_max+0, 0
	MOVWF      R0+0
	MOVF       FARG_map1_out_max+1, 0
	MOVWF      R0+1
	MOVF       FARG_map1_out_max+2, 0
	MOVWF      R0+2
	MOVF       FARG_map1_out_max+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__map1+0
	MOVF       R0+1, 0
	MOVWF      FLOC__map1+1
	MOVF       R0+2, 0
	MOVWF      FLOC__map1+2
	MOVF       R0+3, 0
	MOVWF      FLOC__map1+3
	MOVF       FARG_map1_in_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_in_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_in_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_in_min+3, 0
	MOVWF      R4+3
	MOVF       FARG_map1_in_max+0, 0
	MOVWF      R0+0
	MOVF       FARG_map1_in_max+1, 0
	MOVWF      R0+1
	MOVF       FARG_map1_in_max+2, 0
	MOVWF      R0+2
	MOVF       FARG_map1_in_max+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__map1+0, 0
	MOVWF      R0+0
	MOVF       FLOC__map1+1, 0
	MOVWF      R0+1
	MOVF       FLOC__map1+2, 0
	MOVWF      R0+2
	MOVF       FLOC__map1+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__map1+0
	MOVF       R0+1, 0
	MOVWF      FLOC__map1+1
	MOVF       R0+2, 0
	MOVWF      FLOC__map1+2
	MOVF       R0+3, 0
	MOVWF      FLOC__map1+3
	MOVF       FARG_map1_in_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_in_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_in_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_in_min+3, 0
	MOVWF      R4+3
	MOVF       FARG_map1_x+0, 0
	MOVWF      R0+0
	MOVF       FARG_map1_x+1, 0
	MOVWF      R0+1
	MOVF       FARG_map1_x+2, 0
	MOVWF      R0+2
	MOVF       FARG_map1_x+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
;MyProject.c,47 :: 		pendiente=pendiente*(x- in_min);
	MOVF       FLOC__map1+0, 0
	MOVWF      R4+0
	MOVF       FLOC__map1+1, 0
	MOVWF      R4+1
	MOVF       FLOC__map1+2, 0
	MOVWF      R4+2
	MOVF       FLOC__map1+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
;MyProject.c,48 :: 		pendiente=pendiente+out_min;
	MOVF       FARG_map1_out_min+0, 0
	MOVWF      R4+0
	MOVF       FARG_map1_out_min+1, 0
	MOVWF      R4+1
	MOVF       FARG_map1_out_min+2, 0
	MOVWF      R4+2
	MOVF       FARG_map1_out_min+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
;MyProject.c,49 :: 		return( pendiente);
;MyProject.c,50 :: 		}
L_end_map1:
	RETURN
; end of _map1

_derecha1:

;MyProject.c,53 :: 		void derecha1()
;MyProject.c,55 :: 		m11=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,56 :: 		m12=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,57 :: 		}
L_end_derecha1:
	RETURN
; end of _derecha1

_izquierda1:

;MyProject.c,60 :: 		void izquierda1()
;MyProject.c,62 :: 		m11=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,63 :: 		m12=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,64 :: 		}
L_end_izquierda1:
	RETURN
; end of _izquierda1

_derecha2:

;MyProject.c,66 :: 		void derecha2()
;MyProject.c,68 :: 		m21=1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,69 :: 		m22=0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;MyProject.c,70 :: 		}
L_end_derecha2:
	RETURN
; end of _derecha2

_izquierda2:

;MyProject.c,73 :: 		void izquierda2()
;MyProject.c,75 :: 		m21=0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,76 :: 		m22=1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;MyProject.c,77 :: 		}
L_end_izquierda2:
	RETURN
; end of _izquierda2

_main:

;MyProject.c,80 :: 		void main()
;MyProject.c,82 :: 		ADCON1=0B1111; // AN0 ANLOGO
	MOVLW      15
	MOVWF      ADCON1+0
;MyProject.c,83 :: 		TRISA=0B111111;//  A ENTRADA
	MOVLW      63
	MOVWF      TRISA+0
;MyProject.c,84 :: 		TRISB=0; // TODO SALIDA
	CLRF       TRISB+0
;MyProject.c,86 :: 		TRISB4_bit=1;
	BSF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;MyProject.c,87 :: 		TRISB5_bit=1;
	BSF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;MyProject.c,89 :: 		TRISB6_bit=1;
	BSF        TRISB6_bit+0, BitPos(TRISB6_bit+0)
;MyProject.c,90 :: 		TRISB7_bit=1;
	BSF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;MyProject.c,95 :: 		RC1_bit=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,96 :: 		RC2_bit=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,98 :: 		PWM1_Init(245);   // INICIALIZA A LA FRECUENICA
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      255
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,99 :: 		PWM2_Init(245);   // INICIALIZA A LA FRECUENICA
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      255
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;MyProject.c,100 :: 		PWM1_Set_Duty(40);
	MOVLW      40
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,101 :: 		PWM2_Set_Duty(200);
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,103 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;MyProject.c,104 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;MyProject.c,105 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject.c,106 :: 		TRISA1_bit=1;
	BSF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;MyProject.c,107 :: 		TRISA2_bit=1;
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;MyProject.c,108 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,110 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,111 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,113 :: 		Lcd_Out(1,1,"Ve1=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,114 :: 		Lcd_Out(2,1,"Ve2=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,116 :: 		Lcd_Out(1,11,"G1=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,117 :: 		Lcd_Out(2,11,"G2=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,118 :: 		NOT_RBPU_bit=0; // HABILIA PULL UP PORT B
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;MyProject.c,120 :: 		while (1)
L_main0:
;MyProject.c,122 :: 		codigo=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;MyProject.c,123 :: 		velo1=codigo*255.0/1023.0;
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
;MyProject.c,124 :: 		PWM1_Set_Duty(velo1);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,127 :: 		if (sube2==0)
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main2
;MyProject.c,129 :: 		velo2=velo2+10;
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
;MyProject.c,130 :: 		if (velo2>=255) velo2=255;
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      255
	SUBWF      R1+0, 0
L__main18:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
	MOVLW      255
	MOVWF      _velo2+0
	CLRF       _velo2+1
L_main3:
;MyProject.c,131 :: 		PWM2_Set_Duty(velo2);
	MOVF       _velo2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,132 :: 		Delay_ms(250);
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
;MyProject.c,133 :: 		}
L_main2:
;MyProject.c,135 :: 		if (baja2==0)
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main5
;MyProject.c,137 :: 		velo2=velo2-10;
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
;MyProject.c,138 :: 		if (velo2<=0) velo2=0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVF       R1+0, 0
	SUBLW      0
L__main19:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
	CLRF       _velo2+0
	CLRF       _velo2+1
L_main6:
;MyProject.c,139 :: 		PWM2_Set_Duty(velo2);
	MOVF       _velo2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,140 :: 		Delay_ms(250);
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
;MyProject.c,141 :: 		}
L_main5:
;MyProject.c,143 :: 		if (giro1==0)
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main8
;MyProject.c,145 :: 		derecha1();
	CALL       _derecha1+0
;MyProject.c,146 :: 		Lcd_Chr(1,14,'D');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      68
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,147 :: 		}
	GOTO       L_main9
L_main8:
;MyProject.c,151 :: 		izquierda1();
	CALL       _izquierda1+0
;MyProject.c,152 :: 		Lcd_Chr(1,14,'I');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,154 :: 		}
L_main9:
;MyProject.c,156 :: 		if (giro2==0)
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main10
;MyProject.c,158 :: 		derecha2();
	CALL       _derecha2+0
;MyProject.c,159 :: 		Lcd_Chr(2,14,'D');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      68
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,160 :: 		}
	GOTO       L_main11
L_main10:
;MyProject.c,164 :: 		izquierda2();
	CALL       _izquierda2+0
;MyProject.c,165 :: 		Lcd_Chr(2,14,'I');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      73
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,167 :: 		}
L_main11:
;MyProject.c,169 :: 		remapaeo= map1(velo1,0,255,20,80);
	MOVF       _velo1+0, 0
	MOVWF      R0+0
	MOVF       _velo1+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_map1_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_map1_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_map1_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_map1_x+3
	CLRF       FARG_map1_in_min+0
	CLRF       FARG_map1_in_min+1
	CLRF       FARG_map1_in_min+2
	CLRF       FARG_map1_in_min+3
	MOVLW      0
	MOVWF      FARG_map1_in_max+0
	MOVLW      0
	MOVWF      FARG_map1_in_max+1
	MOVLW      127
	MOVWF      FARG_map1_in_max+2
	MOVLW      134
	MOVWF      FARG_map1_in_max+3
	MOVLW      0
	MOVWF      FARG_map1_out_min+0
	MOVLW      0
	MOVWF      FARG_map1_out_min+1
	MOVLW      32
	MOVWF      FARG_map1_out_min+2
	MOVLW      131
	MOVWF      FARG_map1_out_min+3
	MOVLW      0
	MOVWF      FARG_map1_out_max+0
	MOVLW      0
	MOVWF      FARG_map1_out_max+1
	MOVLW      32
	MOVWF      FARG_map1_out_max+2
	MOVLW      133
	MOVWF      FARG_map1_out_max+3
	CALL       _map1+0
	MOVF       R0+0, 0
	MOVWF      _remapaeo+0
	MOVF       R0+1, 0
	MOVWF      _remapaeo+1
	MOVF       R0+2, 0
	MOVWF      _remapaeo+2
	MOVF       R0+3, 0
	MOVWF      _remapaeo+3
;MyProject.c,170 :: 		floattostr_(remapaeo,texto,1);
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
;MyProject.c,171 :: 		Lcd_Out(1,5,texto);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,172 :: 		floattostr_(0.2353*velo2+ 20.0,texto,1);
	MOVF       _velo2+0, 0
	MOVWF      R0+0
	MOVF       _velo2+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVLW      124
	MOVWF      R4+0
	MOVLW      242
	MOVWF      R4+1
	MOVLW      112
	MOVWF      R4+2
	MOVLW      124
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
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
;MyProject.c,173 :: 		Lcd_Out(2,5,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,177 :: 		}
	GOTO       L_main0
;MyProject.c,184 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
