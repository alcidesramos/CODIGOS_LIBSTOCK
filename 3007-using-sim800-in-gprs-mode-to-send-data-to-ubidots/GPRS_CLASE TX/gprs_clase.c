sbit pin_on at LATB0_BIT;
sbit led1 at LATB7_BIT;
sbit led2 at LATB6_BIT;
unsigned char tempo;
char cuenta_on=0;// cuenta el nuemro de veces para intemntar encender el modulo

// variables para uart
char trama_rx[100];
char trama_tx[200];

char trama_cont=0;
char dato_rx;

char texto[30];

// variables para ubidot
char flag_ubi=0;

unsigned char largo;
char largo_str[10];
unsigned char led_ubidot;
char captu[30];// para procesar lo capturado por ubidots


float temperatura;
unsigned  int  suiche_ubi,pwm_ubi;


 // variables gps
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

// estado_rec=normal;
 trama_cont=0;
  memset(trama_rx,0,100);// LIMPIA LA TRAMA
  RCIF_bit=0;
  //BORRA ERROES DE RECEPCION
  CREN_bit=0;
  CREN_bit=1;
   RCIE_bit=1;
 Delay_ms(10);
    for (cont1=1;cont1<=milis;cont1++)
     {
    delay_Ms(1);

          if (strstr(trama_rx,cap)!=0 )
          {
           RCIE_bit=0; // deshabilita la interrpcion
           Delay_ms(10);
           return(1);
          }
          else  if (strstr(trama_rx,cap1)!=0 )
          {
         RCIE_bit=0; // deshabilita la interrpcion
          Delay_ms(10);
          return(2);
          }
    }

  RCIE_bit=0; // deshabilita la interrpcion
  return(0);
}

char manda_AT_COMANDO(char *coman, char cap[15], char cap1[15],unsigned int retardo)
{
  Uart1_write_text(coman);//manda el comando
  Uart1_write_text_const("\r\n"); // manda final de linea
  return (tiempo(retardo,cap,cap1));
  }
  
// funcion que intenta prender el modulo
unsigned char prendio()
{
    Delay_ms(2000);
    // manda comando at para ver si ya esta encendifo

    if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
          //sino manda pulso de encedido
          else{
           pin_on=0;
          Delay_ms(1000);
          pin_on=1;
          Delay_ms(2000);
          pin_on=0;
          Delay_ms(2000);
            // manda comando at para ver si encendio
         if ( manda_AT_COMANDO("AT","OK","ERROR",2000)==1) return(1);
               else return(0);// sino dice que fue imposible encender el modulo
             }
}




void interrupcion() iv 0x0008 ics ICS_AUTO
 {
    // si es interrpcion serial
   if (RCIF_bit==1)
   {
   dato_rx=RCREG; // lee el dato
   trama_rx[trama_cont]=dato_rx;
   trama_cont++;
   if (trama_cont>=100) trama_cont=0;
   RCIF_bit=0;
  }

  }


// procedimiemto que garantiza la conexión GPSR
void config_gprs()
{

hoy : // etiquete de reinico en caso que un comando falle

     //RESETEA CUALQUIER CONEXION GPRS
       manda_AT_COMANDO("AT+CIPSHUT","OK", "ERROR", 2000);

      // PREPARA SIMPLE CONEXION
       tempo=manda_AT_COMANDO("AT+CIPMUX=0", "OK", "ERROR", 4000);
       if (tempo!=1)  goto hoy; // Va al inicio hasta que logre inicializar

      //analiza el estado
      tempo=manda_AT_COMANDO("AT+CIPSTATUS", "IP INITIAL", "ERROR", 500);
       if (tempo!=1)  goto hoy; // Va al inicio hasta que este en estado de ip inial


     // TRATA DE CONECTAR A RED, DEBE COLOCAR EL APN CLAVE Y USIRIO ACORDE AL PROVEEDOR DEL SERVICIO
      tempo=manda_AT_COMANDO("AT+CSTT=\"lte.avantel.com.co\",\"\",\"\"", "OK",  "ERROR", 30000);
       if (tempo!=1)  goto hoy; // SINO SE CONECTA A LA RED REINCIA LA CONEXIÓN

    // manda ordenes de configuracion de calidad de la red
  manda_AT_COMANDO("AT+CGQMIN= 1,0,0,0,0,0", "OK", "OK", 500);
   manda_AT_COMANDO("AT+CGQREQ= 1,0,0,3,0,0", "OK", "OK", 500);

   // COMPOARTAMIENTO AL RECIBIR UN MENSAJE DE TEXTO
   manda_AT_COMANDO("AT+CMGF=1", "OK", "OK", 500);
   
   // QUE REPROTE EL MENSAJE POR EL UART
   manda_AT_COMANDO("AT+CNMI=1,1,2,1,0", "OK", "OK", 500);

     // COSULTA EL ESTADO
         while(manda_AT_COMANDO("AT+CIPSTATUS", "START", "ERROR", 3000)  == 0 );
            Delay_ms(2000);// RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK

         //crea la conexion GPRS
      tempo=manda_AT_COMANDO("AT+CIICR", "OK",  "ERROR", 30000);
       if (tempo!=1)  goto hoy;
       // espera el estado de conexion a GPRS
       while (tempo=manda_AT_COMANDO("AT+CIPSTATUS", "GPRSACT", "ERROR", 6000)==0);
       Delay_ms(2000);   // RETARDO PARA QUE ADEMAS DEL STATUS LLEGUE EL OK

       //optiene  la ip local
       tempo=manda_AT_COMANDO("AT+CIFSR", ".", "ERROR", 10000);
       if (tempo!=1)  goto hoy;// sino no hya ip reinica el proceso
        Delay_ms(3000);
 }

  // analiza si se conectoa ubidots
 unsigned char conecta()
{
 tempo=manda_AT_COMANDO("AT+CIPSTART="  "\"TCP\""   ","   "\"things.ubidots.com\""  ","  "\"80\"", "CONNECT OK", "ALREADY CONNECT", 10000);
 //aux=sendATcommand2("AT+CIPSTART="  "\"TCP\""   ","   "\"181.141.75.5\""  ","  "\"181\"", "CONNECT OK", "CONNECT FAIL", 10000);
 Delay_ms(2000);
 if ((tempo==1) ||(tempo==2)) return(1);
 else return(0);


}

// si esta coenectado manda la indormacion
  unsigned char conectar()

  {
  if (conecta()==1)
   {

    tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",5000);
    Delay_ms(500);
   //datos a mandar ubidot
    memset(trama_tx,0,100);//limpia la trama de tranmision

    sprintf(trama_tx,"{\"led\": %1d,\"temperatura\": %5.2f,\"gps\":{\"lat\":%11.7f, \"lng\":%12.7f}}",(unsigned int)led_ubidot,temperatura,latitud,longitud);
    largo=strlen(trama_tx);

    sprintf(largo_str,"%u\n\n",largo);
     Uart1_write_text_const("POST /api/v1.6/devices/pruebas/?token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");
    UART1_Write_Text(largo_str);
    Uart1_write_text(trama_tx);


     Delay_ms(4000);// retardo de envio
    tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",4000);// comando de fin de envio
    Delay_ms(5000);       //   retardo para evitar conflcitos con la respuesta de ubidots
  /*

  // para recibir de ubidots
    tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",6000);
    Delay_ms(500);
      //pregunta por variables deseada
       Uart1_write_text_const("GET /api/v1.6/devices/pruebas/suiche/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");
     Delay_ms(4000);// retardo de envio
    tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",6000);// comando de fin de envio
        //lee la respuesta
       tempo=tiempo_rec(6000); // espera un tiempo o hasta que tenga una respeusta valida
      //captura el valor de la variables        value": 0.0}
        strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
        strcpy(captu, strtok(0, "}"));  //captura hasta el /
        //pasa la cadena a  numero
        suiche_ubi=atof(captu);
  // para recibir de ubidots
    tempo=manda_AT_COMANDO("AT+CIPSEND", ">", "OK",6000);
    Delay_ms(500);
      //pregunta por variables deseada
       Uart1_write_text_const("GET /api/v1.6/devices/pruebas/pwm/values?page_size=1&token=BBFF-mTsH9IHOIbabCuZfmbp87JI6izEzWD HTTP/1.1\nHost: things.ubidots.com\n\n");
     Delay_ms(4000);// retardo de envio
    tempo=manda_AT_COMANDO("\x1A", "SEND OK", "ERROR",6000);// comando de fin de envio
        //lee la respuesta
       tempo=tiempo_rec(6000); // espera un tiempo o hasta que tenga una respeusta valida
      //captura el valor de la variables        value": 0.0}
        strcpy(captu, strtok(trama_rx, ":"));  //inicia captura de tokens desde el =
        strcpy(captu, strtok(0, "}"));  //captura hasta el /
        //pasa la cadena a  numero
        pwm_ubi=atof(captu);

        Delay_us(4000);
    */
     tempo=manda_AT_COMANDO("AT+CIPCLOSE", "CLOSE OK", "ERROR",4000);// comando de fin de envio// CIERRA EL SOCKET
     Delay_ms(1000);

     // solo para probrar que capture informacion de ubidot
     sprintf(texto,"sw=%1d  pwm=%3d\r\n",suiche_ubi,pwm_ubi);
     UART1_Write_Text(texto);    // debe quitarse despues
      Delay_ms(1000);
     if (tempo!=1) return(2);// anlizando estos codigos da más robuztez el programa
    return(1);
    }  // si se conector
   else return(0);
  }




void main()
 {
 ADCON1=0B1111; // TODO DIGITAL
TRISB=0;
TRISC=0;
TRISC7_bit=1; // entrada rx

UART1_Init(9600); // velocidad del modulo sim800
pin_on=0;

INTCON=0b01000000;
                    //rx   tx
Soft_UART_Init(&PORTB, 2, 1, 9600, 0);  // inicializa un puerto por software

// configura interrupciom serial
   RCIF_bit=0;
   RCIE_bit=0;

    LATB=0;
   //timer
   
     //configura timer cero para 1 segundo

    T0CON=0;//LIMPIA REGISTRO DEL TIMER CERO
    TMR0ON_bit=0; // lo mantiene apagado
    TMR0H=72;
    TMR0L=228;
    // PREESCAALDOR DE 256
    T0PS2_bit=1;
    T0PS1_bit=1;
    T0PS0_bit=1;

    TMR0IF_bit=0;
    TMR0IE_bit=0;// deshabilita la interrpcion



   GIE_bit=1;// HABILITA INTERPCIONES GLOBALES

   // habilita recepcion contimuo, limpia errores en el bufferde recpcion
   RCEN_bit=0;
   RCEN_bit=1; 
    while ((prendio()==0) || (cuenta_on>=10)) cuenta_on++;  // intenta prender el modulo usando 10 intentos
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