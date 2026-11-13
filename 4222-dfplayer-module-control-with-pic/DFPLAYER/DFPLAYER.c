
#include "mp3_chino.h"

#define musica 1
#define temp_alta 2
#define temp_baja 3
#define suiche_pres 4
#define bienvenida 5

sbit sw at RB0_bit;
sbit sw1 at RB1_bit;

sbit led at RC0_bit;

unsigned int codigo;
float temperatuta;



void main() 
{
ADCON1=0; // todo analogo;
TRISA0_bit=1;   //entrada analogos
TRISB0_bit=1;  //entrada pulsador1
TRISB1_bit=1;  //entrada pulsador2
TRISC0_bit=0;// salida led;
TRISC6_bit=0;  //salida tx
TRISC7_bit=1; // entrada rx
NOT_RBPU_bit=0; //habilita pull up en portb
Delay_ms(500);
mp3_inicializa();    // manda comando de inicializacion
Delay_ms(200);

mp3_play_x(bienvenida);
Delay_ms(1000);
   while (1)
   {
     codigo=ADC_Read(0);
  temperatuta=codigo*500.0/1023.0;

  if (temperatuta>60)
  {
  mp3_play_x(temp_alta);
  Delay_ms(5000);
  }
  else if (temperatuta<20)
  {
   mp3_play_x(temp_baja);
  Delay_ms(4000);
  }

  if (sw==0)
  {
   mp3_volumen_x(20);
   mp3_play_x(suiche_pres);
  Delay_ms(2000);
    }

  if (sw1==0)
  {
   mp3_volumen_x(30);
   mp3_play_x(musica);
  Delay_ms(2000);
    }

  led =!led;
  Delay_ms(500);

   
   
   }



}