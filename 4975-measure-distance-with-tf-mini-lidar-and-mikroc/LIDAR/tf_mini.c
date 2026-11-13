#include "tf_mini.h"
unsigned char trama_rx_lidar[20];
unsigned char trama_rx_lidar_cont=0;
char flag_rx_lidar=0;

enum tf_estado_ {tf_cabe,tf_cabe1,tf_datos,tf_fin};
char tf_estado=tf_cabe;

unsigned int distancia;
unsigned int fuerza;
float distancia_float;




void tf_mini_config()
{
  UART1_Init(115200);
  memset(trama_rx_lidar,0,20);// limpia la trama
}


void tf_mini_out_hex()
{
  UART1_Write(0x42);
  UART1_Write(0x57);
  UART1_Write(0x02);
  UART1_Write(0x00);
  UART1_Write(0x00);
  UART1_Write(0x00);
  UART1_Write(0x01);
  UART1_Write(0x06);

}


void tf_mini_out_str()
{
  UART1_Write(0x42);
  UART1_Write(0x57);
  UART1_Write(0x02);
  UART1_Write(0x00);
  UART1_Write(0x00);
  UART1_Write(0x00);
  UART1_Write(0x04);
  UART1_Write(0x06);

}


void tf_mini_interrupcion_hex()
{
      if (RCIF_bit==1) // mira si es interrpcion serial
    {
       unsigned char dat_rx;

               dat_rx=RCREG;// recibe dato actual

               //inicia maquina de estado
               switch (tf_estado)
               {
               case tf_cabe:
                           if (dat_rx==0x59) tf_estado=tf_cabe1;  //pasa al estado de segunda cabecera
                            break;

               case tf_cabe1:
                           if (dat_rx==0x59) tf_estado=tf_datos;      //pasa al estado datos
                           else   tf_estado=tf_cabe;   //regresa al estado inicial
                            break;
                            
               case tf_datos:

                            trama_rx_lidar[trama_rx_lidar_cont]=dat_rx;
                            trama_rx_lidar_cont++;
                        if (trama_rx_lidar_cont>7)      //si captura los datos completos
                            {
                            tf_estado=tf_cabe;
                            trama_rx_lidar_cont=0;
                             RCIE_bit=0;//deshabilita la interrupcion, para que se procese la info
                             flag_rx_lidar=1;//activa la bandera de datos listo
                                }

                        break;


              }


           RCIF_bit=0;
    }  //if
  
  
  }

void tf_mini_interrupcion_str()
{
      if (RCIF_bit==1) // mira si es interrpcion serial
    {
       unsigned char dat_rx;
               dat_rx=RCREG;// recibe dato actual

               //inicia maquina de estado
               switch (tf_estado)
               {
               case tf_cabe:
                           if (dat_rx=='\n') tf_estado=tf_cabe1;  //pasa al estado de segunda cabecera
                           break;
                 case tf_cabe1:
                            trama_rx_lidar[trama_rx_lidar_cont]=dat_rx;
                            trama_rx_lidar_cont++;
                             
                               if (dat_rx=='\n')
                               {
                             trama_rx_lidar[trama_rx_lidar_cont]=0;
                             tf_estado=tf_cabe;
                             trama_rx_lidar_cont=0;
                             RCIE_bit=0;//deshabilita la interrupcion, para que se procese la info
                             flag_rx_lidar=1;//activa la bandera de datos listo

                               }

                             else if (trama_rx_lidar_cont>=20)      //si supero tamño del buffer
                            {
                            trama_rx_lidar_cont=0;
                            tf_estado=tf_cabe;
                            }

                               break;

                           
              
              }
     
     RCIF_bit=0;
     }

}

  void procesa_lidar_hex()
{
     distancia= ((unsigned int)trama_rx_lidar[1]<<8)+((unsigned int )trama_rx_lidar[0]);
     fuerza=((unsigned int)trama_rx_lidar[3]<<8)+((unsigned int )trama_rx_lidar[2]); //artma la distancia

    memset(trama_rx_lidar,0,20);// limpia la trama
}


void procesa_lidar_str()
{
       distancia_float=atof(trama_rx_lidar);
       memset(trama_rx_lidar,0,20);// limpia la trama

}