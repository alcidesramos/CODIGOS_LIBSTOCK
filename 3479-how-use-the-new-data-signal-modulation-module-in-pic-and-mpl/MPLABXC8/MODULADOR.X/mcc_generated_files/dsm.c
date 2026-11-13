/**
  DSM Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    dsm.c

  @Summary
    This is the generated driver implementation file for the DSM driver using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This source file provides APIs for DSM.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.80.0
        Device            :  PIC16F1824
        Driver Version    :  2.01
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

/**
  Section: Included Files
*/

#include <xc.h>
#include "dsm.h"

/**
  Section: DSM APIs
*/

void DSM_Initialize(void)
{
    // set the DSM to the options selected in the User Interface
    
    // Modulator Pin Output is enabled
    MDCONbits.MDOE = 1; 

    // Modulator Output Pin Slew Rate is enabled
    MDCONbits.MDSLR = 1; 

    // Modulator Output Pin Polarity is not inverted
    MDCONbits.MDOPOL = 0; 

    // MDMSODIS enabled; MDMS EUSART Tx; 
    MDSRC = 0x0A;

    // MDCHSYNC enabled; MDCH CCP1; MDCHODIS enabled; MDCHPOL not inverted; 
    MDCARH = 0x24;

    // MDCLPOL not inverted; MDCL CCP4; MDCLODIS enabled; MDCLSYNC enabled; 
    MDCARL = 0x27;

    // Enable the Modulator
    MDCONbits.MDEN = 1;  

}

void DSM_ManualModulationSet (void)
{
    // Set MDBIT to High, Modulator uses high carrier source
    MDCONbits.MDBIT = 1;
}

void DSM_ManualModulationClear (void)
{
    // Set MDBIT to Low, Modulator uses low carrier source
    MDCONbits.MDBIT = 0;
}

void DSM_ManualModulationToggle (void)
{
    // Toggle the MDBIT
    MDCONbits.MDBIT ^= 1;
}

void DSM_ModulationStart (void)
{
    // Enables module and begins modulation
    MDCONbits.MDEN = 1;
}

void DSM_ModulationStop (void)
{
    // Disables module and stops modulation
    MDCONbits.MDEN = 0;
}

void DSM_ModulatorOutputEnable (void)
{
    MDCONbits.MDOE = 1;
}

void DSM_ModulatorOutputDisable (void)
{
    MDCONbits.MDOE = 0;
}
/**
 End of File
*/