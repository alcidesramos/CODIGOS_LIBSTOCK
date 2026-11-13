#include "TimerOne.h"

#define sbi(x, y) x |= _BV(y)    // set bit
#define cbi(x, y) x &= ~(_BV(y)) // clear bit
#define tbi(x, y) x ^= _BV(y)    // toggle bit
#define is_high(x, y) ((x & _BV(y)) == _BV(y))


//paso simple
//char codigo1[]={0b0001,0b0010,0b0100,0b1000};
//char codigo2[]={0b0001,0b0010,0b0100,0b1000};


//paso doble
char codigo1[]={0b1100,0b0110,0b0011,0b1001};
char codigo2[]={0b1100,0b0110,0b0011,0b1001};

//medio paso
//char codigo1[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};
//char codigo2[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};




const char n_pasos_m=4; //colocar numero de secuencias del motor

//pines del motor1
#define m11 13
#define m12 12
#define m13 11
#define m14 10

//pines del motor 2
#define m21 7
#define m22 6
#define m23 5
#define m24 4


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


#define derecha 1
#define izquierda 2
#define quieto 3
//modo de giro de los motores
#define continuo 1
#define pasos 2

unsigned char estado_giro1=quieto,estado_giro2=quieto;
unsigned char estado_modo1=continuo,estado_modo2=continuo;



//variables recepcion serial
//variables para capturar la trama
char trama_rx[30];
char procesa[30];
unsigned char dato;

//variables nuevas
unsigned char datorx;
unsigned char puntero=0;
unsigned char flag_rx=0;

void saca_secuencia1()
{
  pasos1++;
 if (is_high(codigo1[secuencia1], 0)) digitalWrite(m11,1); else digitalWrite(m11,0);
 if (is_high(codigo1[secuencia1], 1)) digitalWrite(m12,1); else digitalWrite(m12,0);
 if (is_high(codigo1[secuencia1], 2)) digitalWrite(m13,1); else digitalWrite(m13,0);
 if (is_high(codigo1[secuencia1], 3)) digitalWrite(m14,1); else digitalWrite(m14,0);
  
}


void saca_secuencia2()
{
  pasos2++;
 if (is_high(codigo2[secuencia2], 0)) digitalWrite(m21,1); else digitalWrite(m21,0);
 if (is_high(codigo2[secuencia2], 1)) digitalWrite(m22,1); else digitalWrite(m22,0);
 if (is_high(codigo2[secuencia2], 2)) digitalWrite(m23,1); else digitalWrite(m23,0);
 if (is_high(codigo2[secuencia2], 3)) digitalWrite(m24,1); else digitalWrite(m24,0);
 
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

 void serialEvent()
  {
       while (Serial.available())
       {
       
     datorx= (char)Serial.read();
     trama_rx[puntero]=datorx;
     puntero++;
              if (puntero>=30) 
              {
               puntero=0;
              }
              if (datorx== '*') 
              {
              flag_rx=1;
              }
       }
 
  
  
  }


void interrupcion_timer()
{
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
 
  
 }

 
void setup() 
{
  // put your setup code here, to run once:
  pinMode(m11,OUTPUT);
  pinMode(m12,OUTPUT);
  pinMode(m13,OUTPUT);
  pinMode(m14,OUTPUT);
  pinMode(m21,OUTPUT);
  pinMode(m22,OUTPUT);
  pinMode(m23,OUTPUT);
  pinMode(m24,OUTPUT);

  pinMode(2,OUTPUT);//salida el led
  
  Serial.begin(9600);
  Serial.println("Iniciando");

estado_giro1=derecha;
 estado_giro2=derecha;
 estado_modo1=continuo;
  estado_modo2=continuo;
  velo_m1=180;
   velo_m2=180;

  
  // put your setup code here, to run once:
  Timer1.initialize(10000); // que se interrumpa cada 10.000 microsegundos osea 10ms
  Timer1.attachInterrupt( interrupcion_timer ); // attach the service routine here
digitalWrite(2,0);//apaga led

}

void loop() 
{
  // put your main code here, to run repeatedly:

  if (flag_rx==1)

      {      
        procesarx();        
        flag_rx=0;// borra la bandera
        puntero=0;  //reseta contador de datos
        memset(trama_rx,0,30);  // borra el vector de datos recibicos en la trama
        
       } 
  //pone a titilar el led
        tbi(PORTD, 2);
        delay(500);

}
