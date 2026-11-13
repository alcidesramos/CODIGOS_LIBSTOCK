  // fomato d ela trama
  //  IN=INFO FF FF FF

#include "Nextion.h"

//                  i       n        =      ff   ff  ff
enum trama_rx_es {inicio1,inicio2,inicio3,fin1,fin2,fin3};
char nextion_trama_estado=inicio1;  // estado inical d ela maquina de estad0
unsigned char trama_rx_nextion[50];
unsigned char trama_rx_cont=0;
char flag_rx1=0;



void nextion_init()
{
UART1_Init(9600); //inicia la nextion a 9600
RCIF_bit=0; //limpia bandera recepcions Serial
RCIE_bit=1;// activa la bandera de recepción serial
// borra erroes de rececion e inicia recpcion continua
CREN_bit=0;
CREN_bit=1;

}


void nextion_interrupcion()
{
 if (RCIF_bit==1) // mira si es interrpcion serial

  {            // fomato d ela trama
              //  INI=INFO FF FF FF

            unsigned int dat_rx;

               dat_rx=RCREG;// recibe dato actual

               //inicia maquina de estado
               switch (nextion_trama_estado)
               {
               case inicio1:
                         if (dat_rx=='I')
                         {
                          trama_rx_nextion[trama_rx_cont]=dat_rx;
                          nextion_trama_estado=inicio2;
                          trama_rx_cont++;
                         }
                           break;

               case inicio2:
                         if (dat_rx=='N')
                         {
                         trama_rx_nextion[trama_rx_cont]=dat_rx;
                          nextion_trama_estado=inicio3;
                          trama_rx_cont++;
                         }
                         else
                         {
                          nextion_trama_estado=inicio1;
                          trama_rx_cont=0;
                         }
                         break;

               case inicio3:
                         if (dat_rx=='=')
                         {
                         trama_rx_nextion[trama_rx_cont]=dat_rx;
                          nextion_trama_estado=fin1;
                          trama_rx_cont++;
                         }
                         else
                         {
                          nextion_trama_estado=inicio1;
                          trama_rx_cont=0;
                         }
                         break;

                 case fin1:

                        if (dat_rx!=0xff)
                        {
                        trama_rx_nextion[trama_rx_cont]=dat_rx;
                        trama_rx_cont++;
                            if (trama_rx_cont>=50)
                            {
                             trama_rx_cont=0;
                            nextion_trama_estado=inicio1;
                            }
                        }
                        else nextion_trama_estado=fin2;
                      break;

                 case fin2:

                        if (dat_rx!=0xff)
                        {
                        trama_rx_nextion[trama_rx_cont]=dat_rx;
                        trama_rx_cont++;
                            if (trama_rx_cont>=50)
                            {
                             trama_rx_cont=0;
                            nextion_trama_estado=inicio1;
                            }

                        }
                        else nextion_trama_estado=fin3;
                      break;


                 case fin3:

                        if (dat_rx!=0xff)
                        {
                        trama_rx_nextion[trama_rx_cont]=dat_rx;
                        trama_rx_cont++;
                            if (trama_rx_cont>=50)
                            {
                             trama_rx_cont=0;
                            nextion_trama_estado=inicio1;
                            }

                        }
                        else
                        {
                        trama_rx_nextion[trama_rx_cont]=0; // agrega cero fin de cadena para variables string
                        nextion_trama_estado=inicio1;
                        trama_rx_cont=0;
                         RCIE_bit=0;//deshabilita la interrupcio, para que se procese la info
                         flag_rx1=1;//activa la bandera de datos listo
                        }
                      break;

               }//fin del switch

            RCIF_bit=0;//limpia bandera de recepcion
  }
}