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
ANSELA.b1=1; //entrada analoga

//configuracon de los pines
trisa.b1=1;
trisa.b0=1; //salida DAC

//configuracion del DAC

   // limpia registros asociados al DAC
   DACCON0=0;
   DACCON1=0;
   DACEN_bit=1; //HABILITA EL DAC
   DACOE_bit=1; //CONECTA EL dac A RAO
   
   while (1)
   {
   codigo=ADC_Read(1);
    dac=codigo/32.0;// para pasar a 5 bits
    DACCON1=dac;
   
   }



 

}