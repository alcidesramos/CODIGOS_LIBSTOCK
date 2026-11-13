
#define led1 RC5_bit
#define led2 RC4_bit

//pines de direccion del motor
#define m11 RB0_bit
#define m12 RB1_bit

//PIn de pwm
//#define pwm 11

//variables para capturar la trama
char trama[30];
char procesa[30];

char dato;


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




void main() 
{
   //inicia el puerto serial
 uart1_init(9600);
 trisb.b0=0;//salida m11
 trisb.b1=0;//salida m12
 trisc.b2=0; //salida pin PWM
 trisc.B4=0; //salida led2
 trisc.b5=0; //salida led 1
 
  //inicia pwm
   pwm1_init(300);
   PWM1_Set_Duty(100);//inia un valor inicial en el pwm
   PWM1_Start();// prende el modulo pwm

 //motor arranca apagado
 m1quieto();
 m11=0;
 m12=0;

   
   while (1)
   
   {    // lee la trama hasta llegue el * o 30 datos
        UART1_read_Text(trama,"*",30);
        
     if (strstr(trama,"led1="))
     {
     if (strstr(trama,"on")) led1=1;
    else led1=0;
    }
    
    
     if (strstr(trama,"led2="))
     {
     if (strstr(trama,"on")) led2=1;
    else led2=0;
    }

  else if (strstr(trama,"m1der"))  m1derecha();
  else if (strstr(trama,"m1izq"))  m1izquierda();
  else if (strstr(trama,"m1stop"))  m1quieto();
   //si llega es la velocidad del motor
  
  
    else if (strstr(trama,"m1pwm="))
    {
        strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);
        PWM1_Set_Duty(dato);// aplica la velocidad al pwm


    }

   
   }
   
   
 
 



}