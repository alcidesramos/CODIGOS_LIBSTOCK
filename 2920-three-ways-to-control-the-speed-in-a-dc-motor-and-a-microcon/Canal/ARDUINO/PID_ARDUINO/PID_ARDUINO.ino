#define sbi(x, y) x |= _BV(y)    // set bit
#define cbi(x, y) x &= ~(_BV(y)) // clear bit
#define tbi(x, y) x ^= _BV(y)    // toggle bit
#define is_high(x, y) ((x & _BV(y)) == _BV(y))


#define pwm_pin 3
#define rpm_pin 2
unsigned int codigo;
char texto[20];
const byte interruptPin = 2;
unsigned long contador,micros1;
char flag_cero=0;

float frecuencia;
float rpm;

//variables pid
//float kp=40,ki=5,kd=20;
float kp=15,ki=1,kd=0;
float salida;

float error,up,ui=0.0,ui_=0.0,error_=0.0,ud,ut;
float set_point=0;

void pid(float pid_in)

{const float max_x=255;
const float min_x=0;
const float t_muestreo=1;//4e-3;

//Calculando el error
error=set_point-pid_in;
   up=kp*error;
       ui=ui_ + (ki*t_muestreo*error);
       ud=kd*(error-error_)/t_muestreo;
        ut=up+ui+ud;
        if (ut>max_x) ut=max_x;
        if (ut<min_x) ut=min_x;
        ui_=ui;
        error_=error;

}





void write_tmr1( unsigned int i )
{
unsigned char sreg;

//Guarda registro de estado
sreg = SREG;
//desabilita las interrpciones
//noInterrupts();
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
//noInterrupts();
//lee el tiemr1
i = TCNT1;
//recupera registro de estado
SREG = sreg;
return i;
}


void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
{
//variables temporales
int largo_entera,largo_n,cont_for,tempo_int;
double tempo_float;

//largo de la trama a armar en decimales
largo_n = decimales_+1;
largo_entera = 0;
// si es negativa coloca el -
if ( numero_ < 0)
  {
  *cadena_++ = '-';
  numero_ = -numero_;
  }
//si es menor que no multiplica por 10
if (numero_ > 0.0) while (numero_ < 1.0)
  {
  numero_ =numero_* 10.0;
  largo_entera--;
  }

  //realiza division varias veces hasta que sea menor que 10
while (numero_ >= 10.0)
  {
  numero_ = numero_/10.0;
  largo_entera++;   //sube el largo de la trama por ser deciaml
 }
 largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera

//round. numero_ is between 1 and 10 and largo_n will be printed to
// right of decimal point so rounding is ...
for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
  tempo_float = tempo_float/10.0;
numero_ += tempo_float/2.0;
if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
//si tiene decimales
if (largo_entera<0)
  {
   *cadena_++ = '0'; *cadena_++ = '.';
   if (largo_n < 0) largo_entera = largo_entera-largo_n;
   for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
  }
for (cont_for=0; cont_for < largo_n; cont_for++)
  {
  tempo_int = numero_;
  *cadena_++ = tempo_int + 48;  //convierte a ascci
  if (cont_for ==  largo_entera ) *cadena_++ = '.';
  numero_ -= (tempo_float=tempo_int);
  numero_ = numero_*10.0;
  }
*cadena_ =0;    //anexa final de linea
}



void interrupcion()
{
contador=read_tmr1();
write_tmr1(0);  
flag_cero=1;
  
  
 }

void setup() 
{
  // put your setup code here, to run once:
 // put your setup code here, to run once:
  pinMode(pwm_pin,OUTPUT);
  pinMode(rpm_pin,INPUT);

   pinMode(interruptPin, INPUT_PULLUP);
 attachInterrupt(digitalPinToInterrupt(interruptPin), interrupcion, RISING);
  
  
  Serial.begin(19200);
  Serial.println("INICIANDO");
  analogWrite(pwm_pin,0);

  //Configura registroA
TCCR1A=0;
//configura registroB
TCCR1B=0;
TCCR1B=0b010;// Configura el preescaldro a 8
write_tmr1(0);
sbi(TIFR1,TOV1); // pone un uno para limpiar bandera de desborde
 
 

}

void loop() {
  // put your main code here, to run repeatedly:

  codigo=analogRead(0);
  analogWrite(pwm_pin,codigo>>2);

  // se lee la frecuencia
   if (flag_cero!=0)   frecuencia=(16000000/(8*contador));  //16.0 ES EL CRISTAL DE LA ARDUINO   8 es el preescaldor 
  // else    frecuencia=0;
   flag_cero=0;
   //rpm=frecuencia*60.0;

 // se Aplica algoritmo on OFF
   set_point=0.3402*codigo + 42.0;// escala en ranfo de mini frec y max frex

   pid(frecuencia);
   salida=ut;

  analogWrite(pwm_pin,ut);

floattostr_(set_point,texto,2);
   Serial.print("SP=") ;
   Serial.print(texto);
    Serial.print("/");
   
floattostr_(frecuencia,texto,2);
   Serial.print("RPM=") ;
   Serial.print(texto);
    Serial.println("/");
    
 
  
   
 


delay(80);



}
