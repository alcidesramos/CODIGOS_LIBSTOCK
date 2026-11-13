#line 1 "C:/Users/Alcides Ramos/Desktop/SENSOR REFLETIVO/prueba/basico.c"

sbit s1_out at LATA0_bit;
sbit s1_in at RA0_bit;


void main()
{
ANSELA=0;


while (1)
{
TRISA0_bit=0;
s1_out=1;
Delay_us(10);
TRISA0_bit=1;


Delay_ms(100);


}



}
