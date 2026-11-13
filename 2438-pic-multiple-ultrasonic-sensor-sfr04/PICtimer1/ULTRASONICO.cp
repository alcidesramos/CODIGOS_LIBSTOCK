#line 1 "C:/Users/Alcides Ramos/Desktop/multiple_ultraso_mikroc_pic/PICtimer1/ULTRASONICO.c"

const unsigned char cristal=Clock_MHz();




sbit disparo at LATA5_bit;







char texto[17];


unsigned int contador=0;
float distancia;



char LEEBIT (char *port, char bit1)
{

 if ((*port & (1 << bit1))>0) return (1);
 else return (0);
}


float lee_distancia(char *puerto,char pin)
{
 float calculo;



 disparo=1;
 Delay_us(10);
 disparo=0;


 TMR1ON_bit=0;
 TMR1L=0;
 TMR1h=0;
 TMR1IF_bit=0;
 TMR1ON_bit=1;

 while (LEEBIT(puerto,pin)==0)

 {
 if ( TMR1IF_bit==1)
 {
 return (-1);
 break;
 }
 }

 TMR1ON_bit=0;
 TMR1L=0;
 TMR1h=0;
 TMR1IF_bit=0;
 TMR1ON_bit=1;

 while (LEEBIT(puerto,pin)==1)
 {
 if ( TMR1IF_bit==1)
 {
 return (0);
 break;
 }
 }

 TMR1ON_bit=0;
 contador=(TMR1H <<8) | TMR1L;

calculo=(float)contador*0.0343*4.0/(2.0* (cristal/4.0) ) ;
 return (calculo);



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



void main()
{

OSCCON=0;
OSCTUNE=0;

SCS1_bit=1;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;


SPLLEN_bit=1;

UART1_Init(9600);

ansela=0;

TRISA=0b11111111;
trisa.b0=0;
trisa.b5=0;
disparo=0;


T1CON=0;


T1CKPS1_bit=1;
T1CKPS0_bit=0;







 while (1)
 {
 distancia=lee_distancia(&porta, 1 );
 FloatToStr_(distancia ,texto,2);
 UART1_Write_Text("Dis1=");
 UART1_Write_Text(texto);
 UART1_Write('\r');
 Delay_ms(50);

 distancia=lee_distancia(&porta, 2 );
 FloatToStr_(distancia ,texto,2);
 UART1_Write_Text("Dis2=");
 UART1_Write_Text(texto);
 UART1_Write('\r');
 Delay_ms(50);

 distancia=lee_distancia(&porta, 3 );
 FloatToStr_(distancia ,texto,2);
 UART1_Write_Text("Dis3=");
 UART1_Write_Text(texto);
 UART1_Write('\r');
 Delay_ms(50);



 distancia=lee_distancia(&porta, 4 );
 FloatToStr_(distancia ,texto,2);
 UART1_Write_Text("Dis4=");
 UART1_Write_Text(texto);
 UART1_Write('\r');
 Delay_ms(50);


 Delay_ms(500);


 }


}
