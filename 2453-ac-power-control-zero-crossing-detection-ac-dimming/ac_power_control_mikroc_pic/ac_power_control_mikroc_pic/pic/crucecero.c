unsigned char velocidad;  //la energia plicada
unsigned int codigo;  //lo leido del adc

#define opto RA2_bit    // cruce cero
#define triac LATA1_bit      // disparo triac


void  espera(char t)
{
  TMR0=t;
 TMR0IF_bit=0;
 while  (TMR0IF_bit==0) ;    // espera timer se desborde

}





void main() 
{

//configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

// Par Trabajar a 32 MHz con PLL
SPLLEN_bit=1; //prende el PLL por 4


//configura entrdas y salidas
//Todo Digital
ansela=0;
ansela.b0=1;//pin analogo  // el potenciometro


trisa=0;
trisa.b0=1;// como entrada
trisa.b2=1;// cruce por cero

ADC_Init();     // inicalizo el adc

    // configura el timer 0
    
OPTION_REG=0; //tmr0 como contador

//prescaldor de 32 para lograr los 8 ms
   PS2_bit=1;
   PS1_bit=1;
   PS0_bit=1;
   
     while (1)
      {
        codigo=ADC_Get_Sample(0);// lee  la energia deseada

       if (codigo<=200) triac=0;
        else if (codigo>=900) triac=1;
       else
        {
          while ((opto==0)) ;
           velocidad= codigo >>2;  //   corre dos posi9ciones o dicide entre 4 para ubicar los 1023 en el rango de 255 del tiemr0
           espera(velocidad);
           triac=1;
           delay_us(100);
           triac=0;

         }

    }
     



}