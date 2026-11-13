#line 1 "C:/Users/Taller Electronica/Desktop/video serial/FULL DUPLEX - LUCES/pic18F/serial1.c"
#line 19 "C:/Users/Taller Electronica/Desktop/video serial/FULL DUPLEX - LUCES/pic18F/serial1.c"
char trama[30];
char procesa[30];
char dato;


char datorx;
char puntero=0;
char flag_rx=0;



unsigned int codigo;
float temperatura;

char texto[20];


char luces[]={0b00100,0b01010,0b10001,0b01010,0b00100};
char recorre=0;
char sacar;

unsigned int veces=0;



void m1derecha()
{
  LATB0_bit =1;
  LATB1_bit =0;
}

void m1izquierda()
{
  LATB0_bit =0;
  LATB1_bit =1;
 }

void m1quieto()
{
 LATB0_bit =0;
  LATB1_bit =0;
}

void procesarx()
{
if (strstr(trama,"led1="))
 {
 if (strstr(trama,"on"))  LATC5_bit =1;
 else  LATC5_bit =0;
 }

 else if (strstr(trama,"led2="))
 {
 if (strstr(trama,"on"))  LATC4_bit =1;
 else  LATC4_bit =0;
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
 if (puntero>=30) puntero=0;
 if (datorx=='*')
 {
 RCIE_bit=0;
 flag_rx=1;

 }
 RCIF_bit=0;

 }

 if (TMR1IF_bit)
 {
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;


 veces++;
 if (veces>=10)
 {

 sacar=luces[recorre];
 sacar=sacar<<1;
 LATA= sacar;
 recorre++;
 if (recorre>=4) recorre=0;
 veces=0;

 }

 }



}

void InitTimer1(){
 T1CON = 0x11;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}



void main()

{

 uart1_init(9600);
 trisb.b0=0;
 trisb.b1=0;
 trisc.b2=0;
 trisc.B4=0;
 trisc.b5=0;
 trisc.b3=0;

 trisb.b7=1;

 trisa=0;
 trisa.B0=1;



 ANSEL=0;
 ANSELH=0;

 ANSEL.AN0=1;


 pwm1_init(300);
 PWM1_Set_Duty(100);
 PWM1_Start();


 m1quieto();
  LATC5_bit =0;
  LATC4_bit =0;

 INTCON=0b01000000;
 RCIF_bit=0;
 RCIE_bit=1;

 GIE_bit=1;


 InitTimer1();

 while (1)
 {

 if (flag_rx==1)
 {

 procesarx();
 puntero=0;
 memset(trama,0,30);
 flag_rx=0;
 RCIF_bit=0;
 RCIE_bit=1;
 }

 codigo=ADC_Read(0);
 temperatura=codigo*500.0/1023.0;





 sprintf(texto,"temp=%.2f/",temperatura);
 UART1_Write_Text(texto);

 if ( RB7_bit ==1) UART1_Write_Text("led=on/");
 else UART1_Write_Text("led=off/");


  LATC3_bit =~ LATC3_bit ;
 Delay_ms(50);




 }




}
