#line 1 "C:/Users/Alcides Ramos/Desktop/Clase 26/dac.c"
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
#line 57 "C:/Users/Alcides Ramos/Desktop/Clase 26/dac.c"
void DAC_Initialize(void)
{

 DAC1CON0 = 0xA0;

 DAC1CON1 = 0x00;
}

void DAC_SetOutput(uint8_t inputData)
{
 DAC1CON1 = inputData;
}

uint8_t DAC_GetOutput(void)
{
 return DAC1CON1;
}
