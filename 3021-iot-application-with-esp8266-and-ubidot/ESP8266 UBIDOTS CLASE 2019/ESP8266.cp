#line 1 "C:/Users/Alcides Ramos/Desktop/ESP8266 UBIDOTS CLASE 2019/ESP8266.c"
#line 1 "c:/users/alcides ramos/desktop/esp8266 ubidots clase 2019/ds18b20.h"
float ds18b20_read(char *puerto,char pin);

char texto1[20];

float ds18b20_read(char *puerto,char pin)
{
unsigned int temp_;
float tempo__;
unsigned char t1_,t2_,td__;
float signo=1.0;
float sensor_temp_;



 Ow_Reset(puerto, pin);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0xCC);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0x44);
 Delay_ms(150);

 Ow_Reset(puerto, pin);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0xCC);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0xBE);
 Delay_ms(1);
 t1_ = Ow_Read(puerto, pin);
 t2_ = Ow_Read(puerto, pin);

 temp_=( (unsigned int)t2_<<8) | t1_;


 if ( t2_ & 0x80)
 {
 temp_=~temp_+1;
 signo=-1.0;
 }
 temp_=temp_>>4;

 td__=t1_ & 0x0f;

 tempo__=0;
 if (td__.b3==1)tempo__=tempo__+0.5;
 if (td__.b2==1) tempo__=tempo__+0.25;
 if (td__.b1==1) tempo__=tempo__+0.125;
 if (td__.b0==1) tempo__=tempo__+0.0625;
 if (signo<0) tempo__=-tempo__;
 sensor_temp_=(temp_*signo)+tempo__;

 return (sensor_temp_);

}
#line 3 "C:/Users/Alcides Ramos/Desktop/ESP8266 UBIDOTS CLASE 2019/ESP8266.c"
sbit sw at RB0_bit;
sbit led1 at LATB6_BIT;
unsigned char tempo;
char error;



char trama_rx[100];
char trama_tx[200];

char trama_cont=0;
char dato_rx;




enum estados_ {normal,cap_l,cap_u,cap_e,cap_co,esp_final} ;

 char estado_rec=normal;




char texto[30];


char flag_ubi=0;

unsigned char largo;
char largo_str[10];
unsigned char led_ubidot;
char captu[30];


float temperatura;
unsigned int suiche_ubi,pwm_ubi;



float grados,minutos;
float latitud;
float longitud;
unsigned int fix;

char trama_GPS[100];
char trama_GPS1[100];

char captu_GPS[30];

char trama_cont_GPS=0;
char dato_rx_GPS;

char c_grados[10];
char c_grados1[10];
char c_s_lat[3];
char c_s_lng[3];





enum estados_GPS {cap_P,cap_G,cap_G2,cap_A,esp_final_GPS} ;

 char estado_rec_GPS=cap_P;





unsigned char espera=1;
unsigned int timer_cont=0,flag_timer=0;





 void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

void soft_Uart_write_text(char *info)
{
 while(*info) Soft_UART_Write(*info++);
}


void soft_Uart_write_text_const(const char *info)
{
 while(*info) Soft_UART_Write(*info++);
}

void Soft_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama,char cuanto)
{
 unsigned int con_t=0;
 char dato;

 while(*(Buffer-1)!=StopChar)
 {
 con_t++;
 dato=Soft_UART_Read(&error);
 *Buffer++=dato;
 if (con_t>=tama) break;
 }
 *--Buffer=0;
}

char tiempo(unsigned int milis, char cap[15], char cap1[15])
{
unsigned int cont1;

estado_rec=normal;
 trama_cont=0;
 memset(trama_rx,0,100);
 RCIF_bit=0;

 CREN_bit=0;
 CREN_bit=1;
 RCIE_bit=1;
 Delay_ms(10);
 for (cont1=1;cont1<=milis;cont1++)
 {
 delay_Ms(1);

 if (strstr(trama_rx,cap)!=0 )
 {
 RCIE_bit=0;
 Delay_ms(10);
 return(1);
 }
 else if (strstr(trama_rx,cap1)!=0 )
 {
 RCIE_bit=0;
 Delay_ms(10);
 return(2);
 }
 }

 RCIE_bit=0;
 return(0);
}


char manda_AT_COMANDO(char *coman, char cap[15], char cap1[15],unsigned int retardo)
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
 sprinti(captu,"%1u",largo);
 UART1_Write_Text(captu);
 Uart1_write_text_const("\r\n");
 Delay_ms(100);
 Uart1_write_text_const(info);
}


void manda_esp8266(char *info)
{
unsigned int largo;
 Uart1_write_text_const("AT+CIPSEND=");
 UART1_Write('4');
 UART1_Write(',');
 largo=strlen(info);
 sprinti(captu,"%1u",largo);
 UART1_Write_Text(captu);
 Uart1_write_text_const("\r\n");
 Delay_ms(100);
 UART1_Write_Text(info);
}

void interrupcion() iv 0x0008 ics ICS_AUTO
 {


 if (RCIF_bit==1)
 {
 dato_rx=RCREG;

 switch (estado_rec)
 {
 case normal:
 trama_rx[trama_cont]=dato_rx;
 trama_cont++;
 if (trama_cont>=100) trama_cont=0;
 break;

 case cap_l:
 trama_rx[trama_cont]=dato_rx;
 if (dato_rx!='l') trama_cont=0;
 else
 {
 trama_cont++;
 estado_rec=cap_u;
 }
 break;

 case cap_u:
 trama_rx[trama_cont]=dato_rx;
 if (dato_rx!='u')
 {
 trama_cont=0;
 estado_rec=cap_l;
 }
 else
 {
 trama_cont++;
 estado_rec=cap_e;
 }
 break;

 case cap_e:
 trama_rx[trama_cont]=dato_rx;
 if (dato_rx!='e')
 {
 trama_cont=0;
 estado_rec=cap_l;
 }
 else
 {
 trama_cont++;
 estado_rec=cap_co;
 }
 break;

 case cap_co:
 trama_rx[trama_cont]=dato_rx;
 if (dato_rx!='\"')
 {
 trama_cont=0;
 estado_rec=cap_l;
 }
 else
 {
 trama_cont++;
 estado_rec=esp_final;
 }
 break;

 case esp_final:
 trama_rx[trama_cont]=dato_rx;
 trama_cont++;

 if (dato_rx==',')
 {
 RCIE_bit=0;
 trama_cont=0;
 estado_rec=normal;
 flag_ubi=1;
 }

 break;

 }

 RCIF_bit=0;
 }




 if (TMR0IF_bit==1)
 {
 TMR0H=72;
 TMR0L=228;

 timer_cont++;

 if (timer_cont>=espera)
 {
 Soft_UART_Break();
 timer_cont=0;
 TMR0IE_bit=0;
 flag_timer=1;
 }
 TMR0IF_bit=0;
 }


 }

 void timer_enable(char tiempo)
 {
 espera=tiempo;
 TMR0H=72;
 TMR0L=228;
 TMR0ON_bit=1;
 TMR0IF_bit=0;
 TMR0IE_bit=1;

 }

char tiempo_rec(unsigned int milis)
{
unsigned int cont1;

 flag_ubi=0;
 estado_rec=cap_l;
 trama_cont=0;
 memset(trama_rx,0,100);
 RCIF_bit=0;

 CREN_bit=0;
 CREN_bit=1;
 RCIE_bit=1;
 Delay_ms(10);
 for (cont1=1;cont1<=milis;cont1++)
 {
 delay_Ms(1);
 if (flag_ubi==1) return(1);
 }
 RCIE_bit=0;
 return(0);
}




 unsigned char conecta()
{
 tempo=manda_AT_COMANDO("AT+CIPSTART=4,\"TCP\",\"things.ubidots.com\",80", "OK", "CONNECT", 10000);
 Delay_ms(2000);
 if ((tempo==1) ||(tempo==2)) return(1);
 else return(0);


}


 void conectar()

 {
 if (conecta()==1)
 {
 memset(trama_tx,0,100);
 sprintf(trama_tx,"{\"led\": %1d,\"temperatura\": %5.2f,\"gps\":{\"lat\":%11.7f, \"lng\":%12.7f}}",(unsigned int)led_ubidot,temperatura,latitud,longitud);
 largo=strlen(trama_tx);
 sprintf(largo_str,"%u\n\n",largo);
 manda_esp8266_const("POST /api/v1.6/devices/pruebas/?token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");

 Delay_ms(1000);

 manda_esp8266(largo_str);
 Delay_ms(500);

 manda_esp8266(trama_tx);
 Delay_ms(5000);


 manda_esp8266_const("GET /api/v1.6/devices/pruebas/suiche/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");

 tempo=tiempo_rec(6000);

 strcpy(captu, strtok(trama_rx, ":"));
 strcpy(captu, strtok(0, ","));

 suiche_ubi=atof(captu);



 manda_esp8266_const("GET /api/v1.6/devices/pruebas/pwm/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");

 tempo=tiempo_rec(6000);

 strcpy(captu, strtok(trama_rx, ":"));
 strcpy(captu, strtok(0, ","));

 pwm_ubi=atof(captu);
 Delay_us(4000);

 manda_AT_COMANDO("AT+CIPCLOSE=4", "OK", "OK", 3000);


 sprintf(texto,"sw=%1d  pwm=%3d\r\n",suiche_ubi,pwm_ubi);
 soft_Uart_write_text(texto);



 Delay_ms(1000);

 }

 }

 char lee_trama_soft()
{

char dato_rx;
unsigned long demora;

memset(trama_GPS,100,0);
trama_cont_GPS=0;
estado_rec_GPS=cap_P;
 flag_timer=0;
 timer_enable(4);

 while (flag_timer==0)
 {
 switch (estado_rec_GPS)
 {
 case cap_P:
 dato_rx_GPS=Soft_UART_Read(&error);
 if (flag_timer==1) return(0);
 trama_GPS[trama_cont_GPS]=dato_rx_GPS;
 if (dato_rx_GPS!='P') trama_cont_GPS=0;
 else
 {
 trama_cont_GPS++;
 estado_rec_GPS=cap_G;
 }

 break;

 case cap_G:
 dato_rx_GPS=Soft_UART_Read(&error);
 if (flag_timer==1) return(0);
 trama_GPS[trama_cont_GPS]=dato_rx_GPS;
 if (dato_rx_GPS!='G')
 {
 trama_cont_GPS=0;
 estado_rec_GPS=cap_P;
 }
 else
 {
 trama_cont_GPS++;
 estado_rec_GPS=cap_G2;
 }


 break;


 case cap_G2:
 dato_rx_GPS=Soft_UART_Read(&error);
 if (flag_timer==1) return(0);
 trama_GPS[trama_cont_GPS]=dato_rx_GPS;
 if (dato_rx_GPS!='G')
 {
 trama_cont_GPS=0;
 estado_rec_GPS=cap_P;
 }
 else
 {
 trama_cont_GPS++;
 estado_rec_GPS=cap_A;
 }

 break;


 case cap_A:

 dato_rx_GPS=Soft_UART_Read(&error);
 if (flag_timer==1) return(0);
 trama_GPS[trama_cont_GPS]=dato_rx_GPS;
 if (dato_rx_GPS!='A')
 {
 trama_cont_GPS=0;
 estado_rec_GPS=cap_P;

 }
 else
 {
 trama_cont_GPS++;
 estado_rec_GPS=esp_final_GPS;
 }


 break;

 case esp_final_GPS:
 dato_rx_GPS=Soft_UART_Read(&error);
 if (flag_timer==1) return(0);
 trama_GPS[trama_cont_GPS]=dato_rx_GPS;
 trama_cont_GPS++;
 if (trama_cont_GPS>=100) trama_cont_GPS=0;
 if (dato_rx_GPS=='*')
 {
 estado_rec_GPS=cap_P;
 timer_cont=0;
 TMR0IF_bit=0;
 TMR0IE_bit=0;
 flag_timer=0;
 return(1);
 }

 break;


 }
 }
 return(0);

}



unsigned char lee_cordenadas()
{


RCIE_bit=0;
 if (lee_trama_soft()==1)
 {


 memset (trama_GPS1,0,100);
 memset (captu_GPS,0,30);

 strcpy(trama_GPS1,trama_GPS);

 strcpy(captu_GPS, strtok(trama_GPS, ","));
 strcpy(captu_GPS, strtok(0, ","));
 strcpy(captu_GPS, strtok(0, ","));
 strcpy(captu_GPS, strtok(0, ","));
 strcpy(captu_GPS, strtok(0, ","));
 strcpy(captu_GPS, strtok(0, ","));
 strcpy(captu_GPS, strtok(0, ","));

 fix=atoi(captu_GPS);
 if ((fix==1) ||(fix==2) )
 {

 strcpy(captu_GPS, strtok(trama_GPS1, ","));
 strcpy(captu_GPS, strtok(0, ","));
 strcpy(captu_GPS, strtok(0, ","));
 memset(c_grados,0,10);
 strncpy(c_grados,captu_GPS,2);
 grados=atof(c_grados);

 minutos=atof(&captu_GPS[2])/60.0;
 latitud=grados+minutos;
 strcpy(captu_GPS, strtok(0, ","));
 if (captu_GPS[0]=='S') latitud=-latitud;


 strcpy(captu_GPS, strtok(0, ","));
 memset(c_grados,0,10);
 strncpy(c_grados,captu_GPS,3);
 grados=atof(c_grados);

 minutos=atof(&captu_GPS[3])/60.0;
 longitud=grados+minutos;
 strcpy(captu_GPS, strtok(0, ","));
 if (captu_GPS[0]=='W') longitud=-longitud;
 CREN_bit=0;
 CREN_bit=1;
 RCIF_bit=0;
 RCIE_bit=1;
 return(1);
 }
 else
 {
 CREN_bit=0;
 CREN_bit=1;
 RCIF_bit=0;
 RCIE_bit=1;
 return(0);
 }

 }
 CREN_bit=0;
 CREN_bit=1;
 RCIF_bit=0;
 RCIE_bit=1;
 return(0);
}

void main()

{
 ADCON1=0B1111;
TRISB=0;
TRISC=0;
TRISC7_bit=1;
TRISB0_bit=1;

UART1_Init(9600);


INTCON=0b01000000;

Soft_UART_Init(&PORTB, 2, 1, 9600, 0);


 RCIF_bit=0;
 RCIE_bit=0;

 LATB=0;



 T0CON=0;
 TMR0ON_bit=0;
 TMR0H=72;
 TMR0L=228;

 T0PS2_bit=1;
 T0PS1_bit=1;
 T0PS0_bit=1;

 TMR0IF_bit=0;
 TMR0IE_bit=0;


 GIE_bit=1;


 RCEN_bit=0;
 RCEN_bit=1;


 manda_AT_COMANDO("ATE1","OK", "ERROR", 500);
 manda_AT_COMANDO("AT+CWMODE=1","OK", "no change", 1000);
 manda_AT_COMANDO("AT+CWJAP=\"Familia_Ramos_Zambrano\",\"forever17\"","OK","OK",10000);
 manda_AT_COMANDO("AT+CIPMUX=1","OK","OK",1000);
 manda_AT_COMANDO("AT+CIFSR","OK","OK",1000);

 temperatura=ds18b20_read(&portb,7);

 Delay_ms(1000);
 while (1)
 {
 temperatura=ds18b20_read(&portb,7);

 led_ubidot=sw;


 if (lee_cordenadas()==1) conectar();
 led1=suiche_ubi;
 Delay_ms(2000);

 }


}
