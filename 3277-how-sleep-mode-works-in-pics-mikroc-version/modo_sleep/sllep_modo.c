sbit led1 at LATC4_bit;
sbit led2 at LATC5_bit;
sbit led_f at LATC2_bit;
sbit led_s at LATC3_bit;
char dato;// variable almacena dato serial


 void interrupcion() iv 0x0004 ics ICS_AUTO 
 {
     if (INTF_bit==1)
  {
   led_f=1;

  INTF_bit=0;
  }
  

 if (RCIF_bit==1)
 {
   dato=RCREG;
   led_s=1;

 RCIF_bit=0;

 }




}

void main() 
{

// todo digital
ANSELA=0;
ANSELC=0;

UART1_Init(9600);
TRISC=0;
TRISA=0;
TRISA1_bit=1;   // entrada serial
TRISA2_bit=1;   // entrada por flanco

RXDTSEL_bit=1; // RX en RA1  sino RC5
TXCKSEL_bit=1; // tX en RA0  sino RC4

INTCON=0b01000000;// habilita interrpciones de perifericos

 NOT_WPUEN_bit=0; // AUTORIZA LA PULL UP INDIVIDUALES
 WPUA2_bit=1; // HABILITA PULL UP EN RA2_bit

// APAGA LOS LED
 led1=0;
 led2=0;
 led_f=0;
 led_s=0;



UART1_Write_Text("Iniciando\r\n");

     // INTERRPCION por flanco
    INTF_bit=0;
    INTEDG_bit=0; // falco de bajada
    INTE_bit=1; //habilita la INTERRPCION por flanco
    
     // INTERRPCION SERIAL
    RCIF_bit=0;
    RCIE_bit=1;


     GIE_bit=1; // autorizar las interrpciones
   while (1)
   
   {
      //  SECUENCIA DE INICIACIÓN
      led1=!led1;
      Delay_ms(200);
      led1=!led1;
      Delay_ms(200);
      LED1=!led1;
      Delay_ms(200);
      LED1=!led1;
      Delay_ms(200);
      LED1=!led1;
      Delay_ms(200);
      UART1_Write_Text("Dormido\r\n");
     asm  sleep;
      UART1_Write_Text("Despertado\r\n");
     led2=1;
     Delay_ms(500);
     led2=0;
     led_f=0;
     led_s=0;



   
   
   }


}