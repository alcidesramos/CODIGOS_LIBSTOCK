#line 1 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"






char flag_codigo=0;


unsigned int cuenta=0;
unsigned char cont;
char texto[10];
 unsigned char timer_aux;

 unsigned char tiempo[68];
#line 27 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
 unsigned long codigo_ir;






unsigned long Hash_algoritmo ()
{
unsigned long hash_acum =  2166136261 ;

 for (cont=0;cont<cuenta-1;cont++)
 {

 hash_acum = (hash_acum *  16777619 ) ^ tiempo[cont];
 }

 return (hash_acum);
}


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
 tiempo[cuenta-1]=timer_aux;
 cuenta++;
 INTEDG_bit=!INTEDG_bit;

 if (TMR0IF_bit==1)
 {
 cuenta--;
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

 unsigned char verifica(const unsigned char *vector,unsigned char size)
{
 unsigned char cu;

 for (cu=0;cu<size;cu++)
 {
 if (vector[cu]!=tiempo[cu])
 {

 return(0);
 }

 }

 return(1);

 }




void normaliza()
{




 for (cont=0;cont<cuenta-1;cont++)
 {
 if ( (tiempo[cont]>= 6 - 3 ) && (tiempo[cont]<= 6 + 2 )) tiempo[cont]= 6 ;
 else if ( (tiempo[cont]>= 10 - 3 ) && (tiempo[cont]<= 10 + 2 )) tiempo[cont]= 10 ;
 else if ( (tiempo[cont]>= 22 - 3 ) && (tiempo[cont]<= 22 + 3 )) tiempo[cont]= 22 ;
 else tiempo[cont]= 6 ;
#line 134 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
 }
#line 140 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
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
#line 220 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
 normaliza();
 codigo_ir=Hash_algoritmo();
 LongIntToHex(codigo_ir,texto);
 UART1_Write_Text("CODIGO_IR=");
 UART1_Write_Text(texto);
 UART1_Write('\r');
 UART1_Write('\n');

if (codigo_ir==0X18A54851)
 {
  LATC0_bit =~ LATC0_bit ;
 UART1_Write_Text("COMANDO1");

 }
 else if (codigo_ir==0XB3488D11)
 {
  LATC1_bit =~ LATC1_bit ;
 UART1_Write_Text("COMANDO2");

 }

 else if (codigo_ir==0X6070AD11)
 {
  LATC2_bit =~ LATC2_bit ;
 UART1_Write_Text("COMANDO3");

 }








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
