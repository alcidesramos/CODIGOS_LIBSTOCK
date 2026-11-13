#include "esp8266.h"

extern sfr sbit led1;
extern sfr sbit led2;

char trama_cont=0;
unsigned  char dato_rx;

char captu1[30];// para procesar lo capturado por ubidots

//maquina de estado recepcion serial   +ipd,socket,largo:datos
enum estados_  {normal,cap_i,cap_p,cap_d,cap_co,cap_co2,cap_largo,esp_final} ;
//estado inicial
 char estado_rec=normal;

extern unsigned int tamano;    //  usada para saber cuentos registro analogos se quieren leeer
unsigned char rec_largo[4];
unsigned char rec_socket[1];
unsigned char *rec_punte;
unsigned char *buff_punte;
unsigned int  rec_son;
unsigned char flag_modbus=0;


int atoi_(char* cadena)
{
    int respuesta = 0;
    int i;

    for (i = 0; cadena[i] != '\0'; ++i)
    respuesta = respuesta * 10 + cadena[i] - '0';
    return respuesta;
}

void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}


char tiempo(unsigned int milis, char cap[30], char cap1[30])
{
unsigned int cont1;
estado_rec=normal;
 trama_cont=0;
  memset(modbus_rx,0,50);// LIMPIA LA TRAMA
  RCIF_bit=0;
  //BORRA ERRORES DE RECEPCION
  CREN_bit=0;
  CREN_bit=1;
   RCIE_bit=1; // habilita la recepcoón
 Delay_ms(50);
 //  Delay_ms(1);

    for (cont1=1;cont1<=milis;cont1++)
     {
    delay_Ms(1);

          if (strstr(modbus_rx,cap))
          {
           RCIE_bit=0; // deshabilita la interrpcion
           Delay_ms(10);
           return(1);
          }
          else  if (strstr(modbus_rx,cap1) )
          {
         RCIE_bit=0; // deshabilita la interrpcion
          Delay_ms(10);
          return(2);
          }
    }

  RCIE_bit=0; // deshabilita la interrpcion
  return(0);
}

 //interrupcion del esp_8266
void esp82666_interrupcion()
{
      // si es interrpcion serial
   if (RCIF_bit==1)
   {            dato_rx=RCREG; // lee el dato

    switch (estado_rec)
       {
       case normal:
                modbus_rx[trama_cont]=dato_rx;  // almacena el dato
                    trama_cont++;
                    if (trama_cont>=50) trama_cont=0;
                   break;
                 //ipd,4,13:6       va a capturar la i
       case cap_i:
            //    modbus_rx[trama_cont]=dato_rx;
               if (dato_rx!='I') trama_cont=0;    //no fue el dato que me interesa
               else
               {
              //   trama_cont++;//incrementa contador para proximo dato
                  estado_rec=cap_p; //pasa al estado de capturar la p
               }

       case cap_p:

              //  modbus_rx[trama_cont]=dato_rx;
               if (dato_rx!='P')
               {
                trama_cont=0;
               estado_rec=cap_i; //regresa al estado inical

               }
               else
               {
                //  trama_cont++;//incrementa contador para proximo dato
                  estado_rec=cap_d; //pasa al estado de capturar la d
               }

                 break ;
       
       
       case cap_d:
             //   modbus_rx[trama_cont]=dato_rx;
               if (dato_rx!='D')
               {
                trama_cont=0;
               estado_rec=cap_i; //regresa al estado inical

               }
               else
               {
               //   trama_cont++;//incrementa contador para proximo dato
                  estado_rec=cap_co; //pasa al estado de capturar la coma
               }

                 break ;

           case cap_co:
               // modbus_rx[trama_cont]=dato_rx;
               if (dato_rx!=',')
               {
                trama_cont=0;
               estado_rec=cap_i; //regresa al estado inical

               }
               else
               {
                 // trama_cont++;//incrementa contador para proximo dato
                // rec_socket[0]=0;
                // rec_socket[1]=0;
                 // rec_punte=&rec_socket;
                   trama_cont=0;
                    estado_rec=cap_co2; //pasa al estado de capturar la coma

               }

                 break ;
                 
                 
           case cap_co2:


               if (dato_rx==',')
               {
              estado_rec=cap_largo; //pasa al estado de capturar el largo
              trama_cont=0;
               }
               else
               {
                  trama_cont++;
                      if (trama_cont>50)
                      { trama_cont=0;
                      estado_rec=cap_i; //regresa al estado inical
                       }
               }

                 break ;

           case cap_largo:

               if (dato_rx==':')
               {
              trama_cont=0;
             rec_son=13;//8+tamano*2;
              estado_rec=esp_final; //pasa al estado de capturar el largo
               }
               else
               {
                modbus_rx[trama_cont]=dato_rx;
                  trama_cont++;
                    if (trama_cont>50)
                    { trama_cont=0;
                    estado_rec=cap_i; //regresa al estado inical
                    }
              }
               break ;
                 
                 
     case esp_final:
              led1=!led1;
                 modbus_rx[trama_cont]=dato_rx;
                 trama_cont++;
                     if (trama_cont>=rec_son)
                     // if (trama_cont>=9)

                    { 
                    trama_cont=0;
                    estado_rec=normal; //regresa al estado inical
                    flag_modbus=1;
                    led2=1;
                    RCIE_bit=0;

                    }
                    break;


        }//fin del switch

               
                RCIF_bit=0;


   }//fin del if

   }
   
char manda_AT_COMANDO(char *coman, char cap[30], char cap1[30],unsigned int retardo)
{

  Uart1_write_text(coman);//manda el comando
  Uart1_write_text_const("\r\n"); // manda final de linea
  return (tiempo(retardo,cap,cap1));
  }

//funcion para detectar el largo de una cadena tipo constante
unsigned long strlen_const(const char *const_pun)
{
 unsigned int cuen_const=0;

 while (*const_pun++!=0) cuen_const++;
 return (cuen_const);

}
 void manda_esp8266_const(const char *info)
{
unsigned int largo;
        Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
         UART1_Write('4');    //manda el socket  el cual se conecto
         UART1_Write(',');
         largo=strlen_const(info);  //calcula el largo de la cadena a enviar
        sprinti(captu1,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
        UART1_Write_Text(captu1); //envia el largo d ela trama
        Uart1_write_text_const("\r\n");
        Delay_ms(50); //retardo antes de enviar la trama   para que muestre el >
        Uart1_write_text_const(info);     //manda envia solo constantes
       Delay_ms(100); //retardo para que confirme que se envio

}


void manda_esp8266(char *info)
{
unsigned int largo;
        Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
         UART1_Write('4');    //manda el socket  el cual se conecto
         UART1_Write(',');
         largo=strlen(info);  //calcula el largo de la cadena a enviar
        sprinti(captu1,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
        UART1_Write_Text(captu1); //envia el largo d ela trama
        Uart1_write_text_const("\r\n"); // estos son los dos que se adicionaron
        Delay_ms(50); //retardo para que muestre >
        UART1_Write_Text(info);     //manda envia solo constantes
       Delay_ms(100); //retardo para que confirme ele envio

}


void manda_esp8266_bytes(unsigned char *info,unsigned int largo)
{
 unsigned char cuenta;

        Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
         UART1_Write('4');    //manda el socket  el cual se conecto
         UART1_Write(',');
        sprinti(captu1,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
        UART1_Write_Text(captu1); //envia el largo de la trama
        Uart1_write_text_const("\r\n"); // estos son los dos que se adicionaron
      Delay_ms(50); //retardo antes de enviar apra que muestre >
        for (cuenta=0;cuenta<largo;cuenta++) UART1_Write(*info++);  // manda los bytes deseados
     Delay_ms(50); //retardo para que prdcesa la info,  vuelve lento el sistema

}



// analiza si se conectoa ubidots
 unsigned char conecta(char *ip_dir)
{
unsigned char tempo;
memset(modbus_tx,0,50);
sprintf(modbus_tx,"AT+CIPSTART=4,\"TCP\",\"%s\",502",ip_dir);

     manda_AT_COMANDO("AT+CIPMUX=1\r\n","OK","OK",500);
    Delay_ms(300);
 tempo=manda_AT_COMANDO(modbus_tx, "OK", "CONNECT", 10000);
 Delay_ms(2000);
 if ((tempo==1) ||(tempo==2)) return(1);
     manda_AT_COMANDO("AT+CIPMUX=1\r\n","OK","OK",500);
    Delay_ms(300);
 tempo=manda_AT_COMANDO(modbus_tx, "OK", "Linked", 10000);
 Delay_ms(2000);

 if ((tempo==1) ||(tempo==2)) return(1);
 else return(0);


}




