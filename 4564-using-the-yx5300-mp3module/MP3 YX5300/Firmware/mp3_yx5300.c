#include "yx5300.h"

 #define bienvenida 1
#define temp_alta 2
#define temp_baja 3
#define suiche_pres 4
#define zumo 5
#define musica 6


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
Delay_ms(100);
mp3_init();    // manda comando de inicializacion

mp3_set_vol(30);


 //mp3_play_song (6);
//mp3_play_song(temp_alta);
//mp3_ciclo_play_num (1); // suena ciclcio la cancion 1
//mp3_sleep();
//mp3_wake_up();
 //mp3_folder_song(1,4);    //play el forlde 1 cancion 4
 //mp3_play_song (3);
  // mp3_folder_cycle(1) ; //reproduce ciclico el folder 1
  // mp3_play_random();
 //  mp3_play_song_vol (3,20);  // suena la cancio 3 con 20 de volumen


 while (1)
 {
      codigo=ADC_Read(0);
  temperatuta=codigo*500.0/1023.0;

  if (temperatuta>60)
  {
  mp3_play_song(temp_alta);
  Delay_ms(5000);
  }
  else if (temperatuta<20)
  {
   mp3_play_song(temp_baja);
  Delay_ms(4000);
  }

   if (sw==0)      //sube volumen
  {
   mp3_vol_up();
   Delay_ms(200);
    }



   if (sw1==0)     //baja volumen
  {
   mp3_vol_down();
   Delay_ms(200);
    }
 
     led =!led;
  Delay_ms(500);

 }

}