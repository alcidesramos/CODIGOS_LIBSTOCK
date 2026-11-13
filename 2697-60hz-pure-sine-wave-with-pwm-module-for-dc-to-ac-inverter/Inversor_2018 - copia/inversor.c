 const muestras=120;
 unsigned int onda[]={347,366,384,402,420,438,455,473,490,506,522,538,553,567,581,594,607,619,630,640,649,658,666,673,679,684,688,691,693,694,694,694,692,689,686,681,676,669,662,654,645,635,624,613,601,588,574,560,545,530,514,498,481,464,447,429,411,393,375,356,338,320,302,283,265,248,230,213,197,180,164,149,134,120,107,94,82,70,59,50,41,32,25,19,13,9,5,2,1,0,0,1,4,7,11,16,22,29,36,45,54,65,76,88,100,113,127,142,157,172,188,205,222,239,257,274,292,311,329,347};

unsigned int es,toca;






//para variables
char LEEBIT (unsigned int port, char bit1)
{

    if ((port & (1 << bit1))>0) return (1);
    else return (0);
}


void interrpcion() iv 0x0008 ics ICS_AUTO 

{

  if (TMR2IF_bit==1)
{
toca++;
if (toca>=muestras-1) toca=0;

es=onda[toca];
   // carga los 9 bit ciclo util
 CCPR1L=es >> 2;// carga parte baja
DC1B1_bit=LEEBIT(es,1);// carga bit 1
DC1B0_bit=LEEBIT(es,0);  // carga bit 0
TMR2IF_bit=0;
}



}

void main() 
{



//Todo Digital
adcon1=0b1111;


INTCON=0b01000000;

//configuracon de los pines
TRISA=0;
trisc=0;// salida pwm


CCP1CON=0b00101100;// configura como pwm;

//configuracion frecuencia.
T2CON=0;

//programa frecuencia.
// PREESCALAODR A 4
T2CKPS1_bit=0;  //prescalador time 2
T2CKPS0_bit=1;  //prescalador time 2
PR2=173;            //registro pr2


  toca=0;
  
 es=onda[toca];
 // aramr el ciclo util deseado a 9 bits
 CCPR1L=es >> 2;

    if ((es & (1 << 1))>0) DC1B1_bit=1;
    else DC1B1_bit=0;

    if ((es & (1 << 0))>0) DC1B0_bit=1;
    else DC1B0_bit=0;

    // habilita int del timer2
TMR2IF_bit=0;
TMR2IE_bit=1;
GIE_bit=1;
TMR2ON_bit=1;//prende pwm

while (1)
{

}




}