//MOTOR DE LA IZQUIERDA

#define MI1  4
#define MI2  5
#define MIH  3

//MOTOR DE LA DERECHA
#define MD1  11
#define MD2  10
#define MDH  9

//LEDS

#define led_d  13
#define led_i  12

//parlante

#define parla  0

void  adelante()
{
//ADELANTE
digitalWrite(MI1, 0);
digitalWrite(MI2, 1);
digitalWrite(MD1, 1);
digitalWrite(MD2, 0);
digitalWrite(MIH, 1);
digitalWrite(MDH, 1);

}

void atras()
{
//ATRAS

digitalWrite(led_d, 1);
digitalWrite(led_i, 1);
digitalWrite(MI1, 1);
digitalWrite(MI2, 0);
digitalWrite(MD1, 0);
digitalWrite(MD2, 1);
digitalWrite(MIH, 1);
digitalWrite(MDH, 1);

}

void derecha()
{
digitalWrite(led_d, 1);
digitalWrite(led_i, 0);


digitalWrite(MI1, 0);
digitalWrite(MI2, 1);
digitalWrite(MD1, 0);
digitalWrite(MD2, 1);
digitalWrite(MIH, 1);
digitalWrite(MDH, 1);

}


void izquierda()
{
//IZQUIERDA
digitalWrite(led_d, 0);
digitalWrite(led_i, 1);

digitalWrite(MI1, 1);
digitalWrite(MI2, 0);
digitalWrite(MD1, 1);
digitalWrite(MD2, 0);
digitalWrite(MIH, 1);
digitalWrite(MDH, 1);
delay(1000);



}


void quieto()
{
//QUIETO
digitalWrite(led_d, 0);
digitalWrite(led_i, 0);

digitalWrite(MI1, 0);
digitalWrite(MI2, 0);
digitalWrite(MD1, 0);
digitalWrite(MD2, 0);
digitalWrite(MIH, 0);
digitalWrite(MDH, 0);


}

void melodia1()
{*

tone(parla, 1000);
delay(200);
tone(parla, 2000);
delay(200);
noTone(parla);
delay(300);
tone(parla, 4000);
delay(200);


}


void setup() {
  // put your setup code here, to run once:

//todos los pines son saluida
pinMode(MI1, OUTPUT);
pinMode(MI2, OUTPUT);
pinMode(MIH, OUTPUT);
pinMode(MD1, OUTPUT);
pinMode(MD2, OUTPUT);
pinMode(MDH, OUTPUT);
pinMode(led_d, OUTPUT);
pinMode(led_i, OUTPUT);
pinMode(parla, OUTPUT);

adelante();
delay(1000);
atras();
delay(1000);
derecha();
delay(1000);
adelante();
delay(1000);
izquierda();
delay(1000);
quieto();

}

void loop() {
  // put your main code here, to run repeatedly:
melodia1();


}