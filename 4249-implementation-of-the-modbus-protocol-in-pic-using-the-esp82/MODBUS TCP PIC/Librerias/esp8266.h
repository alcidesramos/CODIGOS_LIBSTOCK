

// variables para uart
extern char modbus_rx[];
extern char modbus_tx[];




void Uart1_write_text_const(const char *info);
char tiempo(unsigned int milis, char cap[30], char cap1[30]);// espera un tiempo hasta que lelgue la info solicitada
void esp82666_interrupcion();   // proceso de interrpcion del esp8266
char manda_AT_COMANDO(char *coman, char cap[30], char cap1[30],unsigned int retardo); //envia un comando at
unsigned long strlen_const(const char *const_pun);     //calcula el largo de una costante
void manda_esp8266_const(const char *info); // manda un string cosntante
void manda_esp8266(char *info);    // manda un string de una variable
void manda_esp8266_bytes(unsigned char *info,unsigned int largo);
unsigned char conecta(char *ip_dir);// dice si se conecta al servidor





