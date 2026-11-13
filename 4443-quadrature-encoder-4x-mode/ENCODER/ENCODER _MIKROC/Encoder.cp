#line 1 "C:/Users/HP/OneDrive/Documentos/Micro Avanzado/ENCODER/ENCODER _MIKROC/Encoder.c"




sbit LCD_RS at LATB2_bit;
sbit LCD_EN at LATA4_bit;
sbit LCD_D4 at LATA0_bit;
sbit LCD_D5 at LATA1_bit;
sbit LCD_D6 at LATA2_bit;
sbit LCD_D7 at LATA3_bit;


sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISA4_bit;
sbit LCD_D4_Direction at TRISA0_bit;
sbit LCD_D5_Direction at TRISA1_bit;
sbit LCD_D6_Direction at TRISA2_bit;
sbit LCD_D7_Direction at TRISA3_bit;


signed int pulso=0;
char texto [10];

 void PUNTO5() iv 0x0008 ics ICS_AUTO {
 if (INT0F_bit==1) {
 if ( RB0_bit ==  RB1_bit  ) pulso++;
 else pulso-- ;



 INTEDG0_bit= !INTEDG0_bit;
 INT0F_bit=0;

 }
 if (INT1F_bit==1) {
 if ( RB0_bit ==  RB1_bit  ) pulso--;
 else pulso++ ;

 INTEDG1_bit= !INTEDG1_bit;
 INT1F_bit=0;
 }
}


void main() {
ADCON1=0b1111;
TRISB0_bit=1;
TRISB1_bit=1;
Intcon=0b01000000;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,3, "ENCODER=");

 INT0F_bit=0;
 INT0E_bit=1;
 INTEDG0_bit=1;


 INT1F_bit=0;
 INT1E_bit=1;
 INTEDG1_bit=1;


 GIE_bit=1;



 while (1)
{
 IntToStr(pulso,texto);
 Lcd_Out(2,5, texto);
 Delay_ms (200);

}
}
