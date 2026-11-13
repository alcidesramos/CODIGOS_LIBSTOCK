#line 1 "C:/Users/Alcides Ramos/Desktop/blue pll/USB HID Bootloader/Projects/Common Files/Main.c"
#line 1 "c:/users/alcides ramos/desktop/blue pll/usb hid bootloader/projects/blue pill/config.h"
#line 1 "c:/users/alcides ramos/desktop/blue pll/usb hid bootloader/projects/common files/types.h"
#line 20 "c:/users/alcides ramos/desktop/blue pll/usb hid bootloader/projects/common files/types.h"
enum TMcuType {mtPIC16 = 1, mtPIC18, mtPIC18FJ, mtPIC24,
 mtDSPIC = 10, mtDSPIC33,
 mtPIC32 = 20,
 mtARM = 30,
 mtSTELLARIS_M3 = 31,
 mtSTELLARIS_M4 = 32,
 mtSTELLARIS = 33,
 mtSTM32L1XX = 34,
 mtSTM32F1XX = 35,
 mtSTM32F2XX = 36,
 mtSTM32F4XX = 37,
 mtTIVA_C = 38,
 mtFT90x = 40,
 mtSTM32F7XX = 41,
 mtMK64F = 42,
 mtMK22F = 43
 };


enum TBootInfoField {bifMCUTYPE=1,
 bifMCUID,
 bifERASEBLOCK,
 bifWRITEBLOCK,
 bifBOOTREV,
 bifBOOTSTART,
 bifDEVDSC,
 bifMCUSIZE
 };


enum TCmd {cmdNON=0,
 cmdSYNC,
 cmdINFO,
 cmdBOOT,
 cmdREBOOT,
 cmdWRITE=11,
 cmdERASE=21};




typedef struct {
 char fFieldType;
 char fValue;
} TCharField;


typedef struct {
 char fFieldType;
 union {
 unsigned int intVal;
 struct {
 char bLo;
 char bHi;
 };
 } fValue;
} TUIntField;


typedef struct {
 char fFieldType;
 unsigned long fValue;
} TULongField;



typedef struct {
 char fFieldType;
 char fValue[ 20 ];
} TStringField;


typedef struct {
 char bSize;
 TCharField bMcuType;
 TULongField ulMcuSize;
 TUIntField uiEraseBlock;
 TUIntField uiWriteBlock;
 TUIntField uiBootRev;
 TULongField ulBootStart;
 TStringField sDevDsc;
} TBootInfo;
#line 37 "c:/users/alcides ramos/desktop/blue pll/usb hid bootloader/projects/blue pill/config.h"
extern const enum TMcuType MCU_TYPE;

extern const unsigned long BOOTLOADER_SIZE;
extern const unsigned long BOOTLOADER_START;
extern const unsigned char RESET_VECTOR_SIZE;

extern const TBootInfo BootInfo;


extern unsigned char HidReadBuff[64];
extern unsigned char HidWriteBuff[64];
#line 105 "c:/users/alcides ramos/desktop/blue pll/usb hid bootloader/projects/blue pill/config.h"
void Config();
#line 1 "c:/users/alcides ramos/desktop/blue pll/usb hid bootloader/driver/uhb_driver.h"
#line 19 "c:/users/alcides ramos/desktop/blue pll/usb hid bootloader/driver/uhb_driver.h"
void StartProgram();
void StartBootloader();
char EnterBootloaderMode();
#line 75 "C:/Users/Alcides Ramos/Desktop/blue pll/USB HID Bootloader/Projects/Common Files/Main.c"
void main(void) {
 Config();

 HID_Enable(&HidReadBuff, &HidWriteBuff);


 if (!EnterBootloaderMode()) {
 HID_Disable();
 Delay_10ms();

 StartProgram();
 }
 else
 StartBootloader();
}
