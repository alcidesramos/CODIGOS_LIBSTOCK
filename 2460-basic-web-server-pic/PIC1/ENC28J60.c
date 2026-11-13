// duplex config flags
#define Spi_Ethernet_HALFDUPLEX     0x00  // half duplex
#define Spi_Ethernet_FULLDUPLEX     0x01  // full duplex

//pines del ENC28j60
sfr sbit SPI_Ethernet_Rst at LATC1_bit;
sfr sbit SPI_Ethernet_CS  at LATC0_bit;
sfr sbit SPI_Ethernet_Rst_Direction at TRISC1_bit;
sfr sbit SPI_Ethernet_CS_Direction  at TRISC0_bit;

// TCP flags
typedef struct {
  unsigned canCloseTCP: 1;  // flag which closes TCP socket (not relevant to UDP)
  unsigned isBroadcast: 1;  // flag which denotes that the IP package has been received via subnet broadcast address (not used for PIC16 family)
} TEthPktFlags;

//ROM constant strings
const char httpHeader[] = "HTTP/1.1 200 OK\nContent-type: ";  // cabecera HTTP
const char httpMimeTypeHTML[] = "text/html\n\n";              // cabecera de pagina completa
const char httpMimeTypeScript[] = "text/plain\n\n";           // cabecera de actuaizacion de solo variables

unsigned codigo;
float temperatura,voltaje;

char   trama_rx[30];                                        // trama de recepcion
char   trama_tx[30];                                              // trama de envio


sbit pulsador1 at RB0_bit;
sbit pulsador2 at RB1_bit;

sbit led_amarillo at LATB7_bit;
sbit led_rojo at LATB6_bit;
const   char    pagina1[] =                   // ponga lai p del modulo para refrescar la pagina
"<meta http-equiv=\"refresh\" content=\"3;url=http://192.168.0.37\">\
<HTML><HEAD></HEAD><BODY>\
<script src=/$></script>\
<title>MI SERVIDOR WEB</title>\
</head>\
<body>\
<p align=""center""><font color=""#ff0000"" size=""7"">MI SERVIDOR WEB</font></p>\
<div align=""center"">\
<table border=""1"" width=""27%"">\
<tbody>\
<tr>\
<td width=""207""><b><font color=""#800080"">VOLTAJE=</font></b></td>\
<td bgcolor=""#ffff00"" width=""87""><script>document.write(volt)</script></td>\
</tr>\
<tr>\
<td width=""207""><b><font color=""#800080"">TEMPERATURA=</font></b></td>\
<td bgcolor=""#ffff00"" width=""87""><script>document.write(temp)</script></td>\
</tr>\
<tr>\
<td width=""207""><b><font color=""#800080"">PULSADOR1=</font></b></td>\
<td bgcolor=""#ffff00"" width=""87""><script>document.write(pul1)</script></td>\
</tr>\
<tr>\
<td valign=""top""><b><font color=""#800080"">PULSADOR2=</font></b></td>\
<td valign=""top""><script>document.write(pul2)</script><br>\
";

const   char    pagina2[] =
"</td>\
</tr>\
</tbody>\
</table>\
<p>&nbsp;</p>\
<table border=""1"" width=""21%"">\
<tbody>\
<tr>\
<td rowspan=""2"" width=""120""><font color=""#800080"">LED AMARRILO</font></td>\
<td bgcolor=""#ff6666""><a href=""led1=on*"">ENCENDER</a></td>\
</tr>\
<tr>\
<td bgcolor=""silver""><a href=""led1=off*"">APAGAR</a></td>\
</tr>\
<tr>\
<td rowspan=""2"" width=""120""><font color=""#800080"">LED ROJO</font></td>\
<td bgcolor=""#ff6666""><a href=""led2=on*"">ENCENDER</a></td>\
</tr>\
<tr>\
<td bgcolor=""silver""><a href=""led2=off*"">APAGAR</a></td>\
</tr>\
</tbody>\
</table>\
</div>\
</body>\
</html>\
";

// RAM variables
unsigned char   myMacAddr[6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3f};   // direccion MAC del modulo
unsigned char   myIpAddr[4]  = {192, 168,  0, 37 };                   // Direccion ip del modulo
//unsigned char   gwIpAddr[4]  = {192, 168,  0,  1 };                   // gateway (router) IP address
//unsigned char   ipMask[4]    = {255, 255, 255,  0 };                   // Mascara de red
//unsigned char   dnsIpAddr[4] = {192, 168,  0,  1 };                   // servidor DNS


#define putConstString  SPI_Ethernet_putConstString
#define putString  SPI_Ethernet_putString
unsigned int  SPI_Ethernet_UserTCP(unsigned char *remoteHost, unsigned int remotePort,
                               unsigned int localPort, unsigned int reqLength, TEthPktFlags *flags) {
  unsigned int  largo= 0;   //bandera de html o javascrit
  unsigned int    cuent ;                         // contador

if(localPort != 80) {                        //solo recibe del puerto 80
    return(0) ;
  }
  
  //obtiene solo  los 30 primeros datos que manda la pagina
  for(cuent = 0 ; cuent < 30 ; cuent++) {
    trama_rx[cuent] = SPI_Ethernet_getByte() ;
  }
  trama_rx[cuent] = 0 ; //agraga final de linea
  
  if(memcmp(trama_rx, "GET /", 5)) {      // solo recibe peticiones tipo get
    return(0) ;
  }
   UART1_Write_Text(trama_rx);  //manda por puerto seriallo recibido

//si solo solicita actualizacion de variables
  if(trama_rx[5] == '$')
  {

   largo= putConstString(httpHeader) ;       // Manda cabeza http
   largo+= putConstString(httpMimeTypeScript); // manda cabecera java

   //manda la variable de voltaje
     sprintf(trama_tx,"var volt=%.2f;", voltaje);
    largo+= putString(trama_tx) ;

    //manda la tempertura
       //manda la variable de voltaje
     sprintf(trama_tx,"var temp=%.2f;", temperatura);
     largo+=putString(trama_tx) ;
    //manda el 1 pulsador
    if (pulsador1==0)   largo+=putConstString("var pul1=\"ON\";") ;
    else largo+=putConstString("var pul1=\"OFF\";") ;

   //manda el 2 pulsador
    if (pulsador2==0)   largo+=putConstString("var pul2=\"ON\";") ;
    else largo+=putConstString("var pul2=\"OFF\";") ;


  }

    //analiza ordenes recibidas desde la pagina
  if (strstr(trama_rx,"led1="))
  {
     if (strstr(trama_rx,"on"))  led_amarillo=1;
     else led_amarillo=0;
  }
  else if (strstr(trama_rx,"led2="))
  {
     if (strstr(trama_rx,"on"))  led_rojo=1;
     else led_rojo=0;
  }





    if(largo == 0)
  {
    largo+=putConstString(httpHeader) ;       // manda cabecera
    largo+=putConstString(httpMimeTypeHTML);  // tipo html
    largo+=putConstString(pagina1) ;        // manda primera parte de la pagina
    largo+=putConstString(pagina2) ;        // manda segunda parte de la pagina
  }
  return(largo) ;
}

unsigned int  SPI_Ethernet_UserUDP(unsigned char *remoteHost, unsigned int remotePort,
                                   unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags) {
   return 0;              //no implementado UDP
}



void main() 
{
//confifora el oscilador
  OSCCON=0;
  OSCTUNE=0;
  PLLEN_bit=1; //activa pll por 4 entonces 8Mhz*4 =32
//todo digital.
  ANSEL=0;
  ANSELH=0;
  trisa.B0=1; //entrada voltaje
  trisa.B1=1; //entrada temperatura

  ANSEL.B0=1; //entrada analoga voltaje
  ANSEL.B1=1; //entrada analoga temperatura

  trisc.B6=0; //salida tx
  //habilita pull up

    //entrada de los pulsadores
    TRISB0_bit=1;
    TRISB1_bit=1;

   //salida los leds
    TRISB6_bit=0;
    TRISB7_bit=0;

    led_amarillo=0;
    led_rojo=0;


   RBPU_bit=0; //habilita piull up


  UART1_Init(115200);//inicia puerto serial
  UART1_Write_Text("OK INICIANDO\r\n");

  SPI1_Init();//INICA SPI
  //CONFIGURA ENC28J60
  SPI_Ethernet_Init(myMacAddr, myIpAddr, Spi_Ethernet_FULLDUPLEX) ;
  
   while(1)
   {
   //lee el voltaje
   codigo=ADC_Read(0);
   voltaje=codigo*5.0/1023.0;
   //lee la temperatura
   codigo=ADC_Read(1);
   temperatura=codigo*500.0/1023.0;
   SPI_Ethernet_doPacket() ;   // procesa paquetes ethetnet.
   
   }


}