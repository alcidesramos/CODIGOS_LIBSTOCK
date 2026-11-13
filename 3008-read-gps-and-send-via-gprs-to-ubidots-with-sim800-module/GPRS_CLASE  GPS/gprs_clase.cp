#line 1 "C:/Users/Alcides Ramos/Desktop/GPRS_CLASE/gprs_clase.c"
sbit pin_on at LATB0_BIT;
sbit led1 at LATB7_BIT;
sbit led2 at LATB6_BIT;
unsigned char tempo;
char cuenta_on=0;

char error;



char trama_rx[100];
char trama_tx[200];

char trama_cont=0;
char dato_rx;

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





void soft_Uart_write_text(char *info)
{
 while(*info) Soft_UART_Write(*info++);
}





char tiempo(unsigned int milis, char cap[15], char cap1[15])
{
unsigned int cont1;


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


unsigned char prendio()
{
 Delay_ms(2000);


 if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);

 else{
 pin_on=0;
 Delay_ms(1000);
 pin_on=1;
 Delay_ms(2000);
 pin_on=0;
 Delay_ms(2000);

 if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
 else return(0);
 }
}




void interrupcion() iv 0x0008 ics ICS_AUTO
 {

 if (RCIF_bit==1)
 {
 dato_rx=RCREG;
 trama_rx[trama_cont]=dato_rx;
 trama_cont++;
 if (trama_cont>=100) trama_cont=0;
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



void config_gprs()
{

hoy :


 manda_AT_COMANDO("AT+CIPSHUT","OK", "ERROR", 2000);


 tempo=manda_AT_COMANDO("AT+CIPMUX=0", "OK", "ERROR", 4000);
 if (tempo!=1) goto hoy;


 tempo=manda_AT_COMANDO("AT+CIPSTATUS", "IP INITIAL", "ERROR", 500);
 if (tempo!=1) goto hoy;



 tempo=manda_AT_COMANDO("AT+CSTT=\"lte.avantel.com.co\",\"\",\"\"", "OK", "ERROR", 30000);
 if (tempo!=1) goto hoy;


 manda_AT_COMANDO("AT+CGQMIN= 1,0,0,0,0,0", "OK", "OK", 500);
 manda_AT_COMANDO("AT+CGQREQ= 1,0,0,3,0,0", "OK", "OK", 500);


 manda_AT_COMANDO("AT+CMGF=1", "OK", "OK", 500);


 manda_AT_COMANDO("AT+CNMI=1,1,2,1,0", "OK", "OK", 500);


 while(manda_AT_COMANDO("AT+CIPSTATUS", "START", "ERROR", 3000) == 0 );
 Delay_ms(2000);


 tempo=manda_AT_COMANDO("AT+CIICR", "OK", "ERROR", 30000);
 if (tempo!=1) goto hoy;

 while (tempo=manda_AT_COMANDO("AT+CIPSTATUS", "GPRSACT", "ERROR", 6000)==0);
 Delay_ms(2000);


 tempo=manda_AT_COMANDO("AT+CIFSR", ".", "ERROR", 10000);
 if (tempo!=1) goto hoy;
 Delay_ms(3000);
 }


 unsigned char conecta()
{
 tempo=manda_AT_COMANDO("AT+CIPSTART=" "\"TCP\"" "," "\"things.ubidots.com\"" "," "\"80\"", "CONNECT OK", "ALREADY CONNECT", 10000);

 Delay_ms(2000);
 if ((tempo==1) ||(tempo==2)) return(1);
 else return(0);


}


 unsigned char conectar()

 {
 if (conecta()==1)
 {

 tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",5000);
 Delay_ms(500);

 memset(trama_tx,0,100);

 sprintf(trama_tx,"{\"led\": %1d,\"temperatura\": %5.2f,\"gps\":{\"lat\":%11.7f, \"lng\":%12.7f}}",(unsigned int)led_ubidot,temperatura,latitud,longitud);
 largo=strlen(trama_tx);

 sprintf(largo_str,"%u\n\n",largo);
 Uart1_write_text_const("POST /api/v1.6/devices/pruebas/?token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
 UART1_Write_Text(largo_str);
 Uart1_write_text(trama_tx);


 Delay_ms(4000);
 tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",4000);
 Delay_ms(5000);
#line 325 "C:/Users/Alcides Ramos/Desktop/GPRS_CLASE/gprs_clase.c"
 tempo=manda_AT_COMANDO("AT+CIPCLOSE", "CLOSE OK", "ERROR",4000);
 Delay_ms(1000);


 sprintf(texto,"sw=%1d  pwm=%3d\r\n",suiche_ubi,pwm_ubi);
 UART1_Write_Text(texto);
 Delay_ms(1000);
 if (tempo!=1) return(2);
 return(1);
 }
 else return(0);
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

void manda_mensaje()
{
Uart1_write_text_const("AT+CMGF=1\r\n");
Delay_ms(1000);
Uart1_write_text_const("AT+CMGS=" "\"3205481022\"\r\n");
Delay_ms(3000);
Uart1_write_text_const("ALERTA\r\n");
Delay_ms(1000);
 Uart1_write_text_const("\x1A\r\n");
Delay_ms(3000);
}



void main()
 {
 ADCON1=0B1111;
TRISB=0;
TRISC=0;
TRISC7_bit=1;

UART1_Init(9600);
pin_on=0;

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

 cuenta_on=0;
 while ((prendio()==0) || (cuenta_on>=10)) cuenta_on++;
 config_gprs();
 led_ubidot=1;
 temperatura=25.63;
 latitud=10.3997200;
 longitud=-75.4920880;

 while (1)
 {
 if (lee_cordenadas()==1) conectar();
 Delay_ms(5000);

 }


 }
