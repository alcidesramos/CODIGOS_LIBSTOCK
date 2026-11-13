//pines sesnores
sbit s1_out at LATA0_bit;
sbit s1_in at RA0_bit;


void main() 
{
ANSELA=0; // todo digitla;


while (1)
{
TRISA0_bit=0; //configura como salida
s1_out=1;
Delay_us(10);
TRISA0_bit=1;

//retardo para analizar el pulso
Delay_ms(100);


}



}