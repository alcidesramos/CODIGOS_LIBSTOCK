
_main:

;MODULAODR.c,3 :: 		void main()
;MODULAODR.c,6 :: 		OSCCON=0;
	CLRF       OSCCON+0
;MODULAODR.c,7 :: 		OSCTUNE=0; //frecuancia centrada
	CLRF       OSCTUNE+0
;MODULAODR.c,9 :: 		SCS1_bit=1;
	BSF        SCS1_bit+0, BitPos(SCS1_bit+0)
;MODULAODR.c,10 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;MODULAODR.c,13 :: 		SCS1_bit=0;
	BCF        SCS1_bit+0, BitPos(SCS1_bit+0)
;MODULAODR.c,14 :: 		SCS0_bit=0;
	BCF        SCS0_bit+0, BitPos(SCS0_bit+0)
;MODULAODR.c,17 :: 		IRCF3_bit=1;
	BSF        IRCF3_bit+0, BitPos(IRCF3_bit+0)
;MODULAODR.c,18 :: 		IRCF2_bit=1;
	BSF        IRCF2_bit+0, BitPos(IRCF2_bit+0)
;MODULAODR.c,19 :: 		IRCF1_bit=1;
	BSF        IRCF1_bit+0, BitPos(IRCF1_bit+0)
;MODULAODR.c,20 :: 		IRCF0_bit=0;
	BCF        IRCF0_bit+0, BitPos(IRCF0_bit+0)
;MODULAODR.c,22 :: 		SPLLEN_bit=1; //Prende el PLL por 4  entonces 32Mz
	BSF        SPLLEN_bit+0, BitPos(SPLLEN_bit+0)
;MODULAODR.c,24 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      64
	MOVWF      SPBRG+0
	MOVLW      3
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MODULAODR.c,27 :: 		RXDTSEL_bit=1; // RX en   RA1
	BSF        RXDTSEL_bit+0, BitPos(RXDTSEL_bit+0)
;MODULAODR.c,28 :: 		TXCKSEL_bit=1; // tX en  RA0;
	BSF        TXCKSEL_bit+0, BitPos(TXCKSEL_bit+0)
;MODULAODR.c,32 :: 		TRISA=0;
	CLRF       TRISA+0
;MODULAODR.c,33 :: 		TRISC=0;
	CLRF       TRISC+0
;MODULAODR.c,34 :: 		TRISC3_bit=1; // entrada de moduladora manual
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;MODULAODR.c,39 :: 		T2CON=0;
	CLRF       T2CON+0
;MODULAODR.c,41 :: 		T2CKPS1_bit=0;
	BCF        T2CKPS1_bit+0, BitPos(T2CKPS1_bit+0)
;MODULAODR.c,42 :: 		T2CKPS0_bit=0;
	BCF        T2CKPS0_bit+0, BitPos(T2CKPS0_bit+0)
;MODULAODR.c,44 :: 		PR2=199; // para 25 us  40khz
	MOVLW      199
	MOVWF      PR2+0
;MODULAODR.c,46 :: 		CCP1CON=0;
	CLRF       CCP1CON+0
;MODULAODR.c,48 :: 		C1TSEL1_bit=0;
	BCF        C1TSEL1_bit+0, BitPos(C1TSEL1_bit+0)
;MODULAODR.c,49 :: 		C1TSEL0_bit=0;
	BCF        C1TSEL0_bit+0, BitPos(C1TSEL0_bit+0)
;MODULAODR.c,52 :: 		CCP1CON=0;
	CLRF       CCP1CON+0
;MODULAODR.c,53 :: 		CCP1M3_bit=1;
	BSF        CCP1M3_bit+0, BitPos(CCP1M3_bit+0)
;MODULAODR.c,54 :: 		CCP1M2_bit=1;
	BSF        CCP1M2_bit+0, BitPos(CCP1M2_bit+0)
;MODULAODR.c,55 :: 		CCP1M1_bit=0;
	BCF        CCP1M1_bit+0, BitPos(CCP1M1_bit+0)
;MODULAODR.c,56 :: 		CCP1M0_bit=0;
	BCF        CCP1M0_bit+0, BitPos(CCP1M0_bit+0)
;MODULAODR.c,58 :: 		CCPR1L=99;  //parte alta del ciclo util
	MOVLW      99
	MOVWF      CCPR1L+0
;MODULAODR.c,60 :: 		DC1B1_bit=1;
	BSF        DC1B1_bit+0, BitPos(DC1B1_bit+0)
;MODULAODR.c,61 :: 		DC1B0_bit=1;
	BSF        DC1B0_bit+0, BitPos(DC1B0_bit+0)
;MODULAODR.c,63 :: 		PSTR1CON=0;    //no asigna ningun pin salida
	CLRF       PSTR1CON+0
;MODULAODR.c,64 :: 		STR1SYNC_bit=0;// no espera siguiente periodo
	BCF        STR1SYNC_bit+0, BitPos(STR1SYNC_bit+0)
;MODULAODR.c,66 :: 		STR1A_bit=1; //salida PWM PA1
	BSF        STR1A_bit+0, BitPos(STR1A_bit+0)
;MODULAODR.c,71 :: 		TMR2ON_bit=1;  //prende el timer 2
	BSF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;MODULAODR.c,76 :: 		T6CON=0;
	CLRF       T6CON+0
;MODULAODR.c,78 :: 		T6CKPS1_bit=0;
	BCF        T6CKPS1_bit+0, BitPos(T6CKPS1_bit+0)
;MODULAODR.c,79 :: 		T6CKPS0_bit=1;
	BSF        T6CKPS0_bit+0, BitPos(T6CKPS0_bit+0)
;MODULAODR.c,80 :: 		PR6=119;   //  para 60 us
	MOVLW      119
	MOVWF      PR6+0
;MODULAODR.c,82 :: 		CCP4CON=0;
	CLRF       CCP4CON+0
;MODULAODR.c,84 :: 		C4TSEL1_bit=1;
	BSF        C4TSEL1_bit+0, BitPos(C4TSEL1_bit+0)
;MODULAODR.c,85 :: 		C4TSEL0_bit=0;
	BCF        C4TSEL0_bit+0, BitPos(C4TSEL0_bit+0)
;MODULAODR.c,88 :: 		CCP4CON=0;
	CLRF       CCP4CON+0
;MODULAODR.c,90 :: 		CCP4M3_bit=1;
	BSF        CCP4M3_bit+0, BitPos(CCP4M3_bit+0)
;MODULAODR.c,91 :: 		CCP4M2_bit=1;
	BSF        CCP4M2_bit+0, BitPos(CCP4M2_bit+0)
;MODULAODR.c,92 :: 		CCP4M1_bit=0;
	BCF        CCP4M1_bit+0, BitPos(CCP4M1_bit+0)
;MODULAODR.c,93 :: 		CCP4M0_bit=0;
	BCF        CCP4M0_bit+0, BitPos(CCP4M0_bit+0)
;MODULAODR.c,95 :: 		CCPR4L=59;  //byte alto del ciclo util
	MOVLW      59
	MOVWF      CCPR4L+0
;MODULAODR.c,97 :: 		DC4B1_bit=1;
	BSF        DC4B1_bit+0, BitPos(DC4B1_bit+0)
;MODULAODR.c,98 :: 		DC4B0_bit=1;
	BSF        DC4B0_bit+0, BitPos(DC4B0_bit+0)
;MODULAODR.c,99 :: 		PSTR2CON=0;    //no asigna ningun pin salida
	CLRF       PSTR2CON+0
;MODULAODR.c,100 :: 		STR2SYNC_bit=0;// no espera siguiente periodo
	BCF        STR2SYNC_bit+0, BitPos(STR2SYNC_bit+0)
;MODULAODR.c,106 :: 		TMR6ON_bit=1;  //prende el timer 6
	BSF        TMR6ON_bit+0, BitPos(TMR6ON_bit+0)
;MODULAODR.c,110 :: 		MDCON=0;
	CLRF       MDCON+0
;MODULAODR.c,111 :: 		MDEN_bit=0; //Deshabilita el modulo
	BCF        MDEN_bit+0, BitPos(MDEN_bit+0)
;MODULAODR.c,112 :: 		MDOE_bit=1; //habilita la salida el pin
	BSF        MDOE_bit+0, BitPos(MDOE_bit+0)
;MODULAODR.c,113 :: 		MDSLR_bit=1; //habilita slew rate
	BSF        MDSLR_bit+0, BitPos(MDSLR_bit+0)
;MODULAODR.c,115 :: 		MDMSODIS_bit=0;//habilita moduladora
	BCF        MDMSODIS_bit+0, BitPos(MDMSODIS_bit+0)
;MODULAODR.c,137 :: 		MDMS3_bit=1;
	BSF        MDMS3_bit+0, BitPos(MDMS3_bit+0)
;MODULAODR.c,138 :: 		MDMS2_bit=0;
	BCF        MDMS2_bit+0, BitPos(MDMS2_bit+0)
;MODULAODR.c,139 :: 		MDMS1_bit=1;
	BSF        MDMS1_bit+0, BitPos(MDMS1_bit+0)
;MODULAODR.c,140 :: 		MDMS0_bit=0;
	BCF        MDMS0_bit+0, BitPos(MDMS0_bit+0)
;MODULAODR.c,144 :: 		MDCARH=0; //registro de moduladora alta
	CLRF       MDCARH+0
;MODULAODR.c,145 :: 		MDCHSYNC_bit=1; //sincronizado
	BSF        MDCHSYNC_bit+0, BitPos(MDCHSYNC_bit+0)
;MODULAODR.c,148 :: 		MDCH3_bit=0;
	BCF        MDCH3_bit+0, BitPos(MDCH3_bit+0)
;MODULAODR.c,149 :: 		MDCH2_bit=1;
	BSF        MDCH2_bit+0, BitPos(MDCH2_bit+0)
;MODULAODR.c,150 :: 		MDCH1_bit=0;
	BCF        MDCH1_bit+0, BitPos(MDCH1_bit+0)
;MODULAODR.c,151 :: 		MDCH0_bit=0;
	BCF        MDCH0_bit+0, BitPos(MDCH0_bit+0)
;MODULAODR.c,162 :: 		MDCHPOL_bit=1; //invierte la señal de portadora alta
	BSF        MDCHPOL_bit+0, BitPos(MDCHPOL_bit+0)
;MODULAODR.c,165 :: 		MDCARL=0; //registro de moduladora baja
	CLRF       MDCARL+0
;MODULAODR.c,166 :: 		MDCLSYNC_bit=1; //sincronizado
	BSF        MDCLSYNC_bit+0, BitPos(MDCLSYNC_bit+0)
;MODULAODR.c,169 :: 		MDCL3_bit=0;
	BCF        MDCL3_bit+0, BitPos(MDCL3_bit+0)
;MODULAODR.c,170 :: 		MDCL2_bit=1;
	BSF        MDCL2_bit+0, BitPos(MDCL2_bit+0)
;MODULAODR.c,171 :: 		MDCL1_bit=1;
	BSF        MDCL1_bit+0, BitPos(MDCL1_bit+0)
;MODULAODR.c,172 :: 		MDCL0_bit=1;
	BSF        MDCL0_bit+0, BitPos(MDCL0_bit+0)
;MODULAODR.c,183 :: 		MDEN_bit=1;//    habilita el Modulo
	BSF        MDEN_bit+0, BitPos(MDEN_bit+0)
;MODULAODR.c,191 :: 		TXREG=0b10101010;
	MOVLW      170
	MOVWF      TXREG+0
;MODULAODR.c,192 :: 		while (TRMT_bit==0); // mientras esta el buffer lleno
L_main0:
	BTFSC      TRMT_bit+0, BitPos(TRMT_bit+0)
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;MODULAODR.c,196 :: 		MDEN_bit=0;//    Deshabilita el Modulo
	BCF        MDEN_bit+0, BitPos(MDEN_bit+0)
;MODULAODR.c,202 :: 		while (1)
L_main2:
;MODULAODR.c,206 :: 		}
	GOTO       L_main2
;MODULAODR.c,210 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
