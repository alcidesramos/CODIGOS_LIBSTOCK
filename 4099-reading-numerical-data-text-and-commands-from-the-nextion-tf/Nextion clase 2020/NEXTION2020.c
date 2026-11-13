#include "Nextion.h"

sbit LED1 at LATC0_bit;
sbit LED2 at LATC1_bit;
sbit LED at LATd7_bit;


// LCD module connections
sbit LCD_RS at LATD0_bit;
sbit LCD_EN at LATD1_bit;
sbit LCD_D4 at LATD2_bit;
sbit LCD_D5 at LATD3_bit;
sbit LCD_D6 at LATD4_bit;
sbit LCD_D7 at LATD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;
// End LCD module connections


// variables asociadas a la nextion
extern char flag_rx1;
extern char trama_rx_nextion[];
unsigned char captura_nextion[20];
unsigned char nextion_var;
unsigned char nextion_var_corta;
unsigned long nextion_var_larga;
char texto[50];


void interrupciones() iv 0x0008 ics ICS_AUTO 
{
    nextion_interrupcion();


}
  void procesa_rx_nextion()
  {
      char largo_cap;  // largo de la trama capturada

     //UART1_Write_Text(trama_rx_nextion);
     
        // orden puntal
      if (strstr(trama_rx_nextion,"onle1"))  led1=1;
     else if (strstr(trama_rx_nextion,"offle1"))  led1=0;
     
     //solo una variables de un byte
     else  if (strstr(trama_rx_nextion,"pwm1"))    // analiza la orden
 {
 strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
  strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
    nextion_var_corta=captura_nextion[0];
    // porcesar el valor
  PWM1_Set_Duty(nextion_var_corta); // saca el valor capturado

 }
// si es una variable numerica mas de 1 byte
  else  if (strstr(trama_rx_nextion,"va1"))
 {

  strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
  strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
  // prueba solo cuando es un byte
  //  nextion_var=captura_nextion[0];
 // PWM1_Set_Duty(nextion_var); // saca el valor capturado

   largo_cap=strlen(captura_nextion);

   switch (largo_cap)
   {
      case 1:
         nextion_var_larga=(unsigned long)captura_nextion[0];
            break;

      case 2:
           nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256;
            break;

      case 3:
            nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256+(unsigned long)captura_nextion[2]*65536;
            break;

      case 4:
         nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256+(unsigned long)captura_nextion[2]*65536+(unsigned long)captura_nextion[3]*16777216;
            break;
      } // fin del switch

        LongWordToStr(nextion_var_larga,texto);      // lo pasa a cadena
         Ltrim(texto); // quita espacios vacios a la izquierda
       //  lo muestra en el lcd
         Lcd_Out(2,2,"            ");// borra antes de escribir
         Lcd_Out(2,2,texto);

  }
      // varibles tipo texto
         else   if (strstr(trama_rx_nextion,"text1"))
     {
    strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
    strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
     Lcd_Out(3,1,"            ");   // borra linea
     Lcd_Out(3,1,captura_nextion);

      }
     // variables tipo arreglo
        else if (strstr(trama_rx_nextion,"led"))
    {

     strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));  //inicia captura de tokens desde el /
  strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
   nextion_var=atoi(captura_nextion); // captura la psocion
  strcpy(captura_nextion, strtok(0, "/"));  //captura hasta el 1 dato
   nextion_var_corta=atoi(captura_nextion);     // captura el estado
     switch (nextion_var)
     {
       case 1:
             led1= nextion_var_corta;
             break;

       case 2:
             led2= nextion_var_corta;
             break;



    }// fin del switch
   }




  
  }
void main() 
{
// todo digital
ADCON1=0B1111;

TRISC6_bit=0; // TX   SALIDA
TRISC7_bit=1;  //RX ENTRADA

TRISC2_bit=0; // SALIDA PWM
//SALIDA LEDS
TRISC0_bit=0;
TRISC1_bit=0;
TRISD7_bit=0;
INTCON=0b01000000;

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,"   NEXTION 2020");
//UART1_Init(9600);
PWM1_Init(500);
PWM1_Set_Duty(127);
PWM1_Start();
//UART1_Write_Text("PROBANDO");
  nextion_init();
  GIE_bit=1; // autoriza inrerrpciones

       while (1)
       {
        if (flag_rx1==1)
        {
       procesa_rx_nextion();
      memset(trama_rx_nextion,0,50);// limpia la trama
       // limpia errores de desvordamiento serial
       CREN_bit=0;
       CREN_bit=1;
       RCIF_bit=0;   // limnpia la bandera de interrpcion
       RCIE_bit=1;// habilita la interrpcion nuevamente
        flag_rx1=0;

        
        }
       
       
       LED=!led;
       Delay_ms(150);
       
       }


}