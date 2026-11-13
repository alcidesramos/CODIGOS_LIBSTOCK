#line 1 "C:/Users/Alcides Ramos/Desktop/matlab code/suma_arz.c"
#line 1 "c:/users/alcides ramos/desktop/matlab code/suma.h"
#line 1 "c:/users/alcides ramos/desktop/matlab code/rtwtypes.h"
#line 47 "c:/users/alcides ramos/desktop/matlab code/rtwtypes.h"
typedef signed char int8_T;
typedef unsigned char uint8_T;
typedef int int16_T;
typedef unsigned int uint16_T;
typedef long int32_T;
typedef unsigned long uint32_T;
typedef float real32_T;
typedef double real64_T;
#line 60 "c:/users/alcides ramos/desktop/matlab code/rtwtypes.h"
typedef double real_T;
typedef double time_T;
typedef unsigned char boolean_T;
typedef int int_T;
typedef unsigned int uint_T;
typedef unsigned long ulong_T;
typedef char char_T;
typedef unsigned char uchar_T;
typedef char_T byte_T;
#line 75 "c:/users/alcides ramos/desktop/matlab code/rtwtypes.h"
typedef struct {
 real32_T re;
 real32_T im;
} creal32_T;

typedef struct {
 real64_T re;
 real64_T im;
} creal64_T;

typedef struct {
 real_T re;
 real_T im;
} creal_T;



typedef struct {
 int8_T re;
 int8_T im;
} cint8_T;



typedef struct {
 uint8_T re;
 uint8_T im;
} cuint8_T;



typedef struct {
 int16_T re;
 int16_T im;
} cint16_T;



typedef struct {
 uint16_T re;
 uint16_T im;
} cuint16_T;



typedef struct {
 int32_T re;
 int32_T im;
} cint32_T;



typedef struct {
 uint32_T re;
 uint32_T im;
} cuint32_T;
#line 148 "c:/users/alcides ramos/desktop/matlab code/rtwtypes.h"
typedef void * pointer_T;
#line 1 "c:/users/alcides ramos/desktop/matlab code/suma_types.h"
#line 22 "c:/users/alcides ramos/desktop/matlab code/suma_types.h"
typedef struct tag_RTM_suma_T RT_MODEL_suma_T;
#line 35 "c:/users/alcides ramos/desktop/matlab code/suma.h"
typedef struct {
 real32_T uno;
 real32_T dos;
} ExtU_suma_T;


typedef struct {
 real32_T salida;
} ExtY_suma_T;


struct tag_RTM_suma_T {
 const char_T *errorStatus;
};


extern ExtU_suma_T suma_U;


extern ExtY_suma_T suma_Y;


extern void suma_initialize(void);
extern void suma_step(void);
extern void suma_terminate(void);


extern RT_MODEL_suma_T *const suma_M;
#line 2 "C:/Users/Alcides Ramos/Desktop/matlab code/suma_arz.c"
 float salida_suma;
void main()
{
 suma_U.uno=2;
 suma_U.dos=4;


 suma_step();
 salida_suma=suma_Y.salida;




}
