/*
 * File:   pwm_2020.c
 * Author: Alcides Ramos
 *
 * Created on 31 de diciembre de 2020, 07:13 PM
 */


#include "xc.h"
#define    FCY    80000000UL // frecuencia del reloj

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "libpic30.h"

#include<uart.h>
#include "pps.h"// incluye libreria de pines remapeables
#include "Librerias\Config_Interrupcion.h"
#include "Librerias\CONFIG_PWM_B.h"

#pragma config BWRP = WRPROTECT_OFF     // Boot Segment Write Protect (Boot Segment may be written)
#pragma config BSS = NO_FLASH           // Boot Segment Program Flash Code Protection (No Boot program Flash segment)

// FGS
#pragma config GWRP = OFF               // General Code Segment Write Protect (User program memory is not write-protected)
#pragma config GSS = OFF                // General Segment Code Protection (User program memory is not code-protected)

// FOSCSEL
#pragma config FNOSC = FRCPLL           // Oscillator Mode (Internal Fast RC (FRC) w/ PLL)
#pragma config IESO = ON                // Internal External Switch Over Mode (Start-up device with FRC, then automatically switch to user-selected oscillator source when ready)

// FOSC
#pragma config POSCMD = NONE            // Primary Oscillator Source (Primary Oscillator Disabled)
#pragma config OSCIOFNC = ON            // OSC2 Pin Function (OSC2 pin has digital I/O function)
#pragma config IOL1WAY = OFF            // Peripheral Pin Select Configuration (Allow Multiple Re-configurations)
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor (Both Clock Switching and Fail-Safe Clock Monitor are disabled)

// FWDT
#pragma config WDTPOST = PS32768        // Watchdog Timer Postscaler (1:32,768)
#pragma config WDTPRE = PR128           // WDT Prescaler (1:128)
#pragma config WINDIS = OFF             // Watchdog Timer Window (Watchdog Timer in Non-Window mode)
#pragma config FWDTEN = ON              // Watchdog Timer Enable (Watchdog timer always enabled)

// FPOR
#pragma config FPWRT = PWR128           // POR Timer Value (128ms)
#pragma config ALTI2C = OFF             // Alternate I2C  pins (I2C mapped to SDA1/SCL1 pins)
#pragma config LPOL = ON                // Motor Control PWM Low Side Polarity bit (PWM module low side output pins have active-high output polarity)
#pragma config HPOL = ON                // Motor Control PWM High Side Polarity bit (PWM module high side output pins have active-high output polarity)
#pragma config PWMPIN = ON              // Motor Control PWM Module Pin Mode bit (PWM module pins controlled by PORT register at device Reset)

// FICD
#pragma config ICS = PGD1               // Comm Channel Select (Communicate on PGC1/EMUC1 and PGD1/EMUD1)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG is Disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

void Uart1_write_text_const(const char *info)
{
 while(*info)
 {
     WriteUART1(*info++);
     while (_UTXBF==1);//espera que se envíe el dato
 }
}

void Uart1_write_text( char *info)
{
 while(*info)
    {
    WriteUART1(*info++);
    while (_UTXBF==1);//espera que se envíe el dato
    }
}


// registro para configurar el puerto serial
unsigned int config1=0,config2=0;

const float ser_min=1.0; // tiempo minimo en milisegundo de movimiento del servo
const float ser_max=2.0; // tiempo minimo en milisegundo de movimiento del servo
signed char cuenta;

float salida1, salida2; //salidas pwm


float map(float x_in, float x1_, float y1_, float x2_, float y2_)
{
float pendiente;
  pendiente=(y2_ - y1_) / (x2_ - x1_);
  pendiente=pendiente*(x_in- x1_);
  pendiente=pendiente+y1_;
  return( pendiente);
}

void servo1(float angulo)
{
  angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
  OC1RS=angulo*(float)PR2/20.0;
}


void pwm1(float ancho)
{
  OC1RS=ancho*(float)PR2/100.0;
}

void servo2(float angulo)
{
  angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
  OC2RS=angulo*(float)PR2/20.0;
}


void pwm2(float ancho)
{
  OC2RS=ancho*(float)PR2/100.0;
}


void servo1_ecu(float angulo)
{
  OC1RS=3.4722*angulo + 937.5;
}

void servo2_ecu(float angulo)
{
  OC2RS=3.4722*angulo + 937.5;
}





int main(void) 
{
 //Configuración de operacion.
//CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL DE 4 MEGA

//DEJAMOS N1 Y N2  EN 2

//VELOCIDAD= 4M*M/(N1*N2)= 4M*80/4=80M
  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
    PLLFBD=41; // selecciona  M=40;  siempre lo deseado menos 2;    CRISTAL INTERNO=7.37MHz

  AD1PCFGL=0xffff;// todo digital
  //puertos como salida
 TRISB=0x0;
 TRISA=0x0;  
 LATB=0;
 // configuracion de remapeables
 
 
 PPSUnLock;// desbloquea ci¿onfiguracion de perifericos

 iPPSOutput(OUT_PIN_PPS_RP0,OUT_FN_PPS_U1TX);    // con figura rp0 como salida a u1tx
 iPPSOutput(OUT_PIN_PPS_RP2,OUT_FN_PPS_OC1);    // con figura rp1 como salida a pwm1
 iPPSOutput(OUT_PIN_PPS_RP3,OUT_FN_PPS_OC2);    // con figura rp2 como salida a pwm2

 PPSLock;// bloquea configuracion periferico
 
 // rx no se va a usar por ahora
 //ahora si configura el puerto serial
 config1= UART_EN & UART_IDLE_CON & UART_IrDA_DISABLE & UART_MODE_SIMPLEX &
          UART_UEN_00 & UART_DIS_WAKE & UART_DIS_LOOPBACK & UART_DIS_ABAUD & 
         UART_BRGH_SIXTEEN &  UART_NO_PAR_8BIT & UART_1STOPBIT;
 
 config2=  UART_INT_TX_BUF_EMPTY  & UART_TX_ENABLE & UART_INT_RX_3_4_FUL &
            UART_ADR_DETECT_DIS & UART_RX_OVERRUN_CLEAR & UART_IrDA_POL_INV_ZERO &
            UART_SYNC_BREAK_DISABLED;
 
 OpenUART1 (config1, config2, 259);// se se saca de excel consume menos recursos
  Uart1_write_text_const("INICIANDO\r\n");
     
  pwm_init_basico();

    habilita();
    
    while (1)
    {
         servo1_ecu(0);
   // servo1(-90); // angulo   1ms
    
    pwm2(10);  //porcentaje
         for (cuenta=-90;cuenta<=90;cuenta+=5)
   {
  // servo1(cuenta);
    servo1_ecu(cuenta);
   __delay_ms(50);// veloicdad paso apso
   }
    pwm2(90);  //porcentaje
   __delay_ms(500);// veloicdad paso apso
    
   
   
    
    
    }
    
    
    
    return 0;
}
