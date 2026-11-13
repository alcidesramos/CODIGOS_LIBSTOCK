#line 1 "C:/Users/Alcides Ramos/Desktop/Termocupla max6675 2020/Mikroc/max6675.c"
#line 1 "c:/users/alcides ramos/desktop/termocupla max6675 2020/mikroc/max6675.h"










void max6675_init();
float max6675_lee() ;
#line 4 "C:/Users/Alcides Ramos/Desktop/Termocupla max6675 2020/Mikroc/max6675.c"
void max6675_init()
{
  trisc.b3 =0;
  trisc.b0 =0;
  trisc.b4 =1;


  RC0_bit =1;
  RC3_bit =0;
 Delay_ms(100);
}

char max6675_pulso()
{
char lei;

  RC3_bit =1;
 Delay_us(10);
 lei= RC4_bit ;
  RC3_bit =0;
 Delay_us(10);
 return lei;
}

float max6675_lee()
{
unsigned int sensor_dato;

unsigned int max6675_dato=0;
signed char cont;

  RC0_bit =0;

 for (cont=15;cont>=0;cont--)
 {
 if (max6675_pulso()==1) max6675_dato=max6675_dato | 1<<cont ;

 }

  RC0_bit =1;


 sensor_dato=(max6675_dato>>3 );
 return((sensor_dato*0.25));
}
