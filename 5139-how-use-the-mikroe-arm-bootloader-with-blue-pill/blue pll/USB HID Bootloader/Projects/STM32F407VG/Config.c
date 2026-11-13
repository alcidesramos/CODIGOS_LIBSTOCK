/******************************************************************************
 *                                                                            *
 *  Unit:         Config.c                                                    *
 *                                                                            *
 *  Copyright:    (c) Mikroelektronika, 2011.                                 *
 *                                                                            *
 *  Description:  Bootloader configuration constants, memory allocation       *
 *                directives and MCU configuration.                           *
 *                Double click to open flash memory layout pdf:               *
 *                ac:ARM_USB_HID_Bootlaoder_Memory_Layout                     *
 *                                                                            *
 *  Requirements: ARM specific.                                               *
 *                                                                            *
 *  Migration:    Along with Config.h, this is the only file in this          *
 *                project that might need to be adjusted when migrating.      *
 *                Switching to another MCU within ARM family                  *
 *                of microcontrollers, may require at most two constants      *
 *                to be changed:                                              *
 *                  1. DEVICE_NAME                                            *
 *                  2. BOOTLOADER_SIZE                                        *
 *                Target MCU may needs some additional initialization code.   *
 *                Place it in Config() routine.                               *
 *                If these are already set properly, we are all done :)       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
#include <Main.h>
#include <Types.h>
#include <Config.h>
#include <UHB_Driver.h>

/* Bootloader constantats */

// Target MCU family.
// Use predefined family constants (TMcuType).
#ifdef STM32F2XX
const MCU_TYPE = mtSTM32F2XX;
#endif
#ifdef STM32F4XX
const MCU_TYPE = mtSTM32F4XX;
#endif
#ifdef STM32F1XX
const MCU_TYPE = mtSTM32F1XX;
#endif
#ifdef STM32L1XX
const MCU_TYPE = mtSTM32L1XX;
#endif

// Device name: Name of hardware product bootloader is set for (not MCU name).
// This name will be displayed in PC application name field once device is detected.
#define DEVICE_NAME "NO NAME"

const unsigned int  BOOTLOADER_REVISION = 0x1200; // Version of bootloader firmware.

// Bootloader start address equasion:
#ifdef STM32F_2XX_4XX
const unsigned long BOOTLOADER_SIZE   = 128ul*1024ul; // Bootloader (this) code size.
                                                      // Must be the same as the size of
                                                      // flash sectors occupied by this bootloader!
                                                      // We'll place bootloader in last flash sector.
const unsigned long BOOTLOADER_START  = __FLASH_SIZE-BOOTLOADER_SIZE; // Occupy last flash sector
#else
const unsigned long BOOTLOADER_SIZE   = 20151;    // Bootloader (this) code size.
                                                  // Easiest way to set this field
                                                  //   is to enter a large value here
                                                  //   (i.e. half the MCU flash size),
                                                  //   then compile the project and
                                                  //   reset this value to the
                                                  //   'USED ROM' value given in Compiler messages.
                                                  // Recompile the project!
const unsigned long BOOTLOADER_START  = ((__FLASH_SIZE-BOOTLOADER_SIZE)/_FLASH_ERASE)*_FLASH_ERASE;
#endif
const unsigned char RESET_VECTOR_SIZE = 20;       // MCU reset vector size in bytes.

// Bootloader info record.
// It is used by PC application tool to identify device and get device 
// specific information.
const TBootInfo BootInfo = { sizeof(TBootInfo),                   // This record's size in bytes.
                            {bifMCUTYPE,    MCU_TYPE},            // MCU family.
                            {bifMCUSIZE,    __FLASH_SIZE},        // MCU flash size.
                            {bifERASEBLOCK, _FLASH_ERASE},        // MCU Flash erase block size in bytes.
                            {bifWRITEBLOCK, _FLASH_WRITE_LATCH},  // MCU Flash write block size in bytes.
                            {bifBOOTREV,    BOOTLOADER_REVISION}, // Version of bootlaoder firmware.
                            {bifBOOTSTART,  BOOTLOADER_START},    // Bootloader code start address.
                            {bifDEVDSC,     DEVICE_NAME}          // Name of this device.
                           };
                        
/* Bootloader memory allocation */

// USB HID read/write buffers
// Buffers should be in USB RAM, please consult datasheet
unsigned char HidReadBuff[64];          // USB HID read buffer.
unsigned char HidWriteBuff[64];          // USB HID write buffer.

/******************************************************************************
 *                                                                            *
 *  Macro:        ConfigMem()                                                 *
 *                                                                            *
 *  Description:  Specific program allocation directives:                     *
 *                  1. all routines above                                     *
 *                     BOOTLOADER_START-RESET_VECTOR_SIZE address.            *
 *                  2. bootloader main routine at BOOTLOADER_START address.   *
 *                  3. StartProgram routine at                                *
 *                     BOOTLOADER_START-RESET_VECTOR_SIZE address             *
 *                  4. dummy if to allocate Reserve4thBankForUSB buffer.      *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: None.                                                       *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
#define ConfigMem()   OrgAll(BOOTLOADER_START-RESET_VECTOR_SIZE); \
                      FuncOrg(main, BOOTLOADER_START); \
                      FuncOrg(StartProgram, BOOTLOADER_START-RESET_VECTOR_SIZE)

/******************************************************************************
 *                                                                            *
 *  Function:     void Config()                                               *
 *                                                                            *
 *  Description:  MCU configuration and memory allocation directives.         *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: None.                                                       *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
void Config() {
  unsigned long boot_code_sector;
  
  ConfigMem(); // allocate memory
  
  /* protect bootloader code */
  
  #ifdef STM32F_2XX_4XX
  // unlock option bytes
  FLASH_OPTKEYR = 0x08192A3B;
  FLASH_OPTKEYR = 0x4C5D6E7F;

  // set write protection for bootloader sector
  boot_code_sector = FLASH_AddressToSector(BOOTLOADER_START) / 8;
  FLASH_OPTCR &= ~((1l << boot_code_sector) << 16);
  
  // write option bytes
  FLASH_OPTCRbits.OPTSTRT = 1;
  while (FLASH_SRbits.BSY)
  ;
  
  FLASH_OPTCRbits.OPTLOCK = 1;
  #endif
  
}