/*
 * File:   33ep512mu810.c
 * Author: Alcides Ramos
 *
 * Created on 2 de abril de 2019, 03:05 PM
 */

// DSPIC33EP512MU810 Configuration Bit Settings

// 'C' source line config statements

// FGS
#pragma config GWRP = OFF               // General Segment Write-Protect bit (General Segment may be written)
#pragma config GSS = OFF                // General Segment Code-Protect bit (General Segment Code protect is disabled)
#pragma config GSSK = OFF               // General Segment Key bits (General Segment Write Protection and Code Protection is Disabled)

// FOSCSEL
#pragma config FNOSC = PRIPLL           // Initial Oscillator Source Selection Bits (Primary Oscillator (XT, HS, EC) with PLL)
#pragma config IESO = OFF               // Two-speed Oscillator Start-up Enable bit (Start up with user-selected oscillator source)

// FOSC
#pragma config POSCMD = XT              // Primary Oscillator Mode Select bits (XT Crystal Oscillator Mode)
#pragma config OSCIOFNC = OFF           // OSC2 Pin Function bit (OSC2 is clock output)
#pragma config IOL1WAY = OFF            // Peripheral pin select configuration (Allow multiple reconfigurations)
#pragma config FCKSM = CSDCMD           // Clock Switching Mode bits (Both Clock switching and Fail-safe Clock Monitor are disabled)

// FWDT
#pragma config WDTPOST = PS32768        // Watchdog Timer Postscaler Bits (1:32,768)
#pragma config WDTPRE = PR128           // Watchdog Timer Prescaler bit (1:128)
#pragma config PLLKEN = ON              // PLL Lock Wait Enable bit (Clock switch to PLL source will wait until the PLL lock signal is valid.)
#pragma config WINDIS = OFF             // Watchdog Timer Window Enable bit (Watchdog Timer in Non-Window mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable bit (Watchdog timer enabled/disabled by user software)

// FPOR
#pragma config FPWRT = PWR128           // Power-on Reset Timer Value Select bits (128ms)
#pragma config BOREN = ON               // Brown-out Reset (BOR) Detection Enable bit (BOR is enabled)
#pragma config ALTI2C1 = OFF            // Alternate I2C pins for I2C1 (SDA1/SCK1 pins are selected as the I/O pins for I2C1)
#pragma config ALTI2C2 = OFF            // Alternate I2C pins for I2C2 (SDA2/SCK2 pins are selected as the I/O pins for I2C2)

// FICD
#pragma config ICS = PGD1               // ICD Communication Channel Select bits (Communicate on PGEC1 and PGED1)
#pragma config RSTPRI = PF              // Reset Target Vector Select bit (Device will obtain reset instruction from Primary flash)
#pragma config JTAGEN = OFF             // JTAG Enable bit (JTAG is disabled)

// FAS
#pragma config AWRP = OFF               // Auxiliary Segment Write-protect bit (Auxiliary program memory is not write-protected)
#pragma config APL = OFF                // Auxiliary Segment Code-protect bit (Aux Flash Code protect is disabled)
#pragma config APLK = OFF               // Auxiliary Segment Key bits (Aux Flash Write Protection and Code Protection is Disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include "xc.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>


#include "xc.h"
// las dos siguientes son necesarias para poder utilizar los delay
#define    FCY    70000000UL // frecuencia del reloj
#include "libpic30.h"



#include<uart.h>
#include "pps.h"// incluye libreria de pines remapeables

// registro para configurar el puerto serial
unsigned int config1=0,config2=0;


int main(void) 

{
  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
  PLLFBD=68; // selecciona  M=68;  siempre lo deseado menos 2;  CRISTAL EXTERNO     8Mhz

  //  Todo Digital
  ANSELA = 0x00;
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;
  TRISB=0; //TODO SALIDA
  
  // configuracion de remapeables
 PPSUnLock;// desbloquea ci¿onfiguracion de perifericos
 iPPSOutput(OUT_PIN_PPS_RP101,OUT_FN_PPS_U1TX);    // con figura rp14 como salida a u1tx
 
 //PPSOutput(OUT_FN_PPS_U1TX,OUT_PIN_PPS_RP101);    // con figura rp14 como salida a u1tx
 
 PPSLock;// bloquea configuracion periferico
 
  
 // rx no se va a usar por ahora
 //ahora si configura el puerto serial
 config1= (UART_EN & UART_IDLE_CON & UART_IrDA_DISABLE & UART_MODE_SIMPLEX &

          UART_UEN_00 & UART_DIS_WAKE & UART_DIS_LOOPBACK & UART_DIS_ABAUD &

          UART_BRGH_SIXTEEN & UART_NO_PAR_8BIT & UART_1STOPBIT);
 
 
 config2= (UART_INT_TX  & UART_TX_ENABLE &
          UART_INT_RX_CHAR & UART_ADR_DETECT_DIS & UART_RX_OVERRUN_CLEAR &
         UART_IrDA_POL_INV_ZERO & UART_SYNC_BREAK_DISABLED);
         
   OpenUART1 (config1, config2, 455);// se se saca de excel consume menos recursos
 
  while (1)
  {
  LATB=~LATB;
 
          __delay_ms(200);
        //manda la indo por el puerto serial
         putsUART1("HOLA MUNDO\r\n");
  
  } 



    return 0;
}
