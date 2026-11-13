#line 1 "C:/Users/Alcides_Ramos/Desktop/video nextion/pic/NEXTION.c"
sbit led at portb.b0;
sbit pulsador at portb.b1;

unsigned int codigo;
unsigned int velocidad_grafica;
float velocidad,temperatura;

signed char trama[30];
signed char envia[30];

char cuenta=0;
char flag_rx=0;

char dato=0,dato_1=0,dato_2;


void interrpcion() iv 0x0004 ics ICS_AUTO
{

 if (RCIF_bit==1)
 {
 dato=RCREG;
 trama[cuenta]=dato;
 if (( cuenta>3) && ((unsigned char)trama[cuenta]==0xff) && ((unsigned char)trama[cuenta-1]==0xff) && ((unsigned char)trama[cuenta-2]==0xff) )
 {
 flag_rx=1;
 CREN_bit=0;
 GIE_bit=0;
 }

 cuenta++;

 if (cuenta>=30)
 {
 flag_rx=0;
 cuenta=0;
 }

 RCIF_bit=0;
 }


}


void procesa_rx()
 {
 if (flag_rx==1)

 {
 if ( strstr(trama,"led1=on" )) led=1;
 else if ( strstr(trama,"led1=off" )) led=0;
 else if ( strstr(trama,"pw1=" ))
 {
 dato=trama[5];
 PWM1_Set_Duty(dato);
 }

 memset(trama,0,30);
 cuenta=0;
 flag_rx=0;
 RCIF_bit=0;
 CREN_bit=1;
 GIE_bit=1;
 }
 }



void floattostr_(float x, unsigned char *str,char precision)
{


int ie, i, k, ndig;
double y;
ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
ie = 0;

if ( x < 0)
 {
 *str++ = '-';
 x = -x;
 }

if (x > 0.0) while (x < 1.0)
 {
 x *= 10.0;
 ie--;
 }
while (x >= 10.0)
 {
 x = x/10.0;
 ie++;
 }
 ndig += ie;


for (y = i = 1; i < ndig; i++)
 y = y/10.;
x += y/2.;
if (x >= 10.0) {x = 1.0; ie++;}
if (ie<0)
 {
 *str++ = '0'; *str++ = '.';
 if (ndig < 0) ie = ie-ndig;
 for (i = -1; i > ie; i--) *str++ = '0';
 }
for (i=0; i < ndig; i++)
 {
 k = x;
 *str++ = k + '0';
 if (i == ie ) *str++ = '.';
 x -= (y=k);
 x *= 10.0;
 }
*str = '\0';
}

void manda_serial_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}





void main()
{
TRISA.B0=1;
TRISA.B1=1;
trisb.b0=0;
TRISC.b6=0;
trisc.b7=1;
trisc.b2=0;
trisb.b1=1;
adcon1=0;
INTCON=0b01000000;

UART1_Init(9600);
led=0;
memset(trama,0,30);



RCIF_bit=0;
RCIE_bit=1;
GIE_bit=1;


PWM1_Init(500);
PWM1_Set_Duty(100);
PWM1_Start();

 while (1)
 {
 codigo=ADC_Read(0);
 temperatura=codigo*500.0/1023.0;


 codigo=ADC_Read(1);
 velocidad=codigo*100.0/1023.0;


 sprinti(envia,"pa1.te2.val=%d",(unsigned int)temperatura);
 UART1_Write_Text(envia);

 manda_serial_const("\xFF\xFF\xFF");


 temperatura=0.8654*temperatura + 10.032;
 sprinti(envia,"pa1.te1.val=%d",(unsigned int)temperatura);
 UART1_Write_Text(envia);
 manda_serial_const("\xFF\xFF\xFF");


 if (velocidad>20) velocidad_grafica= 3.152*velocidad - 65.949;
 else velocidad_grafica= 2.92*velocidad + 298.6;

 sprinti(envia,"pa0.ve1.val=%d",velocidad_grafica);
 UART1_Write_Text(envia);
 manda_serial_const("\xFF\xFF\xFF");



 floattostr_(velocidad,envia,2);
 manda_serial_const("pa0.ve2.txt=\"");
 UART1_Write_Text(envia);
 manda_serial_const("\"");

 manda_serial_const("\xFF\xFF\xFF");
 Delay_ms(1);


 if (pulsador==1) manda_serial_const("pa1.led.pic=1");
 else manda_serial_const("pa1.led.pic=2");
 manda_serial_const("\xFF\xFF\xFF");
 procesa_rx();
 Delay_ms(30);






 }



}
