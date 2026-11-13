#define led RC0_bit

#define led1 RC5_bit
#define led2 RC4_bit

//pines de direccion del motor
#define m11 RB0_bit
#define m12 RB1_bit


char luces[]={0b00000001,0b00000010,0b00000100,0b00001000,0b00010000,0b00100000,0b01000000,0b10000000};
char cuenta1=0;

sbit led3 at RA0_bit;
sbit sw  at RA1_bit;


//variables para capturar la trama
char trama_rx[30];
char procesa[30];

char dato_rx;

char cuenta=0;

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

//Timer1
//Prescaler 1:4; TMR1 Preload = 15536; Actual Interrupt Time : 200 ms


      //Place/Copy this part in declaration section
void InitTimer1(){
  T1CON	 = 0x11;
  TMR1IF_bit	 = 0;
  TMR1H	 = 0x3C;
  TMR1L	 = 0xB0;
  TMR1IE_bit	 = 1;
  INTCON	 = 0xC0;
}

void Interrupt(){
  if (TMR1IF_bit){
    TMR1IF_bit = 0;
    TMR1H	 = 0x3C;
    TMR1L	 = 0xB0;
    //Enter your code here
    PORTB=luces[cuenta1];

    if (cuenta1>=7) cuenta1=0;     // 7 es el  numero de efectos empezando en cero
    cuenta1++;

    if (sw==0) led3=1;
    else led3=0;
    cuenta++;
    if (cuenta>=10)   /// si va 1 segundp
    {
    led=!led;
     cuenta=0;
    }


  }
}



void main() 
{

//todo digital;

ADCON1=0b0111;
// salida
TRISA=0;
TRISB=0 ;
TRISC=0;
TRISC7_bit=1; // enbtrada rx
TRISA1_bit=1; //entrada suiche


UART1_Init(9600);
PWM1_Init(300);
PWM1_Set_Duty(127);
PWM1_Start();
  UART1_Write_Text("HOLA MUNDO");
  RCEN_bit=1; // habilita la recepcion continua
  
  InitTimer1();
  
  while (1)
  {
    // lee la trama hasta llegue el * o 30 datos
        UART1_read_Text(trama_rx,"*",30);   //  semibloqueante
        if (strstr(trama_rx,"led1="))      //led1=on*
             {
             if (strstr(trama_rx,"on")) led1=1;
            else led1=0;
            }
        
        else if (strstr(trama_rx,"led2="))      //led1=on*
             {
             if (strstr(trama_rx,"on")) led2=1;
            else led2=0;
            }
            
              else if (strstr(trama_rx,"m1der"))  m1derecha();
            else if (strstr(trama_rx,"m1izq"))  m1izquierda();
        else if (strstr(trama_rx,"m1stop"))  m1quieto();
        
          //si llega es la velocidad del motor


    else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
    {
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "*"));  //captura hasta el /
        //pasa la cadena a  numero
        dato_rx=atoi(procesa);
        PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm


    }




  

  Delay_ms(500);
  
  }




}