#line 1 "C:/Users/Alcides Ramos/Desktop/Clase 23/dac18f.c"

unsigned int codigo;
 float DAC;
void main()
{
 ADCON1=0;
 TRISA=0b1111111;
 trisc=0;
 PWM1_Init(100000);
 PWM1_Start();

 while(1)
 {
 codigo=ADC_Read(0);
 DAC=codigo/4.0;
 PWM1_Set_Duty(DAC);



 }




}
