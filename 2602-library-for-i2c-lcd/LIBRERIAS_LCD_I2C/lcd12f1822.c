


  // Software I2C connections
sbit Soft_I2C_Sda  at RA0_bit;
sbit Soft_I2C_Scl at RA1_bit;
sbit Soft_I2C_Sda_Direction at TRISA0_bit;
sbit Soft_I2C_Scl_Direction  at TRISA1_bit;



void main()
{
//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

//SPLLEN_bit=1; //Prende el PLL por 4  entonces 32


//Todo Digital
ansela=0;
TRISA=0;
   LATA=0;
   
   
    i2c_lcd_Init();                        // Initialize LCD
     i2c_lcd_Cmd(_lcd_CLEAR);               // Clear display
     i2c_lcd_Cmd(_lcd_CURSOR_OFF);          // Cursor off  opcinal

     //listo para escribir
       i2c_lcd_Out(1,5,"ESTO ES UNA" );
       i2c_lcd_Out(2,1,"    PRUEBA" );

       i2c_lcd_Out(3,1,"temp=30" );
       i2c_lcd_Chr_CP(223);
   
   
   
   while (1)
   {
   
   
   }



}