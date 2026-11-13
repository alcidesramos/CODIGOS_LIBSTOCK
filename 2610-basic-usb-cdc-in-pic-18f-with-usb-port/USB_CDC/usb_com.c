#include <stdint.h>
#include "Librerias\Usb_cdc_lib.h"

char texto[20];
char contador;

// USB interrupt service routine
void interrupt(){
  USBDev_IntHandler();
  //aqui colocar las otras interrupciones

}



void procesa_recibido()
{
      datoRecibido = 0;
    //si se quiere enviar lo recibido  es
            manda_cdc_text(buffer);



      // Prepare receive buffer
      USBDev_CDCSetReceiveBuffer(buffer);
      memset(buffer,0,64);//limppia el buffer
}



void main() 
{
ADCON1=0B1111; //TODO DIGITAL

 Delay_ms(2000); // tretardocrear puerto
 usb_cdc_init();    //inicializa el usb_cdc

     while (1)
     
     {
    cdc_analiza();  //analiza  los buffer del usb   siempre va en el while
    if(datoRecibido == 1)  procesa_recibido();    //si hay dato los procesa  siempre va
    manda_cdc_text("QUE NOTA\r\n");
    
    
    Delay_ms(500);

     }




}