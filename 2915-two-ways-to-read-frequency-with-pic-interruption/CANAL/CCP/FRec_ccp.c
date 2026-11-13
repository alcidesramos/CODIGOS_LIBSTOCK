// Lcd pinout settings
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D4 at RD0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D7_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD0_bit;

char texto[20];

float  frecuencia=0;
unsigned int frecu=0;
bit flag_frec;



void interrupcion() iv 0x0004 ics ICS_AUTO
 {
 if (CCP2IF_bit==1)
  {
   TMR1ON_bit=0; //para el timer para capturar dato
   frecu=(CCPR2h << 8 ) | CCPR2l;
   flag_frec=1;  //habilita bandera de RPM
   TMR1L=0;
   TMR1h=0;
   TMR1ON_bit=1;  //enciende timer para proximo dato
   CCP2IF_bit=0;

   }


}

void config_captura()
{
  trisc.b1=1;  //pin de captura como entrada

//confguracion del timer
   t1con=0;

   //configura el preescalador  1
   T1CKPS1_bit=0;
   T1CKPS0_bit=0;

   //limpia registros del timer
   TMR1L=0;
   TMR1H=0;

   TMR1ON_bit=0;  //timer quieto

  // configuracion ccp
  CCP2CON=0;

  //lo configura para capturar subida
  CCP2M3_bit=0;
  CCP2M2_bit=1;
  CCP2M1_bit=0;
  CCP2M0_bit=1;

  CCP2IF_bit=0; //limpi la bandera
  CCP2IE_bit=1;  // activa interupcion del modulo ccp2

}
 void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
{
//variables temporales
int largo_entera,largo_n,cont_for,tempo_int;
double tempo_float;
//largo de la trama a armar en decimales
largo_n = decimales_+1;
largo_entera = 0;
// si es negativa coloca el -
if ( numero_ < 0)
  {
  *cadena_++ = '-';
  numero_ = -numero_;
  }
//si es menor que no multiplica por 10
if (numero_ > 0.0) while (numero_ < 1.0)
  {
  numero_ =numero_* 10.0;
  largo_entera--;
  }

  //realiza division varias veces hasta que sea menor que 10
while (numero_ >= 10.0)
  {
  numero_ = numero_/10.0;
  largo_entera++;   //sube el largo de la trama por ser deciaml
 }
 largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera

//round. numero_ is between 1 and 10 and largo_n will be printed to
// right of decimal point so rounding is ...
for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
  tempo_float = tempo_float/10.0;
numero_ += tempo_float/2.0;
if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
//si tiene decimales
if (largo_entera<0)
  {
   *cadena_++ = '0'; *cadena_++ = '.';
   if (largo_n < 0) largo_entera = largo_entera-largo_n;
   for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
  }
for (cont_for=0; cont_for < largo_n; cont_for++)
  {
  tempo_int = numero_;
  *cadena_++ = tempo_int + 48;  //convierte a ascci
  if (cont_for ==  largo_entera ) *cadena_++ = '.';
  numero_ -= (tempo_float=tempo_int);
  numero_ = numero_*10.0;
  }
*cadena_ =0;    //anexa final de linea
}




void main() 

{
    trisb=0;
   trisC=0;
   TRISD=0;
   trisa=0;
    TRISC1_bit=1; //entrada Frec
    
   INTCON = 0b01000000;
   Lcd_Init();
   Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,"FRECUENCIMETRO");

config_captura();
 CCP2If_bit=0;
 GIE_bit=1;
 flag_frec=0;
 
    while (1)
    {
    //si esta activa la bandera de frecuencia
if (flag_frec==1)
{
       if (frecu!=0)
         {
          frecuencia=Clock_kHz()*1e3/(frecu*4.0); //convierte a Hercios
          frecu=0;
         }
         else frecuencia=0;
 flag_frec=0;
 }
    floatToStr_(frecuencia,texto,2);
    Lcd_Out(3,5,"           ");

    Lcd_Out(3,5,texto);
      Lcd_Out_CP(" HZ");  //muestra pasos timer1

    frecuencia=0;  //coloca en cero por si se quita la señal
    delay_ms(100);

    }





}