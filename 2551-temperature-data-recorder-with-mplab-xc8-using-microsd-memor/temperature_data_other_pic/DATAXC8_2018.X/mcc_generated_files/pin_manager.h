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
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.65.2
        Device            :  PIC18F25K50
        Driver Version    :  2.01
    The generated drivers are tested against the following:
        Compiler          :  XC8 1.45
        MPLAB 	          :  MPLAB X 4.15	
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

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set SDI1 aliases
#define SDI1_TRIS                 TRISBbits.TRISB0
#define SDI1_LAT                  LATBbits.LATB0
#define SDI1_PORT                 PORTBbits.RB0
#define SDI1_WPU                  WPUBbits.WPUB0
#define SDI1_ANS                  ANSELBbits.ANSB0
#define SDI1_SetHigh()            do { LATBbits.LATB0 = 1; } while(0)
#define SDI1_SetLow()             do { LATBbits.LATB0 = 0; } while(0)
#define SDI1_Toggle()             do { LATBbits.LATB0 = ~LATBbits.LATB0; } while(0)
#define SDI1_GetValue()           PORTBbits.RB0
#define SDI1_SetDigitalInput()    do { TRISBbits.TRISB0 = 1; } while(0)
#define SDI1_SetDigitalOutput()   do { TRISBbits.TRISB0 = 0; } while(0)
#define SDI1_SetPullup()          do { WPUBbits.WPUB0 = 1; } while(0)
#define SDI1_ResetPullup()        do { WPUBbits.WPUB0 = 0; } while(0)
#define SDI1_SetAnalogMode()      do { ANSELBbits.ANSB0 = 1; } while(0)
#define SDI1_SetDigitalMode()     do { ANSELBbits.ANSB0 = 0; } while(0)

// get/set SCK1 aliases
#define SCK1_TRIS                 TRISBbits.TRISB1
#define SCK1_LAT                  LATBbits.LATB1
#define SCK1_PORT                 PORTBbits.RB1
#define SCK1_WPU                  WPUBbits.WPUB1
#define SCK1_ANS                  ANSELBbits.ANSB1
#define SCK1_SetHigh()            do { LATBbits.LATB1 = 1; } while(0)
#define SCK1_SetLow()             do { LATBbits.LATB1 = 0; } while(0)
#define SCK1_Toggle()             do { LATBbits.LATB1 = ~LATBbits.LATB1; } while(0)
#define SCK1_GetValue()           PORTBbits.RB1
#define SCK1_SetDigitalInput()    do { TRISBbits.TRISB1 = 1; } while(0)
#define SCK1_SetDigitalOutput()   do { TRISBbits.TRISB1 = 0; } while(0)
#define SCK1_SetPullup()          do { WPUBbits.WPUB1 = 1; } while(0)
#define SCK1_ResetPullup()        do { WPUBbits.WPUB1 = 0; } while(0)
#define SCK1_SetAnalogMode()      do { ANSELBbits.ANSB1 = 1; } while(0)
#define SCK1_SetDigitalMode()     do { ANSELBbits.ANSB1 = 0; } while(0)

// get/set SDO1 aliases
#define SDO1_TRIS                 TRISBbits.TRISB3
#define SDO1_LAT                  LATBbits.LATB3
#define SDO1_PORT                 PORTBbits.RB3
#define SDO1_WPU                  WPUBbits.WPUB3
#define SDO1_ANS                  ANSELBbits.ANSB3
#define SDO1_SetHigh()            do { LATBbits.LATB3 = 1; } while(0)
#define SDO1_SetLow()             do { LATBbits.LATB3 = 0; } while(0)
#define SDO1_Toggle()             do { LATBbits.LATB3 = ~LATBbits.LATB3; } while(0)
#define SDO1_GetValue()           PORTBbits.RB3
#define SDO1_SetDigitalInput()    do { TRISBbits.TRISB3 = 1; } while(0)
#define SDO1_SetDigitalOutput()   do { TRISBbits.TRISB3 = 0; } while(0)
#define SDO1_SetPullup()          do { WPUBbits.WPUB3 = 1; } while(0)
#define SDO1_ResetPullup()        do { WPUBbits.WPUB3 = 0; } while(0)
#define SDO1_SetAnalogMode()      do { ANSELBbits.ANSB3 = 1; } while(0)
#define SDO1_SetDigitalMode()     do { ANSELBbits.ANSB3 = 0; } while(0)

// get/set SD_CS aliases
#define SD_CS_TRIS                 TRISBbits.TRISB4
#define SD_CS_LAT                  LATBbits.LATB4
#define SD_CS_PORT                 PORTBbits.RB4
#define SD_CS_WPU                  WPUBbits.WPUB4
#define SD_CS_ANS                  ANSELBbits.ANSB4
#define SD_CS_SetHigh()            do { LATBbits.LATB4 = 1; } while(0)
#define SD_CS_SetLow()             do { LATBbits.LATB4 = 0; } while(0)
#define SD_CS_Toggle()             do { LATBbits.LATB4 = ~LATBbits.LATB4; } while(0)
#define SD_CS_GetValue()           PORTBbits.RB4
#define SD_CS_SetDigitalInput()    do { TRISBbits.TRISB4 = 1; } while(0)
#define SD_CS_SetDigitalOutput()   do { TRISBbits.TRISB4 = 0; } while(0)
#define SD_CS_SetPullup()          do { WPUBbits.WPUB4 = 1; } while(0)
#define SD_CS_ResetPullup()        do { WPUBbits.WPUB4 = 0; } while(0)
#define SD_CS_SetAnalogMode()      do { ANSELBbits.ANSB4 = 1; } while(0)
#define SD_CS_SetDigitalMode()     do { ANSELBbits.ANSB4 = 0; } while(0)

// get/set rb7_s aliases
#define rb7_s_TRIS                 TRISBbits.TRISB7
#define rb7_s_LAT                  LATBbits.LATB7
#define rb7_s_PORT                 PORTBbits.RB7
#define rb7_s_WPU                  WPUBbits.WPUB7
#define rb7_s_SetHigh()            do { LATBbits.LATB7 = 1; } while(0)
#define rb7_s_SetLow()             do { LATBbits.LATB7 = 0; } while(0)
#define rb7_s_Toggle()             do { LATBbits.LATB7 = ~LATBbits.LATB7; } while(0)
#define rb7_s_GetValue()           PORTBbits.RB7
#define rb7_s_SetDigitalInput()    do { TRISBbits.TRISB7 = 1; } while(0)
#define rb7_s_SetDigitalOutput()   do { TRISBbits.TRISB7 = 0; } while(0)
#define rb7_s_SetPullup()          do { WPUBbits.WPUB7 = 1; } while(0)
#define rb7_s_ResetPullup()        do { WPUBbits.WPUB7 = 0; } while(0)

// get/set RC6 procedures
#define RC6_SetHigh()               do { LATCbits.LATC6 = 1; } while(0)
#define RC6_SetLow()                do { LATCbits.LATC6 = 0; } while(0)
#define RC6_Toggle()                do { LATCbits.LATC6 = ~LATCbits.LATC6; } while(0)
#define RC6_GetValue()              PORTCbits.RC6
#define RC6_SetDigitalInput()       do { TRISCbits.TRISC6 = 1; } while(0)
#define RC6_SetDigitalOutput()      do { TRISCbits.TRISC6 = 0; } while(0)
#define RC6_SetAnalogMode()         do { ANSELCbits.ANSC6 = 1; } while(0)
#define RC6_SetDigitalMode()        do { ANSELCbits.ANSC6 = 0; } while(0)

// get/set RC7 procedures
#define RC7_SetHigh()               do { LATCbits.LATC7 = 1; } while(0)
#define RC7_SetLow()                do { LATCbits.LATC7 = 0; } while(0)
#define RC7_Toggle()                do { LATCbits.LATC7 = ~LATCbits.LATC7; } while(0)
#define RC7_GetValue()              PORTCbits.RC7
#define RC7_SetDigitalInput()       do { TRISCbits.TRISC7 = 1; } while(0)
#define RC7_SetDigitalOutput()      do { TRISCbits.TRISC7 = 0; } while(0)
#define RC7_SetAnalogMode()         do { ANSELCbits.ANSC7 = 1; } while(0)
#define RC7_SetDigitalMode()        do { ANSELCbits.ANSC7 = 0; } while(0)

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