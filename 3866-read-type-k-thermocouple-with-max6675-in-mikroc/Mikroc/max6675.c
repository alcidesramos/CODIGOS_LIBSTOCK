#include "max6675.h"

// procedimeintos del max6675
void max6675_init()
{
   max6675_ck_dir=0;   //salida reloj
   max6675_cs_dir=0;  //salida cs
   max6675_dat_dir=1;  //entrada dato


   max6675_cs=1;//salida 1
   max6675_ck=0; //saca cero por el reloj
   Delay_ms(100);
}

char max6675_pulso()
{
char lei;

  max6675_ck=1; //saca uno por el reloj
  Delay_us(10);
  lei=max6675_dat;
 max6675_ck=0; //saca cero por el reloj
  Delay_us(10);
  return lei;
}

float max6675_lee()
{
unsigned int sensor_dato;

unsigned int max6675_dato=0;
signed char cont;

    max6675_cs=0;   // habilita el modulo

    for (cont=15;cont>=0;cont--)
    {
      if (max6675_pulso()==1)  max6675_dato=max6675_dato | 1<<cont ;

    }//fin for

    max6675_cs=1;  //apagar modulo
    
    
    sensor_dato=(max6675_dato>>3 ); //desplaz 3 veces
    return((sensor_dato*0.25));
}