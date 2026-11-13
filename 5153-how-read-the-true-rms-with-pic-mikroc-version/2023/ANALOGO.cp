#line 1 "C:/Users/Alcides Ramos/Desktop/RMS/2023/ANALOGO.c"

sbit LCD_RS at LATC0_bit;
sbit LCD_EN at LATC1_bit;
sbit LCD_D4 at LATC2_bit;
sbit LCD_D5 at LATC3_bit;
sbit LCD_D6 at LATC4_bit;
sbit LCD_D7 at LATC5_bit;
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC4_bit;
sbit LCD_D7_Direction at TRISC5_bit;



unsigned int lectura;
unsigned int mayor,mayor1;
const float res1=330000;
const float res2=6800;
float voltaje;
char texto[30];
char cont;

float suma;
unsigned int muestras=0;



void main()
{

Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(5,1,"Voltaje=");

 ADC_Init();

 ANSELA=0;
 ANSELC=0;

 ANSA0_bit=1;

 while(1)
 {

mayor=0;
mayor1=0;

 lectura=ADC_Get_Sample(0);
 Delay_us(10);
 voltaje=lectura*5.0/1023.0;
 suma+=voltaje*voltaje;
 muestras++;
 if (muestras==1500)
 {
 voltaje=sqrt(suma/(float)muestras);

 voltaje=voltaje*(res1+res2)/res2;
 voltaje=voltaje+1.4;
 muestras=0;
 suma=0;
 FloatToStr_FixLen(voltaje,texto,6);
 Lcd_Out(1,9,texto);
 Delay_ms(100);

 }




 }

}
