sbit led1 at LATB6_bit;
sbit led2 at LATB7_bit;

sbit pul1 at RB0_bit;
sbit pul2 at RB1_bit;

unsigned int codigo;


//variables de la trama
float voltaje,temperatura;
unsigned int led1_O,led2_O;   // en sprintf solo se usan int o float


// variables serial
unsigned char trama_tx[40];
unsigned char trama_rx[40];
unsigned char captura_rx[40];

unsigned char datorx,flag_rx;
unsigned char puntero_rx=0;
// maquina de estados
enum estados_rep {CAP_1I,CAP_N,CAP_2I,fin}; // caturando INI            *
unsigned char estado_rx=CAP_1I;

void procesarx()
{
unsigned int dato_procesado;
        
        strcpy(captura_rx, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(captura_rx, strtok(0, "/"));  //captura hasta el /  el primer dato
        //pasa la cadena a  numero
        dato_procesado=atoi(captura_rx);   //captura el primer dato

      //escala la salida de 0 a 255 de pwm   // depende del rango dato en pwm en excel
        dato_procesado=dato_procesado*255/100;

        PWM1_set_duty(dato_procesado);// aplica la velocidad al pwm1


        strcpy(captura_rx, strtok(0, "/"));  //captura el 2 dato
        //pasa la cadena a  numero
       dato_procesado=atoi(captura_rx);   //captura el segundo dato
      //escala la salida de 0 a 255 de pwm   // depende del rango dato en pwm en excel
        dato_procesado=dato_procesado*255/100;
        PWM2_set_duty(dato_procesado);// aplica la velocidad al pwm3

        strcpy(captura_rx, strtok(0, "/"));  //captura el 3  dato
        //pasa la cadena a  numero
       dato_procesado=atoi(captura_rx);   //captura el segundo dato
      led1=dato_procesado; // entrega al led1

      strcpy(captura_rx, strtok(0, "/"));  //captura el 4 dato
        //pasa la cadena a  numero
       dato_procesado=atoi(captura_rx);   //captura el segundo dato
      led2=dato_procesado; // entrega al led2


    }


void interrupcion() iv 0x0008 ics ICS_AUTO
 
 {

  if (RCIF_bit==1)
    {

             datorx=RCREG;  //lee el dato


       switch (estado_rx)
       {
           case CAP_1I:
               if (datorx=='I')
               {
                   trama_rx[puntero_rx]=datorx; //lo almacena en la trama
                   puntero_rx++; //incrementa el contador de trama
                   estado_rx=CAP_N;//configura siguiente estado

               }
                 break;

            case CAP_N:
              if (datorx=='N')
               {
                   trama_rx[puntero_rx]=datorx; //lo almacena en la trama
                   puntero_rx++; //incrementa el contador de trama
                   estado_rx=CAP_2I;
               }
              else
              {
                   estado_rx=CAP_1I; // vuelve al primer estado
                   puntero_rx=0; //resetea el puntero al inicio del buffer
              }

               break;

           case CAP_2I:

              if (datorx=='I')
               {
                   trama_rx[puntero_rx]=datorx; //lo almacena en la trama
                   puntero_rx++; //incrementa el contador de trama
                   estado_rx=fin;
               }
              else
              {
                   estado_rx=CAP_1I; // vuelve al primer estado
                   puntero_rx=0; //resetea el puntero al inicio del buffer
              }

               break;

           case fin:
           {
                  trama_rx[puntero_rx]=datorx; //lo almacena en la trama
                   puntero_rx++; //incrementa el contador de trama
                     if (puntero_rx>=40) // si supera tamaño del buffer
                     {
                         puntero_rx=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
                          estado_rx=CAP_1I;// retorna al estado de origen

                     }

                     if (datorx=='*')  //Si llega el fin de la trama
                    {

                      RCIE_bit=0; //deshabilita la interrucion
                      estado_rx=CAP_1I;// retorna al estado de origen
                      flag_rx=1;  //activa la bandera de que hat una trama valida

                    }

           }
           break;


       }// fin del switch


       // si hay errores en el buffer
        if (OERR_bit==1)
        {
            CREN_bit=0;
            CREN_bit=1;
        }


    RCIF_bit=0;

    }



 
 }


void main() 

{

ADC_Init();

ADCON1=0b1101;    // analogo ra0 y ra1

// todo salida
TRISA=0;
TRISB=0;
TRISC=0;

// entradas analogas
TRISA0_bit=1;
TRISA1_bit=1;


// entrada suiche
TRISB0_bit=1;
TRISB1_bit=1;



//entrada rx
TRISC7_bit=1;

  UART1_Init(9600);
  // inica pwm
  PWM1_Init(260);
  PWM1_Init(260);
  PWM1_Set_Duty(0);
  PWM2_Set_Duty(0);
  PWM1_Start();
  PWM2_Start();
  
  // CONFIG DE INTERRUPCION
 INTCON=0B01000000;

 RCIF_bit=0;
 RCIE_bit=1; //habi intt serial

 RCEN_bit=0;// limpia errores en el buffer de recepcion
 RCEN_bit=1;  // habilita interrpcion continua

 GIE_bit=1;// Autoriza las interurpciones


   while(1)
   {
    codigo=ADC_Get_Sample(0);
   temperatura=codigo*500.0/1023.0;
   Delay_us(100);

   codigo=ADC_Get_Sample(1);
   voltaje=codigo*5.0/1023.0;
   Delay_us(100);


   if (pul1==0) led1_O=1; else led1_O=0;
   if (pul2==0) led2_O=1; else led2_O=0;


   // arma la trama
   sprintf(trama_tx,"/%5.1f/%3.1f/%1u/%1u/",temperatura,voltaje,led1_O,led2_O);
   UART1_Write_Text(trama_tx);
   
       if (flag_rx==1) // si hay dato para procesar
               {
               procesarx();  // llama al procedimiento de procesar la trama
               puntero_rx=0; //inicializa el conteo
              memset(trama_rx,0,40); //limpia la trama
               flag_rx=0;
               RCIF_bit=0;    //limpia la bandera de la interrpcion
               CREN_bit=0;  // limpia errores
               CREN_bit=1;   // habilita la recepcion continua

               RCIE_bit=1;   //habilita la Interrpcion serial

            }


   
   
    Delay_ms(100);
   
   
   }


}