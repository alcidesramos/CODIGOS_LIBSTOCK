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
        Device            :  PIC18F45K50
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
#include	<ctype.h>
#include	<stdlib.h>



//CONEXIONES DEL LCD

#define RS PORTBbits.RB7
#define EN PORTBbits.RB6
#define D4 PORTBbits.RB5
#define D5 PORTBbits.RB4
#define D6 PORTBbits.RB3
#define D7 PORTBbits.RB2

#include "lcd.h"


#define led  LATC0
#define led1 LATA0



unsigned char tecla;
char texto[20];
unsigned int retardo=100;
char retardo_cad[10];

enum teclado_estado {n1,n2,n3,n4,en};
char estado_teclado=n1;


 void Keypad_Init()
 {
 TRISD=0B00001111; //inica el puerto del teclado
  }

unsigned char Keypad_Key_Press(void)
{
 const unsigned char keypad_deco[17]=   
 {'7', '8', '9', '/', '4', '5', '6', '*', '1', '2', '3', '-', 13, '0', '=', '+', 0};
 
    unsigned int tec = 0, fila;
 
    
    for (fila = 0b00000001; fila < 0b00010000; fila <<= 1)
    {
        LATD =fila<<4;  //lo traslada 4  posicones para sacar por las filas
        if (PORTDbits.RD0== 1) break; tec++;
        if (PORTDbits.RD1 == 1) break; tec++;
        if (PORTDbits.RD2 == 1) break; tec++;
        if (PORTDbits.RD3 == 1) break; tec++;
    }
    PORTD = 0x00;
    return keypad_deco[tec];//retorna el codigo deseao de la tecla
}



/*
                         Main application
 */


void teclado_estado()
{
    tecla=Keypad_Key_Press();
    
    switch (estado_teclado)
    {
      case n1:

              if ( (tecla!=0)  && (isdigit(tecla)))
              {
              led1=1;
              retardo_cad[0]=tecla;
              estado_teclado=n2;
              Lcd_Set_Cursor(2,8);   
              Lcd_Write_Char(tecla);
              __delay_ms(400); // retardo antirrebote
              }
            break;
            

      case n2:
              if ((tecla!=0)  && (isdigit(tecla)))
              {
              retardo_cad[1]=tecla;
              estado_teclado=n3;
              Lcd_Set_Cursor(2,9);
              Lcd_Write_Char(tecla);
              __delay_ms(400); // retardo antirrebote
              }
            break;


      case n3:

              if ((tecla!=0)  && (isdigit(tecla)))
              {
              retardo_cad[2]=tecla;
              estado_teclado=n4;
              Lcd_Set_Cursor(2,10);
              Lcd_Write_Char(tecla);
              __delay_ms(400); // retardo antirrebote
              }
            break;


      case n4:
              if ((tecla!=0)  && (isdigit(tecla)))
              {
              retardo_cad[3]=tecla;
              estado_teclado=en;
              Lcd_Set_Cursor(2,11);
              Lcd_Write_Char(tecla);
              __delay_ms(400); // retardo antirrebote

              }
            break;

        case en:

               if ((tecla!=0)  && (tecla!='='))  // no se presiono el igual
              {
              led1=0;
              estado_teclado=n1; // vuelve al estado de  captura del primer numero
             Lcd_Set_Cursor(2,8);
               Lcd_Write_String("      ");// borra la pantalla
             __delay_ms(600); // retardo antirrebote


              }
               // si si se presiono el enter
              else if ((tecla!=0)  && (tecla=='='))  //si se presiono el igual
              {
              led1=0;
             retardo_cad[4]=0;  //final de cadena
              retardo=atoi(retardo_cad); // lo pasa a numero y calcula el retardo deseado
              estado_teclado=n1; // vuelve al estado de caprura del primer numero.
             Lcd_Set_Cursor(2,8);
             Lcd_Write_String("      ");// borra la pantalla
             __delay_ms(600); // retardo antirrebote
              }

              break;


    
    }// fin del switch


}

void miretardo(signed int valor)
{

while (valor>0)
{ 
   __delay_us(700);
     teclado_estado();
     valor--;
 }

}
void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();

    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts
    // Use the following macros to:

    // Enable high priority global interrupts
    //INTERRUPT_GlobalInterruptHighEnable();

    // Enable low priority global interrupts.
    //INTERRUPT_GlobalInterruptLowEnable();

    // Disable high priority global interrupts
    //INTERRUPT_GlobalInterruptHighDisable();

    // Disable low priority global interrupts.
    //INTERRUPT_GlobalInterruptLowDisable();

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Enable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptEnable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    
    // Todo digital.
  ANSELA=0;
  ANSELB=0;
  ANSELC=0;
  ANSELD=0;
  ANSELE=0;
  
  Keypad_Init();
  
  TRISB=0; //SALIDA PINES DEL lcd
  
      Lcd_Init();
       Lcd_Clear();
        Lcd_Set_Cursor(1,6);
        Lcd_Write_String("TECLADO");
        
   //LOS LEDS     
       TRISC0=0; //salida led
       TRISA0=0; //salida led1
              
       led=1;
       led1=0;

    while (1)
    {
        // Add your application code
        
//        tecla= Keypad_Key_Press();
//       if (tecla!=0)
//       {
//        Lcd_Set_Cursor(2,8);   
//        Lcd_Write_Char(tecla);
//        __delay_ms(400);
//    }
        
       
       led=~led;
       miretardo(retardo); 
        
}
       
}
/**
 End of File
*/