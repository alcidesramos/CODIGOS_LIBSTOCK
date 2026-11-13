#line 1 "C:/Users/Alcides_Ramos/Desktop/ESP8266 2018/Recibe/pic2018/serial1.c"
#line 17 "C:/Users/Alcides_Ramos/Desktop/ESP8266 2018/Recibe/pic2018/serial1.c"
char trama[100];
char procesa[30];
char dato;


char datorx;
char puntero=0;
char flag_rx=0;



unsigned int codigo;
float temperatura;

char texto[20];




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

void procesarx()
{
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


void Interrpcion() iv 0x0008 ics ICS_AUTO


{
 if (RCIF_bit==1)
 {
 datorx=UART1_Read();
 trama[puntero]=datorx;
 puntero++;
 if (puntero>=100) puntero=0;
 if (datorx=='*')
 {
 RCIE_bit=0;
 flag_rx=1;

 }
 RCIF_bit=0;

 }



}


void main()

{

 uart1_init(115200);
 trisb.b0=0;
 trisb.b1=0;
 trisc.b2=0;
 trisc.B4=0;
 trisc.b5=0;
 trisc.b3=0;

 trisb.b7=1;

 trisa.B0=1;



 ANSEL=0;
 ANSELH=0;

 ANSEL.AN0=1;


 pwm1_init(1250);
 PWM1_Set_Duty(100);
 PWM1_Start();


 m1quieto();
  RC5_bit =0;
  RC4_bit =0;

 UART1_Write_Text("ATE0\r\n");
Delay_ms(2000);


UART1_Write_Text("AT+CWMODE=2\r\n");
Delay_ms(200);



UART1_Write_Text("AT+CIPSERVER=0\r\n");
Delay_ms(200);
UART1_Write_Text("AT+CIPMUX=0\r\n");
Delay_ms(200);


UART1_Write_Text("AT+CIPMODE=0\r\n");
Delay_ms(200);

UART1_Write_Text("AT+CWSAP=\"ESP8266_ARZ\",\"noconectar\",5,3\r\n");
Delay_ms(600);

UART1_Write_Text("AT+CIPAP=\"192.168.1.254\"\r\n");
Delay_ms(200);


UART1_Write_Text("AT+CIPMUX=1\r\n");
Delay_ms(200);


UART1_Write_Text("AT+CIPSERVER=1,200\r\n");
Delay_ms(200);


UART1_Write_Text("AT+CIPSTO=0\r\n");





 INTCON=0b01000000;
 RCIF_bit=0;
 RCIE_bit=1;

 GIE_bit=1;




 while (1)
 {

 if (flag_rx==1)
 {

 procesarx();
 puntero=0;
 memset(trama,0,100);
 flag_rx=0;
 RCIF_bit=0;
 RCIE_bit=1;
 }


 }




}
