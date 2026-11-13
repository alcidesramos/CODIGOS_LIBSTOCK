#include "irarz.h"

#define led 11
#define led1 12
 
 int  irpin=2;  //   debe declararse el pin usado para detectar el sensor ir
 unsigned long codigo_ir; // variable salida has que almcena codigo unico

#define IRSTART  0X01AB1F84D
#define IRSTOP  0X0A125AA0D



void setup() {
  // put your setup code here, to run once:
pinMode(led, OUTPUT);
pinMode(led1, OUTPUT);
Serial.begin(9600); // inicia comunicacion a 9600
ir_init();//  inicializa el receptor ir

}

void loop() {
  // put your main code here, to run repeatedly:
     analiza_ir();
    Serial.println(codigo_ir,HEX);//deshabilitar si se desea
    if (codigo_ir==IRSTART)      digitalWrite(led1, HIGH);
   else if (codigo_ir==IRSTOP)  digitalWrite(led1, LOW);

    digitalWrite(led, HIGH);
    delay(50);
   digitalWrite(led, LOW);
    delay(50);


}
