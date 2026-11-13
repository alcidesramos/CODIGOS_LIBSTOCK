#line 1 "C:/Users/Alcides Ramos/Desktop/DFPLAYER/mp3_chino.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 2 "C:/Users/Alcides Ramos/Desktop/DFPLAYER/mp3_chino.c"
 const char inicio=0x7E;
 const char fin=0XEF;
 const char version=0xFF;
 const char eco=0;
 const char largo=0x06;
unsigned int checksum;
unsigned char comando;
unsigned int parametro=0;
#line 65 "C:/Users/Alcides Ramos/Desktop/DFPLAYER/mp3_chino.c"
void init_mp3()
{

UART1_Init(9600);
Delay_ms(1000);
}

void calula_checksum()
{
checksum=0;
checksum=version+largo+comando+eco+ ((char *)&parametro)[1] + ((char *)&parametro)[0] ;
checksum=-checksum;
}


void manda_mp3()
{
 UART1_Write(inicio);
 UART1_Write(version);
 UART1_Write(largo);
 UART1_Write(comando);
 UART1_Write(eco);
 UART1_Write( ((char *)&parametro)[1] );
 UART1_Write( ((char *)&parametro)[0] );
 UART1_Write( ((char *)&checksum)[1] );
 UART1_Write( ((char *)&checksum)[0] );
 UART1_Write(fin);
 parametro=0;
 Delay_ms(100);
}

void mp3_next()
{
comando= 0x01 ;
calula_checksum();
manda_mp3();
}

void mp3_previo()
{
comando= 0x02 ;
calula_checksum();
manda_mp3();
}

void mp3_play_x(unsigned int cancion)
{
comando= 0x03 ;
parametro=cancion;
calula_checksum();
manda_mp3();
}

void mp3_volumen_sube()
{
comando= 0x04 ;
calula_checksum();
manda_mp3();
}

void mp3_volumen_baja()
{
comando= 0x05 ;
calula_checksum();
manda_mp3();
}

void mp3_volumen_x(unsigned char vol)
{
comando= 0x06 ;
parametro=vol;
calula_checksum();
manda_mp3();
}

void mp3_equializa(unsigned char equal)
{
comando= 0x07 ;
parametro=equal;
calula_checksum();
manda_mp3();
}

void mp3_play_mode(unsigned char como)
{
comando= 0x08 ;
parametro=como;
calula_checksum();
manda_mp3();
}

void mp3_fuente(unsigned char como)
{
comando= 0x09 ;
parametro=como;
calula_checksum();
manda_mp3();
}

void mp3_modo_off()
{
comando= 0x0A ;
calula_checksum();
manda_mp3();
}


void mp3_modo_normal()
{
comando= 0x0B ;
calula_checksum();
manda_mp3();
}


void mp3_modo_reset()
{
comando= 0x0C ;
calula_checksum();
manda_mp3();
}


void mp3_modo_play()
{
comando= 0x0D ;
calula_checksum();
manda_mp3();
}


void mp3_modo_pausa()
{
comando= 0x0E ;
calula_checksum();
manda_mp3();
}




void mp3_suena(unsigned char carp,unsigned char fila)
{
comando= 0x0F ;
parametro=(unsigned int) carp<<8 | fila;
calula_checksum();
manda_mp3();
}


void mp3_volumen_set(unsigned char prend,unsigned char nivel)
{
comando= 0x10 ;
parametro=(unsigned int) prend<<8 | nivel;
calula_checksum();
manda_mp3();
}

void mp3_repite_ya(unsigned char como)
{
comando= 0x011 ;
parametro=como;
calula_checksum();
manda_mp3();
}

void mp3_q_estado_usb()
{
comando= 0x03C ;
calula_checksum();
manda_mp3();
}

void mp3_q_estado_sd()
{
comando= 0x03D ;
calula_checksum();
manda_mp3();

}

void mp3_q_estado_flahs()
{
comando= 0x03E ;
calula_checksum();
manda_mp3();
}

void mp3_inicializa()
{
init_mp3();
comando= 0x03F ;
calula_checksum();
manda_mp3();
}

void mp3_retransmite()
{
comando= 0x040 ;
calula_checksum();
manda_mp3();
}

void mp3_responder()
{
comando= 0x041 ;
calula_checksum();
manda_mp3();
}


void mp3_q_estado()
{
comando= 0x042 ;
calula_checksum();
manda_mp3();
}


void mp3_q_volumen()
{
comando= 0x043 ;
calula_checksum();
manda_mp3();
}



void mp3_q_equializa()
{
comando= 0x044 ;
calula_checksum();
manda_mp3();
}


void mp3_q_play_mode()
{
comando= 0x045 ;
calula_checksum();
manda_mp3();
}

void mp3_q_software()
{
comando= 0x046 ;
calula_checksum();
manda_mp3();
}


void mp3_q_sd_filas()
{
comando= 0x047 ;
calula_checksum();
manda_mp3();
}



void mp3_q_usb_filas()
{
comando= 0x048 ;
calula_checksum();
manda_mp3();
}



void mp3_q_flahs_filas()
{
comando= 0x049 ;
calula_checksum();
manda_mp3();
}



void mp3_q_on()
{
comando= 0x04A ;
calula_checksum();
manda_mp3();
}

void mp3_q_sd_actual()
{
comando= 0x04B ;
calula_checksum();
manda_mp3();
}

void mp3_q_usb_actual()
{
comando= 0x04C ;
calula_checksum();
manda_mp3();
}

void mp3_q_flahs_actual()
{
comando= 0x04D ;
calula_checksum();
manda_mp3();
}
