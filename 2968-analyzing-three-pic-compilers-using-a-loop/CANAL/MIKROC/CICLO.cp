#line 1 "C:/Users/Alcides Ramos/Desktop/compiladores/CANAL/MIKROC/CICLO.c"
 unsigned char cuenta;


void main()
{
TRISC=0;
ANSELC=0;

 while (1)
 {
 for (cuenta=1;cuenta!=0b1000000;cuenta=cuenta<<1)
 {
 LATC=cuenta;
 delay_ms(100);


 }

 }

}
