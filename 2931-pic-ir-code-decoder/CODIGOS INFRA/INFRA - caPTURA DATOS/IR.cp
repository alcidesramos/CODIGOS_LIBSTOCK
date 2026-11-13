#line 1 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
char flag_codigo=0;


unsigned int cuenta=0;
unsigned char cont;
char texto[10];
 unsigned char timer_aux;


void Interrpcion() iv 0x0004 ics ICS_AUTO
 {
if (INTF_bit==1)
 {

 if (flag_codigo==0)

 {
 if (cuenta!=0)
 {
 timer_aux=TMR0;
 TMR0=0;

 cuenta++;
 INTEDG_bit=!INTEDG_bit;

 if (TMR0IF_bit==1)
 {
 flag_codigo=1;
 INTE_bit=0;
 }
 }
 else
 {
 TMR0IF_bit=0;
 TMR0=0;
 cuenta++;
 }

 }
 }





 INTF_bit=0;









 }


void main()
{

IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=1;



ansela=0;
anselc=0;

TRISA=0;
trisc=0;

TRISA2_bit=1;





TXCKSEL_bit=0;

UART1_Init(19200);

LATA=0;

 UART1_Write_Text("INICIANDO\r\n");
 LATC=0;


OPTION_REG=0;


PS2_bit=1;
PS1_bit=1;
PS0_bit=1;

 UART1_Write_Text("INICIANDO\r\n");
 LATC=0;



INTCON=0b01000000;
INTEDG_bit=0;
INTF_bit=0;
INTE_bit=1;

GIE_bit=1;

 while (1)
 {
 if (flag_codigo==1)
 {


 UART1_Write_Text("son=");
 ByteToStr(cuenta,texto);
 UART1_Write_Text(texto);
 UART1_Write('\r');
 UART1_Write('\n');

 Delay_ms(2000);

 flag_codigo=0;
 cuenta=0;
 INTEDG_bit=0;
 INTF_bit=0;
 INTE_bit=1;




 }
 Delay_ms(80);
 LATA0_bit=~LATA0_bit;

 }



}
