#line 1 "C:/Users/Alcides Ramos/Desktop/nada/modo_sleep/sllep_modo.c"
sbit led1 at LATC4_bit;
sbit led2 at LATC5_bit;
sbit led_f at LATC2_bit;
sbit led_s at LATC3_bit;
char dato;


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


ANSELA=0;
ANSELC=0;

UART1_Init(9600);
TRISC=0;
TRISA=0;
TRISA1_bit=1;
TRISA2_bit=1;

RXDTSEL_bit=1;
TXCKSEL_bit=1;

INTCON=0b01000000;

 NOT_WPUEN_bit=0;
 WPUA2_bit=1;


 led1=0;
 led2=0;
 led_f=0;
 led_s=0;



UART1_Write_Text("Iniciando\r\n");


 INTF_bit=0;
 INTEDG_bit=0;
 INTE_bit=1;


 RCIF_bit=0;
 RCIE_bit=1;


 GIE_bit=1;
 while (1)

 {

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
 asm sleep;
 UART1_Write_Text("Despertado\r\n");
 led2=1;
 Delay_ms(500);
 led2=0;
 led_f=0;
 led_s=0;





 }


}
