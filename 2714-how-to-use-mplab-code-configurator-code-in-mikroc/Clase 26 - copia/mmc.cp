#line 1 "C:/Users/Alcides Ramos/Desktop/Clase 26/mmc.c"
#line 1 "c:/users/alcides ramos/desktop/clase 26/dac.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 93 "c:/users/alcides ramos/desktop/clase 26/dac.h"
void DAC_Initialize(void);
#line 129 "c:/users/alcides ramos/desktop/clase 26/dac.h"
void DAC_SetOutput(uint8_t inputData);
#line 163 "c:/users/alcides ramos/desktop/clase 26/dac.h"
uint8_t DAC_GetOutput(void);
#line 4 "C:/Users/Alcides Ramos/Desktop/Clase 26/mmc.c"
unsigned int codigo;

void main()
{


 LATA = 0x00;
 LATC = 0x00;
#line 16 "C:/Users/Alcides Ramos/Desktop/Clase 26/mmc.c"
 TRISA = 0x37;
 TRISC = 0x3F;
#line 22 "C:/Users/Alcides Ramos/Desktop/Clase 26/mmc.c"
 ANSELC = 0x3F;
 ANSELA = 0x17;
#line 28 "C:/Users/Alcides Ramos/Desktop/Clase 26/mmc.c"
 WPUA = 0x00;
 WPUC = 0x00;
 OPTION_REG.nWPUEN = 1;
#line 35 "C:/Users/Alcides Ramos/Desktop/Clase 26/mmc.c"
 ODCONA = 0x00;
 ODCONC = 0x00;
#line 41 "C:/Users/Alcides Ramos/Desktop/Clase 26/mmc.c"
 SLRCONA = 0x37;
 SLRCONC = 0x3F;

 DAC_Initialize();


 while (1)

 {
 codigo=ADC_Read(1);
 DAC_SetOutput(codigo/4);
 Delay_ms(200);


 }






}
