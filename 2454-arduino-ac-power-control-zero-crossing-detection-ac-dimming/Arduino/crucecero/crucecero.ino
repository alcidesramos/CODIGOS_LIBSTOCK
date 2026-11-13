
#define sbi(x, y) x |= _BV(y)    // set bit
#define cbi(x, y) x &= ~(_BV(y)) // clear bit
#define tbi(x, y) x ^= _BV(y)    // toggle bit
#define is_high(x, y) ((x & _BV(y)) == _BV(y))



unsigned char cuanto;
unsigned int velocidad=0;
unsigned int codigo;

#define opto 2
#define  triac 3 


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



void  espera(unsigned int tiempo)
{
  
  write_tmr1(tiempo);
  sbi(TIFR1,TOV1); // pone un uno para limpiar bandera de desborde
  while  (is_high(TIFR1, TOV1)==0);// espera a que se desbordel timer1 cuando  TOV1=1;
     
  
}



void setup()
{
  // put your setup code here, to run once:

  
//configura el timer 0
pinMode(opto,INPUT);
pinMode(triac, OUTPUT);

//Configura registroA
TCCR1A=0;
//configura registroB
TCCR1B=0;
TCCR1B=0b010;// Configura el preescalador a 8 se desborda en 32 ms
sbi(TIFR1,TOV1); // pone un uno para 

}

void loop() {
  // put your main code here, to run repeatedly:


  
  codigo =analogRead(0);// lee potenciometro

  if (codigo<=200) digitalWrite(triac,LOW);
  else if (codigo>=900) digitalWrite(triac,HIGH);

  else  //sino aplica el detector cruce por cero
  {
  velocidad=map(codigo,0,1023,49600,65535);

  
  while(digitalRead(opto)==0);// espera cruce por cero
  
  espera(velocidad);// retardo de disparo
  digitalWrite(triac,HIGH);
  delayMicroseconds(100);
  digitalWrite(triac,LOW);

  } 


}
