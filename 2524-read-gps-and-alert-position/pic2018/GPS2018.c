sbit led at LATC0_bit; // pin del led


// LCD module connections
sbit LCD_RS at RB7_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB2_bit;

sbit LCD_RS_Direction at TRISB7_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_D4_Direction at TRISB5_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB2_bit;
// End LCD module connections


float grados,minutos;
float latitud,longitud;


char c_grados[10];   // grados en cadena

//   lo que se va a capturar se toma desde PGGA  HASTA *
//estados de la recepcion de variables
enum estados_  {cap_P,cap_G,cap_G2,cap_A,esp_final} ;
//estado inicial
 char estado_rec=cap_P;

//   lo que se va a capturar se toma desde lue=   value": 0.0}
float valor_rx;  //captura valor de lavariables
char trama_rx[100];
char captura_rx[100];
char texto[10]; // variable captura de cadeda auxiliar
char contador_trama=0;
unsigned long demora=0; //usado para alir de la lectura de datos


char lee_trama()   //funcio que retorna 1 si hay dato sino 0
{
char dato_rx;
//limpa todas las variables
memset(trama_rx,100,0);
demora=0;
contador_trama=0;
estado_rec=cap_P;
//borra errores de recepcion
RCIF_bit=0;
CREN_bit=0; //
CREN_bit=1; //

while (demora<=96667)
{
   demora++;
   switch (estado_rec)
   {
   case cap_P:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='P') contador_trama=0;    //no fue el dato que me interesa
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_G; //pasa al estado de capturar la g
               }
              RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;
             
     case cap_G:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='G')
               {
               contador_trama=0;
               estado_rec=cap_P; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                 estado_rec=cap_G2; //pasa al estado de capturar la g
               }
                RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;

   case cap_G2:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='G')
               {
               contador_trama=0;
               estado_rec=cap_P; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_A; //pasa al estado de capturar la a
               }
              RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;


   case cap_A:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='A')
               {
               contador_trama=0;
               estado_rec=cap_P; //regresa al estado inical

               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=esp_final; //pasa al estado de capturar la u
               }
               RCIF_bit=0; //limpia la bandera de recepcion par esperar otro dato
             }

             break;

   case esp_final:
             if (RCIF_bit==1) //si hay un dat recibido
             {
               dato_rx=UART_Read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               contador_trama++;
               if (dato_rx=='*')   return(1); //sale del procedimiento
             RCIF_bit=0; //limpia la bandera de recepcion
             }
             break;


       }//fin del switch

   }//fin del while demora
   return(0);

}



void main() 
{
// TODO DIGITAL
ANSELA=0;
ANSELB=0;
ANSELC=0;


trisc.b7=1;//entrada serial
trisc.b6=0;//salida serial

trisc.b0=0;//salida led


 UART1_Init(9600);    // velocidad en baudios del gps usado

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  
  Lcd_Out(1,1,"LAT= ");
  Lcd_Out(2,1,"LON= ");

  Delay_ms(5000);

  
  while (1)
  {
     lee_trama();
     
    //captura la latitud
   strcpy(captura_rx, strtok(trama_rx, ","));  //inicia captura de tokens desde el =
   strcpy(captura_rx, strtok(0, ","));  //captura hasta segunda coma
    strcpy(captura_rx, strtok(0, ","));  //captura hasta lo que esta tercera coma es decir, latitud
       memset(c_grados,0,10);//limpía los grados
       strncpy(c_grados,captura_rx,2);//captura los grados
        grados=atof(c_grados);      // pasa de alfanumerico o cadena a flotante

          // apunta a los minutos
         minutos=atof(&captura_rx[2])/60.0;  //lo pasa a grados
           latitud=grados+minutos;
           
       strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
       if (captura_rx[0]=='S') latitud=-latitud;
//ACONDICIONA PARA EL LCD
            sprintf(texto,"%f",latitud);
            //BORRA  ESPACIA A ESCRIBIR
       Lcd_Out(1,6,"            ");
       Lcd_Out(1,6,texto);
       
       
  //  captura la longitud
       strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma la longitud
     memset(c_grados,0,10);//limpía los grados
       strncpy(c_grados,captura_rx,3);//captura los grados  3 posiciones
          grados=atof(c_grados);
    // apunta a los minutos
         minutos=atof(&captura_rx[3])/60.0;  //lo pasa a grados
           longitud=grados+minutos;
       strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
       if (captura_rx[0]=='W') longitud=-longitud;
            sprintf(texto,"%f",longitud);
            Lcd_Out(2,6,"            ");
            Lcd_Out(2,6,texto);
            
            //si esta en bocagrande
if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.5531294 ))  led=1; else led=0;
       
       
       
       Delay_ms(500);



  
  }



}