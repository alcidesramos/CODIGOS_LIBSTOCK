//utiliza timer calculator para genral una inetrrpcion cada 5ms

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

sbit encoder_A  at portb.b0;
sbit encoder_B  at portb.b1;


signed int  pulsos=0;  //variable del encoder
char    bits_actual=0;      //variable que almaceda la lectura del encoder
char     bits_anterior=0;    //almacena la lectua anterior
char    bits_armado=0;

char texto[10];


//Place/Copy this part in declaration section
void InitTimer0(){
  OPTION_REG	 = 0x84;
  TMR0		 = 100;
  INTCON	 = 0xA0;
}

void Interrupt(){
  if (TMR0IF_bit){
    TMR0IF_bit	 = 0;
    TMR0		 = 100;
    //Enter your code here


  bits_actual=(encoder_A<<1)  |  encoder_B;    //lee el encoder
  bits_armado= (bits_anterior<<2) | bits_actual;  //arma bits analizar con el  leido anteriormente

//analiza
if ((bits_armado == 13) || ( bits_armado== 4) || (bits_armado== 2)|| ( bits_armado==11)) pulsos++;
if ((bits_armado == 14) || ( bits_armado== 7) || (bits_armado== 1)|| ( bits_armado==8)) pulsos--;

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
  
  InitTimer0(); //configura timer cero a 5ms
while (1)
{

  inttostr(pulsos,texto);
  Lcd_Out(3,5,texto);

   bits_anterior=bits_actual;

 // Delay_ms(500);

}

 

}