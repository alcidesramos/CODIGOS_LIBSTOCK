  # define  encoder_A RB0_bit
  # define  encoder_B RB1_bit

// LCD module connections
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
// End LCD module connections

signed int pulso=0;
char texto [10];
                                                                                
 void PUNTO5() iv 0x0008 ics ICS_AUTO {
 if (INT0F_bit==1) {
     if (encoder_A== encoder_B )  pulso++;
     else pulso-- ;
     
     
 
     INTEDG0_bit= !INTEDG0_bit;
     INT0F_bit=0;
     
   }
  if (INT1F_bit==1) {
     if (encoder_A== encoder_B )  pulso--;
     else pulso++ ;
  
    INTEDG1_bit= !INTEDG1_bit;
    INT1F_bit=0;
  }
}


void main() {
ADCON1=0b1111;   //todo digital
TRISB0_bit=1;     //entradas 
TRISB1_bit=1;     //entrada
Intcon=0b01000000;

   Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,3, "ENCODER=");
  // CONFIGURO INTERRUPCION INT0
  INT0F_bit=0;           // LIMPIAR  BANDERA
  INT0E_bit=1;         // Activar Habilitador
  INTEDG0_bit=1;      // flanco de subida
  
   // CONFIGURO INTERRUPCION INT1
   INT1F_bit=0;           // LIMPIAR  BANDERA
  INT1E_bit=1;         // Activar Habilitador
  INTEDG1_bit=1;      // flanco de subida
  
  
  GIE_bit=1;          //PLUMA BLANCA
  
  
  
  while (1)
{
  IntToStr(pulso,texto);
  Lcd_Out(2,5, texto);
  Delay_ms (200);

}
}