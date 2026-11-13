#line 1 "C:/Users/Alcides Ramos/Desktop/CLASE 24/16F/dac_pwm.c"
 unsigned int codigo;
float dac;

void main()

{


SCS1_bit=1;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;


ansela=0;
ANSELC=0;
ANSELA.b1=1;


trisa.b1=1;
trisa.b0=1;

TRISC=0;



 DAC1CON0=0;
 DAC1CON1=0;
 DAC1EN_bit=1;
 DAC1OE1_bit=1;


 TRISC0_bit=1;
 TRISC1_bit=1;

 TRISC2_bit=0;

 OPA1CON=0;
 OPA1EN_bit=1;


 while (1)
 {
 codigo=ADC_Read(1);
 dac=codigo/4.0;
 DAC1CON1=dac;

 }




}
