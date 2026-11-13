#line 1 "C:/Users/Alcides Ramos/Desktop/multi/MULTI.c"
unsigned int conteo=0;




sbit EN1 at LATC0_bit;
sbit EN2 at LATC1_bit;
sbit EN3 at LATC2_bit;
sbit EN4 at LATA2_bit;

sbit LED at LATA1_bit;


char codigo_siete[]={63,6,91,79,102,109,125,7,127,111};
char multiplexa=1;

char digito1,digito2,digito3,digito4;
char texto[20];

void apaga_siete()
{
EN1=0;
EN2=0;
EN3=0;
EN4=0;
}

 void Interrupcion() iv 0x0008 ics ICS_AUTO

 {
 if (TMR1IF_bit==1)
 {

 TMR1H=231;
 TMR1L=150;
 apaga_siete();

 switch (multiplexa)
 {
 case 0b00001:
  LATB =codigo_siete[digito1];
 EN1=1;
 break;

 case 0b0010:
  LATB =codigo_siete[digito2];
 EN2=1;
 break;

 case 0b0100:
  LATB =codigo_siete[digito3];
 EN3=1;
 break;

 case 0b1000:
  LATB =codigo_siete[digito4];
 EN4=1;
 break;


 }
 multiplexa=multiplexa<<1;

 if (multiplexa==0b10000) multiplexa=1;





 TMR1IF_bit=0;
 }


 }

void mostrar()
{
 sprintf(texto,"%04d\r\n",conteo);
 digito1=texto[3]-48;
 digito2=texto[2]-48;
 digito3=texto[1]-48;
 digito4=texto[0]-48;

}


void main()
{
ADCON1=0B1111;

TRISA=0;
TRISB=0;
TRISC=0;
INTCON=0B01000000;
 UART1_Init(9600);

 T1CON=0;

 T1CKPS1_bit=0;
 T1CKPS0_bit=1;

 TMR1H=231;
 TMR1L=150;

 TMR1IF_bit=0;
 TMR1IE_bit=1;
 TMR1ON_bit=1;

 GIE_bit=1;

 while (1)
 {

 if (conteo>9999) conteo=0;
 mostrar();
 conteo+=10;
 UART1_Write_Text(texto);
 Delay_ms(150);




 }




}
