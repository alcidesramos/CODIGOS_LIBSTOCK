 // Lcd pinout settings
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D4 at RD0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D7_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD0_bit;

unsigned int contador=0;
float frecuencia;
char texto[20];
char flag_cero=0;


void interrpcion() iv 0x0004 ics ICS_AUTO 
{

  if (INTF_bit==1)
  {
       TMR1ON_bit=0;  //para el conteo del timer
      contador=(TMR1H<<8)| TMR1L;  // arma los 16 bits del timer en contador
      flag_cero=1;
      TMR1H=0;
      TMR1L=0;
     TMR1ON_bit=1;  //para el conteo del timer

     }

  INTF_bit=0;

}

void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
{
//variables temporales
int largo_entera,largo_n,cont_for,tempo_int;
double tempo_float;
//largo de la trama a armar en decimales
largo_n = decimales_+1;
largo_entera = 0;
// si es negativa coloca el -
if ( numero_ < 0)
  {
  *cadena_++ = '-';
  numero_ = -numero_;
  }
//si es menor que no multiplica por 10
if (numero_ > 0.0) while (numero_ < 1.0)
  {
  numero_ =numero_* 10.0;
  largo_entera--;
  }

  //realiza division varias veces hasta que sea menor que 10
while (numero_ >= 10.0)
  {
  numero_ = numero_/10.0;
  largo_entera++;   //sube el largo de la trama por ser deciaml
 }
 largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera

//round. numero_ is between 1 and 10 and largo_n will be printed to
// right of decimal point so rounding is ...
for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
  tempo_float = tempo_float/10.0;
numero_ += tempo_float/2.0;
if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
//si tiene decimales
if (largo_entera<0)
  {
   *cadena_++ = '0'; *cadena_++ = '.';
   if (largo_n < 0) largo_entera = largo_entera-largo_n;
   for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
  }
for (cont_for=0; cont_for < largo_n; cont_for++)
  {
  tempo_int = numero_;
  *cadena_++ = tempo_int + 48;  //convierte a ascci
  if (cont_for ==  largo_entera ) *cadena_++ = '.';
  numero_ -= (tempo_float=tempo_int);
  numero_ = numero_*10.0;
  }
*cadena_ =0;    //anexa final de linea
}


void main()

{

INTCON=0b01000000;   // HABILITA INTERRPCIONES DE PERIFERICOS

TRISB.b0=1; //ENTRADA DE FRECUENCIA

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,"   FRECUENCIA =");

       // CONFIGURACION TIMER1



  //configuracion del timer 1 para almacenar el ancho de pulso
   t1con=0;

   //configura el preescalador  1
   T1CKPS1_bit=0;
   T1CKPS0_bit=0;

   //limpia registros del timer
   TMR1L=0;
   TMR1H=0;
   
   TMR1ON_bit=0;  //timer quieto


  INTEDG_bit=1;  //interrupcion por flanco de nivel de subida
  
  INTF_bit=0;//Limpia la bandera de interrpción.
  
  INTE_bit=1;//Habilita la interrupción por cambio de nivel

  GIE_bit=1;  //Habilita interrupcioes       BIT  7 EL INTCON
    
    while (1)
    
    {
     Lcd_Out(2,5,"                  ");  //muestra pasos timer1
   if (flag_cero!=0)   frecuencia=(Clock_kHz()*1e3)/(contador*4.0);
   else    frecuencia=0;
   flag_cero=0;
    FloatToStr_(frecuencia,texto,2);
    Lcd_Out(2,5,texto);  //muestra pasos timer1
    Lcd_Out_CP(" HZ");  //muestra pasos timer1
    Delay_ms(100);

    
    
    
    }


}