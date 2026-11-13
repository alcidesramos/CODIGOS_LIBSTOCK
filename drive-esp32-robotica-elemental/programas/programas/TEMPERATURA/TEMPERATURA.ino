
#include "BluetoothSerial.h"


BluetoothSerial SerialBT;
#include <OneWire.h>
#include <DallasTemperature.h>

// GPIO where the DS18B20 is connected to
#define oneWireBus  25 //pin sensor    

// Setup a oneWire instance to communicate with any OneWire devices
OneWire oneWire(oneWireBus);

// Pass our oneWire reference to Dallas Temperature sensor 
DallasTemperature sensors(&oneWire);
#define led 2

#define MD1 12
#define MD2 13
#define MI1 14
#define MI2 27

//definiciones ultrasonido
#define disparo  26
#define eco 26

long duracion;
float distancia;
void adelante()
{

digitalWrite(MD1,0);
digitalWrite(MD2,1);
digitalWrite(MI1,0);
digitalWrite(MI2,1);



}


void parar()
{

digitalWrite(MD1,0);
digitalWrite(MD2,0);
digitalWrite(MI1,0);
digitalWrite(MI2,0);
}


void atras()
{

digitalWrite(MD1,1);
digitalWrite(MD2,0);
digitalWrite(MI1,1);
digitalWrite(MI2,0);

}

void derecha()
{

digitalWrite(MD1,0);
digitalWrite(MD2,1);
digitalWrite(MI1,1);
digitalWrite(MI2,0);

}


void izquierda()
{

digitalWrite(MD1,1);
digitalWrite(MD2,0);
digitalWrite(MI1,0);
digitalWrite(MI2,1);

}



void setup() {
  // put your setup code here, to run once:
pinMode(MD1,OUTPUT);
pinMode(MD2,OUTPUT);
pinMode(MI1,OUTPUT);
pinMode(MI2,OUTPUT);

//sensor ultrasonico y led
  pinMode(disparo, OUTPUT); // disparo salida
  pinMode(eco, INPUT); // eco entrada
  pinMode(led, OUTPUT); // led salida
SerialBT.begin("TEMPERATURA"); // Nombre del dispositivo Bluetooth

}

void loop()

{
 sensors.requestTemperatures(); 
  float temperatura = sensors.getTempCByIndex(0);
SerialBT.print("*T");
SerialBT.print(temperatura);
SerialBT.print("*");
 delay(1000);

}

void loop1() {
  // put your main code here, to run repeat

//coidgo ultrASONICO
 // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(disparo, HIGH);
  delayMicroseconds(10);
  digitalWrite(disparo, LOW);
  
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duracion = pulseIn(eco, HIGH);
  
  // Calculate the distance
  distancia = duracion  /59.0;
  
  
SerialBT.print("*D");
SerialBT.print(distancia);
SerialBT.print("*");


//  if(distancia>=200)  digitalWrite(led,1);
  //else digitalWrite(led,0);
 
   delay(200);

//MIRA SI HAY DATOS EN EL PUERTO
if (SerialBT.available()) 
   {
  
//GUARDA EL DATO LEIDO
char dato= SerialBT.read();

//MIRA QUE ORDEN ES Y LA EJECUTA.
  if (dato=='A')  adelante();
  else if (dato=='B')  atras();
  else if (dato=='D')  derecha();
  else if (dato=='I')  izquierda();
  else if (dato=='P')  parar();
  else if (dato=='L')  digitalWrite(led, 1);
  else if (dato=='M')  digitalWrite(led, 0);
  
 
   }

}