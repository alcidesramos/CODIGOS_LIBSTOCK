//#define sw  RA3_bit

sbit  sw at RA3_bit;


enum maquina1_est {encendido,flahs,policia,alternado,apagado,melodia};

char  estados=encendido;

void main() 
{
  //oscilador a 8 mega
   IRCF3_bit=1;
   IRCF2_bit=1;
   IRCF1_bit=1;
   IRCF0_bit=0;
   
   
   // prender el ppl
  SPLLEN_bit=0;
  TRISA=0;  // todo salida
  TRISA3_bit=1; // entrada sdel sucihe
   
   //  trabaja oscilaodr interno
   SCS1_bit=1;
   SCS0_bit=1;
  
  ANSELA=0; //   todo digital
  // leer   PORT  RA
  //  sacar  LAT
  
    LATA=0; //led apado
    Sound_Init(&LATA,5);
      while (1)
      
      {

          switch (estados)
          {
           case encendido :      //543210
                    LATA=0b010111;
                    if (sw==0)
                    {
                     estados=flahs;
                     Delay_ms(250);
                    }
           
                   break;
          
           case flahs:              //543210
                    LATA=LATA ^ 0b010111;
                    Delay_ms(200);
                    if (sw==0)
                    {
                    //me preparo siguiente caso
                           //543210
                      LATA=0b010100;
                     estados=policia;
                     Delay_ms(250);
                    }

                   break;


          case policia:              //543210
                    LATA=LATA ^ 0b010111;
                    Delay_ms(200);
                    if (sw==0)
                    {
                    //me preparo siguiente caso
                           //543210
                      LATA=0b010010;
                     estados=alternado;
                     Delay_ms(250);
                    }

                   break;
                   
           case alternado:              //543210
                    LATA=LATA ^ 0b010111;
                    Delay_ms(200);
                    if (sw==0)
                    {
                    //me preparo siguiente caso
                           //543210
                      LATA=0b000000;
                     estados=apagado;
                     Delay_ms(250);
                    }

                   break;
         case apagado:       //543210
                    LATA=0;
                    if (sw==0)
                    {
                    //me preparo siguiente caso
                           //543210
                     LATA=0b000000;
                     estados=melodia;
                     Delay_ms(250);
                    }

                   break;
          case melodia:              //543210
                     Sound_Play(1000,100);
                       Sound_Play(2000,100);
                         Sound_Play(3000,100);
                    if (sw==0)
                    {
                    //me preparo siguiente caso
                           //543210
                      LATA=0b010111;
                     estados=encendido;
                     Delay_ms(250);
                    }

                   break;
                   


          
          } //fin switch
      
      
      }
  
  
  
  
  }