
_init_servos:

;Servos_T0.c,22 :: 		void init_servos(float pwm_min_,float pwm_max)
;Servos_T0.c,24 :: 		if (pwm_max>=2.5) pwm_max=2.49;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       FARG_init_servos_pwm_max+0, 0
	MOVWF      R0+0
	MOVF       FARG_init_servos_pwm_max+1, 0
	MOVWF      R0+1
	MOVF       FARG_init_servos_pwm_max+2, 0
	MOVWF      R0+2
	MOVF       FARG_init_servos_pwm_max+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_init_servos0
	MOVLW      41
	MOVWF      FARG_init_servos_pwm_max+0
	MOVLW      92
	MOVWF      FARG_init_servos_pwm_max+1
	MOVLW      31
	MOVWF      FARG_init_servos_pwm_max+2
	MOVLW      128
	MOVWF      FARG_init_servos_pwm_max+3
L_init_servos0:
;Servos_T0.c,26 :: 		_m=(pwm_max-pwm_min_)/180.0;
	MOVF       FARG_init_servos_pwm_min_+0, 0
	MOVWF      R4+0
	MOVF       FARG_init_servos_pwm_min_+1, 0
	MOVWF      R4+1
	MOVF       FARG_init_servos_pwm_min_+2, 0
	MOVWF      R4+2
	MOVF       FARG_init_servos_pwm_min_+3, 0
	MOVWF      R4+3
	MOVF       FARG_init_servos_pwm_max+0, 0
	MOVWF      R0+0
	MOVF       FARG_init_servos_pwm_max+1, 0
	MOVWF      R0+1
	MOVF       FARG_init_servos_pwm_max+2, 0
	MOVWF      R0+2
	MOVF       FARG_init_servos_pwm_max+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      52
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      __m+0
	MOVF       R0+1, 0
	MOVWF      __m+1
	MOVF       R0+2, 0
	MOVWF      __m+2
	MOVF       R0+3, 0
	MOVWF      __m+3
;Servos_T0.c,27 :: 		pwm_min=pwm_min_;
	MOVF       FARG_init_servos_pwm_min_+0, 0
	MOVWF      _pwm_min+0
	MOVF       FARG_init_servos_pwm_min_+1, 0
	MOVWF      _pwm_min+1
	MOVF       FARG_init_servos_pwm_min_+2, 0
	MOVWF      _pwm_min+2
	MOVF       FARG_init_servos_pwm_min_+3, 0
	MOVWF      _pwm_min+3
;Servos_T0.c,29 :: 		PEIE_bit=1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;Servos_T0.c,30 :: 		servo1_direction=0;
	BCF        servo1_direction+0, BitPos(servo1_direction+0)
;Servos_T0.c,31 :: 		servo2_direction=0;
	BCF        servo2_direction+0, BitPos(servo2_direction+0)
;Servos_T0.c,32 :: 		servo3_direction=0;
	BCF        servo3_direction+0, BitPos(servo3_direction+0)
;Servos_T0.c,33 :: 		servo4_direction=0;
	BCF        servo4_direction+0, BitPos(servo4_direction+0)
;Servos_T0.c,34 :: 		servo5_direction=0;
	BCF        servo5_direction+0, BitPos(servo5_direction+0)
;Servos_T0.c,35 :: 		servo6_direction=0;
	BCF        servo6_direction+0, BitPos(servo6_direction+0)
;Servos_T0.c,36 :: 		servo7_direction=0;
	BCF        servo7_direction+0, BitPos(servo7_direction+0)
;Servos_T0.c,37 :: 		servo8_direction=0;
	BCF        servo8_direction+0, BitPos(servo8_direction+0)
;Servos_T0.c,39 :: 		servo1=0;
	BCF        servo1+0, BitPos(servo1+0)
;Servos_T0.c,40 :: 		servo2=0;
	BCF        servo2+0, BitPos(servo2+0)
;Servos_T0.c,41 :: 		servo3=0;
	BCF        servo3+0, BitPos(servo3+0)
;Servos_T0.c,42 :: 		servo4=0;
	BCF        servo4+0, BitPos(servo4+0)
;Servos_T0.c,43 :: 		servo5=0;
	BCF        servo5+0, BitPos(servo5+0)
;Servos_T0.c,44 :: 		servo6=0;
	BCF        servo6+0, BitPos(servo6+0)
;Servos_T0.c,45 :: 		servo7=0;
	BCF        servo7+0, BitPos(servo7+0)
;Servos_T0.c,46 :: 		servo8=0;
	BCF        servo8+0, BitPos(servo8+0)
;Servos_T0.c,49 :: 		T0CS_bit=0;
	BCF        T0CS_bit+0, BitPos(T0CS_bit+0)
;Servos_T0.c,50 :: 		PSA_bit=0;
	BCF        PSA_bit+0, BitPos(PSA_bit+0)
;Servos_T0.c,51 :: 		OPTION_REG.ps2=1;
	BSF        OPTION_REG+0, 2
;Servos_T0.c,52 :: 		OPTION_REG.ps1=0;
	BCF        OPTION_REG+0, 1
;Servos_T0.c,53 :: 		OPTION_REG.ps0=1;
	BSF        OPTION_REG+0, 0
;Servos_T0.c,54 :: 		TMR0=250;//valor al azar para forzar la primera interrupcion //tmr0_2_5ms;
	MOVLW      250
	MOVWF      TMR0+0
;Servos_T0.c,55 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Servos_T0.c,56 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;Servos_T0.c,59 :: 		servos[0]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+0
;Servos_T0.c,60 :: 		servos[1]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+1
;Servos_T0.c,61 :: 		servos[2]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+2
;Servos_T0.c,62 :: 		servos[3]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+3
;Servos_T0.c,63 :: 		servos[4]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+4
;Servos_T0.c,64 :: 		servos[5]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+5
;Servos_T0.c,65 :: 		servos[6]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+6
;Servos_T0.c,66 :: 		servos[7]=tmr0_1_5ms;
	MOVLW      232
	MOVWF      _servos+7
;Servos_T0.c,68 :: 		}
L_end_init_servos:
	RETURN
; end of _init_servos

_servos_interrupcion:

;Servos_T0.c,70 :: 		void servos_interrupcion()
;Servos_T0.c,74 :: 		if (TMR0IF_bit==1)
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_servos_interrupcion1
;Servos_T0.c,75 :: 		{        switch (estado_servos)
	GOTO       L_servos_interrupcion2
;Servos_T0.c,78 :: 		case hi_1:
L_servos_interrupcion4:
;Servos_T0.c,80 :: 		servo1=1;
	BSF        servo1+0, BitPos(servo1+0)
;Servos_T0.c,81 :: 		tmr0=servos[0];
	MOVF       _servos+0, 0
	MOVWF      TMR0+0
;Servos_T0.c,82 :: 		estado_servos=lo_1;
	MOVLW      1
	MOVWF      _estado_servos+0
;Servos_T0.c,83 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,85 :: 		case lo_1:
L_servos_interrupcion5:
;Servos_T0.c,87 :: 		servo1=0;
	BCF        servo1+0, BitPos(servo1+0)
;Servos_T0.c,88 :: 		tmr0=tmr0_periodo-servos[0];
	MOVF       _servos+0, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,89 :: 		estado_servos=hi_2;
	MOVLW      2
	MOVWF      _estado_servos+0
;Servos_T0.c,90 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,93 :: 		case hi_2:
L_servos_interrupcion6:
;Servos_T0.c,95 :: 		servo2=1;
	BSF        servo2+0, BitPos(servo2+0)
;Servos_T0.c,96 :: 		tmr0=servos[1];
	MOVF       _servos+1, 0
	MOVWF      TMR0+0
;Servos_T0.c,97 :: 		estado_servos=lo_2;
	MOVLW      3
	MOVWF      _estado_servos+0
;Servos_T0.c,98 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,100 :: 		case lo_2:
L_servos_interrupcion7:
;Servos_T0.c,102 :: 		servo2=0;
	BCF        servo2+0, BitPos(servo2+0)
;Servos_T0.c,103 :: 		tmr0=tmr0_periodo-servos[1];
	MOVF       _servos+1, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,104 :: 		estado_servos=hi_3;
	MOVLW      4
	MOVWF      _estado_servos+0
;Servos_T0.c,105 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,107 :: 		case hi_3:
L_servos_interrupcion8:
;Servos_T0.c,109 :: 		servo3=1;
	BSF        servo3+0, BitPos(servo3+0)
;Servos_T0.c,110 :: 		tmr0=servos[2];
	MOVF       _servos+2, 0
	MOVWF      TMR0+0
;Servos_T0.c,111 :: 		estado_servos=lo_3;
	MOVLW      5
	MOVWF      _estado_servos+0
;Servos_T0.c,112 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,114 :: 		case lo_3:
L_servos_interrupcion9:
;Servos_T0.c,116 :: 		servo3=0;
	BCF        servo3+0, BitPos(servo3+0)
;Servos_T0.c,117 :: 		tmr0=tmr0_periodo-servos[2];
	MOVF       _servos+2, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,118 :: 		estado_servos=hi_4;
	MOVLW      6
	MOVWF      _estado_servos+0
;Servos_T0.c,119 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,122 :: 		case hi_4:
L_servos_interrupcion10:
;Servos_T0.c,124 :: 		servo4=1;
	BSF        servo4+0, BitPos(servo4+0)
;Servos_T0.c,125 :: 		tmr0=servos[3];
	MOVF       _servos+3, 0
	MOVWF      TMR0+0
;Servos_T0.c,126 :: 		estado_servos=lo_4;
	MOVLW      7
	MOVWF      _estado_servos+0
;Servos_T0.c,127 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,129 :: 		case lo_4:
L_servos_interrupcion11:
;Servos_T0.c,131 :: 		servo4=0;
	BCF        servo4+0, BitPos(servo4+0)
;Servos_T0.c,132 :: 		tmr0=tmr0_periodo-servos[3];
	MOVF       _servos+3, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,133 :: 		estado_servos=hi_5;
	MOVLW      8
	MOVWF      _estado_servos+0
;Servos_T0.c,134 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,137 :: 		case hi_5:
L_servos_interrupcion12:
;Servos_T0.c,139 :: 		servo5=1;
	BSF        servo5+0, BitPos(servo5+0)
;Servos_T0.c,140 :: 		tmr0=servos[4];
	MOVF       _servos+4, 0
	MOVWF      TMR0+0
;Servos_T0.c,141 :: 		estado_servos=lo_5;
	MOVLW      9
	MOVWF      _estado_servos+0
;Servos_T0.c,142 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,144 :: 		case lo_5:
L_servos_interrupcion13:
;Servos_T0.c,146 :: 		servo5=0;
	BCF        servo5+0, BitPos(servo5+0)
;Servos_T0.c,147 :: 		tmr0=tmr0_periodo-servos[4];
	MOVF       _servos+4, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,148 :: 		estado_servos=hi_6;
	MOVLW      10
	MOVWF      _estado_servos+0
;Servos_T0.c,149 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,152 :: 		case hi_6:
L_servos_interrupcion14:
;Servos_T0.c,154 :: 		servo6=1;
	BSF        servo6+0, BitPos(servo6+0)
;Servos_T0.c,155 :: 		tmr0=servos[5];
	MOVF       _servos+5, 0
	MOVWF      TMR0+0
;Servos_T0.c,156 :: 		estado_servos=lo_6;
	MOVLW      11
	MOVWF      _estado_servos+0
;Servos_T0.c,157 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,159 :: 		case lo_6:
L_servos_interrupcion15:
;Servos_T0.c,161 :: 		servo6=0;
	BCF        servo6+0, BitPos(servo6+0)
;Servos_T0.c,162 :: 		tmr0=tmr0_periodo-servos[5];
	MOVF       _servos+5, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,163 :: 		estado_servos=hi_7;
	MOVLW      12
	MOVWF      _estado_servos+0
;Servos_T0.c,164 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,167 :: 		case hi_7:
L_servos_interrupcion16:
;Servos_T0.c,169 :: 		servo7=1;
	BSF        servo7+0, BitPos(servo7+0)
;Servos_T0.c,170 :: 		tmr0=servos[6];
	MOVF       _servos+6, 0
	MOVWF      TMR0+0
;Servos_T0.c,171 :: 		estado_servos=lo_7;
	MOVLW      13
	MOVWF      _estado_servos+0
;Servos_T0.c,172 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,174 :: 		case lo_7:
L_servos_interrupcion17:
;Servos_T0.c,176 :: 		servo7=0;
	BCF        servo7+0, BitPos(servo7+0)
;Servos_T0.c,177 :: 		tmr0=tmr0_periodo-servos[6];
	MOVF       _servos+6, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,178 :: 		estado_servos=hi_8;
	MOVLW      14
	MOVWF      _estado_servos+0
;Servos_T0.c,179 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,182 :: 		case hi_8:
L_servos_interrupcion18:
;Servos_T0.c,184 :: 		servo8=1;
	BSF        servo8+0, BitPos(servo8+0)
;Servos_T0.c,185 :: 		tmr0=servos[7];
	MOVF       _servos+7, 0
	MOVWF      TMR0+0
;Servos_T0.c,186 :: 		estado_servos=lo_8;
	MOVLW      15
	MOVWF      _estado_servos+0
;Servos_T0.c,187 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,189 :: 		case lo_8:
L_servos_interrupcion19:
;Servos_T0.c,191 :: 		servo8=0;
	BCF        servo8+0, BitPos(servo8+0)
;Servos_T0.c,192 :: 		tmr0=tmr0_periodo-servos[7];
	MOVF       _servos+7, 0
	SUBLW      216
	MOVWF      TMR0+0
;Servos_T0.c,193 :: 		estado_servos=hi_1;
	CLRF       _estado_servos+0
;Servos_T0.c,194 :: 		}break;
	GOTO       L_servos_interrupcion3
;Servos_T0.c,199 :: 		}//del switch
L_servos_interrupcion2:
	MOVF       _estado_servos+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion4
	MOVF       _estado_servos+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion5
	MOVF       _estado_servos+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion6
	MOVF       _estado_servos+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion7
	MOVF       _estado_servos+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion8
	MOVF       _estado_servos+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion9
	MOVF       _estado_servos+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion10
	MOVF       _estado_servos+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion11
	MOVF       _estado_servos+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion12
	MOVF       _estado_servos+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion13
	MOVF       _estado_servos+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion14
	MOVF       _estado_servos+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion15
	MOVF       _estado_servos+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion16
	MOVF       _estado_servos+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion17
	MOVF       _estado_servos+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion18
	MOVF       _estado_servos+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_servos_interrupcion19
L_servos_interrupcion3:
;Servos_T0.c,201 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Servos_T0.c,204 :: 		}
L_servos_interrupcion1:
;Servos_T0.c,206 :: 		}
L_end_servos_interrupcion:
	RETURN
; end of _servos_interrupcion

_servo_valor:

;Servos_T0.c,209 :: 		void servo_valor(char servo_num,float servo_ang)
;Servos_T0.c,212 :: 		servo_tempo=(servo_ang+90.0)*_m+pwm_min;
	MOVF       FARG_servo_valor_servo_ang+0, 0
	MOVWF      R0+0
	MOVF       FARG_servo_valor_servo_ang+1, 0
	MOVWF      R0+1
	MOVF       FARG_servo_valor_servo_ang+2, 0
	MOVWF      R0+2
	MOVF       FARG_servo_valor_servo_ang+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      52
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       __m+0, 0
	MOVWF      R4+0
	MOVF       __m+1, 0
	MOVWF      R4+1
	MOVF       __m+2, 0
	MOVWF      R4+2
	MOVF       __m+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       _pwm_min+0, 0
	MOVWF      R4+0
	MOVF       _pwm_min+1, 0
	MOVWF      R4+1
	MOVF       _pwm_min+2, 0
	MOVWF      R4+2
	MOVF       _pwm_min+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _servo_tempo+0
	MOVF       R0+1, 0
	MOVWF      _servo_tempo+1
	MOVF       R0+2, 0
	MOVWF      _servo_tempo+2
	MOVF       R0+3, 0
	MOVWF      _servo_tempo+3
;Servos_T0.c,213 :: 		servo_tempo =256.0 -((cristal*servo_tempo)/(4.0*preescalador));
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      138
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      135
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _servo_tempo+0
	MOVF       R0+1, 0
	MOVWF      _servo_tempo+1
	MOVF       R0+2, 0
	MOVWF      _servo_tempo+2
	MOVF       R0+3, 0
	MOVWF      _servo_tempo+3
;Servos_T0.c,214 :: 		servos[servo_num-1]=(servo_tempo);
	MOVLW      1
	SUBWF      FARG_servo_valor_servo_num+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	BTFSS      STATUS+0, 0
	DECF       R4+1, 1
	MOVF       R4+0, 0
	ADDLW      _servos+0
	MOVWF      FLOC__servo_valor+0
	CALL       _double2byte+0
	MOVF       FLOC__servo_valor+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Servos_T0.c,216 :: 		}
L_end_servo_valor:
	RETURN
; end of _servo_valor
