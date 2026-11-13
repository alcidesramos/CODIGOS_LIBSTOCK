#include "max6675.h"



float temperatura;
char texto[22];

// LCD module connections
sbit LCD_RS at RB1_bit;
sbit LCD_RW at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB1_bit;
sbit LCD_RW_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
// End LCD module connections


//funcion de flotante a string
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
void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

void main()
{
// TODO DIGIATAL
   ANSEL=0;
   ANSELH=0;

  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,2,"TEMPERATURA=");


 TRISC6_bit=0;// salida tx
 TRISC7_bit=1; // entrada rx
  UART1_Init(9600);
   max6675_init();  //incializa el sensor
  Uart1_write_text_const("INICIANDO\r\n");
  
  while (1)
  {
      temperatura= max6675_lee(); //lee el sensor
       FloatToStr_(temperatura, texto,2);
      Uart1_write_text_const("TEMPERATURA=");
      UART1_Write_Text(texto);
      Uart1_write_text_const("\r\n");
       Lcd_Out(2,7,texto);
       delay_ms(500);



  
  
  }


}