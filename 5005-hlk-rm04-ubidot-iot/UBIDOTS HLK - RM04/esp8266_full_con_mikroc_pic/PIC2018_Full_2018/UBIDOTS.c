sbit suiche at RB0_bit; //ubicacion del pulsador
sbit led_out at LATB7_bit; //ubicacion del led


unsigned int codigo;
float temperatura;

char trama[150];
char trama_largo[20];
char captu[30];


char led;
int var_largo; //LARGO DE LA TRAMA

//   lo que se va a capturar se toma desde lue=   value": 0.0}
//estados de la recepcion de variables
enum estados_  {cap_l,cap_u,cap_e,cap_co,esp_final} ;
//estado inicial
 char estado_rec=cap_l;

//   lo que se va a capturar se toma desde lue=   value": 0.0}
float valor_rx;  //captura valor de lavariables
char trama_rx[50];
char contador_trama=0;
unsigned long demora=0; //usado para alir de la lectura de datos


char lee_trama()   //funcio que retorna 1 si hay dato sino 0
{
char dato_rx;
//limpa todas las variables
memset(trama_rx,50,0);
demora=0;
contador_trama=0;
estado_rec=cap_l;
//borra errores de recepcion
RCIF_bit=0;
CREN_bit=0; //
CREN_bit=1; //

while (demora<=66667)
{
   demora++;
   switch (estado_rec)
   {
   case cap_l:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='l') contador_trama=0;    //no fue el dato que me interesa
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_u; //pasa al estado de capturar la u
               }
              RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;
       case cap_u:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='u')
               {
               contador_trama=0;
               estado_rec=cap_l; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                 estado_rec=cap_e; //pasa al estado de capturar la u
               }
                RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;

   case cap_e:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='e')
               {
               contador_trama=0;
               estado_rec=cap_l; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_co; //pasa al estado de capturar la u
               }
              RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;


   case cap_co:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='\"')
               {
               contador_trama=0;
               estado_rec=cap_l; //regresa al estado inical

               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=esp_final; //pasa al estado de capturar la u
               }
               RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }

             break;

   case esp_final:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               contador_trama++;
               if (dato_rx=='}')   return(1); //sale del procedimiento
             RCIF_bit=0; //limpia la bandera de recepcion
             }
             break;

             
       }//fin del switch
       
   }//fin del while demora
   return(0);
   
}


//funcion para detectar el largo de una cadena tipo constante
unsigned long strlen_const(const char *const_pun)
{
 unsigned int cuen_const=0;

 while (*const_pun++!=0) cuen_const++;
 return (cuen_const);

}

void manda_serial_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

void DAC_Initialize(void)
{
    // DACOE enabled; DACEN enabled; DACLPS neg_ref; DACNSS VSS; DACPSS VDD;
    VREFCON1 = 0xA0;
    // DACR 0;
    VREFCON2 = 0x00;
}

void DAC_SetOutput(char inputData)
{
    VREFCON2  = inputData;
}


void main() 
{
//todo digital;

   ANSELA=0;
   ANSELB=0;
    ANSELC=0;
    ANSELA.b0=1; //an0 analogo

  trisa.b0=1; //entrada del pin analogo
  trisb.b0=1; //entrada pulsador
  TRISB.b7=0; //salida del led

  TRISC6_bit=0; //Salida Tx
 TRISC7_bit=1; //Entrada rx

 UART1_Init(115200);      //VELOCIDA BAUDIOS
   DAC_Initialize();
     while (1)
     {
     //lee la temperatura
     codigo=ADC_Read(0);
     temperatura=codigo*500.0/1023.0;

      if (suiche==0) led='0'; else led='1';
      //limpia las tramas
     memset(trama_largo,20,0);
      memset(trama,150,0);
      
      //armamos trama de variables
     sprintf(trama,"{\"temperatura\": %5.2f ,\"led\": %c}\n",temperatura,led);
    //calcula largo de la trama de variables
     var_largo=strlen(trama)-1;
    //la pasa a cadena y agrega dos fin de linea
     sprinti(trama_largo,"%u\n\n",var_largo);
     
//envio de datos a ubidots
      //el device en este caso en micasa
      // y el token     A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf
      //colocar los de su interfaz
     manda_serial_const("POST /api/v1.6/devices/clase/?token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
      //manda el largo de la trama
     UART1_Write_Text(trama_largo);

    //manda la info con las variables
     UART1_Write_Text(trama);
    Delay_ms(2000);

      //pregunta por variables deseada
       manda_serial_const("GET /api/v1.6/devices/clase/suiche/values?page_size=1&token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\n\n");
        //lee la respuesta
      lee_trama();
      //captura el valor de la variables        value": 0.0}
        strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
        strcpy(captu, strtok(0, "}"));  //captura hasta el /
        //pasa la cadena a  numero
        valor_rx=atof(captu);
        if (valor_rx==1.0) led_out=1; else led_out=0;  //plica la salida al led

        //pregunta por variables deseada
       manda_serial_const("GET /api/v1.6/devices/clase/voltaje/values?page_size=1&token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\n\n");
        //lee la respuesta
      lee_trama();
      //captura el valor de la variables        value": 0.0}
        strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
        strcpy(captu, strtok(0, "}"));  //captura hasta el /
        //pasa la cadena a  numero
        valor_rx=atof(captu);
        //para sacr datos dl dac
         DAC_SetOutput(valor_rx*31.0/5.0) ;



     
     
     
     }

}