#define led RC0_bit

#define led1 RC5_bit
#define led2 RC4_bit

//pines de direccion del motor
#define m11 RB0_bit
#define m12 RB1_bit


char dato_rx;

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
// salida
TRISB=0 ;
TRISC=0;
TRISC7_bit=1; // enbtrada rx

UART1_Init(9600);
PWM1_Init(300);
PWM1_Set_Duty(127);
PWM1_Start();
  UART1_Write_Text("HOLA MUNDO");
  RCEN_bit=1; // habilita la recepcion continua
  
  while (1)
  {
     while (UART1_Data_Ready() == 0) ;// bloqueado esperando dato

       dato_rx = UART1_Read();
       
          switch (dato_rx)
          {
            case 'a':
                     led1=1;
                     break;
          
            case 'b':
                     led1=0;
                     break;
                     
            case 'c':
                     led2=1;
                     break;
                     
           case 'd':
                     led2=0;
                     break;
                     
            case '0':
                     m1derecha();
                     break;


            case '1':
                     m1izquierda();
                     break;
                     
            case '2':
                     m1quieto();
                     break;



                     

          }

  
  
  led=!led;
  Delay_ms(500);
  
  }




}