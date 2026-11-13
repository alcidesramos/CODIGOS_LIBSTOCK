#define max 255
void main() 
{

//configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//OScialdor Interno a 1 MHZ
IRCF3_bit=1;
IRCF2_bit=0;
IRCF1_bit=1;
IRCF0_bit=1;

ANSELA=0; //todo digital
TRISA=0;  //Todo salida
PWM1_Init(100);
PWM1_Set_Duty(max-200);
PWM1_Start();
   while(1)
   {
   
   
   }



}