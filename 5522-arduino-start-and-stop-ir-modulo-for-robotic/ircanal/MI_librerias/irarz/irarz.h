

#ifndef irarz_h
#define irarz_h


#include <Arduino.h>

//definiciones optimas a nivel de bits

#define sbi(x, y) x |= _BV(y)    // set bit
#define cbi(x, y) x &= ~(_BV(y)) // clear bit
#define tbi(x, y) x ^= _BV(y)    // toggle bit
#define is_high(x, y) ((x & _BV(y)) == _BV(y))

//Necesarias para el algoritmo has  
#define FNV_PRIME 16777619
#define FNV_BASIS  2166136261


  //define codigos a analizar
#define inicio 138  /// no interesa
#define cod1 6
#define cod2 10
#define cod3 22

#define paso 2  // desviacion del Tiempo en el codigo leido +-2 en este caso opcional                                                               en esyte caso
#define paso1 3   // desviacion del Tiempo en el codigo leido +-3 en este caso                                                                en esyte caso

void IRINTERRUP ();
void ir_init();
void analiza_ir();



#endif