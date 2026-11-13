 unsigned int codigo;
float dac;

void main() 

{

//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

//Todo Digital
ansela=0;
ANSELC=0;
ANSELA.b1=1; //entrada analoga

//configuracon de los pines
trisa.b1=1;
trisa.b0=1; //salida DAC

TRISC=0;

//configuracion del DAC
 // limpia registros asociados al DAC
   DAC1CON0=0;
   DAC1CON1=0;
   DAC1EN_bit=1; //HABILITA EL DAC
   DAC1OE1_bit=1; //CONECTA EL dac A RAO
   
   //configurar operacional
   TRISC0_bit=1;      // entrada +
   TRISC1_bit=1;       // entrada negativa
   
   TRISC2_bit=0;       // operacional
   
   OPA1CON=0;
   OPA1EN_bit=1; // habilita operacional
   
   
    while (1)
   {
   codigo=ADC_Read(1);
    dac=codigo/4.0;// para pasar a 5 bits
    DAC1CON1=dac;

   }




}