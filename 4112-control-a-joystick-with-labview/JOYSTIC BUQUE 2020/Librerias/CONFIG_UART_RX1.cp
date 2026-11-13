#line 1 "C:/Users/Alcides Ramos/Desktop/JOYSTIC BUQUE 2020/Librerias/CONFIG_UART_RX1.c"


char rx1_dat;


enum trama_rx_es {inicio1,inicio2,inicio3,fin1};
unsigned char recibidos_estado1=inicio1;
unsigned char dato1_in,puntero_rx1=0;


unsigned char Trama_rx1[50];
char flag_rx1=0;
const char max_datos=50;



void config_uart1_trama(unsigned int baudios)
{
 UART1_Init(baudios);

 U1RXIP_2_bit=1;
 U1RXIP_1_bit=1;
 U1RXIP_0_bit=0;


 u1sta.b7=0;
 u1sta.b6=0;

 U1STA.b1=0;
 U1rXIF_bit=0;

 rx1_dat=U1RXREG;
 rx1_dat=U1RXREG;
 rx1_dat=U1RXREG;
 rx1_dat=U1RXREG;
 U1RXIF_bit=0;
 U1RXIE_bit=1;

}

 void INT_TRAMA_RX1() org IVT_ADDR_U1RXINTERRUPT
{
dato1_in=U1RXREG;

 switch (recibidos_estado1)
 {
 case inicio1:
 {
 if (dato1_in!='I') puntero_rx1=0;
 else
 {
 Trama_rx1[puntero_rx1]=dato1_in;
 puntero_rx1++;
 recibidos_estado1=inicio2;
 }
 }
 break;
 case inicio2:
 {
 if (dato1_in!='N')
 { puntero_rx1=0;
 recibidos_estado1=inicio1;
 }
 else
 {
 Trama_rx1[puntero_rx1]=dato1_in;
 puntero_rx1++;
 recibidos_estado1=inicio3;
 }
 }
 break;

 case inicio3:
 {
 if (dato1_in!='I')
 {
 puntero_rx1=0;
 recibidos_estado1=inicio1;
 }
 else
 {
 Trama_rx1[puntero_rx1]=dato1_in;
 puntero_rx1++;
 recibidos_estado1=fin1;

 }
 }
 break;


 case fin1:
 {
 Trama_rx1[puntero_rx1]=dato1_in;
 puntero_rx1++;
 if (dato1_in=='*')
 {

 recibidos_estado1=0;
 puntero_rx1=0;
 flag_rx1=1;
 rx1_dat=U1RXREG;
 rx1_dat=U1RXREG;
 rx1_dat=U1RXREG;
 rx1_dat=U1RXREG;
 U1STAbits.OERR=0;
 U1RXIF_bit=0;
 U1RXIE_bit=0;

 }
 else if (puntero_rx1>max_datos)
 {
 puntero_rx1=0;
 recibidos_estado1=0;
 puntero_rx1=0;
 flag_rx1=0;

 }

 }
 break;


 }

 U1RXIF_bit=0;

}
