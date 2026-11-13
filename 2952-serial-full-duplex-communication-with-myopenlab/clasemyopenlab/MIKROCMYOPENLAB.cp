#line 1 "D:/ARZ/myopenlab/clasemyopenlab/MIKROCMYOPENLAB.c"
sbit led1 at LATB6_bit;
sbit led2 at LATB7_bit;

sbit pul1 at RB0_bit;
sbit pul2 at RB1_bit;

unsigned int codigo;



float voltaje,temperatura;
unsigned int led1_O,led2_O;



unsigned char trama_tx[40];
unsigned char trama_rx[40];
unsigned char captura_rx[40];

unsigned char datorx,flag_rx;
unsigned char puntero_rx=0;

enum estados_rep {CAP_1I,CAP_N,CAP_2I,fin};
unsigned char estado_rx=CAP_1I;

void procesarx()
{
unsigned int dato_procesado;

 strcpy(captura_rx, strtok(trama_rx, "="));
 strcpy(captura_rx, strtok(0, "/"));

 dato_procesado=atoi(captura_rx);


 dato_procesado=dato_procesado*255/100;

 PWM1_set_duty(dato_procesado);


 strcpy(captura_rx, strtok(0, "/"));

 dato_procesado=atoi(captura_rx);

 dato_procesado=dato_procesado*255/100;
 PWM2_set_duty(dato_procesado);

 strcpy(captura_rx, strtok(0, "/"));

 dato_procesado=atoi(captura_rx);
 led1=dato_procesado;

 strcpy(captura_rx, strtok(0, "/"));

 dato_procesado=atoi(captura_rx);
 led2=dato_procesado;


 }


void interrupcion() iv 0x0008 ics ICS_AUTO

 {

 if (RCIF_bit==1)
 {

 datorx=RCREG;


 switch (estado_rx)
 {
 case CAP_1I:
 if (datorx=='I')
 {
 trama_rx[puntero_rx]=datorx;
 puntero_rx++;
 estado_rx=CAP_N;

 }
 break;

 case CAP_N:
 if (datorx=='N')
 {
 trama_rx[puntero_rx]=datorx;
 puntero_rx++;
 estado_rx=CAP_2I;
 }
 else
 {
 estado_rx=CAP_1I;
 puntero_rx=0;
 }

 break;

 case CAP_2I:

 if (datorx=='I')
 {
 trama_rx[puntero_rx]=datorx;
 puntero_rx++;
 estado_rx=fin;
 }
 else
 {
 estado_rx=CAP_1I;
 puntero_rx=0;
 }

 break;

 case fin:
 {
 trama_rx[puntero_rx]=datorx;
 puntero_rx++;
 if (puntero_rx>=40)
 {
 puntero_rx=0;
 estado_rx=CAP_1I;

 }

 if (datorx=='*')
 {

 RCIE_bit=0;
 estado_rx=CAP_1I;
 flag_rx=1;

 }

 }
 break;


 }



 if (OERR_bit==1)
 {
 CREN_bit=0;
 CREN_bit=1;
 }


 RCIF_bit=0;

 }




 }


void main()

{

ADC_Init();

ADCON1=0b1101;


TRISA=0;
TRISB=0;
TRISC=0;


TRISA0_bit=1;
TRISA1_bit=1;



TRISB0_bit=1;
TRISB1_bit=1;




TRISC7_bit=1;

 UART1_Init(9600);

 PWM1_Init(260);
 PWM1_Init(260);
 PWM1_Set_Duty(0);
 PWM2_Set_Duty(0);
 PWM1_Start();
 PWM2_Start();


 INTCON=0B01000000;

 RCIF_bit=0;
 RCIE_bit=1;

 RCEN_bit=0;
 RCEN_bit=1;

 GIE_bit=1;


 while(1)
 {
 codigo=ADC_Get_Sample(0);
 temperatura=codigo*500.0/1023.0;
 Delay_us(100);

 codigo=ADC_Get_Sample(1);
 voltaje=codigo*5.0/1023.0;
 Delay_us(100);


 if (pul1==0) led1_O=1; else led1_O=0;
 if (pul2==0) led2_O=1; else led2_O=0;



 sprintf(trama_tx,"/%5.1f/%3.1f/%1u/%1u/",temperatura,voltaje,led1_O,led2_O);
 UART1_Write_Text(trama_tx);

 if (flag_rx==1)
 {
 procesarx();
 puntero_rx=0;
 memset(trama_rx,0,40);
 flag_rx=0;
 RCIF_bit=0;
 CREN_bit=0;
 CREN_bit=1;

 RCIE_bit=1;

 }




 Delay_ms(100);


 }


}
