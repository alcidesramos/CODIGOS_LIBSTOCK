

void main() 
{
//configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//oscilador  Puesto en la palabra de configuracion
SCS1_bit=0;
SCS0_bit=0;

//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

SPLLEN_bit=1; //Prende el PLL por 4  entonces 32Mz

UART1_Init(9600);
//remapeo_pines();
//pines UART
RXDTSEL_bit=1; // RX en   RA1
TXCKSEL_bit=1; // tX en  RA0;


 // configrar despues de periofericos uart spi o pwm por librerias de mikroc
TRISA=0;
TRISC=0;
TRISC3_bit=1; // entrada de moduladora manual

   //PWM

//Configuracion Modulo PWM1 CCP1 al timer 2
T2CON=0;
//preescalador  =1
T2CKPS1_bit=0;
T2CKPS0_bit=0;

PR2=199; // para 25 us  40khz

CCP1CON=0;
// selecciona el timer 2
C1TSEL1_bit=0;
C1TSEL0_bit=0;

//modo PWM
CCP1CON=0;
CCP1M3_bit=1;
CCP1M2_bit=1;
CCP1M1_bit=0;
CCP1M0_bit=0;
//bits menos significativos para ciclo util
CCPR1L=99;  //parte alta del ciclo util
//Bits bajo del ciclo util
DC1B1_bit=1;
DC1B0_bit=1;

PSTR1CON=0;    //no asigna ningun pin salida
STR1SYNC_bit=0;// no espera siguiente periodo

STR1A_bit=1; //salida PWM PA1
//STR1B_bit=1; //salida PWM PB1
//STR1C_bit=1; //salida PWM PC1   solo para monitorear
//STR1D_bit=1; //salida PWM PD1

TMR2ON_bit=1;  //prende el timer 2



//Configuracion Modulo PWM4  CCP4 al timer 6
T6CON=0;
//preescalador  =4
T6CKPS1_bit=0;
T6CKPS0_bit=1;
PR6=119;   //  para 60 us

CCP4CON=0;
// selecciona el timer 6
C4TSEL1_bit=1;
C4TSEL0_bit=0;

//modo PWM    ccp4
CCP4CON=0;

CCP4M3_bit=1;
CCP4M2_bit=1;
CCP4M1_bit=0;
CCP4M0_bit=0;
//bits menos significativos para ciclo util
CCPR4L=59;  //byte alto del ciclo util
//Bits bajo del ciclo util
DC4B1_bit=1;
DC4B0_bit=1;
PSTR2CON=0;    //no asigna ningun pin salida
STR2SYNC_bit=0;// no espera siguiente periodo

//STR2A_bit=1; //salida PWM PA1
//STR2B_bit=1; //salida PWM PB2
//STR2C_bit=1; //salida PWM PC2
//STR2D_bit=1; //salida PWM PD2
TMR6ON_bit=1;  //prende el timer 6

//Configuración del Modulo Modulador de señal

MDCON=0;
MDEN_bit=0; //Deshabilita el modulo
MDOE_bit=1; //habilita la salida el pin
MDSLR_bit=1; //habilita slew rate

MDMSODIS_bit=0;//habilita moduladora

//selecciona quien modula   en este caso por manual  MDINPIN
/*
MDMS3_bit=0;
MDMS2_bit=0;
MDMS1_bit=0;
MDMS0_bit=1;

*/


//selecciona quien modula   en este caso por software
 /*
MDMS3_bit=0;
MDMS2_bit=0;
MDMS1_bit=0;
MDMS0_bit=0;
   */

//selecciona quien modula   en este caso por Uart

MDMS3_bit=1;
MDMS2_bit=0;
MDMS1_bit=1;
MDMS0_bit=0;

  
  
MDCARH=0; //registro de moduladora alta
MDCHSYNC_bit=1; //sincronizado

//selecciona fuente de High   en este caso CCP1
MDCH3_bit=0;
MDCH2_bit=1;
MDCH1_bit=0;
MDCH0_bit=0;

//selecciona fuente de 1   en este caso GND
/*
MDCH3_bit=0;
MDCH2_bit=0;
MDCH1_bit=0;
MDCH0_bit=0;
*/


MDCHPOL_bit=1; //invierte la señal de portadora alta


MDCARL=0; //registro de moduladora baja
MDCLSYNC_bit=1; //sincronizado

//selecciona fuente de Low   en este caso CCP4
MDCL3_bit=0;
MDCL2_bit=1;
MDCL1_bit=1;
MDCL0_bit=1;


//selecciona fuente de Low   en este caso VSS
/*
MDCL3_bit=0;
MDCL2_bit=0;
MDCL1_bit=0;
MDCL0_bit=0;   */


  MDEN_bit=1;//    habilita el Modulo
  
 /* MDBIT_bit=1;
  Delay_ms(1);
  
  MDBIT_bit=0;
  Delay_ms(1);  */
  
   TXREG=0b10101010;
  while (TRMT_bit==0); // mientras esta el buffer lleno



  MDEN_bit=0;//    Deshabilita el Modulo





   while (1)
   {
   
   
   }



}