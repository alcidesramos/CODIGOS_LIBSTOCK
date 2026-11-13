

#define sbi(x, y) x |= _BV(y)    // set bit
#define cbi(x, y) x &= ~(_BV(y)) // clear bit
#define tbi(x, y) x ^= _BV(y)    // toggle bit
#define is_high(x, y) ((x & _BV(y)) == _BV(y))

#define led 13
#define suiche 3
#define pulso 12


float calculo;
unsigned  dispara=0;
unsigned int codigo;
float temperatura;

char trama_tx[100];
//variables para capturar la trama
char trama_rx[30];
char procesa[30];
char dato;

//variables interrpcion serial
char datorx;
char puntero=0;
char flag_rx=0;



//si se da la interrpcion por cruce 
void cruce()
{
       digitalWrite(pulso,LOW);//APAGA LA CARGA
       TCNT2=calculo;// carga el valor en el timer2
      sbi(TIFR2,TOV2); // pone un uno para limpiar bandera de desborde  
       sbi(TIMSK2,TOIE2); // habilita interrpcion del timer1   
  }



//procedimiento de interrupcion del timer1
ISR(TIMER2_OVF_vect)    
{
   //aplica pulso de disparo
         digitalWrite(pulso,HIGH);//activa la carfa
        //si se quiere no se espera 10 us y se deja encendido la señal
         delayMicroseconds(10);
          digitalWrite(pulso,LOW);;//APAGA LA CARGA
          sbi(TIFR2,TOV2); // pone un uno para limpiar bandera de desborde  
         cbi(TIMSK2,TOIE2); // deshabilita interrpcion del timer1   
        


}


void serialEvent()
  {
       while (Serial.available())
       {
       
     datorx= (char)Serial.read();
     trama_rx[puntero]=datorx;
     puntero++;
              if (puntero>=30) 
              {
               puntero=0;
              }
              if (datorx== '*') 
              {
              flag_rx=1;
              }
       }
  
  }


void procesarx()
{
 if (strstr(trama_rx,"led1="))
  {
     if (strstr(trama_rx,"on")) digitalWrite(led,HIGH);
    else digitalWrite(led,LOW);
    }

 
  else if (strstr(trama_rx,"pul="))
    {   
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dispara=atoi(procesa);

    }
 
}



void setup()
{
  // put your setup code here, to run once:
  
  noInterrupts();
Serial.begin(9600);
pinMode(led,OUTPUT);
pinMode(pulso,OUTPUT);
pinMode(suiche,INPUT);
pinMode(2,INPUT);//PIN DE LA INTERRPCION
digitalWrite(led,LOW); 
attachInterrupt(digitalPinToInterrupt(2), cruce,RISING );//interrupcion pro flanco de subida
//configuta timer2

//Configura registroA
TCCR2A=0;
//configura registroB
TCCR2B=0;
TCCR2B=0b111;// Configura el preescalador a 1024 16ms
TCNT2=0;  //Arranca en cero el timer2

sbi(TIFR2,TOV2); // pone un uno para limpiar bandera de desborde timer1
//interrpucion timer1
cbi(TIMSK2,TOIE2); // Deshabilita interrpcion del timer1
interrupts();


}


void loop()
{
  // put your main code here, to run repeatedly:
    codigo=analogRead(0);//lee el canal cero
   temperatura=codigo*500.0/1023.0; 
   

  
   /*         Serial.print("dispara=");
      dtostrf(dispara,5,3,trama_tx);  // convierte de decimal(tempratura) 5 
     Serial.print(trama_tx);
    Serial.print("/\r\n\r\n");*/

  if (flag_rx==1)
    {
       
       procesarx();        
        flag_rx=0;// borra la bandera
        puntero=0;  //reseta contador de datos
        memset(trama_rx,0,30);  // borra el vector de datos recibicos en la trama
        
       } 


if (dispara<=5)
       {
       
         detachInterrupt(digitalPinToInterrupt(2));//deshabilita Interrpcion por flanco
         digitalWrite(pulso,LOW);;//APAGA LA CARGA

       }
       else if (dispara>=90)
       {


         detachInterrupt(digitalPinToInterrupt(2));// DESHABILITA INTERRUPCION POR FLANCO
          digitalWrite(pulso,HIGH);//activa la carfa


       }
        else
     {
     
       calculo = -1.3054*dispara + 256.17;//ecuacio para paar a tiempo

         

        attachInterrupt(digitalPinToInterrupt(2), cruce,RISING );//interrupcion por flanco de subida activada
      }
   
   Serial.print("temp=");
    dtostrf(temperatura,5,3,trama_tx);  // convierte de decimal(tempratura) 5 
     Serial.print(trama_tx);
    Serial.print("/");

   if (digitalRead(suiche)==1) Serial.print("led=on/");
   else Serial.print("led=off/");
   

   
   delay(50);
   
   
  

}
