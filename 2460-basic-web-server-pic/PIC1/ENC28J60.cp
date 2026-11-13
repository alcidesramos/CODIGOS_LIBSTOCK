#line 1 "C:/Users/Alcides_Ramos/Desktop/Ethernet/PIC1/ENC28J60.c"





sfr sbit SPI_Ethernet_Rst at LATC1_bit;
sfr sbit SPI_Ethernet_CS at LATC0_bit;
sfr sbit SPI_Ethernet_Rst_Direction at TRISC1_bit;
sfr sbit SPI_Ethernet_CS_Direction at TRISC0_bit;


typedef struct {
 unsigned canCloseTCP: 1;
 unsigned isBroadcast: 1;
} TEthPktFlags;


const char httpHeader[] = "HTTP/1.1 200 OK\nContent-type: ";
const char httpMimeTypeHTML[] = "text/html\n\n";
const char httpMimeTypeScript[] = "text/plain\n\n";

unsigned codigo;
float temperatura,voltaje;

char trama_rx[30];
char trama_tx[30];


sbit pulsador1 at RB0_bit;
sbit pulsador2 at RB1_bit;

sbit led_amarillo at LATB7_bit;
sbit led_rojo at LATB6_bit;
const char pagina1[] =
#line 60 "C:/Users/Alcides_Ramos/Desktop/Ethernet/PIC1/ENC28J60.c"
"<meta http-equiv=\"refresh\" content=\"3;url=http://192.168.0.37\"><HTML><HEAD></HEAD><BODY><script src=/$></script><title>MI SERVIDOR WEB</title></head><body><p align=""center""><font color=""#ff0000"" size=""7"">MI SERVIDOR WEB</font></p><div align=""center""><table border=""1"" width=""27%""><tbody><tr><td width=""207""><b><font color=""#800080"">VOLTAJE=</font></b></td><td bgcolor=""#ffff00"" width=""87""><script>document.write(volt)</script></td></tr><tr><td width=""207""><b><font color=""#800080"">TEMPERATURA=</font></b></td><td bgcolor=""#ffff00"" width=""87""><script>document.write(temp)</script></td></tr><tr><td width=""207""><b><font color=""#800080"">PULSADOR1=</font></b></td><td bgcolor=""#ffff00"" width=""87""><script>document.write(pul1)</script></td></tr><tr><td valign=""top""><b><font color=""#800080"">PULSADOR2=</font></b></td><td valign=""top""><script>document.write(pul2)</script><br>";

const char pagina2[] =
#line 89 "C:/Users/Alcides_Ramos/Desktop/Ethernet/PIC1/ENC28J60.c"
"</td></tr></tbody></table><p>&nbsp;</p><table border=""1"" width=""21%""><tbody><tr><td rowspan=""2"" width=""120""><font color=""#800080"">LED AMARRILO</font></td><td bgcolor=""#ff6666""><a href=""led1=on*"">ENCENDER</a></td></tr><tr><td bgcolor=""silver""><a href=""led1=off*"">APAGAR</a></td></tr><tr><td rowspan=""2"" width=""120""><font color=""#800080"">LED ROJO</font></td><td bgcolor=""#ff6666""><a href=""led2=on*"">ENCENDER</a></td></tr><tr><td bgcolor=""silver""><a href=""led2=off*"">APAGAR</a></td></tr></tbody></table></div></body></html>";


unsigned char myMacAddr[6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3f};
unsigned char myIpAddr[4] = {192, 168, 0, 37 };







unsigned int SPI_Ethernet_UserTCP(unsigned char *remoteHost, unsigned int remotePort,
 unsigned int localPort, unsigned int reqLength, TEthPktFlags *flags) {
 unsigned int largo= 0;
 unsigned int cuent ;

if(localPort != 80) {
 return(0) ;
 }


 for(cuent = 0 ; cuent < 30 ; cuent++) {
 trama_rx[cuent] = SPI_Ethernet_getByte() ;
 }
 trama_rx[cuent] = 0 ;

 if(memcmp(trama_rx, "GET /", 5)) {
 return(0) ;
 }
 UART1_Write_Text(trama_rx);


 if(trama_rx[5] == '$')
 {

 largo=  SPI_Ethernet_putConstString (httpHeader) ;
 largo+=  SPI_Ethernet_putConstString (httpMimeTypeScript);


 sprintf(trama_tx,"var volt=%.2f;", voltaje);
 largo+=  SPI_Ethernet_putString (trama_tx) ;



 sprintf(trama_tx,"var temp=%.2f;", temperatura);
 largo+= SPI_Ethernet_putString (trama_tx) ;

 if (pulsador1==0) largo+= SPI_Ethernet_putConstString ("var pul1=\"ON\";") ;
 else largo+= SPI_Ethernet_putConstString ("var pul1=\"OFF\";") ;


 if (pulsador2==0) largo+= SPI_Ethernet_putConstString ("var pul2=\"ON\";") ;
 else largo+= SPI_Ethernet_putConstString ("var pul2=\"OFF\";") ;


 }


 if (strstr(trama_rx,"led1="))
 {
 if (strstr(trama_rx,"on")) led_amarillo=1;
 else led_amarillo=0;
 }
 else if (strstr(trama_rx,"led2="))
 {
 if (strstr(trama_rx,"on")) led_rojo=1;
 else led_rojo=0;
 }





 if(largo == 0)
 {
 largo+= SPI_Ethernet_putConstString (httpHeader) ;
 largo+= SPI_Ethernet_putConstString (httpMimeTypeHTML);
 largo+= SPI_Ethernet_putConstString (pagina1) ;
 largo+= SPI_Ethernet_putConstString (pagina2) ;
 }
 return(largo) ;
}

unsigned int SPI_Ethernet_UserUDP(unsigned char *remoteHost, unsigned int remotePort,
 unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags) {
 return 0;
}



void main()
{

 OSCCON=0;
 OSCTUNE=0;
 PLLEN_bit=1;

 ANSEL=0;
 ANSELH=0;
 trisa.B0=1;
 trisa.B1=1;

 ANSEL.B0=1;
 ANSEL.B1=1;

 trisc.B6=0;



 TRISB0_bit=1;
 TRISB1_bit=1;


 TRISB6_bit=0;
 TRISB7_bit=0;

 led_amarillo=0;
 led_rojo=0;


 RBPU_bit=0;


 UART1_Init(115200);
 UART1_Write_Text("OK INICIANDO\r\n");

 SPI1_Init();

 SPI_Ethernet_Init(myMacAddr, myIpAddr,  0x01 ) ;

 while(1)
 {

 codigo=ADC_Read(0);
 voltaje=codigo*5.0/1023.0;

 codigo=ADC_Read(1);
 temperatura=codigo*500.0/1023.0;
 SPI_Ethernet_doPacket() ;

 }


}
