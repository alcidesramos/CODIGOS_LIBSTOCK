#line 1 "C:/Users/Alcides Ramos/Desktop/Fuente conmutada/Nueva carpeta/BUCK/BUCK.c"
 unsigned int codigo;


void main()
 {



OSCCON=0;
OSCTUNE=0;

SCS1_bit=1;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=0;
IRCF0_bit=1;
#line 41 "C:/Users/Alcides Ramos/Desktop/Fuente conmutada/Nueva carpeta/BUCK/BUCK.c"
INTCON=0b01000000;


ansela=0;
ANSELA.b0=1;

TRISA2_bit=0;
TRISA0_bit=1;
 PWM1_Init(20000);
 PWM1_Set_Duty(127);
 PWM1_Start();
 ADC_Init();
 while (1)
 {
 codigo=ADC_Get_Sample(0);
 PWM1_Set_Duty(255-(codigo>>2));
 Delay_ms(200);

 }




}
