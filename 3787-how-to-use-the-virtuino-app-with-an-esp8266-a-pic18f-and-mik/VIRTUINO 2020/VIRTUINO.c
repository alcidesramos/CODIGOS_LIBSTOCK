//pines de direccion del motor
#define m11 RB0_bit
#define m12 RB1_bit

#define led1 RC5_bit
#define led2 RC4_bit
#define led3 RC3_bit

#define suiche1 RB6_bit
#define suiche2 RB7_bit

#include "DS18B20.h"




// variabel trama de enviar
char trama_tx[100];



//variables para capturar la trama
char trama_rx[100];
char procesa[100];
char datorx;/// dato actual
char puntero=0;            //  contador que va apuntnado al siguiente valor trama_rx
char flag_rx=0;   //  cuANDO HAY DATO LSITO PARA PROCESAR

char flag_timer=0;  //  SE CUMNPLIO EL TIEMPO DE ESPERA POR DATOS SERIALES
char timer_cont=0; // FACTOR MULTIPLICACION


// estados de recepcion
enum maq_estados {Adm,V_,fin};
char estado=Adm;

char num_variables=0;// cuenta num variable

const total_variables=6; //   deben colocar el total de variables virtial usadas



//variables para leer analogo
unsigned int codigo;
float temperatura;

char texto[20];// trama para pasar de numero a cadena
char captu[30];// para procesar lo capturado
float pwm;




//funcion para que gira a la derecha
void m1derecha()
{
 m11=1;
 m12=0;
}

void m1izquierda()
{
  m11=0;
 m12=1;
 }

void m1quieto()
{
m11=0;
 m12=0;
}


void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

void soft_Uart_write_text(char *info)
{
 while(*info) Soft_UART_Write(*info++);
}


void soft_Uart_write_text_const(const char *info)
{
 while(*info) Soft_UART_Write(*info++);
}



void procesarx()

{
char variable;
char son;

      //!V00=?$!V01=10$!V02=?$!V03=?$


       strcpy(procesa, strtok(trama_rx, "V"));  //inicia captura de tokens desde el V

  for (son=0; son<total_variables-1;son++)
  {
      // captura el Dato deseado
     //captura numero de la variable
        strcpy(procesa, strtok(0, "="));  //captura hasta el /
         variable=atoi(procesa);

        strcpy(procesa, strtok(0, "$"));  //captura hasta el $

            //procesa lo que lelga
             if (procesa[0]!='?')
             {
               if (variable==0) led1=atoi(procesa);
              else if (variable==1)  led2=atoi(procesa);
              else if (variable==2)
                {
                  pwm=atof(procesa);
                  PWM1_Set_Duty(pwm);
                }
             } //si del     ?

  //
        strcpy(procesa, strtok(0, "V"));  //apunta a la otra varaible V

   }// fin del for de son

}


 void manda_AT_COMANDO(char *coman)
{

  Uart1_write_text(coman);//manda el comando
  Uart1_write_text_const("\r\n"); // manda final de linea
  }
  

 void manda_esp8266(char *info)
{
unsigned int largo;
        Uart1_write_text_const("AT+CIPSEND=");     //manda envia solo constantes
         UART1_Write('0');    //manda el socket  el cual se conecto
         UART1_Write(',');
         largo=strlen(info);  //calcula el largo de la cadena a enviar
        sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
        UART1_Write_Text(captu); //envia el largo d ela trama
        Uart1_write_text_const("\r\n");
       Delay_ms(300); //retardo antes de enviar la trama
        Uart1_write_text(info);     //manda envia solo constantes
    Delay_ms(300); //retardo antes de enviar la trama

}


  
void interrupcion() iv 0x0008 ics ICS_AUTO

{
       if (RCIF_bit==1)       // si es serial
 {

           datorx=UART1_Read();  //lee el dato
     // anlizo maquina de estado
      switch (estado)
      {
             // espera signo de admiracion
           case Adm:
                     trama_rx[puntero]=datorx;
                   if (datorx!='!') puntero=0;    //no fue el dato que me interesa
                   else
                   {
                      puntero++;//incrementa contador para proximo dato
                      estado=V_; //pasa al estado de capturar la u
                   }
                     break;

          // espera V
           case V_:
                  trama_rx[puntero]=datorx;
                   if (datorx!='V')
                   {
                   puntero=0;
                   estado=Adm; //regresa al estado inical
                   }
                   else
                   {
                    puntero++;//incrementa contador para proximo dato
                    // programa timer para recibir
                
                     flag_timer=0;
                     // inicia el timer
                 // 50ms
                      TMR1H=158;
                       TMR1L=88;
                       TMR1IF_bit=0;// limpia la bendera
                       TMR1IE_bit=1;// habilita la inetrrpcion
                       TMR1ON_bit=1;//prende el timer

                     estado=fin; //pasa al estado de capturar el prmer 0  en este cado digito del primer
                   }
                     break;

                case fin:
                   trama_rx[puntero]=datorx;
                   puntero++;
                   if (puntero>=100)
                   { puntero=0;
                    estado=Adm;
                    }
                   
                    if (flag_timer==1)
                    {

                   trama_rx[puntero]=0;    // agrega final d ela linea

                   RCIE_bit=0; //deshabilita la interrucion
                    flag_rx=1;  //activa la bandera de que hat una trama valida
                    estado=Adm;// RESETEA EL ESTADO
                    flag_timer=0;//limpia la bandera tiemr

                   }
                 break;


      }  // fin de switch estado
        RCIF_bit=0; /// limpia la bandera de interrpcion
       }  // fin de la interrucpion serial

       // si int de timer
         if (TMR1IF_bit==1)
         {
            timer_cont++; // varible
              if (timer_cont>=4)  // tiempo de espero 50ms*4= 200msseg  // colocat para que pueda captura toda la trama
              {
               TMR1IE_bit=0;// deshabilita la interrpcion de tiner
               TMR1ON_bit=0;// para el timer
              timer_cont=0;     // limpia el contador de timer
              flag_timer=1;
              }


         TMR1IF_bit=0;
         }



}

void main()
{
//CONFIGURA TODO DIGITAL
  ANSEL=0;
  ANSELH=0;

 trisb.b0=0;//salida m11
 trisb.b1=0;//salida m12
 trisc.b2=0; //salida pin PWM
 trisc.B4=0; //salida led2
 trisc.b5=0; //salida led 1
  trisc.b3=0; //salida led 3

    trisb.b6=1; //entrada del suiche1

    trisb.b7=1; //entrada del suiche2


    NOT_RBPU_bit=0;

 //inicia el puerto serial
 uart1_init(9600);

  //inicia pwm
   pwm1_init(1250);
   PWM1_Set_Duty(100);//inia un valor inicial en el pwm
   PWM1_Start();// prende el modulo pwm

 //motor arranca apagado
 m1quieto();
 led1=0;
 led2=0;
                     //rx   tx
Soft_UART_Init(&PORTA, 2, 1, 9600, 0);  // inicializa un puerto por software


manda_AT_COMANDO("ATE0");  //SIN ECO
delay_ms(2000);
manda_AT_COMANDO("AT+CWMODE=2"); //ACTUA COMO  ROUTER CREA UNA RED PROPIA
delay_ms(200);

//antes de poner modo cierra sevidores pone conexion unica
//BORRA SERIDOR
manda_AT_COMANDO("AT+CIPSERVER=0");  //cierra sevidores
delay_ms(200);
manda_AT_COMANDO("AT+CIPMUX=0");   //pone conexion un unica
delay_ms(200);
manda_AT_COMANDO("AT+CIPMODE=0"); //Trabaja en modo normal
delay_ms(200);

//Red WIFI como acces point  cana 5  clave tipo WPA2_PSK
manda_AT_COMANDO("AT+CWSAP=\"ESP8266_ARZ\",\"noconectar\",5,3");
delay_ms(600);
//Coloca la IP del acces point
manda_AT_COMANDO("AT+CIPAP=\"192.168.1.254\"");
delay_ms(200);
manda_AT_COMANDO("AT+CIPMUX=1");  //habilita multiples conexiones
delay_ms(200);

//Activa la escucha por el puerto 100
manda_AT_COMANDO("AT+CIPSERVER=1,100");
delay_ms(200);
//tiemo en el cual actua como servidor en segundos
manda_AT_COMANDO("AT+CIPSTO=0");    //0  siempre(todo el tiempo)
delay_ms(200);

   INTCON=0b01000000;//habilita interrpciones de perifericos
   
    RCIF_bit=0; //limpia bandesta interrpcion serial
  RCIE_bit=1; // habilite la interrpcion serial

 // LIMPIA ERRORES DE RECEPCION
  RCEN_bit=0;
  RCEN_bit=1;

       // configurra timer 1
  T1CON=0;
  // LO CUADRA A 50ms
  TMR1H=158;
  TMR1L=88;
  //PREESCALDRO DE 4
  T1CKPS1_bit=1;
  T1CKPS0_bit=0;
  
  TMR1ON_bit=0;  // pago timer
  TMR1IF_bit=0;   // limpia bandera


  GIE_bit=1; //autoriza todas las interrepciones programadas
 temperatura=ds18b20_read(&portb,5); // lectura neecsaria para calibarar els ensor
  Delay_ms(100);
  soft_Uart_write_text_const("INICIANDO\r\n");



    while (1)
    {

 temperatura=ds18b20_read(&portb,5); // lectura neecsaria para calibarar els ensor


    if (flag_rx==1)
   {
   soft_Uart_write_text_const("\r\n ME LLEGO=");
  soft_Uart_write_text(trama_rx);
  procesarx();
  Delay_ms(100);
  sprintf(trama_tx,"!V03=%d$!V04=%d$!V05=%.1f$",(unsigned int)!suiche1,(unsigned int)!suiche2,temperatura);
   manda_esp8266(trama_tx);

   puntero=0; //inicializa el conteo
   memset(trama_rx,0,100); //limpia la trama
   flag_rx=0;
   // Delay_ms(200);
   // LIMPIA ERRRORES DE RECPCION
   CREN_bit=0;
   CREN_bit=1;
   
   RCIF_bit=0;    //limpia la bandera de la interrpcion
   RCIE_bit=1;   //habilita la Interrpcion serial
   }

    
    
    }


}