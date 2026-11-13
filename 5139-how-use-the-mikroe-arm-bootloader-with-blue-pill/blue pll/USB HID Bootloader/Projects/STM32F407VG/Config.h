/******************************************************************************
 *                                                                            *
 *  Unit:         Config.h                                                    *
 *                                                                            *
 *  Copyright:    (c) Mikroelektronika, 2011.                                 *
 *                                                                            *
 *  Description:  Config.c declarations and some more.                        *
 *                                                                            *
 *  Requirements: ARM specific.                                               *
 *                                                                            *
 *  Migration:    Along with Config.c, this is the only file in this          *
 *                project that might need to be adjusted when migrating.      *
 *                Switching to another MCU within ARM family                  *
 *                of microcontrollers, may require at most two defines        *
 *                to be changed:                                              *
 *                  1. FLASH_Write                                            *
 *                  2. FLASH_Erase                                            *
 *                If these are already set properly, we are all done :)       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
#ifndef __CONFIG
#define __CONFIG

#include <Types.h>

//#define STM32F1XX
//#define STM32F2XX
#define STM32F4XX
//#define STM32L1XX

extern const enum TMcuType MCU_TYPE;

extern const unsigned long BOOTLOADER_SIZE;   // Bootloader size.
extern const unsigned long BOOTLOADER_START;  // Bootloader start address.
extern const unsigned char RESET_VECTOR_SIZE; // MCU reset vector size.

extern const TBootInfo BootInfo;              // Bootloader info record,
                                              // containing device specific information.

extern unsigned char HidReadBuff[64];         // USB HID read buffer.
extern unsigned char HidWriteBuff[64];        // USB HID write buffer.

// STM32 devices from 2xx and 4xx families have specific (sectored) flash organization.
// Use this define to instruct UHB driver how to handle it.
#ifdef STM32F2XX
  #define STM32F_2XX_4XX
#endif

#ifdef STM32F4XX
  #define STM32F_2XX_4XX
#endif


#ifdef STM32F_2XX_4XX
  #define FLASH_WORD_MODE                 // flash write one program word (4 bytes),
                                          // 2.7V to 3.6V voltage range assumed
  //#define FLASH_HALFWORD_MODE           // flash write half word (2 bytes),
                                          // 2.1V to 2.7V voltage range assumed
  //#define FLASH_BYTE_MODE               // flash write one byte (1 byte),
                                          // 1.8V to 2.1V voltage range assumed

  // Flash write and erase block sizes are MCU dependent.
  // To reduce confusion and errors, these routines might not have
  // uniform names between different MCUs/architectures.
  // Consult library manager for target MCU's flash handling routine names.
  // and adjust defines below.

  #ifdef FLASH_WORD_MODE
    #define _FLASH_WRITE_LATCH 4
    #define FLASH_Write(addr, buff) FLASH_Write_Word(addr, *(long *)buff)
  #endif

  #ifdef FLASH_HALFWORD_MODE
    #define _FLASH_WRITE_LATCH 2
    #define FLASH_Write(addr, buff) FLASH_Write_HalfWord(addr, *(unsigned int *)buff)
  #endif

  #ifdef FLASH_BYTE_MODE
    #define _FLASH_WRITE_LATCH 1
    #define FLASH_Write(addr, buff) FLASH_Write_Byte(addr, *(char *)buff)
  #endif


  #define FLASH_Erase(addr)  FLASH_EraseSector(FLASH_AddressToSector(addr))
  #define _FLASH_ERASE 16*1024                  // smallest erase block size (16kB),
                                                // also a ram buffer size designator
                                                // (maximum number of bytes that can be received
                                                //  before write operation is initiated)
#else
  // Flash write and erase block sizes are MCU dependent.
  // To reduce confusion and errors, these routines might not have
  // uniform names between different MCUs/architectures.
  // Consult library manager for target MCU's flash handling routine names.
  // and adjust defines below.
  #define FLASH_Write(addr, buff) FLASH_Write_Word(addr, *(long *)buff)
  #define FLASH_Erase(addr)       FLASH_ErasePage(addr)
#endif

void Config();                                // multi purpose configuration routine
#endif