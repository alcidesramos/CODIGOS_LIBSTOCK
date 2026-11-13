#line 1 "C:/Users/Alcides Ramos/Desktop/LCD2018/video/12F1822/lcd12f1822.c"




sbit Soft_I2C_Sda at RA0_bit;
sbit Soft_I2C_Scl at RA1_bit;
sbit Soft_I2C_Sda_Direction at TRISA0_bit;
sbit Soft_I2C_Scl_Direction at TRISA1_bit;



void main()
{

IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;





ansela=0;
TRISA=0;
 LATA=0;


 i2c_lcd_Init();
 i2c_lcd_Cmd(_lcd_CLEAR);
 i2c_lcd_Cmd(_lcd_CURSOR_OFF);


 i2c_lcd_Out(1,5,"ESTO ES UNA" );
 i2c_lcd_Out(2,1,"    PRUEBA" );

 i2c_lcd_Out(3,1,"temp=30" );
 i2c_lcd_Chr_CP(223);



 while (1)
 {


 }



}
