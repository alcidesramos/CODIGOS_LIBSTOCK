 unsigned int codigo;


void main()
 {


//configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//OScialdor Interno a 4 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=0;
IRCF0_bit=1;


/* Par Trabajar a 32 MHz con PLL
//
oscilador  Puesto en la palabra de configuracion
SCS1_bit=0;
SCS0_bit=0;


//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;


SPLLEN_bit=1; //prende el PLL por 4
while (PLLR_bit==0);   //espera estabilidad del PLL
*/


INTCON=0b01000000;

//Todo Digital
ansela=0;
ANSELA.b0=1; //analogo an0
//configuracon de los pines
TRISA2_bit=0;  //Salida PWM
TRISA0_bit=1;  //Entrada ADC
  PWM1_Init(20000);
  PWM1_Set_Duty(127);
  PWM1_Start();
   ADC_Init();
   while (1)
   {
      codigo=ADC_Get_Sample(0);   // 0- 1023
     PWM1_Set_Duty(255-(codigo>>2));
     Delay_ms(200);

   }
   

 

}