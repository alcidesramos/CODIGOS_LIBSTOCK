/*
 * File:   prueba.c
 * Author: Alcides Ramos
 *
 * Created on July 18, 2019, 11:50 AM
 */


#include <xc.h>

// PIC12F629 Configuration Bit Settings

// 'C' source line config statements

// CONFIG
#pragma config FOSC = HS        // Oscillator Selection bits (XT oscillator: Crystal/resonator on GP4/OSC2/CLKOUT and GP5/OSC1/CLKIN)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = ON       // Power-Up Timer Enable bit (PWRT enabled)
#pragma config MCLRE = OFF      // GP3/MCLR pin function select (GP3/MCLR pin function is digital I/O, MCLR internally tied to VDD)
#pragma config BOREN = ON       // Brown-out Detect Enable bit (BOD enabled)
#pragma config CP = OFF         // Code Protection bit (Program Memory code protection is disabled)
#pragma config CPD = OFF        // Data Code Protection bit (Data memory code protection is disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.


#define  _XTAL_FREQ 20000000
#define  cristal  20///obtiene el reloj en mega



// velocidad de comunicación
#define BAUDIOS 19200  // define la Velocidad deseada la Comunicación



 //Define pines de conexion del puerto serial tx y rx

#define  SoftWare_Uart_Tx GPIObits.GP0
#define  SoftWare_Uart_Rx GPIObits.GP1
#define  SoftWare_Uart_Tx_Direction  TRISIObits.TRISIO0
#define  SoftWare_Uart_Rx_Direction TRISIObits.TRISIO1


#include "Software_Uart.h"



//PARA PODER USAR LIBRERIA ITOA
#include	<stdlib.h>
#include	<stdio.h>


char contador=0;
 unsigned char dato;
 char texto[10];


void main(void)

{
    CMCON = 7;
 SoftWareUart_Init();
   //  dato=Software_UART_Read(); //lee un Dato
  Software_UART_Write('a');
 Software_UART_Write_Text_Const("INICANDO\n\r");

 while (1)
 {
          Software_UART_Read_Text(texto,'*',10); //lee una cadeda hasta que llegue el  asterisco
       Software_UART_Write_Text(texto);     //reenvia lo que recibido
       Software_UART_Write_Text("\r\n\r\n") ;
        


       dato=Software_UART_Read(); //lee un Dato
       Software_UART_Write_Text("Mandaste=");
       Software_UART_Write(dato); //  lo reenvia

       Software_UART_Write_Text_Const("\r\n\r\n") ;

     
      Software_UART_Write_Text("Contador=");
    itoa(texto,contador,10);
      // wordtostr(contador,texto);
      Software_UART_Write_Text(texto);
     
       Software_UART_Write_Text_Const("\r\n\r\n") ;
        contador++;
       __delay_ms(20);
    
 
 }



    return;
}
