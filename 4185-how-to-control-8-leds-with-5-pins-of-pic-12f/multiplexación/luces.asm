
_in_comun:

;luces.c,17 :: 		void in_comun()
;luces.c,19 :: 		TRISIO0_bit=1;
	BSF        TRISIO0_bit+0, BitPos(TRISIO0_bit+0)
;luces.c,20 :: 		}
L_end_in_comun:
	RETURN
; end of _in_comun

_in_f1:

;luces.c,22 :: 		void in_f1()
;luces.c,24 :: 		TRISIO1_bit=1;
	BSF        TRISIO1_bit+0, BitPos(TRISIO1_bit+0)
;luces.c,25 :: 		}
L_end_in_f1:
	RETURN
; end of _in_f1

_in_f2:

;luces.c,27 :: 		void in_f2()
;luces.c,29 :: 		TRISIO2_bit=1;
	BSF        TRISIO2_bit+0, BitPos(TRISIO2_bit+0)
;luces.c,30 :: 		}
L_end_in_f2:
	RETURN
; end of _in_f2

_in_f3:

;luces.c,31 :: 		void in_f3()
;luces.c,33 :: 		TRISIO4_bit=1;
	BSF        TRISIO4_bit+0, BitPos(TRISIO4_bit+0)
;luces.c,34 :: 		}
L_end_in_f3:
	RETURN
; end of _in_f3

_in_f4:

;luces.c,35 :: 		void in_f4()
;luces.c,37 :: 		TRISIO5_bit=1;
	BSF        TRISIO5_bit+0, BitPos(TRISIO5_bit+0)
;luces.c,38 :: 		}
L_end_in_f4:
	RETURN
; end of _in_f4

_out_comun:

;luces.c,40 :: 		void out_comun()
;luces.c,42 :: 		TRISIO0_bit=0;
	BCF        TRISIO0_bit+0, BitPos(TRISIO0_bit+0)
;luces.c,43 :: 		}
L_end_out_comun:
	RETURN
; end of _out_comun

_out_f1:

;luces.c,45 :: 		void out_f1()
;luces.c,47 :: 		TRISIO1_bit=0;
	BCF        TRISIO1_bit+0, BitPos(TRISIO1_bit+0)
;luces.c,48 :: 		}
L_end_out_f1:
	RETURN
; end of _out_f1

_out_f2:

;luces.c,49 :: 		void out_f2()
;luces.c,51 :: 		TRISIO2_bit=0;
	BCF        TRISIO2_bit+0, BitPos(TRISIO2_bit+0)
;luces.c,52 :: 		}
L_end_out_f2:
	RETURN
; end of _out_f2

_out_f3:

;luces.c,53 :: 		void out_f3()
;luces.c,55 :: 		TRISIO4_bit=0;
	BCF        TRISIO4_bit+0, BitPos(TRISIO4_bit+0)
;luces.c,56 :: 		}
L_end_out_f3:
	RETURN
; end of _out_f3

_out_f4:

;luces.c,58 :: 		void out_f4()
;luces.c,60 :: 		TRISIO5_bit=0;
	BCF        TRISIO5_bit+0, BitPos(TRISIO5_bit+0)
;luces.c,61 :: 		}
L_end_out_f4:
	RETURN
; end of _out_f4

_in_todo:

;luces.c,64 :: 		void in_todo()
;luces.c,66 :: 		in_comun();
	CALL       _in_comun+0
;luces.c,67 :: 		in_f1();
	CALL       _in_f1+0
;luces.c,68 :: 		in_f2();
	CALL       _in_f2+0
;luces.c,69 :: 		in_f3();
	CALL       _in_f3+0
;luces.c,70 :: 		in_f4();
	CALL       _in_f4+0
;luces.c,71 :: 		}
L_end_in_todo:
	RETURN
; end of _in_todo

_out_todo:

;luces.c,74 :: 		void out_todo()
;luces.c,76 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,77 :: 		out_f1();
	CALL       _out_f1+0
;luces.c,78 :: 		out_f2();
	CALL       _out_f2+0
;luces.c,79 :: 		out_f3();
	CALL       _out_f3+0
;luces.c,80 :: 		out_f4();
	CALL       _out_f4+0
;luces.c,81 :: 		}
L_end_out_todo:
	RETURN
; end of _out_todo

_prende_1:

;luces.c,84 :: 		void prende_1(unsigned int tiempo)
;luces.c,86 :: 		in_todo();  // apagar todo
	CALL       _in_todo+0
;luces.c,87 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,88 :: 		out_f1();
	CALL       _out_f1+0
;luces.c,89 :: 		comun=1;
	BSF        GPIO+0, 0
;luces.c,90 :: 		f1=0;
	BCF        GPIO+0, 1
;luces.c,91 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_1_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_1_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,92 :: 		}
L_end_prende_1:
	RETURN
; end of _prende_1

_prende_2:

;luces.c,96 :: 		void prende_2(unsigned int tiempo)
;luces.c,98 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,99 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,100 :: 		out_f1();
	CALL       _out_f1+0
;luces.c,101 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,102 :: 		f1=1;
	BSF        GPIO+0, 1
;luces.c,103 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_2_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_2_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,104 :: 		}
L_end_prende_2:
	RETURN
; end of _prende_2

_prende_3:

;luces.c,107 :: 		void prende_3(unsigned int tiempo)
;luces.c,109 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,110 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,111 :: 		out_f2();
	CALL       _out_f2+0
;luces.c,112 :: 		comun=1;
	BSF        GPIO+0, 0
;luces.c,113 :: 		f2=0;
	BCF        GPIO+0, 2
;luces.c,114 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_3_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_3_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,115 :: 		}
L_end_prende_3:
	RETURN
; end of _prende_3

_prende_4:

;luces.c,118 :: 		void prende_4(unsigned int tiempo)
;luces.c,120 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,121 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,122 :: 		out_f2();
	CALL       _out_f2+0
;luces.c,123 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,124 :: 		f2=1;
	BSF        GPIO+0, 2
;luces.c,125 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_4_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_4_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,126 :: 		}
L_end_prende_4:
	RETURN
; end of _prende_4

_prende_5:

;luces.c,131 :: 		void prende_5(unsigned int tiempo)
;luces.c,133 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,134 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,135 :: 		out_f3();
	CALL       _out_f3+0
;luces.c,136 :: 		comun=1;
	BSF        GPIO+0, 0
;luces.c,137 :: 		f3=0;
	BCF        GPIO+0, 4
;luces.c,138 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_5_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_5_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,139 :: 		}
L_end_prende_5:
	RETURN
; end of _prende_5

_prende_6:

;luces.c,142 :: 		void prende_6(unsigned int tiempo)
;luces.c,144 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,145 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,146 :: 		out_f3();
	CALL       _out_f3+0
;luces.c,147 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,148 :: 		f3=1;
	BSF        GPIO+0, 4
;luces.c,149 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_6_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_6_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,150 :: 		}
L_end_prende_6:
	RETURN
; end of _prende_6

_prende_7:

;luces.c,153 :: 		void prende_7(unsigned int tiempo)
;luces.c,155 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,156 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,157 :: 		out_f4();
	CALL       _out_f4+0
;luces.c,158 :: 		comun=1;
	BSF        GPIO+0, 0
;luces.c,159 :: 		f4=0;
	BCF        GPIO+0, 5
;luces.c,160 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_7_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_7_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,161 :: 		}
L_end_prende_7:
	RETURN
; end of _prende_7

_prende_8:

;luces.c,164 :: 		void prende_8(unsigned int tiempo)
;luces.c,166 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,167 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,168 :: 		out_f4();
	CALL       _out_f4+0
;luces.c,169 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,170 :: 		f4=1;
	BSF        GPIO+0, 5
;luces.c,171 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_8_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_8_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,172 :: 		}
L_end_prende_8:
	RETURN
; end of _prende_8

_apaga_1:

;luces.c,176 :: 		void apaga_1(unsigned int tiempo)
;luces.c,178 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,179 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,180 :: 		out_f1();
	CALL       _out_f1+0
;luces.c,181 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,182 :: 		f1=0;
	BCF        GPIO+0, 1
;luces.c,183 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_1_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_1_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,184 :: 		}
L_end_apaga_1:
	RETURN
; end of _apaga_1

_apaga_2:

;luces.c,188 :: 		void apaga_2(unsigned int tiempo)
;luces.c,190 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,191 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,192 :: 		out_f1();
	CALL       _out_f1+0
;luces.c,193 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,194 :: 		f1=0;
	BCF        GPIO+0, 1
;luces.c,195 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_2_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_2_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,196 :: 		}
L_end_apaga_2:
	RETURN
; end of _apaga_2

_apaga_3:

;luces.c,199 :: 		void apaga_3(unsigned int tiempo)
;luces.c,201 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,202 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,203 :: 		out_f2();
	CALL       _out_f2+0
;luces.c,204 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,205 :: 		f2=0;
	BCF        GPIO+0, 2
;luces.c,206 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_3_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_3_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,207 :: 		}
L_end_apaga_3:
	RETURN
; end of _apaga_3

_apaga_4:

;luces.c,210 :: 		void apaga_4(unsigned int tiempo)
;luces.c,212 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,213 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,214 :: 		out_f2();
	CALL       _out_f2+0
;luces.c,215 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,216 :: 		f2=0;
	BCF        GPIO+0, 2
;luces.c,217 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_4_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_4_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,218 :: 		}
L_end_apaga_4:
	RETURN
; end of _apaga_4

_apaga_5:

;luces.c,221 :: 		void apaga_5(unsigned int tiempo)
;luces.c,223 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,224 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,225 :: 		out_f3();
	CALL       _out_f3+0
;luces.c,226 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,227 :: 		f3=0;
	BCF        GPIO+0, 4
;luces.c,228 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_5_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_5_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,229 :: 		}
L_end_apaga_5:
	RETURN
; end of _apaga_5

_apaga_6:

;luces.c,232 :: 		void apaga_6(unsigned int tiempo)
;luces.c,234 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,235 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,236 :: 		out_f3();
	CALL       _out_f3+0
;luces.c,237 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,238 :: 		f3=0;
	BCF        GPIO+0, 4
;luces.c,239 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_6_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_6_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,240 :: 		}
L_end_apaga_6:
	RETURN
; end of _apaga_6

_apaga_7:

;luces.c,243 :: 		void apaga_7(unsigned int tiempo)
;luces.c,245 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,246 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,247 :: 		out_f4();
	CALL       _out_f4+0
;luces.c,248 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,249 :: 		f4=0;
	BCF        GPIO+0, 5
;luces.c,250 :: 		Delay_5ms();
	CALL       _Delay_5ms+0
;luces.c,251 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_7_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_7_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,252 :: 		}
L_end_apaga_7:
	RETURN
; end of _apaga_7

_apaga_8:

;luces.c,255 :: 		void apaga_8(unsigned int tiempo)
;luces.c,257 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,258 :: 		out_comun();
	CALL       _out_comun+0
;luces.c,259 :: 		out_f4();
	CALL       _out_f4+0
;luces.c,260 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,261 :: 		f4=0;
	BCF        GPIO+0, 5
;luces.c,262 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_8_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_8_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,263 :: 		}
L_end_apaga_8:
	RETURN
; end of _apaga_8

_apaga_todo:

;luces.c,266 :: 		void apaga_todo(unsigned int tiempo)
;luces.c,268 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,269 :: 		VDelay_ms(tiempo);
	MOVF       FARG_apaga_todo_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_apaga_todo_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,270 :: 		}
L_end_apaga_todo:
	RETURN
; end of _apaga_todo

_prende_4_bajo:

;luces.c,273 :: 		void prende_4_bajo(unsigned int tiempo)
;luces.c,275 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,276 :: 		out_todo();
	CALL       _out_todo+0
;luces.c,277 :: 		comun=1;
	BSF        GPIO+0, 0
;luces.c,278 :: 		f1=0;
	BCF        GPIO+0, 1
;luces.c,279 :: 		f2=0;
	BCF        GPIO+0, 2
;luces.c,280 :: 		f3=0;
	BCF        GPIO+0, 4
;luces.c,281 :: 		f4=0;
	BCF        GPIO+0, 5
;luces.c,282 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_4_bajo_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_4_bajo_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,283 :: 		}
L_end_prende_4_bajo:
	RETURN
; end of _prende_4_bajo

_prende_4_alta:

;luces.c,288 :: 		void prende_4_alta(unsigned int tiempo)
;luces.c,290 :: 		in_todo();
	CALL       _in_todo+0
;luces.c,291 :: 		out_todo();
	CALL       _out_todo+0
;luces.c,292 :: 		comun=0;
	BCF        GPIO+0, 0
;luces.c,293 :: 		f1=1;
	BSF        GPIO+0, 1
;luces.c,294 :: 		f2=1;
	BSF        GPIO+0, 2
;luces.c,295 :: 		f3=1;
	BSF        GPIO+0, 4
;luces.c,296 :: 		f4=1;
	BSF        GPIO+0, 5
;luces.c,297 :: 		VDelay_ms(tiempo);
	MOVF       FARG_prende_4_alta_tiempo+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_prende_4_alta_tiempo+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;luces.c,298 :: 		}
L_end_prende_4_alta:
	RETURN
; end of _prende_4_alta

_InitTimer1:

;luces.c,304 :: 		void InitTimer1(){
;luces.c,305 :: 		T1CON	 = 0x21;
	MOVLW      33
	MOVWF      T1CON+0
;luces.c,306 :: 		TMR1IF_bit	 = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;luces.c,307 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;luces.c,308 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;luces.c,309 :: 		TMR1IE_bit	 = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;luces.c,310 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;luces.c,311 :: 		}
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

;luces.c,313 :: 		void Interrupt(){
;luces.c,314 :: 		if (TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;luces.c,315 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;luces.c,316 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;luces.c,317 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;luces.c,320 :: 		if (sw==0)
	BTFSC      GPIO+0, 3
	GOTO       L_Interrupt1
;luces.c,322 :: 		TMR1ON_bit=0; //para el timer, para evitar mas intrrupciones
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;luces.c,323 :: 		efecto++;
	INCF       _efecto+0, 1
;luces.c,324 :: 		Delay_ms(200); // retardo antirebote
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Interrupt2:
	DECFSZ     R13+0, 1
	GOTO       L_Interrupt2
	DECFSZ     R12+0, 1
	GOTO       L_Interrupt2
	DECFSZ     R11+0, 1
	GOTO       L_Interrupt2
	NOP
;luces.c,325 :: 		TMR1ON_bit=1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;luces.c,326 :: 		}
L_Interrupt1:
;luces.c,327 :: 		if (efecto>n_efectos)  efecto=0;  //limete de nuemro de efectos a realizar
	MOVF       _efecto+0, 0
	SUBLW      4
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt3
	CLRF       _efecto+0
L_Interrupt3:
;luces.c,330 :: 		}
L_Interrupt0:
;luces.c,331 :: 		}
L_end_Interrupt:
L__Interrupt70:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;luces.c,334 :: 		void main()
;luces.c,337 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;luces.c,339 :: 		InitTimer1(); //configuiramos int cada 200ms
	CALL       _InitTimer1+0
;luces.c,341 :: 		while(1)
L_main4:
;luces.c,343 :: 		switch (efecto)
	GOTO       L_main6
;luces.c,345 :: 		case 0:
L_main8:
;luces.c,347 :: 		prende_1(200);
	MOVLW      200
	MOVWF      FARG_prende_1_tiempo+0
	CLRF       FARG_prende_1_tiempo+1
	CALL       _prende_1+0
;luces.c,348 :: 		prende_2(200);
	MOVLW      200
	MOVWF      FARG_prende_2_tiempo+0
	CLRF       FARG_prende_2_tiempo+1
	CALL       _prende_2+0
;luces.c,349 :: 		prende_3(200);
	MOVLW      200
	MOVWF      FARG_prende_3_tiempo+0
	CLRF       FARG_prende_3_tiempo+1
	CALL       _prende_3+0
;luces.c,350 :: 		prende_4(200);
	MOVLW      200
	MOVWF      FARG_prende_4_tiempo+0
	CLRF       FARG_prende_4_tiempo+1
	CALL       _prende_4+0
;luces.c,351 :: 		prende_5(200);
	MOVLW      200
	MOVWF      FARG_prende_5_tiempo+0
	CLRF       FARG_prende_5_tiempo+1
	CALL       _prende_5+0
;luces.c,352 :: 		prende_6(200);
	MOVLW      200
	MOVWF      FARG_prende_6_tiempo+0
	CLRF       FARG_prende_6_tiempo+1
	CALL       _prende_6+0
;luces.c,353 :: 		prende_7(200);
	MOVLW      200
	MOVWF      FARG_prende_7_tiempo+0
	CLRF       FARG_prende_7_tiempo+1
	CALL       _prende_7+0
;luces.c,354 :: 		prende_8(200);
	MOVLW      200
	MOVWF      FARG_prende_8_tiempo+0
	CLRF       FARG_prende_8_tiempo+1
	CALL       _prende_8+0
;luces.c,355 :: 		}break;  // efecto 0
	GOTO       L_main7
;luces.c,357 :: 		case 1:
L_main9:
;luces.c,359 :: 		prende_8(100);
	MOVLW      100
	MOVWF      FARG_prende_8_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_8_tiempo+1
	CALL       _prende_8+0
;luces.c,360 :: 		prende_7(100);
	MOVLW      100
	MOVWF      FARG_prende_7_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_7_tiempo+1
	CALL       _prende_7+0
;luces.c,361 :: 		prende_6(100);
	MOVLW      100
	MOVWF      FARG_prende_6_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_6_tiempo+1
	CALL       _prende_6+0
;luces.c,362 :: 		prende_5(100);
	MOVLW      100
	MOVWF      FARG_prende_5_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_5_tiempo+1
	CALL       _prende_5+0
;luces.c,363 :: 		prende_4(100);
	MOVLW      100
	MOVWF      FARG_prende_4_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_4_tiempo+1
	CALL       _prende_4+0
;luces.c,364 :: 		prende_3(100);
	MOVLW      100
	MOVWF      FARG_prende_3_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_3_tiempo+1
	CALL       _prende_3+0
;luces.c,365 :: 		prende_2(100);
	MOVLW      100
	MOVWF      FARG_prende_2_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_2_tiempo+1
	CALL       _prende_2+0
;luces.c,366 :: 		prende_1(100);
	MOVLW      100
	MOVWF      FARG_prende_1_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_1_tiempo+1
	CALL       _prende_1+0
;luces.c,367 :: 		}break;  // efecto 1
	GOTO       L_main7
;luces.c,369 :: 		case 2:
L_main10:
;luces.c,371 :: 		prende_1(100);
	MOVLW      100
	MOVWF      FARG_prende_1_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_1_tiempo+1
	CALL       _prende_1+0
;luces.c,372 :: 		prende_2(100);
	MOVLW      100
	MOVWF      FARG_prende_2_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_2_tiempo+1
	CALL       _prende_2+0
;luces.c,373 :: 		prende_3(100);
	MOVLW      100
	MOVWF      FARG_prende_3_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_3_tiempo+1
	CALL       _prende_3+0
;luces.c,374 :: 		prende_4(100);
	MOVLW      100
	MOVWF      FARG_prende_4_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_4_tiempo+1
	CALL       _prende_4+0
;luces.c,375 :: 		prende_5(100);
	MOVLW      100
	MOVWF      FARG_prende_5_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_5_tiempo+1
	CALL       _prende_5+0
;luces.c,376 :: 		prende_6(100);
	MOVLW      100
	MOVWF      FARG_prende_6_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_6_tiempo+1
	CALL       _prende_6+0
;luces.c,377 :: 		prende_7(100);
	MOVLW      100
	MOVWF      FARG_prende_7_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_7_tiempo+1
	CALL       _prende_7+0
;luces.c,378 :: 		prende_8(100);
	MOVLW      100
	MOVWF      FARG_prende_8_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_8_tiempo+1
	CALL       _prende_8+0
;luces.c,379 :: 		prende_8(100);
	MOVLW      100
	MOVWF      FARG_prende_8_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_8_tiempo+1
	CALL       _prende_8+0
;luces.c,380 :: 		prende_7(100);
	MOVLW      100
	MOVWF      FARG_prende_7_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_7_tiempo+1
	CALL       _prende_7+0
;luces.c,381 :: 		prende_6(100);
	MOVLW      100
	MOVWF      FARG_prende_6_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_6_tiempo+1
	CALL       _prende_6+0
;luces.c,382 :: 		prende_5(100);
	MOVLW      100
	MOVWF      FARG_prende_5_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_5_tiempo+1
	CALL       _prende_5+0
;luces.c,383 :: 		prende_4(100);
	MOVLW      100
	MOVWF      FARG_prende_4_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_4_tiempo+1
	CALL       _prende_4+0
;luces.c,384 :: 		prende_3(100);
	MOVLW      100
	MOVWF      FARG_prende_3_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_3_tiempo+1
	CALL       _prende_3+0
;luces.c,385 :: 		prende_2(100);
	MOVLW      100
	MOVWF      FARG_prende_2_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_2_tiempo+1
	CALL       _prende_2+0
;luces.c,386 :: 		prende_1(100);
	MOVLW      100
	MOVWF      FARG_prende_1_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_1_tiempo+1
	CALL       _prende_1+0
;luces.c,387 :: 		}break;  // efecto 2
	GOTO       L_main7
;luces.c,390 :: 		case 3:
L_main11:
;luces.c,392 :: 		prende_4_bajo(300);
	MOVLW      44
	MOVWF      FARG_prende_4_bajo_tiempo+0
	MOVLW      1
	MOVWF      FARG_prende_4_bajo_tiempo+1
	CALL       _prende_4_bajo+0
;luces.c,393 :: 		prende_4_alta(300);
	MOVLW      44
	MOVWF      FARG_prende_4_alta_tiempo+0
	MOVLW      1
	MOVWF      FARG_prende_4_alta_tiempo+1
	CALL       _prende_4_alta+0
;luces.c,395 :: 		}break;  // efecto 3
	GOTO       L_main7
;luces.c,398 :: 		case 4:
L_main12:
;luces.c,400 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main13:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;luces.c,402 :: 		prende_1(100);
	MOVLW      100
	MOVWF      FARG_prende_1_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_1_tiempo+1
	CALL       _prende_1+0
;luces.c,403 :: 		apaga_1(80);
	MOVLW      80
	MOVWF      FARG_apaga_1_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_1_tiempo+1
	CALL       _apaga_1+0
;luces.c,400 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,404 :: 		}
	GOTO       L_main13
L_main14:
;luces.c,406 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main16:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;luces.c,408 :: 		prende_2(100);
	MOVLW      100
	MOVWF      FARG_prende_2_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_2_tiempo+1
	CALL       _prende_2+0
;luces.c,409 :: 		apaga_2(80);
	MOVLW      80
	MOVWF      FARG_apaga_2_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_2_tiempo+1
	CALL       _apaga_2+0
;luces.c,406 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,410 :: 		}
	GOTO       L_main16
L_main17:
;luces.c,412 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main19:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main20
;luces.c,414 :: 		prende_3(100);
	MOVLW      100
	MOVWF      FARG_prende_3_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_3_tiempo+1
	CALL       _prende_3+0
;luces.c,415 :: 		apaga_3(80);
	MOVLW      80
	MOVWF      FARG_apaga_3_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_3_tiempo+1
	CALL       _apaga_3+0
;luces.c,412 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,416 :: 		}
	GOTO       L_main19
L_main20:
;luces.c,417 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main22:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main23
;luces.c,419 :: 		prende_4(100);
	MOVLW      100
	MOVWF      FARG_prende_4_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_4_tiempo+1
	CALL       _prende_4+0
;luces.c,420 :: 		apaga_4(80);
	MOVLW      80
	MOVWF      FARG_apaga_4_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_4_tiempo+1
	CALL       _apaga_4+0
;luces.c,417 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,421 :: 		}
	GOTO       L_main22
L_main23:
;luces.c,423 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main25:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main26
;luces.c,425 :: 		prende_5(100);
	MOVLW      100
	MOVWF      FARG_prende_5_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_5_tiempo+1
	CALL       _prende_5+0
;luces.c,426 :: 		apaga_5(80);
	MOVLW      80
	MOVWF      FARG_apaga_5_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_5_tiempo+1
	CALL       _apaga_5+0
;luces.c,423 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,427 :: 		}
	GOTO       L_main25
L_main26:
;luces.c,429 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main28:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main29
;luces.c,431 :: 		prende_6(100);
	MOVLW      100
	MOVWF      FARG_prende_6_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_6_tiempo+1
	CALL       _prende_6+0
;luces.c,432 :: 		apaga_6(80);
	MOVLW      80
	MOVWF      FARG_apaga_6_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_6_tiempo+1
	CALL       _apaga_6+0
;luces.c,429 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,433 :: 		}
	GOTO       L_main28
L_main29:
;luces.c,435 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main31:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main32
;luces.c,437 :: 		prende_7(100);
	MOVLW      100
	MOVWF      FARG_prende_7_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_7_tiempo+1
	CALL       _prende_7+0
;luces.c,438 :: 		apaga_7(80);
	MOVLW      80
	MOVWF      FARG_apaga_7_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_7_tiempo+1
	CALL       _apaga_7+0
;luces.c,435 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,439 :: 		}
	GOTO       L_main31
L_main32:
;luces.c,441 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	MOVLW      1
	MOVWF      _cuenta+0
L_main34:
	MOVF       _cuenta+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main35
;luces.c,443 :: 		prende_8(100);
	MOVLW      100
	MOVWF      FARG_prende_8_tiempo+0
	MOVLW      0
	MOVWF      FARG_prende_8_tiempo+1
	CALL       _prende_8+0
;luces.c,444 :: 		apaga_8(80);
	MOVLW      80
	MOVWF      FARG_apaga_8_tiempo+0
	MOVLW      0
	MOVWF      FARG_apaga_8_tiempo+1
	CALL       _apaga_8+0
;luces.c,441 :: 		for (cuenta=1;cuenta<=3;cuenta++)
	INCF       _cuenta+0, 1
;luces.c,445 :: 		}
	GOTO       L_main34
L_main35:
;luces.c,448 :: 		}break;  // efecto 4
	GOTO       L_main7
;luces.c,453 :: 		}  //fin switch
L_main6:
	MOVF       _efecto+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _efecto+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _efecto+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _efecto+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _efecto+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main12
L_main7:
;luces.c,459 :: 		}
	GOTO       L_main4
;luces.c,464 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
