void init_mp3();
void mp3_next();
void mp3_previo();
void mp3_play_x(unsigned int cancion);  //toca la cancion x  x va hasta 2999
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
void mp3_suena(unsigned char carp,unsigned char fila); //reprocuce una carpeta y un arcuivo
void mp3_volumen_set(unsigned char prend,unsigned char nivel);//1=habilita el volumen deseado
void mp3_repite_ya(unsigned char como);    //1=repite  0=stop
void mp3_q_estado_usb();
void mp3_q_estado_sd();
void mp3_q_estado_flahs();
void mp3_inicializa();
void mp3_retransmite();
void mp3_responder(); //averiguar
void mp3_q_estado();
void mp3_q_volumen();
void mp3_q_equializa();
void mp3_q_play_mode();
void mp3_q_software();
void mp3_q_sd_filas();
void mp3_q_usb_filas();
void mp3_q_flahs_filas();
void mp3_q_on(); //averiguar
void mp3_q_sd_actual();
void mp3_q_usb_actual();
void mp3_q_flahs_actual();



