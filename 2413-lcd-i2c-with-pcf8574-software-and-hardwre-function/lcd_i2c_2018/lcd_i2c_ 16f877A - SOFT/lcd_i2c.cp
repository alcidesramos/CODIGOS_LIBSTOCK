#line 1 "E:/Mikroelectronica/lcd_i2c_2018/lcd_i2c_ 16f877A - SOFT/lcd_i2c.c"


sbit Soft_I2C_Sda at RD1_bit;
sbit Soft_I2C_Scl at RD0_bit;
sbit Soft_I2C_Sda_Direction at TRISD1_bit;
sbit Soft_I2C_Scl_Direction at TRISD0_bit;
#line 24 "E:/Mikroelectronica/lcd_i2c_2018/lcd_i2c_ 16f877A - SOFT/lcd_i2c.c"
 I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
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
 Delay_ms(1);

 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);


 lcddata = ((out_char << 4) & 0xF0)| 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);

 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);

}

 void I2C_LCD_init()
{


 unsigned char lcddata;

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
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);
lcddata=0x80;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);



lcddata=0x00;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);
lcddata=0xC0;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);


lcddata=0x00;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);
lcddata=0x20 |  0x08 ;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);




lcddata=0x00;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);
lcddata=0x10;
I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);
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
 Delay_ms(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);

 lcddata = ((out_char << 4) & 0xF0) | 0x01  | 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x01 );
 Delay_ms(1);


}

void I2C_LCD_Chr_Cp(char out_char)
 {
 unsigned char lcddata;
 lcddata = (out_char & 0xF0)| 0x01  | 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 Delay_ms(1);

 lcddata = ((out_char << 4) & 0xF0)| 0x01  | 0x08 ;
 I2C_PCF8574_Write( 0x4E ,lcddata |  0x04 );
 Delay_ms(1);
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x04 );
 I2C_PCF8574_Write( 0x4E ,lcddata & ~ 0x01 );
 Delay_ms(1);



}


void I2C_LCD_Out(char row, char col, char *text) {
 while(*text)
 I2C_LCD_Chr(row, col++, *text++);
}

void I2C_LCD_Out_Cp(char *text) {
 while(*text)
 I2C_LCD_Chr_Cp(*text++);
}


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
