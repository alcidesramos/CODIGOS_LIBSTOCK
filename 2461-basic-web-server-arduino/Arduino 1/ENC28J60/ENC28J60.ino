#include <SPI.h>
#include <UIPEthernet.h>
//DIRECCION MAC
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
//DIRECCION IP DEL MODULO
IPAddress ip(192,168,0,37);
#define mandame(x) (__FlashStringHelper*)(x)


//INICIA EL SEVIOR EN EL PUERTO 80
EthernetServer server(80);

//ROM constant strings
const  char httpHeader[] = "HTTP/1.1 200 OK\nContent-type: ";  // cabecera HTTP
const  char httpMimeTypeHTML[] = "text/html\n\n";              // cabecera de pagina completa
const  char httpMimeTypeScript[] = "text/plain\n\n";           // cabecera de actuaizacion de solo variables
unsigned codigo;
float temperatura,voltaje;

#define pulsador1 9
#define pulsador2 8

#define led_amarillo 4
#define led_rojo 3

char   trama_rx[30]; // trama de recepcion
char   trama_tx[30];  // trama de envio
char cuent; //contador

// ponga la ip del modulo para refrescar la pagina
const char pagina1[] PROGMEM  =
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
" ;

const char pagina2[]  PROGMEM =
"<td bgcolor=""#ffff00"" width=""87""><script>document.write(pul1)</script></td>\
</tr>\
<tr>\
<td valign=""top""><b><font color=""#800080"">PULSADOR2=</font></b></td>\
<td valign=""top""><script>document.write(pul2)</script><br>\
</td>\
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



void setup() 
{
  // put your setup code here, to run once:
  
  //iniica puerto serial
  Serial.begin(115200);
  //configura entradas y salidas
  pinMode(led_amarillo,OUTPUT);
  pinMode(led_rojo,OUTPUT);
  pinMode(pulsador1,INPUT_PULLUP);
  pinMode(pulsador2,INPUT_PULLUP);

  //apaga leds
  digitalWrite(led_amarillo,LOW);
  digitalWrite(led_rojo,LOW);
  
    
   //inica el servidor en el modulo ethernet
   Ethernet.begin(mac, ip);
   server.begin();
  Serial.println("OK INICIANDO");  
  
  
}

void loop()
{
  //lee el voltaje
  codigo=analogRead(0);
  voltaje=codigo*5.0/1023.0;
  //lee la temperatura
  codigo=analogRead(1);
  temperatura=codigo*500.0/1023.0;

 // espera que se conecte un cliente
   EthernetClient client = server.available();
    char flag_pag = 0 ; //bandera de html o javascrit
    
      while (client.connected())
       {
         if (client.available())
           {
            //captura los primero 30 datos
              for(cuent = 0 ; cuent < 30 ; cuent++) 
              {
              trama_rx[cuent] = client.read();
             }
              trama_rx[cuent] = 0 ; //agraga final de linea
                       // solo recibe peticiones tipo get
            if(memcmp(trama_rx, "GET /", 5)) break;
            
             //analiza
             Serial.println(trama_rx);
             
              flag_pag = 0; //limpia bandera       
                       
             //si solo solicita actualizacion de variables
              if(trama_rx[5] == '$') 
             {
              flag_pag=1;  //cambia el valor de la bandera 
              client.print(httpHeader);
               client.print(httpMimeTypeScript); 
             //manda la variable de voltaje
             client.print("var volt=");
             client.print(voltaje);
             client.print(";");

             //manda la temperatura
             client.print("var temp=");
             client.print(temperatura);
             client.print(";");

             //Lee el pulsador1
             if (digitalRead(pulsador1)==0) client.print ("var pul1=\"ON\";") ;
             else client.print ("var pul1=\"OFF\";") ;

            //lee el pulsador 2
             if (digitalRead(pulsador2)==0) client.print ("var pul2=\"ON\";") ;
             else client.print ("var pul2=\"OFF\";") ;
      
             }

              //analiza ordenes recibidas desde la pagina
              if (strstr(trama_rx,"led1="))
              {
                 if (strstr(trama_rx,"on"))  digitalWrite(led_amarillo,HIGH);
                 else digitalWrite(led_amarillo,LOW);
              }
              
              else if (strstr(trama_rx,"led2="))
              {
                 if (strstr(trama_rx,"on"))  digitalWrite(led_rojo,HIGH);
                 else digitalWrite(led_rojo,LOW);
              }

             
            if   (flag_pag==0)
            {
                client.print(httpHeader);
              client.print(httpMimeTypeHTML);
              client.print(mandame(pagina1));
              client.print(mandame(pagina2));
            
              }       

                 
          
          }//si hay cliente
       }//mientras estre conectado cliente
         client.stop(); //cierra la conexion 
    
     
  
  

  
}
