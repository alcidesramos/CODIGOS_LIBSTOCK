#line 1 "C:/Users/Alcides Ramos/Desktop/Joystick buque 2020 pic18f/Librerias/config_serial1.c"

char rx1_dat;


enum trama_rx_es {inicio1,inicio2,inicio3,fin1};
unsigned char recibidos_estado1=inicio1;
unsigned char dato1_in,puntero_rx1=0;


unsigned char Trama_rx1[50];
char flag_rx1=0;
const char max_datos=50;

void config_serial()
{

 UART1_Init(9600);
 RCIF_bit=0;
 RCIE_bit=1;

 CREN_bit=0;
 CREN_bit=1;

}


void interrupcion_serial()
{
 if (RCIF_bit==1)
 {

 dato1_in=RCREG;

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
 RCIF_bit=0;
 RCIE_bit=0;
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


 RCIF_bit=0;
 }


}
