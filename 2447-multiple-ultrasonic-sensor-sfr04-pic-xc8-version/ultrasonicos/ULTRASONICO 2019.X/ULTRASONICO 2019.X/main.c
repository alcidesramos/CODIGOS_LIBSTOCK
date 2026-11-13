


/**
  Generated Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This is the main file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  Description:
    This header file provides implementations for driver APIs for all modules selected in the GUI.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.77
        Device            :  PIC12F1822
        Driver Version    :  2.00
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/




#include "mcc_generated_files/mcc.h"

const unsigned char cristal=32;//obtiene el reloj en mega  usado en el projecto
#define  Frec_real (cristal/4.0)        //Frecuencia de trabajo real



#define disparo1   LATA5
#define eco1  1
#define eco2  2
#define eco3  3
#define eco4  4



char texto[17];// para almacenar la cadena


unsigned int contador=0;//valor del timer
float distancia;


//funcion para leer un bit de un registro
char LEEBIT (char *port, char bit1)
{

    if ((*port & (1 << bit1))>0) return (1);
    else return (0);
}


float lee_distancia(char puerto,char pin)  //lee en el pin especificado
{
  float calculo;

  
 //pulso de disparo de 10us
  disparo1=1;
  __delay_us(10);
  disparo_SetLow();
  
  
  
  //limpia el contador
  TMR1ON=0; //TIMER QUIETO
  TMR1L=0;// limpia parte baja
  TMR1H=0; //limpia parte alta
  TMR1IF=0; //limpia la bandera de desboradmiento
  TMR1ON=1; //Arranca el timer

       while (LEEBIT(puerto,pin)==0)

       {
        if (  TMR1IF==1)  //si no hay objeto se va a desbordar el timer
            {
            return (-1);// si no hay sensor conectado retorna -1
            break;
            }
       }

  TMR1ON=0; //TIMER QUIETO
  TMR1L=0;// limpia parte baja
  TMR1H=0; //limpia parte alta
  TMR1IF=0; //limpia la bandera de desboradmiento
  TMR1ON=1; //Arranca el timer

              while (LEEBIT(puerto,pin)==1)
       {
            if (  TMR1IF==1)  //si no hay objeto se va a desbordar el timer
            {
            return (0);// si no hay eco
            break;
            }
       }
   
  TMR1ON=0; //paro timer
   contador=(TMR1H <<8) |  TMR1L;   // arma el valor del timer rotando 8 la parte alta y sumando la baja

calculo=(float)contador*0.0343*4.0/(2.0*Frec_real) ; //en cencimetro  //preescaldor =4
   return (calculo);



}


//funcion para decimales
void floattostr_(float x, unsigned char *str,char precision)
{
/* converts a floating point number to an ascii string */
/* x is stored into str, which should be at least 30 chars long */
int ie, i, k, ndig;
double y;
ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
ie = 0;
/* if x negative, write minus and reverse */
if ( x < 0)
  {
  *str++ = '-';
  x = -x;
  }
/* put x in range 1 <= x < 10 */
if (x > 0.0) while (x < 1.0)
  {
  x *= 10.0;                // a la place de =*
  ie--;
  }
while (x >= 10.0)
  {
  x = x/10.0;
  ie++;
 }
 ndig += ie;           // a la place de =+
//round. x is between 1 and 10 and ndig will be printed to
// right of decimal point so rounding is ...
for (y = i = 1; i < ndig; i++)
  y = y/10.;
x += y/2.;
if (x >= 10.0) {x = 1.0; ie++;}
if (ie<0)
  {
   *str++ = '0'; *str++ = '.';
   if (ndig < 0) ie = ie-ndig;
   for (i = -1; i > ie; i--)  *str++ = '0';
  }
for (i=0; i < ndig; i++)
  {
  k = x;
  *str++ = k + '0';
  if (i ==  ie ) *str++ = '.';
  x -= (y=k);
  x *= 10.0;
  }
*str = '\0';
}


//funcion serial propia optimizada
void manda_serial(char *info)
{
    while (*info)  EUSART_Write(*info++);

}


void main(void)
{
    // initialize the device
    SYSTEM_Initialize();

    // When using interrupts, you need to set the Global and Peripheral Interrupt Enable bits
    // Use the following macros to:

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    disparo1=0;

    while (1)
    {
   
      // Add your application code
          distancia=lee_distancia(&PORTA,eco1);
  floattostr_(distancia ,texto,2); // 2 decimales
   manda_serial("Dis1=");
  manda_serial(texto);
   EUSART_Write('\r'); // enter y final de linea
   __delay_ms(50);
   
   
   
           distancia=lee_distancia(&PORTA,eco2);
  floattostr_(distancia ,texto,2); // 2 decimales
   manda_serial("Dis2=");
  manda_serial(texto);
   EUSART_Write('\r'); // enter y final de linea
   __delay_ms(50);
   

   distancia=lee_distancia(&PORTA,eco3);
  floattostr_(distancia ,texto,2); // 2 decimales
   manda_serial("Dis3=");
  manda_serial(texto);
   EUSART_Write('\r'); // enter y final de linea
   __delay_ms(50);
   
   
      distancia=lee_distancia(&PORTA,eco4);
  floattostr_(distancia ,texto,2); // 2 decimales
   manda_serial("Dis4=");
  manda_serial(texto);
   EUSART_Write('\r'); // enter y final de linea
   EUSART_Write('\r'); // enter y final de linea
   __delay_ms(50);
     
   

   
   
   __delay_ms(500);
        
   
       
    }
}
/**
 End of File
*/