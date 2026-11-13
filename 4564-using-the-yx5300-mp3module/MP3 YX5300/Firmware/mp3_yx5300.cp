#line 1 "C:/Users/Alcides Ramos/Desktop/MP3 YX5300/Firmware/mp3_yx5300.c"
#line 1 "c:/users/alcides ramos/desktop/mp3 yx5300/firmware/yx5300.h"

void mp3_init();
void mp3_prev();
void mp3_play_song (unsigned char song);
void mp3_next();
void mp3_vol_up();
void mp3_vol_down();
void mp3_set_vol (unsigned char volu);
void mp3_ciclo_play_num (unsigned char song);
void mp3_sleep();
void mp3_wake_up();
void mp3_reset();
void mp3_pause();
void mp3_play();
void mp3_stop();
void mp3_folder_song (unsigned char folder,unsigned char song);
void mp3_folder_cycle(unsigned char folder);
void mp3_play_random();
void mp3_set_single_cycle_play();
void mp3_close_single_cycle_play();
void mp3_play_song_vol (unsigned char song,unsigned char vol);
#line 11 "C:/Users/Alcides Ramos/Desktop/MP3 YX5300/Firmware/mp3_yx5300.c"
sbit sw at RB0_bit;
sbit sw1 at RB1_bit;

sbit led at RC0_bit;

unsigned int codigo;
float temperatuta;


void main()

{
ADCON1=0;
TRISA0_bit=1;
TRISB0_bit=1;
TRISB1_bit=1;
TRISC0_bit=0;
TRISC6_bit=0;
TRISC7_bit=1;
NOT_RBPU_bit=0;
Delay_ms(100);
mp3_init();

mp3_set_vol(30);
#line 49 "C:/Users/Alcides Ramos/Desktop/MP3 YX5300/Firmware/mp3_yx5300.c"
 while (1)
 {
 codigo=ADC_Read(0);
 temperatuta=codigo*500.0/1023.0;

 if (temperatuta>60)
 {
 mp3_play_song( 2 );
 Delay_ms(5000);
 }
 else if (temperatuta<20)
 {
 mp3_play_song( 3 );
 Delay_ms(4000);
 }

 if (sw==0)
 {
 mp3_vol_up();
 Delay_ms(200);
 }



 if (sw1==0)
 {
 mp3_vol_down();
 Delay_ms(200);
 }

 led =!led;
 Delay_ms(500);

 }

}
