
// PINES USADOS  EN EL PCF8574
// P7, P6, P5, P4 = Data, P3=Backlight (BL), P2=E, P1=RW, P0=RS
#define LCD_ADDR 0x4E     //direccion del i2c   A2A1A0 1
//#define LCD_ADDR 0x7E      //direccion del i2c  0b0100 A2A1A0 0

//ARDUINO
//#define LCD_ADDR 0x27      //direccion del i2c  0b0100 A2A1A0 1
//#define LCD_ADDR 0x3F      //direccion del i2c  0b0100 A2A1A0 0

#define LCD_BL 0x08
#define LCD_EN 0x04
#define LCD_RS 0x01


 //funcion que escribe en el PCF8574
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
  //Coloca  4 bit alto
  lcddata = (out_char & 0xF0)|LCD_BL;
  I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
  Delay_ms(1);
  // RE=0
  I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
  Delay_ms(1);

    // Coloca los 4 bits bajo
    lcddata = ((out_char << 4) & 0xF0)|LCD_BL;
    I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
  Delay_ms(1);
    // ESCRIBE PULSO DE RE
    I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
  Delay_ms(1);

}

 void I2C_LCD_init()
{


    unsigned char lcddata;

  Delay_ms(20); //retardo de inicializacion
  // INICIA PROCESO DE INICIALIZACION
lcddata=0x30;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(5);

lcddata=0x30;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(5);

lcddata=0x30;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN); //envia comando de inicializacion
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(5);


//modo a 4  bits
lcddata=0x20;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);

//modo a 4 lineas
lcddata=0x20;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);
lcddata=0x80;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(5);

//Apaga el LCD
lcddata=0x00;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);
lcddata=0x80;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);


 //Prende el LCD
lcddata=0x00;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);
lcddata=0xC0;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);

 //Ajusta desplazamiento del cursor
lcddata=0x00;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);
lcddata=0x20 | LCD_BL;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);



 //Borra la pantalla
lcddata=0x00;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
 Delay_ms(1);
lcddata=0x10;
I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
 Delay_ms(1);
I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
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


  lcddata = (out_char & 0xF0)| LCD_RS |LCD_BL;
  I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
  Delay_ms(1);
  I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
  Delay_ms(1);

  lcddata = ((out_char << 4) & 0xF0) |LCD_RS |LCD_BL;
  I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
  Delay_ms(1);
  I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
  I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
  Delay_ms(1);


}

void I2C_LCD_Chr_Cp(char out_char)
 {
   unsigned char lcddata;
  lcddata = (out_char & 0xF0)|LCD_RS |LCD_BL;
  I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
  Delay_ms(1);
  I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
  Delay_ms(1);

  lcddata = ((out_char << 4) & 0xF0)|LCD_RS |LCD_BL;
  I2C_PCF8574_Write(LCD_ADDR,lcddata | LCD_EN);
  Delay_ms(1);
  I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_EN);
  I2C_PCF8574_Write(LCD_ADDR,lcddata & ~LCD_RS);
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
