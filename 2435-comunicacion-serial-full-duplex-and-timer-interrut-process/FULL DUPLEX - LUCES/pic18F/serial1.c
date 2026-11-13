//pines de direccion del motor
#define m11 LATB0_bit
#define m12 LATB1_bit

#define led1 LATC5_bit
#define led2 LATC4_bit
#define led3 LATC3_bit


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


char luces[]={0b00100,0b01010,0b10001,0b01010,0b00100};
char recorre=0;
char sacar;//tiene dato armado a sacar

unsigned int veces=0;


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

   }    //FIN INTERRPCION SERIAL
   
    if (TMR1IF_bit)
    {
    TMR1IF_bit = 0;
    TMR1H	 = 0x3C;
    TMR1L	 = 0xB0;
    //Enter your code here
  //  LATA=~LATA;
    veces++;
    if (veces>=10) // un segundo
    {
    
      sacar=luces[recorre];
   sacar=sacar<<1;// rota uno a la izquierda porque empieza desde pc1
   LATA= sacar;
   recorre++;
   if (recorre>=4) recorre=0;  //limite del vector
   veces=0;
   
   }
    
  }



}
//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON	 = 0x11;
  TMR1IF_bit	 = 0;
  TMR1H	 = 0x3C;
  TMR1L	 = 0xB0;
  TMR1IE_bit	 = 1;
  INTCON	 = 0xC0;
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
    
    trisa=0; //todo a salida
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
  

    InitTimer1();

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
   
        sprintf(texto,"temp=%.2f/",temperatura);
        UART1_Write_Text(texto);
    
    if (suiche==1) UART1_Write_Text("led=on/");
    else UART1_Write_Text("led=off/");
    

       led3=~led3;
       Delay_ms(50);


   
   
   }




}