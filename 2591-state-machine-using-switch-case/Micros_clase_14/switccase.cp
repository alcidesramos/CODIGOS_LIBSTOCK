#line 1 "C:/Users/Alcides Ramos/Desktop/Clase 14/switccase.c"


sbit sw at RA3_bit;


enum maquina1_est {encendido,flahs,policia,alternado,apagado,melodia};

char estados=alternado;

void main()
{

 IRCF3_bit=1;
 IRCF2_bit=1;
 IRCF1_bit=1;
 IRCF0_bit=0;



 SPLLEN_bit=0;
 TRISA=0;
 TRISA3_bit=1;


 SCS1_bit=1;
 SCS0_bit=1;

 ANSELA=0;



 LATA=0;
 Sound_Init(&LATA,5);
 while (1)

 {

 switch (estados)
 {
 case encendido :
 LATA=0b010111;
 if (sw==0)
 {
 estados=flahs;
 Delay_ms(250);
 }

 break;

 case flahs:
 LATA=LATA ^ 0b010111;
 Delay_ms(200);
 if (sw==0)
 {


 LATA=0b010100;
 estados=policia;
 Delay_ms(250);
 }

 break;


 case policia:
 LATA=LATA ^ 0b010111;
 Delay_ms(200);
 if (sw==0)
 {


 LATA=0b010010;
 estados=alternado;
 Delay_ms(250);
 }

 break;

 case alternado:
 LATA=LATA ^ 0b010111;
 Delay_ms(200);
 if (sw==0)
 {


 LATA=0b000000;
 estados=apagado;
 Delay_ms(250);
 }

 break;
 case apagado:
 LATA=0;
 if (sw==0)
 {


 LATA=0b000000;
 estados=melodia;
 Delay_ms(250);
 }

 break;
 case melodia:
 Sound_Play(1000,100);
 Sound_Play(2000,100);
 Sound_Play(3000,100);
 if (sw==0)
 {


 LATA=0b010111;
 estados=encendido;
 Delay_ms(250);
 }

 break;




 }


 }




 }
