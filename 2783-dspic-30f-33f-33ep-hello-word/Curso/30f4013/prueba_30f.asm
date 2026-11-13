
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;prueba_30f.c,1 :: 		void main()
;prueba_30f.c,3 :: 		ADPCFG=0xffff;    //todo en uno 1=digital  0=analogo
	PUSH	W10
	PUSH	W11
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;prueba_30f.c,4 :: 		TRISB=0; // pportb salida
	CLR	TRISB
;prueba_30f.c,5 :: 		TRISF3_bit=0; //salida tx
	BCLR	TRISF3_bit, BitPos(TRISF3_bit+0)
;prueba_30f.c,6 :: 		TRISF2_bit=1; //entrada rx
	BSET	TRISF2_bit, BitPos(TRISF2_bit+0)
;prueba_30f.c,7 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;prueba_30f.c,11 :: 		while (1)
L_main0:
;prueba_30f.c,14 :: 		LATB=~LATB;
	COM	LATB
;prueba_30f.c,15 :: 		Delay_ms(200);
	MOV	#17, W8
	MOV	#18095, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;prueba_30f.c,16 :: 		UART1_Write_Text ("HOLA MUNDO\r\n");
	MOV	#lo_addr(?lstr1_prueba_30f), W10
	CALL	_UART1_Write_Text
;prueba_30f.c,18 :: 		}
	GOTO	L_main0
;prueba_30f.c,22 :: 		}
L_end_main:
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
