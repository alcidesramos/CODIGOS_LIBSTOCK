
_mp3_send:

;YX5300.c,26 :: 		void mp3_send()
;YX5300.c,29 :: 		for (i=0; i<=7;i++)  UART1_Write(mp3_buffer[i]);
	CLRF       mp3_send_i_L0+0
L_mp3_send0:
	MOVF       mp3_send_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_mp3_send1
	MOVF       mp3_send_i_L0+0, 0
	ADDLW      _mp3_buffer+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	INCF       mp3_send_i_L0+0, 1
	GOTO       L_mp3_send0
L_mp3_send1:
;YX5300.c,30 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_mp3_send3:
	DECFSZ     R13+0, 1
	GOTO       L_mp3_send3
	DECFSZ     R12+0, 1
	GOTO       L_mp3_send3
	DECFSZ     R11+0, 1
	GOTO       L_mp3_send3
	NOP
;YX5300.c,31 :: 		}
L_end_mp3_send:
	RETURN
; end of _mp3_send

_mp3_select:

;YX5300.c,34 :: 		void mp3_select()
;YX5300.c,36 :: 		mp3_buffer[3]=select_sd;   // coloca comando
	MOVLW      9
	MOVWF      _mp3_buffer+3
;YX5300.c,37 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,38 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,39 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,40 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,41 :: 		}
L_end_mp3_select:
	RETURN
; end of _mp3_select

_mp3_reset:

;YX5300.c,43 :: 		void mp3_reset()
;YX5300.c,45 :: 		mp3_buffer[3]=reset;   // coloca comando
	MOVLW      12
	MOVWF      _mp3_buffer+3
;YX5300.c,46 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,47 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,48 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,49 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,50 :: 		}
L_end_mp3_reset:
	RETURN
; end of _mp3_reset

_mp3_init:

;YX5300.c,53 :: 		void mp3_init()
;YX5300.c,55 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;YX5300.c,56 :: 		mp3_select();
	CALL       _mp3_select+0
;YX5300.c,57 :: 		mp3_reset();
	CALL       _mp3_reset+0
;YX5300.c,58 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_mp3_init4:
	DECFSZ     R13+0, 1
	GOTO       L_mp3_init4
	DECFSZ     R12+0, 1
	GOTO       L_mp3_init4
	DECFSZ     R11+0, 1
	GOTO       L_mp3_init4
	NOP
;YX5300.c,59 :: 		}
L_end_mp3_init:
	RETURN
; end of _mp3_init

_mp3_next:

;YX5300.c,61 :: 		void mp3_next()
;YX5300.c,63 :: 		mp3_buffer[3]=next_song;   // coloca comando
	MOVLW      1
	MOVWF      _mp3_buffer+3
;YX5300.c,64 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,65 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,66 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,67 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,68 :: 		}
L_end_mp3_next:
	RETURN
; end of _mp3_next

_mp3_prev:

;YX5300.c,71 :: 		void mp3_prev()
;YX5300.c,73 :: 		mp3_buffer[3]=prev_song;   // coloca comando
	MOVLW      2
	MOVWF      _mp3_buffer+3
;YX5300.c,74 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,75 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,76 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,77 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,78 :: 		}
L_end_mp3_prev:
	RETURN
; end of _mp3_prev

_mp3_play_song:

;YX5300.c,82 :: 		void mp3_play_song (unsigned char  song)
;YX5300.c,84 :: 		mp3_buffer[3]=play_song;   // coloca comando
	MOVLW      3
	MOVWF      _mp3_buffer+3
;YX5300.c,85 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,86 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,87 :: 		mp3_buffer[6]=song;
	MOVF       FARG_mp3_play_song_song+0, 0
	MOVWF      _mp3_buffer+6
;YX5300.c,88 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,89 :: 		}
L_end_mp3_play_song:
	RETURN
; end of _mp3_play_song

_mp3_vol_up:

;YX5300.c,94 :: 		void mp3_vol_up()
;YX5300.c,96 :: 		mp3_buffer[3]=vol_up;   // coloca comando
	MOVLW      4
	MOVWF      _mp3_buffer+3
;YX5300.c,97 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,98 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,99 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,100 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,101 :: 		}
L_end_mp3_vol_up:
	RETURN
; end of _mp3_vol_up

_mp3_vol_down:

;YX5300.c,104 :: 		void mp3_vol_down()
;YX5300.c,106 :: 		mp3_buffer[3]=vol_down;   // coloca comando
	MOVLW      5
	MOVWF      _mp3_buffer+3
;YX5300.c,107 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,108 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,109 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,110 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,111 :: 		}
L_end_mp3_vol_down:
	RETURN
; end of _mp3_vol_down

_mp3_set_vol:

;YX5300.c,113 :: 		void mp3_set_vol (unsigned char  volu)
;YX5300.c,115 :: 		if (volu>=30) volu=30;
	MOVLW      30
	SUBWF      FARG_mp3_set_vol_volu+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_mp3_set_vol5
	MOVLW      30
	MOVWF      FARG_mp3_set_vol_volu+0
L_mp3_set_vol5:
;YX5300.c,117 :: 		mp3_buffer[3]=set_vol;   // coloca comando
	MOVLW      6
	MOVWF      _mp3_buffer+3
;YX5300.c,118 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,119 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,120 :: 		mp3_buffer[6]=volu;
	MOVF       FARG_mp3_set_vol_volu+0, 0
	MOVWF      _mp3_buffer+6
;YX5300.c,121 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,122 :: 		}
L_end_mp3_set_vol:
	RETURN
; end of _mp3_set_vol

_mp3_ciclo_play_num:

;YX5300.c,125 :: 		void mp3_ciclo_play_num (unsigned char  song)
;YX5300.c,127 :: 		mp3_buffer[3]=single_cycle;   // coloca comando
	MOVLW      8
	MOVWF      _mp3_buffer+3
;YX5300.c,128 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,129 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,130 :: 		mp3_buffer[6]=song;
	MOVF       FARG_mp3_ciclo_play_num_song+0, 0
	MOVWF      _mp3_buffer+6
;YX5300.c,131 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,132 :: 		}
L_end_mp3_ciclo_play_num:
	RETURN
; end of _mp3_ciclo_play_num

_mp3_sleep:

;YX5300.c,134 :: 		void mp3_sleep()
;YX5300.c,136 :: 		mp3_buffer[3]=sleep;   // coloca comando
	MOVLW      10
	MOVWF      _mp3_buffer+3
;YX5300.c,137 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,138 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,139 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,140 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,141 :: 		}
L_end_mp3_sleep:
	RETURN
; end of _mp3_sleep

_mp3_wake_up:

;YX5300.c,144 :: 		void mp3_wake_up()
;YX5300.c,146 :: 		mp3_buffer[3]=wake_up;   // coloca comando
	MOVLW      11
	MOVWF      _mp3_buffer+3
;YX5300.c,147 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,148 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,149 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,150 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,151 :: 		}
L_end_mp3_wake_up:
	RETURN
; end of _mp3_wake_up

_mp3_pause:

;YX5300.c,154 :: 		void mp3_pause()
;YX5300.c,156 :: 		mp3_buffer[3]=pausa;   // coloca comando
	MOVLW      14
	MOVWF      _mp3_buffer+3
;YX5300.c,157 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,158 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,159 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,160 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,161 :: 		}
L_end_mp3_pause:
	RETURN
; end of _mp3_pause

_mp3_play:

;YX5300.c,164 :: 		void mp3_play()
;YX5300.c,166 :: 		mp3_buffer[3]=play;   // coloca comando
	MOVLW      13
	MOVWF      _mp3_buffer+3
;YX5300.c,167 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,168 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,169 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,170 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,171 :: 		}
L_end_mp3_play:
	RETURN
; end of _mp3_play

_mp3_stop:

;YX5300.c,175 :: 		void mp3_stop()
;YX5300.c,177 :: 		mp3_buffer[3]=stop;   // coloca comando
	MOVLW      22
	MOVWF      _mp3_buffer+3
;YX5300.c,178 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,179 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,180 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,181 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,182 :: 		}
L_end_mp3_stop:
	RETURN
; end of _mp3_stop

_mp3_folder_song:

;YX5300.c,184 :: 		void mp3_folder_song (unsigned char folder,unsigned char song)
;YX5300.c,186 :: 		mp3_buffer[3]=folder_file;   // coloca comando
	MOVLW      15
	MOVWF      _mp3_buffer+3
;YX5300.c,187 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,188 :: 		mp3_buffer[5]=folder;
	MOVF       FARG_mp3_folder_song_folder+0, 0
	MOVWF      _mp3_buffer+5
;YX5300.c,189 :: 		mp3_buffer[6]=song;
	MOVF       FARG_mp3_folder_song_song+0, 0
	MOVWF      _mp3_buffer+6
;YX5300.c,190 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,192 :: 		}
L_end_mp3_folder_song:
	RETURN
; end of _mp3_folder_song

_mp3_folder_cycle:

;YX5300.c,194 :: 		void mp3_folder_cycle(unsigned char  folder)   //reproduce un folder de manera ciclica
;YX5300.c,196 :: 		mp3_buffer[3]=folder_cycle;   // coloca comando
	MOVLW      23
	MOVWF      _mp3_buffer+3
;YX5300.c,197 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,198 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,199 :: 		mp3_buffer[6]=folder;
	MOVF       FARG_mp3_folder_cycle_folder+0, 0
	MOVWF      _mp3_buffer+6
;YX5300.c,200 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,201 :: 		}
L_end_mp3_folder_cycle:
	RETURN
; end of _mp3_folder_cycle

_mp3_play_random:

;YX5300.c,203 :: 		void mp3_play_random()
;YX5300.c,205 :: 		mp3_buffer[3]=random;   // coloca comando
	MOVLW      24
	MOVWF      _mp3_buffer+3
;YX5300.c,206 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,207 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,208 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,209 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,210 :: 		}
L_end_mp3_play_random:
	RETURN
; end of _mp3_play_random

_mp3_set_single_cycle_play:

;YX5300.c,212 :: 		void mp3_set_single_cycle_play()
;YX5300.c,214 :: 		mp3_buffer[3]=set_sigle_play;   // coloca comando
	MOVLW      25
	MOVWF      _mp3_buffer+3
;YX5300.c,215 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,216 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,217 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,218 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,219 :: 		}
L_end_mp3_set_single_cycle_play:
	RETURN
; end of _mp3_set_single_cycle_play

_mp3_close_single_cycle_play:

;YX5300.c,221 :: 		void mp3_close_single_cycle_play()
;YX5300.c,223 :: 		mp3_buffer[3]=close_sigle_play;   // coloca comando
	MOVLW      25
	MOVWF      _mp3_buffer+3
;YX5300.c,224 :: 		mp3_buffer[4]=0;
	CLRF       _mp3_buffer+4
;YX5300.c,225 :: 		mp3_buffer[5]=0;
	CLRF       _mp3_buffer+5
;YX5300.c,226 :: 		mp3_buffer[6]=0;
	CLRF       _mp3_buffer+6
;YX5300.c,227 :: 		mp3_send();
	CALL       _mp3_send+0
;YX5300.c,228 :: 		}
L_end_mp3_close_single_cycle_play:
	RETURN
; end of _mp3_close_single_cycle_play

_mp3_play_song_vol:

;YX5300.c,230 :: 		void mp3_play_song_vol (unsigned char  song,unsigned char vol)
;YX5300.c,232 :: 		mp3_set_vol(vol);
	MOVF       FARG_mp3_play_song_vol_vol+0, 0
	MOVWF      FARG_mp3_set_vol_volu+0
	CALL       _mp3_set_vol+0
;YX5300.c,233 :: 		mp3_play_song(song);
	MOVF       FARG_mp3_play_song_vol_song+0, 0
	MOVWF      FARG_mp3_play_song_song+0
	CALL       _mp3_play_song+0
;YX5300.c,236 :: 		}
L_end_mp3_play_song_vol:
	RETURN
; end of _mp3_play_song_vol
