#line 1 "E:/Mikroelectronica/lcd_i2c_2018/lcd_i2c_ 16f877A/lcd_i2c.c"
#line 17 "E:/Mikroelectronica/lcd_i2c_2018/lcd_i2c_ 16f877A/lcd_i2c.c"
 I2C_PCF8574_Write(unsigned char Adr,unsigned char value)
{

I2C1_Start();
 I2C1_Wr( Adr );
I2C1_Wr(value);
I2C1_Stop();
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
