#line 1 "C:/Users/Alcides Ramos/Desktop/MOSFET/CLASE/mosfet.c"

void main()
{


OSCCON=0;
OSCTUNE=0;

SCS1_bit=1;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=0;
IRCF1_bit=1;
IRCF0_bit=1;

ANSELA=0;
TRISA=0;
PWM1_Init(100);
PWM1_Set_Duty( 255 -200);
PWM1_Start();
 while(1)
 {


 }



}
