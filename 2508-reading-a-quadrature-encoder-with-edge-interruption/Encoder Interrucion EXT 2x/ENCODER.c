// LCD module connections
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
// End LCD module connections

signed int  pulsos=0;  //variable del encoder

char texto[10];


void Interrpciones() iv 0x0004 ics ICS_AUTO
 {
   if (INTF_bit==1)
   {
   if (PORTB.RB1==PORTB.RB0) pulsos++; else pulsos--;
   INTEDG_bit=~INTEDG_bit; //cambia el flanco a detectar modo 2x
   INTF_bit=0; //limpia bandera de interrupcion
   }
 
}

void main()
 {
 TRISB=255;  //TODO ENTRADAS
 TRISC=0;    //TODOS SALIDAS
 //todo digital
adcon0.b0=0;
adcon1=0b110;
Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,"    ENCODER ARZ");
  
  //CONFIGURACION INTERRPCIONES
  INTCON=0B01000000;
  
  INTF_bit=0; //limpia la bansera e interrupcion
  INTEDG_bit=0; //por flanco de bajada
  INTE_bit=1; //habilita interrpcion por flanco
  GIE_bit=1; //Autoriza interrupciones
  
  


while (1)
{
  inttostr(pulsos,texto);
  Lcd_Out(3,5,texto);
  Delay_ms(500);

}

 

}