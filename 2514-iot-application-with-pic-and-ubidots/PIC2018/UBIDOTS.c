sbit suiche at RB0_bit; //ubicacion del pulsador

unsigned int codigo;
float temperatura;

char trama[150];
char trama_largo[20];
char captu[30];



char led;
int var_largo; //LARGO DE LA TRAMA


//funcion para detectar el largo de una cadena tipo constante
unsigned long strlen_const(const char *const_pun)
{
 unsigned int cuen_const=0;

 while (*const_pun++!=0) cuen_const++;
 return (cuen_const);

}


void manda_serial_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}



void manda_esp8266_const(const char *info)
{
unsigned int largo;
        manda_serial_const("AT+CIPSEND=");     //manda envia solo constantes
         UART1_Write('4');    //manda el socket  el cual se conecto
         UART1_Write(',');
         largo=strlen_const(info);  //calcula el largo de la cadena a enviar
        sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
        UART1_Write_Text(captu); //envia el largo d ela trama
        manda_serial_const("\r\n");
        Delay_ms(100); //retardo antes de enviar la trama
        manda_serial_const(info);     //manda envia solo constantes
}


void manda_esp8266(char *info)
{
unsigned int largo;
        manda_serial_const("AT+CIPSEND=");     //manda envia solo constantes
         UART1_Write('4');    //manda el socket  el cual se conecto
         UART1_Write(',');
         largo=strlen(info);  //calcula el largo de la cadena a enviar
        sprinti(captu,"%1u",largo); //es el largo de la trama  +2 por enter y fin de  linea
        UART1_Write_Text(captu); //envia el largo d ela trama
        manda_serial_const("\r\n"); // estos son los dos que se adicionaron
        Delay_ms(100); //retardo antes de enviar la trama
        UART1_Write_Text(info);     //manda envia solo constantes
}




void main() 
{
ADCON1=0b1110; // an0 analogo

  trisa.b0=1; //entrada del pin analogo
  trisb.b0=1; //entrada pulsador

  TRISC6_bit=0; //Salida Tx
 TRISC7_bit=1; //Entrada rx
 UART1_Init(115200);      //VELOCIDA BAUDIOS

// UART1_Write_Text("AT\r\n");
manda_serial_const("ATE0\r\n"); //SIN ECO
Delay_ms(200);

manda_serial_const("AT+CWMODE=1\r\n"); //se CONECTA A RED EXISTENTE
Delay_ms(200);

  //Para Colocar Una Ip Al modulo
  manda_serial_const("AT+CWDHCP=1,0\r\n"); //Deshabilita DHCP  para Ip manual
     Delay_ms(300);
//Configura IP IP,Gateway,MAscara   en forma Manual

 //manda_serial_const("AT+CIPSTA=\"192.168.43.117\",\"192.168.43.1\",\"255.255.255.0\"\r\n");
  manda_serial_const("AT+CIPSTA=\"192.168.1.117\",\"192.168.1.1\",\"255.255.255.0\"\r\n");
 //manda_serial_const("AT+CIPSTA=\"192.168.97.117\",\"192.168.96.1\",\"255.255.255.0\"\r\n");
  Delay_ms(300);


   // manda_serial_const("AT+CWJAP=\"REPOTENTE\",\"forever17\"\r\n");  //se conecta a una red WIFI
  //  manda_serial_const("AT+CWJAP=\"Alcides Celular\",\"noconectar\"\r\n");  //se conecta a una red WIFI
    manda_serial_const("AT+CWJAP=\"427315196575\",\"783054729115\"\r\n");  //se conecta a una red WIFI
   //  manda_serial_const("AT+CWJAP=\"LAB_PISO3\",\"");  //se conecta a una red WIFI

   Delay_ms(6000);
   manda_serial_const("AT+CIPMUX=1\r\n");  //acepta mulriples conexiones
   Delay_ms(200);

    manda_serial_const("AT+CIFSR\r\n");//mira que ip tiene el modulo
    Delay_ms(1000);

      //se conecta a ubidots
      manda_serial_const("AT+CIPMUX=1\r\n");;
    Delay_ms(300);
    manda_serial_const("AT+CIPSTART=4,\"TCP\",\"things.ubidots.com\",80\r\n");
   Delay_ms(3000);
   
     while (1)
     {
     //lee la temperatura
     codigo=ADC_Read(0);
     temperatura=codigo*500.0/1023.0;

      if (suiche==0) led='0'; else led='1';
      //limpia las tramas
     memset(trama_largo,20,0);
      memset(trama,150,0);
      
      //armamos trama de variables
     sprintf(trama,"{\"temperatura\": %5.2f ,\"led\": %c}\n",temperatura,led);
    //calcula largo de la trama de variables
     var_largo=strlen(trama)-1;
    //la pasa a cadena y agrega dos fin de linea
     sprinti(trama_largo,"%u\n\n",var_largo);
     
//envio de datos a ubidots
      //el device en este caso en micasa
      // y el token     A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf
      //colocar los de su interfaz
     manda_esp8266_const("POST /api/v1.6/devices/micasa/?token=A1E-msmrHTTzxK2uHgu1nkqZjvjkjuxkmf HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
     //manda el largo de la trama
      Delay_ms(1000);
      //manda el largo de la trama
     manda_esp8266(trama_largo);
    Delay_ms(500);
    //manda la info con las variables
     manda_esp8266(trama);
    Delay_ms(500);

     
     
     
     }

}