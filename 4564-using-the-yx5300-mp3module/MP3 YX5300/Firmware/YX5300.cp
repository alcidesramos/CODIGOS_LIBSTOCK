#line 1 "C:/Users/Alcides Ramos/Desktop/MP3 YX5300/Firmware/YX5300.c"

unsigned char mp3_buffer[8]={0x7E,0XFF,0X06,0X00,0X00,0X00,0X00,0XEF} ;
#line 26 "C:/Users/Alcides Ramos/Desktop/MP3 YX5300/Firmware/YX5300.c"
void mp3_send()
{
char i;
for (i=0; i<=7;i++) UART1_Write(mp3_buffer[i]);
Delay_ms(200);
}


void mp3_select()
{
mp3_buffer[3]= 9 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_reset()
{
mp3_buffer[3]= 0xC ;
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
mp3_buffer[3]= 1 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_prev()
{
mp3_buffer[3]= 2 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}



void mp3_play_song (unsigned char song)
{
mp3_buffer[3]= 3 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=song;
mp3_send();
}




void mp3_vol_up()
{
mp3_buffer[3]= 4 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_vol_down()
{
mp3_buffer[3]= 5 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_set_vol (unsigned char volu)
{
if (volu>=30) volu=30;

mp3_buffer[3]= 6 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=volu;
mp3_send();
}


void mp3_ciclo_play_num (unsigned char song)
{
mp3_buffer[3]= 8 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=song;
mp3_send();
}

void mp3_sleep()
{
mp3_buffer[3]= 0xA ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_wake_up()
{
mp3_buffer[3]= 0xB ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_pause()
{
mp3_buffer[3]= 0xE ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}


void mp3_play()
{
mp3_buffer[3]= 0xD ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}



void mp3_stop()
{
mp3_buffer[3]= 0x16 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_folder_song (unsigned char folder,unsigned char song)
{
mp3_buffer[3]= 0xF ;
mp3_buffer[4]=0;
mp3_buffer[5]=folder;
mp3_buffer[6]=song;
mp3_send();

}

void mp3_folder_cycle(unsigned char folder)
{
mp3_buffer[3]= 0x17 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=folder;
mp3_send();
}

void mp3_play_random()
{
mp3_buffer[3]= 0x18 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_set_single_cycle_play()
{
mp3_buffer[3]= 0x19 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_close_single_cycle_play()
{
mp3_buffer[3]= 0x19 ;
mp3_buffer[4]=0;
mp3_buffer[5]=0;
mp3_buffer[6]=0;
mp3_send();
}

void mp3_play_song_vol (unsigned char song,unsigned char vol)
{
mp3_set_vol(vol);
mp3_play_song(song);


}
