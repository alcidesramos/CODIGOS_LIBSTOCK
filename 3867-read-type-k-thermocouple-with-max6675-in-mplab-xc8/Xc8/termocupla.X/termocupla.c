/*
 * File:   termocupla.c
 * Author: Alcides Ramos
 *
 * Created on 8 de agosto de 2020, 10:40 PM
 */


// PIC16F886 Configuration Bit Settings

// 'C' source line config statements

// CONFIG1
#pragma config FOSC = XT        // Oscillator Selection bits (XT oscillator: Crystal/resonator on RA6/OSC2/CLKOUT and RA7/OSC1/CLKIN)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled and can be enabled by SWDTEN bit of the WDTCON register)
#pragma config PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)
#pragma config MCLRE = ON       // RE3/MCLR pin function select bit (RE3/MCLR pin function is MCLR)
#pragma config CP = OFF         // Code Protection bit (Program memory code protection is disabled)
#pragma config CPD = OFF        // Data Code Protection bit (Data memory code protection is disabled)
#pragma config BOREN = ON       // Brown Out Reset Selection bits (BOR enabled)
#pragma config IESO = OFF       // Internal External Switchover bit (Internal/External Switchover mode is disabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enabled bit (Fail-Safe Clock Monitor is disabled)
#pragma config LVP = ON         // Low Voltage Programming Enable bit (RB3/PGM pin has PGM function, low voltage programming enabled)

// CONFIG2
#pragma config BOR4V = BOR40V   // Brown-out Reset Selection bit (Brown-out Reset set to 4.0V)
#pragma config WRT = OFF        // Flash Program Memory Self Write Enable bits (Write protection off)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.


#include <xc.h>

#include	<ctype.h>
#include	<stdlib.h>
#include  "ctype.h"

//CONEXIONES DEL LCD
#define RS RB1
#define EN RB3
#define D4 RB4
#define D5 RB5
#define D6 RB6
#define D7 RB7

#include "Librerias\definiciones.h"
#include "Librerias\lcd.h"
#include "Librerias\max6675.h"
#include "Librerias\uart.h"


float temperatura;
   char texto[22];

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




void main(void) 
{
    // TODO DIGITAL
   ANSEL=0;
   ANSELH=0;
   // LIMPIA EL BIT RW
 TRISB=0;// salida puerto lcd
    
       Lcd_Init();
       Lcd_Clear();
        Lcd_Set_Cursor(1,2);
       Lcd_Write_String("TEMPERATURA=");

       TRISC6=0;// salida tx
      TRISC7=1; // entrada rx
        Uart1_Init(9600);
   max6675_init();  //incializa el sensor
   Uart1_write_text("INICIANDO\r\n");

    
    
    while(1)
       

    {
      temperatura= max6675_lee(); //lee el sensor
       floattostr_(temperatura, texto,2); 
        Uart1_write_text("TEMPERATURA=");
       Uart1_write_text(texto);
       Uart1_write_text("\r\n");
        
      Lcd_Set_Cursor(2,7);
        Lcd_Write_String(texto);
 
      __delay_ms(500);

        
    
    
    }
    
    return;
}
