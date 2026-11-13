#line 1 "C:/Users/Alcides Ramos/Desktop/INTERRPCIONES 2/Interrupcion2/INterrpcion/Mikroc/_RX.c"










char luces[]={0b00000001,0b00000010,0b00000100,0b00001000,0b00010000,0b00100000,0b01000000,0b10000000};
char cuenta1=0;

sbit led3 at RA0_bit;
sbit sw at RA1_bit;



char trama_rx[30];
char procesa[30];

char dato_rx;

char cuenta=0;


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


void INTERRPCION() iv 0x0004 ics ICS_AUTO
{
 if(INTF_bit==1)
 {
 led3=!led3;


 INTF_bit=0;
 }


}

void main()
{



ADCON1=0b0111;

TRISA=0;
TRISB=0 ;
TRISC=0;
TRISC7_bit=1;
TRISB0_bit=1;
INTCON=0B01000000;


UART1_Init(9600);
PWM1_Init(300);
PWM1_Set_Duty(127);
PWM1_Start();
 UART1_Write_Text("HOLA MUNDO");
 RCEN_bit=1;


 INTF_bit=0;
 INTE_bit=1;
 INTEDG_bit=0;

 GIE_bit=1;



 while (1)
 {

 UART1_read_Text(trama_rx,"*",30);
 if (strstr(trama_rx,"led1="))
 {
 if (strstr(trama_rx,"on"))  RC5_bit =1;
 else  RC5_bit =0;
 }

 else if (strstr(trama_rx,"led2="))
 {
 if (strstr(trama_rx,"on"))  RC4_bit =1;
 else  RC4_bit =0;
 }

 else if (strstr(trama_rx,"m1der")) m1derecha();
 else if (strstr(trama_rx,"m1izq")) m1izquierda();
 else if (strstr(trama_rx,"m1stop")) m1quieto();




 else if (strstr(trama_rx,"m1pwm="))
 {
 strcpy(procesa, strtok(trama_rx, "="));
 strcpy(procesa, strtok(0, "*"));

 dato_rx=atoi(procesa);
 PWM1_Set_Duty(dato_rx);


 }






 Delay_ms(500);

 }




}
