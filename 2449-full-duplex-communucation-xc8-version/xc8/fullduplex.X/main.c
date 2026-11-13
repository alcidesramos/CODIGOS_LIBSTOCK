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
        Device            :  PIC18F25K20
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
//para poder usar atoi
#include	<ctype.h>
#include	<stdlib.h>
// para poder usar funciones de cadena
#include <string.h> 


/*
                         Main application
 */

//pines de direccion del motor
#define m11 LATB0
#define m12 LATB1

#define led1 LATC5
#define led2 LATC4
#define led3 LATC3


#define suiche RB7


//PIn de pwm
//#define pwm 11

//variables para capturar la trama
char trama[30];
char procesa[30];
unsigned int dato;

//variables nuevas
 char datorx;
 char puntero=0;
 char flag_rx=0;


//variables para leer analogo
unsigned int codigo;
float temperatura;

char texto[20];// trama para pasar de numero a cadena



//funcion para que gira a la derecha
void m1derecha()
{
 m11=1;
 m12=0;
}

void m1izquierda()
{
  m11=0;
 m12=1;
 }

void m1quieto()
{
m11=0;
 m12=0;
}


void procesarx()
{
if (strstr(trama,"led1="))
     {
     if (strstr(trama,"on")) led1=1;
    else led1=0;
    }

    else if (strstr(trama,"led2="))
     {
     if (strstr(trama,"on")) led2=1;
    else led2=0;
    }

 else if (strstr(trama,"m1der"))  m1derecha();

  else if (strstr(trama,"m1izq"))  m1izquierda();

  else if (strstr(trama,"m1stop"))  m1quieto();

  else if (strstr(trama,"m1pwm="))
    {
        strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);
      //escala la salida de 0 a 100% de pem   
        dato=dato*623/100;
        
       // PWM1_Set_Duty(dato);// aplica la velocidad al pwm
         EPWM1_LoadDutyValue(dato);

    }


}


void interrupt INTERRUPT_InterruptManager (void)
{
 if (RCIF==1)
    {
      datorx=EUSART_Read();  //lee el dato
      trama[puntero]=datorx; //lo almacena en la trama
       puntero++; //incrementa el contador de trama
       if (puntero>=30) puntero=0; //si llegan mas de 50 datos erroneos inica el almacenamiento
       if (datorx=='*')  //Si llega el fin de la trama
       {
         RCIE=0; //deshabilita la interrucion
         flag_rx=1;  //activa la bandera de que hat una trama valida

       }
    RCIF=0;

   }


    
}



void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();

    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts
    // Use the following macros to:

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Enable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptEnable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    
    
    //motor arranca apagado
 m1quieto();
 led1=0;
 led2=0;
 
  INTCON=0b01000000;//habilita interrpciones de perifericos
  RCIF=0; //limpia bandesta interrpcion serial
  RCIE=1; // habilite la interrpcion serial
  
  GIE=1; //autoriza todas las interrepciones programadas
  
  EUSART_Write('A');
  printf("INICIANDO\r");
    while (1)
    {
        // Add your application code
        
                if (flag_rx==1)
               {

               procesarx();  // llama al procedimiento de procesar la trama
               puntero=0; //inicializa el conteo
              memset(trama,0,30); //limpia la trama
               flag_rx=0;
               RCIF=0;    //limpia la bandera de la interrpcion
               RCIE=1;   //habilita la Interrpcion serial
               }
                codigo =ADC_GetConversion(0);
                
                temperatura=codigo*500.0/1023.0;// calcula la temperatura
               
          sprintf(texto,"temp=%.2f/",temperatura);
        printf(texto);
    
       if (suiche==1) printf("led=on/");
       else printf("led=off/");
    

       led3=~led3;
       __delay_ms(50);
        
        
    }
}
/**
 End of File
*/