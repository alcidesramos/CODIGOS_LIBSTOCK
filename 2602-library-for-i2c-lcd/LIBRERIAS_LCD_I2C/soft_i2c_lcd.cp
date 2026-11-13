#line 1 "C:/Users/Alcides Ramos/Desktop/LCD2018/video/12F1822/soft_i2c_lcd.c"
#line 1 "c:/users/alcides ramos/desktop/lcd2018/video/12f1822/soft_i2c_lcd.h"

extern sbit Soft_I2C_Sda ;
extern sbit Soft_I2C_Scl;
extern Soft_I2C_Sda_Direction;
extern Soft_I2C_Scl_Direction ;
#line 21 "c:/users/alcides ramos/desktop/lcd2018/video/12f1822/soft_i2c_lcd.h"
void I2C_LCD_Cmd(char out_char);
void I2C_LCD_init() ;
void I2C_LCD_Chr(char row, char column, char out_char);
void I2C_LCD_Chr_Cp(char out_char);
void I2C_LCD_Out(char row, char col, char *text);
void I2C_LCD_Out_Cp(char *text);
#line 6 "C:/Users/Alcides Ramos/Desktop/LCD2018/video/12F1822/soft_i2c_lcd.c"
 void I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
{
 Soft_I2C_Start();
 Soft_I2C_Write (  0x4E );
Soft_I2C_Write (value);
Soft_I2C_Stop();

}

void I2C_LCD_Cmd(char out_char)
{
 unsigned char lcddata;

 lcddata = (out_char & 0xF0)| 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);

 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);


 lcddata = ((out_char << 4) & 0xF0)| 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);

 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);

}

 void I2C_LCD_init()
{


 unsigned char lcddata;
 Soft_I2C_Init();
 Delay_ms(20);

lcddata=0x30;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(5);

lcddata=0x30;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(5);

lcddata=0x30;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(5);



lcddata=0x20;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);


lcddata=0x20;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);
lcddata=0x80;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(5);


lcddata=0x00;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);
lcddata=0x80;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);



lcddata=0x00;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);
lcddata=0xC0;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);


lcddata=0x00;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);
lcddata=0x20 |  0x08 ;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);




lcddata=0x00;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);
lcddata=0x10;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);
}


void I2C_LCD_Chr(char row, char column, char out_char)
{

 unsigned char byte,lcddata;

 switch(row){

 case 1:
 I2C_LCD_Cmd(0x80 + (column - 1));
 break;
 case 2:
 I2C_LCD_Cmd(0xC0 + (column - 1));
 break;
 case 3:
 I2C_LCD_Cmd(0x94 + (column - 1));
 break;
 case 4:
 I2C_LCD_Cmd(0xD4 + (column - 1));
 break;
 }


 lcddata = (out_char & 0xF0)|  0x01  | 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);

 lcddata = ((out_char << 4) & 0xF0) | 0x01  | 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x01 );
 Delay_us(1);


}

void I2C_LCD_Chr_Cp(char out_char)
 {
 unsigned char lcddata;
 lcddata = (out_char & 0xF0)| 0x01  | 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_us(1);

 lcddata = ((out_char << 4) & 0xF0)| 0x01  | 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_us(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x01 );
 Delay_us(1);



}


void I2C_LCD_Out(char row, char col, char *text) {
 while(*text)
 I2C_LCD_Chr(row, col++, *text++);
}

void I2C_LCD_Out_Cp(char *text) {
 while(*text)
 I2C_LCD_Chr_Cp(*text++);
}
