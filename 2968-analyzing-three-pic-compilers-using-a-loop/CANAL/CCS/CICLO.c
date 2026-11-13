#include <CICLO.h>
#opt compress

unsigned char cuenta;

void main()
{

   while(TRUE)
   {

    for (cuenta=1;cuenta!=0b1000000;cuenta=cuenta<<1)
   {
   output_c(cuenta);
   delay_ms(100);
 
   }



      //TODO: User Code
   }

}
