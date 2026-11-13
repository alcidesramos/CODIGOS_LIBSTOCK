#line 1 "C:/Users/Taller Electronica/Desktop/cruce  por cero 2018/video/pic/crucecero.c"
unsigned char velocidad;
unsigned int codigo;





void espera(char t)
{
 TMR0=t;
 TMR0IF_bit=0;
 while (TMR0IF_bit==0) ;

}





void main()
{


OSCCON=0;
OSCTUNE=0;

SCS1_bit=1;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;


SPLLEN_bit=1;




ansela=0;
ansela.b0=1;


trisa=0;
trisa.b0=1;
trisa.b2=1;

ADC_Init();



OPTION_REG=0;


 PS2_bit=1;
 PS1_bit=1;
 PS0_bit=1;

 while (1)
 {
 codigo=ADC_Get_Sample(0);

 if (codigo<=200)  LATA1_bit =0;
 else if (codigo>=900)  LATA1_bit =1;
 else
 {
 while (( RA2_bit ==0)) ;
 velocidad= codigo >>2;
 espera(velocidad);
  LATA1_bit =1;
 delay_us(100);
  LATA1_bit =0;

 }

 }




}
