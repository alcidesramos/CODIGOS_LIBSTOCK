
unsigned int codigo;
  float DAC;
void main() 
{
  ADCON1=0; // todo analogo;
  TRISA=0b1111111; // todo entrada
  trisc=0; // todo salida
  PWM1_Init(100000);
  PWM1_Start();
  
  while(1)
  {
  codigo=ADC_Read(0);
  DAC=codigo/4.0;
  PWM1_Set_Duty(DAC);
  
  
  
  }
  
  
  

}