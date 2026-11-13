                                                      //COM
unsigned char mp3_buffer[8]={0x7E,0XFF,0X06,0X00,0X00,0X00,0X00,0XEF} ;

#define next_song 1
#define prev_song 2
#define play_song 3
#define vol_up 4
#define vol_down 5
#define set_vol 6
#define single_cycle 8
#define select_sd  9
#define sleep  0xA
#define wake_up  0xB
#define reset  0xC
#define play  0xD
#define pausa  0xE
#define folder_file  0xF
#define stop  0x16
#define folder_cycle  0x17
#define random  0x18
#define set_sigle_play  0x19
#define close_sigle_play  0x19
#define dac_output  0x1A
#define play_and_vol  0x22

void mp3_send()
{
char i;
for (i=0; i<=7;i++)  UART1_Write(mp3_buffer[i]);
Delay_ms(200);
}


void mp3_select()
{
mp3_buffer[3]=select_sd;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_reset()
{
mp3_buffer[3]=reset;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_init()
{
UART1_Init(9600);
mp3_select();
mp3_reset();
Delay_ms(200);
}

void mp3_next()
{
mp3_buffer[3]=next_song;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_prev()
{
mp3_buffer[3]=prev_song;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}



void mp3_play_song (unsigned char  song)
{
mp3_buffer[3]=play_song;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=song;
mp3_send();
}




void mp3_vol_up()
{
mp3_buffer[3]=vol_up;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_vol_down()
{
mp3_buffer[3]=vol_down;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_set_vol (unsigned char  volu)
{
if (volu>=30) volu=30;

mp3_buffer[3]=set_vol;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=volu;
mp3_send();
}


void mp3_ciclo_play_num (unsigned char  song)
{
mp3_buffer[3]=single_cycle;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=song;
mp3_send();
}

void mp3_sleep()
{
mp3_buffer[3]=sleep;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_wake_up()
{
mp3_buffer[3]=wake_up;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_pause()
{
mp3_buffer[3]=pausa;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_play()
{
mp3_buffer[3]=play;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}



void mp3_stop()
{
mp3_buffer[3]=stop;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_folder_song (unsigned char folder,unsigned char song)
{
mp3_buffer[3]=folder_file;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=folder;
mp3_buffer[6]=song;
mp3_send();

}

void mp3_folder_cycle(unsigned char  folder)   //reproduce un folder de manera ciclica
{
mp3_buffer[3]=folder_cycle;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=folder;
mp3_send();
}

void mp3_play_random()
{
mp3_buffer[3]=random;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_set_single_cycle_play()
{
mp3_buffer[3]=set_sigle_play;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_close_single_cycle_play()
{
mp3_buffer[3]=close_sigle_play;   // coloca comando
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_play_song_vol (unsigned char  song,unsigned char vol)
{
mp3_set_vol(vol);
mp3_play_song(song);


}