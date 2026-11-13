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

void config_serial()
{
  //configuracion serial
  UART1_Init(9600);
  RCIF_bit=0;
  RCIE_bit=1;
  //borra errores de recpcion
  CREN_bit=0;
  CREN_bit=1;

}


void interrupcion_serial()
{
     if (RCIF_bit==1)
     {
     
     dato1_in=RCREG; // lee el dato serial

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
                           RCIF_bit=0;
                           RCIE_bit=0;// deshabilita la interpcion
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


     RCIF_bit=0;//limpia bandera
     }


}