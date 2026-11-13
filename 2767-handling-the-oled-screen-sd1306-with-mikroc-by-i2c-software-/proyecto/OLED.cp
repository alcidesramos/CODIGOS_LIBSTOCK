#line 1 "C:/Users/Alcides Ramos/Desktop/SSD1306/proyecto/OLED.c"




sbit Soft_I2C_Scl at RC0_bit;
sbit Soft_I2C_Sda at RC1_bit;
sbit Soft_I2C_Scl_Direction at TRISC0_bit;
sbit Soft_I2C_Sda_Direction at TRISC1_bit;
#line 1 "c:/users/alcides ramos/desktop/ssd1306/proyecto/ssd1306.c"
#line 1 "c:/users/alcides ramos/desktop/ssd1306/proyecto/fonts.c"
const unsigned char font_regular[92][6] =
{
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00,
 0x00, 0x00, 0x07, 0x00, 0x07, 0x00,
 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14,
 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12,
 0x00, 0x62, 0x64, 0x08, 0x13, 0x23,
 0x00, 0x36, 0x49, 0x55, 0x22, 0x50,
 0x00, 0x00, 0x05, 0x03, 0x00, 0x00,
 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00,
 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00,
 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14,
 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08,
 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00,
 0x00, 0x08, 0x08, 0x08, 0x08, 0x08,
 0x00, 0x00, 0x60, 0x60, 0x00, 0x00,
 0x00, 0x20, 0x10, 0x08, 0x04, 0x02,
 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E,
 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00,
 0x00, 0x42, 0x61, 0x51, 0x49, 0x46,
 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31,
 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10,
 0x00, 0x27, 0x45, 0x45, 0x45, 0x39,
 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30,
 0x00, 0x01, 0x71, 0x09, 0x05, 0x03,
 0x00, 0x36, 0x49, 0x49, 0x49, 0x36,
 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E,
 0x00, 0x00, 0x36, 0x36, 0x00, 0x00,
 0x00, 0x00, 0x56, 0x36, 0x00, 0x00,
 0x00, 0x08, 0x14, 0x22, 0x41, 0x00,
 0x00, 0x14, 0x14, 0x14, 0x14, 0x14,
 0x00, 0x00, 0x41, 0x22, 0x14, 0x08,
 0x00, 0x02, 0x01, 0x51, 0x09, 0x06,
 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E,
 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C,
 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36,
 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22,
 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C,
 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41,
 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01,
 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A,
 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F,
 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00,
 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01,
 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41,
 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40,
 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F,
 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F,
 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E,
 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06,
 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E,
 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46,
 0x00, 0x46, 0x49, 0x49, 0x49, 0x31,
 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01,
 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F,
 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F,
 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F,
 0x00, 0x63, 0x14, 0x08, 0x14, 0x63,
 0x00, 0x07, 0x08, 0x70, 0x08, 0x07,
 0x00, 0x61, 0x51, 0x49, 0x45, 0x43,
 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00,
 0x00, 0x02, 0x04 , 0x08, 0x10, 0x20,
 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00,
 0x00, 0x04, 0x02, 0x01, 0x02, 0x04,
 0x00, 0x40, 0x40, 0x40, 0x40, 0x40,
 0x00, 0x00, 0x01, 0x02, 0x04, 0x00,
 0x00, 0x20, 0x54, 0x54, 0x54, 0x78,
 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38,
 0x00, 0x38, 0x44, 0x44, 0x44, 0x20,
 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F,
 0x00, 0x38, 0x54, 0x54, 0x54, 0x18,
 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02,
 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C,
 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78,
 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00,
 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00,
 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00,
 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00,
 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78,
 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78,
 0x00, 0x38, 0x44, 0x44, 0x44, 0x38,
 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18,
 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC,
 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08,
 0x00, 0x48, 0x54, 0x54, 0x54, 0x20,
 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20,
 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C,
 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C,
 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C,
 0x00, 0x44, 0x28, 0x10, 0x28, 0x44,
 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C,
 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44,
 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
};
#line 1 "c:/users/alcides ramos/desktop/ssd1306/proyecto/ssd1306.h"
#line 13 "c:/users/alcides ramos/desktop/ssd1306/proyecto/ssd1306.h"
extern sbit Soft_I2C_Scl;
extern sbit Soft_I2C_Sda;
extern sbit Soft_I2C_Scl_Direction;
extern sbit Soft_I2C_Sda_Direction;
#line 104 "c:/users/alcides ramos/desktop/ssd1306/proyecto/ssd1306.h"
unsigned char buffer[ 1024 ];


void OLED_init();
void OLED_reset_sequence();
void OLED_write(unsigned char value, unsigned char type);
void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos);
void OLED_fill(unsigned char bmp_data);
void OLED_clear_screen();
void OLED_clear_buffer();
void OLED_cursor(unsigned char x_pos, unsigned char y_pos);
void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img);
void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch);
void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch);
void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value);
void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value);
void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points);
void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points);
void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour);
void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour);
void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type);
void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour);
#line 6 "c:/users/alcides ramos/desktop/ssd1306/proyecto/ssd1306.c"
void OLED_init()
{
#line 15 "c:/users/alcides ramos/desktop/ssd1306/proyecto/ssd1306.c"
  Soft_I2C_Init() ;
 Delay_ms(100);

 OLED_clear_buffer();
 OLED_reset_sequence();

 OLED_write(0X3C,  0x00 );


 OLED_write(( 0xAE  +  0x00 ) ,  0x00 );

 OLED_write( 0xD5 ,  0x00 );
 OLED_write(0x80,  0x00 );

 OLED_write( 0xA8 ,  0x00 );
 OLED_write(0x3F,  0x00 );

 OLED_write( 0xD3 ,  0x00 );
 OLED_write(0x00,  0x00 );

 OLED_write(( 0x40  | 0x00),  0x00 );

 OLED_write( 0x8D ,  0x00 );
 OLED_write(( 0x10  |  0x04 ),  0x00 );

 OLED_write( 0x20 ,  0x00 );
 OLED_write( 0x02 ,  0x00 );

 OLED_write(( 0xA0  |  0x01 ),  0x00 );

 OLED_write(( 0xC0  |  0x08 ),  0x00 );

 OLED_write( 0xDA ,  0x00 );
 OLED_write(0x12,  0x00 );

 OLED_write( 0x81 ,  0x00 );
 OLED_write(0xCF,  0x00 );

 OLED_write( 0xD9 ,  0x00 );
 OLED_write(0xF1,  0x00 );

 OLED_write( 0xDB ,  0x00 );
 OLED_write(0x40,  0x00 );

 OLED_write(( 0xA4  |  0x00 ),  0x00 );

 OLED_write(( 0xA6  |  0x00 ),  0x00 );

 OLED_write(( 0xAE  +  0x01 ) ,  0x00 );

 OLED_gotoxy(0, 0);

 OLED_clear_screen();
}


void OLED_reset_sequence()
{
#line 81 "c:/users/alcides ramos/desktop/ssd1306/proyecto/ssd1306.c"
}

void OLED_write(unsigned char value, unsigned char control_byte)
{
  Soft_I2C_Start ();
  Soft_I2C_Write ( 0X7A );
  Soft_I2C_Write (control_byte);
  Soft_I2C_Write (value);
  Soft_I2C_Stop ();
}


void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
{
 OLED_write(( 0xB0  + y_pos),  0x00 );
 OLED_write(((x_pos & 0x0F) |  0x00 ),  0x00 );
 OLED_write((((x_pos & 0xF0) >> 0x04) |  0x10 ),  0x00 );
}


void OLED_fill(unsigned char bmp_data)
{
 unsigned char x_pos = 0x00;
 unsigned char page = 0x00;

 for(page = 0; page <  8 ; page++)
 {
 OLED_gotoxy( 0 , page);

  Soft_I2C_Start ();
  Soft_I2C_Write ( 0X7A );
  Soft_I2C_Write ( 0x60 );

 for(x_pos =  0 ; x_pos <  128 ; x_pos++)
 {
  Soft_I2C_Write (bmp_data);
 }

  Soft_I2C_Stop ();
 }
}


void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
{
 unsigned char x_pos = 0;
 unsigned char page = 0;

 if(pixel !=  0 )
 {
 pixel = 0xFF;
 }
 else
 {
 pixel = 0x00;
 }

 for(page = 0; page <  8 ; page++)
 {
 OLED_gotoxy( 0 , page);

  Soft_I2C_Start ();
  Soft_I2C_Write ( 0X7A );
  Soft_I2C_Write ( 0x60 );

 for(x_pos =  0 ; x_pos <  128 ; x_pos++)
 {
  Soft_I2C_Write ((*bmp++ ^ pixel));
 }

  Soft_I2C_Stop ();
 }
}


void OLED_clear_screen()
{
 OLED_fill(0x00);
}


void OLED_clear_buffer()
{
 unsigned int s = 0x0000;

 for(s = 0; s <  1024 ; s++)
 {
 buffer[s] = 0x00;
 }
}


void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
{
 unsigned char s = 0x00;

 if(y_pos != 0x00)
 {
 if(x_pos == 1)
 {
 OLED_gotoxy(0x00, (y_pos + 0x02));
 }
 else
 {
 OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
 }

 for(s = 0x00; s < 0x06; s++)
 {
 OLED_write(0xFF,  0x60 );
 }
 }
}


void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, const unsigned char *bmp_img)
{
 unsigned int s = 0x0000;
 unsigned char x_pos = 0x00;
 unsigned char y_pos = 0x00;

 for(y_pos = yb; y_pos <= ye; y_pos++)
 {
 OLED_gotoxy(xb, y_pos);
 for(x_pos = xb; x_pos < xe; x_pos++)
 {
 OLED_write(bmp_img[s++],  0x60 );
 }
 }
}


void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
{
 unsigned char chr = 0x00;
 unsigned char s = 0x00;

 chr = (ch - 0x20);

 if(x_pos > ( 128  - 0x06))
 {
 x_pos = 0x00;
 y_pos++;
 }
 OLED_gotoxy(x_pos, y_pos);

 for(s = 0x00; s < 0x06; s++)
 {
 OLED_write(font_regular[chr][s],  0x60 );
 }
}


void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
{
 unsigned char s = 0x00;

 do
 {
 OLED_print_char(x_pos, y_pos, ch[s++]);
 x_pos += 0x06;
 }while((ch[s] >= 0x20) && (ch[s] <= 0x7F));
}


void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
{
 unsigned char ch = 0x00;

 if(value < 0x00)
 {
 OLED_print_char(x_pos, y_pos, '-');
 value = -value;
 }
 else
 {
 OLED_print_char(x_pos, y_pos,' ');
 }

 if((value > 99) && (value <= 999))
 {
 ch = (value / 100);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 12), y_pos , (48 + ch));
 ch = (value % 10);
 OLED_print_char((x_pos + 18), y_pos , (48 + ch));
 }
 else if((value > 9) && (value <= 99))
 {
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));
 ch = (value % 10);
 OLED_print_char((x_pos + 12), y_pos , (48 + ch));
 OLED_print_char((x_pos + 18), y_pos , 32);
 }
 else if((value >= 0) && (value <= 9))
 {
 ch = (value % 10);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));
 OLED_print_char((x_pos + 12), y_pos , 32);
 OLED_print_char((x_pos + 18), y_pos , 32);
 }
}


void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
{
 unsigned char ch = 0x00;

 if(value < 0)
 {
 OLED_print_char(x_pos, y_pos, '-');
 value = -value;
 }
 else
 {
 OLED_print_char(x_pos, y_pos,' ');
 }

 if(value > 9999)
 {
 ch = (value / 10000);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));

 ch = ((value % 10000)/ 1000);
 OLED_print_char((x_pos + 12), y_pos , (48 + ch));

 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 18), y_pos , (48 + ch));

 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 24), y_pos , (48 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 30), y_pos , (48 + ch));
 }

 else if((value > 999) && (value <= 9999))
 {
 ch = ((value % 10000)/ 1000);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));

 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 12), y_pos , (48 + ch));

 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 18), y_pos , (48 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 24), y_pos , (48 + ch));
 OLED_print_char((x_pos + 30), y_pos , 32);
 }
 else if((value > 99) && (value <= 999))
 {
 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));

 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 12), y_pos , (48 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 18), y_pos , (48 + ch));
 OLED_print_char((x_pos + 24), y_pos , 32);
 OLED_print_char((x_pos + 30), y_pos , 32);
 }
 else if((value > 9) && (value <= 99))
 {
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 12), y_pos , (48 + ch));

 OLED_print_char((x_pos + 18), y_pos , 32);
 OLED_print_char((x_pos + 24), y_pos , 32);
 OLED_print_char((x_pos + 30), y_pos , 32);
 }
 else
 {
 ch = (value % 10);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));
 OLED_print_char((x_pos + 12), y_pos , 32);
 OLED_print_char((x_pos + 18), y_pos , 32);
 OLED_print_char((x_pos + 24), y_pos , 32);
 OLED_print_char((x_pos + 30), y_pos , 32);
 }
}


void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
{
 unsigned char ch = 0x00;

 OLED_print_char(x_pos, y_pos, '.');

 ch = (value / 1000);
 OLED_print_char((x_pos + 6), y_pos , (48 + ch));

 if(points > 1)
 {
 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 12), y_pos , (48 + ch));


 if(points > 2)
 {
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 18), y_pos , (48 + ch));

 if(points > 3)
 {
 ch = (value % 10);
 OLED_print_char((x_pos + 24), y_pos , (48 + ch));
 }
 }
 }
}


void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
{
 signed long tmp = 0x00;

 tmp = value;
 OLED_print_int(x_pos, y_pos, tmp);
 tmp = ((value - tmp) * 10000);

 if(tmp < 0)
 {
 tmp = -tmp;
 }

 if((value >= 9999) && (value < 99999))
 {
 OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
 }
 else if((value >= 999) && (value < 9999))
 {
 OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
 }
 else if((value >= 99) && (value < 999))
 {
 OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
 }
 else if((value >= 9) && (value < 99))
 {
 OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
 }
 else if(value < 9)
 {
 OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
 if((value) < 0)
 {
 OLED_print_char(x_pos, y_pos, '-');
 }
 else
 {
 OLED_print_char(x_pos, y_pos, ' ');
 }
 }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
{
 unsigned char value = 0x00;
 unsigned char page = 0x00;
 unsigned char bit_pos = 0x00;

 page = (y_pos /  8 );
 bit_pos = (y_pos - (page *  8 ));
 value = buffer[((page *  128 ) + x_pos)];

 if((colour &  1 ) !=  0 )
 {
 value |= (1 << bit_pos);
 }
 else
 {
 value &= (~(1 << bit_pos));
 }

 buffer[((page *  128 ) + x_pos)] = value;
 OLED_gotoxy(x_pos, page);
 OLED_write(value,  0x60 );
}


void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
{
 signed int dx = 0x0000;
 signed int dy = 0x0000;
 signed int stepx = 0x0000;
 signed int stepy = 0x0000;
 signed int fraction = 0x0000;

 dy = (y2 - y1);
 dx = (x2 - x1);

 if (dy < 0)
 {
 dy = -dy;
 stepy = -1;
 }
 else
 {
 stepy = 1;
 }

 if (dx < 0)
 {
 dx = -dx;
 stepx = -1;
 }
 else
 {
 stepx = 1;
 }

 dx <<= 1;
 dy <<= 1;

 Draw_Pixel(x1, y1, colour);

 if(dx > dy)
 {
 fraction = (dy - (dx >> 1));
 while (x1 != x2)
 {
 if(fraction >= 0)
 {
 y1 += stepy;
 fraction -= dx;
 }

 x1 += stepx;
 fraction += dy;

 Draw_Pixel(x1, y1, colour);
 }
 }
 else
 {
 fraction = (dx - (dy >> 1));
 while (y1 != y2)
 {
 if (fraction >= 0)
 {
 x1 += stepx;
 fraction -= dy;
 }

 y1 += stepy;
 fraction += dx;

 Draw_Pixel(x1, y1, colour);
 }
 }
}


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
{
 unsigned short i = 0x00;
 unsigned short xmin = 0x00;
 unsigned short xmax = 0x00;
 unsigned short ymin = 0x00;
 unsigned short ymax = 0x00;

 if(fill !=  0 )
 {
 if(x1 < x2)
 {
 xmin = x1;
 xmax = x2;
 }
 else
 {
 xmin = x2;
 xmax = x1;
 }

 if(y1 < y2)
 {
 ymin = y1;
 ymax = y2;
 }
 else
 {
 ymin = y2;
 ymax = y1;
 }

 for(; xmin <= xmax; ++xmin)
 {
 for(i = ymin; i <= ymax; ++i)
 {
 Draw_Pixel(xmin, i, colour);
 }
 }
 }

 else
 {
 Draw_Line(x1, y1, x2, y1, colour);
 Draw_Line(x1, y2, x2, y2, colour);
 Draw_Line(x1, y1, x1, y2, colour);
 Draw_Line(x2, y1, x2, y2, colour);
 }

 if(type !=  0 )
 {
 Draw_Pixel(x1, y1, ~colour);
 Draw_Pixel(x1, y2, ~colour);
 Draw_Pixel(x2, y1, ~colour);
 Draw_Pixel(x2, y2, ~colour);
 }
}


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
{
 signed int a = 0x0000;
 signed int b = 0x0000;
 signed int P = 0x0000;

 b = radius;
 P = (1 - b);

 do
 {
 if(fill !=  0 )
 {
 Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
 Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
 Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
 Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
 }
 else
 {
 Draw_Pixel((xc + a), (yc + b), colour);
 Draw_Pixel((xc + b), (yc + a), colour);
 Draw_Pixel((xc - a), (yc + b), colour);
 Draw_Pixel((xc - b), (yc + a), colour);
 Draw_Pixel((xc + b), (yc - a), colour);
 Draw_Pixel((xc + a), (yc - b), colour);
 Draw_Pixel((xc - a), (yc - b), colour);
 Draw_Pixel((xc - b), (yc - a), colour);
 }

 if(P < 0)
 {
 P += (3 + (2 * a++));
 }
 else
 {
 P += (5 + (2 * ((a++) - (b--))));
 }
 }while(a <= b);
}
#line 1 "c:/users/alcides ramos/desktop/ssd1306/proyecto/imagenes.h"





const code char truck[1024] = {
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128, 64, 64, 64, 64, 64, 64, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 160, 160, 160, 96, 224, 224, 96, 96, 96, 32, 0, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0, 0, 64, 64, 64, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 254, 0, 1, 1, 1, 1, 1, 253, 253, 253, 253, 1, 1, 1, 1, 1, 1, 253, 253, 253, 253, 1, 1, 1, 1, 253, 253, 253, 253, 249, 241, 225, 193, 129, 193, 225, 249, 253, 253, 253, 253, 253, 1, 1, 1, 1, 253, 253, 253, 253, 221, 221, 221, 29, 17, 1, 255, 1, 1, 1, 1, 0, 254, 1, 168, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 224, 24, 36, 132, 0, 2, 130, 5, 81, 68, 112, 160, 192, 96, 96, 32, 0, 128, 128, 192, 192, 192, 64, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 63, 96, 96, 96, 224, 96, 96, 127, 127, 127, 127, 124, 124, 124, 124, 96, 96, 127, 127, 127, 127, 96, 96, 96, 96, 127, 127, 127, 127, 97, 103, 111, 127, 127, 111, 103, 99, 97, 127, 127, 127, 127, 96, 96, 96, 96, 127, 127, 127, 127, 125, 125, 125, 124, 116, 96, 127, 64, 64, 64, 160, 96, 252, 246, 1, 14, 6, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 66, 114, 60, 32, 16, 16, 0, 4, 2, 3, 2, 0, 0, 0, 4, 4, 4, 4, 20, 16, 16, 16, 16, 16, 9, 9, 41, 112, 32, 67, 5, 240, 126, 174, 128, 56, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 127, 127, 127, 127, 255, 255, 247, 251, 123, 191, 95, 93, 125, 189, 189, 63, 93, 89, 177, 115, 243, 229, 207, 27, 63, 119, 255, 207, 191, 255, 255, 255, 255, 255, 255, 255, 255, 127, 127, 127, 127, 127, 127, 127, 127, 255, 255, 255, 127, 127, 125, 120, 120, 120, 120, 120, 248, 120, 120, 120, 120, 120, 120, 248, 248, 224, 135, 0, 0, 0, 0, 0, 0, 0, 0, 128, 240, 248, 120, 188, 220, 92, 252, 28, 28, 60, 92, 92, 60, 120, 248, 248, 96, 192, 143, 168, 216, 136, 49, 68, 72, 2, 160, 96, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 128, 192, 248, 248, 248, 248, 252, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 255, 255, 255, 255, 255, 246, 239, 208, 246, 174, 173, 169, 128, 209, 208, 224, 247, 249, 255, 255, 252, 220, 240, 127, 255, 223, 255, 255, 255, 255, 255, 255, 254, 254, 255, 255, 255, 255, 255, 255, 255, 254, 255, 255, 255, 255, 255, 255, 255, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 255, 255, 255, 255, 255, 255, 254, 255, 190, 255, 255, 253, 240, 239, 221, 223, 254, 168, 136, 170, 196, 208, 228, 230, 248, 127, 126, 156, 216, 224, 240, 240, 242, 242, 240, 177, 32, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 1, 1, 1, 1, 3, 3, 3, 7, 7, 7, 7, 7, 15, 15, 15, 7, 15, 15, 15, 7, 7, 15, 14, 15, 13, 15, 47, 43, 43, 43, 43, 43, 47, 111, 239, 255, 253, 253, 255, 254, 255, 255, 255, 255, 255, 191, 191, 239, 239, 239, 191, 255, 191, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 127, 127, 127, 127, 255, 255, 191, 191, 191, 191, 255, 254, 255, 253, 255, 255, 255, 251, 255, 255, 255, 127, 125, 63, 31, 31, 31, 31, 31, 31, 63, 15, 15, 7, 7, 3, 3, 3, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 11, 11, 11, 11, 7, 3, 14, 6, 6, 6, 2, 18, 19, 19, 3, 23, 21, 21, 17, 1, 19, 19, 3, 6, 6, 14, 15, 15, 7, 15, 15, 15, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};






unsigned char const media[187] = {
 0, 0, 0, 192, 0, 0, 0, 0, 192, 0, 0, 128,
 64, 64, 64, 64, 0, 0, 128, 64, 64, 128, 128, 0,
 0, 0, 0, 64, 248, 68,
 0, 0, 0, 15, 16, 16, 16, 16, 31, 0, 0, 9,
 18, 18, 12, 0, 0, 15, 18, 18, 18, 18, 11, 2,
 0, 0, 0, 0, 31, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 64, 224, 240, 240, 96, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 192, 224, 112, 48, 56, 248, 252,
252, 254, 254, 252, 249, 128, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 31, 31, 0, 0, 252, 255, 255,
255, 255, 199, 1, 3, 7, 6, 14, 12, 28, 24, 24,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 192, 248, 255, 127, 31, 7,
 3, 7, 31, 255, 254, 248, 192, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 112, 120
};






const code char carsun[1024] = {
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
128, 128, 128, 128, 128, 144, 144, 144, 144, 144, 144, 128, 144, 128, 0, 144, 144, 0, 0, 32, 32, 0, 0, 0, 0, 16, 0, 0, 4, 4, 4, 132, 128, 128, 128, 64, 64, 64, 64, 64, 64, 68, 64, 64, 64, 64, 64, 68, 64, 64, 64, 64, 0, 0, 0, 68, 36, 164, 4, 4, 132, 132, 132, 4, 36, 36, 36, 4, 132, 188, 226, 161, 56, 192, 2, 130, 130, 130, 66, 68, 25, 129, 102, 0, 0, 0, 0, 0, 0, 0, 70, 66, 66, 2, 66, 2, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 8, 72, 72, 72, 72, 8, 40, 40, 8, 8, 8, 64, 64, 64, 64, 64, 64, 0, 0, 0, 0,
 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 0, 64, 66, 2, 66, 129, 1, 1, 67, 1, 34, 34, 34, 34, 2, 0, 0, 80, 136, 8, 0, 0, 0, 128, 194, 96, 2, 209, 9, 9, 9, 137, 81, 16, 16, 28, 31, 224, 136, 24, 72, 152, 152, 32, 148, 44, 156, 68, 52, 128, 224, 248, 64, 72, 72, 184, 120, 184, 24, 25, 164, 86, 158, 215, 211, 187, 181, 189, 173, 164, 236, 160, 200, 184, 248, 232, 240, 236, 208, 215, 239, 203, 213, 229, 253, 237, 209, 168, 89, 169, 81, 145, 113, 80, 48, 96, 160, 160, 64, 193, 65, 121, 60, 128, 128, 128, 248, 112, 128, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 2, 17, 23, 30, 1, 128, 64, 64, 37, 36, 7, 18, 18, 10, 7, 6, 6, 7, 7, 6, 2, 3, 2, 2, 3, 2, 3, 3, 3, 2, 2, 7, 6, 7, 7, 6, 7, 134, 198, 182, 158, 199, 235, 127, 65, 94, 110, 102, 94, 94, 94, 94, 114, 115, 99, 67, 67, 67, 67, 67, 67, 67, 83, 83, 94, 94, 76, 79, 124, 100, 68, 134, 133, 4, 5, 5, 6, 5, 6, 20, 15, 0, 224, 47, 32, 8, 23, 112, 19, 8, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 16, 16, 8, 8, 4, 4, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 224, 48, 216, 126, 127, 79, 75, 105, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 64, 64, 64, 64, 64, 64, 64, 64, 64, 81, 111, 111, 110, 124, 240, 32, 64, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 1, 0, 0, 3, 6, 7, 31, 31, 31, 31, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 15, 15, 15, 15, 7, 3, 0, 0, 0, 1, 3, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
#line 26 "C:/Users/Alcides Ramos/Desktop/SSD1306/proyecto/OLED.c"
void main()
{
 adcon1=0b1111;

 OLED_init();
 OLED_print_string(0,0,"HOLA");

 OLED_print_string(0,7,"probando");
 Delay_ms(1000);
 OLED_clear_screen();



 OLED_print_Image(&truck, 0 );




 Delay_ms(3000);
 OLED_clear_screen();



 OLED_print_Image(&carsun, 1 );



 while (1)
 {


 }



}
