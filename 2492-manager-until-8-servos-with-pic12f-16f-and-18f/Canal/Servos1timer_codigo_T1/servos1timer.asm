
_TImer0:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;servos1timer.c,24 :: 		void TImer0() iv 0x0004 ics ICS_AUTO
;servos1timer.c,26 :: 		servos_interrupcion();
	CALL       _servos_interrupcion+0
;servos1timer.c,27 :: 		}
L_end_TImer0:
L__TImer03:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _TImer0

_main:

;servos1timer.c,30 :: 		void main()
;servos1timer.c,34 :: 		init_servos(0.5,2.5);
	MOVLW      0
	MOVWF      FARG_init_servos_pwm_min+0
	MOVLW      0
	MOVWF      FARG_init_servos_pwm_min+1
	MOVLW      0
	MOVWF      FARG_init_servos_pwm_min+2
	MOVLW      126
	MOVWF      FARG_init_servos_pwm_min+3
	MOVLW      0
	MOVWF      FARG_init_servos_pwm_min+0
	MOVLW      0
	MOVWF      FARG_init_servos_pwm_min+1
	MOVLW      32
	MOVWF      FARG_init_servos_pwm_min+2
	MOVLW      128
	MOVWF      FARG_init_servos_pwm_min+3
	CALL       _init_servos+0
;servos1timer.c,35 :: 		GIE_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;servos1timer.c,36 :: 		while (1)
L_main0:
;servos1timer.c,40 :: 		servo_valor(1,0);
	MOVLW      1
	MOVWF      FARG_servo_valor_servo_num+0
	CLRF       FARG_servo_valor_servo_ang+0
	CLRF       FARG_servo_valor_servo_ang+1
	CLRF       FARG_servo_valor_servo_ang+2
	CLRF       FARG_servo_valor_servo_ang+3
	CALL       _servo_valor+0
;servos1timer.c,41 :: 		servo_valor(2,90);
	MOVLW      2
	MOVWF      FARG_servo_valor_servo_num+0
	MOVLW      0
	MOVWF      FARG_servo_valor_servo_ang+0
	MOVLW      0
	MOVWF      FARG_servo_valor_servo_ang+1
	MOVLW      52
	MOVWF      FARG_servo_valor_servo_ang+2
	MOVLW      133
	MOVWF      FARG_servo_valor_servo_ang+3
	CALL       _servo_valor+0
;servos1timer.c,45 :: 		}
	GOTO       L_main0
;servos1timer.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
