/**
  @Generated Pin Manager Header File

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.h

  @Summary:
    This is the Pin Manager file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This header file provides APIs for driver for .
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.80.0
        Device            :  PIC16LF1824
        Driver Version    :  2.11
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.10 and above
        MPLAB 	          :  MPLAB X 5.30	
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

#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

/**
  Section: Included Files
*/

#include <xc.h>

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set RA0 procedures
#define RA0_SetHigh()            do { LATAbits.LATA0 = 1; } while(0)
#define RA0_SetLow()             do { LATAbits.LATA0 = 0; } while(0)
#define RA0_Toggle()             do { LATAbits.LATA0 = ~LATAbits.LATA0; } while(0)
#define RA0_GetValue()              PORTAbits.RA0
#define RA0_SetDigitalInput()    do { TRISAbits.TRISA0 = 1; } while(0)
#define RA0_SetDigitalOutput()   do { TRISAbits.TRISA0 = 0; } while(0)
#define RA0_SetPullup()             do { WPUAbits.WPUA0 = 1; } while(0)
#define RA0_ResetPullup()           do { WPUAbits.WPUA0 = 0; } while(0)
#define RA0_SetAnalogMode()         do { ANSELAbits.ANSA0 = 1; } while(0)
#define RA0_SetDigitalMode()        do { ANSELAbits.ANSA0 = 0; } while(0)

// get/set RA1 procedures
#define RA1_SetHigh()            do { LATAbits.LATA1 = 1; } while(0)
#define RA1_SetLow()             do { LATAbits.LATA1 = 0; } while(0)
#define RA1_Toggle()             do { LATAbits.LATA1 = ~LATAbits.LATA1; } while(0)
#define RA1_GetValue()              PORTAbits.RA1
#define RA1_SetDigitalInput()    do { TRISAbits.TRISA1 = 1; } while(0)
#define RA1_SetDigitalOutput()   do { TRISAbits.TRISA1 = 0; } while(0)
#define RA1_SetPullup()             do { WPUAbits.WPUA1 = 1; } while(0)
#define RA1_ResetPullup()           do { WPUAbits.WPUA1 = 0; } while(0)
#define RA1_SetAnalogMode()         do { ANSELAbits.ANSA1 = 1; } while(0)
#define RA1_SetDigitalMode()        do { ANSELAbits.ANSA1 = 0; } while(0)

// get/set RA2 procedures
#define RA2_SetHigh()            do { LATAbits.LATA2 = 1; } while(0)
#define RA2_SetLow()             do { LATAbits.LATA2 = 0; } while(0)
#define RA2_Toggle()             do { LATAbits.LATA2 = ~LATAbits.LATA2; } while(0)
#define RA2_GetValue()              PORTAbits.RA2
#define RA2_SetDigitalInput()    do { TRISAbits.TRISA2 = 1; } while(0)
#define RA2_SetDigitalOutput()   do { TRISAbits.TRISA2 = 0; } while(0)
#define RA2_SetPullup()             do { WPUAbits.WPUA2 = 1; } while(0)
#define RA2_ResetPullup()           do { WPUAbits.WPUA2 = 0; } while(0)
#define RA2_SetAnalogMode()         do { ANSELAbits.ANSA2 = 1; } while(0)
#define RA2_SetDigitalMode()        do { ANSELAbits.ANSA2 = 0; } while(0)

// get/set led_f aliases
#define led_f_TRIS                 TRISCbits.TRISC2
#define led_f_LAT                  LATCbits.LATC2
#define led_f_PORT                 PORTCbits.RC2
#define led_f_WPU                  WPUCbits.WPUC2
#define led_f_ANS                  ANSELCbits.ANSC2
#define led_f_SetHigh()            do { LATCbits.LATC2 = 1; } while(0)
#define led_f_SetLow()             do { LATCbits.LATC2 = 0; } while(0)
#define led_f_Toggle()             do { LATCbits.LATC2 = ~LATCbits.LATC2; } while(0)
#define led_f_GetValue()           PORTCbits.RC2
#define led_f_SetDigitalInput()    do { TRISCbits.TRISC2 = 1; } while(0)
#define led_f_SetDigitalOutput()   do { TRISCbits.TRISC2 = 0; } while(0)
#define led_f_SetPullup()          do { WPUCbits.WPUC2 = 1; } while(0)
#define led_f_ResetPullup()        do { WPUCbits.WPUC2 = 0; } while(0)
#define led_f_SetAnalogMode()      do { ANSELCbits.ANSC2 = 1; } while(0)
#define led_f_SetDigitalMode()     do { ANSELCbits.ANSC2 = 0; } while(0)

// get/set led_s aliases
#define led_s_TRIS                 TRISCbits.TRISC3
#define led_s_LAT                  LATCbits.LATC3
#define led_s_PORT                 PORTCbits.RC3
#define led_s_WPU                  WPUCbits.WPUC3
#define led_s_ANS                  ANSELCbits.ANSC3
#define led_s_SetHigh()            do { LATCbits.LATC3 = 1; } while(0)
#define led_s_SetLow()             do { LATCbits.LATC3 = 0; } while(0)
#define led_s_Toggle()             do { LATCbits.LATC3 = ~LATCbits.LATC3; } while(0)
#define led_s_GetValue()           PORTCbits.RC3
#define led_s_SetDigitalInput()    do { TRISCbits.TRISC3 = 1; } while(0)
#define led_s_SetDigitalOutput()   do { TRISCbits.TRISC3 = 0; } while(0)
#define led_s_SetPullup()          do { WPUCbits.WPUC3 = 1; } while(0)
#define led_s_ResetPullup()        do { WPUCbits.WPUC3 = 0; } while(0)
#define led_s_SetAnalogMode()      do { ANSELCbits.ANSC3 = 1; } while(0)
#define led_s_SetDigitalMode()     do { ANSELCbits.ANSC3 = 0; } while(0)

// get/set led1 aliases
#define led1_TRIS                 TRISCbits.TRISC4
#define led1_LAT                  LATCbits.LATC4
#define led1_PORT                 PORTCbits.RC4
#define led1_WPU                  WPUCbits.WPUC4
#define led1_SetHigh()            do { LATCbits.LATC4 = 1; } while(0)
#define led1_SetLow()             do { LATCbits.LATC4 = 0; } while(0)
#define led1_Toggle()             do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define led1_GetValue()           PORTCbits.RC4
#define led1_SetDigitalInput()    do { TRISCbits.TRISC4 = 1; } while(0)
#define led1_SetDigitalOutput()   do { TRISCbits.TRISC4 = 0; } while(0)
#define led1_SetPullup()          do { WPUCbits.WPUC4 = 1; } while(0)
#define led1_ResetPullup()        do { WPUCbits.WPUC4 = 0; } while(0)

// get/set led2 aliases
#define led2_TRIS                 TRISCbits.TRISC5
#define led2_LAT                  LATCbits.LATC5
#define led2_PORT                 PORTCbits.RC5
#define led2_WPU                  WPUCbits.WPUC5
#define led2_SetHigh()            do { LATCbits.LATC5 = 1; } while(0)
#define led2_SetLow()             do { LATCbits.LATC5 = 0; } while(0)
#define led2_Toggle()             do { LATCbits.LATC5 = ~LATCbits.LATC5; } while(0)
#define led2_GetValue()           PORTCbits.RC5
#define led2_SetDigitalInput()    do { TRISCbits.TRISC5 = 1; } while(0)
#define led2_SetDigitalOutput()   do { TRISCbits.TRISC5 = 0; } while(0)
#define led2_SetPullup()          do { WPUCbits.WPUC5 = 1; } while(0)
#define led2_ResetPullup()        do { WPUCbits.WPUC5 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/