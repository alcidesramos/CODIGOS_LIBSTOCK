char flag_codigo=0;


unsigned int cuenta=0;  // almacenar #datos
unsigned char cont; // contador para for
char texto[10];   // usado para convertir numeros a cadena
 unsigned char timer_aux;


void Interrpcion() iv 0x0004 ics ICS_AUTO
 {
if (INTF_bit==1)
    {
       //el analasis se hace solo
       if (flag_codigo==0)
       
    {
           if (cuenta!=0)   // omite el primer dato de interrpcion
           {
           timer_aux=TMR0; //captura el valor del timer
           TMR0=0; // resetea el timer para otra lectura
          // tiempo[cuenta-1]=timer_aux;
           cuenta++;
           INTEDG_bit=!INTEDG_bit;      // cambia el flanco a detectar

                       if (TMR0IF_bit==1)  // mas 16 ms si hubo desborde del timer , fin de datos
                       {
                        flag_codigo=1;
                        INTE_bit=0; //deshabilita la interrpcuion
                      }
              }
            else    // SOLO PARA PRIEMRA ONTERRPCION
           {
            TMR0IF_bit=0;// limpia la bansera timer
            TMR0=0;   // resetea el timer
            cuenta++;
            }

        }
      }





    INTF_bit=0;









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


           UART1_Write_Text("son=");
         ByteToStr(cuenta,texto);
         UART1_Write_Text(texto);
         UART1_Write('\r');
         UART1_Write('\n');

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