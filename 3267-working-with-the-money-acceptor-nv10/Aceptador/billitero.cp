#line 1 "C:/Users/Alcides Ramos/Desktop/Aceptador/billitero.c"
unsigned char pulsos_var=0;
char flag_bill=0;
char texto[30];
unsigned int dinero;


void interrpciones() iv 0x0008 ics ICS_AUTO
{
 if (INT0IF_bit==1)
 {
 flag_bill=0;
 TMR0H=146;
 TMR0L=35;
 TMR0ON_bit=1;
 pulsos_var++;
 INT0IF_bit=0;

 }

 if (TMR0IF_bit==1)
 {
 TMR0H=146;
 TMR0L=35;

 TMR0ON_bit=0;
 flag_bill=1;
 TMR0IF_bit=0;

 }



}

 void billetero ()
 {
 if (flag_bill==1)
 {

 flag_bill=0;
 dinero=pulsos_var*1000;
 sprinti(texto,"SALDO=%u\r\n",dinero);
 UART1_Write_Text(texto);

 }



 }



void main()

{

INTCON=0b01000000;
ADCON1=0x0F;


CMCON=7;



TRISA=255;
TRISB=255;
trisc=255;

TRISB7_bit=0;

TRISB1_bit=0;

LATB1_bit=0;

 RC6_bit=0;

 UART1_Init(9600);



 INT0IF_bit=0;
 INTEDG0_bit=0;
 INT0IE_bit=1;



 T0CON=0;
 TMR0ON_bit=0;

 TMR0H=146;
 TMR0L=35;

 T0PS2_bit=1;
 T0PS1_bit=1;
 T0PS0_bit=1;

 TMR0IF_bit=0;
 TMR0IE_bit=1;
 TMR0ON_bit=0;


 GIE_bit=1;

 UART1_Write_Text("Iniciando\r\n");

 while(1)
 {
 billetero();
 UART1_Write_Text("FUNCIONANDO\r\n");
 LATB7_bit=~LATB7_bit;
 Delay_ms(1000);


 }


}
