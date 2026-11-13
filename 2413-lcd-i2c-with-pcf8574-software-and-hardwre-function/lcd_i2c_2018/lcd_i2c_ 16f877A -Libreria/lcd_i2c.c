#include "i2c_lcd.h"

void main()
{
trisb=0;
//pines i2c salida
 trisc.b3=1;
 trisc.b4=1;


  I2C1_Init(100000);


 I2C_LCD_init();
  I2C_LCD_Cmd(_LCD_CLEAR);
  I2C_LCD_Cmd(_LCD_CURSOR_OFF);
  I2C_LCD_Out(1,1,"Hola mundo");
  I2C_LCD_Out(2,1,"Todo Bien");


 while (1)
 {
     RB7_bit=~RB7_bit;
     Delay_ms(1000);
 }



}