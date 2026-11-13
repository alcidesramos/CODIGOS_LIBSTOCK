
//variables de URX1
char rx1_dat;
//maina de estado de recepcion
                      //I    N       I     *
enum trama_rx_es {inicio1,inicio2,inicio3,fin1};
unsigned char recibidos_estado1=inicio1;
unsigned char dato1_in,puntero_rx1=0;

//Vector de datos a recibir
unsigned char Trama_rx1[50];
char flag_rx1=0;
const char max_datos=50;



void config_uart1_trama(unsigned int baudios)
{
   UART1_Init(baudios);
  //Prioridad de la intrrupcion.
   U1RXIP_2_bit=1;
   U1RXIP_1_bit=1;
   U1RXIP_0_bit=0;

       // la interrupcion se da cada bit
   u1sta.b7=0;
   u1sta.b6=0;
   //limpia buffer
    U1STA.b1=0;
    U1rXIF_bit=0;
 
  rx1_dat=U1RXREG;
  rx1_dat=U1RXREG;
  rx1_dat=U1RXREG;
  rx1_dat=U1RXREG;
   U1RXIF_bit=0;//limpia bandera
   U1RXIE_bit=1; //habilita interrupcion

}

 void INT_TRAMA_RX1() org IVT_ADDR_U1RXINTERRUPT
{
dato1_in=U1RXREG;

     switch (recibidos_estado1)
   {
      case inicio1:
        {
            if (dato1_in!='I') puntero_rx1=0;
            else
            {
            Trama_rx1[puntero_rx1]=dato1_in;
              puntero_rx1++;
             recibidos_estado1=inicio2;
            } //if
        }//case inicio1
        break;
       case inicio2:
        {
              if (dato1_in!='N')
               { puntero_rx1=0;
                recibidos_estado1=inicio1;
               }
            else
            {
             Trama_rx1[puntero_rx1]=dato1_in;
              puntero_rx1++;
             recibidos_estado1=inicio3;
            } //if
        }//case inico2
        break;

       case inicio3:
        {
              if (dato1_in!='I')
               {
                puntero_rx1=0;
                recibidos_estado1=inicio1;
               }
            else
            {
              Trama_rx1[puntero_rx1]=dato1_in;
              puntero_rx1++;
             recibidos_estado1=fin1;

            } //if
        }//case incio3
        break;


         case fin1:
        {
             Trama_rx1[puntero_rx1]=dato1_in;
              puntero_rx1++;
                  if (dato1_in=='*')
                  {       

                           recibidos_estado1=0;
                           puntero_rx1=0;
                           flag_rx1=1;  ///habilita la bandera para decir que tiene una trama completa
                             rx1_dat=U1RXREG;
                            rx1_dat=U1RXREG;
                            rx1_dat=U1RXREG;
                            rx1_dat=U1RXREG;
                            U1STAbits.OERR=0; //LIMPIA BUFFER
                            U1RXIF_bit=0;
                            U1RXIE_bit=0;

                  }
                 else if (puntero_rx1>max_datos)
                    {
                           puntero_rx1=0;
                            recibidos_estado1=0;
                           puntero_rx1=0;
                            flag_rx1=0;

                    }

        }//case fin1
        break;


   }// case recibidos_

  U1RXIF_bit=0;

}