#line 1 "C:/Users/Alcides Ramos/Desktop/Nextion clase 2020/Nextion.c"
#line 1 "c:/users/alcides ramos/desktop/nextion clase 2020/nextion.h"
void nextion_init();
void nextion_interrupcion();
#line 7 "C:/Users/Alcides Ramos/Desktop/Nextion clase 2020/Nextion.c"
enum trama_rx_es {inicio1,inicio2,inicio3,fin1,fin2,fin3};
char nextion_trama_estado=inicio1;
unsigned char trama_rx_nextion[50];
unsigned char trama_rx_cont=0;
char flag_rx1=0;



void nextion_init()
{
UART1_Init(9600);
RCIF_bit=0;
RCIE_bit=1;

CREN_bit=0;
CREN_bit=1;

}


void nextion_interrupcion()
{
 if (RCIF_bit==1)

 {


 unsigned int dat_rx;

 dat_rx=RCREG;


 switch (nextion_trama_estado)
 {
 case inicio1:
 if (dat_rx=='I')
 {
 trama_rx_nextion[trama_rx_cont]=dat_rx;
 nextion_trama_estado=inicio2;
 trama_rx_cont++;
 }
 break;

 case inicio2:
 if (dat_rx=='N')
 {
 trama_rx_nextion[trama_rx_cont]=dat_rx;
 nextion_trama_estado=inicio3;
 trama_rx_cont++;
 }
 else
 {
 nextion_trama_estado=inicio1;
 trama_rx_cont=0;
 }
 break;

 case inicio3:
 if (dat_rx=='=')
 {
 trama_rx_nextion[trama_rx_cont]=dat_rx;
 nextion_trama_estado=fin1;
 trama_rx_cont++;
 }
 else
 {
 nextion_trama_estado=inicio1;
 trama_rx_cont=0;
 }
 break;

 case fin1:

 if (dat_rx!=0xff)
 {
 trama_rx_nextion[trama_rx_cont]=dat_rx;
 trama_rx_cont++;
 if (trama_rx_cont>=50)
 {
 trama_rx_cont=0;
 nextion_trama_estado=inicio1;
 }
 }
 else nextion_trama_estado=fin2;
 break;

 case fin2:

 if (dat_rx!=0xff)
 {
 trama_rx_nextion[trama_rx_cont]=dat_rx;
 trama_rx_cont++;
 if (trama_rx_cont>=50)
 {
 trama_rx_cont=0;
 nextion_trama_estado=inicio1;
 }

 }
 else nextion_trama_estado=fin3;
 break;


 case fin3:

 if (dat_rx!=0xff)
 {
 trama_rx_nextion[trama_rx_cont]=dat_rx;
 trama_rx_cont++;
 if (trama_rx_cont>=50)
 {
 trama_rx_cont=0;
 nextion_trama_estado=inicio1;
 }

 }
 else
 {
 trama_rx_nextion[trama_rx_cont]=0;
 nextion_trama_estado=inicio1;
 trama_rx_cont=0;
 RCIE_bit=0;
 flag_rx1=1;
 }
 break;

 }

 RCIF_bit=0;
 }
}
