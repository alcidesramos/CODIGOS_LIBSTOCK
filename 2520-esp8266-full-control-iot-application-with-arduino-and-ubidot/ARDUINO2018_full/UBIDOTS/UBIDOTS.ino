#define suiche 2
#define led_out 13


unsigned int codigo;
float temperatura;

char trama[150];
char trama_largo[20];
char captu[30];



char led=0;
int var_largo;//larfo trama de variable


//   lo que se va a capturar se toma desde lue=   value": 0.0}
//estados de la recepcion de variables
enum estados_  {cap_l,cap_u,cap_e,cap_co,esp_final} ;
//estado inicial
 char estado_rec=cap_l;

//   lo que se va a capturar se toma desde lue=   value": 0.0}
float valor_rx;
char trama_rx[50];
char contador_trama=0;
unsigned long demora=0; //usado para alir de la lectura de datos



void manda_esp8266(const char *info)
{
unsigned int largo;
        Serial.print("AT+CIPSEND=");     //manda envia solo constantes
         Serial.write('4');    //manda el socket  el cual se conecto
         Serial.write(',');
         largo=strlen(info);  //calcula el largo de la cadena a enviar
        sprintf(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
        Serial.print(captu); //envia el largo d ela trama
       Serial.print("\r\n");
        delay(100); //retardo antes de enviar la trama
        Serial.print(info);     //manda envia solo constantes
}


char lee_trama()   //funcio que retorna 1 si hay dato sino 0
{
char dato_rx;
//limpa todas las variables
memset(trama_rx,50,0);
demora=0;
contador_trama=0;
estado_rec=cap_l;


while (demora<=66667)
{
   demora++;
   switch (estado_rec)
   {
   case cap_l:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='l') contador_trama=0;
               else 
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_u; //pasa al estado de capturar la u
               }
                           } 
             break;
   case cap_u:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='u') 
               {
               contador_trama=0;
               estado_rec=cap_l; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                 estado_rec=cap_e; //pasa al estado de capturar la u
               }
                }
             break;

   case cap_e:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='e') 
               {
               contador_trama=0;
               estado_rec=cap_l; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_co; //pasa al estado de capturar la u
               }
              
             }
             break;
             

   case cap_co:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='\"')
               {
               contador_trama=0;
               estado_rec=cap_l; //regresa al estado inical
               
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=esp_final; //pasa al estado de capturar la u
               }
               
             }

             break;
             
   case esp_final:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               contador_trama++;
               if (dato_rx=='}')   return(1); //sale del procedimiento
                          }

             break;
    } //fin de break
    
  }//fin del while de demora
    return (0); //si se cumplio e retardo retorna cero



}

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(suiche,INPUT);
  pinMode(led_out,OUTPUT);
  
  Serial.print("ATE0\r\n"); //SIN ECO
delay(200);

Serial.print("AT+CWMODE=1\r\n"); //se CONECTA A RED EXISTENTE
delay(200);

  //Para Colocar Una Ip Al modulo
  Serial.print("AT+CWDHCP=1,0\r\n"); //Deshabilita DHCP  para Ip manual
     delay(300);
//Configura IP IP,Gateway,MAscara   en forma Manual

 //Serial.print("AT+CIPSTA=\"192.168.43.117\",\"192.168.43.1\",\"255.255.255.0\"\r\n");
  Serial.print("AT+CIPSTA=\"192.168.1.117\",\"192.168.1.1\",\"255.255.255.0\"\r\n");
 //Serial.print("AT+CIPSTA=\"192.168.97.117\",\"192.168.96.1\",\"255.255.255.0\"\r\n");
  delay(300);


   // Serial.print("AT+CWJAP=\"REPOTENTE\",\"forever17\"\r\n");  //se conecta a una red WIFI
  //  Serial.print("AT+CWJAP=\"Alcides Celular\",\"noconectar\"\r\n");  //se conecta a una red WIFI
    Serial.print("AT+CWJAP=\"427315196575\",\"783054729115\"\r\n");  //se conecta a una red WIFI
   //  Serial.print("AT+CWJAP=\"LAB_PISO3\",\"");  //se conecta a una red WIFI

   delay(6000);
   Serial.print("AT+CIPMUX=1\r\n");  //acepta mulriples conexiones
   delay(200);

    Serial.print("AT+CIFSR\r\n");//mira que ip tiene el modulo
    delay(1000);

      //se conecta a ubidots
      Serial.write("AT+CIPMUX=1\r\n");;
    delay(300);
    Serial.write("AT+CIPSTART=4,\"TCP\",\"things.ubidots.com\",80\r\n");
   delay(3000);
 

}

void loop() 
{
  // put your main code here, to run repeatedly:
    //lee la temperatura
     codigo=analogRead(0);
     temperatura=codigo*500.0/1023.0;     
     if (digitalRead(suiche)==0) led='0'; else led='1';
     
    //limpia las tramas
     memset(trama_largo,20,0);
      memset(trama,150,0);
      //arama trama de variables
     sprintf(trama,"{\"temperatura\": %u ,\"led\": %c}\n",(int)temperatura,led);
    //calcula largo de la trama de variables
     var_largo=strlen(trama)-1;
    //la pasa a cadena y agrega dos fin de linea
     sprintf(trama_largo,"%u\n\n",var_largo);
//envio de datos a ubidots
      //el device en este caso en micasa
      // y el token     A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf
      //colocar los de su interfaz
     manda_esp8266("POST /api/v1.6/devices/micasa/?token=A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
     //manda el largo de la trama
      delay(1000);
      //manda el largo de la trama
     manda_esp8266(trama_largo);
     delay(500);
    //manda la info con las variables
     manda_esp8266(trama);
    delay(500);
     
    //pregunta por variables deseada
       manda_esp8266("GET /api/v1.6/devices/micasa/luces/values?page_size=1&token=A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf HTTP/1.1\nHost: things.ubidots.com\n\n");
        //lee la respuesta
      lee_trama();
      //captura el valor de la variables        value": 0.0}
        strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
        strcpy(captu, strtok(0, "}"));  //captura hasta el /
        //pasa la cadena a  numero
        valor_rx=atof(captu);
        if (valor_rx==1.0) digitalWrite(led_out,1); else digitalWrite(led_out,0);  //plica la salida al led
        delay(200);



  

}
