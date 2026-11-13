#include <LiquidCrystal.h>
LiquidCrystal lcd(13, 12, 11, 10, 9, 8);

#define led 7



float grados,minutos;
float latitud,longitud;


char c_grados[10];

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

while (demora<=96667)
{
   demora++;
   switch (estado_rec)
   {
   case cap_P:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='P') contador_trama=0;    //no fue el dato que me interesa
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_G; //pasa al estado de capturar la g
               }
              //limpia la bandera de recepcion par esperar otro dato
             }
             break;
       case cap_G:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
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
                //limpia la bandera de recepcion par esperar otro dato
             }
             break;

   case cap_G2:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
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
              //limpia la bandera de recepcion par esperar otro dato
             }
             break;


   case cap_A:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
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
               //limpia la bandera de recepcion par esperar otro dato
             }

             break;

   case esp_final:
             if (Serial.available()) //si hay un dat recibido
             {
               dato_rx=Serial.read(); //lee el dato
               trama_rx[contador_trama]=dato_rx;
               contador_trama++;
               if (dato_rx=='*')   return(1); //sale del procedimiento
             //limpia la bandera de recepcion
             }
             break;


       }//fin del switch

   }//fin del while demora
   return(0);

}






void setup() {
  // put your setup code here, to run once:

  pinMode(led,OUTPUT);
  lcd.begin(16, 2);
  lcd.setCursor(0, 0);
  lcd.print("LAT= ");
  lcd.setCursor(0, 1);
  lcd.print("LON= ");
  Serial.begin(9600);
  delay(5000);


}

void loop() {
  // put your main code here, to run repeatedly:
   lee_trama();
    //captura la latitud
   strcpy(captura_rx, strtok(trama_rx, ","));  //inicia captura de tokens desde el =
   strcpy(captura_rx, strtok(0, ","));  //captura hasta segunda coma
    strcpy(captura_rx, strtok(0, ","));  //captura hasta lo que esta tercera coma es decir, latitud
     memset(c_grados,0,10);//limpía los grados
       strncpy(c_grados,captura_rx,2);//captura los grados
        grados=atof(c_grados);
          // apunta a los minutos
         minutos=atof(&captura_rx[2])/60.0;  //lo pasa a grados
           latitud=grados+minutos;
       strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
       if (captura_rx[0]=='S') latitud=-latitud;
           
         
            

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

            
if ((latitud!=0) && (longitud!=0))
{
//ACONDICIONA PARA EL LCD

      dtostrf(latitud, 11, 6,texto);
      lcd.setCursor(6, 0);
   //BORRA  ESPACIA A ESCRIBIR
  lcd.print("            ");
  lcd.setCursor(6, 0);
  lcd.print(texto);
       dtostrf(longitud ,11, 6,texto);
            
       //BORRA  ESPACIA A ESCRIBIR
  
     lcd.setCursor(6, 1);
     lcd.print("            ");
    lcd.setCursor(6, 1);
    lcd.print(texto); 
    //si esta en bocagrande
if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.4931294 ))  digitalWrite(led,1); else digitalWrite(led,0);

}

            
            
        

  

}
