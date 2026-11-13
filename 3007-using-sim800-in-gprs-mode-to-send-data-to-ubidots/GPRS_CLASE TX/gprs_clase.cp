#line 1 "C:/Users/Alcides Ramos/Desktop/GPRS_CLASE - tx/gprs_clase.c"
sbit pin_on at LATB0_BIT;
sbit led1 at LATB7_BIT;
sbit led2 at LATB6_BIT;
unsigned char tempo;
char cuenta_on=0;


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



void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
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
#line 242 "C:/Users/Alcides Ramos/Desktop/GPRS_CLASE - tx/gprs_clase.c"
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
 while ((prendio()==0) || (cuenta_on>=10)) cuenta_on++;
 config_gprs();
 led_ubidot=1;
 temperatura=25.63;
 latitud=10.3997200;
 longitud=-75.4920880;

 while (1)
 {
 conectar();
 Delay_ms(5000);

 }


 }
