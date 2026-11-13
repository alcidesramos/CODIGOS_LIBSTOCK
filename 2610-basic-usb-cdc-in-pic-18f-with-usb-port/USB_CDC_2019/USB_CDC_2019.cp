#line 1 "C:/Users/Alcides Ramos/Desktop/USB_CDC_2019/USB_CDC_2019.c"
#line 6 "C:/Users/Alcides Ramos/Desktop/USB_CDC_2019/USB_CDC_2019.c"
char texto[20];
char contador;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 1 "c:/users/alcides ramos/desktop/usb_cdc_2019/usb_cdc_lib.h"

char buffer[64] absolute 0x500;

char trama_tx_usb[64] absolute 0x555;



void USBDev_CDCParamsChanged(){

}

extern const uint8_t _USB_CDC_BULK_EP_IN;
extern const uint8_t _USB_CDC_BULK_EP_OUT;

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
 memset(trama_tx_usb,0,64);
 trama_tx_usb[0]=info_;
 USBDev_CDCSendData(trama_tx_usb,1);
 delay_ms(10);
}


void manda_cdc_text(char *info_)
{
 char largo_ ;

 largo_=strlen(info_);
 memset(trama_tx_usb,0,64);
 memcpy(trama_tx_usb, info_,largo_);
 USBDev_CDCSendData(trama_tx_usb,largo_);
 delay_ms(10);
}

void usb_cdc_init()
{
 USBDev_CDCSetLineCoding(9600, 0, 0, 8);

 USBDev_Init();


 IPEN_bit = 1;
 USBIP_bit = 1;
 USBIE_bit = 1;
 GIE_bit = 1;

}
#line 15 "C:/Users/Alcides Ramos/Desktop/USB_CDC_2019/USB_CDC_2019.c"
void interrupt(){


 USBDev_IntHandler();
}


void procesa_recibido()
{
 datoRecibido = 0;

 manda_cdc_text(buffer);




 USBDev_CDCSetReceiveBuffer(buffer);
 memset(buffer,0,64);
}





void main()
{
ADCON1=0B1111;
 CMCON=7;

 Delay_ms(5000);
 usb_cdc_init();

 while(1)
 {
 cdc_analiza();
 if(datoRecibido == 1) procesa_recibido();
 manda_cdc_text("QUE NOTA\r\n");
 Delay_ms(500);



 }


}
