#line 1 "C:/Users/Alcides Ramos/Desktop/DFPLAYER/DFPLAYER.c"
#line 1 "c:/users/alcides ramos/desktop/dfplayer/mp3_chino.h"
void init_mp3();
void mp3_next();
void mp3_previo();
void mp3_play_x(unsigned int cancion);
void mp3_volumen_sube();
void mp3_volumen_baja();
void mp3_volumen_x(unsigned char vol);
void mp3_equializa(unsigned char equal);
void mp3_play_mode(unsigned char como);
void mp3_fuente(unsigned char como);
void mp3_modo_off();
void mp3_modo_normal();
void mp3_modo_reset();
void mp3_modo_play();
void mp3_modo_pausa();
void mp3_suena(unsigned char carp,unsigned char fila);
void mp3_volumen_set(unsigned char prend,unsigned char nivel);
void mp3_repite_ya(unsigned char como);
void mp3_q_estado_usb();
void mp3_q_estado_sd();
void mp3_q_estado_flahs();
void mp3_inicializa();
void mp3_retransmite();
void mp3_responder();
void mp3_q_estado();
void mp3_q_volumen();
void mp3_q_equializa();
void mp3_q_play_mode();
void mp3_q_software();
void mp3_q_sd_filas();
void mp3_q_usb_filas();
void mp3_q_flahs_filas();
void mp3_q_on();
void mp3_q_sd_actual();
void mp3_q_usb_actual();
void mp3_q_flahs_actual();
#line 10 "C:/Users/Alcides Ramos/Desktop/DFPLAYER/DFPLAYER.c"
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
Delay_ms(500);
mp3_inicializa();
Delay_ms(200);

mp3_play_x( 5 );
Delay_ms(1000);
 while (1)
 {
 codigo=ADC_Read(0);
 temperatuta=codigo*500.0/1023.0;

 if (temperatuta>60)
 {
 mp3_play_x( 2 );
 Delay_ms(5000);
 }
 else if (temperatuta<20)
 {
 mp3_play_x( 3 );
 Delay_ms(4000);
 }

 if (sw==0)
 {
 mp3_volumen_x(20);
 mp3_play_x( 4 );
 Delay_ms(2000);
 }

 if (sw1==0)
 {
 mp3_volumen_x(30);
 mp3_play_x( 1 );
 Delay_ms(2000);
 }

 led =!led;
 Delay_ms(500);



 }



}
