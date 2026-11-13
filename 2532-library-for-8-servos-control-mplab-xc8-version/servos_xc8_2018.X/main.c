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
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs  - 1.45
        Device            :  PIC16F1619
        Driver Version    :  2.00
    The generated drivers are tested against the following:
        Compiler          :  XC8 1.35
        MPLAB             :  MPLAB X 3.40
*/

/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

#include "mcc_generated_files/mcc.h"



//PINES DE LOS SERVOS
#define  servo1 LATC0
#define  servo2 LATC1
#define  servo3 LATC2
#define  servo4 LATC3
#define  servo5 LATC4
#define  servo6 LATC5
#define  servo7 LATB4
#define  servo8 LATB5

#define servo1_direction TRISC0
#define servo2_direction TRISC1
#define servo3_direction TRISC2
#define servo4_direction TRISC3
#define servo5_direction TRISC4
#define servo6_direction TRISC5
#define servo7_direction TRISB4
#define servo8_direction TRISB5

#include "Servos_T1.h"

signed int angulo;



/*
                         Main application
 */


void interrupt   interrupcion  (void)        // interrupt function 
 
{
    servos_interrupcion();



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
    
    init_servos(0.5,2.5);// INICIA SERVOS EN LOS RANGOS MINIMO Y MAXIMO E MS    
  
    GIE=1; //HABILITA INTERRUPCIONES GLOBALES
    

    while (1)
    {
        // Add your application code
        
        servo_valor(1,0);
           servo_valor(4,45);
           servo_valor(5,-45);
           servo_valor(6,90);
           servo_valor(7,-90);
           servo_valor(8,20);
           
           
             for (angulo=-90;angulo<=90;angulo=angulo+10)
      {
      servo_valor(2,angulo);
      __delay_ms(200);

      }
      
      

      for (angulo=90;angulo>=-90;angulo=angulo-10)
      {
      servo_valor(3,angulo);
      __delay_ms(200);

      }
           
        
        
    }
}
/**
 End of File
*/