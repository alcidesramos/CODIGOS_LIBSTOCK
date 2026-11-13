//pines de direccion del motor
#define m11 RB0_bit
#define m12 RB1_bit

#define led1 RC5_bit
#define led2 RC4_bit
#define led3 RC3_bit


#define suiche RB7_bit


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


//variables para leer analogo
unsigned int codigo;
float temperatura;

char texto[20];// trama para pasar de numero a cadena



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


void Interrpcion() iv 0x0008 ics ICS_AUTO


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
  
    trisb.b7=1; //entrada del suiche
    
    trisa.B0=1;  //entrada del sensor lm35
    
    
  //CONFIGURA TODO DIGITAL
  ANSEL=0;
  ANSELH=0;
  
  ANSEL.AN0=1; //el canal an0 es analogo

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

    codigo=ADC_Read(0);//lee el canal analogo cero
    temperatura=codigo*500.0/1023.0;// calcula la temperatura
//    FloatToStr_FixLen(temperatura,texto,5);
  //  UART1_Write_Text("temp=");
  //  UART1_Write_Text(texto);
   // UART1_Write('/');
   
        sprintf(texto,"*T%.2f*",temperatura);
        UART1_Write_Text(texto);
         Delay_ms(5);

        sprintf(texto,"*P%.2f*",temperatura);
        UART1_Write_Text(texto);
         Delay_ms(5);

         
    if (suiche==1) UART1_Write_Text("*LR255G0B0*");
    else UART1_Write_Text("*LR0G0B0*");


       led3=~led3;
       Delay_ms(50);


   
   
   }




}