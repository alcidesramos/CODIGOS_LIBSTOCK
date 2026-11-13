
_USBDev_CDCParamsChanged:

;usb_cdc_lib.h,8 :: 		void USBDev_CDCParamsChanged(){
;usb_cdc_lib.h,10 :: 		}
L_end_USBDev_CDCParamsChanged:
	RETURN      0
; end of _USBDev_CDCParamsChanged

_USBDev_CDCDataReceived:

;usb_cdc_lib.h,18 :: 		void USBDev_CDCDataReceived(uint16_t size){
;usb_cdc_lib.h,19 :: 		datoRecibido = 1;
	MOVLW       1
	MOVWF       _datoRecibido+0 
;usb_cdc_lib.h,20 :: 		dataReceivedSize = size;
	MOVF        FARG_USBDev_CDCDataReceived_size+0, 0 
	MOVWF       _dataReceivedSize+0 
	MOVF        FARG_USBDev_CDCDataReceived_size+1, 0 
	MOVWF       _dataReceivedSize+1 
;usb_cdc_lib.h,21 :: 		}
L_end_USBDev_CDCDataReceived:
	RETURN      0
; end of _USBDev_CDCDataReceived

_cdc_analiza:

;usb_cdc_lib.h,23 :: 		void cdc_analiza()
;usb_cdc_lib.h,25 :: 		if(USB_CDC_DeviceConfigured)
	MOVF        _USB_CDC_DeviceConfigured+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_cdc_analiza0
;usb_cdc_lib.h,27 :: 		USBDev_CDCSetReceiveBuffer(buffer);
	MOVLW       _buffer+0
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+1 
	CALL        _USBDev_CDCSetReceiveBuffer+0, 0
;usb_cdc_lib.h,28 :: 		USB_CDC_DeviceConfigured = 0;
	CLRF        _USB_CDC_DeviceConfigured+0 
;usb_cdc_lib.h,29 :: 		}
L_cdc_analiza0:
;usb_cdc_lib.h,31 :: 		}
L_end_cdc_analiza:
	RETURN      0
; end of _cdc_analiza

_manda_cdc_char:

;usb_cdc_lib.h,33 :: 		void manda_cdc_char(char *info_)
;usb_cdc_lib.h,35 :: 		memset(trama_tx_usb,0,64); //limpia la trama
	MOVLW       _trama_tx_usb+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_tx_usb+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       64
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;usb_cdc_lib.h,36 :: 		trama_tx_usb[0]=info_;
	MOVF        FARG_manda_cdc_char_info_+0, 0 
	MOVWF       1365 
;usb_cdc_lib.h,37 :: 		USBDev_CDCSendData(trama_tx_usb,1);
	MOVLW       _trama_tx_usb+0
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+0 
	MOVLW       hi_addr(_trama_tx_usb+0)
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+1 
	MOVLW       1
	MOVWF       FARG_USBDev_CDCSendData_dataLen+0 
	MOVLW       0
	MOVWF       FARG_USBDev_CDCSendData_dataLen+1 
	CALL        _USBDev_CDCSendData+0, 0
;usb_cdc_lib.h,38 :: 		delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_manda_cdc_char1:
	DECFSZ      R13, 1, 1
	BRA         L_manda_cdc_char1
	DECFSZ      R12, 1, 1
	BRA         L_manda_cdc_char1
;usb_cdc_lib.h,39 :: 		}
L_end_manda_cdc_char:
	RETURN      0
; end of _manda_cdc_char

_manda_cdc_text:

;usb_cdc_lib.h,42 :: 		void manda_cdc_text(char *info_)
;usb_cdc_lib.h,46 :: 		largo_=strlen(info_);
	MOVF        FARG_manda_cdc_text_info_+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_manda_cdc_text_info_+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       manda_cdc_text_largo__L0+0 
;usb_cdc_lib.h,47 :: 		memset(trama_tx_usb,0,64); //limpia la trama
	MOVLW       _trama_tx_usb+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_trama_tx_usb+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       64
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;usb_cdc_lib.h,48 :: 		memcpy(trama_tx_usb, info_,largo_);
	MOVLW       _trama_tx_usb+0
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(_trama_tx_usb+0)
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
;usb_cdc_lib.h,49 :: 		USBDev_CDCSendData(trama_tx_usb,largo_);
	MOVLW       _trama_tx_usb+0
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+0 
	MOVLW       hi_addr(_trama_tx_usb+0)
	MOVWF       FARG_USBDev_CDCSendData_dataBuff+1 
	MOVF        manda_cdc_text_largo__L0+0, 0 
	MOVWF       FARG_USBDev_CDCSendData_dataLen+0 
	MOVLW       0
	MOVWF       FARG_USBDev_CDCSendData_dataLen+1 
	CALL        _USBDev_CDCSendData+0, 0
;usb_cdc_lib.h,50 :: 		delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_manda_cdc_text2:
	DECFSZ      R13, 1, 1
	BRA         L_manda_cdc_text2
	DECFSZ      R12, 1, 1
	BRA         L_manda_cdc_text2
;usb_cdc_lib.h,51 :: 		}
L_end_manda_cdc_text:
	RETURN      0
; end of _manda_cdc_text

_usb_cdc_init:

;usb_cdc_lib.h,53 :: 		void usb_cdc_init()
;usb_cdc_lib.h,55 :: 		USBDev_CDCSetLineCoding(9600, 0, 0, 8);
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
;usb_cdc_lib.h,57 :: 		USBDev_Init();
	CALL        _USBDev_Init+0, 0
;usb_cdc_lib.h,60 :: 		IPEN_bit = 1;
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;usb_cdc_lib.h,61 :: 		USBIP_bit = 1;
	BSF         USBIP_bit+0, BitPos(USBIP_bit+0) 
;usb_cdc_lib.h,62 :: 		USBIE_bit = 1;
	BSF         USBIE_bit+0, BitPos(USBIE_bit+0) 
;usb_cdc_lib.h,63 :: 		GIE_bit = 1;  //habiita todas la interrupciones
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_cdc_lib.h,65 :: 		}
L_end_usb_cdc_init:
	RETURN      0
; end of _usb_cdc_init

_interrupt:

;USB_CDC_2019.c,15 :: 		void interrupt(){
;USB_CDC_2019.c,18 :: 		USBDev_IntHandler();
	CALL        _USBDev_IntHandler+0, 0
;USB_CDC_2019.c,19 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE      1
; end of _interrupt

_procesa_recibido:

;USB_CDC_2019.c,22 :: 		void procesa_recibido()
;USB_CDC_2019.c,24 :: 		datoRecibido = 0;
	CLRF        _datoRecibido+0 
;USB_CDC_2019.c,26 :: 		manda_cdc_text(buffer);
	MOVLW       _buffer+0
	MOVWF       FARG_manda_cdc_text_info_+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_manda_cdc_text_info_+1 
	CALL        _manda_cdc_text+0, 0
;USB_CDC_2019.c,31 :: 		USBDev_CDCSetReceiveBuffer(buffer);
	MOVLW       _buffer+0
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_USBDev_CDCSetReceiveBuffer_dataBuff+1 
	CALL        _USBDev_CDCSetReceiveBuffer+0, 0
;USB_CDC_2019.c,32 :: 		memset(buffer,0,64);//limppia el buffer
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
;USB_CDC_2019.c,33 :: 		}
L_end_procesa_recibido:
	RETURN      0
; end of _procesa_recibido

_main:

;USB_CDC_2019.c,39 :: 		void main()
;USB_CDC_2019.c,41 :: 		ADCON1=0B1111; //TODO DIGITAL
	MOVLW       15
	MOVWF       ADCON1+0 
;USB_CDC_2019.c,42 :: 		CMCON=7;   // apaga comparador
	MOVLW       7
	MOVWF       CMCON+0 
;USB_CDC_2019.c,44 :: 		Delay_ms(5000); // tretardocrear puerto
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	DECFSZ      R10, 1, 1
	BRA         L_main3
;USB_CDC_2019.c,45 :: 		usb_cdc_init();    //inicializa el usb_cdc
	CALL        _usb_cdc_init+0, 0
;USB_CDC_2019.c,47 :: 		while(1)
L_main4:
;USB_CDC_2019.c,49 :: 		cdc_analiza();  //analiza  los buffer del usb   siempre va en el while
	CALL        _cdc_analiza+0, 0
;USB_CDC_2019.c,50 :: 		if(datoRecibido == 1)  procesa_recibido();    //si hay dato los procesa  siempre va
	MOVF        _datoRecibido+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
	CALL        _procesa_recibido+0, 0
L_main6:
;USB_CDC_2019.c,51 :: 		manda_cdc_text("QUE NOTA\r\n");
	MOVLW       ?lstr1_USB_CDC_2019+0
	MOVWF       FARG_manda_cdc_text_info_+0 
	MOVLW       hi_addr(?lstr1_USB_CDC_2019+0)
	MOVWF       FARG_manda_cdc_text_info_+1 
	CALL        _manda_cdc_text+0, 0
;USB_CDC_2019.c,52 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;USB_CDC_2019.c,56 :: 		}
	GOTO        L_main4
;USB_CDC_2019.c,59 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
