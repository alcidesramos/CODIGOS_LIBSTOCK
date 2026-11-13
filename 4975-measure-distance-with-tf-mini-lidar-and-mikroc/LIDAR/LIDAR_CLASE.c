#include "tf_mini.h"

//#define tf_hex

// LCD module connections
sbit LCD_RS at RA5_bit;
sbit LCD_EN at RA4_bit;
sbit LCD_D4 at RA3_bit;
sbit LCD_D5 at RA2_bit;
sbit LCD_D6 at RA1_bit;
sbit LCD_D7 at RA0_bit;

sbit LCD_RS_Direction at TRISA5_bit;
sbit LCD_EN_Direction at TRISA4_bit;
sbit LCD_D4_Direction at TRISA3_bit;
sbit LCD_D5_Direction at TRISA2_bit;
sbit LCD_D6_Direction at TRISA1_bit;
sbit LCD_D7_Direction at TRISA0_bit;
// End LCD module connections

#define led1  LATB0_bit


//variables de la int serial lidar
extern char flag_rx_lidar;
extern unsigned int distancia;
extern unsigned int fuerza;
extern float distancia_float;


char texto[20];

void INTERRUPCION() iv 0x0008 ics ICS_AUTO
{

  #ifdef  tf_hex
    tf_mini_interrupcion_hex();
    #else
     tf_mini_interrupcion_str();
    #endif

}

void main() 
{
   INTCON=0;
 INTCON.b6=1;
ADCON1=0B1111; //TODO DIGITAL
TRISC6_bit=0; // TX   SALIDA
TRISC7_bit=1;  //RX ENTRADA
TRISB0_bit=0;     //salida led1



  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1,9,"LIDAR");

tf_mini_config();      //entra en configuracion

#ifdef tf_hex
tf_mini_out_hex();   //salida en hexadecimal
#else
tf_mini_out_str(); //salida en string
#endif


 RCIF_bit=0 ;
//LIMPIA ERRORES PRECVIOS DE RECEPCION
 CREN_bit=0;
 CREN_bit=1;
 RCIE_bit=1;//HABILITA INT SERIAL
 GIE_bit=1; //AUTORIZA INTERRUPCIONES
  while(1)
  {
   if (flag_rx_lidar==1)
        {

         #ifdef  tf_hex
        procesa_lidar_hex();
         sprintf(texto,"DIST=%u",(unsigned int)distancia);
         Lcd_Out(3,5,"           ");
         Lcd_Out(3,5,texto);
         #else

         procesa_lidar_str();
         sprintf(texto,"DIST=%.1f",distancia_float);
         Lcd_Out(3,5,"            ");
         Lcd_Out(3,5,texto);

         #endif

       // limpia errores de desvordamiento serial
       CREN_bit=0;
       CREN_bit=1;
       RCIF_bit=0;   // limnpia la bandera de interrpcion
       RCIE_bit=1;// habilita la interrpcion nuevamente

       flag_rx_lidar=0;

        }
        led1=!led1;
        Delay_ms(200);
  
  
  }

}