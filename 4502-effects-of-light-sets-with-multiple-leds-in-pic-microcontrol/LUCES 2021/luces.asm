
_saca:

;luces.c,16 :: 		void saca(unsigned long dato)
;luces.c,18 :: 		LEDS_L=Lo(dato);
	MOVF       FARG_saca_dato+0, 0
	MOVWF      PORTB+0
;luces.c,19 :: 		LEDS_M=Hi(dato);
	MOVF       FARG_saca_dato+1, 0
	MOVWF      PORTC+0
;luces.c,20 :: 		LEDS_H=Higher(dato);
	MOVF       FARG_saca_dato+2, 0
	MOVWF      PORTD+0
;luces.c,21 :: 		}
L_end_saca:
	RETURN
; end of _saca

_flash:

;luces.c,23 :: 		void flash(unsigned int velo)
;luces.c,26 :: 		salida=0;
	CLRF       _salida+0
	CLRF       _salida+1
	CLRF       _salida+2
	CLRF       _salida+3
;luces.c,27 :: 		saca(salida);
	CLRF       FARG_saca_dato+0
	CLRF       FARG_saca_dato+1
	CLRF       FARG_saca_dato+2
	CLRF       FARG_saca_dato+3
	CALL       _saca+0
;luces.c,28 :: 		VDelay_ms(velo);
	MOVF       FARG_flash_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_flash_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,29 :: 		salida=~salida;
	COMF       _salida+0, 0
	MOVWF      R0+0
	COMF       _salida+1, 0
	MOVWF      R0+1
	COMF       _salida+2, 0
	MOVWF      R0+2
	COMF       _salida+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,30 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,31 :: 		VDelay_ms(velo);
	MOVF       FARG_flash_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_flash_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,33 :: 		}
L_end_flash:
	RETURN
; end of _flash

_alternado:

;luces.c,35 :: 		void alternado(unsigned int velo)
;luces.c,38 :: 		salida=0xAAAAAA;
	MOVLW      170
	MOVWF      _salida+0
	MOVLW      170
	MOVWF      _salida+1
	MOVLW      170
	MOVWF      _salida+2
	MOVLW      0
	MOVWF      _salida+3
;luces.c,39 :: 		saca(salida);
	MOVLW      170
	MOVWF      FARG_saca_dato+0
	MOVLW      170
	MOVWF      FARG_saca_dato+1
	MOVLW      170
	MOVWF      FARG_saca_dato+2
	MOVLW      0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,40 :: 		VDelay_ms(velo);
	MOVF       FARG_alternado_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_alternado_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,41 :: 		salida=~salida;;
	COMF       _salida+0, 0
	MOVWF      R0+0
	COMF       _salida+1, 0
	MOVWF      R0+1
	COMF       _salida+2, 0
	MOVWF      R0+2
	COMF       _salida+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,42 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,43 :: 		VDelay_ms(velo);
	MOVF       FARG_alternado_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_alternado_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,45 :: 		}
L_end_alternado:
	RETURN
; end of _alternado

_policia:

;luces.c,47 :: 		void policia(unsigned int velo)
;luces.c,50 :: 		salida=0x000fff;
	MOVLW      255
	MOVWF      _salida+0
	MOVLW      15
	MOVWF      _salida+1
	CLRF       _salida+2
	CLRF       _salida+3
;luces.c,51 :: 		saca(salida);
	MOVLW      255
	MOVWF      FARG_saca_dato+0
	MOVLW      15
	MOVWF      FARG_saca_dato+1
	MOVLW      0
	MOVWF      FARG_saca_dato+2
	MOVLW      0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,52 :: 		VDelay_ms(velo);
	MOVF       FARG_policia_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_policia_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,53 :: 		salida=~salida;;
	COMF       _salida+0, 0
	MOVWF      R0+0
	COMF       _salida+1, 0
	MOVWF      R0+1
	COMF       _salida+2, 0
	MOVWF      R0+2
	COMF       _salida+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,54 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,55 :: 		VDelay_ms(velo);
	MOVF       FARG_policia_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_policia_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,57 :: 		}
L_end_policia:
	RETURN
; end of _policia

_derecha:

;luces.c,60 :: 		void derecha(unsigned int velo)
;luces.c,63 :: 		salida=0x000001;
	MOVLW      1
	MOVWF      _salida+0
	CLRF       _salida+1
	CLRF       _salida+2
	CLRF       _salida+3
;luces.c,64 :: 		saca(salida);
	MOVLW      1
	MOVWF      FARG_saca_dato+0
	MOVLW      0
	MOVWF      FARG_saca_dato+1
	MOVLW      0
	MOVWF      FARG_saca_dato+2
	MOVLW      0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,65 :: 		for (cuenta=0;cuenta<24;cuenta++)
	CLRF       derecha_cuenta_L0+0
L_derecha0:
	MOVLW      24
	SUBWF      derecha_cuenta_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_derecha1
;luces.c,67 :: 		VDelay_ms(velo);
	MOVF       FARG_derecha_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_derecha_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,68 :: 		salida=salida<<1L;
	MOVF       _salida+0, 0
	MOVWF      R0+0
	MOVF       _salida+1, 0
	MOVWF      R0+1
	MOVF       _salida+2, 0
	MOVWF      R0+2
	MOVF       _salida+3, 0
	MOVWF      R0+3
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,69 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,65 :: 		for (cuenta=0;cuenta<24;cuenta++)
	INCF       derecha_cuenta_L0+0, 1
;luces.c,70 :: 		}
	GOTO       L_derecha0
L_derecha1:
;luces.c,72 :: 		}
L_end_derecha:
	RETURN
; end of _derecha

_izquierda:

;luces.c,74 :: 		void izquierda(unsigned int velo)
;luces.c,77 :: 		salida=0x800000;// 1 el bit mas alto
	MOVLW      0
	MOVWF      _salida+0
	MOVLW      0
	MOVWF      _salida+1
	MOVLW      128
	MOVWF      _salida+2
	MOVLW      0
	MOVWF      _salida+3
;luces.c,78 :: 		saca(salida);
	MOVLW      0
	MOVWF      FARG_saca_dato+0
	MOVLW      0
	MOVWF      FARG_saca_dato+1
	MOVLW      128
	MOVWF      FARG_saca_dato+2
	MOVLW      0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,79 :: 		for (cuenta=0;cuenta<24;cuenta++)
	CLRF       izquierda_cuenta_L0+0
L_izquierda3:
	MOVLW      24
	SUBWF      izquierda_cuenta_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_izquierda4
;luces.c,81 :: 		VDelay_ms(velo);
	MOVF       FARG_izquierda_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_izquierda_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,82 :: 		salida=salida>>1L;
	MOVF       _salida+0, 0
	MOVWF      R0+0
	MOVF       _salida+1, 0
	MOVWF      R0+1
	MOVF       _salida+2, 0
	MOVWF      R0+2
	MOVF       _salida+3, 0
	MOVWF      R0+3
	RRF        R0+3, 1
	RRF        R0+2, 1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+3, 7
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,83 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,79 :: 		for (cuenta=0;cuenta<24;cuenta++)
	INCF       izquierda_cuenta_L0+0, 1
;luces.c,84 :: 		}
	GOTO       L_izquierda3
L_izquierda4:
;luces.c,86 :: 		}
L_end_izquierda:
	RETURN
; end of _izquierda

_acerca:

;luces.c,90 :: 		void acerca(unsigned int tiempo)
;luces.c,94 :: 		unsigned long dato1=0x800000,dato2=0x000001;
	MOVLW      0
	MOVWF      acerca_dato1_L0+0
	MOVLW      0
	MOVWF      acerca_dato1_L0+1
	MOVLW      128
	MOVWF      acerca_dato1_L0+2
	MOVLW      0
	MOVWF      acerca_dato1_L0+3
	MOVLW      1
	MOVWF      acerca_dato2_L0+0
	MOVLW      0
	MOVWF      acerca_dato2_L0+1
	MOVLW      0
	MOVWF      acerca_dato2_L0+2
	MOVLW      0
	MOVWF      acerca_dato2_L0+3
;luces.c,97 :: 		for (cuenta=0;cuenta<=12;cuenta++)
	CLRF       acerca_cuenta_L0+0
L_acerca6:
	MOVF       acerca_cuenta_L0+0, 0
	SUBLW      12
	BTFSS      STATUS+0, 0
	GOTO       L_acerca7
;luces.c,99 :: 		salida=dato1 | dato2;
	MOVF       acerca_dato2_L0+0, 0
	IORWF      acerca_dato1_L0+0, 0
	MOVWF      R0+0
	MOVF       acerca_dato2_L0+1, 0
	IORWF      acerca_dato1_L0+1, 0
	MOVWF      R0+1
	MOVF       acerca_dato2_L0+2, 0
	IORWF      acerca_dato1_L0+2, 0
	MOVWF      R0+2
	MOVF       acerca_dato2_L0+3, 0
	IORWF      acerca_dato1_L0+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,100 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,101 :: 		VDelay_ms(tiempo);
	MOVF       FARG_acerca_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_acerca_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,102 :: 		dato1=dato1>>1L;
	RRF        acerca_dato1_L0+3, 1
	RRF        acerca_dato1_L0+2, 1
	RRF        acerca_dato1_L0+1, 1
	RRF        acerca_dato1_L0+0, 1
	BCF        acerca_dato1_L0+3, 7
;luces.c,103 :: 		dato2=dato2<<1L;
	RLF        acerca_dato2_L0+0, 1
	RLF        acerca_dato2_L0+1, 1
	RLF        acerca_dato2_L0+2, 1
	RLF        acerca_dato2_L0+3, 1
	BCF        acerca_dato2_L0+0, 0
;luces.c,97 :: 		for (cuenta=0;cuenta<=12;cuenta++)
	INCF       acerca_cuenta_L0+0, 1
;luces.c,105 :: 		}
	GOTO       L_acerca6
L_acerca7:
;luces.c,107 :: 		}
L_end_acerca:
	RETURN
; end of _acerca

_aleja:

;luces.c,110 :: 		void aleja(unsigned int tiempo)
;luces.c,113 :: 		unsigned long dato1=0x001000,dato2=0x000800;
	MOVLW      0
	MOVWF      aleja_dato1_L0+0
	MOVLW      16
	MOVWF      aleja_dato1_L0+1
	MOVLW      0
	MOVWF      aleja_dato1_L0+2
	MOVLW      0
	MOVWF      aleja_dato1_L0+3
	MOVLW      0
	MOVWF      aleja_dato2_L0+0
	MOVLW      8
	MOVWF      aleja_dato2_L0+1
	MOVLW      0
	MOVWF      aleja_dato2_L0+2
	MOVLW      0
	MOVWF      aleja_dato2_L0+3
;luces.c,114 :: 		for (cuenta=0;cuenta<=12;cuenta++)
	CLRF       aleja_cuenta_L0+0
L_aleja9:
	MOVF       aleja_cuenta_L0+0, 0
	SUBLW      12
	BTFSS      STATUS+0, 0
	GOTO       L_aleja10
;luces.c,116 :: 		salida=dato1 | dato2;
	MOVF       aleja_dato2_L0+0, 0
	IORWF      aleja_dato1_L0+0, 0
	MOVWF      R0+0
	MOVF       aleja_dato2_L0+1, 0
	IORWF      aleja_dato1_L0+1, 0
	MOVWF      R0+1
	MOVF       aleja_dato2_L0+2, 0
	IORWF      aleja_dato1_L0+2, 0
	MOVWF      R0+2
	MOVF       aleja_dato2_L0+3, 0
	IORWF      aleja_dato1_L0+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,117 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,118 :: 		VDelay_ms(tiempo);
	MOVF       FARG_aleja_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_aleja_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,119 :: 		dato1=dato1<<1L;
	RLF        aleja_dato1_L0+0, 1
	RLF        aleja_dato1_L0+1, 1
	RLF        aleja_dato1_L0+2, 1
	RLF        aleja_dato1_L0+3, 1
	BCF        aleja_dato1_L0+0, 0
;luces.c,120 :: 		dato2=dato2>>1L;
	RRF        aleja_dato2_L0+3, 1
	RRF        aleja_dato2_L0+2, 1
	RRF        aleja_dato2_L0+1, 1
	RRF        aleja_dato2_L0+0, 1
	BCF        aleja_dato2_L0+3, 7
;luces.c,114 :: 		for (cuenta=0;cuenta<=12;cuenta++)
	INCF       aleja_cuenta_L0+0, 1
;luces.c,121 :: 		}
	GOTO       L_aleja9
L_aleja10:
;luces.c,122 :: 		}
L_end_aleja:
	RETURN
; end of _aleja

_auto_fantastico:

;luces.c,126 :: 		void   auto_fantastico(unsigned int tiempo)
;luces.c,129 :: 		unsigned long dato1=0x800000,dato2=0x000001;
	MOVLW      0
	MOVWF      auto_fantastico_dato1_L0+0
	MOVLW      0
	MOVWF      auto_fantastico_dato1_L0+1
	MOVLW      128
	MOVWF      auto_fantastico_dato1_L0+2
	MOVLW      0
	MOVWF      auto_fantastico_dato1_L0+3
	MOVLW      1
	MOVWF      auto_fantastico_dato2_L0+0
	MOVLW      0
	MOVWF      auto_fantastico_dato2_L0+1
	MOVLW      0
	MOVWF      auto_fantastico_dato2_L0+2
	MOVLW      0
	MOVWF      auto_fantastico_dato2_L0+3
;luces.c,130 :: 		for (cuenta=0;cuenta<=24;cuenta++)
	CLRF       auto_fantastico_cuenta_L0+0
L_auto_fantastico12:
	MOVF       auto_fantastico_cuenta_L0+0, 0
	SUBLW      24
	BTFSS      STATUS+0, 0
	GOTO       L_auto_fantastico13
;luces.c,132 :: 		salida=dato1 | dato2;
	MOVF       auto_fantastico_dato2_L0+0, 0
	IORWF      auto_fantastico_dato1_L0+0, 0
	MOVWF      R0+0
	MOVF       auto_fantastico_dato2_L0+1, 0
	IORWF      auto_fantastico_dato1_L0+1, 0
	MOVWF      R0+1
	MOVF       auto_fantastico_dato2_L0+2, 0
	IORWF      auto_fantastico_dato1_L0+2, 0
	MOVWF      R0+2
	MOVF       auto_fantastico_dato2_L0+3, 0
	IORWF      auto_fantastico_dato1_L0+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,133 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,134 :: 		VDelay_ms(tiempo);
	MOVF       FARG_auto_fantastico_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_auto_fantastico_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,135 :: 		dato1=dato1>>1L;
	RRF        auto_fantastico_dato1_L0+3, 1
	RRF        auto_fantastico_dato1_L0+2, 1
	RRF        auto_fantastico_dato1_L0+1, 1
	RRF        auto_fantastico_dato1_L0+0, 1
	BCF        auto_fantastico_dato1_L0+3, 7
;luces.c,136 :: 		dato2=dato2<<1L;
	RLF        auto_fantastico_dato2_L0+0, 1
	RLF        auto_fantastico_dato2_L0+1, 1
	RLF        auto_fantastico_dato2_L0+2, 1
	RLF        auto_fantastico_dato2_L0+3, 1
	BCF        auto_fantastico_dato2_L0+0, 0
;luces.c,130 :: 		for (cuenta=0;cuenta<=24;cuenta++)
	INCF       auto_fantastico_cuenta_L0+0, 1
;luces.c,137 :: 		}
	GOTO       L_auto_fantastico12
L_auto_fantastico13:
;luces.c,139 :: 		}
L_end_auto_fantastico:
	RETURN
; end of _auto_fantastico

_derecha_on:

;luces.c,142 :: 		void derecha_on(unsigned int velo)
;luces.c,146 :: 		salida=0x000001;
	MOVLW      1
	MOVWF      _salida+0
	CLRF       _salida+1
	CLRF       _salida+2
	CLRF       _salida+3
;luces.c,147 :: 		saca(salida);
	MOVLW      1
	MOVWF      FARG_saca_dato+0
	MOVLW      0
	MOVWF      FARG_saca_dato+1
	MOVLW      0
	MOVWF      FARG_saca_dato+2
	MOVLW      0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,148 :: 		for (cuenta=0;cuenta<24;cuenta++)
	CLRF       derecha_on_cuenta_L0+0
L_derecha_on15:
	MOVLW      24
	SUBWF      derecha_on_cuenta_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_derecha_on16
;luces.c,150 :: 		VDelay_ms(velo);
	MOVF       FARG_derecha_on_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_derecha_on_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,151 :: 		salida=(salida<<1)+1;
	MOVF       _salida+0, 0
	MOVWF      R4+0
	MOVF       _salida+1, 0
	MOVWF      R4+1
	MOVF       _salida+2, 0
	MOVWF      R4+2
	MOVF       _salida+3, 0
	MOVWF      R4+3
	RLF        R4+0, 1
	RLF        R4+1, 1
	RLF        R4+2, 1
	RLF        R4+3, 1
	BCF        R4+0, 0
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,152 :: 		saca(salida);
	MOVF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,148 :: 		for (cuenta=0;cuenta<24;cuenta++)
	INCF       derecha_on_cuenta_L0+0, 1
;luces.c,153 :: 		}
	GOTO       L_derecha_on15
L_derecha_on16:
;luces.c,155 :: 		}
L_end_derecha_on:
	RETURN
; end of _derecha_on

_izquierda_on:

;luces.c,158 :: 		void izquierda_on(unsigned int velo)
;luces.c,161 :: 		unsigned long base=0x1;
	MOVLW      1
	MOVWF      izquierda_on_base_L0+0
	MOVLW      0
	MOVWF      izquierda_on_base_L0+1
	MOVLW      0
	MOVWF      izquierda_on_base_L0+2
	MOVLW      0
	MOVWF      izquierda_on_base_L0+3
;luces.c,162 :: 		salida=0x800000;// 1 el bit mas alto
	MOVLW      0
	MOVWF      _salida+0
	MOVLW      0
	MOVWF      _salida+1
	MOVLW      128
	MOVWF      _salida+2
	MOVLW      0
	MOVWF      _salida+3
;luces.c,163 :: 		saca(salida);
	MOVLW      0
	MOVWF      FARG_saca_dato+0
	MOVLW      0
	MOVWF      FARG_saca_dato+1
	MOVLW      128
	MOVWF      FARG_saca_dato+2
	MOVLW      0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,164 :: 		for (cuenta=23;cuenta>=0;cuenta--)
	MOVLW      23
	MOVWF      izquierda_on_cuenta_L0+0
L_izquierda_on18:
	MOVLW      128
	XORWF      izquierda_on_cuenta_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_izquierda_on19
;luces.c,166 :: 		VDelay_ms(velo);
	MOVF       FARG_izquierda_on_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_izquierda_on_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,167 :: 		base=(base<<1)+1;
	MOVF       izquierda_on_base_L0+0, 0
	MOVWF      R0+0
	MOVF       izquierda_on_base_L0+1, 0
	MOVWF      R0+1
	MOVF       izquierda_on_base_L0+2, 0
	MOVWF      R0+2
	MOVF       izquierda_on_base_L0+3, 0
	MOVWF      R0+3
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      R9+0
	MOVF       R0+1, 0
	MOVWF      R9+1
	MOVF       R0+2, 0
	MOVWF      R9+2
	MOVF       R0+3, 0
	MOVWF      R9+3
	INCF       R9+0, 1
	BTFSC      STATUS+0, 2
	INCF       R9+1, 1
	BTFSC      STATUS+0, 2
	INCF       R9+2, 1
	BTFSC      STATUS+0, 2
	INCF       R9+3, 1
	MOVF       R9+0, 0
	MOVWF      izquierda_on_base_L0+0
	MOVF       R9+1, 0
	MOVWF      izquierda_on_base_L0+1
	MOVF       R9+2, 0
	MOVWF      izquierda_on_base_L0+2
	MOVF       R9+3, 0
	MOVWF      izquierda_on_base_L0+3
;luces.c,168 :: 		salida=(salida>>1);
	MOVF       _salida+0, 0
	MOVWF      R5+0
	MOVF       _salida+1, 0
	MOVWF      R5+1
	MOVF       _salida+2, 0
	MOVWF      R5+2
	MOVF       _salida+3, 0
	MOVWF      R5+3
	RRF        R5+3, 1
	RRF        R5+2, 1
	RRF        R5+1, 1
	RRF        R5+0, 1
	BCF        R5+3, 7
	MOVF       R5+0, 0
	MOVWF      _salida+0
	MOVF       R5+1, 0
	MOVWF      _salida+1
	MOVF       R5+2, 0
	MOVWF      _salida+2
	MOVF       R5+3, 0
	MOVWF      _salida+3
;luces.c,169 :: 		saca(salida | base<<(cuenta-1));
	MOVLW      1
	SUBWF      izquierda_on_cuenta_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      0
	BTFSC      izquierda_on_cuenta_L0+0, 7
	MOVLW      255
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R9+0, 0
	MOVWF      R0+0
	MOVF       R9+1, 0
	MOVWF      R0+1
	MOVF       R9+2, 0
	MOVWF      R0+2
	MOVF       R9+3, 0
	MOVWF      R0+3
	MOVF       R4+0, 0
L__izquierda_on55:
	BTFSC      STATUS+0, 2
	GOTO       L__izquierda_on56
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__izquierda_on55
L__izquierda_on56:
	MOVF       R0+0, 0
	IORWF      R5+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	IORWF      R5+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	IORWF      R5+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	IORWF      R5+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,164 :: 		for (cuenta=23;cuenta>=0;cuenta--)
	DECF       izquierda_on_cuenta_L0+0, 1
;luces.c,170 :: 		}
	GOTO       L_izquierda_on18
L_izquierda_on19:
;luces.c,171 :: 		}
L_end_izquierda_on:
	RETURN
; end of _izquierda_on

_derecha_off:

;luces.c,174 :: 		void derecha_off(unsigned int velo)
;luces.c,178 :: 		salida=0x000001;
	MOVLW      1
	MOVWF      _salida+0
	CLRF       _salida+1
	CLRF       _salida+2
	CLRF       _salida+3
;luces.c,179 :: 		saca(0xffffff);
	MOVLW      255
	MOVWF      FARG_saca_dato+0
	MOVLW      255
	MOVWF      FARG_saca_dato+1
	MOVLW      255
	MOVWF      FARG_saca_dato+2
	MOVLW      0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,180 :: 		for (cuenta=0;cuenta<24;cuenta++)
	CLRF       derecha_off_cuenta_L0+0
L_derecha_off21:
	MOVLW      24
	SUBWF      derecha_off_cuenta_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_derecha_off22
;luces.c,182 :: 		VDelay_ms(velo);
	MOVF       FARG_derecha_off_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_derecha_off_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,183 :: 		salida=(salida<<1)+1;
	MOVF       _salida+0, 0
	MOVWF      R4+0
	MOVF       _salida+1, 0
	MOVWF      R4+1
	MOVF       _salida+2, 0
	MOVWF      R4+2
	MOVF       _salida+3, 0
	MOVWF      R4+3
	RLF        R4+0, 1
	RLF        R4+1, 1
	RLF        R4+2, 1
	RLF        R4+3, 1
	BCF        R4+0, 0
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _salida+0
	MOVF       R0+1, 0
	MOVWF      _salida+1
	MOVF       R0+2, 0
	MOVWF      _salida+2
	MOVF       R0+3, 0
	MOVWF      _salida+3
;luces.c,184 :: 		saca(~salida);
	COMF       R0+0, 0
	MOVWF      FARG_saca_dato+0
	COMF       R0+1, 0
	MOVWF      FARG_saca_dato+1
	COMF       R0+2, 0
	MOVWF      FARG_saca_dato+2
	COMF       R0+3, 0
	MOVWF      FARG_saca_dato+3
	CALL       _saca+0
;luces.c,180 :: 		for (cuenta=0;cuenta<24;cuenta++)
	INCF       derecha_off_cuenta_L0+0, 1
;luces.c,185 :: 		}
	GOTO       L_derecha_off21
L_derecha_off22:
;luces.c,187 :: 		}
L_end_derecha_off:
	RETURN
; end of _derecha_off

_izquierda_off:

;luces.c,190 :: 		void izquierda_off(unsigned int velo)
;luces.c,193 :: 		unsigned long base=0x1;
	MOVLW      1
	MOVWF      izquierda_off_base_L0+0
	MOVLW      0
	MOVWF      izquierda_off_base_L0+1
	MOVLW      0
	MOVWF      izquierda_off_base_L0+2
	MOVLW      0
	MOVWF      izquierda_off_base_L0+3
;luces.c,194 :: 		salida=0x800000;// 1 el bit mas alto
	MOVLW      0
	MOVWF      _salida+0
	MOVLW      0
	MOVWF      _salida+1
	MOVLW      128
	MOVWF      _salida+2
	MOVLW      0
	MOVWF      _salida+3
;luces.c,195 :: 		for (cuenta=23;cuenta>=0;cuenta--)
	MOVLW      23
	MOVWF      izquierda_off_cuenta_L0+0
L_izquierda_off24:
	MOVLW      128
	XORWF      izquierda_off_cuenta_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_izquierda_off25
;luces.c,197 :: 		VDelay_ms(velo);
	MOVF       FARG_izquierda_off_velo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_izquierda_off_velo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,198 :: 		base=(base<<1)+1;
	MOVF       izquierda_off_base_L0+0, 0
	MOVWF      R0+0
	MOVF       izquierda_off_base_L0+1, 0
	MOVWF      R0+1
	MOVF       izquierda_off_base_L0+2, 0
	MOVWF      R0+2
	MOVF       izquierda_off_base_L0+3, 0
	MOVWF      R0+3
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      R9+0
	MOVF       R0+1, 0
	MOVWF      R9+1
	MOVF       R0+2, 0
	MOVWF      R9+2
	MOVF       R0+3, 0
	MOVWF      R9+3
	INCF       R9+0, 1
	BTFSC      STATUS+0, 2
	INCF       R9+1, 1
	BTFSC      STATUS+0, 2
	INCF       R9+2, 1
	BTFSC      STATUS+0, 2
	INCF       R9+3, 1
	MOVF       R9+0, 0
	MOVWF      izquierda_off_base_L0+0
	MOVF       R9+1, 0
	MOVWF      izquierda_off_base_L0+1
	MOVF       R9+2, 0
	MOVWF      izquierda_off_base_L0+2
	MOVF       R9+3, 0
	MOVWF      izquierda_off_base_L0+3
;luces.c,199 :: 		salida=(salida>>1);
	MOVF       _salida+0, 0
	MOVWF      R5+0
	MOVF       _salida+1, 0
	MOVWF      R5+1
	MOVF       _salida+2, 0
	MOVWF      R5+2
	MOVF       _salida+3, 0
	MOVWF      R5+3
	RRF        R5+3, 1
	RRF        R5+2, 1
	RRF        R5+1, 1
	RRF        R5+0, 1
	BCF        R5+3, 7
	MOVF       R5+0, 0
	MOVWF      _salida+0
	MOVF       R5+1, 0
	MOVWF      _salida+1
	MOVF       R5+2, 0
	MOVWF      _salida+2
	MOVF       R5+3, 0
	MOVWF      _salida+3
;luces.c,200 :: 		saca(~(salida | base<<(cuenta-1)));
	MOVLW      1
	SUBWF      izquierda_off_cuenta_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      0
	BTFSC      izquierda_off_cuenta_L0+0, 7
	MOVLW      255
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R9+0, 0
	MOVWF      R0+0
	MOVF       R9+1, 0
	MOVWF      R0+1
	MOVF       R9+2, 0
	MOVWF      R0+2
	MOVF       R9+3, 0
	MOVWF      R0+3
	MOVF       R4+0, 0
L__izquierda_off59:
	BTFSC      STATUS+0, 2
	GOTO       L__izquierda_off60
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__izquierda_off59
L__izquierda_off60:
	MOVF       R0+0, 0
	IORWF      R5+0, 0
	MOVWF      FARG_saca_dato+0
	MOVF       R0+1, 0
	IORWF      R5+1, 0
	MOVWF      FARG_saca_dato+1
	MOVF       R0+2, 0
	IORWF      R5+2, 0
	MOVWF      FARG_saca_dato+2
	MOVF       R0+3, 0
	IORWF      R5+3, 0
	MOVWF      FARG_saca_dato+3
	COMF       FARG_saca_dato+0, 1
	COMF       FARG_saca_dato+1, 1
	COMF       FARG_saca_dato+2, 1
	COMF       FARG_saca_dato+3, 1
	CALL       _saca+0
;luces.c,195 :: 		for (cuenta=23;cuenta>=0;cuenta--)
	DECF       izquierda_off_cuenta_L0+0, 1
;luces.c,201 :: 		}
	GOTO       L_izquierda_off24
L_izquierda_off25:
;luces.c,202 :: 		}
L_end_izquierda_off:
	RETURN
; end of _izquierda_off

_InitTimer1:

;luces.c,209 :: 		void InitTimer1(){
;luces.c,210 :: 		T1CON	 = 0x31;
	MOVLW      49
	MOVWF      T1CON+0
;luces.c,211 :: 		TMR1IF_bit	 = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;luces.c,212 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;luces.c,213 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;luces.c,214 :: 		TMR1IE_bit	 = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;luces.c,215 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;luces.c,216 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;luces.c,218 :: 		void Interrupt(){
;luces.c,219 :: 		if (TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt27
;luces.c,220 :: 		TMR1IE_bit=0;
	BCF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;luces.c,222 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;luces.c,223 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;luces.c,224 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;luces.c,226 :: 		if (sw==0) efecto++;
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_Interrupt28
	INCF       _efecto+0, 1
L_Interrupt28:
;luces.c,227 :: 		if  (efecto>=max_efect) efecto=0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt64
	MOVLW      8
	SUBWF      _efecto+0, 0
L__Interrupt64:
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt29
	CLRF       _efecto+0
L_Interrupt29:
;luces.c,229 :: 		TMR1IE_bit=1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;luces.c,232 :: 		}
L_Interrupt27:
;luces.c,233 :: 		}
L_end_Interrupt:
L__Interrupt63:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;luces.c,237 :: 		void main()
;luces.c,241 :: 		ADC_Init();
	CALL       _ADC_Init+0
;luces.c,243 :: 		ADCON1=ADCON1 |  0b1110;// an0 digital
	MOVLW      14
	IORWF      ADCON1+0, 1
;luces.c,245 :: 		TRISA0_bit=1;    //ENTRADA VELOCIDAD
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;luces.c,246 :: 		TRISA1_bit=1;    //ENTRADA EFECTO
	BSF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;luces.c,247 :: 		TRISB=TRISC=TRISD=0;   // SALIDA LED
	CLRF       TRISD+0
	MOVF       TRISD+0, 0
	MOVWF      TRISC+0
	MOVF       TRISC+0, 0
	MOVWF      TRISB+0
;luces.c,248 :: 		InitTimer1();// inicia el imer a 100 ms para escanear el suiche
	CALL       _InitTimer1+0
;luces.c,250 :: 		PORTB=PORTC=PORTD=0;
	CLRF       PORTD+0
	MOVF       PORTD+0, 0
	MOVWF      PORTC+0
	MOVF       PORTC+0, 0
	MOVWF      PORTB+0
;luces.c,252 :: 		while(1)
L_main30:
;luces.c,254 :: 		codigo=ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _codigo+0
	MOVF       R0+1, 0
	MOVWF      _codigo+1
;luces.c,255 :: 		retardo=codigo*300.0/1023.0;  //remapea la salida de 80 a 600ms
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      22
	MOVWF      R4+2
	MOVLW      135
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
	MOVWF      _retardo+0
	MOVF       R0+1, 0
	MOVWF      _retardo+1
;luces.c,260 :: 		switch (efecto)
	GOTO       L_main32
;luces.c,263 :: 		case 0:
L_main34:
;luces.c,265 :: 		derecha_on(100);
	MOVLW      100
	MOVWF      FARG_derecha_on_velo+0
	MOVLW      0
	MOVWF      FARG_derecha_on_velo+1
	CALL       _derecha_on+0
;luces.c,266 :: 		izquierda_off(100);
	MOVLW      100
	MOVWF      FARG_izquierda_off_velo+0
	MOVLW      0
	MOVWF      FARG_izquierda_off_velo+1
	CALL       _izquierda_off+0
;luces.c,267 :: 		izquierda_on(100);
	MOVLW      100
	MOVWF      FARG_izquierda_on_velo+0
	MOVLW      0
	MOVWF      FARG_izquierda_on_velo+1
	CALL       _izquierda_on+0
;luces.c,268 :: 		derecha_off(100);
	MOVLW      100
	MOVWF      FARG_derecha_off_velo+0
	MOVLW      0
	MOVWF      FARG_derecha_off_velo+1
	CALL       _derecha_off+0
;luces.c,270 :: 		break;
	GOTO       L_main33
;luces.c,273 :: 		case 1:
L_main35:
;luces.c,274 :: 		alternado(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_alternado_velo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_alternado_velo+1
	CALL       _alternado+0
;luces.c,276 :: 		break;
	GOTO       L_main33
;luces.c,279 :: 		case 2:
L_main36:
;luces.c,280 :: 		policia(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_policia_velo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_policia_velo+1
	CALL       _policia+0
;luces.c,282 :: 		break;
	GOTO       L_main33
;luces.c,285 :: 		case 3:
L_main37:
;luces.c,286 :: 		derecha(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_derecha_velo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_derecha_velo+1
	CALL       _derecha+0
;luces.c,289 :: 		break;
	GOTO       L_main33
;luces.c,293 :: 		case 4:
L_main38:
;luces.c,294 :: 		izquierda(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_izquierda_velo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_izquierda_velo+1
	CALL       _izquierda+0
;luces.c,295 :: 		break;
	GOTO       L_main33
;luces.c,299 :: 		case 5:
L_main39:
;luces.c,300 :: 		acerca(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_acerca_tiempo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_acerca_tiempo+1
	CALL       _acerca+0
;luces.c,301 :: 		break;
	GOTO       L_main33
;luces.c,305 :: 		case 6:
L_main40:
;luces.c,306 :: 		aleja(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_aleja_tiempo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_aleja_tiempo+1
	CALL       _aleja+0
;luces.c,307 :: 		break;
	GOTO       L_main33
;luces.c,311 :: 		case 7:
L_main41:
;luces.c,312 :: 		auto_fantastico(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_auto_fantastico_tiempo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_auto_fantastico_tiempo+1
	CALL       _auto_fantastico+0
;luces.c,313 :: 		break;
	GOTO       L_main33
;luces.c,319 :: 		case 8:
L_main42:
;luces.c,320 :: 		derecha(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_derecha_velo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_derecha_velo+1
	CALL       _derecha+0
;luces.c,321 :: 		izquierda(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_izquierda_velo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_izquierda_velo+1
	CALL       _izquierda+0
;luces.c,322 :: 		flash(retardo);
	MOVF       _retardo+0, 0
	MOVWF      FARG_flash_velo+0
	MOVF       _retardo+1, 0
	MOVWF      FARG_flash_velo+1
	CALL       _flash+0
;luces.c,323 :: 		break;
	GOTO       L_main33
;luces.c,327 :: 		default :
L_main43:
;luces.c,328 :: 		break;
	GOTO       L_main33
;luces.c,332 :: 		}
L_main32:
	MOVF       _efecto+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main34
	MOVF       _efecto+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _efecto+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main36
	MOVF       _efecto+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _efecto+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVF       _efecto+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main39
	MOVF       _efecto+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main40
	MOVF       _efecto+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main41
	MOVF       _efecto+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main42
	GOTO       L_main43
L_main33:
;luces.c,336 :: 		}
	GOTO       L_main30
;luces.c,340 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
