#line 1 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"




 const unsigned char codigo1[]={6, 10, 22, 10, 22, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 22, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 22, 10, 6, 10, 22, 10, 22, 10, 22, 10, 22, 10, 22, 10};
 const unsigned char codigo2[]={6, 10, 22, 10, 22, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 22, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 6, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 6, 10, 22, 10, 22, 10, 22, 10, 22, 10, 22, 10};
 const unsigned char codigo3[]= {6, 10, 22, 10, 22, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 22, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 22, 10, 6, 10, 6, 10, 6, 10, 6, 10, 6, 10, 22, 10, 6, 10, 6, 10, 22, 10, 22, 10, 22, 10, 22, 10, 22, 10};




char flag_codigo=0;


unsigned int cuenta=0;
unsigned char cont;
char texto[10];
 unsigned char timer_aux;

 unsigned char tiempo[68];
#line 33 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
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
#line 119 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
 }
#line 125 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
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
#line 194 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
 for (cont=0;cont<cuenta-1;cont++)
 {
 ByteToStr(tiempo[cont],texto);


 }
#line 205 "C:/Users/Alcides Ramos/Desktop/IR/CANAL/INFRA/IR.c"
 normaliza();

 if (verifica(&codigo1,cuenta-1)==1)
 {
  LATC0_bit =~ LATC0_bit ;
 UART1_Write_Text("COMANDO1");

 }
 else if (verifica(&codigo2,cuenta-1)==1)
 {
  LATC1_bit =~ LATC1_bit ;
 UART1_Write_Text("COMANDO2");

 }

 else if (verifica(&codigo3,cuenta-1)==1)
 {
  LATC2_bit =~ LATC2_bit ;
 UART1_Write_Text("COMANDO3");

 }
 memset(tiempo,66,'0');






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
