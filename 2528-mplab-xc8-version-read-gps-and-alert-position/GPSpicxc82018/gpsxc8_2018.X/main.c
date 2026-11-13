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
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.65.2
        Device            :  PIC16F1619
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
#include "string.h"
#include	<ctype.h>
#include	<float.h>
#include	<math.h>
#include	<stdlib.h>

#define RS RC2
#define EN RC3
#define D4 RC4
#define D5 RC5
#define D6 RC6
#define D7 RC7

#include "lcd.h"


#define led RB7




float grados,minutos;
float latitud,longitud;


char c_grados[10];   // grados en cadena

//   lo que se va a capturar se toma desde PGGA  HASTA *
//estados de la recepcion de variables
enum estados_  {cap_P,cap_G,cap_G2,cap_A,esp_final} ;
//estado inicial
 char estado_rec=cap_P;

//   lo que se va a capturar se toma desde lue=   value": 0.0}
float valor_rx;  //captura valor de lavariables
char trama_rx[100];
char captura_rx[100];
char texto[10]; // variable captura de cadeda auxiliar
char contador_trama=0;
unsigned long demora=0; //usado para alir de la lectura de datos


char lee_trama()   //funcio que retorna 1 si hay dato sino 0
{
char dato_rx;
//limpa todas las variables
memset(trama_rx,100,0);
demora=0;
contador_trama=0;
estado_rec=cap_P;
//borra errores de recepcion
RCIF=0;
CREN=0; //
CREN=1; //

while (demora<=96667)
{
   demora++;
   switch (estado_rec)
   {
   case cap_P:
             if (RCIF==1) //si hay un dat recibido
             {
               dato_rx=RCREG; //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='P') contador_trama=0;    //no fue el dato que me interesa
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_G; //pasa al estado de capturar la g
               }
              RCIF=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;
             
     case cap_G:
             if (RCIF==1) //si hay un dat recibido
             {
               dato_rx=RCREG; //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='G')
               {
               contador_trama=0;
               estado_rec=cap_P; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                 estado_rec=cap_G2; //pasa al estado de capturar la g
               }
                RCIF=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;

   case cap_G2:
             if (RCIF==1) //si hay un dat recibido
             {
               dato_rx=RCREG; //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='G')
               {
               contador_trama=0;
               estado_rec=cap_P; //regresa al estado inical
               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=cap_A; //pasa al estado de capturar la a
               }
              RCIF=0; //limpia la bandera de recepcion par esperar otro dato
             }
             break;


   case cap_A:
             if (RCIF==1) //si hay un dat recibido
             {
               dato_rx=RCREG; //lee el dato
               trama_rx[contador_trama]=dato_rx;
               if (dato_rx!='A')
               {
               contador_trama=0;
               estado_rec=cap_P; //regresa al estado inical

               }
               else
               {
                  contador_trama++;//incrementa contador para proximo dato
                  estado_rec=esp_final; //pasa al estado de capturar la u
               }
               RCIF=0; //limpia la bandera de recepcion par esperar otro dato
             }

             break;

   case esp_final:
             if (RCIF==1) //si hay un dat recibido
             {
               dato_rx=RCREG; //lee el dato
               trama_rx[contador_trama]=dato_rx;
               contador_trama++;
               if (dato_rx=='*')   return(1); //sale del procedimiento
             RCIF=0; //limpia la bandera de recepcion
             }
             break;


       }//fin del switch

   }//fin del while demora
   return(0);

}




/*
                         Main application
 */
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
    
     //todo digital   
    ANSELA=0;
    ANSELB=0;
    ANSELC=0;
    
    //salida el led
    TRISB7=0;
   
    //SALIDA PINES DEL LCD 
    TRISC2=0;
   TRISC3=0;
   TRISC4=0;
   TRISC5=0;
   TRISC6=0;
    TRISC7=0;

       
       Lcd_Init();
       Lcd_Clear();
        Lcd_Set_Cursor(1,1);
        Lcd_Write_String("LAT= ");
        Lcd_Set_Cursor(2,1);
        Lcd_Write_String("LON= ");
     
        __delay_ms(5000);
    while (1)
    {
        // Add your application code
         lee_trama();
     
    //captura la latitud
   strcpy(captura_rx, strtok(trama_rx, ","));  //inicia captura de tokens desde el =
   strcpy(captura_rx, strtok(0, ","));  //captura hasta segunda coma
    strcpy(captura_rx, strtok(0, ","));  //captura hasta lo que esta tercera coma es decir, latitud
       memset(c_grados,0,10);//limpía los grados
       strncpy(c_grados,captura_rx,2);//captura los grados
        grados=atof(c_grados);      // pasa de alfanumerico o cadena a flotante

          // apunta a los minutos
         minutos=atof(&captura_rx[2])/60.0;  //lo pasa a grados
           latitud=grados+minutos;
           
       strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
       if (captura_rx[0]=='S') latitud=-latitud;
//ACONDICIONA PARA EL LCD
            sprintf(texto,"%f",latitud);
            //BORRA  ESPACIA A ESCRIBIR
     
         Lcd_Set_Cursor(1,6);
        Lcd_Write_String("            ");
        Lcd_Set_Cursor(1,6);
        Lcd_Write_String(texto);
            
       
       
       
  //  captura la longitud
       strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma la longitud
     memset(c_grados,0,10);//limpía los grados
       strncpy(c_grados,captura_rx,3);//captura los grados  3 posiciones
          grados=atof(c_grados);
    // apunta a los minutos
         minutos=atof(&captura_rx[3])/60.0;  //lo pasa a grados
           longitud=grados+minutos;
       strcpy(captura_rx, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
       if (captura_rx[0]=='W') longitud=-longitud;
            sprintf(texto,"%f",longitud);
        
            
          Lcd_Set_Cursor(2,6);
        Lcd_Write_String("            ");
        Lcd_Set_Cursor(2,6);
        Lcd_Write_String(texto);
        
            
            
            //si esta en bocagrande
if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.5531294 ))  led=1; else led=0;
       
       
       
       __delay_ms(500);
        
        
    }
}
/**
 End of File
*/