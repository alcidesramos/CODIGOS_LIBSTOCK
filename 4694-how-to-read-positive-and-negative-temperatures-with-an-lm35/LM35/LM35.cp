#line 1 "C:/Users/Alcides Ramos/Desktop/LM35/LM35.c"


signed int codigo;
float temperatura;
char texto[30];


sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

 void floattostr_(float x, unsigned char *str,char precision)
{


int ie, i, k, ndig;
double y;
ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
ie = 0;

if ( x < 0)
 {
 *str++ = '-';
 x = -x;
 }

if (x > 0.0) while (x < 1.0)
 {
 x *= 10.0;
 ie--;
 }
while (x >= 10.0)
 {
 x = x/10.0;
 ie++;
 }
 ndig += ie;


for (y = i = 1; i < ndig; i++)
 y = y/10.;
x += y/2.;
if (x >= 10.0) {x = 1.0; ie++;}
if (ie<0)
 {
 *str++ = '0'; *str++ = '.';
 if (ndig < 0) ie = ie-ndig;
 for (i = -1; i > ie; i--) *str++ = '0';
 }
for (i=0; i < ndig; i++)
 {
 k = x;
 *str++ = k + '0';
 if (i == ie ) *str++ = '.';
 x -= (y=k);
 x *= 10.0;
 }
*str = '\0';
}



void main()
{
TRISA=0b11;
ADC_Init();
Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"   TEMPERATURA=");


 while(1)
 {
 codigo=ADC_Read(0)-ADC_Read(1);
 temperatura=codigo*500.0/1023.0;
 FloatToStr_(temperatura,texto,1);

 Lcd_Out(2,7,"         ");
 Lcd_Out(2,7,texto);
 Lcd_Chr_CP(223);
 Lcd_Chr_CP('C');

 Delay_ms(500);



 }


}
