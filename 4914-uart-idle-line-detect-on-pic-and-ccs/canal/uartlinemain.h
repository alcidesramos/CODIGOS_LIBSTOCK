#include <18F2550.h>
#device ADC=10

#FUSES NOWDT                 	//No Watch Dog Timer

#use delay(crystal=4000000)
#use FIXED_IO( C_outputs=PIN_C1,PIN_C0 )
#use rs232(baud=9600,parity=N,xmit=PIN_C6,rcv=PIN_C7,bits=8,stream=PORT1)

