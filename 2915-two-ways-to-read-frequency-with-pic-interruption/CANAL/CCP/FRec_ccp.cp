#line 1 "C:/Users/Alcides Ramos/Desktop/Frecuencimetro/CANAL/CCP/FRec_ccp.c"

sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D4 at RD0_bit;


sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D7_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD0_bit;

char texto[20];

float frecuencia=0;
unsigned int frecu=0;
bit flag_frec;



void interrupcion() iv 0x0004 ics ICS_AUTO
 {
 if (CCP2IF_bit==1)
 {
 TMR1ON_bit=0;
 frecu=(CCPR2h << 8 ) | CCPR2l;
 flag_frec=1;
 TMR1L=0;
 TMR1h=0;
 TMR1ON_bit=1;
 CCP2IF_bit=0;

 }


}

void config_captura()
{
 trisc.b1=1;


 t1con=0;


 T1CKPS1_bit=0;
 T1CKPS0_bit=0;


 TMR1L=0;
 TMR1H=0;

 TMR1ON_bit=0;


 CCP2CON=0;


 CCP2M3_bit=0;
 CCP2M2_bit=1;
 CCP2M1_bit=0;
 CCP2M0_bit=1;

 CCP2IF_bit=0;
 CCP2IE_bit=1;

}
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




void main()

{
 trisb=0;
 trisC=0;
 TRISD=0;
 trisa=0;
 TRISC1_bit=1;

 INTCON = 0b01000000;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"FRECUENCIMETRO");

config_captura();
 CCP2If_bit=0;
 GIE_bit=1;
 flag_frec=0;

 while (1)
 {

if (flag_frec==1)
{
 if (frecu!=0)
 {
 frecuencia=Clock_kHz()*1e3/(frecu*4.0);
 frecu=0;
 }
 else frecuencia=0;
 flag_frec=0;
 }
 floatToStr_(frecuencia,texto,2);
 Lcd_Out(3,5,"           ");

 Lcd_Out(3,5,texto);
 Lcd_Out_CP(" HZ");

 frecuencia=0;
 delay_ms(100);

 }





}
