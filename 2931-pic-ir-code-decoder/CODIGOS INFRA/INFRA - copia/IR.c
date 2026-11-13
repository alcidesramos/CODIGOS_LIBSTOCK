#define led1 LATC0_bit
#define led2 LATC1_bit
#define led3 LATC2_bit

 const unsigned char codigo1[]={6, 10, 22, 10, 22, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10, 22, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10, 22, 10,  6, 10, 22, 10, 22, 10, 22, 10, 22, 10, 22, 10};
 const unsigned char codigo2[]={6, 10, 22, 10, 22, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10, 22, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10,  6, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10,  6, 10, 22, 10, 22, 10, 22, 10, 22, 10, 22, 10};
const unsigned char codigo3[]= {6, 10, 22, 10, 22, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10, 22, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10, 22, 10,  6, 10,  6, 10,  6, 10,  6, 10,  6, 10, 22, 10,  6, 10,  6, 10, 22, 10, 22, 10, 22, 10, 22, 10, 22, 10};




char flag_codigo=0;


unsigned int cuenta=0;  // almacenar #datos
unsigned char cont; // contador para for
char texto[10];   // usado para convertir numeros a cadena
 unsigned char timer_aux;
 
 unsigned char tiempo[68];

  //define codigos a analizar
#define inicio 138  /// no interesa
#define cod1 6
#define cod2 10
#define cod3 22

#define paso 2  // desviacion del Tiempo en el codigo leido +-2 en este caso opcional                                                               en esyte caso
#define paso1 3   // desviacion del Tiempo en el codigo leido +-3 en este caso                                                                en esyte caso



void Interrpcion() iv 0x0004 ics ICS_AUTO
 {
if (INTF_bit==1)
    {


       //el analasis se hace solo
       if (flag_codigo==0)
       {

       if (cuenta!=0)
       {
       timer_aux=TMR0; //captura el valor del timer
       TMR0=0; // resetea el timer para otra lectura
       tiempo[cuenta-1]=timer_aux;     // CARGA UN BUUFER CON LOS DATOS
       cuenta++;
       INTEDG_bit=!INTEDG_bit;

                   if (TMR0IF_bit==1)  // si hubo desborde del timer , fin de datos
                   {
                   cuenta--;// omite el codigo de ultimo desborde
                    flag_codigo=1;
                    INTE_bit=0; //deshabilita la interrpcuion
                  }
          }
        else
        {
        TMR0IF_bit=0;// limpia la bansera timer
        TMR0=0;   // resetea el timer
        cuenta++;
        }

        }
      }





    INTF_bit=0;








 }
        // compara dos vector
 unsigned char  verifica(const unsigned char  *vector,unsigned char size)
{
  unsigned char  cu;

   for (cu=0;cu<size;cu++)
    {
      if (vector[cu]!=tiempo[cu])
      {

        return(0);
      }

    }

    return(1);

    }




void normaliza()
{

         //    UART1_Write_Text("NOR=\r\n");
        // UART1_Write('{');

 for (cont=0;cont<cuenta-1;cont++)
          {
        if ( (tiempo[cont]>=cod1-paso1) &&   (tiempo[cont]<=cod1+paso))  tiempo[cont]=cod1;
        else if ( (tiempo[cont]>=cod2-paso1) &&   (tiempo[cont]<=cod2+paso))  tiempo[cont]=cod2;
        else if ( (tiempo[cont]>=cod3-paso1) &&   (tiempo[cont]<=cod3+paso1))  tiempo[cont]=cod3;
        else    tiempo[cont]=cod1;
      /*  ByteToStr(tiempo[cont],texto);
         UART1_Write_Text(texto);
         UART1_Write(',');  */
         }

        /* UART1_Write('}');
         UART1_Write('\r');
         UART1_Write('\n');   */

}


void main() 
{
//OScialdor Interno a 16 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=1;


//Todo Digital
ansela=0;
anselc=0;
//configuracon de los pines
TRISA=0;  
trisc=0;

TRISA2_bit=1; // entrada de INT

//remapeo_pines();
//pines UART
//RXDTSEL_bit=1; // RX en RA1  sino RC5
//TXCKSEL_bit=1; // tX en RA0  sino RC4
TXCKSEL_bit=0; // tX en RC4  sino RA0

UART1_Init(19200);

LATA=0;

 UART1_Write_Text("INICIANDO\r\n");
 LATC=0;

   // configura el timer cero para medir tiempo mas de 16ms
OPTION_REG=0;      // preescalador asigando al timer 0

// selecciona el prescalador   para   16ms
PS2_bit=1;
PS1_bit=1;
PS0_bit=1;

   UART1_Write_Text("INICIANDO\r\n");
   LATC=0;


// Habilitamos INTerrpcion
INTCON=0b01000000;
INTEDG_bit=0; // for flanco de bajada
INTF_bit=0; // limpia la badera de interrpcion
INTE_bit=1; //  habilita la interrpcion for flanco

GIE_bit=1; // autoriza todas las interrpciones

   while (1)
   {
  if (flag_codigo==1)
     {


          /* UART1_Write_Text("son=");
         ByteToStr(cuenta,texto);
         UART1_Write_Text(texto);
         UART1_Write('\r');
         UART1_Write('\n');

        UART1_Write_Text("TIEMPOS=\r\n");
         UART1_Write('{');

         for (cont=0;cont<cuenta-1;cont++)
          {
         ByteToStr(tiempo[cont],texto);
         UART1_Write_Text(texto);
         UART1_Write(',');
         }

         UART1_Write('}');
         UART1_Write('\r');
         UART1_Write('\n');
         */
         normaliza();

          if (verifica(&codigo1,cuenta-1)==1)
        {
         led1=~led1;
         UART1_Write_Text("COMANDO1");

         }
       else if (verifica(&codigo2,cuenta-1)==1)
        {
         led2=~led2;
         UART1_Write_Text("COMANDO2");

         }

          else if (verifica(&codigo3,cuenta-1)==1)
        {
         led3=~led3;
         UART1_Write_Text("COMANDO3");

         }
         memset(tiempo,66,'0'); // limpia le buffer





           Delay_ms(2000);
           
           flag_codigo=0;
           cuenta=0;
           INTEDG_bit=0; // for flanco de bajada
           INTF_bit=0; // limpia la badera de interrpcion
           INTE_bit=1; //  habilita la interrpcion for flanco




     }
     Delay_ms(80);
     LATA0_bit=~LATA0_bit;
   
   }



}