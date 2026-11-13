#line 1 "C:/Users/alcid/Desktop/Encoder/ENCODER.c"

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


signed int pulsos=0;

char texto[10];


void Interrpciones() iv 0x0004 ics ICS_AUTO
 {
 if (INTF_bit==1)
 {
 if (PORTB.RB1==PORTB.RB0) pulsos++; else pulsos--;
 INTEDG_bit=~INTEDG_bit;
 INTF_bit=0;
 }

}

void main()
 {
 TRISB=255;
 TRISC=0;

adcon0.b0=0;
adcon1=0b110;
Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"    ENCODER ARZ");


 INTCON=0B01000000;

 INTF_bit=0;
 INTEDG_bit=0;
 INTE_bit=1;
 GIE_bit=1;




while (1)
{
 inttostr(pulsos,texto);
 Lcd_Out(3,5,texto);
 Delay_ms(500);

}



}
