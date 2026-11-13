
_USBDev_CDCParamsChanged:

;usb_cdc_lib.h,5 :: 		void USBDev_CDCParamsChanged(){
;usb_cdc_lib.h,7 :: 		}
L_end_USBDev_CDCParamsChanged:
	RETURN      0
; end of _USBDev_CDCParamsChanged

_USBDev_CDCDataReceived:

;usb_cdc_lib.h,15 :: 		void USBDev_CDCDataReceived(uint16_t size){
;usb_cdc_lib.h,16 :: 		datoRecibido = 1;
	MOVLW       1
	MOVWF       _datoRecibido+0 
;usb_cdc_lib.h,17 :: 		dataReceivedSize = size;
	MOVF        FARG_USBDev_CDCDataReceived_size+0, 0 
	MOVWF       _dataReceivedSize+0 
	MOVF        FARG_USBDev_CDCDataReceived_size+1, 0 
	MOVWF       _dataReceivedSize+1 
;usb_cdc_lib.h,18 :: 		}
L_end_USBDev_CDCDataReceived:
	RETURN      0
; end of _USBDev_CDCDataReceived

_cdc_analiza:

;usb_cdc_lib.h,20 :: 		void cdc_analiza()
;usb_cdc_lib.h,22 :: 		if(USB_CDC_DeviceConfigured)
	MOVF        _USB_CDC_DeviceConfigured+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_cdc_analiza0
;usb_cdc_lib.h,24 :: 		USBDev_CDCSetReceiveBuffer(buffer);
	MOVLW       _buffer+0
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+1 
	CALL        _USBDev_CDCSetReceiveBuffer+0, 0
;usb_cdc_lib.h,25 :: 		USB_CDC_DeviceConfigured = 0;
	CLRF        _USB_CDC_DeviceConfigured+0 
;usb_cdc_lib.h,26 :: 		}
L_cdc_analiza0:
;usb_cdc_lib.h,28 :: 		}
L_end_cdc_analiza:
	RETURN      0
; end of _cdc_analiza

_manda_cdc_char:

;usb_cdc_lib.h,30 :: 		void manda_cdc_char(char *info_)
;usb_cdc_lib.h,32 :: 		memset(trama,0,64); //limpia la trama
	MOVLW       _trama+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       64
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;usb_cdc_lib.h,33 :: 		trama[0]=info_;
	MOVF        FARG_manda_cdc_char_info_+0, 0 
	MOVWF       1365 
;usb_cdc_lib.h,34 :: 		USBDev_CDCSendData(trama,1);
	MOVLW       _trama+0
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+1 
	MOVLW       1
	MOVWF       FARG_USBDev_CDCSendData_dataLen+0 
	MOVLW       0
	MOVWF       FARG_USBDev_CDCSendData_dataLen+1 
	CALL        _USBDev_CDCSendData+0, 0
;usb_cdc_lib.h,35 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_manda_cdc_char1:
	DECFSZ      R13, 1, 1
	BRA         L_manda_cdc_char1
	DECFSZ      R12, 1, 1
	BRA         L_manda_cdc_char1
	NOP
;usb_cdc_lib.h,36 :: 		}
L_end_manda_cdc_char:
	RETURN      0
; end of _manda_cdc_char

_manda_cdc_text:

;usb_cdc_lib.h,39 :: 		void manda_cdc_text(char *info_)
;usb_cdc_lib.h,43 :: 		largo_=strlen(info_);
	MOVF        FARG_manda_cdc_text_info_+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_manda_cdc_text_info_+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       manda_cdc_text_largo__L0+0 
;usb_cdc_lib.h,44 :: 		memset(trama,0,64); //limpia la trama
	MOVLW       _trama+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       64
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;usb_cdc_lib.h,45 :: 		memcpy(trama, info_,largo_);
	MOVLW       _trama+0
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_memcpy_d1+1 
	MOVF        FARG_manda_cdc_text_info_+0, 0 
	MOVWF       FARG_memcpy_s1+0 
	MOVF        FARG_manda_cdc_text_info_+1, 0 
	MOVWF       FARG_memcpy_s1+1 
	MOVF        manda_cdc_text_largo__L0+0, 0 
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;usb_cdc_lib.h,46 :: 		USBDev_CDCSendData(trama,largo_);
	MOVLW       _trama+0
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+0 
	MOVLW       hi_addr(_trama+0)
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+1 
	MOVF        manda_cdc_text_largo__L0+0, 0 
	MOVWF       FARG_USBDev_CDCSendData_dataLen+0 
	MOVLW       0
	MOVWF       FARG_USBDev_CDCSendData_dataLen+1 
	CALL        _USBDev_CDCSendData+0, 0
;usb_cdc_lib.h,47 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_manda_cdc_text2:
	DECFSZ      R13, 1, 1
	BRA         L_manda_cdc_text2
	DECFSZ      R12, 1, 1
	BRA         L_manda_cdc_text2
	NOP
;usb_cdc_lib.h,48 :: 		}
L_end_manda_cdc_text:
	RETURN      0
; end of _manda_cdc_text

_usb_cdc_init:

;usb_cdc_lib.h,50 :: 		void usb_cdc_init()
;usb_cdc_lib.h,52 :: 		USBDev_CDCSetLineCoding(9600, 0, 0, 8);
	MOVLW       128
	MOVWF       FARG_USBDev_CDCSetLineCoding_dwDTERate+0 
	MOVLW       37
	MOVWF       FARG_USBDev_CDCSetLineCoding_dwDTERate+1 
	MOVLW       0
	MOVWF       FARG_USBDev_CDCSetLineCoding_dwDTERate+2 
	MOVWF       FARG_USBDev_CDCSetLineCoding_dwDTERate+3 
	CLRF        FARG_USBDev_CDCSetLineCoding_bCharFormat+0 
	CLRF        FARG_USBDev_CDCSetLineCoding_bParityType+0 
	MOVLW       8
	MOVWF       FARG_USBDev_CDCSetLineCoding_bDataBits+0 
	CALL        _USBDev_CDCSetLineCoding+0, 0
;usb_cdc_lib.h,54 :: 		USBDev_Init();
	CALL        _USBDev_Init+0, 0
;usb_cdc_lib.h,57 :: 		IPEN_bit = 1;
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;usb_cdc_lib.h,58 :: 		USBIP_bit = 1;
	BSF         USBIP_bit+0, BitPos(USBIP_bit+0) 
;usb_cdc_lib.h,59 :: 		USBIE_bit = 1;
	BSF         USBIE_bit+0, BitPos(USBIE_bit+0) 
;usb_cdc_lib.h,60 :: 		GIE_bit = 1;  //habiita todas la interrupciones
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_cdc_lib.h,62 :: 		}
L_end_usb_cdc_init:
	RETURN      0
; end of _usb_cdc_init

_interrupt:

;usb_com.c,8 :: 		void interrupt(){
;usb_com.c,9 :: 		USBDev_IntHandler();
	CALL        _USBDev_IntHandler+0, 0
;usb_com.c,12 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE      1
; end of _interrupt

_procesa_recibido:

;usb_com.c,16 :: 		void procesa_recibido()
;usb_com.c,18 :: 		datoRecibido = 0;
	CLRF        _datoRecibido+0 
;usb_com.c,20 :: 		manda_cdc_text(buffer);
	MOVLW       _buffer+0
	MOVWF       FARG_manda_cdc_text_info_+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_manda_cdc_text_info_+1 
	CALL        _manda_cdc_text+0, 0
;usb_com.c,25 :: 		USBDev_CDCSetReceiveBuffer(buffer);
	MOVLW       _buffer+0
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+1 
	CALL        _USBDev_CDCSetReceiveBuffer+0, 0
;usb_com.c,26 :: 		memset(buffer,0,64);//limppia el buffer
	MOVLW       _buffer+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       64
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;usb_com.c,27 :: 		}
L_end_procesa_recibido:
	RETURN      0
; end of _procesa_recibido

_main:

;usb_com.c,31 :: 		void main()
;usb_com.c,33 :: 		ADCON1=0B1111; //TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;usb_com.c,35 :: 		Delay_ms(2000); // tretardocrear puerto
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;usb_com.c,36 :: 		usb_cdc_init();    //inicializa el usb_cdc
	CALL        _usb_cdc_init+0, 0
;usb_com.c,38 :: 		while (1)
L_main4:
;usb_com.c,41 :: 		cdc_analiza();  //analiza  los buffer del usb   siempre va en el while
	CALL        _cdc_analiza+0, 0
;usb_com.c,42 :: 		if(datoRecibido == 1)  procesa_recibido();    //si hay dato los procesa  siempre va
	MOVF        _datoRecibido+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
	CALL        _procesa_recibido+0, 0
L_main6:
;usb_com.c,43 :: 		manda_cdc_text("QUE NOTA\r\n");
	MOVLW       ?lstr1_usb_com+0
	MOVWF       FARG_manda_cdc_text_info_+0 
	MOVLW       hi_addr(?lstr1_usb_com+0)
	MOVWF       FARG_manda_cdc_text_info_+1 
	CALL        _manda_cdc_text+0, 0
;usb_com.c,46 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;usb_com.c,48 :: 		}
	GOTO        L_main4
;usb_com.c,53 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
