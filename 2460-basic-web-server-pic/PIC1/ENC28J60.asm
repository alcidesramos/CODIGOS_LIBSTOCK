
_SPI_Ethernet_UserTCP:

;ENC28J60.c,102 :: 		unsigned int localPort, unsigned int reqLength, TEthPktFlags *flags) {
;ENC28J60.c,103 :: 		unsigned int  largo= 0;   //bandera de html o javascrit
	CLRF        SPI_Ethernet_UserTCP_largo_L0+0 
	CLRF        SPI_Ethernet_UserTCP_largo_L0+1 
;ENC28J60.c,106 :: 		if(localPort != 80) {                        //solo recibe del puerto 80
	MOVLW       0
	XORWF       FARG_SPI_Ethernet_UserTCP_localPort+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SPI_Ethernet_UserTCP21
	MOVLW       80
	XORWF       FARG_SPI_Ethernet_UserTCP_localPort+0, 0 
L__SPI_Ethernet_UserTCP21:
	BTFSC       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP0
;ENC28J60.c,107 :: 		return(0) ;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_SPI_Ethernet_UserTCP
;ENC28J60.c,108 :: 		}
L_SPI_Ethernet_UserTCP0:
;ENC28J60.c,111 :: 		for(cuent = 0 ; cuent < 30 ; cuent++) {
	CLRF        SPI_Ethernet_UserTCP_cuent_L0+0 
	CLRF        SPI_Ethernet_UserTCP_cuent_L0+1 
L_SPI_Ethernet_UserTCP1:
	MOVLW       0
	SUBWF       SPI_Ethernet_UserTCP_cuent_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SPI_Ethernet_UserTCP22
	MOVLW       30
	SUBWF       SPI_Ethernet_UserTCP_cuent_L0+0, 0 
L__SPI_Ethernet_UserTCP22:
	BTFSC       STATUS+0, 0 
	GOTO        L_SPI_Ethernet_UserTCP2
;ENC28J60.c,112 :: 		trama_rx[cuent] = SPI_Ethernet_getByte() ;
	MOVLW       _trama_rx+0
	ADDWF       SPI_Ethernet_UserTCP_cuent_L0+0, 0 
	MOVWF       FLOC__SPI_Ethernet_UserTCP+0 
	MOVLW       hi_addr(_trama_rx+0)
	ADDWFC      SPI_Ethernet_UserTCP_cuent_L0+1, 0 
	MOVWF       FLOC__SPI_Ethernet_UserTCP+1 
	CALL        _SPI_Ethernet_getByte+0, 0
	MOVFF       FLOC__SPI_Ethernet_UserTCP+0, FSR1
	MOVFF       FLOC__SPI_Ethernet_UserTCP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ENC28J60.c,111 :: 		for(cuent = 0 ; cuent < 30 ; cuent++) {
	INFSNZ      SPI_Ethernet_UserTCP_cuent_L0+0, 1 
	INCF        SPI_Ethernet_UserTCP_cuent_L0+1, 1 
;ENC28J60.c,113 :: 		}
	GOTO        L_SPI_Ethernet_UserTCP1
L_SPI_Ethernet_UserTCP2:
;ENC28J60.c,114 :: 		trama_rx[cuent] = 0 ; //agraga final de linea
	MOVLW       _trama_rx+0
	ADDWF       SPI_Ethernet_UserTCP_cuent_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_trama_rx+0)
	ADDWFC      SPI_Ethernet_UserTCP_cuent_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;ENC28J60.c,116 :: 		if(memcmp(trama_rx, "GET /", 5)) {      // solo recibe peticiones tipo get
	MOVLW       _trama_rx+0
	MOVWF       FARG_memcmp_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_memcmp_s1+1 
	MOVLW       ?lstr1_ENC28J60+0
	MOVWF       FARG_memcmp_s2+0 
	MOVLW       hi_addr(?lstr1_ENC28J60+0)
	MOVWF       FARG_memcmp_s2+1 
	MOVLW       5
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP4
;ENC28J60.c,117 :: 		return(0) ;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_SPI_Ethernet_UserTCP
;ENC28J60.c,118 :: 		}
L_SPI_Ethernet_UserTCP4:
;ENC28J60.c,119 :: 		UART1_Write_Text(trama_rx);  //manda por puerto seriallo recibido
	MOVLW       _trama_rx+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ENC28J60.c,122 :: 		if(trama_rx[5] == '$')
	MOVF        _trama_rx+5, 0 
	XORLW       36
	BTFSS       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP5
;ENC28J60.c,125 :: 		largo= putConstString(httpHeader) ;       // Manda cabeza http
	MOVLW       _httpHeader+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	MOVWF       SPI_Ethernet_UserTCP_largo_L0+0 
	MOVF        R1, 0 
	MOVWF       SPI_Ethernet_UserTCP_largo_L0+1 
;ENC28J60.c,126 :: 		largo+= putConstString(httpMimeTypeScript); // manda cabecera java
	MOVLW       _httpMimeTypeScript+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpMimeTypeScript+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpMimeTypeScript+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
;ENC28J60.c,129 :: 		sprintf(trama_tx,"var volt=%.2f;", voltaje);
	MOVLW       _trama_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_ENC28J60+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_ENC28J60+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_ENC28J60+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _voltaje+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _voltaje+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _voltaje+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _voltaje+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;ENC28J60.c,130 :: 		largo+= putString(trama_tx) ;
	MOVLW       _trama_tx+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
;ENC28J60.c,134 :: 		sprintf(trama_tx,"var temp=%.2f;", temperatura);
	MOVLW       _trama_tx+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_3_ENC28J60+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_3_ENC28J60+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_3_ENC28J60+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;ENC28J60.c,135 :: 		largo+=putString(trama_tx) ;
	MOVLW       _trama_tx+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(_trama_tx+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
;ENC28J60.c,137 :: 		if (pulsador1==0)   largo+=putConstString("var pul1=\"ON\";") ;
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_SPI_Ethernet_UserTCP6
	MOVLW       ?lstr_4_ENC28J60+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(?lstr_4_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(?lstr_4_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
	GOTO        L_SPI_Ethernet_UserTCP7
L_SPI_Ethernet_UserTCP6:
;ENC28J60.c,138 :: 		else largo+=putConstString("var pul1=\"OFF\";") ;
	MOVLW       ?lstr_5_ENC28J60+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(?lstr_5_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(?lstr_5_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
L_SPI_Ethernet_UserTCP7:
;ENC28J60.c,141 :: 		if (pulsador2==0)   largo+=putConstString("var pul2=\"ON\";") ;
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_SPI_Ethernet_UserTCP8
	MOVLW       ?lstr_6_ENC28J60+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(?lstr_6_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(?lstr_6_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
	GOTO        L_SPI_Ethernet_UserTCP9
L_SPI_Ethernet_UserTCP8:
;ENC28J60.c,142 :: 		else largo+=putConstString("var pul2=\"OFF\";") ;
	MOVLW       ?lstr_7_ENC28J60+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(?lstr_7_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(?lstr_7_ENC28J60+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
L_SPI_Ethernet_UserTCP9:
;ENC28J60.c,145 :: 		}
L_SPI_Ethernet_UserTCP5:
;ENC28J60.c,148 :: 		if (strstr(trama_rx,"led1="))
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr8_ENC28J60+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr8_ENC28J60+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP10
;ENC28J60.c,150 :: 		if (strstr(trama_rx,"on"))  led_amarillo=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr9_ENC28J60+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr9_ENC28J60+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP11
	BSF         LATB7_bit+0, BitPos(LATB7_bit+0) 
	GOTO        L_SPI_Ethernet_UserTCP12
L_SPI_Ethernet_UserTCP11:
;ENC28J60.c,151 :: 		else led_amarillo=0;
	BCF         LATB7_bit+0, BitPos(LATB7_bit+0) 
L_SPI_Ethernet_UserTCP12:
;ENC28J60.c,152 :: 		}
	GOTO        L_SPI_Ethernet_UserTCP13
L_SPI_Ethernet_UserTCP10:
;ENC28J60.c,153 :: 		else if (strstr(trama_rx,"led2="))
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr10_ENC28J60+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr10_ENC28J60+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP14
;ENC28J60.c,155 :: 		if (strstr(trama_rx,"on"))  led_rojo=1;
	MOVLW       _trama_rx+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_trama_rx+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr11_ENC28J60+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr11_ENC28J60+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP15
	BSF         LATB6_bit+0, BitPos(LATB6_bit+0) 
	GOTO        L_SPI_Ethernet_UserTCP16
L_SPI_Ethernet_UserTCP15:
;ENC28J60.c,156 :: 		else led_rojo=0;
	BCF         LATB6_bit+0, BitPos(LATB6_bit+0) 
L_SPI_Ethernet_UserTCP16:
;ENC28J60.c,157 :: 		}
L_SPI_Ethernet_UserTCP14:
L_SPI_Ethernet_UserTCP13:
;ENC28J60.c,163 :: 		if(largo == 0)
	MOVLW       0
	XORWF       SPI_Ethernet_UserTCP_largo_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SPI_Ethernet_UserTCP23
	MOVLW       0
	XORWF       SPI_Ethernet_UserTCP_largo_L0+0, 0 
L__SPI_Ethernet_UserTCP23:
	BTFSS       STATUS+0, 2 
	GOTO        L_SPI_Ethernet_UserTCP17
;ENC28J60.c,165 :: 		largo+=putConstString(httpHeader) ;       // manda cabecera
	MOVLW       _httpHeader+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
;ENC28J60.c,166 :: 		largo+=putConstString(httpMimeTypeHTML);  // tipo html
	MOVLW       _httpMimeTypeHTML+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpMimeTypeHTML+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpMimeTypeHTML+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
;ENC28J60.c,167 :: 		largo+=putConstString(pagina1) ;        // manda primera parte de la pagina
	MOVLW       _pagina1+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_pagina1+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_pagina1+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
;ENC28J60.c,168 :: 		largo+=putConstString(pagina2) ;        // manda segunda parte de la pagina
	MOVLW       _pagina2+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_pagina2+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_pagina2+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       SPI_Ethernet_UserTCP_largo_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SPI_Ethernet_UserTCP_largo_L0+1, 1 
;ENC28J60.c,169 :: 		}
L_SPI_Ethernet_UserTCP17:
;ENC28J60.c,170 :: 		return(largo) ;
	MOVF        SPI_Ethernet_UserTCP_largo_L0+0, 0 
	MOVWF       R0 
	MOVF        SPI_Ethernet_UserTCP_largo_L0+1, 0 
	MOVWF       R1 
;ENC28J60.c,171 :: 		}
L_end_SPI_Ethernet_UserTCP:
	RETURN      0
; end of _SPI_Ethernet_UserTCP

_SPI_Ethernet_UserUDP:

;ENC28J60.c,174 :: 		unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags) {
;ENC28J60.c,175 :: 		return 0;              //no implementado UDP
	CLRF        R0 
	CLRF        R1 
;ENC28J60.c,176 :: 		}
L_end_SPI_Ethernet_UserUDP:
	RETURN      0
; end of _SPI_Ethernet_UserUDP

_main:

;ENC28J60.c,180 :: 		void main()
;ENC28J60.c,183 :: 		OSCCON=0;
	CLRF        OSCCON+0 
;ENC28J60.c,184 :: 		OSCTUNE=0;
	CLRF        OSCTUNE+0 
;ENC28J60.c,185 :: 		PLLEN_bit=1; //activa pll por 4 entonces 8Mhz*4 =32
	BSF         PLLEN_bit+0, BitPos(PLLEN_bit+0) 
;ENC28J60.c,187 :: 		ANSEL=0;
	CLRF        ANSEL+0 
;ENC28J60.c,188 :: 		ANSELH=0;
	CLRF        ANSELH+0 
;ENC28J60.c,189 :: 		trisa.B0=1; //entrada voltaje
	BSF         TRISA+0, 0 
;ENC28J60.c,190 :: 		trisa.B1=1; //entrada temperatura
	BSF         TRISA+0, 1 
;ENC28J60.c,192 :: 		ANSEL.B0=1; //entrada analoga voltaje
	BSF         ANSEL+0, 0 
;ENC28J60.c,193 :: 		ANSEL.B1=1; //entrada analoga temperatura
	BSF         ANSEL+0, 1 
;ENC28J60.c,195 :: 		trisc.B6=0; //salida tx
	BCF         TRISC+0, 6 
;ENC28J60.c,199 :: 		TRISB0_bit=1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;ENC28J60.c,200 :: 		TRISB1_bit=1;
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;ENC28J60.c,203 :: 		TRISB6_bit=0;
	BCF         TRISB6_bit+0, BitPos(TRISB6_bit+0) 
;ENC28J60.c,204 :: 		TRISB7_bit=0;
	BCF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;ENC28J60.c,206 :: 		led_amarillo=0;
	BCF         LATB7_bit+0, BitPos(LATB7_bit+0) 
;ENC28J60.c,207 :: 		led_rojo=0;
	BCF         LATB6_bit+0, BitPos(LATB6_bit+0) 
;ENC28J60.c,210 :: 		RBPU_bit=0; //habilita piull up
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;ENC28J60.c,213 :: 		UART1_Init(115200);//inicia puerto serial
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       68
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ENC28J60.c,214 :: 		UART1_Write_Text("OK INICIANDO\r\n");
	MOVLW       ?lstr12_ENC28J60+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_ENC28J60+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ENC28J60.c,216 :: 		SPI1_Init();//INICA SPI
	CALL        _SPI1_Init+0, 0
;ENC28J60.c,218 :: 		SPI_Ethernet_Init(myMacAddr, myIpAddr, Spi_Ethernet_FULLDUPLEX) ;
	MOVLW       _myMacAddr+0
	MOVWF       FARG_SPI_Ethernet_Init_mac+0 
	MOVLW       hi_addr(_myMacAddr+0)
	MOVWF       FARG_SPI_Ethernet_Init_mac+1 
	MOVLW       _myIpAddr+0
	MOVWF       FARG_SPI_Ethernet_Init_ip+0 
	MOVLW       hi_addr(_myIpAddr+0)
	MOVWF       FARG_SPI_Ethernet_Init_ip+1 
	MOVLW       1
	MOVWF       FARG_SPI_Ethernet_Init_fullDuplex+0 
	CALL        _SPI_Ethernet_Init+0, 0
;ENC28J60.c,220 :: 		while(1)
L_main18:
;ENC28J60.c,223 :: 		codigo=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;ENC28J60.c,224 :: 		voltaje=codigo*5.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _voltaje+0 
	MOVF        R1, 0 
	MOVWF       _voltaje+1 
	MOVF        R2, 0 
	MOVWF       _voltaje+2 
	MOVF        R3, 0 
	MOVWF       _voltaje+3 
;ENC28J60.c,226 :: 		codigo=ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _codigo+0 
	MOVF        R1, 0 
	MOVWF       _codigo+1 
;ENC28J60.c,227 :: 		temperatura=codigo*500.0/1023.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;ENC28J60.c,228 :: 		SPI_Ethernet_doPacket() ;   // procesa paquetes ethetnet.
	CALL        _SPI_Ethernet_doPacket+0, 0
;ENC28J60.c,230 :: 		}
	GOTO        L_main18
;ENC28J60.c,233 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
