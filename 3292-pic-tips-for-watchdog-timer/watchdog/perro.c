unsigned int cont;
void main() 
{
SWDTEN_bit=0; // APAGA EL PERRO GUARDIAN
//PREESCALADO DEL WATCHDOG
WDTPS4_bit=0;
WDTPS3_bit=1;
WDTPS2_bit=1;
WDTPS1_bit=0;
WDTPS0_bit=0;



TRISA=0;
TRISC=0;

UART1_Init(9600);
LATC1_bit=1;
Delay_ms(100);
LATC1_bit=0;
Delay_ms(100);


UART1_Write_Text("INICIANDO\r\n");
  while (1)
  {
UART1_Write_Text("WHILE\r\n");
Delay_ms(300);
    SWDTEN_bit=1; // prende el perro
  //for (cont=0;cont<=10;cont++)
  
  while(1==1)
  {
   UART1_Write_Text("for\r\n");

  LATC0_bit=!LATC0_bit;
  Delay_ms(100);
   }
    SWDTEN_bit=0; // APAGA el perro
   
  
  
  }







}