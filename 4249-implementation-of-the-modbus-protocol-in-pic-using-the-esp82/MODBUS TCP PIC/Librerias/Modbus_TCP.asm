
_modbus_write_holding:

;Modbus_TCP.c,16 :: 		void modbus_write_holding(unsigned int dir_mod, unsigned int dat_mod)
;Modbus_TCP.c,18 :: 		RCIE_bit=0; // deshabiliota interrpciones
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Modbus_TCP.c,19 :: 		modbus_tx[0]=0;
	CLRF        _modbus_tx+0 
;Modbus_TCP.c,20 :: 		modbus_tx[1]=0;
	CLRF        _modbus_tx+1 
;Modbus_TCP.c,21 :: 		modbus_tx[2]=0;
	CLRF        _modbus_tx+2 
;Modbus_TCP.c,22 :: 		modbus_tx[3]=00;// identifica protocolo modbus
	CLRF        _modbus_tx+3 
;Modbus_TCP.c,23 :: 		modbus_tx[4]=00;;// identifica protocolo modbus
	CLRF        _modbus_tx+4 
;Modbus_TCP.c,25 :: 		modbus_tx[5]=6;  // largo trama
	MOVLW       6
	MOVWF       _modbus_tx+5 
;Modbus_TCP.c,26 :: 		modbus_tx[6]=dir_esclavo; //  Identificación del esclavo
	MOVLW       1
	MOVWF       _modbus_tx+6 
;Modbus_TCP.c,27 :: 		modbus_tx[7]=6;  // comando de escribir 1 regsito holding
	MOVLW       6
	MOVWF       _modbus_tx+7 
;Modbus_TCP.c,29 :: 		modbus_tx[8]=Hi(dir_mod);
	MOVF        FARG_modbus_write_holding_dir_mod+1, 0 
	MOVWF       _modbus_tx+8 
;Modbus_TCP.c,30 :: 		modbus_tx[9]=Lo(dir_mod);
	MOVF        FARG_modbus_write_holding_dir_mod+0, 0 
	MOVWF       _modbus_tx+9 
;Modbus_TCP.c,32 :: 		modbus_tx[10]=Hi(dat_mod);
	MOVF        FARG_modbus_write_holding_dat_mod+1, 0 
	MOVWF       _modbus_tx+10 
;Modbus_TCP.c,33 :: 		modbus_tx[11]=Lo(dat_mod);
	MOVF        FARG_modbus_write_holding_dat_mod+0, 0 
	MOVWF       _modbus_tx+11 
;Modbus_TCP.c,35 :: 		manda_esp8266_bytes(modbus_tx,12);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_manda_esp8266_bytes_info+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_manda_esp8266_bytes_info+1 
	MOVLW       12
	MOVWF       FARG_manda_esp8266_bytes_largo+0 
	MOVLW       0
	MOVWF       FARG_manda_esp8266_bytes_largo+1 
	CALL        _manda_esp8266_bytes+0, 0
;Modbus_TCP.c,37 :: 		}
L_end_modbus_write_holding:
	RETURN      0
; end of _modbus_write_holding

_modbus_write_holding_varios:

;Modbus_TCP.c,39 :: 		void modbus_write_holding_varios(unsigned int dir_mod, unsigned int *buff_datos,unsigned int cuantos)
;Modbus_TCP.c,42 :: 		RCIE_bit=0; // deshabilita interrupcio
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Modbus_TCP.c,43 :: 		modbus_tx[0]=0;
	CLRF        _modbus_tx+0 
;Modbus_TCP.c,44 :: 		modbus_tx[1]=0;
	CLRF        _modbus_tx+1 
;Modbus_TCP.c,45 :: 		modbus_tx[2]=0;
	CLRF        _modbus_tx+2 
;Modbus_TCP.c,46 :: 		modbus_tx[3]=00;// identifica protocolo modbus
	CLRF        _modbus_tx+3 
;Modbus_TCP.c,47 :: 		modbus_tx[4]=00;;// identifica protocolo modbus
	CLRF        _modbus_tx+4 
;Modbus_TCP.c,49 :: 		modbus_tx[5]=7+cuantos*2;  // largo trama
	MOVF        FARG_modbus_write_holding_varios_cuantos+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDLW       7
	MOVWF       _modbus_tx+5 
;Modbus_TCP.c,50 :: 		modbus_tx[6]=dir_esclavo; //  Identificación del esclavo
	MOVLW       1
	MOVWF       _modbus_tx+6 
;Modbus_TCP.c,51 :: 		modbus_tx[7]=0x10;  // comando de escribir varios regsito holding
	MOVLW       16
	MOVWF       _modbus_tx+7 
;Modbus_TCP.c,53 :: 		modbus_tx[8]=Hi(dir_mod);
	MOVF        FARG_modbus_write_holding_varios_dir_mod+1, 0 
	MOVWF       _modbus_tx+8 
;Modbus_TCP.c,54 :: 		modbus_tx[9]=Lo(dir_mod);
	MOVF        FARG_modbus_write_holding_varios_dir_mod+0, 0 
	MOVWF       _modbus_tx+9 
;Modbus_TCP.c,56 :: 		modbus_tx[10]=Hi(cuantos);
	MOVF        FARG_modbus_write_holding_varios_cuantos+1, 0 
	MOVWF       _modbus_tx+10 
;Modbus_TCP.c,57 :: 		modbus_tx[11]=Lo(cuantos);
	MOVF        FARG_modbus_write_holding_varios_cuantos+0, 0 
	MOVWF       _modbus_tx+11 
;Modbus_TCP.c,59 :: 		modbus_tx[12]=2*cuantos;
	MOVF        R0, 0 
	MOVWF       _modbus_tx+12 
;Modbus_TCP.c,60 :: 		for(cuent1=13;cuent1<12+2*cuantos;cuent1++)
	MOVLW       13
	MOVWF       modbus_write_holding_varios_cuent1_L0+0 
L_modbus_write_holding_varios0:
	MOVF        FARG_modbus_write_holding_varios_cuantos+0, 0 
	MOVWF       R0 
	MOVF        FARG_modbus_write_holding_varios_cuantos+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       12
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R0 
	MOVF        R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__modbus_write_holding_varios5
	MOVF        R2, 0 
	SUBWF       modbus_write_holding_varios_cuent1_L0+0, 0 
L__modbus_write_holding_varios5:
	BTFSC       STATUS+0, 0 
	GOTO        L_modbus_write_holding_varios1
;Modbus_TCP.c,62 :: 		modbus_tx[cuent1]=Hi(*buff_datos);
	MOVLW       _modbus_tx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FSR1L+1 
	MOVF        modbus_write_holding_varios_cuent1_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVLW       1
	ADDWF       FARG_modbus_write_holding_varios_buff_datos+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_modbus_write_holding_varios_buff_datos+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;Modbus_TCP.c,63 :: 		cuent1++;
	INCF        modbus_write_holding_varios_cuent1_L0+0, 1 
;Modbus_TCP.c,64 :: 		modbus_tx[cuent1]=Lo(*buff_datos++);
	MOVLW       _modbus_tx+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FSR1L+1 
	MOVF        modbus_write_holding_varios_cuent1_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVFF       FARG_modbus_write_holding_varios_buff_datos+0, FSR0L+0
	MOVFF       FARG_modbus_write_holding_varios_buff_datos+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       2
	ADDWF       FARG_modbus_write_holding_varios_buff_datos+0, 1 
	MOVLW       0
	ADDWFC      FARG_modbus_write_holding_varios_buff_datos+1, 1 
;Modbus_TCP.c,60 :: 		for(cuent1=13;cuent1<12+2*cuantos;cuent1++)
	INCF        modbus_write_holding_varios_cuent1_L0+0, 1 
;Modbus_TCP.c,66 :: 		}
	GOTO        L_modbus_write_holding_varios0
L_modbus_write_holding_varios1:
;Modbus_TCP.c,68 :: 		manda_esp8266_bytes(modbus_tx,17);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_manda_esp8266_bytes_info+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_manda_esp8266_bytes_info+1 
	MOVLW       17
	MOVWF       FARG_manda_esp8266_bytes_largo+0 
	MOVLW       0
	MOVWF       FARG_manda_esp8266_bytes_largo+1 
	CALL        _manda_esp8266_bytes+0, 0
;Modbus_TCP.c,69 :: 		}
L_end_modbus_write_holding_varios:
	RETURN      0
; end of _modbus_write_holding_varios

_modbus_write_digitalcoils:

;Modbus_TCP.c,71 :: 		void modbus_write_digitalcoils(unsigned int dir_mod, unsigned int dat_dig)
;Modbus_TCP.c,73 :: 		RCIE_bit=0; // dehabilita interrpcion
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Modbus_TCP.c,74 :: 		modbus_tx[0]=0;
	CLRF        _modbus_tx+0 
;Modbus_TCP.c,75 :: 		modbus_tx[1]=0;
	CLRF        _modbus_tx+1 
;Modbus_TCP.c,76 :: 		modbus_tx[2]=0;
	CLRF        _modbus_tx+2 
;Modbus_TCP.c,77 :: 		modbus_tx[3]=00;// identifica protocolo modbus
	CLRF        _modbus_tx+3 
;Modbus_TCP.c,78 :: 		modbus_tx[4]=00;;// identifica protocolo modbus
	CLRF        _modbus_tx+4 
;Modbus_TCP.c,80 :: 		modbus_tx[5]=9;  // largo trama
	MOVLW       9
	MOVWF       _modbus_tx+5 
;Modbus_TCP.c,81 :: 		modbus_tx[6]=dir_esclavo; //  Identificación del esclavo
	MOVLW       1
	MOVWF       _modbus_tx+6 
;Modbus_TCP.c,82 :: 		modbus_tx[7]=0x0f; // comando de escribir varios coils
	MOVLW       15
	MOVWF       _modbus_tx+7 
;Modbus_TCP.c,84 :: 		modbus_tx[8]=Hi(dir_mod);
	MOVF        FARG_modbus_write_digitalcoils_dir_mod+1, 0 
	MOVWF       _modbus_tx+8 
;Modbus_TCP.c,85 :: 		modbus_tx[9]=Lo(dir_mod);
	MOVF        FARG_modbus_write_digitalcoils_dir_mod+0, 0 
	MOVWF       _modbus_tx+9 
;Modbus_TCP.c,87 :: 		modbus_tx[10]=00;
	CLRF        _modbus_tx+10 
;Modbus_TCP.c,88 :: 		modbus_tx[11]=0x0f;
	MOVLW       15
	MOVWF       _modbus_tx+11 
;Modbus_TCP.c,89 :: 		modbus_tx[12]=02;
	MOVLW       2
	MOVWF       _modbus_tx+12 
;Modbus_TCP.c,90 :: 		modbus_tx[13]=Lo(dat_dig);
	MOVF        FARG_modbus_write_digitalcoils_dat_dig+0, 0 
	MOVWF       _modbus_tx+13 
;Modbus_TCP.c,91 :: 		modbus_tx[14]=Hi(dat_dig);
	MOVF        FARG_modbus_write_digitalcoils_dat_dig+1, 0 
	MOVWF       _modbus_tx+14 
;Modbus_TCP.c,93 :: 		manda_esp8266_bytes(modbus_tx,15);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_manda_esp8266_bytes_info+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_manda_esp8266_bytes_info+1 
	MOVLW       15
	MOVWF       FARG_manda_esp8266_bytes_largo+0 
	MOVLW       0
	MOVWF       FARG_manda_esp8266_bytes_largo+1 
	CALL        _manda_esp8266_bytes+0, 0
;Modbus_TCP.c,95 :: 		}
L_end_modbus_write_digitalcoils:
	RETURN      0
; end of _modbus_write_digitalcoils

_modbus_read_analog:

;Modbus_TCP.c,98 :: 		void modbus_read_analog(unsigned int dir_mod, unsigned int cuantos)
;Modbus_TCP.c,101 :: 		tamano=cuantos;
	MOVF        FARG_modbus_read_analog_cuantos+0, 0 
	MOVWF       _tamano+0 
	MOVF        FARG_modbus_read_analog_cuantos+1, 0 
	MOVWF       _tamano+1 
;Modbus_TCP.c,102 :: 		modbus_tx[0]=0;
	CLRF        _modbus_tx+0 
;Modbus_TCP.c,103 :: 		modbus_tx[1]=0;
	CLRF        _modbus_tx+1 
;Modbus_TCP.c,104 :: 		modbus_tx[2]=0;
	CLRF        _modbus_tx+2 
;Modbus_TCP.c,105 :: 		modbus_tx[3]=00;// identifica protocolo modbus
	CLRF        _modbus_tx+3 
;Modbus_TCP.c,106 :: 		modbus_tx[4]=00;;// identifica protocolo modbus
	CLRF        _modbus_tx+4 
;Modbus_TCP.c,108 :: 		modbus_tx[5]=2+cuantos*2;  // largo trama
	MOVF        FARG_modbus_read_analog_cuantos+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDLW       2
	MOVWF       _modbus_tx+5 
;Modbus_TCP.c,109 :: 		modbus_tx[6]=dir_esclavo; //  Identificación del esclavo
	MOVLW       1
	MOVWF       _modbus_tx+6 
;Modbus_TCP.c,110 :: 		modbus_tx[7]=0x4;  // comando de escribir varios regsito holding
	MOVLW       4
	MOVWF       _modbus_tx+7 
;Modbus_TCP.c,112 :: 		modbus_tx[8]=Hi(dir_mod);
	MOVF        FARG_modbus_read_analog_dir_mod+1, 0 
	MOVWF       _modbus_tx+8 
;Modbus_TCP.c,113 :: 		modbus_tx[9]=Lo(dir_mod);
	MOVF        FARG_modbus_read_analog_dir_mod+0, 0 
	MOVWF       _modbus_tx+9 
;Modbus_TCP.c,115 :: 		modbus_tx[10]=Hi(cuantos);
	MOVF        FARG_modbus_read_analog_cuantos+1, 0 
	MOVWF       _modbus_tx+10 
;Modbus_TCP.c,116 :: 		modbus_tx[11]=Lo(cuantos);
	MOVF        FARG_modbus_read_analog_cuantos+0, 0 
	MOVWF       _modbus_tx+11 
;Modbus_TCP.c,120 :: 		estado_rec=1;// estado de captura recibidos
	MOVLW       1
	MOVWF       _estado_rec+0 
;Modbus_TCP.c,121 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;Modbus_TCP.c,123 :: 		CREN_bit=0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;Modbus_TCP.c,124 :: 		CREN_bit=1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;Modbus_TCP.c,125 :: 		RCIE_bit=1; // habilita la recepcoón
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Modbus_TCP.c,126 :: 		manda_esp8266_bytes(modbus_tx,12);
	MOVLW       _modbus_tx+0
	MOVWF       FARG_manda_esp8266_bytes_info+0 
	MOVLW       hi_addr(_modbus_tx+0)
	MOVWF       FARG_manda_esp8266_bytes_info+1 
	MOVLW       12
	MOVWF       FARG_manda_esp8266_bytes_largo+0 
	MOVLW       0
	MOVWF       FARG_manda_esp8266_bytes_largo+1 
	CALL        _manda_esp8266_bytes+0, 0
;Modbus_TCP.c,129 :: 		}
L_end_modbus_read_analog:
	RETURN      0
; end of _modbus_read_analog
