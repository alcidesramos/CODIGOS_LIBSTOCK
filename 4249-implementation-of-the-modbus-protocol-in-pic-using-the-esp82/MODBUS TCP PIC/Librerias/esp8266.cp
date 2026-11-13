#line 1 "C:/Users/Alcides Ramos/Desktop/MODBUS TCP PIC/Librerias/esp8266.c"
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
#line 3 "C:/Users/Alcides Ramos/Desktop/MODBUS TCP PIC/Librerias/esp8266.c"
extern sfr sbit led1;
extern sfr sbit led2;

char trama_cont=0;
unsigned char dato_rx;

char captu1[30];


enum estados_ {normal,cap_i,cap_p,cap_d,cap_co,cap_co2,cap_largo,esp_final} ;

 char estado_rec=normal;

extern unsigned int tamano;
unsigned char rec_largo[4];
unsigned char rec_socket[1];
unsigned char *rec_punte;
unsigned char *buff_punte;
unsigned int rec_son;
unsigned char flag_modbus=0;


int atoi_(char* cadena)
{
 int respuesta = 0;
 int i;

 for (i = 0; cadena[i] != '\0'; ++i)
 respuesta = respuesta * 10 + cadena[i] - '0';
 return respuesta;
}

void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}


char tiempo(unsigned int milis, char cap[30], char cap1[30])
{
unsigned int cont1;
estado_rec=normal;
 trama_cont=0;
 memset(modbus_rx,0,50);
 RCIF_bit=0;

 CREN_bit=0;
 CREN_bit=1;
 RCIE_bit=1;
 Delay_ms(50);


 for (cont1=1;cont1<=milis;cont1++)
 {
 delay_Ms(1);

 if (strstr(modbus_rx,cap))
 {
 RCIE_bit=0;
 Delay_ms(10);
 return(1);
 }
 else if (strstr(modbus_rx,cap1) )
 {
 RCIE_bit=0;
 Delay_ms(10);
 return(2);
 }
 }

 RCIE_bit=0;
 return(0);
}


void esp82666_interrupcion()
{

 if (RCIF_bit==1)
 { dato_rx=RCREG;

 switch (estado_rec)
 {
 case normal:
 modbus_rx[trama_cont]=dato_rx;
 trama_cont++;
 if (trama_cont>=50) trama_cont=0;
 break;

 case cap_i:

 if (dato_rx!='I') trama_cont=0;
 else
 {

 estado_rec=cap_p;
 }

 case cap_p:


 if (dato_rx!='P')
 {
 trama_cont=0;
 estado_rec=cap_i;

 }
 else
 {

 estado_rec=cap_d;
 }

 break ;


 case cap_d:

 if (dato_rx!='D')
 {
 trama_cont=0;
 estado_rec=cap_i;

 }
 else
 {

 estado_rec=cap_co;
 }

 break ;

 case cap_co:

 if (dato_rx!=',')
 {
 trama_cont=0;
 estado_rec=cap_i;

 }
 else
 {




 trama_cont=0;
 estado_rec=cap_co2;

 }

 break ;


 case cap_co2:


 if (dato_rx==',')
 {
 estado_rec=cap_largo;
 trama_cont=0;
 }
 else
 {
 trama_cont++;
 if (trama_cont>50)
 { trama_cont=0;
 estado_rec=cap_i;
 }
 }

 break ;

 case cap_largo:

 if (dato_rx==':')
 {
 trama_cont=0;
 rec_son=13;
 estado_rec=esp_final;
 }
 else
 {
 modbus_rx[trama_cont]=dato_rx;
 trama_cont++;
 if (trama_cont>50)
 { trama_cont=0;
 estado_rec=cap_i;
 }
 }
 break ;


 case esp_final:
 led1=!led1;
 modbus_rx[trama_cont]=dato_rx;
 trama_cont++;
 if (trama_cont>=rec_son)


 {
 trama_cont=0;
 estado_rec=normal;
 flag_modbus=1;
 led2=1;
 RCIE_bit=0;

 }
 break;


 }


 RCIF_bit=0;


 }

 }

char manda_AT_COMANDO(char *coman, char cap[30], char cap1[30],unsigned int retardo)
{

 Uart1_write_text(coman);
 Uart1_write_text_const("\r\n");
 return (tiempo(retardo,cap,cap1));
 }


unsigned long strlen_const(const char *const_pun)
{
 unsigned int cuen_const=0;

 while (*const_pun++!=0) cuen_const++;
 return (cuen_const);

}
 void manda_esp8266_const(const char *info)
{
unsigned int largo;
 Uart1_write_text_const("AT+CIPSEND=");
 UART1_Write('4');
 UART1_Write(',');
 largo=strlen_const(info);
 sprinti(captu1,"%1u",largo);
 UART1_Write_Text(captu1);
 Uart1_write_text_const("\r\n");
 Delay_ms(50);
 Uart1_write_text_const(info);
 Delay_ms(100);

}


void manda_esp8266(char *info)
{
unsigned int largo;
 Uart1_write_text_const("AT+CIPSEND=");
 UART1_Write('4');
 UART1_Write(',');
 largo=strlen(info);
 sprinti(captu1,"%1u",largo);
 UART1_Write_Text(captu1);
 Uart1_write_text_const("\r\n");
 Delay_ms(50);
 UART1_Write_Text(info);
 Delay_ms(100);

}


void manda_esp8266_bytes(unsigned char *info,unsigned int largo)
{
 unsigned char cuenta;

 Uart1_write_text_const("AT+CIPSEND=");
 UART1_Write('4');
 UART1_Write(',');
 sprinti(captu1,"%1u",largo);
 UART1_Write_Text(captu1);
 Uart1_write_text_const("\r\n");
 Delay_ms(50);
 for (cuenta=0;cuenta<largo;cuenta++) UART1_Write(*info++);
 Delay_ms(50);

}




 unsigned char conecta(char *ip_dir)
{
unsigned char tempo;
memset(modbus_tx,0,50);
sprintf(modbus_tx,"AT+CIPSTART=4,\"TCP\",\"%s\",502",ip_dir);

 manda_AT_COMANDO("AT+CIPMUX=1\r\n","OK","OK",500);
 Delay_ms(300);
 tempo=manda_AT_COMANDO(modbus_tx, "OK", "CONNECT", 10000);
 Delay_ms(2000);
 if ((tempo==1) ||(tempo==2)) return(1);
 manda_AT_COMANDO("AT+CIPMUX=1\r\n","OK","OK",500);
 Delay_ms(300);
 tempo=manda_AT_COMANDO(modbus_tx, "OK", "Linked", 10000);
 Delay_ms(2000);

 if ((tempo==1) ||(tempo==2)) return(1);
 else return(0);


}
