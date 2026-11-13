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
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.77
        Device            :  PIC16F1824
        Driver Version    :  2.11
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.05 and above
        MPLAB 	          :  MPLAB X 5.20	
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

// get/set eco1_ aliases
#define eco1__TRIS                 TRISAbits.TRISA1
#define eco1__LAT                  LATAbits.LATA1
#define eco1__PORT                 PORTAbits.RA1
#define eco1__WPU                  WPUAbits.WPUA1
#define eco1__ANS                  ANSELAbits.ANSA1
#define eco1__SetHigh()            do { LATAbits.LATA1 = 1; } while(0)
#define eco1__SetLow()             do { LATAbits.LATA1 = 0; } while(0)
#define eco1__Toggle()             do { LATAbits.LATA1 = ~LATAbits.LATA1; } while(0)
#define eco1__GetValue()           PORTAbits.RA1
#define eco1__SetDigitalInput()    do { TRISAbits.TRISA1 = 1; } while(0)
#define eco1__SetDigitalOutput()   do { TRISAbits.TRISA1 = 0; } while(0)
#define eco1__SetPullup()          do { WPUAbits.WPUA1 = 1; } while(0)
#define eco1__ResetPullup()        do { WPUAbits.WPUA1 = 0; } while(0)
#define eco1__SetAnalogMode()      do { ANSELAbits.ANSA1 = 1; } while(0)
#define eco1__SetDigitalMode()     do { ANSELAbits.ANSA1 = 0; } while(0)

// get/set eco2_ aliases
#define eco2__TRIS                 TRISAbits.TRISA2
#define eco2__LAT                  LATAbits.LATA2
#define eco2__PORT                 PORTAbits.RA2
#define eco2__WPU                  WPUAbits.WPUA2
#define eco2__ANS                  ANSELAbits.ANSA2
#define eco2__SetHigh()            do { LATAbits.LATA2 = 1; } while(0)
#define eco2__SetLow()             do { LATAbits.LATA2 = 0; } while(0)
#define eco2__Toggle()             do { LATAbits.LATA2 = ~LATAbits.LATA2; } while(0)
#define eco2__GetValue()           PORTAbits.RA2
#define eco2__SetDigitalInput()    do { TRISAbits.TRISA2 = 1; } while(0)
#define eco2__SetDigitalOutput()   do { TRISAbits.TRISA2 = 0; } while(0)
#define eco2__SetPullup()          do { WPUAbits.WPUA2 = 1; } while(0)
#define eco2__ResetPullup()        do { WPUAbits.WPUA2 = 0; } while(0)
#define eco2__SetAnalogMode()      do { ANSELAbits.ANSA2 = 1; } while(0)
#define eco2__SetDigitalMode()     do { ANSELAbits.ANSA2 = 0; } while(0)

// get/set eco3_ aliases
#define eco3__TRIS                 TRISAbits.TRISA3
#define eco3__PORT                 PORTAbits.RA3
#define eco3__WPU                  WPUAbits.WPUA3
#define eco3__GetValue()           PORTAbits.RA3
#define eco3__SetDigitalInput()    do { TRISAbits.TRISA3 = 1; } while(0)
#define eco3__SetDigitalOutput()   do { TRISAbits.TRISA3 = 0; } while(0)
#define eco3__SetPullup()          do { WPUAbits.WPUA3 = 1; } while(0)
#define eco3__ResetPullup()        do { WPUAbits.WPUA3 = 0; } while(0)

// get/set eco4_ aliases
#define eco4__TRIS                 TRISAbits.TRISA4
#define eco4__LAT                  LATAbits.LATA4
#define eco4__PORT                 PORTAbits.RA4
#define eco4__WPU                  WPUAbits.WPUA4
#define eco4__ANS                  ANSELAbits.ANSA4
#define eco4__SetHigh()            do { LATAbits.LATA4 = 1; } while(0)
#define eco4__SetLow()             do { LATAbits.LATA4 = 0; } while(0)
#define eco4__Toggle()             do { LATAbits.LATA4 = ~LATAbits.LATA4; } while(0)
#define eco4__GetValue()           PORTAbits.RA4
#define eco4__SetDigitalInput()    do { TRISAbits.TRISA4 = 1; } while(0)
#define eco4__SetDigitalOutput()   do { TRISAbits.TRISA4 = 0; } while(0)
#define eco4__SetPullup()          do { WPUAbits.WPUA4 = 1; } while(0)
#define eco4__ResetPullup()        do { WPUAbits.WPUA4 = 0; } while(0)
#define eco4__SetAnalogMode()      do { ANSELAbits.ANSA4 = 1; } while(0)
#define eco4__SetDigitalMode()     do { ANSELAbits.ANSA4 = 0; } while(0)

// get/set disparo aliases
#define disparo_TRIS                 TRISAbits.TRISA5
#define disparo_LAT                  LATAbits.LATA5
#define disparo_PORT                 PORTAbits.RA5
#define disparo_WPU                  WPUAbits.WPUA5
#define disparo_SetHigh()            do { LATAbits.LATA5 = 1; } while(0)
#define disparo_SetLow()             do { LATAbits.LATA5 = 0; } while(0)
#define disparo_Toggle()             do { LATAbits.LATA5 = ~LATAbits.LATA5; } while(0)
#define disparo_GetValue()           PORTAbits.RA5
#define disparo_SetDigitalInput()    do { TRISAbits.TRISA5 = 1; } while(0)
#define disparo_SetDigitalOutput()   do { TRISAbits.TRISA5 = 0; } while(0)
#define disparo_SetPullup()          do { WPUAbits.WPUA5 = 1; } while(0)
#define disparo_ResetPullup()        do { WPUAbits.WPUA5 = 0; } while(0)

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