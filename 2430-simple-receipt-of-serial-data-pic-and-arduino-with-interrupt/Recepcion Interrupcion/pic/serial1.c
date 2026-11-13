//pines de direccion del motor
#define m11 RB0_bit
#define m12 RB1_bit

#define led1 RC5_bit
#define led2 RC4_bit
#define led3 RC3_bit


//PIn de pwm
//#define pwm 11

//variables para capturar la trama
char trama[30];
char procesa[30];
char dato;

//variables nuevas
char datorx;
char puntero=0;
char flag_rx=0;



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

void procesarx()
{
if (strstr(trama,"led1="))
     {
     if (strstr(trama,"on")) led1=1;
    else led1=0;
    }

    else if (strstr(trama,"led2="))
     {
     if (strstr(trama,"on")) led2=1;
    else led2=0;
    }

 else if (strstr(trama,"m1der"))  m1derecha();

  else if (strstr(trama,"m1izq"))  m1izquierda();

  else if (strstr(trama,"m1stop"))  m1quieto();

  else if (strstr(trama,"m1pwm="))
    {
        strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);
        PWM1_Set_Duty(dato);// aplica la velocidad al pwm


    }


}


void interrpcion() iv 0x0004 ics ICS_AUTO 
{
     if (RCIF_bit==1)
    {
       datorx=UART1_Read();  //lee el dato
       trama[puntero]=datorx; //lo almacena en la trama
       puntero++; //incrementa el contador de trama
       if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
       if (datorx=='*')  //Si llega el fin de la trama
       {
         RCIE_bit=0; //deshabilita la interrucion
         flag_rx=1;  //activa la bandera de que hat una trama valida

       }
    RCIF_bit=0;

   }



}


void main() 

{
 //inicia el puerto serial
 uart1_init(9600);
 trisb.b0=0;//salida m11
 trisb.b1=0;//salida m12
 trisc.b2=0; //salida pin PWM
 trisc.B4=0; //salida led2
 trisc.b5=0; //salida led 1
  trisc.b3=0; //salida led 3

 

  //inicia pwm
   pwm1_init(300);
   PWM1_Set_Duty(100);//inia un valor inicial en el pwm
   PWM1_Start();// prende el modulo pwm

 //motor arranca apagado
 m1quieto();
 led1=0;
 led2=0;
 
  INTCON=0b01000000;//habilita interrpciones de perifericos
  RCIF_bit=0; //limpia bandesta interrpcion serial
  RCIE_bit=1; // habilite la interrpcion serial
  
  GIE_bit=1; //autoriza todas las interrepciones programadas
  
  
 

   while (1)
   {

   if (flag_rx==1)
   {

   procesarx();  // llama al procedimiento de procesar la trama
   puntero=0; //inicializa el conteo
   memset(trama,0,30); //limpia la trama
   flag_rx=0;
   RCIF_bit=0;    //limpia la bandera de la interrpcion
   RCIE_bit=1;   //habilita la Interrpcion serial
   }


       led3=~led3;
       Delay_ms(200);


   
   
   }




}