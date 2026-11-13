#line 1 "C:/Users/Alcides_Ramos/Desktop/cruce  por cero 2018/Interrupcion/Interrupcion/Interrupcion/PIC_2018/crucefinal.c"
sbit led at LATC0_bit;
sbit suiche at RB1_bit;

sbit pulso at LATC1_bit;

float calculo;
char dispara;
unsigned int codigo;
float temperatura;

char trama_tx[100];

char trama_rx[30];
char procesa[30];
char dato;


char datorx;
char puntero=0;
char flag_rx=0;

void procesarx()
{
if (strstr(trama_rx,"led1="))
 {
 if (strstr(trama_rx,"on")) led=1;
 else led=0;
 }

 else if (strstr(trama_rx,"pul="))
 {
 strcpy(procesa, strtok(trama_rx, "="));
 strcpy(procesa, strtok(0, "/"));

 dispara=atoi(procesa);

 }


}

void interrupcion() iv 0x0008 ics ICS_AUTO
{

 if (INT0IF_bit==1)
 {
 pulso=0;
 TMR0L=calculo;
 TMR0IF_bit=0;
 TMR0IE_bit=1;

 INT0IF_bit=0;
 }

 if (RCIF_bit==1)
 {
 datorx=UART1_Read();
 trama_rx[puntero]=datorx;
 puntero++;
 if (puntero>=30) puntero=0;
 if (datorx=='*')
 {
 RCIE_bit=0;
 flag_rx=1;

 }

 if (OERR_bit==1)
 {
 RCEN_bit=0;
 RCEN_bit=1;
 }

 RCIF_bit=0;
 }



 if (TMR0IF_bit==1)
 {

 pulso=1;

 Delay_us(10);
 pulso=0;
 TMR0IF_bit=0;
 TMR0IE_bit=0;

 }


}



void main()
{
ADCON1=0b1110;


 trisa.b0=1;
 trisb.b0=1;
 trisb.b1=1;

 trisc.b0=0;
 trisc.b1=0;




 TRISC6_bit=0;
 TRISC7_bit=1;

 UART1_Init(9600);


 RCIF_bit=0;
 RCIE_bit=1;



INTCON=0B01000000;
INT0IF_bit=0;
INTEDG0_bit=1;
INT0IE_bit=1;





 TMR0ON_bit=1;
 T08BIT_bit=1;



 T0IF_bit=0;
 T0IE_bit=0;
 T0CS_bit=0;
 PSA_bit=0;


 T0PS2_bit=1;
 T0PS1_bit=1;
 T0PS0_bit=1;


 GIE_bit = 1;
 led=0;


 while (1)

 {

 codigo=ADC_Read(0);
 temperatura=500.0*codigo/1023.0;
 if (flag_rx==1)
 {

 procesarx();
 puntero=0;
 memset(trama_rx,0,30);
 flag_rx=0;
 RCIF_bit=0;
 RCIE_bit=1;
 }


 if (dispara<=5)
 {

 INT0IE_bit=0;
 pulso=0;

 }
 else if (dispara>=90)
 {


 INT0IE_bit=0;
 pulso=1;


 }
 else
 {

 calculo=-1.6266*dispara + 256.1;
 INT0IF_bit=0;
 INT0IE_bit=1;

 }

 sprintf(trama_tx,"temp=%.2f/",temperatura);
 UART1_Write_Text(trama_tx);

 if (suiche==1) UART1_Write_Text("led=on/");
 else UART1_Write_Text("led=off/");

 Delay_ms(50);


 }


}
