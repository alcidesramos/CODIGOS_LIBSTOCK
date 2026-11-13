
controlador_FMF_xfl_sh_triangular_equal:

;controlador.c,21 :: 		static double FMF_xfl_sh_triangular_equal(double x, int i, double min, double max, double step, double *p, int length) {
;controlador.c,22 :: 		double a = (i==0? min : p[i-1]);
	MOVLW       0
	XORWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal30
	MOVLW       0
	XORWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0, 0 
L_controlador_FMF_xfl_sh_triangular_equal30:
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal0
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_min+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+0 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_min+1, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+1 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_min+2, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+2 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_min+3, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+3 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal1
L_controlador_FMF_xfl_sh_triangular_equal0:
	MOVLW       1
	SUBWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0, 0 
	MOVWF       R3 
	MOVLW       0
	SUBWFB      FARG_controlador_FMF_xfl_sh_triangular_equal_i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_controlador_FMF_xfl_sh_triangular_equal_p+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+3 
L_controlador_FMF_xfl_sh_triangular_equal1:
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+0, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_a_L0+0 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+1, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_a_L0+1 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+2, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_a_L0+2 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT1+3, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_a_L0+3 
;controlador.c,23 :: 		double b = p[i];
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_i+0, 0 
	MOVWF       R0 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_controlador_FMF_xfl_sh_triangular_equal_p+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_b_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_b_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_b_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_b_L0+3 
;controlador.c,24 :: 		double c = (i==length-1? max : p[i+1]);
	MOVLW       1
	SUBWF       FARG_controlador_FMF_xfl_sh_triangular_equal_length+0, 0 
	MOVWF       R1 
	MOVLW       0
	SUBWFB      FARG_controlador_FMF_xfl_sh_triangular_equal_length+1, 0 
	MOVWF       R2 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_i+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal31
	MOVF        R1, 0 
	XORWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0, 0 
L_controlador_FMF_xfl_sh_triangular_equal31:
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal2
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_max+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+0 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_max+1, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+1 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_max+2, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+2 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_max+3, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+3 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal3
L_controlador_FMF_xfl_sh_triangular_equal2:
	MOVLW       1
	ADDWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      FARG_controlador_FMF_xfl_sh_triangular_equal_i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_controlador_FMF_xfl_sh_triangular_equal_p+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+3 
L_controlador_FMF_xfl_sh_triangular_equal3:
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+0, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_c_L0+0 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+1, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_c_L0+1 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+2, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_c_L0+2 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT11+3, 0 
	MOVWF       controlador_FMF_xfl_sh_triangular_equal_c_L0+3 
;controlador.c,26 :: 		if(i==0 && x<p[0]) return 1;
	MOVLW       0
	XORWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal32
	MOVLW       0
	XORWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0, 0 
L_controlador_FMF_xfl_sh_triangular_equal32:
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal6
	MOVFF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+0, FSR0
	MOVFF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal6
L_controlador_FMF_xfl_sh_triangular_equal28:
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	GOTO        L_end_FMF_xfl_sh_triangular_equal
L_controlador_FMF_xfl_sh_triangular_equal6:
;controlador.c,27 :: 		if(i==length-1 && x>p[length-1]) return 1;
	MOVLW       1
	SUBWF       FARG_controlador_FMF_xfl_sh_triangular_equal_length+0, 0 
	MOVWF       R1 
	MOVLW       0
	SUBWFB      FARG_controlador_FMF_xfl_sh_triangular_equal_length+1, 0 
	MOVWF       R2 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_i+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal33
	MOVF        R1, 0 
	XORWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0, 0 
L_controlador_FMF_xfl_sh_triangular_equal33:
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal9
	MOVLW       1
	SUBWF       FARG_controlador_FMF_xfl_sh_triangular_equal_length+0, 0 
	MOVWF       R3 
	MOVLW       0
	SUBWFB      FARG_controlador_FMF_xfl_sh_triangular_equal_length+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+0, 0 
	MOVWF       FSR2 
	MOVF        R1, 0 
	ADDWFC      FARG_controlador_FMF_xfl_sh_triangular_equal_p+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        POSTINC2+0, 0 
	MOVWF       R3 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R4 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R5 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R6 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal9
L_controlador_FMF_xfl_sh_triangular_equal27:
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	GOTO        L_end_FMF_xfl_sh_triangular_equal
L_controlador_FMF_xfl_sh_triangular_equal9:
;controlador.c,28 :: 		return (a<x && x<=b? (x-a)/(b-a) : (b<x && x<c? (c-x)/(c-b) : 0));
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R4 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R5 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R6 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R7 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal12
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R4 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R5 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R6 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R7 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal12
L_controlador_FMF_xfl_sh_triangular_equal26:
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+1, 0 
	MOVWF       R5 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+2, 0 
	MOVWF       R6 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+3, 0 
	MOVWF       R7 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+0 
	MOVF        R1, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+1 
	MOVF        R2, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+2 
	MOVF        R3, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+3 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+1, 0 
	MOVWF       R5 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+2, 0 
	MOVWF       R6 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_a_L0+3, 0 
	MOVWF       R7 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+0, 0 
	MOVWF       R0 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+1, 0 
	MOVWF       R1 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+2, 0 
	MOVWF       R2 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+0 
	MOVF        R1, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+1 
	MOVF        R2, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+2 
	MOVF        R3, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+3 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal13
L_controlador_FMF_xfl_sh_triangular_equal12:
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R4 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R5 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R6 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R7 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal16
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+1, 0 
	MOVWF       R5 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+2, 0 
	MOVWF       R6 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+3, 0 
	MOVWF       R7 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal16
L_controlador_FMF_xfl_sh_triangular_equal25:
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+0, 0 
	MOVWF       R4 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+1, 0 
	MOVWF       R5 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+2, 0 
	MOVWF       R6 
	MOVF        FARG_controlador_FMF_xfl_sh_triangular_equal_x+3, 0 
	MOVWF       R7 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+0 
	MOVF        R1, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+1 
	MOVF        R2, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+2 
	MOVF        R3, 0 
	MOVWF       FLOC_controlador_FMF_xfl_sh_triangular_equal+3 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+1, 0 
	MOVWF       R5 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+2, 0 
	MOVWF       R6 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_b_L0+3, 0 
	MOVWF       R7 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_FMF_xfl_sh_triangular_equal_c_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+0, 0 
	MOVWF       R0 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+1, 0 
	MOVWF       R1 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+2, 0 
	MOVWF       R2 
	MOVF        FLOC_controlador_FMF_xfl_sh_triangular_equal+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+0 
	MOVF        R1, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+1 
	MOVF        R2, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+2 
	MOVF        R3, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+3 
	GOTO        L_controlador_FMF_xfl_sh_triangular_equal17
L_controlador_FMF_xfl_sh_triangular_equal16:
	CLRF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+0 
	CLRF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+1 
	CLRF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+2 
	CLRF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+3 
L_controlador_FMF_xfl_sh_triangular_equal17:
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+0, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+0 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+1, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+1 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+2, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+2 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT43+3, 0 
	MOVWF       controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+3 
L_controlador_FMF_xfl_sh_triangular_equal13:
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+0, 0 
	MOVWF       R0 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+1, 0 
	MOVWF       R1 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+2, 0 
	MOVWF       R2 
	MOVF        controlador_?FLOC__controlador_FMF_xfl_sh_triangular_equalT36+3, 0 
	MOVWF       R3 
;controlador.c,29 :: 		}
L_end_FMF_xfl_sh_triangular_equal:
	RETURN      0
; end of controlador_FMF_xfl_sh_triangular_equal

controlador_MF_xfl_singleton_equal:

;controlador.c,39 :: 		static double MF_xfl_singleton_equal(double x, double min, double max, double step, double a) {
;controlador.c,40 :: 		return (x==a? 1 : 0);
	MOVF        FARG_controlador_MF_xfl_singleton_equal_a+0, 0 
	MOVWF       R4 
	MOVF        FARG_controlador_MF_xfl_singleton_equal_a+1, 0 
	MOVWF       R5 
	MOVF        FARG_controlador_MF_xfl_singleton_equal_a+2, 0 
	MOVWF       R6 
	MOVF        FARG_controlador_MF_xfl_singleton_equal_a+3, 0 
	MOVWF       R7 
	MOVF        FARG_controlador_MF_xfl_singleton_equal_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_controlador_MF_xfl_singleton_equal_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_controlador_MF_xfl_singleton_equal_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_controlador_MF_xfl_singleton_equal_x+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_MF_xfl_singleton_equal18
	MOVLW       1
	MOVWF       controlador_?FLOC__controlador_MF_xfl_singleton_equalT45+0 
	GOTO        L_controlador_MF_xfl_singleton_equal19
L_controlador_MF_xfl_singleton_equal18:
	CLRF        controlador_?FLOC__controlador_MF_xfl_singleton_equalT45+0 
L_controlador_MF_xfl_singleton_equal19:
	MOVF        controlador_?FLOC__controlador_MF_xfl_singleton_equalT45+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       controlador_?FLOC__controlador_MF_xfl_singleton_equalT45+0, 7 
	MOVLW       255
	MOVWF       R1 
	CALL        _int2double+0, 0
;controlador.c,42 :: 		}
L_end_MF_xfl_singleton_equal:
	RETURN      0
; end of controlador_MF_xfl_singleton_equal

controlador_OP_ope_And:

;controlador.c,52 :: 		static double OP_ope_And(double a, double b) {
;controlador.c,53 :: 		return a*b;
	MOVF        FARG_controlador_OP_ope_And_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_controlador_OP_ope_And_a+1, 0 
	MOVWF       R1 
	MOVF        FARG_controlador_OP_ope_And_a+2, 0 
	MOVWF       R2 
	MOVF        FARG_controlador_OP_ope_And_a+3, 0 
	MOVWF       R3 
	MOVF        FARG_controlador_OP_ope_And_b+0, 0 
	MOVWF       R4 
	MOVF        FARG_controlador_OP_ope_And_b+1, 0 
	MOVWF       R5 
	MOVF        FARG_controlador_OP_ope_And_b+2, 0 
	MOVWF       R6 
	MOVF        FARG_controlador_OP_ope_And_b+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;controlador.c,55 :: 		}
L_end_OP_ope_And:
	RETURN      0
; end of controlador_OP_ope_And

controlador_OP_ope_Defuz:

;controlador.c,61 :: 		static double OP_ope_Defuz(FuzzyNumber mf) {
;controlador.c,62 :: 		double min = mf.min;
	MOVF        FARG_controlador_OP_ope_Defuz_mf+0, 0 
	MOVWF       controlador_OP_ope_Defuz_min_L0+0 
	MOVF        FARG_controlador_OP_ope_Defuz_mf+1, 0 
	MOVWF       controlador_OP_ope_Defuz_min_L0+1 
	MOVF        FARG_controlador_OP_ope_Defuz_mf+2, 0 
	MOVWF       controlador_OP_ope_Defuz_min_L0+2 
	MOVF        FARG_controlador_OP_ope_Defuz_mf+3, 0 
	MOVWF       controlador_OP_ope_Defuz_min_L0+3 
;controlador.c,63 :: 		double max = mf.max;
	MOVF        FARG_controlador_OP_ope_Defuz_mf+4, 0 
	MOVWF       controlador_OP_ope_Defuz_max_L0+0 
	MOVF        FARG_controlador_OP_ope_Defuz_mf+5, 0 
	MOVWF       controlador_OP_ope_Defuz_max_L0+1 
	MOVF        FARG_controlador_OP_ope_Defuz_mf+6, 0 
	MOVWF       controlador_OP_ope_Defuz_max_L0+2 
	MOVF        FARG_controlador_OP_ope_Defuz_mf+7, 0 
	MOVWF       controlador_OP_ope_Defuz_max_L0+3 
;controlador.c,64 :: 		double num=0, denom=0;
	CLRF        controlador_OP_ope_Defuz_num_L0+0 
	CLRF        controlador_OP_ope_Defuz_num_L0+1 
	CLRF        controlador_OP_ope_Defuz_num_L0+2 
	CLRF        controlador_OP_ope_Defuz_num_L0+3 
	CLRF        controlador_OP_ope_Defuz_denom_L0+0 
	CLRF        controlador_OP_ope_Defuz_denom_L0+1 
	CLRF        controlador_OP_ope_Defuz_denom_L0+2 
	CLRF        controlador_OP_ope_Defuz_denom_L0+3 
;controlador.c,66 :: 		for(i=0; i<mf.length; i++) {
	CLRF        controlador_OP_ope_Defuz_i_L0+0 
	CLRF        controlador_OP_ope_Defuz_i_L0+1 
L_controlador_OP_ope_Defuz20:
	MOVLW       128
	XORWF       controlador_OP_ope_Defuz_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_controlador_OP_ope_Defuz_mf+21, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_OP_ope_Defuz37
	MOVF        FARG_controlador_OP_ope_Defuz_mf+20, 0 
	SUBWF       controlador_OP_ope_Defuz_i_L0+0, 0 
L_controlador_OP_ope_Defuz37:
	BTFSC       STATUS+0, 0 
	GOTO        L_controlador_OP_ope_Defuz21
;controlador.c,67 :: 		num += mf.degree[i] * mf.conc[i].center();
	MOVF        controlador_OP_ope_Defuz_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_OP_ope_Defuz_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_controlador_OP_ope_Defuz_mf+22, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_controlador_OP_ope_Defuz_mf+23, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC_controlador_OP_ope_Defuz+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC_controlador_OP_ope_Defuz+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC_controlador_OP_ope_Defuz+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC_controlador_OP_ope_Defuz+3 
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_OP_ope_Defuz_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_OP_ope_Defuz_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_OP_ope_Defuz38:
	BZ          L_controlador_OP_ope_Defuz39
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_OP_ope_Defuz38
L_controlador_OP_ope_Defuz39:
	MOVF        FARG_controlador_OP_ope_Defuz_mf+28, 0 
	ADDWF       R0, 1 
	MOVF        FARG_controlador_OP_ope_Defuz_mf+29, 0 
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
	MOVF        FLOC_controlador_OP_ope_Defuz+0, 0 
	MOVWF       R4 
	MOVF        FLOC_controlador_OP_ope_Defuz+1, 0 
	MOVWF       R5 
	MOVF        FLOC_controlador_OP_ope_Defuz+2, 0 
	MOVWF       R6 
	MOVF        FLOC_controlador_OP_ope_Defuz+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        controlador_OP_ope_Defuz_num_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_OP_ope_Defuz_num_L0+1, 0 
	MOVWF       R5 
	MOVF        controlador_OP_ope_Defuz_num_L0+2, 0 
	MOVWF       R6 
	MOVF        controlador_OP_ope_Defuz_num_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_OP_ope_Defuz_num_L0+0 
	MOVF        R1, 0 
	MOVWF       controlador_OP_ope_Defuz_num_L0+1 
	MOVF        R2, 0 
	MOVWF       controlador_OP_ope_Defuz_num_L0+2 
	MOVF        R3, 0 
	MOVWF       controlador_OP_ope_Defuz_num_L0+3 
;controlador.c,68 :: 		denom += mf.degree[i];
	MOVF        controlador_OP_ope_Defuz_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_OP_ope_Defuz_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_controlador_OP_ope_Defuz_mf+22, 0 
	MOVWF       FSR2 
	MOVF        R1, 0 
	ADDWFC      FARG_controlador_OP_ope_Defuz_mf+23, 0 
	MOVWF       FSR2H 
	MOVF        controlador_OP_ope_Defuz_denom_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_OP_ope_Defuz_denom_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_OP_ope_Defuz_denom_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_OP_ope_Defuz_denom_L0+3, 0 
	MOVWF       R3 
	MOVF        POSTINC2+0, 0 
	MOVWF       R4 
	MOVF        POSTINC2+0, 0 
	MOVWF       R5 
	MOVF        POSTINC2+0, 0 
	MOVWF       R6 
	MOVF        POSTINC2+0, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_OP_ope_Defuz_denom_L0+0 
	MOVF        R1, 0 
	MOVWF       controlador_OP_ope_Defuz_denom_L0+1 
	MOVF        R2, 0 
	MOVWF       controlador_OP_ope_Defuz_denom_L0+2 
	MOVF        R3, 0 
	MOVWF       controlador_OP_ope_Defuz_denom_L0+3 
;controlador.c,66 :: 		for(i=0; i<mf.length; i++) {
	INFSNZ      controlador_OP_ope_Defuz_i_L0+0, 1 
	INCF        controlador_OP_ope_Defuz_i_L0+1, 1 
;controlador.c,69 :: 		}
	GOTO        L_controlador_OP_ope_Defuz20
L_controlador_OP_ope_Defuz21:
;controlador.c,70 :: 		if(denom==0) return (min+max)/2;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        controlador_OP_ope_Defuz_denom_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_OP_ope_Defuz_denom_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_OP_ope_Defuz_denom_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_OP_ope_Defuz_denom_L0+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controlador_OP_ope_Defuz23
	MOVF        controlador_OP_ope_Defuz_min_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_OP_ope_Defuz_min_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_OP_ope_Defuz_min_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_OP_ope_Defuz_min_L0+3, 0 
	MOVWF       R3 
	MOVF        controlador_OP_ope_Defuz_max_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_OP_ope_Defuz_max_L0+1, 0 
	MOVWF       R5 
	MOVF        controlador_OP_ope_Defuz_max_L0+2, 0 
	MOVWF       R6 
	MOVF        controlador_OP_ope_Defuz_max_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	GOTO        L_end_OP_ope_Defuz
L_controlador_OP_ope_Defuz23:
;controlador.c,71 :: 		return num/denom;
	MOVF        controlador_OP_ope_Defuz_denom_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_OP_ope_Defuz_denom_L0+1, 0 
	MOVWF       R5 
	MOVF        controlador_OP_ope_Defuz_denom_L0+2, 0 
	MOVWF       R6 
	MOVF        controlador_OP_ope_Defuz_denom_L0+3, 0 
	MOVWF       R7 
	MOVF        controlador_OP_ope_Defuz_num_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_OP_ope_Defuz_num_L0+1, 0 
	MOVWF       R1 
	MOVF        controlador_OP_ope_Defuz_num_L0+2, 0 
	MOVWF       R2 
	MOVF        controlador_OP_ope_Defuz_num_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
;controlador.c,73 :: 		}
L_end_OP_ope_Defuz:
	RETURN      0
; end of controlador_OP_ope_Defuz

controlador_TP_T_error_fam_equal:

;controlador.c,84 :: 		static double TP_T_error_fam_equal(double x, int i){
;controlador.c,85 :: 		double list[5] = {-50.0,-5.0,0.0,5.0,50.0};
	MOVLW       ?ICScontrolador_TP_T_error_fam_equal_list_L0+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICScontrolador_TP_T_error_fam_equal_list_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICScontrolador_TP_T_error_fam_equal_list_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       controlador_TP_T_error_fam_equal_list_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_TP_T_error_fam_equal_list_L0+0)
	MOVWF       FSR1H 
	MOVLW       20
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;controlador.c,86 :: 		return FMF_xfl_sh_triangular_equal(x,i,-1500.0,1500.0,11.764705882352942,list,5);
	MOVF        FARG_controlador_TP_T_error_fam_equal_x+0, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+0 
	MOVF        FARG_controlador_TP_T_error_fam_equal_x+1, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+1 
	MOVF        FARG_controlador_TP_T_error_fam_equal_x+2, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+2 
	MOVF        FARG_controlador_TP_T_error_fam_equal_x+3, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+3 
	MOVF        FARG_controlador_TP_T_error_fam_equal_i+0, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0 
	MOVF        FARG_controlador_TP_T_error_fam_equal_i+1, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+1 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+0 
	MOVLW       128
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+1 
	MOVLW       187
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+2 
	MOVLW       137
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+3 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+0 
	MOVLW       128
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+1 
	MOVLW       59
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+2 
	MOVLW       137
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+3 
	MOVLW       60
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+0 
	MOVLW       60
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+1 
	MOVLW       60
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+2 
	MOVLW       130
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+3 
	MOVLW       controlador_TP_T_error_fam_equal_list_L0+0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+0 
	MOVLW       hi_addr(controlador_TP_T_error_fam_equal_list_L0+0)
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+1 
	MOVLW       5
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_length+0 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_length+1 
	CALL        controlador_FMF_xfl_sh_triangular_equal+0, 0
;controlador.c,87 :: 		}
L_end_TP_T_error_fam_equal:
	RETURN      0
; end of controlador_TP_T_error_fam_equal

controlador_TP_T_error_muynegativo_equal:

;controlador.c,93 :: 		static double TP_T_error_muynegativo_equal(double x){
;controlador.c,94 :: 		return TP_T_error_fam_equal(x,0);}
	MOVF        FARG_controlador_TP_T_error_muynegativo_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_error_muynegativo_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_error_muynegativo_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_error_muynegativo_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+3 
	CLRF        FARG_controlador_TP_T_error_fam_equal_i+0 
	CLRF        FARG_controlador_TP_T_error_fam_equal_i+1 
	CALL        controlador_TP_T_error_fam_equal+0, 0
L_end_TP_T_error_muynegativo_equal:
	RETURN      0
; end of controlador_TP_T_error_muynegativo_equal

controlador_TP_T_error_negativo_equal:

;controlador.c,100 :: 		static double TP_T_error_negativo_equal(double x){
;controlador.c,101 :: 		return TP_T_error_fam_equal(x,1);}
	MOVF        FARG_controlador_TP_T_error_negativo_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_error_negativo_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_error_negativo_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_error_negativo_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+3 
	MOVLW       1
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+1 
	CALL        controlador_TP_T_error_fam_equal+0, 0
L_end_TP_T_error_negativo_equal:
	RETURN      0
; end of controlador_TP_T_error_negativo_equal

controlador_TP_T_error_cero_equal:

;controlador.c,107 :: 		static double TP_T_error_cero_equal(double x){
;controlador.c,108 :: 		return TP_T_error_fam_equal(x,2);}
	MOVF        FARG_controlador_TP_T_error_cero_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_error_cero_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_error_cero_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_error_cero_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+3 
	MOVLW       2
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+1 
	CALL        controlador_TP_T_error_fam_equal+0, 0
L_end_TP_T_error_cero_equal:
	RETURN      0
; end of controlador_TP_T_error_cero_equal

controlador_TP_T_error_positivo_equal:

;controlador.c,114 :: 		static double TP_T_error_positivo_equal(double x){
;controlador.c,115 :: 		return TP_T_error_fam_equal(x,3);}
	MOVF        FARG_controlador_TP_T_error_positivo_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_error_positivo_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_error_positivo_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_error_positivo_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+3 
	MOVLW       3
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+1 
	CALL        controlador_TP_T_error_fam_equal+0, 0
L_end_TP_T_error_positivo_equal:
	RETURN      0
; end of controlador_TP_T_error_positivo_equal

controlador_TP_T_error_muyposito_equal:

;controlador.c,121 :: 		static double TP_T_error_muyposito_equal(double x){
;controlador.c,122 :: 		return TP_T_error_fam_equal(x,4);}
	MOVF        FARG_controlador_TP_T_error_muyposito_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_error_muyposito_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_error_muyposito_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_error_muyposito_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_error_fam_equal_x+3 
	MOVLW       4
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_error_fam_equal_i+1 
	CALL        controlador_TP_T_error_fam_equal+0, 0
L_end_TP_T_error_muyposito_equal:
	RETURN      0
; end of controlador_TP_T_error_muyposito_equal

controlador_TP_T_Cambio_e_fam_equal:

;controlador.c,132 :: 		static double TP_T_Cambio_e_fam_equal(double x, int i){
;controlador.c,133 :: 		double list[5] = {-10.0,-2.0,0.0,2.0,10.0};
	MOVLW       ?ICScontrolador_TP_T_Cambio_e_fam_equal_list_L0+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICScontrolador_TP_T_Cambio_e_fam_equal_list_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICScontrolador_TP_T_Cambio_e_fam_equal_list_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       controlador_TP_T_Cambio_e_fam_equal_list_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_TP_T_Cambio_e_fam_equal_list_L0+0)
	MOVWF       FSR1H 
	MOVLW       20
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;controlador.c,134 :: 		return FMF_xfl_sh_triangular_equal(x,i,-20.0,20.0,0.1568627450980392,list,5);
	MOVF        FARG_controlador_TP_T_Cambio_e_fam_equal_x+0, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+0 
	MOVF        FARG_controlador_TP_T_Cambio_e_fam_equal_x+1, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+1 
	MOVF        FARG_controlador_TP_T_Cambio_e_fam_equal_x+2, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+2 
	MOVF        FARG_controlador_TP_T_Cambio_e_fam_equal_x+3, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_x+3 
	MOVF        FARG_controlador_TP_T_Cambio_e_fam_equal_i+0, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+0 
	MOVF        FARG_controlador_TP_T_Cambio_e_fam_equal_i+1, 0 
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_i+1 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+0 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+1 
	MOVLW       160
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+2 
	MOVLW       131
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_min+3 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+0 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+1 
	MOVLW       32
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+2 
	MOVLW       131
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_max+3 
	MOVLW       161
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+0 
	MOVLW       160
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+1 
	MOVLW       32
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+2 
	MOVLW       124
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_step+3 
	MOVLW       controlador_TP_T_Cambio_e_fam_equal_list_L0+0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+0 
	MOVLW       hi_addr(controlador_TP_T_Cambio_e_fam_equal_list_L0+0)
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_p+1 
	MOVLW       5
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_length+0 
	MOVLW       0
	MOVWF       FARG_controlador_FMF_xfl_sh_triangular_equal_length+1 
	CALL        controlador_FMF_xfl_sh_triangular_equal+0, 0
;controlador.c,135 :: 		}
L_end_TP_T_Cambio_e_fam_equal:
	RETURN      0
; end of controlador_TP_T_Cambio_e_fam_equal

controlador_TP_T_Cambio_e_muynegativo_equal:

;controlador.c,141 :: 		static double TP_T_Cambio_e_muynegativo_equal(double x){
;controlador.c,142 :: 		return TP_T_Cambio_e_fam_equal(x,0);}
	MOVF        FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+3 
	CLRF        FARG_controlador_TP_T_Cambio_e_fam_equal_i+0 
	CLRF        FARG_controlador_TP_T_Cambio_e_fam_equal_i+1 
	CALL        controlador_TP_T_Cambio_e_fam_equal+0, 0
L_end_TP_T_Cambio_e_muynegativo_equal:
	RETURN      0
; end of controlador_TP_T_Cambio_e_muynegativo_equal

controlador_TP_T_Cambio_e_negativo_equal:

;controlador.c,148 :: 		static double TP_T_Cambio_e_negativo_equal(double x){
;controlador.c,149 :: 		return TP_T_Cambio_e_fam_equal(x,1);}
	MOVF        FARG_controlador_TP_T_Cambio_e_negativo_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_Cambio_e_negativo_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_Cambio_e_negativo_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_Cambio_e_negativo_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+3 
	MOVLW       1
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+1 
	CALL        controlador_TP_T_Cambio_e_fam_equal+0, 0
L_end_TP_T_Cambio_e_negativo_equal:
	RETURN      0
; end of controlador_TP_T_Cambio_e_negativo_equal

controlador_TP_T_Cambio_e_neutro_equal:

;controlador.c,155 :: 		static double TP_T_Cambio_e_neutro_equal(double x){
;controlador.c,156 :: 		return TP_T_Cambio_e_fam_equal(x,2);}
	MOVF        FARG_controlador_TP_T_Cambio_e_neutro_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_Cambio_e_neutro_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_Cambio_e_neutro_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_Cambio_e_neutro_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+3 
	MOVLW       2
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+1 
	CALL        controlador_TP_T_Cambio_e_fam_equal+0, 0
L_end_TP_T_Cambio_e_neutro_equal:
	RETURN      0
; end of controlador_TP_T_Cambio_e_neutro_equal

controlador_TP_T_Cambio_e_positivo_equal:

;controlador.c,162 :: 		static double TP_T_Cambio_e_positivo_equal(double x){
;controlador.c,163 :: 		return TP_T_Cambio_e_fam_equal(x,3);}
	MOVF        FARG_controlador_TP_T_Cambio_e_positivo_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_Cambio_e_positivo_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_Cambio_e_positivo_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_Cambio_e_positivo_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+3 
	MOVLW       3
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+1 
	CALL        controlador_TP_T_Cambio_e_fam_equal+0, 0
L_end_TP_T_Cambio_e_positivo_equal:
	RETURN      0
; end of controlador_TP_T_Cambio_e_positivo_equal

controlador_TP_T_Cambio_e_muypositivo_equal:

;controlador.c,169 :: 		static double TP_T_Cambio_e_muypositivo_equal(double x){
;controlador.c,170 :: 		return TP_T_Cambio_e_fam_equal(x,4);}
	MOVF        FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+0 
	MOVF        FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+1 
	MOVF        FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+2 
	MOVF        FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_x+3 
	MOVLW       4
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+0 
	MOVLW       0
	MOVWF       FARG_controlador_TP_T_Cambio_e_fam_equal_i+1 
	CALL        controlador_TP_T_Cambio_e_fam_equal+0, 0
L_end_TP_T_Cambio_e_muypositivo_equal:
	RETURN      0
; end of controlador_TP_T_Cambio_e_muypositivo_equal

controlador_TP_T_pwm_minimo_equal:

;controlador.c,180 :: 		static double TP_T_pwm_minimo_equal(double x){
;controlador.c,181 :: 		return MF_xfl_singleton_equal(x,0.0,255.0,1.0,0.0);
	MOVF        FARG_controlador_TP_T_pwm_minimo_equal_x+0, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+0 
	MOVF        FARG_controlador_TP_T_pwm_minimo_equal_x+1, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+1 
	MOVF        FARG_controlador_TP_T_pwm_minimo_equal_x+2, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+2 
	MOVF        FARG_controlador_TP_T_pwm_minimo_equal_x+3, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+3 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+0 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+1 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+2 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+2 
	MOVLW       134
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+1 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+2 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+3 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_a+0 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_a+1 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_a+2 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_a+3 
	CALL        controlador_MF_xfl_singleton_equal+0, 0
;controlador.c,182 :: 		}
L_end_TP_T_pwm_minimo_equal:
	RETURN      0
; end of controlador_TP_T_pwm_minimo_equal

controlador_TP_T_pwm_minimo_center:

;controlador.c,184 :: 		static double TP_T_pwm_minimo_center(){
;controlador.c,185 :: 		return 0.0;
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
;controlador.c,186 :: 		}
L_end_TP_T_pwm_minimo_center:
	RETURN      0
; end of controlador_TP_T_pwm_minimo_center

controlador_TP_T_pwm_bajo_equal:

;controlador.c,192 :: 		static double TP_T_pwm_bajo_equal(double x){
;controlador.c,193 :: 		return MF_xfl_singleton_equal(x,0.0,255.0,1.0,63.75);
	MOVF        FARG_controlador_TP_T_pwm_bajo_equal_x+0, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+0 
	MOVF        FARG_controlador_TP_T_pwm_bajo_equal_x+1, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+1 
	MOVF        FARG_controlador_TP_T_pwm_bajo_equal_x+2, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+2 
	MOVF        FARG_controlador_TP_T_pwm_bajo_equal_x+3, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+3 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+0 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+1 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+2 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+2 
	MOVLW       134
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+1 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+2 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+2 
	MOVLW       132
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+3 
	CALL        controlador_MF_xfl_singleton_equal+0, 0
;controlador.c,194 :: 		}
L_end_TP_T_pwm_bajo_equal:
	RETURN      0
; end of controlador_TP_T_pwm_bajo_equal

controlador_TP_T_pwm_bajo_center:

;controlador.c,196 :: 		static double TP_T_pwm_bajo_center(){
;controlador.c,197 :: 		return 63.75;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
;controlador.c,198 :: 		}
L_end_TP_T_pwm_bajo_center:
	RETURN      0
; end of controlador_TP_T_pwm_bajo_center

controlador_TP_T_pwm_medio_equal:

;controlador.c,204 :: 		static double TP_T_pwm_medio_equal(double x){
;controlador.c,205 :: 		return MF_xfl_singleton_equal(x,0.0,255.0,1.0,127.5);
	MOVF        FARG_controlador_TP_T_pwm_medio_equal_x+0, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+0 
	MOVF        FARG_controlador_TP_T_pwm_medio_equal_x+1, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+1 
	MOVF        FARG_controlador_TP_T_pwm_medio_equal_x+2, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+2 
	MOVF        FARG_controlador_TP_T_pwm_medio_equal_x+3, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+3 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+0 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+1 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+2 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+2 
	MOVLW       134
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+1 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+2 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+2 
	MOVLW       133
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+3 
	CALL        controlador_MF_xfl_singleton_equal+0, 0
;controlador.c,206 :: 		}
L_end_TP_T_pwm_medio_equal:
	RETURN      0
; end of controlador_TP_T_pwm_medio_equal

controlador_TP_T_pwm_medio_center:

;controlador.c,208 :: 		static double TP_T_pwm_medio_center(){
;controlador.c,209 :: 		return 127.5;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
;controlador.c,210 :: 		}
L_end_TP_T_pwm_medio_center:
	RETURN      0
; end of controlador_TP_T_pwm_medio_center

controlador_TP_T_pwm_alto_equal:

;controlador.c,216 :: 		static double TP_T_pwm_alto_equal(double x){
;controlador.c,217 :: 		return MF_xfl_singleton_equal(x,0.0,255.0,1.0,191.25);
	MOVF        FARG_controlador_TP_T_pwm_alto_equal_x+0, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+0 
	MOVF        FARG_controlador_TP_T_pwm_alto_equal_x+1, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+1 
	MOVF        FARG_controlador_TP_T_pwm_alto_equal_x+2, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+2 
	MOVF        FARG_controlador_TP_T_pwm_alto_equal_x+3, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+3 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+0 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+1 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+2 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+2 
	MOVLW       134
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+1 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+2 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+0 
	MOVLW       64
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+1 
	MOVLW       63
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+2 
	MOVLW       134
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+3 
	CALL        controlador_MF_xfl_singleton_equal+0, 0
;controlador.c,218 :: 		}
L_end_TP_T_pwm_alto_equal:
	RETURN      0
; end of controlador_TP_T_pwm_alto_equal

controlador_TP_T_pwm_alto_center:

;controlador.c,220 :: 		static double TP_T_pwm_alto_center(){
;controlador.c,221 :: 		return 191.25;
	MOVLW       0
	MOVWF       R0 
	MOVLW       64
	MOVWF       R1 
	MOVLW       63
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
;controlador.c,222 :: 		}
L_end_TP_T_pwm_alto_center:
	RETURN      0
; end of controlador_TP_T_pwm_alto_center

controlador_TP_T_pwm_maximo_equal:

;controlador.c,228 :: 		static double TP_T_pwm_maximo_equal(double x){
;controlador.c,229 :: 		return MF_xfl_singleton_equal(x,0.0,255.0,1.0,255.0);
	MOVF        FARG_controlador_TP_T_pwm_maximo_equal_x+0, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+0 
	MOVF        FARG_controlador_TP_T_pwm_maximo_equal_x+1, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+1 
	MOVF        FARG_controlador_TP_T_pwm_maximo_equal_x+2, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+2 
	MOVF        FARG_controlador_TP_T_pwm_maximo_equal_x+3, 0 
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_x+3 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+0 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+1 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+2 
	CLRF        FARG_controlador_MF_xfl_singleton_equal_min+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+2 
	MOVLW       134
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_max+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+1 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+2 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_step+3 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+0 
	MOVLW       0
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+1 
	MOVLW       127
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+2 
	MOVLW       134
	MOVWF       FARG_controlador_MF_xfl_singleton_equal_a+3 
	CALL        controlador_MF_xfl_singleton_equal+0, 0
;controlador.c,230 :: 		}
L_end_TP_T_pwm_maximo_equal:
	RETURN      0
; end of controlador_TP_T_pwm_maximo_equal

controlador_TP_T_pwm_maximo_center:

;controlador.c,232 :: 		static double TP_T_pwm_maximo_center(){
;controlador.c,233 :: 		return 255.0;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
;controlador.c,234 :: 		}
L_end_TP_T_pwm_maximo_center:
	RETURN      0
; end of controlador_TP_T_pwm_maximo_center

controlador_RL_reglas:

;controlador.c,240 :: 		static void RL_reglas(double error, double Cambio_e, double *pwm) {
;controlador.c,246 :: 		int _pwm_i = 0;
	CLRF        controlador_RL_reglas__pwm_i_L0+0 
	CLRF        controlador_RL_reglas__pwm_i_L0+1 
;controlador.c,252 :: 		_pwm.min = 0.0;
	CLRF        controlador_RL_reglas__pwm_L0+0 
	CLRF        controlador_RL_reglas__pwm_L0+1 
	CLRF        controlador_RL_reglas__pwm_L0+2 
	CLRF        controlador_RL_reglas__pwm_L0+3 
;controlador.c,253 :: 		_pwm.max = 255.0;
	MOVLW       0
	MOVWF       controlador_RL_reglas__pwm_L0+4 
	MOVLW       0
	MOVWF       controlador_RL_reglas__pwm_L0+5 
	MOVLW       127
	MOVWF       controlador_RL_reglas__pwm_L0+6 
	MOVLW       134
	MOVWF       controlador_RL_reglas__pwm_L0+7 
;controlador.c,254 :: 		_pwm.step = 1.0;
	MOVLW       0
	MOVWF       controlador_RL_reglas__pwm_L0+8 
	MOVLW       0
	MOVWF       controlador_RL_reglas__pwm_L0+9 
	MOVLW       0
	MOVWF       controlador_RL_reglas__pwm_L0+10 
	MOVLW       127
	MOVWF       controlador_RL_reglas__pwm_L0+11 
;controlador.c,255 :: 		_pwm.length = 25;
	MOVLW       25
	MOVWF       controlador_RL_reglas__pwm_L0+20 
	MOVLW       0
	MOVWF       controlador_RL_reglas__pwm_L0+21 
;controlador.c,256 :: 		_pwm.degree = _pwm_degree;
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	MOVWF       controlador_RL_reglas__pwm_L0+22 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	MOVWF       controlador_RL_reglas__pwm_L0+23 
;controlador.c,257 :: 		_pwm.conc = _pwm_conc;
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	MOVWF       controlador_RL_reglas__pwm_L0+28 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	MOVWF       controlador_RL_reglas__pwm_L0+29 
;controlador.c,258 :: 		_error_eq[0] = TP_T_error_muynegativo_equal(error);
	MOVF        FARG_controlador_RL_reglas_error+0, 0 
	MOVWF       FARG_controlador_TP_T_error_muynegativo_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_error+1, 0 
	MOVWF       FARG_controlador_TP_T_error_muynegativo_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_error+2, 0 
	MOVWF       FARG_controlador_TP_T_error_muynegativo_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_error+3, 0 
	MOVWF       FARG_controlador_TP_T_error_muynegativo_equal_x+3 
	CALL        controlador_TP_T_error_muynegativo_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+0 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+1 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+2 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+3 
;controlador.c,259 :: 		_error_eq[1] = TP_T_error_negativo_equal(error);
	MOVF        FARG_controlador_RL_reglas_error+0, 0 
	MOVWF       FARG_controlador_TP_T_error_negativo_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_error+1, 0 
	MOVWF       FARG_controlador_TP_T_error_negativo_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_error+2, 0 
	MOVWF       FARG_controlador_TP_T_error_negativo_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_error+3, 0 
	MOVWF       FARG_controlador_TP_T_error_negativo_equal_x+3 
	CALL        controlador_TP_T_error_negativo_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+4 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+5 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+6 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+7 
;controlador.c,260 :: 		_error_eq[2] = TP_T_error_cero_equal(error);
	MOVF        FARG_controlador_RL_reglas_error+0, 0 
	MOVWF       FARG_controlador_TP_T_error_cero_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_error+1, 0 
	MOVWF       FARG_controlador_TP_T_error_cero_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_error+2, 0 
	MOVWF       FARG_controlador_TP_T_error_cero_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_error+3, 0 
	MOVWF       FARG_controlador_TP_T_error_cero_equal_x+3 
	CALL        controlador_TP_T_error_cero_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+8 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+9 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+10 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+11 
;controlador.c,261 :: 		_error_eq[3] = TP_T_error_positivo_equal(error);
	MOVF        FARG_controlador_RL_reglas_error+0, 0 
	MOVWF       FARG_controlador_TP_T_error_positivo_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_error+1, 0 
	MOVWF       FARG_controlador_TP_T_error_positivo_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_error+2, 0 
	MOVWF       FARG_controlador_TP_T_error_positivo_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_error+3, 0 
	MOVWF       FARG_controlador_TP_T_error_positivo_equal_x+3 
	CALL        controlador_TP_T_error_positivo_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+12 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+13 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+14 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+15 
;controlador.c,262 :: 		_error_eq[4] = TP_T_error_muyposito_equal(error);
	MOVF        FARG_controlador_RL_reglas_error+0, 0 
	MOVWF       FARG_controlador_TP_T_error_muyposito_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_error+1, 0 
	MOVWF       FARG_controlador_TP_T_error_muyposito_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_error+2, 0 
	MOVWF       FARG_controlador_TP_T_error_muyposito_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_error+3, 0 
	MOVWF       FARG_controlador_TP_T_error_muyposito_equal_x+3 
	CALL        controlador_TP_T_error_muyposito_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+16 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+17 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+18 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__error_eq_L0+19 
;controlador.c,265 :: 		_Cambio_e_eq[0] = TP_T_Cambio_e_muynegativo_equal(Cambio_e);
	MOVF        FARG_controlador_RL_reglas_Cambio_e+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muynegativo_equal_x+3 
	CALL        controlador_TP_T_Cambio_e_muynegativo_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+0 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+1 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+2 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+3 
;controlador.c,266 :: 		_Cambio_e_eq[1] = TP_T_Cambio_e_negativo_equal(Cambio_e);
	MOVF        FARG_controlador_RL_reglas_Cambio_e+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_negativo_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_negativo_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_negativo_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_negativo_equal_x+3 
	CALL        controlador_TP_T_Cambio_e_negativo_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+4 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+5 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+6 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+7 
;controlador.c,267 :: 		_Cambio_e_eq[2] = TP_T_Cambio_e_neutro_equal(Cambio_e);
	MOVF        FARG_controlador_RL_reglas_Cambio_e+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_neutro_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_neutro_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_neutro_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_neutro_equal_x+3 
	CALL        controlador_TP_T_Cambio_e_neutro_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+8 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+9 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+10 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+11 
;controlador.c,268 :: 		_Cambio_e_eq[3] = TP_T_Cambio_e_positivo_equal(Cambio_e);
	MOVF        FARG_controlador_RL_reglas_Cambio_e+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_positivo_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_positivo_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_positivo_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_positivo_equal_x+3 
	CALL        controlador_TP_T_Cambio_e_positivo_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+12 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+13 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+14 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+15 
;controlador.c,269 :: 		_Cambio_e_eq[4] = TP_T_Cambio_e_muypositivo_equal(Cambio_e);
	MOVF        FARG_controlador_RL_reglas_Cambio_e+0, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+0 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+1, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+1 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+2, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+2 
	MOVF        FARG_controlador_RL_reglas_Cambio_e+3, 0 
	MOVWF       FARG_controlador_TP_T_Cambio_e_muypositivo_equal_x+3 
	CALL        controlador_TP_T_Cambio_e_muypositivo_equal+0, 0
	MOVF        R0, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+16 
	MOVF        R1, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+17 
	MOVF        R2, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+18 
	MOVF        R3, 0 
	MOVWF       controlador_RL_reglas__Cambio_e_eq_L0+19 
;controlador.c,271 :: 		_rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[0]);
	MOVF        controlador_RL_reglas__error_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,272 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,273 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas63:
	BZ          L_controlador_RL_reglas64
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas63
L_controlador_RL_reglas64:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_minimo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_minimo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,274 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas65:
	BZ          L_controlador_RL_reglas66
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas65
L_controlador_RL_reglas66:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,275 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,277 :: 		_rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[1]);
	MOVF        controlador_RL_reglas__error_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,278 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,279 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas67:
	BZ          L_controlador_RL_reglas68
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas67
L_controlador_RL_reglas68:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_minimo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_minimo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,280 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas69:
	BZ          L_controlador_RL_reglas70
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas69
L_controlador_RL_reglas70:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,281 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,283 :: 		_rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[2]);
	MOVF        controlador_RL_reglas__error_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,284 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,285 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas71:
	BZ          L_controlador_RL_reglas72
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas71
L_controlador_RL_reglas72:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_bajo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_bajo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,286 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas73:
	BZ          L_controlador_RL_reglas74
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas73
L_controlador_RL_reglas74:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,287 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,289 :: 		_rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[3]);
	MOVF        controlador_RL_reglas__error_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,290 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,291 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas75:
	BZ          L_controlador_RL_reglas76
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas75
L_controlador_RL_reglas76:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_bajo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_bajo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,292 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas77:
	BZ          L_controlador_RL_reglas78
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas77
L_controlador_RL_reglas78:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,293 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,295 :: 		_rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[4]);
	MOVF        controlador_RL_reglas__error_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,296 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,297 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas79:
	BZ          L_controlador_RL_reglas80
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas79
L_controlador_RL_reglas80:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_medio_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_medio_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,298 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas81:
	BZ          L_controlador_RL_reglas82
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas81
L_controlador_RL_reglas82:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,299 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,301 :: 		_rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[0]);
	MOVF        controlador_RL_reglas__error_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,302 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,303 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas83:
	BZ          L_controlador_RL_reglas84
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas83
L_controlador_RL_reglas84:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_minimo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_minimo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,304 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas85:
	BZ          L_controlador_RL_reglas86
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas85
L_controlador_RL_reglas86:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,305 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,307 :: 		_rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[1]);
	MOVF        controlador_RL_reglas__error_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,308 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,309 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas87:
	BZ          L_controlador_RL_reglas88
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas87
L_controlador_RL_reglas88:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_minimo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_minimo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,310 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas89:
	BZ          L_controlador_RL_reglas90
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas89
L_controlador_RL_reglas90:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,311 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,313 :: 		_rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[2]);
	MOVF        controlador_RL_reglas__error_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,314 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,315 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas91:
	BZ          L_controlador_RL_reglas92
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas91
L_controlador_RL_reglas92:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_medio_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_medio_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,316 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas93:
	BZ          L_controlador_RL_reglas94
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas93
L_controlador_RL_reglas94:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,317 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,319 :: 		_rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[3]);
	MOVF        controlador_RL_reglas__error_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,320 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,321 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas95:
	BZ          L_controlador_RL_reglas96
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas95
L_controlador_RL_reglas96:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_medio_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_medio_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,322 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas97:
	BZ          L_controlador_RL_reglas98
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas97
L_controlador_RL_reglas98:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,323 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,325 :: 		_rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[4]);
	MOVF        controlador_RL_reglas__error_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,326 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,327 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas99:
	BZ          L_controlador_RL_reglas100
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas99
L_controlador_RL_reglas100:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_alto_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_alto_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,328 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas101:
	BZ          L_controlador_RL_reglas102
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas101
L_controlador_RL_reglas102:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,329 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,331 :: 		_rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[0]);
	MOVF        controlador_RL_reglas__error_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,332 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,333 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas103:
	BZ          L_controlador_RL_reglas104
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas103
L_controlador_RL_reglas104:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_minimo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_minimo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,334 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas105:
	BZ          L_controlador_RL_reglas106
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas105
L_controlador_RL_reglas106:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,335 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,337 :: 		_rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[1]);
	MOVF        controlador_RL_reglas__error_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,338 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,339 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas107:
	BZ          L_controlador_RL_reglas108
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas107
L_controlador_RL_reglas108:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_minimo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_minimo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,340 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas109:
	BZ          L_controlador_RL_reglas110
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas109
L_controlador_RL_reglas110:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,341 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,343 :: 		_rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[2]);
	MOVF        controlador_RL_reglas__error_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,344 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,345 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas111:
	BZ          L_controlador_RL_reglas112
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas111
L_controlador_RL_reglas112:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_minimo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_minimo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,346 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas113:
	BZ          L_controlador_RL_reglas114
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas113
L_controlador_RL_reglas114:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_minimo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_minimo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,347 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,349 :: 		_rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[3]);
	MOVF        controlador_RL_reglas__error_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,350 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,351 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas115:
	BZ          L_controlador_RL_reglas116
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas115
L_controlador_RL_reglas116:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_bajo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_bajo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,352 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas117:
	BZ          L_controlador_RL_reglas118
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas117
L_controlador_RL_reglas118:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,353 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,355 :: 		_rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[4]);
	MOVF        controlador_RL_reglas__error_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,356 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,357 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas119:
	BZ          L_controlador_RL_reglas120
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas119
L_controlador_RL_reglas120:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_bajo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_bajo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,358 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas121:
	BZ          L_controlador_RL_reglas122
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas121
L_controlador_RL_reglas122:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,359 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,361 :: 		_rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[0]);
	MOVF        controlador_RL_reglas__error_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,362 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,363 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas123:
	BZ          L_controlador_RL_reglas124
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas123
L_controlador_RL_reglas124:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_bajo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_bajo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,364 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas125:
	BZ          L_controlador_RL_reglas126
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas125
L_controlador_RL_reglas126:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,365 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,367 :: 		_rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[1]);
	MOVF        controlador_RL_reglas__error_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,368 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,369 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas127:
	BZ          L_controlador_RL_reglas128
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas127
L_controlador_RL_reglas128:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_bajo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_bajo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,370 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas129:
	BZ          L_controlador_RL_reglas130
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas129
L_controlador_RL_reglas130:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_bajo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_bajo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,371 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,373 :: 		_rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[2]);
	MOVF        controlador_RL_reglas__error_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,374 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,375 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas131:
	BZ          L_controlador_RL_reglas132
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas131
L_controlador_RL_reglas132:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_medio_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_medio_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,376 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas133:
	BZ          L_controlador_RL_reglas134
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas133
L_controlador_RL_reglas134:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,377 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,379 :: 		_rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[3]);
	MOVF        controlador_RL_reglas__error_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,380 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,381 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas135:
	BZ          L_controlador_RL_reglas136
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas135
L_controlador_RL_reglas136:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_alto_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_alto_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,382 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas137:
	BZ          L_controlador_RL_reglas138
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas137
L_controlador_RL_reglas138:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,383 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,385 :: 		_rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[4]);
	MOVF        controlador_RL_reglas__error_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,386 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,387 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas139:
	BZ          L_controlador_RL_reglas140
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas139
L_controlador_RL_reglas140:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_alto_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_alto_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,388 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas141:
	BZ          L_controlador_RL_reglas142
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas141
L_controlador_RL_reglas142:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,389 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,391 :: 		_rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[0]);
	MOVF        controlador_RL_reglas__error_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+0, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+1, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+2, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+3, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,392 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,393 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas143:
	BZ          L_controlador_RL_reglas144
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas143
L_controlador_RL_reglas144:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_medio_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_medio_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,394 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas145:
	BZ          L_controlador_RL_reglas146
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas145
L_controlador_RL_reglas146:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,395 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,397 :: 		_rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[1]);
	MOVF        controlador_RL_reglas__error_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+4, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+5, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+6, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+7, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,398 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,399 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas147:
	BZ          L_controlador_RL_reglas148
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas147
L_controlador_RL_reglas148:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_medio_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_medio_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,400 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas149:
	BZ          L_controlador_RL_reglas150
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas149
L_controlador_RL_reglas150:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_medio_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_medio_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,401 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,403 :: 		_rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[2]);
	MOVF        controlador_RL_reglas__error_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+8, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+9, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+10, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+11, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,404 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,405 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas151:
	BZ          L_controlador_RL_reglas152
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas151
L_controlador_RL_reglas152:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_alto_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_alto_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,406 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas153:
	BZ          L_controlador_RL_reglas154
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas153
L_controlador_RL_reglas154:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_alto_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_alto_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,407 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,409 :: 		_rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[3]);
	MOVF        controlador_RL_reglas__error_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+12, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+13, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+14, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+15, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,410 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,411 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_maximo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas155:
	BZ          L_controlador_RL_reglas156
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas155
L_controlador_RL_reglas156:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_maximo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_maximo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_maximo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_maximo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,412 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_maximo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas157:
	BZ          L_controlador_RL_reglas158
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas157
L_controlador_RL_reglas158:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_maximo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_maximo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,413 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,415 :: 		_rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[4]);
	MOVF        controlador_RL_reglas__error_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+0 
	MOVF        controlador_RL_reglas__error_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+1 
	MOVF        controlador_RL_reglas__error_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+2 
	MOVF        controlador_RL_reglas__error_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_a+3 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+16, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+0 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+17, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+1 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+18, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+2 
	MOVF        controlador_RL_reglas__Cambio_e_eq_L0+19, 0 
	MOVWF       FARG_controlador_OP_ope_And_b+3 
	CALL        controlador_OP_ope_And+0, 0
;controlador.c,416 :: 		_pwm_degree[_pwm_i] = _rl;
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R4 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R5 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	MOVLW       controlador_RL_reglas__pwm_degree_L0+0
	ADDWF       R4, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_degree_L0+0)
	ADDWFC      R5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,417 :: 		_pwm_conc[_pwm_i].equal = TP_T_pwm_maximo_equal;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas159:
	BZ          L_controlador_RL_reglas160
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas159
L_controlador_RL_reglas160:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_maximo_equal+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_maximo_equal+0)
	MOVWF       POSTINC1+0 
	MOVLW       FARG_controlador_TP_T_pwm_maximo_equal_x+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(FARG_controlador_TP_T_pwm_maximo_equal_x+0)
	MOVWF       POSTINC1+0 
;controlador.c,418 :: 		_pwm_conc[_pwm_i].center = TP_T_pwm_maximo_center;
	MOVLW       4
	MOVWF       R2 
	MOVF        controlador_RL_reglas__pwm_i_L0+0, 0 
	MOVWF       R0 
	MOVF        controlador_RL_reglas__pwm_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L_controlador_RL_reglas161:
	BZ          L_controlador_RL_reglas162
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L_controlador_RL_reglas161
L_controlador_RL_reglas162:
	MOVLW       controlador_RL_reglas__pwm_conc_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_conc_L0+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       controlador_TP_T_pwm_maximo_center+0
	MOVWF       POSTINC1+0 
	MOVLW       hi_addr(controlador_TP_T_pwm_maximo_center+0)
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;controlador.c,419 :: 		_pwm_i++;
	INFSNZ      controlador_RL_reglas__pwm_i_L0+0, 1 
	INCF        controlador_RL_reglas__pwm_i_L0+1, 1 
;controlador.c,421 :: 		*pwm = OP_ope_Defuz(_pwm);
	MOVLW       30
	MOVWF       R0 
	MOVLW       FARG_controlador_OP_ope_Defuz_mf+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_controlador_OP_ope_Defuz_mf+0)
	MOVWF       FSR1H 
	MOVLW       controlador_RL_reglas__pwm_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(controlador_RL_reglas__pwm_L0+0)
	MOVWF       FSR0H 
L_controlador_RL_reglas24:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_controlador_RL_reglas24
	CALL        controlador_OP_ope_Defuz+0, 0
	MOVFF       FARG_controlador_RL_reglas_pwm+0, FSR1
	MOVFF       FARG_controlador_RL_reglas_pwm+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,422 :: 		}
L_end_RL_reglas:
	RETURN      0
; end of controlador_RL_reglas

_controladorInferenceEngine:

;controlador.c,429 :: 		void controladorInferenceEngine(double error, double Cambio_e, double *_d_pwm) {
;controlador.c,431 :: 		RL_reglas(error, Cambio_e, &pwm);
	MOVF        FARG_controladorInferenceEngine_error+0, 0 
	MOVWF       FARG_controlador_RL_reglas_error+0 
	MOVF        FARG_controladorInferenceEngine_error+1, 0 
	MOVWF       FARG_controlador_RL_reglas_error+1 
	MOVF        FARG_controladorInferenceEngine_error+2, 0 
	MOVWF       FARG_controlador_RL_reglas_error+2 
	MOVF        FARG_controladorInferenceEngine_error+3, 0 
	MOVWF       FARG_controlador_RL_reglas_error+3 
	MOVF        FARG_controladorInferenceEngine_Cambio_e+0, 0 
	MOVWF       FARG_controlador_RL_reglas_Cambio_e+0 
	MOVF        FARG_controladorInferenceEngine_Cambio_e+1, 0 
	MOVWF       FARG_controlador_RL_reglas_Cambio_e+1 
	MOVF        FARG_controladorInferenceEngine_Cambio_e+2, 0 
	MOVWF       FARG_controlador_RL_reglas_Cambio_e+2 
	MOVF        FARG_controladorInferenceEngine_Cambio_e+3, 0 
	MOVWF       FARG_controlador_RL_reglas_Cambio_e+3 
	MOVLW       controladorInferenceEngine_pwm_L0+0
	MOVWF       FARG_controlador_RL_reglas_pwm+0 
	MOVLW       hi_addr(controladorInferenceEngine_pwm_L0+0)
	MOVWF       FARG_controlador_RL_reglas_pwm+1 
	CALL        controlador_RL_reglas+0, 0
;controlador.c,432 :: 		*_d_pwm = pwm;
	MOVFF       FARG_controladorInferenceEngine__d_pwm+0, FSR1
	MOVFF       FARG_controladorInferenceEngine__d_pwm+1, FSR1H
	MOVF        controladorInferenceEngine_pwm_L0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        controladorInferenceEngine_pwm_L0+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        controladorInferenceEngine_pwm_L0+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        controladorInferenceEngine_pwm_L0+3, 0 
	MOVWF       POSTINC1+0 
;controlador.c,433 :: 		}
L_end_controladorInferenceEngine:
	RETURN      0
; end of _controladorInferenceEngine
