/*
 * File:   30f4013.c
 * Author: Alcides Ramos
 *
 * Created on 2 de abril de 2019, 02:14 PM
 */


// DSPIC30F4013 Configuration Bit Settings

// 'C' source line config statements

// FOSC
#pragma config FOSFPR = XT_PLL8         // Oscillator (XT w/PLL 8x)
#pragma config FCKSMEN = CSW_FSCM_OFF   // Clock Switching and Monitor (Sw Disabled, Mon Disabled)

// FWDT
#pragma config FWPSB = WDTPSB_16        // WDT Prescaler B (1:16)
#pragma config FWPSA = WDTPSA_512       // WDT Prescaler A (1:512)
#pragma config WDT = WDT_OFF            // Watchdog Timer (Disabled)

// FBORPOR
#pragma config FPWRT = PWRT_64          // POR Timer Value (64ms)
#pragma config BODENV = BORV42          // Brown Out Voltage (4.2V)
#pragma config BOREN = PBOR_ON          // PBOR Enable (Enabled)
#pragma config MCLRE = MCLR_EN          // Master Clear Enable (Enabled)

// FGS
#pragma config GWRP = GWRP_OFF          // General Code Segment Write Protect (Disabled)
#pragma config GCP = CODE_PROT_OFF      // General Segment Code Protection (Disabled)

// FICD
#pragma config ICS = ICS_PGD            // Comm Channel Select (Use PGC/EMUC and PGD/EMUD)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include "xc.h"
// las dos siguientes son necesarias para poder utilizar los delay
#define    FCY    16000000UL // frecuencia del reloj
#include "libpic30.h"

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#include "uart.h"  // libreria puerto serial

unsigned int config1,config2;


int main(void) 
{
ADPCFG=0xffff;    //todo en uno 1=digital  0=analogo
  TRISB=0; // pportb salida
  TRISFbits.TRISF3=0; //salida tx
  TRISFbits.TRISF2=1; //entrada rx
  
  
  // configuracion serial.
  config1= UART_EN & UART_IDLE_CON & UART_DIS_WAKE & UART_DIS_LOOPBACK &

            UART_RX_TX & UART_DIS_ABAUD & UART_NO_PAR_8BIT & UART_1STOPBIT;
  
  config2= UART_INT_TX & UART_TX_PIN_NORMAL & UART_TX_ENABLE &

           UART_INT_RX_CHAR & UART_ADR_DETECT_DIS & UART_RX_OVERRUN_CLEAR;
  
// inicia puereto serial 9600
  
  OpenUART1 (config1, config2, 103);// coloco baudios =9600
  
  while (1)
  {
   LATB=~LATB;
   __delay_ms(200);
  putsUART1("HOLA MUNDO\r\n");
  
  }
  

    return 0;
}
