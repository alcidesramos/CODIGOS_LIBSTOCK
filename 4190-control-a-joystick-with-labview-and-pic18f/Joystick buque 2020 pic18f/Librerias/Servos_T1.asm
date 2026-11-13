
_init_servos:

;Servos_T1.c,24 :: 		void init_servos(float pwm_min_,float pwm_max)
;Servos_T1.c,26 :: 		if (pwm_max>=2.5) pwm_max=2.49;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        FARG_init_servos_pwm_max+0, 0 
	MOVWF       R0 
	MOVF        FARG_init_servos_pwm_max+1, 0 
	MOVWF       R1 
	MOVF        FARG_init_servos_pwm_max+2, 0 
	MOVWF       R2 
	MOVF        FARG_init_servos_pwm_max+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_init_servos0
	MOVLW       41
	MOVWF       FARG_init_servos_pwm_max+0 
	MOVLW       92
	MOVWF       FARG_init_servos_pwm_max+1 
	MOVLW       31
	MOVWF       FARG_init_servos_pwm_max+2 
	MOVLW       128
	MOVWF       FARG_init_servos_pwm_max+3 
L_init_servos0:
;Servos_T1.c,28 :: 		_m=(pwm_max-pwm_min_)/180.0;
	MOVF        FARG_init_servos_pwm_min_+0, 0 
	MOVWF       R4 
	MOVF        FARG_init_servos_pwm_min_+1, 0 
	MOVWF       R5 
	MOVF        FARG_init_servos_pwm_min_+2, 0 
	MOVWF       R6 
	MOVF        FARG_init_servos_pwm_min_+3, 0 
	MOVWF       R7 
	MOVF        FARG_init_servos_pwm_max+0, 0 
	MOVWF       R0 
	MOVF        FARG_init_servos_pwm_max+1, 0 
	MOVWF       R1 
	MOVF        FARG_init_servos_pwm_max+2, 0 
	MOVWF       R2 
	MOVF        FARG_init_servos_pwm_max+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       __m+0 
	MOVF        R1, 0 
	MOVWF       __m+1 
	MOVF        R2, 0 
	MOVWF       __m+2 
	MOVF        R3, 0 
	MOVWF       __m+3 
;Servos_T1.c,29 :: 		pwm_min=pwm_min_;
	MOVF        FARG_init_servos_pwm_min_+0, 0 
	MOVWF       _pwm_min+0 
	MOVF        FARG_init_servos_pwm_min_+1, 0 
	MOVWF       _pwm_min+1 
	MOVF        FARG_init_servos_pwm_min_+2, 0 
	MOVWF       _pwm_min+2 
	MOVF        FARG_init_servos_pwm_min_+3, 0 
	MOVWF       _pwm_min+3 
;Servos_T1.c,31 :: 		PEIE_bit=1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Servos_T1.c,32 :: 		servo1_direction=0;
	BCF         servo1_direction+0, BitPos(servo1_direction+0) 
;Servos_T1.c,33 :: 		servo2_direction=0;
	BCF         servo2_direction+0, BitPos(servo2_direction+0) 
;Servos_T1.c,34 :: 		servo3_direction=0;
	BCF         servo3_direction+0, BitPos(servo3_direction+0) 
;Servos_T1.c,35 :: 		servo4_direction=0;
	BCF         servo4_direction+0, BitPos(servo4_direction+0) 
;Servos_T1.c,36 :: 		servo5_direction=0;
	BCF         servo5_direction+0, BitPos(servo5_direction+0) 
;Servos_T1.c,37 :: 		servo6_direction=0;
	BCF         servo6_direction+0, BitPos(servo6_direction+0) 
;Servos_T1.c,38 :: 		servo7_direction=0;
	BCF         servo7_direction+0, BitPos(servo7_direction+0) 
;Servos_T1.c,39 :: 		servo8_direction=0;
	BCF         servo8_direction+0, BitPos(servo8_direction+0) 
;Servos_T1.c,41 :: 		servo1=0;
	BCF         servo1+0, BitPos(servo1+0) 
;Servos_T1.c,42 :: 		servo2=0;
	BCF         servo2+0, BitPos(servo2+0) 
;Servos_T1.c,43 :: 		servo3=0;
	BCF         servo3+0, BitPos(servo3+0) 
;Servos_T1.c,44 :: 		servo4=0;
	BCF         servo4+0, BitPos(servo4+0) 
;Servos_T1.c,45 :: 		servo5=0;
	BCF         servo5+0, BitPos(servo5+0) 
;Servos_T1.c,46 :: 		servo6=0;
	BCF         servo6+0, BitPos(servo6+0) 
;Servos_T1.c,47 :: 		servo7=0;
	BCF         servo7+0, BitPos(servo7+0) 
;Servos_T1.c,48 :: 		servo8=0;
	BCF         servo8+0, BitPos(servo8+0) 
;Servos_T1.c,52 :: 		T1CON=0;
	CLRF        T1CON+0 
;Servos_T1.c,54 :: 		T1CKPS1_bit=0;
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;Servos_T1.c,55 :: 		T1CKPS0_bit=0;
	BCF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;Servos_T1.c,57 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;Servos_T1.c,58 :: 		TMR1L=256;  //valor al azar para forzar la primera interrucion
	MOVLW       0
	MOVWF       TMR1L+0 
;Servos_T1.c,59 :: 		TMR1h=250;
	MOVLW       250
	MOVWF       TMR1H+0 
;Servos_T1.c,60 :: 		TMR1IE_bit=1;  //habilita interrupcion timer1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;Servos_T1.c,61 :: 		TMR1ON_bit=1;
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;Servos_T1.c,64 :: 		servos[0]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+0 
	MOVLW       226
	MOVWF       _servos+1 
;Servos_T1.c,65 :: 		servos[1]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+2 
	MOVLW       226
	MOVWF       _servos+3 
;Servos_T1.c,66 :: 		servos[2]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+4 
	MOVLW       226
	MOVWF       _servos+5 
;Servos_T1.c,67 :: 		servos[3]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+6 
	MOVLW       226
	MOVWF       _servos+7 
;Servos_T1.c,68 :: 		servos[4]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+8 
	MOVLW       226
	MOVWF       _servos+9 
;Servos_T1.c,69 :: 		servos[5]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+10 
	MOVLW       226
	MOVWF       _servos+11 
;Servos_T1.c,70 :: 		servos[6]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+12 
	MOVLW       226
	MOVWF       _servos+13 
;Servos_T1.c,71 :: 		servos[7]=tmr1_1_5ms;
	MOVLW       180
	MOVWF       _servos+14 
	MOVLW       226
	MOVWF       _servos+15 
;Servos_T1.c,73 :: 		}
L_end_init_servos:
	RETURN      0
; end of _init_servos

_servos_interrupcion:

;Servos_T1.c,75 :: 		void servos_interrupcion()
;Servos_T1.c,78 :: 		if (TMR1IF_bit==1)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_servos_interrupcion1
;Servos_T1.c,80 :: 		{        switch (estado_servos)
	GOTO        L_servos_interrupcion2
;Servos_T1.c,83 :: 		case hi_1:
L_servos_interrupcion4:
;Servos_T1.c,85 :: 		servo1=1;
	BSF         servo1+0, BitPos(servo1+0) 
;Servos_T1.c,86 :: 		int_tempo=servos[0];
	MOVF        _servos+0, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+1, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,87 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,88 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+0, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,89 :: 		estado_servos=lo_1;
	MOVLW       1
	MOVWF       _estado_servos+0 
;Servos_T1.c,90 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,92 :: 		case lo_1:
L_servos_interrupcion5:
;Servos_T1.c,94 :: 		servo1=0;
	BCF         servo1+0, BitPos(servo1+0) 
;Servos_T1.c,95 :: 		int_tempo=tmr1_periodo-servos[0];
	MOVF        _servos+0, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+1, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,96 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,97 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,98 :: 		estado_servos=hi_2;
	MOVLW       2
	MOVWF       _estado_servos+0 
;Servos_T1.c,99 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,102 :: 		case hi_2:
L_servos_interrupcion6:
;Servos_T1.c,104 :: 		servo2=1;
	BSF         servo2+0, BitPos(servo2+0) 
;Servos_T1.c,105 :: 		int_tempo=servos[1];
	MOVF        _servos+2, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+3, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,106 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+3, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,107 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+2, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,108 :: 		estado_servos=lo_2;
	MOVLW       3
	MOVWF       _estado_servos+0 
;Servos_T1.c,109 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,111 :: 		case lo_2:
L_servos_interrupcion7:
;Servos_T1.c,113 :: 		servo2=0;
	BCF         servo2+0, BitPos(servo2+0) 
;Servos_T1.c,114 :: 		int_tempo=tmr1_periodo-servos[1];
	MOVF        _servos+2, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+3, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,115 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,116 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,117 :: 		estado_servos=hi_3;
	MOVLW       4
	MOVWF       _estado_servos+0 
;Servos_T1.c,118 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,121 :: 		case hi_3:
L_servos_interrupcion8:
;Servos_T1.c,123 :: 		servo3=1;
	BSF         servo3+0, BitPos(servo3+0) 
;Servos_T1.c,124 :: 		int_tempo=servos[2];
	MOVF        _servos+4, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+5, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,125 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+5, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,126 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+4, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,127 :: 		estado_servos=lo_3;
	MOVLW       5
	MOVWF       _estado_servos+0 
;Servos_T1.c,128 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,130 :: 		case lo_3:
L_servos_interrupcion9:
;Servos_T1.c,132 :: 		servo3=0;
	BCF         servo3+0, BitPos(servo3+0) 
;Servos_T1.c,133 :: 		int_tempo=tmr1_periodo-servos[2];
	MOVF        _servos+4, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+5, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,134 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,135 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,137 :: 		estado_servos=hi_4;
	MOVLW       6
	MOVWF       _estado_servos+0 
;Servos_T1.c,138 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,141 :: 		case hi_4:
L_servos_interrupcion10:
;Servos_T1.c,143 :: 		servo4=1;
	BSF         servo4+0, BitPos(servo4+0) 
;Servos_T1.c,144 :: 		int_tempo=servos[3];
	MOVF        _servos+6, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+7, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,145 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+7, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,146 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+6, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,147 :: 		estado_servos=lo_4;
	MOVLW       7
	MOVWF       _estado_servos+0 
;Servos_T1.c,148 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,150 :: 		case lo_4:
L_servos_interrupcion11:
;Servos_T1.c,152 :: 		servo4=0;
	BCF         servo4+0, BitPos(servo4+0) 
;Servos_T1.c,153 :: 		int_tempo=tmr1_periodo-servos[3];
	MOVF        _servos+6, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+7, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,154 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,155 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,157 :: 		estado_servos=hi_5;
	MOVLW       8
	MOVWF       _estado_servos+0 
;Servos_T1.c,158 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,161 :: 		case hi_5:
L_servos_interrupcion12:
;Servos_T1.c,163 :: 		servo5=1;
	BSF         servo5+0, BitPos(servo5+0) 
;Servos_T1.c,164 :: 		int_tempo=servos[4];
	MOVF        _servos+8, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+9, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,165 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+9, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,166 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+8, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,167 :: 		estado_servos=lo_5;
	MOVLW       9
	MOVWF       _estado_servos+0 
;Servos_T1.c,168 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,170 :: 		case lo_5:
L_servos_interrupcion13:
;Servos_T1.c,172 :: 		servo5=0;
	BCF         servo5+0, BitPos(servo5+0) 
;Servos_T1.c,173 :: 		int_tempo=tmr1_periodo-servos[4];
	MOVF        _servos+8, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+9, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,174 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,175 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,176 :: 		estado_servos=hi_6;
	MOVLW       10
	MOVWF       _estado_servos+0 
;Servos_T1.c,177 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,180 :: 		case hi_6:
L_servos_interrupcion14:
;Servos_T1.c,182 :: 		servo6=1;
	BSF         servo6+0, BitPos(servo6+0) 
;Servos_T1.c,183 :: 		int_tempo=servos[5];
	MOVF        _servos+10, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+11, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,184 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+11, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,185 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+10, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,186 :: 		estado_servos=lo_6;
	MOVLW       11
	MOVWF       _estado_servos+0 
;Servos_T1.c,187 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,189 :: 		case lo_6:
L_servos_interrupcion15:
;Servos_T1.c,191 :: 		servo6=0;
	BCF         servo6+0, BitPos(servo6+0) 
;Servos_T1.c,192 :: 		int_tempo=tmr1_periodo-servos[5];
	MOVF        _servos+10, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+11, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,193 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,194 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,195 :: 		estado_servos=hi_7;
	MOVLW       12
	MOVWF       _estado_servos+0 
;Servos_T1.c,196 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,199 :: 		case hi_7:
L_servos_interrupcion16:
;Servos_T1.c,201 :: 		servo7=1;
	BSF         servo7+0, BitPos(servo7+0) 
;Servos_T1.c,202 :: 		int_tempo=servos[6];
	MOVF        _servos+12, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+13, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,203 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+13, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,204 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+12, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,205 :: 		estado_servos=lo_7;
	MOVLW       13
	MOVWF       _estado_servos+0 
;Servos_T1.c,206 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,208 :: 		case lo_7:
L_servos_interrupcion17:
;Servos_T1.c,210 :: 		servo7=0;
	BCF         servo7+0, BitPos(servo7+0) 
;Servos_T1.c,211 :: 		int_tempo=tmr1_periodo-servos[6];
	MOVF        _servos+12, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+13, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,212 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,213 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,214 :: 		estado_servos=hi_8;
	MOVLW       14
	MOVWF       _estado_servos+0 
;Servos_T1.c,215 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,218 :: 		case hi_8:
L_servos_interrupcion18:
;Servos_T1.c,220 :: 		servo8=1;
	BSF         servo8+0, BitPos(servo8+0) 
;Servos_T1.c,221 :: 		int_tempo=servos[7];
	MOVF        _servos+14, 0 
	MOVWF       _int_tempo+0 
	MOVF        _servos+15, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,222 :: 		tmr1h=hi(int_tempo);
	MOVF        _servos+15, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,223 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       _servos+14, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,224 :: 		estado_servos=lo_8;
	MOVLW       15
	MOVWF       _estado_servos+0 
;Servos_T1.c,225 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,227 :: 		case lo_8:
L_servos_interrupcion19:
;Servos_T1.c,229 :: 		servo8=0;
	BCF         servo8+0, BitPos(servo8+0) 
;Servos_T1.c,230 :: 		int_tempo=tmr1_periodo-servos[7];
	MOVF        _servos+14, 0 
	SUBLW       44
	MOVWF       R3 
	MOVF        _servos+15, 0 
	MOVWF       R4 
	MOVLW       207
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _int_tempo+0 
	MOVF        R4, 0 
	MOVWF       _int_tempo+1 
;Servos_T1.c,231 :: 		tmr1h=hi(int_tempo);
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       TMR1H+0 
;Servos_T1.c,232 :: 		tmr1l=lo(int_tempo);
	MOVLW       255
	ANDWF       R3, 0 
	MOVWF       TMR1L+0 
;Servos_T1.c,233 :: 		estado_servos=hi_1;
	CLRF        _estado_servos+0 
;Servos_T1.c,234 :: 		}break;
	GOTO        L_servos_interrupcion3
;Servos_T1.c,239 :: 		}//del switch
L_servos_interrupcion2:
	MOVF        _estado_servos+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion4
	MOVF        _estado_servos+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion5
	MOVF        _estado_servos+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion6
	MOVF        _estado_servos+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion7
	MOVF        _estado_servos+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion8
	MOVF        _estado_servos+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion9
	MOVF        _estado_servos+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion10
	MOVF        _estado_servos+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion11
	MOVF        _estado_servos+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion12
	MOVF        _estado_servos+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion13
	MOVF        _estado_servos+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion14
	MOVF        _estado_servos+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion15
	MOVF        _estado_servos+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion16
	MOVF        _estado_servos+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion17
	MOVF        _estado_servos+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion18
	MOVF        _estado_servos+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_servos_interrupcion19
L_servos_interrupcion3:
;Servos_T1.c,241 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;Servos_T1.c,244 :: 		}
L_servos_interrupcion1:
;Servos_T1.c,246 :: 		}
L_end_servos_interrupcion:
	RETURN      0
; end of _servos_interrupcion

_servo_valor:

;Servos_T1.c,249 :: 		void servo_valor(char servo_num,float servo_ang)
;Servos_T1.c,252 :: 		servo_tempo=(servo_ang+90.0)*_m+pwm_min;
	MOVF        FARG_servo_valor_servo_ang+0, 0 
	MOVWF       R0 
	MOVF        FARG_servo_valor_servo_ang+1, 0 
	MOVWF       R1 
	MOVF        FARG_servo_valor_servo_ang+2, 0 
	MOVWF       R2 
	MOVF        FARG_servo_valor_servo_ang+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        __m+0, 0 
	MOVWF       R4 
	MOVF        __m+1, 0 
	MOVWF       R5 
	MOVF        __m+2, 0 
	MOVWF       R6 
	MOVF        __m+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _pwm_min+0, 0 
	MOVWF       R4 
	MOVF        _pwm_min+1, 0 
	MOVWF       R5 
	MOVF        _pwm_min+2, 0 
	MOVWF       R6 
	MOVF        _pwm_min+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_tempo+0 
	MOVF        R1, 0 
	MOVWF       _servo_tempo+1 
	MOVF        R2, 0 
	MOVWF       _servo_tempo+2 
	MOVF        R3, 0 
	MOVWF       _servo_tempo+3 
;Servos_T1.c,253 :: 		servo_tempo =65536.0 -((cristal*servo_tempo)/4.0);
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       141
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       143
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_tempo+0 
	MOVF        R1, 0 
	MOVWF       _servo_tempo+1 
	MOVF        R2, 0 
	MOVWF       _servo_tempo+2 
	MOVF        R3, 0 
	MOVWF       _servo_tempo+3 
;Servos_T1.c,254 :: 		servos[servo_num-1]=(servo_tempo);
	DECF        FARG_servo_valor_servo_num+0, 0 
	MOVWF       R7 
	CLRF        R8 
	MOVLW       0
	SUBWFB      R8, 1 
	MOVF        R7, 0 
	MOVWF       R4 
	MOVF        R8, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       _servos+0
	ADDWF       R4, 0 
	MOVWF       FLOC__servo_valor+0 
	MOVLW       hi_addr(_servos+0)
	ADDWFC      R5, 0 
	MOVWF       FLOC__servo_valor+1 
	CALL        _double2word+0, 0
	MOVFF       FLOC__servo_valor+0, FSR1L+0
	MOVFF       FLOC__servo_valor+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;Servos_T1.c,256 :: 		}
L_end_servo_valor:
	RETURN      0
; end of _servo_valor
