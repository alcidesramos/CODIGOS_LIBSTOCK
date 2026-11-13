#line 1 "C:/Users/Taller Electronica/Desktop/video serial/pic/serial1.c"
#line 12 "C:/Users/Taller Electronica/Desktop/video serial/pic/serial1.c"
char trama[30];
char procesa[30];
char dato;


void m1derecha()
{
  RB0_bit =1;
  RB1_bit =0;
}

void m1izquierda()
{
  RB0_bit =0;
  RB1_bit =1;
 }

void m1quieto()
{
 RB0_bit =0;
  RB1_bit =0;
}



void main()

{

 uart1_init(9600);
 trisb.b0=0;
 trisb.b1=0;
 trisc.b2=0;
 trisc.B4=0;
 trisc.b5=0;



 pwm1_init(300);
 PWM1_Set_Duty(100);
 PWM1_Start();


 m1quieto();


 while (1)
 {

 UART1_read_Text(trama,"*",30);


 if (strstr(trama,"led1="))
 {
 if (strstr(trama,"on"))  RC5_bit =1;
 else  RC5_bit =0;
 }

 else if (strstr(trama,"led2="))
 {
 if (strstr(trama,"on"))  RC4_bit =1;
 else  RC4_bit =0;
 }

 else if (strstr(trama,"m1der")) m1derecha();

 else if (strstr(trama,"m1izq")) m1izquierda();

 else if (strstr(trama,"m1stop")) m1quieto();

 else if (strstr(trama,"m1pwm="))
 {
 strcpy(procesa, strtok(trama, "="));
 strcpy(procesa, strtok(0, "/"));

 dato=atoi(procesa);
 PWM1_Set_Duty(dato);


 }




 }




}
