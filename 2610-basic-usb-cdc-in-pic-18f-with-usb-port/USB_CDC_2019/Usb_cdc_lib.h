// Buffer of 64 bytes
char buffer[64] absolute 0x500;
// Buffer of 64 bytes
char trama_tx_usb[64] absolute 0x555;   //Buffer de Transmision



void USBDev_CDCParamsChanged(){

}

extern const uint8_t _USB_CDC_BULK_EP_IN;   // Data interface IN endpoint
extern const uint8_t _USB_CDC_BULK_EP_OUT;  // Data interface OUT endpoint

uint8_t datoRecibido = 0;
uint16_t dataReceivedSize;

void USBDev_CDCDataReceived(uint16_t size){
  datoRecibido = 1;
  dataReceivedSize = size;
}

void cdc_analiza()
{
    if(USB_CDC_DeviceConfigured)
    {
      USBDev_CDCSetReceiveBuffer(buffer);
      USB_CDC_DeviceConfigured = 0;
    }

}

void manda_cdc_char(char *info_)
{
      memset(trama_tx_usb,0,64); //limpia la trama
      trama_tx_usb[0]=info_;
     USBDev_CDCSendData(trama_tx_usb,1);
     delay_ms(10);
}


void manda_cdc_text(char *info_)
{
    char largo_ ;

      largo_=strlen(info_);
     memset(trama_tx_usb,0,64); //limpia la trama
     memcpy(trama_tx_usb, info_,largo_);
     USBDev_CDCSendData(trama_tx_usb,largo_);
     delay_ms(10);
}

void usb_cdc_init()
{
  USBDev_CDCSetLineCoding(9600, 0, 0, 8);
    // Initialize USB device module
  USBDev_Init();

  // Enable USB device interrupt
  IPEN_bit = 1;
  USBIP_bit = 1;
  USBIE_bit = 1;
  GIE_bit = 1;  //habiita todas la interrupciones

}