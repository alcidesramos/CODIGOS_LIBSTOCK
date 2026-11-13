_USB_Init_Desc:
;USBdsc.c,172 :: 		void USB_Init_Desc(){
;USBdsc.c,173 :: 		USB_config_dsc_ptr[0] = &configDescriptor1;
MOVW	R1, #lo_addr(_configDescriptor1+0)
MOVT	R1, #hi_addr(_configDescriptor1+0)
MOVW	R0, #lo_addr(_USB_config_dsc_ptr+0)
MOVT	R0, #hi_addr(_USB_config_dsc_ptr+0)
STR	R1, [R0, #0]
;USBdsc.c,174 :: 		USB_string_dsc_ptr[0] = (const char*)&strd1;
MOVW	R1, #lo_addr(_strd1+0)
MOVT	R1, #hi_addr(_strd1+0)
MOVW	R0, #lo_addr(_USB_string_dsc_ptr+0)
MOVT	R0, #hi_addr(_USB_string_dsc_ptr+0)
STR	R1, [R0, #0]
;USBdsc.c,175 :: 		USB_string_dsc_ptr[1] = (const char*)&strd2;
MOVW	R1, #lo_addr(_strd2+0)
MOVT	R1, #hi_addr(_strd2+0)
MOVW	R0, #lo_addr(_USB_string_dsc_ptr+4)
MOVT	R0, #hi_addr(_USB_string_dsc_ptr+4)
STR	R1, [R0, #0]
;USBdsc.c,176 :: 		USB_string_dsc_ptr[2] = (const char*)&strd3;
MOVW	R1, #lo_addr(_strd3+0)
MOVT	R1, #hi_addr(_strd3+0)
MOVW	R0, #lo_addr(_USB_string_dsc_ptr+8)
MOVT	R0, #hi_addr(_USB_string_dsc_ptr+8)
STR	R1, [R0, #0]
;USBdsc.c,177 :: 		}
L_end_USB_Init_Desc:
BX	LR
; end of _USB_Init_Desc
