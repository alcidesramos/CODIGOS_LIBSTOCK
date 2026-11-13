#define max_time 6000 // 6ms para tener la lectura de los sensores
unsigned long tiempo;


#define led 13

unsigned long timer=0;//variable acumula contador del sensor

//pines sesnores
 #define sen1 2
  #define sen2 3
  #define sen3 4
  #define sen4 5
  #define sen5 6
  #define sen6 7
  #define sen7 8
  #define sen8 9
   
   


//banderas de la lectura de los sensores
char banderas=0;
char texto[100];




//almacena el valor de la lectura
unsigned int lectura1,lectura2,lectura3,lectura4,lectura5,lectura6,lectura7,lectura8;



void config_salidas()//salida todos los sensores
{
pinMode(sen1,OUTPUT);
pinMode(sen2,OUTPUT);
pinMode(sen3,OUTPUT);
pinMode(sen4,OUTPUT);
pinMode(sen5,OUTPUT);
pinMode(sen6,OUTPUT);
pinMode(sen7,OUTPUT);
pinMode(sen8,OUTPUT);

}


void config_entradas()//entrada todos los sensores
{
pinMode(sen1,INPUT);
pinMode(sen2,INPUT);
pinMode(sen3,INPUT);
pinMode(sen4,INPUT);
pinMode(sen5,INPUT);
pinMode(sen6,INPUT);
pinMode(sen7,INPUT);
pinMode(sen8,INPUT);
}

//para sacar un uno en todo los sebsores
void saca_uno()
{
  digitalWrite(sen1,HIGH);
  digitalWrite(sen2,HIGH);
  digitalWrite(sen3,HIGH);
  digitalWrite(sen4,HIGH);
  digitalWrite(sen5,HIGH);
  digitalWrite(sen6,HIGH);
  digitalWrite(sen7,HIGH);
  digitalWrite(sen8,HIGH);
  
  }


void analizasensoresir()
{
  unsigned long medidor;
  config_salidas();
  saca_uno();
  delayMicroseconds(10);
  config_entradas();
    lectura1=lectura2=lectura3=lectura4=lectura5=lectura6=lectura7=0;  //limpia los registro de lectura
  banderas=0;    //limpi las bandera de los sesnores

  //lee durante 6ms
  medidor=micros();
  while ((micros()-medidor)<  max_time )
  {
    tiempo=(micros()-medidor);
       //si el pin es cero y la bandera de sensado es cero caprura el tiempo y activa la bandera para evitar nuevas lecturas
       if ( (digitalRead(sen1)==0) && (bitRead(banderas,0)==0))
       {
        lectura1=tiempo;
        bitSet(banderas,0);
        }

      if ( (digitalRead(sen2)==0) && (bitRead(banderas,1)==0))
       {
        lectura2=tiempo;
        bitSet(banderas,1);
        }

      if ( (digitalRead(sen3)==0) && (bitRead(banderas,2)==0))
       {
        lectura3=tiempo;
        bitSet(banderas,2);
        }


       if ( (digitalRead(sen4)==0) && (bitRead(banderas,3)==0))
       {
        lectura4=tiempo;
        bitSet(banderas,3);
        }

        if ( (digitalRead(sen5)==0) && (bitRead(banderas,4)==0))
       {
        lectura5=tiempo;
        bitSet(banderas,4);
        }


         if ( (digitalRead(sen6)==0) && (bitRead(banderas,5)==0))
       {
        lectura6=tiempo;
        bitSet(banderas,5);
        }


        if ( (digitalRead(sen7)==0) && (bitRead(banderas,6)==0))
       {
        lectura7=tiempo;
        bitSet(banderas,7);
        }


       if ( (digitalRead(sen8)==0) && (bitRead(banderas,7)==0))
       {
        lectura8=tiempo;
        bitSet(banderas,7);
        }





        
    
    
    
    }



}

void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);
  Serial.println("INICIANDO");
  pinMode(led,OUTPUT);
  digitalWrite(led,LOW);

}

void loop() 
{
  // put your main code here, to run repeatedly:
analizasensoresir();
sprintf(texto,"lecturas=%d  %d    %d\r\n",lectura1,lectura2,lectura3);
Serial.print(texto);
delay(200);

 
 delay(200);

}
