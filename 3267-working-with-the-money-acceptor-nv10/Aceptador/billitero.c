unsigned char pulsos_var=0;
char flag_bill=0;
char texto[30];
unsigned int dinero;


void interrpciones() iv 0x0008 ics ICS_AUTO 
{
  if (INT0IF_bit==1)
      {
          flag_bill=0;
          TMR0H=146;
          TMR0L=35;
          TMR0ON_bit=1; // enciende el timer para medor desborde y saber si ya terminó los pulsos
        pulsos_var++;
   INT0IF_bit=0;

      }
      
      if (TMR0IF_bit==1)
      {
        TMR0H=146;
        TMR0L=35;

         TMR0ON_bit=0; // Apaga  el timer
         flag_bill=1;
        TMR0IF_bit=0;

      }



}

   void billetero ()
 {
  if (flag_bill==1)
   {

     flag_bill=0;
    dinero=pulsos_var*1000;
    sprinti(texto,"SALDO=%u\r\n",dinero);
    UART1_Write_Text(texto);

    }



 }



void main() 

{
//INTERRUPCIONES
INTCON=0b01000000; //deshabilitadas
ADCON1=0x0F;// TODO DIGITAL

//EL COMPARADOR
CMCON=7; // APAGA EL COMPARADOR.


//cinfiguracion de puertos
TRISA=255;// TODO SALIDA
TRISB=255;
trisc=255;

TRISB7_bit=0;

TRISB1_bit=0;  // PIN HABILITAR EL BILLETERO

LATB1_bit=0; // HABILITA EL BILLETERO

    RC6_bit=0; // TX SERIAL

  UART1_Init(9600);



   INT0IF_bit=0;
   INTEDG0_bit=0;// FALCO DE BAJADA
   INT0IE_bit=1; // HABILITA INTERROCION FLANCO

   //configuracion timer 0
//600 milisegundo
    T0CON=0;//LIMPIA REGISTRO DEL TIMER CERO
    TMR0ON_bit=0; // lo mantiene apagado
    
    TMR0H=146;
    TMR0L=35;
    // PREESCAALDOR DE 256
    T0PS2_bit=1;
    T0PS1_bit=1;
    T0PS0_bit=1;

    TMR0IF_bit=0;
    TMR0IE_bit=1;// habilita la interrpcion
    TMR0ON_bit=0;//Apaga el Timer
    
    
    GIE_bit=1;// habilita laS INTERRUPCIONES

    UART1_Write_Text("Iniciando\r\n");
    
    while(1)
    {
     billetero();
     UART1_Write_Text("FUNCIONANDO\r\n");
     LATB7_bit=~LATB7_bit;
     Delay_ms(1000);
    
    
    }


}