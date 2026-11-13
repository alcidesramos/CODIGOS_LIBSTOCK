
#define sbi(x, y) x |= _BV(y)    // set bit
#define cbi(x, y) x &= ~(_BV(y)) // clear bit
#define tbi(x, y) x ^= _BV(y)    // toggle bit
#define is_high(x, y) ((x & _BV(y)) == _BV(y))


#define disparo 2
#define  eco1   3
#define  eco2   4
#define  eco3   5
#define  eco4   6


unsigned int contador=0;//valor del timer
float distancia;



void write_tmr1( unsigned int i )
{
unsigned char sreg;

//Guarda registro de estado
sreg = SREG;
//desabilita las interrpciones
noInterrupts();
//Carga el vaklor al timer1
TCNT1 = i;
//recupera registro de estado
SREG = sreg;
}


unsigned int read_tmr1()
{
unsigned char sreg;
unsigned int i;
//Guarda registro de estado
sreg = SREG;
//desabilita las interrpciones
noInterrupts();
//lee el tiemr1
i = TCNT1;
//recupera registro de estado
SREG = sreg;
return i;
}



void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); // inicia comunicacion a 9600

  pinMode(eco1,INPUT);
  pinMode(eco2,INPUT);
   pinMode(eco3,INPUT);
   pinMode(eco4,INPUT);
  pinMode(disparo,OUTPUT);
  digitalWrite(disparo, LOW);  //para generar un pulso limpio ponemos a LOW 4us
  
//Configura registroA
TCCR1A=0;
//configura registroB
TCCR1B=0;
TCCR1B=0b010;// Configura el preescaldro a 8
write_tmr1(0);
sbi(TIFR1,TOV1); // pone un uno para limpiar bandera de desborde


}

//entrega el pulso al Sensor ultasonico y lee la distancia
float lee_distancia(char pin)  //lee en el pin especificado

{ 
  float calculo;
  digitalWrite(disparo,HIGH);
    delayMicroseconds(10);
  //limpia la bandera de desborde
  digitalWrite(disparo,LOW);
   
   
  
   sbi(TIFR1,TOV1); // pone un uno para limpiar bandera de desborde
   
  while ( digitalRead(pin)==0)  //espera que el eco se levante 
  {
      if (is_high(TIFR1, TOV1))
      {
    
      sbi(TIFR1,TOV1); // pone un uno para limpiar bandera de desborde
       return(-1);  // si se desborda el timer -1sensor desconectado
        break;
 
      }
  }

  write_tmr1(0);
   
        while (digitalRead(pin)==1) // hasta que caiga el eco
        {
        contador=read_tmr1(); //captura el valor del contador 
          
           //si se desborda el timer activa la bandera de desborde, no hay obstaculos frente
              if (is_high(TIFR1, TOV1))
            {
              sbi(TIFR1,TOV1); // pone un uno para limpiar bandera de desborde
            return(0);  // si se desborda el timer no hay obstaculos
              break;
            }
  }
  
   calculo=(float)contador*0.0343*8.0/(2.0*16.0) ; //en cencimetro  //preescaldor =8 crital=16
   return (calculo);
 
  }
  


void loop()
{
  // put your main code here, to run repeatedly:
  
  distancia=lee_distancia(eco1);
  Serial.print("DISTANCIA1= "); 
  Serial.println(distancia);
  delay(50);
   
  distancia=lee_distancia(eco2);
  Serial.print("DISTANCIA2= "); 
  Serial.println(distancia);
      delay(50);

   distancia=lee_distancia(eco3);
  Serial.print("DISTANCIA3= "); 
  Serial.println(distancia);
  delay(50);



  distancia=lee_distancia(eco4);
  Serial.print("DISTANCIA4= "); 
  Serial.println(distancia);
  delay(50);

  Serial.println(""); 
 
  
   
   delay(500);
   

}
