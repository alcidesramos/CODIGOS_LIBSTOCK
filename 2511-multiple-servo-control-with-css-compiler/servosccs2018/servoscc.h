#include <16F877A.h>
#device ADC=10
#use delay(crystal=4MHz)
#use FIXED_IO( B_outputs=PIN_B5,PIN_B4,PIN_B3,PIN_B2,PIN_B1,PIN_B0 )
#use FIXED_IO( C_outputs=PIN_C1,PIN_C0 )

#define SERVO1   PIN_B0
#define SERVO2   PIN_B1
#define SERVO3   PIN_B2
#define SERVO4   PIN_B3
#define SERVO5   PIN_B4
#define SERVO6   PIN_B5
#define SERVO7   PIN_C0
#define SERVO8   PIN_C1


