#line 1 "C:/Users/Alcides Ramos/Desktop/Adc/ADC1.c"

sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RC2_bit;
sbit LCD_D5 at RC3_bit;
sbit LCD_D6 at RC4_bit;
sbit LCD_D7 at RC5_bit;

sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC4_bit;
sbit LCD_D7_Direction at TRISC5_bit;


unsigned int codigo;
char texto [20];
float voltaje, temperatura;

void main()
{
#line 47 "C:/Users/Alcides Ramos/Desktop/Adc/ADC1.c"
ANSELA=0;
ANSELB=0;
ANSELC=0;
ANSELD=0;
ANSELE=0;

ANSELA.B0=1;
ANSA0_bit=1;

 ANSB1_bit=1;
 ANSELB.B1=1;


TRISA0_bit=1;
TRISB2_bit=1;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);



 while (1)
 {
 codigo=ADC_Read(0);
 voltaje=codigo*5.0/1023.0;
 floattostr_(voltaje,texto,3);






 sprintf(texto,"volt=%5.3f V", voltaje);
 Lcd_Out(1,1,texto);


 codigo=ADC_Read(10);
 temperatura=codigo*500.0/1023.0;
 floattostr_(temperatura,texto,2);
 Lcd_Out(2,1,"temp=");
 Lcd_Out_CP(texto);
 Lcd_Chr_CP(223);
 Lcd_Chr_CP('C');


 Delay_ms(600);


 }

}
