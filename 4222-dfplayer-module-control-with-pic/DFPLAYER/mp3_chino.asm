
_init_mp3:

;mp3_chino.c,65 :: 		void init_mp3()
;mp3_chino.c,68 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;mp3_chino.c,69 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_init_mp30:
	DECFSZ     R13+0, 1
	GOTO       L_init_mp30
	DECFSZ     R12+0, 1
	GOTO       L_init_mp30
	DECFSZ     R11+0, 1
	GOTO       L_init_mp30
	NOP
	NOP
;mp3_chino.c,70 :: 		}
L_end_init_mp3:
	RETURN
; end of _init_mp3

_calula_checksum:

;mp3_chino.c,72 :: 		void calula_checksum()
;mp3_chino.c,74 :: 		checksum=0;
	CLRF       _checksum+0
	CLRF       _checksum+1
;mp3_chino.c,75 :: 		checksum=version+largo+comando+eco+hi(parametro)+lo(parametro);
	MOVF       _comando+0, 0
	ADDLW      5
	MOVWF      R0+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       _parametro+1, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _parametro+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _checksum+0
	MOVF       R0+1, 0
	MOVWF      _checksum+1
;mp3_chino.c,76 :: 		checksum=-checksum;
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      _checksum+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _checksum+1
	SUBWF      _checksum+1, 1
;mp3_chino.c,77 :: 		}
L_end_calula_checksum:
	RETURN
; end of _calula_checksum

_manda_mp3:

;mp3_chino.c,80 :: 		void manda_mp3()
;mp3_chino.c,82 :: 		UART1_Write(inicio);
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,83 :: 		UART1_Write(version);
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,84 :: 		UART1_Write(largo);
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,85 :: 		UART1_Write(comando);
	MOVF       _comando+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,86 :: 		UART1_Write(eco);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,87 :: 		UART1_Write(hi(parametro));
	MOVF       _parametro+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,88 :: 		UART1_Write(lo(parametro));
	MOVF       _parametro+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,89 :: 		UART1_Write(hi(checksum));
	MOVF       _checksum+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,90 :: 		UART1_Write(lo(checksum));
	MOVF       _checksum+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,91 :: 		UART1_Write(fin);
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mp3_chino.c,92 :: 		parametro=0;
	CLRF       _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,93 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_manda_mp31:
	DECFSZ     R13+0, 1
	GOTO       L_manda_mp31
	DECFSZ     R12+0, 1
	GOTO       L_manda_mp31
	NOP
	NOP
;mp3_chino.c,94 :: 		}
L_end_manda_mp3:
	RETURN
; end of _manda_mp3

_mp3_next:

;mp3_chino.c,96 :: 		void mp3_next()
;mp3_chino.c,98 :: 		comando=next;
	MOVLW      1
	MOVWF      _comando+0
;mp3_chino.c,99 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,100 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,101 :: 		}
L_end_mp3_next:
	RETURN
; end of _mp3_next

_mp3_previo:

;mp3_chino.c,103 :: 		void mp3_previo()
;mp3_chino.c,105 :: 		comando=previus;
	MOVLW      2
	MOVWF      _comando+0
;mp3_chino.c,106 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,107 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,108 :: 		}
L_end_mp3_previo:
	RETURN
; end of _mp3_previo

_mp3_play_x:

;mp3_chino.c,110 :: 		void mp3_play_x(unsigned int cancion)
;mp3_chino.c,112 :: 		comando=archivo;
	MOVLW      3
	MOVWF      _comando+0
;mp3_chino.c,113 :: 		parametro=cancion;
	MOVF       FARG_mp3_play_x_cancion+0, 0
	MOVWF      _parametro+0
	MOVF       FARG_mp3_play_x_cancion+1, 0
	MOVWF      _parametro+1
;mp3_chino.c,114 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,115 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,116 :: 		}
L_end_mp3_play_x:
	RETURN
; end of _mp3_play_x

_mp3_volumen_sube:

;mp3_chino.c,118 :: 		void mp3_volumen_sube()
;mp3_chino.c,120 :: 		comando=volumen_sub;
	MOVLW      4
	MOVWF      _comando+0
;mp3_chino.c,121 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,122 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,123 :: 		}
L_end_mp3_volumen_sube:
	RETURN
; end of _mp3_volumen_sube

_mp3_volumen_baja:

;mp3_chino.c,125 :: 		void mp3_volumen_baja()
;mp3_chino.c,127 :: 		comando=volumen_baj;
	MOVLW      5
	MOVWF      _comando+0
;mp3_chino.c,128 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,129 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,130 :: 		}
L_end_mp3_volumen_baja:
	RETURN
; end of _mp3_volumen_baja

_mp3_volumen_x:

;mp3_chino.c,132 :: 		void mp3_volumen_x(unsigned char vol)
;mp3_chino.c,134 :: 		comando=volumen;
	MOVLW      6
	MOVWF      _comando+0
;mp3_chino.c,135 :: 		parametro=vol;
	MOVF       FARG_mp3_volumen_x_vol+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,136 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,137 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,138 :: 		}
L_end_mp3_volumen_x:
	RETURN
; end of _mp3_volumen_x

_mp3_equializa:

;mp3_chino.c,140 :: 		void mp3_equializa(unsigned char equal)
;mp3_chino.c,142 :: 		comando=equializa;
	MOVLW      7
	MOVWF      _comando+0
;mp3_chino.c,143 :: 		parametro=equal;
	MOVF       FARG_mp3_equializa_equal+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,144 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,145 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,146 :: 		}
L_end_mp3_equializa:
	RETURN
; end of _mp3_equializa

_mp3_play_mode:

;mp3_chino.c,148 :: 		void mp3_play_mode(unsigned char como)
;mp3_chino.c,150 :: 		comando=repetir;
	MOVLW      8
	MOVWF      _comando+0
;mp3_chino.c,151 :: 		parametro=como;
	MOVF       FARG_mp3_play_mode_como+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,152 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,153 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,154 :: 		}
L_end_mp3_play_mode:
	RETURN
; end of _mp3_play_mode

_mp3_fuente:

;mp3_chino.c,156 :: 		void mp3_fuente(unsigned char como)
;mp3_chino.c,158 :: 		comando=fuente;
	MOVLW      9
	MOVWF      _comando+0
;mp3_chino.c,159 :: 		parametro=como;
	MOVF       FARG_mp3_fuente_como+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,160 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,161 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,162 :: 		}
L_end_mp3_fuente:
	RETURN
; end of _mp3_fuente

_mp3_modo_off:

;mp3_chino.c,164 :: 		void mp3_modo_off()
;mp3_chino.c,166 :: 		comando=modo_on;
	MOVLW      10
	MOVWF      _comando+0
;mp3_chino.c,167 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,168 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,169 :: 		}
L_end_mp3_modo_off:
	RETURN
; end of _mp3_modo_off

_mp3_modo_normal:

;mp3_chino.c,172 :: 		void mp3_modo_normal()
;mp3_chino.c,174 :: 		comando=modo_normal;
	MOVLW      11
	MOVWF      _comando+0
;mp3_chino.c,175 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,176 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,177 :: 		}
L_end_mp3_modo_normal:
	RETURN
; end of _mp3_modo_normal

_mp3_modo_reset:

;mp3_chino.c,180 :: 		void mp3_modo_reset()
;mp3_chino.c,182 :: 		comando=modo_reset;
	MOVLW      12
	MOVWF      _comando+0
;mp3_chino.c,183 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,184 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,185 :: 		}
L_end_mp3_modo_reset:
	RETURN
; end of _mp3_modo_reset

_mp3_modo_play:

;mp3_chino.c,188 :: 		void mp3_modo_play()
;mp3_chino.c,190 :: 		comando=modo_play;
	MOVLW      13
	MOVWF      _comando+0
;mp3_chino.c,191 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,192 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,193 :: 		}
L_end_mp3_modo_play:
	RETURN
; end of _mp3_modo_play

_mp3_modo_pausa:

;mp3_chino.c,196 :: 		void mp3_modo_pausa()
;mp3_chino.c,198 :: 		comando=modo_pausa;
	MOVLW      14
	MOVWF      _comando+0
;mp3_chino.c,199 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,200 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,201 :: 		}
L_end_mp3_modo_pausa:
	RETURN
; end of _mp3_modo_pausa

_mp3_suena:

;mp3_chino.c,206 :: 		void mp3_suena(unsigned char carp,unsigned char fila)
;mp3_chino.c,208 :: 		comando=carpeta;
	MOVLW      15
	MOVWF      _comando+0
;mp3_chino.c,209 :: 		parametro=(unsigned int) carp<<8 | fila;
	MOVF       FARG_mp3_suena_carp+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
	MOVF       _parametro+0, 0
	MOVWF      _parametro+1
	CLRF       _parametro+0
	MOVF       FARG_mp3_suena_fila+0, 0
	IORWF      _parametro+0, 1
	MOVLW      0
	IORWF      _parametro+1, 1
;mp3_chino.c,210 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,211 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,212 :: 		}
L_end_mp3_suena:
	RETURN
; end of _mp3_suena

_mp3_volumen_set:

;mp3_chino.c,215 :: 		void mp3_volumen_set(unsigned char prend,unsigned char nivel)
;mp3_chino.c,217 :: 		comando=set_volumen;
	MOVLW      16
	MOVWF      _comando+0
;mp3_chino.c,218 :: 		parametro=(unsigned int) prend<<8 | nivel;
	MOVF       FARG_mp3_volumen_set_prend+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
	MOVF       _parametro+0, 0
	MOVWF      _parametro+1
	CLRF       _parametro+0
	MOVF       FARG_mp3_volumen_set_nivel+0, 0
	IORWF      _parametro+0, 1
	MOVLW      0
	IORWF      _parametro+1, 1
;mp3_chino.c,219 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,220 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,221 :: 		}
L_end_mp3_volumen_set:
	RETURN
; end of _mp3_volumen_set

_mp3_repite_ya:

;mp3_chino.c,223 :: 		void mp3_repite_ya(unsigned char como)    //1=repite  0=stop
;mp3_chino.c,225 :: 		comando=repite_ya;
	MOVLW      17
	MOVWF      _comando+0
;mp3_chino.c,226 :: 		parametro=como;
	MOVF       FARG_mp3_repite_ya_como+0, 0
	MOVWF      _parametro+0
	CLRF       _parametro+1
;mp3_chino.c,227 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,228 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,229 :: 		}
L_end_mp3_repite_ya:
	RETURN
; end of _mp3_repite_ya

_mp3_q_estado_usb:

;mp3_chino.c,231 :: 		void mp3_q_estado_usb()
;mp3_chino.c,233 :: 		comando=es_usb;
	MOVLW      60
	MOVWF      _comando+0
;mp3_chino.c,234 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,235 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,236 :: 		}
L_end_mp3_q_estado_usb:
	RETURN
; end of _mp3_q_estado_usb

_mp3_q_estado_sd:

;mp3_chino.c,238 :: 		void mp3_q_estado_sd()
;mp3_chino.c,240 :: 		comando=es_sd;
	MOVLW      61
	MOVWF      _comando+0
;mp3_chino.c,241 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,242 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,244 :: 		}
L_end_mp3_q_estado_sd:
	RETURN
; end of _mp3_q_estado_sd

_mp3_q_estado_flahs:

;mp3_chino.c,246 :: 		void mp3_q_estado_flahs()
;mp3_chino.c,248 :: 		comando=es_flahs;
	MOVLW      62
	MOVWF      _comando+0
;mp3_chino.c,249 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,250 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,251 :: 		}
L_end_mp3_q_estado_flahs:
	RETURN
; end of _mp3_q_estado_flahs

_mp3_inicializa:

;mp3_chino.c,253 :: 		void mp3_inicializa()
;mp3_chino.c,255 :: 		init_mp3();// inica el modulo puwerto serial
	CALL       _init_mp3+0
;mp3_chino.c,256 :: 		comando=inicializa;
	MOVLW      63
	MOVWF      _comando+0
;mp3_chino.c,257 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,258 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,259 :: 		}
L_end_mp3_inicializa:
	RETURN
; end of _mp3_inicializa

_mp3_retransmite:

;mp3_chino.c,261 :: 		void mp3_retransmite()
;mp3_chino.c,263 :: 		comando=retransmitir;
	MOVLW      64
	MOVWF      _comando+0
;mp3_chino.c,264 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,265 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,266 :: 		}
L_end_mp3_retransmite:
	RETURN
; end of _mp3_retransmite

_mp3_responder:

;mp3_chino.c,268 :: 		void mp3_responder()
;mp3_chino.c,270 :: 		comando=responder;
	MOVLW      65
	MOVWF      _comando+0
;mp3_chino.c,271 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,272 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,273 :: 		}
L_end_mp3_responder:
	RETURN
; end of _mp3_responder

_mp3_q_estado:

;mp3_chino.c,276 :: 		void mp3_q_estado()
;mp3_chino.c,278 :: 		comando=p_estado;
	MOVLW      66
	MOVWF      _comando+0
;mp3_chino.c,279 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,280 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,281 :: 		}
L_end_mp3_q_estado:
	RETURN
; end of _mp3_q_estado

_mp3_q_volumen:

;mp3_chino.c,284 :: 		void mp3_q_volumen()
;mp3_chino.c,286 :: 		comando=p_volumen;
	MOVLW      67
	MOVWF      _comando+0
;mp3_chino.c,287 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,288 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,289 :: 		}
L_end_mp3_q_volumen:
	RETURN
; end of _mp3_q_volumen

_mp3_q_equializa:

;mp3_chino.c,293 :: 		void mp3_q_equializa()
;mp3_chino.c,295 :: 		comando=p_equaliza;
	MOVLW      68
	MOVWF      _comando+0
;mp3_chino.c,296 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,297 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,298 :: 		}
L_end_mp3_q_equializa:
	RETURN
; end of _mp3_q_equializa

_mp3_q_play_mode:

;mp3_chino.c,301 :: 		void mp3_q_play_mode()
;mp3_chino.c,303 :: 		comando=p_modo_rep;
	MOVLW      69
	MOVWF      _comando+0
;mp3_chino.c,304 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,305 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,306 :: 		}
L_end_mp3_q_play_mode:
	RETURN
; end of _mp3_q_play_mode

_mp3_q_software:

;mp3_chino.c,308 :: 		void mp3_q_software()
;mp3_chino.c,310 :: 		comando=p_sofware;
	MOVLW      70
	MOVWF      _comando+0
;mp3_chino.c,311 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,312 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,313 :: 		}
L_end_mp3_q_software:
	RETURN
; end of _mp3_q_software

_mp3_q_sd_filas:

;mp3_chino.c,316 :: 		void mp3_q_sd_filas()
;mp3_chino.c,318 :: 		comando=sd_filas;
	MOVLW      71
	MOVWF      _comando+0
;mp3_chino.c,319 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,320 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,321 :: 		}
L_end_mp3_q_sd_filas:
	RETURN
; end of _mp3_q_sd_filas

_mp3_q_usb_filas:

;mp3_chino.c,325 :: 		void mp3_q_usb_filas()
;mp3_chino.c,327 :: 		comando=usb_filas;
	MOVLW      72
	MOVWF      _comando+0
;mp3_chino.c,328 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,329 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,330 :: 		}
L_end_mp3_q_usb_filas:
	RETURN
; end of _mp3_q_usb_filas

_mp3_q_flahs_filas:

;mp3_chino.c,334 :: 		void mp3_q_flahs_filas()
;mp3_chino.c,336 :: 		comando=flahs_filas;
	MOVLW      73
	MOVWF      _comando+0
;mp3_chino.c,337 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,338 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,339 :: 		}
L_end_mp3_q_flahs_filas:
	RETURN
; end of _mp3_q_flahs_filas

_mp3_q_on:

;mp3_chino.c,343 :: 		void mp3_q_on()
;mp3_chino.c,345 :: 		comando=on_;
	MOVLW      74
	MOVWF      _comando+0
;mp3_chino.c,346 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,347 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,348 :: 		}
L_end_mp3_q_on:
	RETURN
; end of _mp3_q_on

_mp3_q_sd_actual:

;mp3_chino.c,350 :: 		void mp3_q_sd_actual()
;mp3_chino.c,352 :: 		comando=sd_actual;
	MOVLW      75
	MOVWF      _comando+0
;mp3_chino.c,353 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,354 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,355 :: 		}
L_end_mp3_q_sd_actual:
	RETURN
; end of _mp3_q_sd_actual

_mp3_q_usb_actual:

;mp3_chino.c,357 :: 		void mp3_q_usb_actual()
;mp3_chino.c,359 :: 		comando=usb_actual;
	MOVLW      76
	MOVWF      _comando+0
;mp3_chino.c,360 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,361 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,362 :: 		}
L_end_mp3_q_usb_actual:
	RETURN
; end of _mp3_q_usb_actual

_mp3_q_flahs_actual:

;mp3_chino.c,364 :: 		void mp3_q_flahs_actual()
;mp3_chino.c,366 :: 		comando=flahs_actual;
	MOVLW      77
	MOVWF      _comando+0
;mp3_chino.c,367 :: 		calula_checksum();
	CALL       _calula_checksum+0
;mp3_chino.c,368 :: 		manda_mp3();
	CALL       _manda_mp3+0
;mp3_chino.c,369 :: 		}
L_end_mp3_q_flahs_actual:
	RETURN
; end of _mp3_q_flahs_actual
