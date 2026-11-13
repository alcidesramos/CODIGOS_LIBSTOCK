#line 1 "C:/Users/Alcides Ramos/Desktop/UART IDDLE LINE DETECT/uartidlelinedetect/uartline.c"

sbit led at LATC0_bit;
sbit led2 at LATC1_bit;

 char trama_rx[50];
 char cont_trama=0;
 char flag_rx=0;
 char dato_rx;

 void uartrx() iv 0x0008 ics ICS_AUTO
 {

 if (TMR0IF_bit==1)
 {

 flag_rx=1;
 cont_trama=0;
 RCIE_bit=0;
 TMR0IF_bit=0;
 TMR0IE_bit=0;
 TMR0ON_bit=0;
 }


 if (RCIF_bit==1)
 {
 dato_rx=RCREG;
 trama_rx[cont_trama]=dato_rx;
 cont_trama++;
 if (cont_trama>=50) cont_trama=0;
 TMR0L=0;
 TMR0ON_bit=1;
 TMR0IE_bit=1;
 RCIF_bit=0;
 }




 }

void main()

{

INTCON=0b01000000;
TRISC6_bit=0;
#line 49 "C:/Users/Alcides Ramos/Desktop/UART IDDLE LINE DETECT/uartidlelinedetect/uartline.c"
TRISC7_bit=1;
TRISC0_bit=0;

TRISC1_bit=0;

UART1_Init(9600);


 T0CON=0;

 T08BIT_bit=1;

 T0PS2_bit=1;
 T0PS1_bit=0;
 T0PS0_bit=0;

 TMR0ON_bit=0;

 T0CS_bit=0;

 PSA_bit=0;


 TMR0IF_bit=0;
 TMR0IE_bit=0;


 RCIF_bit=0;

 CREN_bit=0;
 CREN_bit=1;
 RCIE_bit=1;


 GIE_bit=1;
 while (1)
 {
 if (flag_rx==1)
 {
 cont_trama=0;
 UART1_Write_Text(trama_rx);
 if (strstr(trama_rx,"led=") )
 {
 if (strstr(trama_rx,"on")) led2=1;
 else led2=0;
 }
 memset(trama_rx,0,50);

 CREN_bit=0;
 CREN_bit=1;
 RCIF_bit=0;
 RCIE_bit=1;
 flag_rx=0;

 }


 led=!led;
 Delay_ms(300);


 }

}
