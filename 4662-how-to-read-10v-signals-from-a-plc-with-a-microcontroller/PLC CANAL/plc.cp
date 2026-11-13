#line 1 "C:/Users/Alcides Ramos/Desktop/PLC CANAL/plc.c"

void main()
{

OSCCON=0;

IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=0;

TRISA0_bit=1;
TRISA2_bit=0;

ADC_Init();


ANSELA=0;
AN0_bit=1;

PWM1_Init(250);
PWM1_Set_Duty(0);
PWM1_Start();
 while(1)
 {
 PWM1_Set_Duty(ADC_Get_Sample(0)>>2);
 Delay_ms(50);


 }


}
