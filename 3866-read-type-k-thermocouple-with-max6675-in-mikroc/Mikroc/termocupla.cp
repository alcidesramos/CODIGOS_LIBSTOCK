#line 1 "C:/Users/Alcides Ramos/Desktop/Termocupla max6675 2020/Mikroc/termocupla.c"
#line 1 "c:/users/alcides ramos/desktop/termocupla max6675 2020/mikroc/max6675.h"










void max6675_init();
float max6675_lee() ;
#line 5 "C:/Users/Alcides Ramos/Desktop/Termocupla max6675 2020/Mikroc/termocupla.c"
float temperatura;
char texto[22];


sbit LCD_RS at RB1_bit;
sbit LCD_RW at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB1_bit;
sbit LCD_RW_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;




void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
{

int largo_entera,largo_n,cont_for,tempo_int;
double tempo_float;

largo_n = decimales_+1;
largo_entera = 0;

if ( numero_ < 0)
 {
 *cadena_++ = '-';
 numero_ = -numero_;
 }

if (numero_ > 0.0) while (numero_ < 1.0)
 {
 numero_ =numero_* 10.0;
 largo_entera--;
 }


while (numero_ >= 10.0)
 {
 numero_ = numero_/10.0;
 largo_entera++;
 }
 largo_n = largo_n+largo_entera;



for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
 tempo_float = tempo_float/10.0;
numero_ += tempo_float/2.0;
if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}

if (largo_entera<0)
 {
 *cadena_++ = '0'; *cadena_++ = '.';
 if (largo_n < 0) largo_entera = largo_entera-largo_n;
 for (cont_for = -1; cont_for > largo_entera; cont_for--) *cadena_++ = '0';
 }
for (cont_for=0; cont_for < largo_n; cont_for++)
 {
 tempo_int = numero_;
 *cadena_++ = tempo_int + 48;
 if (cont_for == largo_entera ) *cadena_++ = '.';
 numero_ -= (tempo_float=tempo_int);
 numero_ = numero_*10.0;
 }
*cadena_ =0;
}
void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

void main()
{

 ANSEL=0;
 ANSELH=0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,2,"TEMPERATURA=");


 TRISC6_bit=0;
 TRISC7_bit=1;
 UART1_Init(9600);
 max6675_init();
 Uart1_write_text_const("INICIANDO\r\n");

 while (1)
 {
 temperatura= max6675_lee();
 FloatToStr_(temperatura, texto,2);
 Uart1_write_text_const("TEMPERATURA=");
 UART1_Write_Text(texto);
 Uart1_write_text_const("\r\n");
 Lcd_Out(2,7,texto);
 delay_ms(500);





 }


}
