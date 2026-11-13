
 // LCD module connections
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RC2_bit;
sbit LCD_D5 at RC6_bit;
sbit LCD_D6 at RC7_bit;
sbit LCD_D7 at Rb0_bit;

sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC6_bit;
sbit LCD_D6_Direction at TRISc7_bit;
sbit LCD_D7_Direction at TRISb0_bit;
// End LCD module connections

float cuenta;

char texto[30];

char dia,mes,ano;



void main()
 {
 
 ADCON1=0b1111; //todo digital

  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);         // Cursor off
  //  Lcd_Out(1,1,"contador=");
    
    while (1)
    
    {
    
    dia=23;
    mes=10;
    ano=18;
    
       sprintf(texto,"fecha=%02u/%02u/20%02u",(unsigned int)dia,(unsigned int)mes,(unsigned int)ano);
       // FloatToStr_(cuenta,texto,3);
        Lcd_Out(3,1,texto);

       for (cuenta=0.125;cuenta<=10.250;cuenta=cuenta+0.1)
       {

       sprintf(texto,"contador=%4.2f",cuenta);
       // FloatToStr_(cuenta,texto,3);
        Lcd_Out(1,1,texto);
        Delay_ms(80);
        
       
       
       }
    
    }

}