#include "soft_i2c_lcd.h"
// Software I2C connections
sbit Soft_I2C_Sda           at RD1_bit;
sbit Soft_I2C_Scl           at RD0_bit;
sbit Soft_I2C_Sda_Direction at TRISD1_bit;
sbit Soft_I2C_Scl_Direction at TRISD0_bit;

void main()
{
trisb=0;

 Soft_I2C_Init();
 Delay_ms(100);



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