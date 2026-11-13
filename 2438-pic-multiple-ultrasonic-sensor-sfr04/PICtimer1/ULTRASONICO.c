
const unsigned char cristal=Clock_MHz();//obtiene el reloj en mega  usado en el projecto
#define  Frec_real (cristal/4.0)        //Frecuencia de trabajo real



sbit disparo at   LATA5_bit;
#define eco1  1
#define eco2  2
#define eco3  3
#define eco4  4



char texto[17];// para almacenar la cadena


unsigned int contador=0;//valor del timer
float distancia;


//funcion para leer un bit de un registro
char LEEBIT (char *port, char bit1)
{

    if ((*port & (1 << bit1))>0) return (1);
    else return (0);
}


float lee_distancia(char *puerto,char pin)  //lee en el pin especificado
{
  float calculo;

  
 //pulso de disparo de 10us
  disparo=1;
  Delay_us(10);
  disparo=0;
  
  //limpia el contador
  TMR1ON_bit=0; //TIMER QUIETO
  TMR1L=0;// limpia parte baja
  TMR1h=0; //limpia parte alta
  TMR1IF_bit=0; //limpia la bandera de desboradmiento
  TMR1ON_bit=1; //Arranca el timer

       while (LEEBIT(puerto,pin)==0)

       {
        if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
            {
            return (-1);// si no hay sensor conectado retorna -1
            break;
            }
       }

  TMR1ON_bit=0; //TIMER QUIETO
  TMR1L=0;// limpia parte baja
  TMR1h=0; //limpia parte alta
  TMR1IF_bit=0; //limpia la bandera de desboradmiento
  TMR1ON_bit=1; //Arranca el timer

              while (LEEBIT(puerto,pin)==1)
       {
            if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
            {
            return (0);// si no hay eco
            break;
            }
       }
   
  TMR1ON_bit=0; //paro timer
   contador=(TMR1H <<8) |  TMR1L;   // arma el valor del timer rotando 8 la parte alta y sumando la baja

calculo=(float)contador*0.0343*4.0/(2.0*Frec_real) ; //en cencimetro  //preescaldor =4
   return (calculo);



}

//funcion para decimales
void floattostr_(float x, unsigned char *str,char precision)
{
/* converts a floating point number to an ascii string */
/* x is stored into str, which should be at least 30 chars long */
int ie, i, k, ndig;
double y;
ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
ie = 0;
/* if x negative, write minus and reverse */
if ( x < 0)
  {
  *str++ = '-';
  x = -x;
  }
/* put x in range 1 <= x < 10 */
if (x > 0.0) while (x < 1.0)
  {
  x *= 10.0;                // a la place de =*
  ie--;
  }
while (x >= 10.0)
  {
  x = x/10.0;
  ie++;
 }
 ndig += ie;           // a la place de =+
//round. x is between 1 and 10 and ndig will be printed to
// right of decimal point so rounding is ...
for (y = i = 1; i < ndig; i++)
  y = y/10.;
x += y/2.;
if (x >= 10.0) {x = 1.0; ie++;}
if (ie<0)
  {
   *str++ = '0'; *str++ = '.';
   if (ndig < 0) ie = ie-ndig;
   for (i = -1; i > ie; i--)  *str++ = '0';
  }
for (i=0; i < ndig; i++)
  {
  k = x;
  *str++ = k + '0';
  if (i ==  ie ) *str++ = '.';
  x -= (y=k);
  x *= 10.0;
  }
*str = '\0';
}



void main() 
{
//configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

// Par Trabajar a 32 MHz con PLL
SPLLEN_bit=1; //prende el PLL por 4

UART1_Init(9600);
//Todo Digital
ansela=0;
//configuracion de los pines todo entrada
TRISA=0b11111111;
trisa.b0=0; //salida tx
trisa.b5=0; //salida  pin de trigger o disparo
disparo=0; //inicia en cero el pin de disparo
// configuracion del tiemr 1

T1CON=0;  //limpia registor del timer 1

//preescalador en 8
T1CKPS1_bit=1;
T1CKPS0_bit=0;





   
   
   while (1)
   {
   distancia=lee_distancia(&porta,eco1);
  FloatToStr_(distancia ,texto,2); // 2 decimales
   UART1_Write_Text("Dis1=");
  UART1_Write_Text(texto);
   UART1_Write('\r'); // enter y final de linea
   Delay_ms(50);
  
   distancia=lee_distancia(&porta,eco2);
  FloatToStr_(distancia ,texto,2); // 2 decimales
   UART1_Write_Text("Dis2=");
  UART1_Write_Text(texto);
   UART1_Write('\r'); // enter y final de linea
   Delay_ms(50);

   distancia=lee_distancia(&porta,eco3);
  FloatToStr_(distancia ,texto,2); // 2 decimales
   UART1_Write_Text("Dis3=");
  UART1_Write_Text(texto);
   UART1_Write('\r'); // enter y final de linea
   Delay_ms(50);
   


   distancia=lee_distancia(&porta,eco4);
  FloatToStr_(distancia ,texto,2); // 2 decimales
   UART1_Write_Text("Dis4=");
  UART1_Write_Text(texto);
   UART1_Write('\r'); // enter y final de linea
   Delay_ms(50);


    Delay_ms(500);

   
   }


}