UHB_Driver__Buffer_SaveToFlash:
;UHB_Driver.c,192 :: 		static void _Buffer_SaveToFlash() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;UHB_Driver.c,196 :: 		if (StartAddress == 0)
MOVW	R0, #lo_addr(_GPAddress+0)
MOVT	R0, #hi_addr(_GPAddress+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_UHB_Driver__Buffer_SaveToFlash0
;UHB_Driver.c,197 :: 		*(unsigned long *)Buffer.fBuffer = arm_boot_sp; // Insert bootloader stack pointer.
MOVW	R0, #lo_addr(_arm_boot_sp+0)
MOVT	R0, #hi_addr(_arm_boot_sp+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Buffer+0)
MOVT	R0, #hi_addr(_Buffer+0)
STR	R1, [R0, #0]
L_UHB_Driver__Buffer_SaveToFlash0:
;UHB_Driver.c,200 :: 		bCount = Buffer_Count();                        // Get number of bytes in buffer.
MOVW	R2, #lo_addr(_Buffer+1024)
MOVT	R2, #hi_addr(_Buffer+1024)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_Buffer+0)
MOVT	R0, #hi_addr(_Buffer+0)
SUB	R0, R1, R0
; bCount start address is: 4 (R1)
SXTH	R1, R0
;UHB_Driver.c,201 :: 		Buffer.fRWPtr = Buffer.fBuffer;                 // Reset buffer pointer.
MOVW	R0, #lo_addr(_Buffer+0)
MOVT	R0, #hi_addr(_Buffer+0)
STR	R0, [R2, #0]
; bCount end address is: 4 (R1)
SXTH	R5, R1
;UHB_Driver.c,202 :: 		while (bCount > 0) {
L_UHB_Driver__Buffer_SaveToFlash1:
; bCount start address is: 20 (R5)
CMP	R5, #0
IT	LE
BLE	L_UHB_Driver__Buffer_SaveToFlash2
;UHB_Driver.c,203 :: 		FLASH_Write(StartAddress, Buffer.fRWPtr);     // Write chunk (flash write latch size) of buffer data.
MOVW	R0, #lo_addr(_Buffer+1024)
MOVT	R0, #hi_addr(_Buffer+1024)
LDR	R0, [R0, #0]
LDR	R0, [R0, #0]
MOV	R1, R0
MOVW	R0, #lo_addr(_GPAddress+0)
MOVT	R0, #hi_addr(_GPAddress+0)
LDR	R0, [R0, #0]
BL	_FLASH_Write_Word+0
;UHB_Driver.c,204 :: 		bCount -= _FLASH_WRITE_LATCH;                 // Decrement bytes count.
SUBS	R0, R5, #4
SXTH	R5, R0
;UHB_Driver.c,205 :: 		Buffer.fRWPtr += _FLASH_WRITE_LATCH;          // Increment buffer pointer.
MOVW	R1, #lo_addr(_Buffer+1024)
MOVT	R1, #hi_addr(_Buffer+1024)
LDR	R0, [R1, #0]
ADDS	R0, R0, #4
STR	R0, [R1, #0]
;UHB_Driver.c,209 :: 		StartAddress += _FLASH_WRITE_LATCH;           // Increment flash address.
MOVW	R1, #lo_addr(_GPAddress+0)
MOVT	R1, #hi_addr(_GPAddress+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #4
STR	R0, [R1, #0]
;UHB_Driver.c,211 :: 		}
; bCount end address is: 20 (R5)
IT	AL
BAL	L_UHB_Driver__Buffer_SaveToFlash1
L_UHB_Driver__Buffer_SaveToFlash2:
;UHB_Driver.c,212 :: 		}
L_end__Buffer_SaveToFlash:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of UHB_Driver__Buffer_SaveToFlash
UHB_Driver_SendBootInfo:
;UHB_Driver.c,236 :: 		static void SendBootInfo() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;UHB_Driver.c,243 :: 		*(TBootInfoArray *)(void *)HidWriteBuff = BootInfo; // Copy boot info record into transmit buffer.
MOV	R3, #56
MOVW	R2, #lo_addr(_HidWriteBuff+0)
MOVT	R2, #hi_addr(_HidWriteBuff+0)
MOVW	R1, #lo_addr(_BootInfo+0)
MOVT	R1, #hi_addr(_BootInfo+0)
L_UHB_Driver_SendBootInfo3:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_UHB_Driver_SendBootInfo3
;UHB_Driver.c,244 :: 		HID_Write(HidWriteBuff, 64);                        // Send boot info.
MOVS	R1, #64
MOVW	R0, #lo_addr(_HidWriteBuff+0)
MOVT	R0, #hi_addr(_HidWriteBuff+0)
BL	_HID_Write+0
;UHB_Driver.c,245 :: 		}
L_end_SendBootInfo:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of UHB_Driver_SendBootInfo
UHB_Driver_Check4Cmd:
;UHB_Driver.c,269 :: 		static void Check4Cmd() {
;UHB_Driver.c,270 :: 		if (CmdCode == cmdNON) {               // Are we in 'Idle' mode?
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_UHB_Driver_Check4Cmd4
;UHB_Driver.c,272 :: 		if (HidReadBuff[0] != STX)           // Do we have an 'STX' at start?
MOVW	R0, #lo_addr(_HidReadBuff+0)
MOVT	R0, #hi_addr(_HidReadBuff+0)
LDRB	R0, [R0, #0]
CMP	R0, #15
IT	EQ
BEQ	L_UHB_Driver_Check4Cmd5
;UHB_Driver.c,274 :: 		return ;                           // No, then exit.
IT	AL
BAL	L_end_Check4Cmd
L_UHB_Driver_Check4Cmd5:
;UHB_Driver.c,277 :: 		CmdCode = HidReadBuff[1];            // Get command code.
MOVW	R0, #lo_addr(_HidReadBuff+1)
MOVT	R0, #hi_addr(_HidReadBuff+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,278 :: 		Lo(GPAddress) = HidReadBuff[2];      // Get address lo byte.
MOVW	R0, #lo_addr(_HidReadBuff+2)
MOVT	R0, #hi_addr(_HidReadBuff+2)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_GPAddress+0)
MOVT	R0, #hi_addr(_GPAddress+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,279 :: 		Hi(GPAddress) = HidReadBuff[3];      // Get address hi byte.
MOVW	R0, #lo_addr(_HidReadBuff+3)
MOVT	R0, #hi_addr(_HidReadBuff+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_GPAddress+1)
MOVT	R0, #hi_addr(_GPAddress+1)
STRB	R1, [R0, #0]
;UHB_Driver.c,280 :: 		Higher(GPAddress) = HidReadBuff[4];  // Get address higher byte.
MOVW	R0, #lo_addr(_HidReadBuff+4)
MOVT	R0, #hi_addr(_HidReadBuff+4)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_GPAddress+2)
MOVT	R0, #hi_addr(_GPAddress+2)
STRB	R1, [R0, #0]
;UHB_Driver.c,281 :: 		Highest(GPAddress) = HidReadBuff[5]; // Get address highest byte.
MOVW	R0, #lo_addr(_HidReadBuff+5)
MOVT	R0, #hi_addr(_HidReadBuff+5)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_GPAddress+3)
MOVT	R0, #hi_addr(_GPAddress+3)
STRB	R1, [R0, #0]
;UHB_Driver.c,282 :: 		Lo(GPCounter) = HidReadBuff[6];      // Get counter lo byte.
MOVW	R0, #lo_addr(_HidReadBuff+6)
MOVT	R0, #hi_addr(_HidReadBuff+6)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_GPCounter+0)
MOVT	R0, #hi_addr(_GPCounter+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,283 :: 		Hi(GPCounter) = HidReadBuff[7];      // Get counter hi byte.
MOVW	R0, #lo_addr(_HidReadBuff+7)
MOVT	R0, #hi_addr(_HidReadBuff+7)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_GPCounter+1)
MOVT	R0, #hi_addr(_GPCounter+1)
STRB	R1, [R0, #0]
;UHB_Driver.c,284 :: 		}
IT	AL
BAL	L_UHB_Driver_Check4Cmd6
L_UHB_Driver_Check4Cmd4:
;UHB_Driver.c,287 :: 		}
L_UHB_Driver_Check4Cmd6:
;UHB_Driver.c,288 :: 		}
L_end_Check4Cmd:
BX	LR
; end of UHB_Driver_Check4Cmd
UHB_Driver_GetData:
;UHB_Driver.c,317 :: 		static char GetData() {
;UHB_Driver.c,322 :: 		sPtr = HidReadBuff;                    // Set local pointer to HID read buffer.
; sPtr start address is: 16 (R4)
MOVW	R4, #lo_addr(_HidReadBuff+0)
MOVT	R4, #hi_addr(_HidReadBuff+0)
;UHB_Driver.c,323 :: 		i = 0;                                 // Clear HID read buffer byte counter.
; i start address is: 12 (R3)
MOVS	R3, #0
; sPtr end address is: 16 (R4)
; i end address is: 12 (R3)
;UHB_Driver.c,324 :: 		while (1) {
L_UHB_Driver_GetData7:
;UHB_Driver.c,325 :: 		if (!BytesToGet)                     // Did we get it all?
; i start address is: 12 (R3)
; sPtr start address is: 16 (R4)
MOVW	R0, #lo_addr(_GPCounter+0)
MOVT	R0, #hi_addr(_GPCounter+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_UHB_Driver_GetData9
; sPtr end address is: 16 (R4)
; i end address is: 12 (R3)
;UHB_Driver.c,326 :: 		return 1;                          //   Yes, return with all done.
MOVS	R0, #1
IT	AL
BAL	L_end_GetData
L_UHB_Driver_GetData9:
;UHB_Driver.c,327 :: 		if (Buffer_Count() == Buffer_Size()) // Is data buffer full?
; i start address is: 12 (R3)
; sPtr start address is: 16 (R4)
MOVW	R0, #lo_addr(_Buffer+1024)
MOVT	R0, #hi_addr(_Buffer+1024)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Buffer+0)
MOVT	R0, #hi_addr(_Buffer+0)
SUB	R0, R1, R0
CMP	R0, #1024
IT	NE
BNE	L_UHB_Driver_GetData10
; sPtr end address is: 16 (R4)
; i end address is: 12 (R3)
;UHB_Driver.c,328 :: 		return 1;                          //   Yes, return with buffer full.
MOVS	R0, #1
IT	AL
BAL	L_end_GetData
L_UHB_Driver_GetData10:
;UHB_Driver.c,329 :: 		if (i == sizeof(HidReadBuff))        // End of received packet?
; i start address is: 12 (R3)
; sPtr start address is: 16 (R4)
CMP	R3, #64
IT	NE
BNE	L_UHB_Driver_GetData11
; sPtr end address is: 16 (R4)
; i end address is: 12 (R3)
;UHB_Driver.c,330 :: 		return 0;                          //   Yes, return with more to get.
MOVS	R0, #0
IT	AL
BAL	L_end_GetData
L_UHB_Driver_GetData11:
;UHB_Driver.c,331 :: 		Buffer_WriteByte(*sPtr++);           // Copy to buffer.
; i start address is: 12 (R3)
; sPtr start address is: 16 (R4)
LDRB	R2, [R4, #0]
MOVW	R1, #lo_addr(_Buffer+1024)
MOVT	R1, #hi_addr(_Buffer+1024)
LDR	R0, [R1, #0]
STRB	R2, [R0, #0]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
ADDS	R4, R4, #1
;UHB_Driver.c,332 :: 		BytesToGet--;                        // Decrement data buffer counter.
MOVW	R1, #lo_addr(_GPCounter+0)
MOVT	R1, #hi_addr(_GPCounter+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;UHB_Driver.c,333 :: 		i++;                                 // Increment HID read buffer byte counter
ADDS	R3, R3, #1
UXTB	R3, R3
;UHB_Driver.c,334 :: 		}
; sPtr end address is: 16 (R4)
; i end address is: 12 (R3)
IT	AL
BAL	L_UHB_Driver_GetData7
;UHB_Driver.c,336 :: 		}
L_end_GetData:
BX	LR
; end of UHB_Driver_GetData
UHB_Driver_SendACK:
;UHB_Driver.c,359 :: 		static void SendACK(enum TCmd cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;UHB_Driver.c,361 :: 		HidWriteBuff[0] = STX;       // Start of packet indetifier.
MOVS	R2, #15
MOVW	R1, #lo_addr(_HidWriteBuff+0)
MOVT	R1, #hi_addr(_HidWriteBuff+0)
STRB	R2, [R1, #0]
;UHB_Driver.c,362 :: 		HidWriteBuff[1] = cmd;       // Command code to acknowledge.
MOVW	R1, #lo_addr(_HidWriteBuff+1)
MOVT	R1, #hi_addr(_HidWriteBuff+1)
STRB	R0, [R1, #0]
; cmd end address is: 0 (R0)
;UHB_Driver.c,363 :: 		HID_Write(HidWriteBuff, 64); // Send acknowledgement packet.
MOVS	R1, #64
MOVW	R0, #lo_addr(_HidWriteBuff+0)
MOVT	R0, #hi_addr(_HidWriteBuff+0)
BL	_HID_Write+0
;UHB_Driver.c,364 :: 		}
L_end_SendACK:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of UHB_Driver_SendACK
_StartBootloader:
;UHB_Driver.c,387 :: 		void StartBootloader() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;UHB_Driver.c,389 :: 		char writeData = 0;    // Write command execution flag.
MOVS	R0, #0
STRB	R0, [SP, #4]
;UHB_Driver.c,392 :: 		arm_boot_sp = *(unsigned long*)0; // Save bootloader stack pointer.
MOVW	R0, 0
MOVT	R0, 0
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_arm_boot_sp+0)
MOVT	R0, #hi_addr(_arm_boot_sp+0)
STR	R1, [R0, #0]
;UHB_Driver.c,400 :: 		Buffer_Reset();        // Reset data buffer.
MOVW	R1, #lo_addr(_Buffer+0)
MOVT	R1, #hi_addr(_Buffer+0)
MOVW	R0, #lo_addr(_Buffer+1024)
MOVT	R0, #hi_addr(_Buffer+1024)
STR	R1, [R0, #0]
;UHB_Driver.c,403 :: 		while(1) {
L_StartBootloader12:
;UHB_Driver.c,404 :: 		USB_Polling_Proc();  // Check USB.
BL	_USB_Polling_Proc+0
;UHB_Driver.c,405 :: 		dataRx = HID_Read(); // Read received USB packet, if any.
BL	_HID_Read+0
;UHB_Driver.c,406 :: 		if (dataRx) {        // Do we have an incoming?
CMP	R0, #0
IT	EQ
BEQ	L_StartBootloader14
;UHB_Driver.c,408 :: 		Check4Cmd();       // Check received packet for new command.
BL	UHB_Driver_Check4Cmd+0
;UHB_Driver.c,409 :: 		switch(CmdCode) {  // Process command.
IT	AL
BAL	L_StartBootloader15
;UHB_Driver.c,410 :: 		case cmdWRITE: { // Cmd: Write data to flash.
L_StartBootloader17:
;UHB_Driver.c,411 :: 		if (writeData) {   // Are we already executing an write command?
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	EQ
BEQ	L_StartBootloader18
;UHB_Driver.c,412 :: 		if (GetData()) { // Yes, then do we have some data to write?
BL	UHB_Driver_GetData+0
CMP	R0, #0
IT	EQ
BEQ	L_StartBootloader19
;UHB_Driver.c,418 :: 		if (StartAddress < BOOTLOADER_START) // Are we out of bootloader area?
MOVW	R0, #lo_addr(_GPAddress+0)
MOVT	R0, #hi_addr(_GPAddress+0)
LDR	R1, [R0, #0]
MOVW	R0, _BOOTLOADER_START
MOVT	R0, _BOOTLOADER_START+2
CMP	R1, R0
IT	CS
BCS	L_StartBootloader20
;UHB_Driver.c,420 :: 		Buffer_SaveToFlash();              //   Yes, write data buffer to flash.
BL	UHB_Driver__Buffer_SaveToFlash+0
L_StartBootloader20:
;UHB_Driver.c,421 :: 		SendACK(CmdCode);                    // Acknowledge data write and ask for more if any.
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
BL	UHB_Driver_SendACK+0
;UHB_Driver.c,422 :: 		Buffer_Reset();                      // Reset data buffer.
MOVW	R1, #lo_addr(_Buffer+0)
MOVT	R1, #hi_addr(_Buffer+0)
MOVW	R0, #lo_addr(_Buffer+1024)
MOVT	R0, #hi_addr(_Buffer+1024)
STR	R1, [R0, #0]
;UHB_Driver.c,423 :: 		if (BytesToWrite == 0) {             // Are there more data to write?
MOVW	R0, #lo_addr(_GPCounter+0)
MOVT	R0, #hi_addr(_GPCounter+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_StartBootloader21
;UHB_Driver.c,424 :: 		writeData = 0;                     //   No, reset executing write command flag.
MOVS	R0, #0
STRB	R0, [SP, #4]
;UHB_Driver.c,425 :: 		CmdCode = cmdNON;                  //   Set 'Idle' command code.
MOVS	R1, #0
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,426 :: 		}
L_StartBootloader21:
;UHB_Driver.c,427 :: 		}
L_StartBootloader19:
;UHB_Driver.c,428 :: 		}
IT	AL
BAL	L_StartBootloader22
L_StartBootloader18:
;UHB_Driver.c,430 :: 		writeData = 1; // Set executing write command flag.
MOVS	R0, #1
STRB	R0, [SP, #4]
;UHB_Driver.c,431 :: 		}
L_StartBootloader22:
;UHB_Driver.c,432 :: 		break;
IT	AL
BAL	L_StartBootloader16
;UHB_Driver.c,434 :: 		case cmdERASE: { // Cmd: Erase flash.
L_StartBootloader23:
;UHB_Driver.c,435 :: 		while (BlocksToErase--) {                   // More to erase?
L_StartBootloader24:
MOVW	R2, #lo_addr(_GPCounter+0)
MOVT	R2, #hi_addr(_GPCounter+0)
LDRSH	R1, [R2, #0]
MOV	R0, R2
LDRSH	R0, [R0, #0]
SUBS	R0, R0, #1
STRH	R0, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L_StartBootloader25
;UHB_Driver.c,441 :: 		if (StartAddress < BOOTLOADER_START)      // Are we out of bootloader area?
MOVW	R0, #lo_addr(_GPAddress+0)
MOVT	R0, #hi_addr(_GPAddress+0)
LDR	R1, [R0, #0]
MOVW	R0, _BOOTLOADER_START
MOVT	R0, _BOOTLOADER_START+2
CMP	R1, R0
IT	CS
BCS	L_StartBootloader26
;UHB_Driver.c,443 :: 		FLASH_Erase(StartAddress);              //   Yes, erase flash block.
MOVW	R0, #lo_addr(_GPAddress+0)
MOVT	R0, #hi_addr(_GPAddress+0)
LDR	R0, [R0, #0]
BL	_FLASH_ErasePage+0
L_StartBootloader26:
;UHB_Driver.c,451 :: 		StartAddress -= _FLASH_ERASE;           //   Increment flash address.
MOVW	R1, #lo_addr(_GPAddress+0)
MOVT	R1, #hi_addr(_GPAddress+0)
LDR	R0, [R1, #0]
SUB	R0, R0, #1024
STR	R0, [R1, #0]
;UHB_Driver.c,454 :: 		}
IT	AL
BAL	L_StartBootloader24
L_StartBootloader25:
;UHB_Driver.c,455 :: 		SendACK(CmdCode);                           // Acknowledge flash erase command.
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
BL	UHB_Driver_SendACK+0
;UHB_Driver.c,456 :: 		CmdCode = cmdNON;                           // Set 'Idle' command code.
MOVS	R1, #0
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,457 :: 		break;
IT	AL
BAL	L_StartBootloader16
;UHB_Driver.c,459 :: 		case cmdSYNC: { // Cmd: Synchronize bootloader and PC app.
L_StartBootloader27:
;UHB_Driver.c,460 :: 		SendACK(CmdCode); // Acknowledge SYNC command.
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
BL	UHB_Driver_SendACK+0
;UHB_Driver.c,461 :: 		CmdCode = cmdNON; // Set 'Idle' command code.
MOVS	R1, #0
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,462 :: 		break;
IT	AL
BAL	L_StartBootloader16
;UHB_Driver.c,464 :: 		case cmdREBOOT: { // Cmd: Reboot the MCU.
L_StartBootloader28:
;UHB_Driver.c,475 :: 		SystemReset();   // Reset MCU.
BL	_SystemReset+0
;UHB_Driver.c,481 :: 		CmdCode = cmdNON; // Set 'Idle' command code.
MOVS	R1, #0
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,482 :: 		break;
IT	AL
BAL	L_StartBootloader16
;UHB_Driver.c,484 :: 		}
L_StartBootloader15:
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L_StartBootloader17
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
CMP	R0, #21
IT	EQ
BEQ	L_StartBootloader23
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_StartBootloader27
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_StartBootloader28
L_StartBootloader16:
;UHB_Driver.c,485 :: 		}
L_StartBootloader14:
;UHB_Driver.c,486 :: 		}
IT	AL
BAL	L_StartBootloader12
;UHB_Driver.c,487 :: 		}
L_end_StartBootloader:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _StartBootloader
_EnterBootloaderMode:
;UHB_Driver.c,514 :: 		char EnterBootloaderMode() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;UHB_Driver.c,516 :: 		unsigned timer = 5000;   // 5sec timer = 5000 * 1ms.
MOVW	R0, #5000
STRH	R0, [SP, #4]
;UHB_Driver.c,519 :: 		while (1) {
L_EnterBootloaderMode29:
;UHB_Driver.c,520 :: 		USB_Polling_Proc();  // Check USB.
BL	_USB_Polling_Proc+0
;UHB_Driver.c,521 :: 		dataRx = HID_Read(); // Read received USB packet, if any.
BL	_HID_Read+0
;UHB_Driver.c,522 :: 		if (dataRx) {        // Do we have an incoming?
CMP	R0, #0
IT	EQ
BEQ	L_EnterBootloaderMode31
;UHB_Driver.c,524 :: 		Check4Cmd();       // Check received packet for new command.
BL	UHB_Driver_Check4Cmd+0
;UHB_Driver.c,525 :: 		switch (CmdCode) { // Process command.
IT	AL
BAL	L_EnterBootloaderMode32
;UHB_Driver.c,526 :: 		case cmdBOOT: {  // Cmd: Enter bootloader mode.
L_EnterBootloaderMode34:
;UHB_Driver.c,527 :: 		SendACK(CmdCode);   // Acknowledge enter bootloader mode command.
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
BL	UHB_Driver_SendACK+0
;UHB_Driver.c,528 :: 		CmdCode = cmdNON;   // Set 'Idle' command code.
MOVS	R1, #0
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,529 :: 		Delay_10ms();
BL	_Delay_10ms+0
;UHB_Driver.c,530 :: 		return 1;           // Return with do bootloader code.
MOVS	R0, #1
IT	AL
BAL	L_end_EnterBootloaderMode
;UHB_Driver.c,532 :: 		case cmdINFO: { // Cmd: Get bootloader info.
L_EnterBootloaderMode35:
;UHB_Driver.c,533 :: 		SendBootInfo();   // Send bootloader info record.
BL	UHB_Driver_SendBootInfo+0
;UHB_Driver.c,534 :: 		CmdCode = cmdNON; // Set 'Idle' command code.
MOVS	R1, #0
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
STRB	R1, [R0, #0]
;UHB_Driver.c,535 :: 		break;
IT	AL
BAL	L_EnterBootloaderMode33
;UHB_Driver.c,537 :: 		}
L_EnterBootloaderMode32:
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_EnterBootloaderMode34
MOVW	R0, #lo_addr(_CmdCode+0)
MOVT	R0, #hi_addr(_CmdCode+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_EnterBootloaderMode35
L_EnterBootloaderMode33:
;UHB_Driver.c,538 :: 		}
L_EnterBootloaderMode31:
;UHB_Driver.c,540 :: 		Delay_1ms();
BL	_Delay_1ms+0
;UHB_Driver.c,541 :: 		if (!(timer--)) // Do we have a timeout?
LDRH	R1, [SP, #4]
LDRH	R0, [SP, #4]
SUBS	R0, R0, #1
STRH	R0, [SP, #4]
CMP	R1, #0
IT	NE
BNE	L_EnterBootloaderMode36
;UHB_Driver.c,542 :: 		return 0;     //   Yes, return with do application code.
MOVS	R0, #0
IT	AL
BAL	L_end_EnterBootloaderMode
L_EnterBootloaderMode36:
;UHB_Driver.c,543 :: 		}
IT	AL
BAL	L_EnterBootloaderMode29
;UHB_Driver.c,544 :: 		}
L_end_EnterBootloaderMode:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _EnterBootloaderMode
_StartProgram:
;UHB_Driver.c,570 :: 		void StartProgram() {
;UHB_Driver.c,573 :: 		asm nop;
NOP
;UHB_Driver.c,579 :: 		asm nop;
NOP
;UHB_Driver.c,580 :: 		asm nop;
NOP
;UHB_Driver.c,581 :: 		asm nop;
NOP
;UHB_Driver.c,582 :: 		asm nop;
NOP
;UHB_Driver.c,583 :: 		asm nop;
NOP
;UHB_Driver.c,584 :: 		asm nop;
NOP
;UHB_Driver.c,585 :: 		asm nop;
NOP
;UHB_Driver.c,586 :: 		asm nop;
NOP
;UHB_Driver.c,588 :: 		}
L_end_StartProgram:
BX	LR
; end of _StartProgram
