
void main() 
{
 //configuración Oscilador
OSCCON=0;
//OScialdor Interno a 4 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=0;

TRISA0_bit=1;  // ENTRADA ANALOGA
TRISA2_bit=0; //SALIDA PWM

ADC_Init();// INICA EL ADC

// TODO DIGITAL
ANSELA=0;
AN0_bit=1; //ANALOGO AN0

PWM1_Init(250);
PWM1_Set_Duty(0);
PWM1_Start();
   while(1)
   {
     PWM1_Set_Duty(ADC_Get_Sample(0)>>2);  // lee adc y lo corre 2 veces a la derecha es decir, divide por 4
     Delay_ms(50);

   
   }


}