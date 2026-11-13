
_EEPROM_Read_Int:

;eeprom2.c,4 :: 		unsigned int EEPROM_Read_Int(unsigned char dir)
;eeprom2.c,8 :: 		punte=&leido;
	MOVLW       EEPROM_Read_Int_leido_L0+0
	MOVWF       EEPROM_Read_Int_punte_L0+0 
	MOVLW       hi_addr(EEPROM_Read_Int_leido_L0+0)
	MOVWF       EEPROM_Read_Int_punte_L0+1 
;eeprom2.c,9 :: 		dir+=1; //apunta a la parte alta
	INCF        FARG_EEPROM_Read_Int_dir+0, 1 
;eeprom2.c,10 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Int_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Int_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Int_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,11 :: 		punte++;
	INFSNZ      EEPROM_Read_Int_punte_L0+0, 1 
	INCF        EEPROM_Read_Int_punte_L0+1, 1 
;eeprom2.c,12 :: 		dir--; //Apunta a la baja
	DECF        FARG_EEPROM_Read_Int_dir+0, 1 
;eeprom2.c,13 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Int_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Int_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Int_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,14 :: 		return (leido);
	MOVF        EEPROM_Read_Int_leido_L0+0, 0 
	MOVWF       R0 
	MOVF        EEPROM_Read_Int_leido_L0+1, 0 
	MOVWF       R1 
;eeprom2.c,16 :: 		}
L_end_EEPROM_Read_Int:
	RETURN      0
; end of _EEPROM_Read_Int

_EEPROM_Write_Int:

;eeprom2.c,18 :: 		void EEPROM_Write_Int(unsigned char dir, unsigned int dato_e)
;eeprom2.c,21 :: 		punte=&dato_e;
	MOVLW       FARG_EEPROM_Write_Int_dato_e+0
	MOVWF       EEPROM_Write_Int_punte_L0+0 
	MOVLW       hi_addr(FARG_EEPROM_Write_Int_dato_e+0)
	MOVWF       EEPROM_Write_Int_punte_L0+1 
;eeprom2.c,22 :: 		dir+=1;//   apunta a la parte baja
	INCF        FARG_EEPROM_Write_Int_dir+0, 1 
;eeprom2.c,23 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Int_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Int_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Int_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,25 :: 		punte++;
	INFSNZ      EEPROM_Write_Int_punte_L0+0, 1 
	INCF        EEPROM_Write_Int_punte_L0+1, 1 
;eeprom2.c,26 :: 		dir--;   // pasa a la parte alta
	DECF        FARG_EEPROM_Write_Int_dir+0, 1 
;eeprom2.c,27 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Int_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Int_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Int_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,30 :: 		}
L_end_EEPROM_Write_Int:
	RETURN      0
; end of _EEPROM_Write_Int

_EEPROM_Read_Long:

;eeprom2.c,32 :: 		unsigned long EEPROM_Read_Long(unsigned char dir)
;eeprom2.c,36 :: 		punte=&leido;
	MOVLW       EEPROM_Read_Long_leido_L0+0
	MOVWF       EEPROM_Read_Long_punte_L0+0 
	MOVLW       hi_addr(EEPROM_Read_Long_leido_L0+0)
	MOVWF       EEPROM_Read_Long_punte_L0+1 
;eeprom2.c,37 :: 		dir+=3; //apunta a la parte alta
	MOVLW       3
	ADDWF       FARG_EEPROM_Read_Long_dir+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Read_Long_dir+0 
;eeprom2.c,38 :: 		*punte=EEPROM_Read(dir);
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Long_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Long_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,39 :: 		punte++;
	INFSNZ      EEPROM_Read_Long_punte_L0+0, 1 
	INCF        EEPROM_Read_Long_punte_L0+1, 1 
;eeprom2.c,40 :: 		dir--; //pasa siguiente Byte
	DECF        FARG_EEPROM_Read_Long_dir+0, 1 
;eeprom2.c,41 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Long_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Long_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Long_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,42 :: 		punte++;
	INFSNZ      EEPROM_Read_Long_punte_L0+0, 1 
	INCF        EEPROM_Read_Long_punte_L0+1, 1 
;eeprom2.c,43 :: 		dir--; //pasa siguiente Byte
	DECF        FARG_EEPROM_Read_Long_dir+0, 1 
;eeprom2.c,44 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Long_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Long_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Long_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,45 :: 		punte++;
	INFSNZ      EEPROM_Read_Long_punte_L0+0, 1 
	INCF        EEPROM_Read_Long_punte_L0+1, 1 
;eeprom2.c,46 :: 		dir--; //pasa siguiente Byte
	DECF        FARG_EEPROM_Read_Long_dir+0, 1 
;eeprom2.c,47 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Long_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Long_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Long_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,48 :: 		return (leido);
	MOVF        EEPROM_Read_Long_leido_L0+0, 0 
	MOVWF       R0 
	MOVF        EEPROM_Read_Long_leido_L0+1, 0 
	MOVWF       R1 
	MOVF        EEPROM_Read_Long_leido_L0+2, 0 
	MOVWF       R2 
	MOVF        EEPROM_Read_Long_leido_L0+3, 0 
	MOVWF       R3 
;eeprom2.c,50 :: 		}
L_end_EEPROM_Read_Long:
	RETURN      0
; end of _EEPROM_Read_Long

_EEPROM_Write_Long:

;eeprom2.c,52 :: 		void EEPROM_Write_Long(unsigned char dir, unsigned long dato_e)
;eeprom2.c,55 :: 		punte=&dato_e;
	MOVLW       FARG_EEPROM_Write_Long_dato_e+0
	MOVWF       EEPROM_Write_Long_punte_L0+0 
	MOVLW       hi_addr(FARG_EEPROM_Write_Long_dato_e+0)
	MOVWF       EEPROM_Write_Long_punte_L0+1 
;eeprom2.c,56 :: 		dir+=3;//   apunta a la parte baja
	MOVLW       3
	ADDWF       FARG_EEPROM_Write_Long_dir+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_Long_dir+0 
;eeprom2.c,57 :: 		EEPROM_Write(dir,*punte);
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Long_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Long_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,59 :: 		punte++;
	INFSNZ      EEPROM_Write_Long_punte_L0+0, 1 
	INCF        EEPROM_Write_Long_punte_L0+1, 1 
;eeprom2.c,60 :: 		dir--;   // pasa siguiente dir
	DECF        FARG_EEPROM_Write_Long_dir+0, 1 
;eeprom2.c,61 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Long_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Long_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Long_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,62 :: 		punte++;
	INFSNZ      EEPROM_Write_Long_punte_L0+0, 1 
	INCF        EEPROM_Write_Long_punte_L0+1, 1 
;eeprom2.c,63 :: 		dir--;   // pasa siguiente dir
	DECF        FARG_EEPROM_Write_Long_dir+0, 1 
;eeprom2.c,64 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Long_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Long_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Long_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,65 :: 		punte++;
	INFSNZ      EEPROM_Write_Long_punte_L0+0, 1 
	INCF        EEPROM_Write_Long_punte_L0+1, 1 
;eeprom2.c,66 :: 		dir--;   // pasa siguiente dir
	DECF        FARG_EEPROM_Write_Long_dir+0, 1 
;eeprom2.c,67 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Long_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Long_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Long_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,70 :: 		}
L_end_EEPROM_Write_Long:
	RETURN      0
; end of _EEPROM_Write_Long

_EEPROM_Read_Float:

;eeprom2.c,72 :: 		float EEPROM_Read_Float(unsigned char dir)
;eeprom2.c,77 :: 		punte=&leido;
	MOVLW       EEPROM_Read_Float_leido_L0+0
	MOVWF       EEPROM_Read_Float_punte_L0+0 
	MOVLW       hi_addr(EEPROM_Read_Float_leido_L0+0)
	MOVWF       EEPROM_Read_Float_punte_L0+1 
;eeprom2.c,78 :: 		dir+=3; //apunta a la parte alta
	MOVLW       3
	ADDWF       FARG_EEPROM_Read_Float_dir+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Read_Float_dir+0 
;eeprom2.c,79 :: 		*punte=EEPROM_Read(dir);
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Float_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Float_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,80 :: 		punte++;
	INFSNZ      EEPROM_Read_Float_punte_L0+0, 1 
	INCF        EEPROM_Read_Float_punte_L0+1, 1 
;eeprom2.c,81 :: 		dir--; //pasa siguiente Byte
	DECF        FARG_EEPROM_Read_Float_dir+0, 1 
;eeprom2.c,82 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Float_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Float_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Float_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,83 :: 		punte++;
	INFSNZ      EEPROM_Read_Float_punte_L0+0, 1 
	INCF        EEPROM_Read_Float_punte_L0+1, 1 
;eeprom2.c,84 :: 		dir--; //pasa siguiente Byte
	DECF        FARG_EEPROM_Read_Float_dir+0, 1 
;eeprom2.c,85 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Float_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Float_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Float_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,86 :: 		punte++;
	INFSNZ      EEPROM_Read_Float_punte_L0+0, 1 
	INCF        EEPROM_Read_Float_punte_L0+1, 1 
;eeprom2.c,87 :: 		dir--; //pasa siguiente Byte
	DECF        FARG_EEPROM_Read_Float_dir+0, 1 
;eeprom2.c,88 :: 		*punte=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Float_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       EEPROM_Read_Float_punte_L0+0, FSR1L+0
	MOVFF       EEPROM_Read_Float_punte_L0+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,89 :: 		return (leido);
	MOVF        EEPROM_Read_Float_leido_L0+0, 0 
	MOVWF       R0 
	MOVF        EEPROM_Read_Float_leido_L0+1, 0 
	MOVWF       R1 
	MOVF        EEPROM_Read_Float_leido_L0+2, 0 
	MOVWF       R2 
	MOVF        EEPROM_Read_Float_leido_L0+3, 0 
	MOVWF       R3 
;eeprom2.c,91 :: 		}
L_end_EEPROM_Read_Float:
	RETURN      0
; end of _EEPROM_Read_Float

_EEPROM_Write_Float:

;eeprom2.c,93 :: 		void EEPROM_Write_Float(unsigned char dir, float dato_e)
;eeprom2.c,96 :: 		punte=&dato_e;
	MOVLW       FARG_EEPROM_Write_Float_dato_e+0
	MOVWF       EEPROM_Write_Float_punte_L0+0 
	MOVLW       hi_addr(FARG_EEPROM_Write_Float_dato_e+0)
	MOVWF       EEPROM_Write_Float_punte_L0+1 
;eeprom2.c,97 :: 		dir+=3;//   apunta a la parte baja
	MOVLW       3
	ADDWF       FARG_EEPROM_Write_Float_dir+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_Float_dir+0 
;eeprom2.c,98 :: 		EEPROM_Write(dir,*punte);
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Float_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Float_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,100 :: 		punte++;
	INFSNZ      EEPROM_Write_Float_punte_L0+0, 1 
	INCF        EEPROM_Write_Float_punte_L0+1, 1 
;eeprom2.c,101 :: 		dir--;   // pasa siguiente dir
	DECF        FARG_EEPROM_Write_Float_dir+0, 1 
;eeprom2.c,102 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Float_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Float_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Float_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,103 :: 		punte++;
	INFSNZ      EEPROM_Write_Float_punte_L0+0, 1 
	INCF        EEPROM_Write_Float_punte_L0+1, 1 
;eeprom2.c,104 :: 		dir--;   // pasa siguiente dir
	DECF        FARG_EEPROM_Write_Float_dir+0, 1 
;eeprom2.c,105 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Float_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Float_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Float_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,106 :: 		punte++;
	INFSNZ      EEPROM_Write_Float_punte_L0+0, 1 
	INCF        EEPROM_Write_Float_punte_L0+1, 1 
;eeprom2.c,107 :: 		dir--;   // pasa siguiente dir
	DECF        FARG_EEPROM_Write_Float_dir+0, 1 
;eeprom2.c,108 :: 		EEPROM_Write(dir,*punte);
	MOVF        FARG_EEPROM_Write_Float_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       EEPROM_Write_Float_punte_L0+0, FSR0L+0
	MOVFF       EEPROM_Write_Float_punte_L0+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,111 :: 		}
L_end_EEPROM_Write_Float:
	RETURN      0
; end of _EEPROM_Write_Float

_EEPROM_Read_Texto:

;eeprom2.c,113 :: 		void EEPROM_Read_Texto(unsigned char dir, char* cadena)
;eeprom2.c,116 :: 		do
L_EEPROM_Read_Texto0:
;eeprom2.c,118 :: 		dato=EEPROM_Read(dir);
	MOVF        FARG_EEPROM_Read_Texto_dir+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       EEPROM_Read_Texto_dato_L0+0 
;eeprom2.c,119 :: 		*cadena=dato;
	MOVFF       FARG_EEPROM_Read_Texto_cadena+0, FSR1L+0
	MOVFF       FARG_EEPROM_Read_Texto_cadena+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;eeprom2.c,120 :: 		cadena++;
	INFSNZ      FARG_EEPROM_Read_Texto_cadena+0, 1 
	INCF        FARG_EEPROM_Read_Texto_cadena+1, 1 
;eeprom2.c,121 :: 		dir++;
	INCF        FARG_EEPROM_Read_Texto_dir+0, 1 
;eeprom2.c,123 :: 		while (dato!=0);
	MOVF        EEPROM_Read_Texto_dato_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_EEPROM_Read_Texto0
;eeprom2.c,124 :: 		*cadena=0; // coloca caracter null a la variable de la cadena
	MOVFF       FARG_EEPROM_Read_Texto_cadena+0, FSR1L+0
	MOVFF       FARG_EEPROM_Read_Texto_cadena+1, FSR1H+0
	CLRF        POSTINC1+0 
;eeprom2.c,128 :: 		}
L_end_EEPROM_Read_Texto:
	RETURN      0
; end of _EEPROM_Read_Texto

_EEPROM_Write_Texto:

;eeprom2.c,130 :: 		void EEPROM_Write_Texto(unsigned char dir, char *cadena)
;eeprom2.c,133 :: 		while(*cadena)
L_EEPROM_Write_Texto3:
	MOVFF       FARG_EEPROM_Write_Texto_cadena+0, FSR0L+0
	MOVFF       FARG_EEPROM_Write_Texto_cadena+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_EEPROM_Write_Texto4
;eeprom2.c,135 :: 		EEPROM_Write(dir,*cadena);
	MOVF        FARG_EEPROM_Write_Texto_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVFF       FARG_EEPROM_Write_Texto_cadena+0, FSR0L+0
	MOVFF       FARG_EEPROM_Write_Texto_cadena+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,136 :: 		cadena++;
	INFSNZ      FARG_EEPROM_Write_Texto_cadena+0, 1 
	INCF        FARG_EEPROM_Write_Texto_cadena+1, 1 
;eeprom2.c,137 :: 		dir++;   // pasa a la parte alta
	INCF        FARG_EEPROM_Write_Texto_dir+0, 1 
;eeprom2.c,138 :: 		}
	GOTO        L_EEPROM_Write_Texto3
L_EEPROM_Write_Texto4:
;eeprom2.c,139 :: 		EEPROM_Write(dir,0);  ;// escribe caracter null
	MOVF        FARG_EEPROM_Write_Texto_dir+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	CLRF        FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;eeprom2.c,143 :: 		}
L_end_EEPROM_Write_Texto:
	RETURN      0
; end of _EEPROM_Write_Texto

_main:

;eeprom2.c,147 :: 		void main()
;eeprom2.c,151 :: 		ADCON1=0B1111; // TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;eeprom2.c,152 :: 		TRISB7_bit=1; // entrda pulsador
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;eeprom2.c,153 :: 		TRISC6_bit=0; // salita tx
	BCF         TRISC6_bit+0, BitPos(TRISC6_bit+0) 
;eeprom2.c,154 :: 		NOT_RBPU_bit=0; // Habilito las pull ups portb
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
;eeprom2.c,156 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;eeprom2.c,157 :: 		contador=10.5;
	MOVLW       0
	MOVWF       _contador+0 
	MOVLW       0
	MOVWF       _contador+1 
	MOVLW       40
	MOVWF       _contador+2 
	MOVLW       130
	MOVWF       _contador+3 
;eeprom2.c,172 :: 		if (RB7_bit==0) EEPROM_Write_Texto(0,"Hola mundo");
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main5
	CLRF        FARG_EEPROM_Write_Texto_dir+0 
	MOVLW       ?lstr1_eeprom2+0
	MOVWF       FARG_EEPROM_Write_Texto_cadena+0 
	MOVLW       hi_addr(?lstr1_eeprom2+0)
	MOVWF       FARG_EEPROM_Write_Texto_cadena+1 
	CALL        _EEPROM_Write_Texto+0, 0
L_main5:
;eeprom2.c,173 :: 		EEPROM_Read_Texto(0,&texto);
	CLRF        FARG_EEPROM_Read_Texto_dir+0 
	MOVLW       _texto+0
	MOVWF       FARG_EEPROM_Read_Texto_cadena+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_EEPROM_Read_Texto_cadena+1 
	CALL        _EEPROM_Read_Texto+0, 0
;eeprom2.c,174 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;eeprom2.c,178 :: 		UART1_Write_Text("INICIANDO\r\n");
	MOVLW       ?lstr2_eeprom2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_eeprom2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;eeprom2.c,180 :: 		while (1)
L_main6:
;eeprom2.c,182 :: 		EEPROM_Write_Texto(0,"probando");
	CLRF        FARG_EEPROM_Write_Texto_dir+0 
	MOVLW       ?lstr3_eeprom2+0
	MOVWF       FARG_EEPROM_Write_Texto_cadena+0 
	MOVLW       hi_addr(?lstr3_eeprom2+0)
	MOVWF       FARG_EEPROM_Write_Texto_cadena+1 
	CALL        _EEPROM_Write_Texto+0, 0
;eeprom2.c,183 :: 		UART1_Write_Text("probando\r\n");
	MOVLW       ?lstr4_eeprom2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_eeprom2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;eeprom2.c,184 :: 		Delay_ms(1000) ;
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;eeprom2.c,186 :: 		EEPROM_Write_Texto(0,"hola mundo");
	CLRF        FARG_EEPROM_Write_Texto_dir+0 
	MOVLW       ?lstr5_eeprom2+0
	MOVWF       FARG_EEPROM_Write_Texto_cadena+0 
	MOVLW       hi_addr(?lstr5_eeprom2+0)
	MOVWF       FARG_EEPROM_Write_Texto_cadena+1 
	CALL        _EEPROM_Write_Texto+0, 0
;eeprom2.c,187 :: 		UART1_Write_Text("hola mundo\r\n");
	MOVLW       ?lstr6_eeprom2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_eeprom2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;eeprom2.c,188 :: 		Delay_ms(1000) ;
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;eeprom2.c,190 :: 		EEPROM_Write_Texto(0,"como va todo");
	CLRF        FARG_EEPROM_Write_Texto_dir+0 
	MOVLW       ?lstr7_eeprom2+0
	MOVWF       FARG_EEPROM_Write_Texto_cadena+0 
	MOVLW       hi_addr(?lstr7_eeprom2+0)
	MOVWF       FARG_EEPROM_Write_Texto_cadena+1 
	CALL        _EEPROM_Write_Texto+0, 0
;eeprom2.c,191 :: 		UART1_Write_Text("como va todo\r\n");
	MOVLW       ?lstr8_eeprom2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_eeprom2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;eeprom2.c,192 :: 		delay_ms(1000) ;
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
;eeprom2.c,196 :: 		}
	GOTO        L_main6
;eeprom2.c,198 :: 		while (1)
L_main11:
;eeprom2.c,200 :: 		contador+=1;
	MOVF        _contador+0, 0 
	MOVWF       R0 
	MOVF        _contador+1, 0 
	MOVWF       R1 
	MOVF        _contador+2, 0 
	MOVWF       R2 
	MOVF        _contador+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _contador+0 
	MOVF        R1, 0 
	MOVWF       _contador+1 
	MOVF        R2, 0 
	MOVWF       _contador+2 
	MOVF        R3, 0 
	MOVWF       _contador+3 
;eeprom2.c,201 :: 		EEPROM_Write_Float(0,contador);
	CLRF        FARG_EEPROM_Write_Float_dir+0 
	MOVF        _contador+0, 0 
	MOVWF       FARG_EEPROM_Write_Float_dato_e+0 
	MOVF        _contador+1, 0 
	MOVWF       FARG_EEPROM_Write_Float_dato_e+1 
	MOVF        _contador+2, 0 
	MOVWF       FARG_EEPROM_Write_Float_dato_e+2 
	MOVF        _contador+3, 0 
	MOVWF       FARG_EEPROM_Write_Float_dato_e+3 
	CALL        _EEPROM_Write_Float+0, 0
;eeprom2.c,203 :: 		sprintf(texto,"valor=%.2f\r\n", contador);
	MOVLW       _texto+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_9_eeprom2+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_9_eeprom2+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_9_eeprom2+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _contador+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _contador+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _contador+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _contador+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;eeprom2.c,205 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;eeprom2.c,206 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
	NOP
;eeprom2.c,209 :: 		}
	GOTO        L_main11
;eeprom2.c,210 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
