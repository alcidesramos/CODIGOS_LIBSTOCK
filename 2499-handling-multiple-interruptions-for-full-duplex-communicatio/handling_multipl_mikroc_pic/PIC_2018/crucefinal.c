sbit led at LATC0_bit;
sbit suiche at RB1_bit;

sbit pulso at LATC1_bit;

float calculo;//toma el porcentaje y lo pasa a pasos para el timer
char dispara;//almacena porcentaje
unsigned int codigo;
float temperatura;

char trama_tx[100];
//variables para capturar la trama
char trama_rx[30];
char procesa[30];
char dato;

//variables interrpcion serial
char datorx;
char puntero=0;
char flag_rx=0;

void procesarx()
{
if (strstr(trama_rx,"led1="))
     {
     if (strstr(trama_rx,"on")) led=1;
    else led=0;
    }

  else if (strstr(trama_rx,"pul="))
    {
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dispara=atoi(procesa);

    }


}

void interrupcion() iv 0x0008 ics ICS_AUTO
{
      //analiza interrpcion por cruce por cero
    if (INT0IF_bit==1)
    {
         pulso=0;
        TMR0L=calculo;  //carga el tiempo a temporizar en el timer 0
       TMR0IF_bit=0;//limpia bandera timer 0
       TMR0IE_bit=1;// activa interrpcion de timer cero

    INT0IF_bit=0; //limpia la bandera
    }
    //analiza interpcion por recepcion serial
    if (RCIF_bit==1)
    {
       datorx=UART1_Read();  //lee el dato
       trama_rx[puntero]=datorx; //lo almacena en la trama
       puntero++; //incrementa el contador de trama
       if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
       if (datorx=='*')  //Si llega el fin de la trama
       {
         RCIE_bit=0; //deshabilita la interrucion
         flag_rx=1;  //activa la bandera de que hat una trama valida

       }
           //si hubo error desborde en la recepcion,lima el error
           if (OERR_bit==1)
           {
           RCEN_bit=0;
           RCEN_bit=1;
           }

    RCIF_bit=0;
    }
    
    //analiza inetrrpcion del timer para pulso de disparo

       if (TMR0IF_bit==1)
       {
        //aplica pulso de disparo
        pulso=1;
        //si se quiere no se espera 10 us y se deja encendido la señal
         Delay_us(10);
          pulso=0;
        TMR0IF_bit=0;  //Limpia la bandera del timer cero
         TMR0IE_bit=0;// deshabilita interrpcion de timer cero

       }


}



void main() 
{
ADCON1=0b1110; // an0 analogo


  trisa.b0=1; //entrada del pin analogo
  trisb.b0=1; //entrada cruce por cero
  trisb.b1=1; //entrada pulsador

  trisc.b0=0; //salida led
  trisc.b1=0; //salida pulso de disparo




  TRISC6_bit=0; //Salida Tx
 TRISC7_bit=1; //Entrada Tx

 UART1_Init(9600);

 //CONFIGURA LA INTERRUPCION SERIAL
 RCIF_bit=0;//LIMPIA LA BANDERA
 RCIE_bit=1;// HABILITA INTERRPCION SERAL


 //CONFIGURA INT POR FLANCO DE SUBIDA QUE DETECTA EL CRUCE POR CERO
INTCON=0B01000000;
INT0IF_bit=0;//LIMPIA BIT DE LA INTERRPCION
INTEDG0_bit=1; //inTERRPCION INT0 POR FALNCO DE SUBIDA
INT0IE_bit=1; //HABILITA LA INTERRUPCION POR CAMBIO DE FLCNO



 //configura el timer cero, maximo conteo= 10ms mas de los 8.33 de cada ciclo
  //ESTA PARRTE SOLO PARA PIC18F
 TMR0ON_bit=1; // Habilita timer el timer cero
 T08BIT_bit=1;  // trabaja el timer a 8 bits
 
 
 //ESTO SI PARA EL RESTO DE PIC
  T0IF_bit=0; //bandero en cero
  T0IE_bit=0; //aun no usa la interrpcion  del timer cero
  T0CS_bit=0;  //el timer incrementa con el ciclo del reloj
   PSA_bit=0; //el preescalador es asignado al timer 0

   //prescalador de 256  para 20 mhz  maximo retardo 13ms
   T0PS2_bit=1;
   T0PS1_bit=1;
   T0PS0_bit=1;


 GIE_bit = 1;         // Habilitar todas las interrupciones.
  led=0;
  
  
    while (1)
    
    {
    
       codigo=ADC_Read(0);
      temperatura=500.0*codigo/1023.0; //pasa hasta 100
           if (flag_rx==1)
           {

           procesarx();  // llama al procedimiento de procesar la trama
           puntero=0; //inicializa el conteo
           memset(trama_rx,0,30); //limpia la trama
           flag_rx=0;
           RCIF_bit=0;    //limpia la bandera de la interrpcion
           RCIE_bit=1;   //habilita la Interrpcion serial
           }


        if (dispara<=5)
       {

         INT0IE_bit=0;// DESHABILITA INTERRUPCION POR FLANCO
         pulso=0;//APAGA LA CARGA

       }
       else if (dispara>=90)
       {


         INT0IE_bit=0;// DESHABILITA INTERRUPCION POR FLANCO
         pulso=1;


       }
        else
     {

       calculo=-1.6266*dispara + 256.1;
         INT0IF_bit=0; //limpia la bandeta de  interrpcion
         INT0IE_bit=1;// HABILITA INTERRUPCION POR FLANCO

      }

    sprintf(trama_tx,"temp=%.2f/",temperatura);
     UART1_Write_Text(trama_tx);

    if (suiche==1) UART1_Write_Text("led=on/");
    else UART1_Write_Text("led=off/");

      Delay_ms(50);
    
    
    }


}