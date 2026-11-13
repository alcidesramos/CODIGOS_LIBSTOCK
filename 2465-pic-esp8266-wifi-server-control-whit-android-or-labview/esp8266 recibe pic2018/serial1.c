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
char trama[100];
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
       if (puntero>=100) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
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
 uart1_init(115200);
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
   pwm1_init(1250);
   PWM1_Set_Duty(100);//inia un valor inicial en el pwm
   PWM1_Start();// prende el modulo pwm

 //motor arranca apagado
 m1quieto();
 led1=0;
 led2=0;
 
  UART1_Write_Text("ATE0\r\n"); //SIN ECO
Delay_ms(2000);


UART1_Write_Text("AT+CWMODE=2\r\n"); //ACTUA COMO  ROUTER CREA UNA RED PROPIA
Delay_ms(200);

//antes de poner modo cierra sevidores pone conexion unica
//BORRA SERIDOR
UART1_Write_Text("AT+CIPSERVER=0\r\n");  //cierra sevidores
Delay_ms(200);
UART1_Write_Text("AT+CIPMUX=0\r\n");   //pone conexion un unica
Delay_ms(200);


UART1_Write_Text("AT+CIPMODE=0\r\n"); //Trabaja en modo normal
Delay_ms(200);
//Red WIFI como acces point  cana 5  clave tipo WPA2_PSK
UART1_Write_Text("AT+CWSAP=\"ESP8266_ARZ\",\"noconectar\",5,3\r\n");
Delay_ms(600);
//Coloca la IP del acces ponit
UART1_Write_Text("AT+CIPAP=\"192.168.1.254\"\r\n");
Delay_ms(200);

//Crea el servidor y el puerto a escuchar
UART1_Write_Text("AT+CIPMUX=1\r\n");  //habilita multiples conexiones
Delay_ms(200);

//Activa la escucha por el puerto 200
UART1_Write_Text("AT+CIPSERVER=1,200\r\n");
Delay_ms(200);

//tiemo en el cual actua como servidor en segundos
UART1_Write_Text("AT+CIPSTO=0\r\n");    //0  siempre(todo el tiempo)

 
 
 
 
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
   memset(trama,0,100); //limpia la trama
   flag_rx=0;
   RCIF_bit=0;    //limpia la bandera de la interrpcion
   RCIE_bit=1;   //habilita la Interrpcion serial
   }


   }




}