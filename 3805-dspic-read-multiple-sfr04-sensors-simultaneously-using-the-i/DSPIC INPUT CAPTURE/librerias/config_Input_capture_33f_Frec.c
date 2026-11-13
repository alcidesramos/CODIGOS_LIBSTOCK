#include "confi_perifericos.h"



void confi_timer_2()
{
 //configuracion timer 2
//100ms
tmr2=0;
pr2=65535;
t2con=0;
//preescalador 1  //para medir 50 hz  20ms (mide de 10 hz a 625Khz)  0b10
//T2CONbits.TCKPS=0b10;
t2con.b5=0;
t2con.b4=0;
T2CONbits.TON=1;//prendo
}

void config_inputcapure()
{
confi_timer_2();
IC1CON=0; //limpia registo
ICTMR_bit=1; //1=timer 2 es la fuente de reloj 0= timer 3

//configura la interrupcion
//interrupcion cada dos flancos, se usa para medir frecuencia
IC1CONbits.ICI=0b01;

//  Captura cada subida
IC1CONbits.ICM=0b011;

//habilita la interrupcion
IC1IF_bit=0;
IC1IE_bit=1;

//Priorad d ela interrupcion
IC1IP_2_bit=0;
IC1IP_1_bit=1;
IC1IP_0_bit=1;
}

/*

if (sal==0)
 {

  if (pulso_1==0) rpm=0; else
  rpm=(float)Get_Fosc_kHz()*1000.0/(68.26*pulso_1*2.0*1.0);  // 2 esque el dspic trabaja a la mitad y 1 es el prrescalador
  rpm= 0.9203*rpm + 19.51;
   //      oc1rs=200;

pe_na1=IC1BUF;
pe_na1=IC1BUF;
pe_na1=IC1BUF;
pe_na1=IC1BUF;
IC1IF_bit=0;
IC1IE_bit=1;
sal=1;
}else rpm=0;
 

*/


extern  unsigned int pulso_1;
extern sfr sbit in_pulso_1;
extern  char sal;

void INTIC1() iv IVT_ADDR_IC1INTERRUPT ics ICS_AUTO
{
unsigned int pe_1,pe_2,pe_na;
pe_1=IC1BUF;
pe_2=IC1BUF;
led_azul=~led_azul;
//led_azul=1;



  //Para medir perido
if (pe_2>pe_1) pulso_1=(pe_2-pe_1);
else pulso_1=(PR2 - pe_1) + pe_2;
sal=0;


pe_na=IC1BUF;
pe_na=IC1BUF;
pe_na=IC1BUF;
pe_na=IC1BUF;
IC1IF_bit=0;
IC1IE_bit=0;
}