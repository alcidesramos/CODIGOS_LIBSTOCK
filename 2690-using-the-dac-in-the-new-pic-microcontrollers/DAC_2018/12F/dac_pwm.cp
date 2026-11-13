#line 1 "C:/Users/Alcides Ramos/Desktop/CLASE 24/12F/dac_pwm.c"
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
ANSELA.b1=1;


trisa.b1=1;
trisa.b0=1;




 DACCON0=0;
 DACCON1=0;
 DACEN_bit=1;
 DACOE_bit=1;

 while (1)
 {
 codigo=ADC_Read(1);
 dac=codigo/32.0;
 DACCON1=dac;

 }





}
