sbit led_op at LATA2_bit  ;
// LCD module connections
sbit LCD_RS at RA4_bit;
sbit LCD_EN at RA5_bit;
sbit LCD_D4 at RC0_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D7 at RC3_bit;

sbit LCD_RS_Direction at TRISA4_bit;
sbit LCD_EN_Direction at TRISA5_bit;
sbit LCD_D4_Direction at TRISC0_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D7_Direction at TRISC3_bit;
// End LCD module connections

 void en_serial1()
 {

  RXDTSEL_bit=1; // RX en RA1
  TXCKSEL_bit=1; // tX en RA0
 }

 void en_serial2()
 {

  RXDTSEL_bit=0; // RX en RC5
  TXCKSEL_bit=0; // tX en RC4
 }


void main()
 {
 
 //configuración Oscilador
OSCCON=0;
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//Todo Digital
ansela=0;
anselc=0;



    //OScialdor Interno a 4 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=0;
IRCF0_bit=1;


    TRISA2_bit=0; //salida led
//configuración serial
TRISA0_bit=0;  //SALIDA TX
TRISC4_bit=0; //SALIDA TX_AUX

TRISA1_bit=1; //ENTRADA RX
TRISC5_bit=1; // ENTRADA RX_AUX

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,2, "DOS PUERTOS SERIAL");
  UART1_Init(9600);

 
    while(1)
    
    {
    en_serial1();
   UART1_Write_Text("SOY EL 1\r\n");
   en_serial2();
   UART1_Write_Text("SOY EL 2\r\n");

        
        led_op=!led_op;
        Delay_ms(200);
        


    }
    
    

}