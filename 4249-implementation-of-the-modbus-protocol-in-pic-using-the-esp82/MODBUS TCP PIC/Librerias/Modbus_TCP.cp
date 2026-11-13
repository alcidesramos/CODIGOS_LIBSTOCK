#line 1 "C:/Users/Alcides Ramos/Desktop/MODBUS TCP PIC/Librerias/Modbus_TCP.c"
#line 1 "c:/users/alcides ramos/desktop/modbus tcp pic/librerias/modbus_tcp.h"


extern char modbus_rx[];
extern char modbus_tx[];

extern unsigned char rec_largo;
extern unsigned char rec_socket;


void modbus_write_holding(unsigned int dir_mod, unsigned int dat_mod);
void modbus_write_holding_varios(unsigned int dir_mod, unsigned int *buff_datos,unsigned int cuantos);
void modbus_write_digitalcoils(unsigned int dir_mod, unsigned int dat_dig);
void modbus_read_analog(unsigned int dir_mod, unsigned int cuantos);
#line 1 "c:/users/alcides ramos/desktop/modbus tcp pic/librerias/esp8266.h"



extern char modbus_rx[];
extern char modbus_tx[];




void Uart1_write_text_const(const char *info);
char tiempo(unsigned int milis, char cap[30], char cap1[30]);
void esp82666_interrupcion();
char manda_AT_COMANDO(char *coman, char cap[30], char cap1[30],unsigned int retardo);
unsigned long strlen_const(const char *const_pun);
void manda_esp8266_const(const char *info);
void manda_esp8266(char *info);
void manda_esp8266_bytes(unsigned char *info,unsigned int largo);
unsigned char conecta(char *ip_dir);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 8 "C:/Users/Alcides Ramos/Desktop/MODBUS TCP PIC/Librerias/Modbus_TCP.c"
char modbus_rx[50];
char modbus_tx[50];

unsigned int tamano;
extern char estado_rec;



void modbus_write_holding(unsigned int dir_mod, unsigned int dat_mod)
{
 RCIE_bit=0;
 modbus_tx[0]=0;
 modbus_tx[1]=0;
 modbus_tx[2]=0;
 modbus_tx[3]=00;
 modbus_tx[4]=00;;

 modbus_tx[5]=6;
 modbus_tx[6]= 1 ;
 modbus_tx[7]=6;

 modbus_tx[8]= ((char *)&dir_mod)[1] ;
 modbus_tx[9]= ((char *)&dir_mod)[0] ;

 modbus_tx[10]= ((char *)&dat_mod)[1] ;
 modbus_tx[11]= ((char *)&dat_mod)[0] ;

 manda_esp8266_bytes(modbus_tx,12);

}

void modbus_write_holding_varios(unsigned int dir_mod, unsigned int *buff_datos,unsigned int cuantos)
{
 unsigned char cuent1;
 RCIE_bit=0;
 modbus_tx[0]=0;
 modbus_tx[1]=0;
 modbus_tx[2]=0;
 modbus_tx[3]=00;
 modbus_tx[4]=00;;

 modbus_tx[5]=7+cuantos*2;
 modbus_tx[6]= 1 ;
 modbus_tx[7]=0x10;

 modbus_tx[8]= ((char *)&dir_mod)[1] ;
 modbus_tx[9]= ((char *)&dir_mod)[0] ;

 modbus_tx[10]= ((char *)&cuantos)[1] ;
 modbus_tx[11]= ((char *)&cuantos)[0] ;

 modbus_tx[12]=2*cuantos;
 for(cuent1=13;cuent1<12+2*cuantos;cuent1++)
 {
 modbus_tx[cuent1]= ((char *)&*buff_datos)[1] ;
 cuent1++;
 modbus_tx[cuent1]= ((char *)&*buff_datos++)[0] ;

 }

 manda_esp8266_bytes(modbus_tx,17);
}

void modbus_write_digitalcoils(unsigned int dir_mod, unsigned int dat_dig)
{
 RCIE_bit=0;
 modbus_tx[0]=0;
 modbus_tx[1]=0;
 modbus_tx[2]=0;
 modbus_tx[3]=00;
 modbus_tx[4]=00;;

 modbus_tx[5]=9;
 modbus_tx[6]= 1 ;
 modbus_tx[7]=0x0f;

 modbus_tx[8]= ((char *)&dir_mod)[1] ;
 modbus_tx[9]= ((char *)&dir_mod)[0] ;

 modbus_tx[10]=00;
 modbus_tx[11]=0x0f;
 modbus_tx[12]=02;
 modbus_tx[13]= ((char *)&dat_dig)[0] ;
 modbus_tx[14]= ((char *)&dat_dig)[1] ;

 manda_esp8266_bytes(modbus_tx,15);

}


void modbus_read_analog(unsigned int dir_mod, unsigned int cuantos)
{
 unsigned char cuent1;
 tamano=cuantos;
 modbus_tx[0]=0;
 modbus_tx[1]=0;
 modbus_tx[2]=0;
 modbus_tx[3]=00;
 modbus_tx[4]=00;;

 modbus_tx[5]=2+cuantos*2;
 modbus_tx[6]= 1 ;
 modbus_tx[7]=0x4;

 modbus_tx[8]= ((char *)&dir_mod)[1] ;
 modbus_tx[9]= ((char *)&dir_mod)[0] ;

 modbus_tx[10]= ((char *)&cuantos)[1] ;
 modbus_tx[11]= ((char *)&cuantos)[0] ;



 estado_rec=1;
 RCIF_bit=0;

 CREN_bit=0;
 CREN_bit=1;
 RCIE_bit=1;
 manda_esp8266_bytes(modbus_tx,12);


}
