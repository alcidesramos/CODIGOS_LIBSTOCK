

//#define i2c_soft    // habilitar si se va a trabrajar i2c por software

/*sbit Soft_I2C_Scl           at RC0_bit;
sbit Soft_I2C_Sda           at RC1_bit;
sbit Soft_I2C_Scl_Direction at TRISC0_bit;
sbit Soft_I2C_Sda_Direction at TRISC1_bit;
  */

// SI TRABAJO CON RESET
//#define reset

//declaracion de pin de reset del ss1306
 //sbit RST at LATB2_bit;
 //sbit RST_direction at TRISB2_bit;
 

// INCLIIMOS LIBRERIO DE LA PANTALLA
#include "SSD1306.c"
#include "imagenes.h"

char texto[30];
signed int  cuenta=-5;


void main()
{
  adcon1=0b1111; // todo dIGITAL

   OLED_init();
   OLED_print_text(0,0,"HOLA",&font1);

    OLED_print_text(6,3,"ARZ",&font2);

    OLED_scroll_der(0,5);
    Delay_ms(2000);
    OLED_scroll_izq(0,5);
    Delay_ms(2000);

    
    while(1)
    {
      sprintf(texto,"%3d",cuenta++);
     OLED_print_text(5,6,texto,&font1);
    Delay_ms(100);
    
    if (cuenta==8) OLED_stop_scroll();

    
    
    }
    
    
    
    Delay_ms(1000);
    OLED_clear_screen();
    
    
    
    OLED_print_Image(&truck,OFF);
    
      //OLED_draw_bitmap(0,0,50,50,&media);
      
    
    Delay_ms(3000);
    OLED_clear_screen();



    OLED_print_Image(&carsun,ON);

    

   while (1)
   {
   
   
   }



}