//pines de direccion del motor
#define m11 13
#define m12 12

#define led1 2
#define led2 3
#define led3 4
#define suiche 5


//variables nuevas
char datorx;
char puntero=0;
char flag_rx=0;



//PIn de pwm
#define pwm 11

//variables para capturar la trama
char trama[30];
char procesa[30];
char dato;


//variables para leer analogo
unsigned int codigo;
float temperatura;

char texto[20];// trama para pasar de numero a cadena




//funcion para que gira a la derecha
void m1derecha()
{
 digitalWrite(m11,HIGH); 
 digitalWrite(m12,LOW);  
}

void m1izquierda()
{
 digitalWrite(m11,LOW); 
 digitalWrite(m12,HIGH);  
}

void m1quieto()
{
 digitalWrite(m11,LOW); 
 digitalWrite(m12,LOW);  
}


void procesarx()
{
 if (strstr(trama,"led1="))
  {
     if (strstr(trama,"on")) digitalWrite(led1,HIGH);
    else digitalWrite(led1,LOW);
    }

   else if (strstr(trama,"led2="))
  {
     if (strstr(trama,"on")) digitalWrite(led2,HIGH);
    else digitalWrite(led2,LOW);
    }

    else if (strstr(trama,"m1der"))  m1derecha();

  else if (strstr(trama,"m1izq"))  m1izquierda();

  else if (strstr(trama,"m1stop"))  m1quieto();



else if (strstr(trama,"m1pwm="))
    {
        strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);
        analogWrite(pwm,dato);// aplica la velocidad al pwm
        
     
    }

  
  
}


void serialEvent()
  {
       while (Serial.available())
       {
       
     datorx= (char)Serial.read();
     trama[puntero]=datorx;
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





void setup() 
{
  // put your setup code here, to run once:

 Serial.begin(9600);// inica el puerto serial
 pinMode(led1,OUTPUT);
 pinMode(led2,OUTPUT);
 pinMode(led3,OUTPUT);
 
 
 
 pinMode(pwm,OUTPUT);
 pinMode(m11,OUTPUT);
 pinMode(m12,OUTPUT);

pinMode(suiche,INPUT);
 

 //inia con una velocidad basica el pwm
 analogWrite(pwm,100);
//motor arranca apagado
 m1quieto();

}

void loop()
{
  // put your main code here, to run repeatedly:


      if (flag_rx==1)

      {
       
        procesarx();        
        flag_rx=0;// borra la bandera
        puntero=0;  //reseta contador de datos
        memset(trama,0,30);  // borra el vector de datos recibicos en la trama
        
       } 

   codigo=analogRead(0);//lee el canal cero
   temperatura=codigo*500.0/1023.0; 
   Serial.print("*T");
   //Serial.print(temperatura);
   dtostrf(temperatura,5,3,texto);  // convierte de decimal(tempratura) 5 
  //  sprintf(texto,"temp=%.2f/",temperatura);
   Serial.print(texto);
   Serial.print("*");
   delay(5);

      Serial.print("*P");
   //Serial.print(temperatura);
   dtostrf(temperatura,5,3,texto);  // convierte de decimal(tempratura) 5 
  //  sprintf(texto,"temp=%.2f/",temperatura);
   Serial.print(texto);
   Serial.print("*");
delay(5);

   if (digitalRead(suiche)==1) Serial.print("*LR255G0B0*");
   else Serial.print("*LR0G0B0*");
   
delay(30);
   
 
    digitalWrite(led3,HIGH);
   delay(20);
  digitalWrite(led3,LOW);
   delay(20); 

  


  


}
