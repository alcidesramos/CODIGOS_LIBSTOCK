_main:
;Main.c,75 :: 		void main(void) {
;Main.c,76 :: 		Config(); // Configure device and memory allocation.
BL	_Config+0
;Main.c,78 :: 		HID_Enable(&HidReadBuff, &HidWriteBuff); // Enable USB HID communication.
MOVW	R1, #lo_addr(_HidWriteBuff+0)
MOVT	R1, #hi_addr(_HidWriteBuff+0)
MOVW	R0, #lo_addr(_HidReadBuff+0)
MOVT	R0, #hi_addr(_HidReadBuff+0)
BL	_HID_Enable+0
;Main.c,81 :: 		if (!EnterBootloaderMode()) { // Should we enter bootloader mode?
BL	_EnterBootloaderMode+0
CMP	R0, #0
IT	NE
BNE	L_main0
;Main.c,82 :: 		HID_Disable();              // No, disable USB HID module.
BL	_HID_Disable+0
;Main.c,83 :: 		Delay_10ms();               // Wait a little bit.
BL	_Delay_10ms+0
;Main.c,85 :: 		StartProgram();             // Start already loaded application.
BL	_StartProgram+0
;Main.c,86 :: 		}
IT	AL
BAL	L_main1
L_main0:
;Main.c,88 :: 		StartBootloader();          // Yes, enter bootloader mode.
BL	_StartBootloader+0
L_main1:
;Main.c,89 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
