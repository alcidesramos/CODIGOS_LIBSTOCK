#line 1 "C:/Users/Alcides_Ramos/Desktop/paso paso/Mikroc2018/pasopaso2018.c"










char codigo1[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};
char codigo2[]={0b1000,0b1100,0b0100,0b0110,0b0010,0b0011,0b0001,0b1001};




const n_pasos_m=8;




signed char secuencia1=0;
signed char secuencia2=0;


char giro_m1,giro_m2;

char velo_m1=0,velo_m2=0;

unsigned long n_pasos1,n_pasos2;

unsigned long pasos1=0,pasos2=0;

char velo1=0,velo2=0;

const char n_pasos=n_pasos_m-1;




sbit m11 at LATA.b0;
sbit m12 at LATA.b1;
sbit m13 at LATA.b2;
sbit m14 at LATA.b4;

sbit m21 at LATC.b0;
sbit m22 at LATC.b1;
sbit m23 at LATC.b2;
sbit m24 at LATC.b3;









char estado_giro1= 3 ,estado_giro2= 3 ;
char estado_modo1= 1 ,estado_modo2= 1 ;





char trama_rx[30];
char procesa[30];
char dato;


char datorx;
char puntero=0;
char flag_rx=0;



void saca_secuencia1()
{
 pasos1++;
 m11=codigo1[secuencia1].b0;
 m12=codigo1[secuencia1].b1;
 m13=codigo1[secuencia1].b2;
 m14=codigo1[secuencia1].b3;
}


void saca_secuencia2()
{
 pasos2++;
 m21=codigo2[secuencia2].b0;
 m22=codigo2[secuencia2].b1;
 m23=codigo2[secuencia2].b2;
 m24=codigo2[secuencia2].b3;
}


 void izquierda1()
 {
 secuencia1++;
 if (secuencia1>n_pasos) secuencia1=0;
 saca_secuencia1();
 }

void derecha1()
 {
 secuencia1--;
 if (secuencia1<0) secuencia1=n_pasos;
 saca_secuencia1();
 }

void izquierda2()
 {
 secuencia2++;
 if (secuencia2>n_pasos) secuencia2=0;
 saca_secuencia2();
 }

void derecha2()
 {
 secuencia2--;
 if (secuencia2<0) secuencia2=n_pasos;
 saca_secuencia2();
 }

 void procesarx()
{

if (strstr(trama_rx,"m1der*")) estado_giro1= 1 ;
else if (strstr(trama_rx,"m1izq*")) estado_giro1= 2 ;
else if (strstr(trama_rx,"m1stop*")) estado_giro1= 3 ;
else if (strstr(trama_rx,"m2der*")) estado_giro2= 1 ;
else if (strstr(trama_rx,"m2izq*")) estado_giro2= 2 ;
else if (strstr(trama_rx,"m2stop*")) estado_giro2= 3 ;

 else if (strstr(trama_rx,"vel1"))
 {
 strcpy(procesa, strtok(trama_rx, "="));
 strcpy(procesa, strtok(0, "/"));

 dato=atoi(procesa);
 estado_modo1= 1 ;
 velo_m1=dato;

 }

 else if (strstr(trama_rx,"vel2"))
 {
 strcpy(procesa, strtok(trama_rx, "="));
 strcpy(procesa, strtok(0, "/"));

 dato=atoi(procesa);
 estado_modo2= 1 ;
 velo_m2=dato;

 }


 else if (strstr(trama_rx,"pap1"))
 {
 strcpy(procesa, strtok(trama_rx, "="));
 strcpy(procesa, strtok(0, "/"));

 dato=atoi(procesa);

 pasos1=0;
 estado_modo1= 2 ;
 n_pasos1=dato;
 }

 else if (strstr(trama_rx,"pap2"))
 {
 strcpy(procesa, strtok(trama_rx, "="));
 strcpy(procesa, strtok(0, "/"));

 dato=atoi(procesa);

 pasos2=0;
 estado_modo2= 2 ;
 n_pasos2=dato;
 }

 memset(trama_rx,0,30);
}



void interrupcion() iv 0x0004 ics ICS_AUTO
{
 if (T0IF_bit==1)
 {
 T0IE_bit=0;
 velo1++;
 velo2++;


 if (velo1>=256-velo_m1)
 {
 velo1=0;
 if (estado_modo1== 2 )
 {
 if (pasos1>=n_pasos1)
 {
 estado_giro1= 3 ;
 pasos1=0;
 }
 }

 switch (estado_giro1)
 {
 case  1 : derecha1(); break;
 case  2 :izquierda1();break;

 }

 }


 if (velo2>=256-velo_m2)
 {
 velo2=0;
 if (estado_modo2== 2 )
 {
 if (pasos2>=n_pasos2)
 {
 estado_giro2= 3 ;
 pasos2=0;
 }
 }

 switch (estado_giro2)
 {
 case  1 : derecha2(); break;
 case  2 :izquierda2();break;

 }

 }






 TMR0=0;
 T0IF_bit=0;
 T0IE_bit=1;
 }

 if (RCIF_bit==1)
 {
 datorx=RCREG;
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
 CREN_bit=0;
 CREN_bit=1;
 }
 RCIF_bit=0;
 }




}



void main()
{

SCS1_bit=0;
SCS0_bit=0;



IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;


SPLLEN_bit=1;

while (PLLR_bit==0);


ANSELA=0;
ANSELC=0;


TRISA=0;
TRISC=0;

TRISC5_bit=1;

UART1_Init(9600);
UART1_Write_Text("INICIANDO");

RXDTSEL_bit=0;
TXCKSEL_bit=0;


INTCON=0b01000000;

 OPTION_REG=0;

PS2_bit=1;
PS1_bit=1;
PS0_bit=1;

TMR0=0;
 T0IF_bit=0;
 T0IE_bit=1;


 estado_giro1= 1 ;
 estado_giro2= 1 ;
 estado_modo1= 1 ;
 estado_modo2= 1 ;
 velo_m1=180;
 velo_m2=180;



RCIF_bit=0;
RCIE_bit=1;
CREN_bit=1;



 GIE_bit=1;
 while (1)
 {

 if (flag_rx==1)
 {

 procesarx();
 puntero=0;
 memset(trama_rx,0,30);
 flag_rx=0;
 RCIF_bit=0;
 RCIE_bit=1;
 }

 LATA5_bit=~LATA5_bit;
 Delay_ms(500);
#line 390 "C:/Users/Alcides_Ramos/Desktop/paso paso/Mikroc2018/pasopaso2018.c"
 }






}
