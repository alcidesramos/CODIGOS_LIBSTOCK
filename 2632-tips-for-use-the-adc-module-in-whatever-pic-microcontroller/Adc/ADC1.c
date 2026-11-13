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

unsigned int codigo;
char texto [20];
float voltaje, temperatura;

void main() 
{
 //todo digital
// ADCON1=0b0111; // todo digial

// todo analogo=
//ADCON1=0b0000;

//ADCON1=0b1110; // un anolo an0

//ADCON1=0b0100; // 3 canales analogos an0 an1 an3

//16f88X
 /*// todo digital
ANSEL=0;
ANSELH=0;

ANSEL.B0=1;  // AN0 ES ANLOGO

ANSELH.B0=1;  // AN8 ES ANLOGO*/


//18F45K22

// TODO DIGITAL

ANSELA=0;
ANSELB=0;
ANSELC=0;
ANSELD=0;
ANSELE=0;

ANSELA.B0=1; //AN0 ES ANALOGO
ANSA0_bit=1;  // ANO ANALOGO

 ANSB1_bit=1; // ANLOGO AN10 ANALOGO
 ANSELB.B1=1; // ANLOGO AN10 ANALOGO

// los puertos son entradas
TRISA0_bit=1;
TRISB2_bit=1;

  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);         // Cursor off
  


   while (1)
   {
    codigo=ADC_Read(0);
    voltaje=codigo*5.0/1023.0;
     floattostr_(voltaje,texto,3);
     
    
   // sprinti(texto, "Codigo=%4u", codigo);
   //Lcd_Out(1,1,"volt=");
    //Lcd_Out_CP(texto);
    //Lcd_Chr_CP('V');
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