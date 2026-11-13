//paso simple
//char codigo1[]={0b0001,0b0010,0b0100,0b1000};
//char codigo2[]={0b0001,0b0010,0b0100,0b1000};


//paso doble
//char codigo1[]={0b1100,0b0110,0b0011,0b1001};
//char codigo2[]={0b1100,0b0110,0b0011,0b1001};

//medio paso
char codigo1[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};
char codigo2[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};




const n_pasos_m=8; //colocar numero de secuencias del motor



//acumulan la posicion de la secuencia
signed char secuencia1=0;
signed char secuencia2=0;

//variables del dentido de giro d elos motores
char giro_m1,giro_m2;
//variable de la velocidad d elos motores de 0 -255
char velo_m1=0,velo_m2=0;
//variable almacena nuemro pasos a dar en modo pasos
unsigned long  n_pasos1,n_pasos2;
//contador de numeros de pasos dado por los motores
unsigned long  pasos1=0,pasos2=0;
//variable para retardo  extra dentro de la interrupcion
char velo1=0,velo2=0;

const char n_pasos=n_pasos_m-1;//como ararnca en cero resta uno para no hacer operacones en la interrpcion



//pines de conexion de los motores
sbit m11 at LATA.b0;
sbit m12 at LATA.b1;
sbit m13 at LATA.b2;
sbit m14 at LATA.b4;

sbit m21 at LATC.b0;
sbit m22 at LATC.b1;
sbit m23 at LATC.b2;
sbit m24 at LATC.b3;


#define derecha 1
#define izquierda 2
#define quieto 3
//modo de giro de los motores
#define continuo 1
#define pasos 2

char estado_giro1=quieto,estado_giro2=quieto;
char estado_modo1=continuo,estado_modo2=continuo;



//variables recepcion serial
//variables para capturar la trama
char trama_rx[30];
char procesa[30];
char dato;

//variables nuevas
char datorx;
char puntero=0;
char flag_rx=0;



void saca_secuencia1()
{
  pasos1++;
  m11=codigo1[secuencia1].b0;
  m12=codigo1[secuencia1].b1;
  m13=codigo1[secuencia1].b2;
  m14=codigo1[secuencia1].b3;
}


void saca_secuencia2()
{
  pasos2++;
  m21=codigo2[secuencia2].b0;
  m22=codigo2[secuencia2].b1;
  m23=codigo2[secuencia2].b2;
  m24=codigo2[secuencia2].b3;
}


  void izquierda1()
 {
  secuencia1++;
  if (secuencia1>n_pasos) secuencia1=0;
  saca_secuencia1();
 }

void derecha1()
 {
  secuencia1--;
  if (secuencia1<0) secuencia1=n_pasos;
  saca_secuencia1();
 }

void izquierda2()
 {
  secuencia2++;
  if (secuencia2>n_pasos) secuencia2=0;
  saca_secuencia2();
 }

void derecha2()
 {
  secuencia2--;
  if (secuencia2<0) secuencia2=n_pasos;
  saca_secuencia2();
 }
 
 void procesarx()
{
//UART1_Write_Text(trama_rx);
if (strstr(trama_rx,"m1der*"))     estado_giro1=derecha;
else if (strstr(trama_rx,"m1izq*")) estado_giro1=izquierda;
else if (strstr(trama_rx,"m1stop*"))   estado_giro1=quieto;
else if (strstr(trama_rx,"m2der*"))  estado_giro2=derecha;
else if (strstr(trama_rx,"m2izq*")) estado_giro2=izquierda;
else if (strstr(trama_rx,"m2stop*"))   estado_giro2=quieto;

 else if (strstr(trama_rx,"vel1"))
    {
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);
        estado_modo1=continuo;
         velo_m1=dato;// carga el dato a la velocidad del motor

    }

 else if (strstr(trama_rx,"vel2"))
    {
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);
        estado_modo2=continuo;
         velo_m2=dato;// carga el dato a la velocidad del motor

    }


 else if (strstr(trama_rx,"pap1"))
    {
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);

         pasos1=0; //limpia el contador de pasos
        estado_modo1=pasos;  //pasa a modo pasos
        n_pasos1=dato;// carga numero de pasos a dar del motor1
    }

 else if (strstr(trama_rx,"pap2"))
    {
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);

         pasos2=0; //limpia el contador de pasos
        estado_modo2=pasos;  //pasa a modo pasos
        n_pasos2=dato;// carga numero de pasos a dar del motor2
    }

    memset(trama_rx,0,30);
}



void interrupcion() iv 0x0004 ics ICS_AUTO 
{
   if (T0IF_bit==1)
   {
     T0IE_bit=0; //deshabilito interrupcion del timer cero
      velo1++;
      velo2++;
   
    //analiza si le toca dar un paso al motor1
        if (velo1>=256-velo_m1)// para que la menor sea mas lenta
        {
            velo1=0;
            if (estado_modo1==pasos)  //si esta en modo de pasos
               {
                 if (pasos1>=n_pasos1)
                 {
                   estado_giro1=quieto;//deja quieto al motor
                   pasos1=0;    //reinicia numero de pasos
                 }
               }
              //analiza el sesntido de giro del motor
             switch (estado_giro1)
             {
               case derecha: derecha1(); break;
               case izquierda:izquierda1();break;

             }//fin del switch del sentido de giro

        }//fin de analisis del motor 1

         //analiza si le toca dar un paso al motor2
        if (velo2>=256-velo_m2)// para que la menor sea mas lenta
        {
            velo2=0;
            if (estado_modo2==pasos)  //si esta en modo de pasos
               {
                 if (pasos2>=n_pasos2)
                 {
                   estado_giro2=quieto;//deja quieto al motor
                   pasos2=0;    //reinicia nuemro de pasos
                 }
               }
              //analiza el sesntido de giro del motor
             switch (estado_giro2)
             {
               case derecha: derecha2(); break;
               case izquierda:izquierda2();break;

             }//fin del switch del sentido de giro

        }//fin de analisis del motor 2


   
   
   
   
     TMR0=0;
     T0IF_bit=0;
     T0IE_bit=1; //habilita interrpion timer cero
   }
   
   if (RCIF_bit==1)
    {
       datorx=RCREG;  //lee el dato
       trama_rx[puntero]=datorx; //lo almacena en la trama
       puntero++; //incrementa el contador de trama
       if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
       if (datorx=='*')  //Si llega el fin de la trama
       {
         RCIE_bit=0; //deshabilita la interrucion
         flag_rx=1;  //activa la bandera de que hat una trama valida

       }
       //limpia errores
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
//oscilador  Puesto en la palabra de configuracion
SCS1_bit=0;
SCS0_bit=0;


//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;


SPLLEN_bit=1; //prende el PLL por 4   trabaja a 32

while (PLLR_bit==0);   //espera estabilidad del PLL

//todo digital
ANSELA=0;
ANSELC=0;

//TODO SALIDA
TRISA=0;
TRISC=0;

TRISC5_bit=1; //entrada rx

UART1_Init(9600);
UART1_Write_Text("INICIANDO");

RXDTSEL_bit=0; // RX en RC5  sino RA1
TXCKSEL_bit=0; // tX en RC4  sino RA0


INTCON=0b01000000; //interrpcion de perifericos habiitada
//configura el timer cero para cada 5ms
 OPTION_REG=0; //prescalador asociado a timer0
//timer cero preescalador a 256 8ms a 32mhz
PS2_bit=1;
PS1_bit=1;
PS0_bit=1;

TMR0=0;
  T0IF_bit=0;//limpia la bandera
 T0IE_bit=1;//habilita interrUpcion del timer


 estado_giro1=derecha;
 estado_giro2=derecha;
 estado_modo1=continuo;
  estado_modo2=continuo;
  velo_m1=180;
   velo_m2=180;


//configuracion serial
RCIF_bit=0;
RCIE_bit=1;//habiita interrpcion serial
CREN_bit=1;//borra errores



  GIE_bit=1; //habilito interrpciones globales
  while (1)
  {
  
    if (flag_rx==1)
   {

   procesarx();  // llama al procedimiento de procesar la trama
   puntero=0; //inicializa el conteo
   memset(trama_rx,0,30); //limpia la trama
   flag_rx=0;
   RCIF_bit=0;    //limpia la bandera de la interrpcion
   RCIE_bit=1;   //habilita la Interrpcion serial
   }

     LATA5_bit=~LATA5_bit;
     Delay_ms(500);
  
  
/*estado_giro2=derecha;
     estado_modo2=continuo;
     velo_m2=220;
      Delay_ms(3000);


     estado_giro1=derecha;
     estado_modo1=continuo;
     velo_m1=220;
      Delay_ms(3000);


    estado_giro1=izquierda;
     estado_modo1=continuo;
     velo_m1=220;
      Delay_ms(3000);

     estado_giro1=derecha;
     estado_modo1=continuo;
     velo_m1=150;
      Delay_ms(3000);

     estado_giro1=izquierda;
     pasos1=0; //limpia el contador de pasos
     estado_modo1=pasos;
     velo_m1=100;
      n_pasos1=5;
      Delay_ms(6000);*/

  
  
  }






}