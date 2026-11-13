#include "mcc_generated_files/mcc.h"
#include	<ctype.h>
#include	<stdlib.h>
#include	<string.h>


//para poder acceder a nivel de bits
typedef union {
    unsigned char byte;
    struct {
        unsigned b0:1, b1:1, b2:1, b3:1, b4:1, b5:1, b6:1, b7:1;
    };
} char_;

//paso simple
//char_ codigo1[]={0b0001,0b0010,0b0100,0b1000};
//char_ codigo2[]={0b0001,0b0010,0b0100,0b1000};


//paso doble
char_ codigo1[]={0b1100,0b0110,0b0011,0b1001};
char_ codigo2[]={0b1100,0b0110,0b0011,0b1001};

//medio paso
//char_ codigo1[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};
//char_ codigo2[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};

const char n_pasos_m=4; //colocar numero de secuencias del motor

//acumulan la posicion de la secuencia
signed char secuencia1=0;
signed char secuencia2=0;

//variables del dentido de giro d elos motores
unsigned char giro_m1,giro_m2;
//variable de la velocidad d elos motores de 0 -255
unsigned  char velo_m1=0,velo_m2=0;
//variable almacena nuemro pasos a dar en modo pasos
unsigned long  n_pasos1,n_pasos2;
//contador de numeros de pasos dado por los motores
unsigned long  pasos1=0,pasos2=0;
//variable para retardo  extra dentro de la interrupcion
unsigned  char velo1=0,velo2=0;

const char n_pasos=n_pasos_m-1;//como ararnca en cero resta uno para no hacer operacones en la interrpcion



//pines de conexion de los motores
#define m11 LATA0
#define m12 LATA1
#define m13 LATA2
#define m14 LATA4

#define m21 LATC0
#define m22 LATC1
#define m23 LATC2
#define m24 LATC3


#define derecha 1
#define izquierda 2
#define quieto 3
//modo de giro de los motores
#define continuo 1
#define pasos 2

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


  void derecha1()
 {
  secuencia1++;
  if (secuencia1>n_pasos) secuencia1=0;
  saca_secuencia1();
 }

void izquierda1()
 {
  secuencia1--;
  if (secuencia1<0) secuencia1=n_pasos;
  saca_secuencia1();
 }

void derecha2()
 {
  secuencia2++;
  if (secuencia2>n_pasos) secuencia2=0;
  saca_secuencia2();
 }

void izquierda2()
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

 void mi_interrupcion()
 {
     if (T0IF==1)
   {
     T0IE=0; //deshabilito interrupcion del timer cero
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
     T0IF=0;
     T0IE=1; //habilita interrpion timer cero
   }
   
   if (RCIF==1)
    {
       datorx=RCREG;  //lee el dato
       trama_rx[puntero]=datorx; //lo almacena en la trama
       puntero++; //incrementa el contador de trama
       if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
       if (datorx=='*')  //Si llega el fin de la trama
       {
         RCIE=0; //deshabilita la interrucion
         flag_rx=1;  //activa la bandera de que hat una trama valida

       }
       //limpia errores
       if (OERR==1)
       {
       CREN=0;
       CREN=1;
       }
    RCIF=0;
   }

 
 
 
 }

/*
                         Main application
 */
void main(void)
{
    // initialize the device
    SYSTEM_Initialize();

    // When using interrupts, you need to set the Global and Peripheral Interrupt Enable bits
    // Use the following macros to:

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts
    INTERRUPT_PeripheralInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    
 estado_giro1=derecha;
 estado_giro2=derecha;
 estado_modo1=continuo;
  estado_modo2=continuo;
  velo_m1=180;
   velo_m2=180;


//configuracion serial
RCIF=0;
RCIE=1;//habiita interrpcion serial
CREN=1;//borra errores


    printf("INICIANDO");
    GIE=1; //habilita interrpciones globales
    while (1)
    {
        // Add your application code
       if (flag_rx==1)
   {

   procesarx();  // llama al procedimiento de procesar la trama
   puntero=0; //inicializa el conteo
   memset(trama_rx,0,30); //limpia la trama
   flag_rx=0;
   RCIF=0;    //limpia la bandera de la interrpcion
   RCIE=1;   //habilita la Interrpcion serial
   }

     LATA5=~LATA5;
     __delay_ms(500); 
        
        
    }
}
/**
 End of File
*/