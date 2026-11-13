//#include "BluetoothSerial.h"

//BluetoothSerial SerialBT;

int led=2;
String input; 
char trama[100];



// Crear un objeto de tipo HardwareSerial para el puerto UART que deseas usar


void setup() {
  // put your setup code here, to run once:
//HardwareSerial Serial2(UART_NUM_2);

Serial.begin(9600);
pinMode(led, OUTPUT);
Serial2.begin(9600);
//SerialBT.begin("ESP32_ARZ"); // Nombre del dispositivo Bluetooth

}

void loop() {
  // put your main code here, to run repeatedly:

digitalWrite(led, 1);
delay (500);
//Serial.println("QUIEN COMO DIOS");
//Serial2.println("QUIEN COMO JESUS");
digitalWrite(led, 0);
delay (500);
/*SerialBT.println("SON MI TODO");

 if (SerialBT.available()) 
 {
  //input = SerialBT.readStringUntil('*');  //lee hasta que llegue el asterisco
  input = SerialBT.readString();  //lee hasta que llegue el asterisco
  
  input.toCharArray(trama, 100);  //convierte la trama a char, pendejadas de arduino
   Serial.println(trama);

 }*/
}