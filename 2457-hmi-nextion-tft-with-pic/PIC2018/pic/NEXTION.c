sbit led at portb.b0;
sbit pulsador at portb.b1;

unsigned int codigo;   // LEEREL CODIGO EL ADC
unsigned int velocidad_grafica;
float velocidad,temperatura;

signed char trama[30];//vector para guarda la trama Recibida
signed char envia[30]; //Vector para guardar la trama a enviada

char cuenta=0;//contador de datos que llegan
char flag_rx=0;//bandera de que la nextion mando info

char dato=0,dato_1=0,dato_2;  //variables para guardar fin d etrama de la nextion


void interrpcion() iv 0x0004 ics ICS_AUTO 
{

    if (RCIF_bit==1)//analiza si hay dato serial
  {
      dato=RCREG;  //lee el dato
       trama[cuenta]=dato;   //lo almcena en el vector
           if (( cuenta>3) && ((unsigned char)trama[cuenta]==0xff) && ((unsigned char)trama[cuenta-1]==0xff) && ((unsigned char)trama[cuenta-2]==0xff) )
           {
             flag_rx=1;//activa la bandera de que llego trama comple y ista para procesar
            CREN_bit=0;  //DESHABILITA LA RECEPCION CONTINU PARA LIMPIAR BUFFER    Y NO RECIBIR MIENTRA VA A NALIZAR
             GIE_bit=0;  //deshabilita las interrpciones para poder procesar la trama
           }

       cuenta++;//incrementa contador o puntero del vectro de recibido
       //si es mayor que 30 debe limpiar la bandera y reiniciar el contador llego al maximo
        if (cuenta>=30)
      {
      flag_rx=0;
      cuenta=0;
      }

     RCIF_bit=0;//limpia el bit de interrupcion
   }


}


void procesa_rx()
  {
        if (flag_rx==1)//si la bandera de la trama esta activa

      {
                    if ( strstr(trama,"led1=on" ))  led=1;
                else  if ( strstr(trama,"led1=off" ))  led=0;
                else  if ( strstr(trama,"pw1=" ))
                {
                dato=trama[5];   //captura el 5 dato
                PWM1_Set_Duty(dato); //lo saca por pwm
                }

       memset(trama,0,30);
        cuenta=0;  //limpia el contador
      flag_rx=0; //limpia la bandera
       RCIF_bit=0; //limpia la bandera de interrpcion
       CREN_bit=1;
      GIE_bit=1; //habilita interrpcion
       }
   }
   

//funcion que convierte decimal a cadena
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

void manda_serial_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}





void main()
{
TRISA.B0=1;
TRISA.B1=1;
trisb.b0=0; //salida portb
TRISC.b6=0; //salida pin TX
trisc.b7=1;  // entrada pin RX
trisc.b2=0;  // salida pin PWM
trisb.b1=1; //entrada del switch
adcon1=0;//  3 canalea analogos
INTCON=0b01000000;   //bit 6 del intcon en hab interrpciones parciales

UART1_Init(9600);
led=0;
memset(trama,0,30);


//habilita int serial
RCIF_bit=0;
RCIE_bit=1;
GIE_bit=1;
//CREN_bit=1; //recepcion continua
//inicia el pwm a una frecenca de 1000
PWM1_Init(500);
PWM1_Set_Duty(100);
PWM1_Start();

  while (1)
  {
  codigo=ADC_Read(0);  //lee canal cero
   temperatura=codigo*500.0/1023.0;     //calcula la temperatura

   //lee el voltaje canal 1
   codigo=ADC_Read(1);
   velocidad=codigo*100.0/1023.0;  //lo pasa de 0 % a 100%

   //lo pasa a una variable entera , pierde decimales
   sprinti(envia,"pa1.te2.val=%d",(unsigned int)temperatura); //arma de una la trama a enviar
   UART1_Write_Text(envia);//envia la trama
//manda los 3 datos FF  que necesita la nextion
  manda_serial_const("\xFF\xFF\xFF");

  //aplica cuacion para vizualizador grafic0
  temperatura=0.8654*temperatura + 10.032;
 sprinti(envia,"pa1.te1.val=%d",(unsigned int)temperatura);
   UART1_Write_Text(envia);//envia la trama
   manda_serial_const("\xFF\xFF\xFF");

    //envia la velocidad grafica
 if (velocidad>20) velocidad_grafica=  3.152*velocidad - 65.949;
 else  velocidad_grafica= 2.92*velocidad + 298.6;
  //arma la trama de envio, solo recibe enteros
 sprinti(envia,"pa0.ve1.val=%d",velocidad_grafica);
   UART1_Write_Text(envia);//envia la trama
  manda_serial_const("\xFF\xFF\xFF");

 //envia la velocidad numerica y con decimales
  //lo pasa a cadena 2 deciamles
   floattostr_(velocidad,envia,2);    // 2 decimales
   manda_serial_const("pa0.ve2.txt=\""); //manda primera parte de la trama
   UART1_Write_Text(envia);     //manda el dato
   manda_serial_const("\"");   //mada final
   //manda los 3 datos FF  que necesita la nextion
   manda_serial_const("\xFF\xFF\xFF");
    Delay_ms(1);

 //manda el dato del pulsador para activar el led
  if (pulsador==1) manda_serial_const("pa1.led.pic=1");
  else manda_serial_const("pa1.led.pic=2");
  manda_serial_const("\xFF\xFF\xFF");
  procesa_rx();
  Delay_ms(30);

  
  
  
  
  
  }



}