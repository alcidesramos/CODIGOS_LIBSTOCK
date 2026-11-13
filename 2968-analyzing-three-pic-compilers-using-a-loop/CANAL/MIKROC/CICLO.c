 unsigned char cuenta;


void main() 
{
TRISC=0; // portc salida
ANSELC=0; // PORTC DIGITAL

   while (1)
   {
    for (cuenta=1;cuenta!=0b1000000;cuenta=cuenta<<1)
   {
   LATC=cuenta;
   delay_ms(100);


  }
   
   }

}