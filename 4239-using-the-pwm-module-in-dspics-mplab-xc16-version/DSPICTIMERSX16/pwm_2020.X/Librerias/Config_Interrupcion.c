#include "xc.h"


//procedimientos y funcionesinterrupciones
void __attribute__((__interrupt__,__auto_psv__)) __OscillatorFail(void)
{
_OSCFAIL=0;
}


void __attribute__((__interrupt__,__auto_psv__)) _AddressError(void)
{
_ADDRERR=0;
}


void __attribute__((__interrupt__,__auto_psv__)) _StackError(void)
{
_STKERR=0;
}


void __attribute__((__interrupt__,__auto_psv__)) _MathError(void)
{
_MATHERR=0;
}

void  deshabilita()
{
 //nivel de prioridad interrupcion CPU  //15 deshabilita interrupciones
_IPL3=1;
INTCON1bits.NSTDIS=0; //PARA PODER HACER EL CAMBIO DEBE STAR EN CERO HABILITADO EL ANIDAMIENTO
_IPL2=1;
_IPL1=1;
_IPL0=1;
_NSTDIS=0; //HABILITA ANINAMIENTO INTERRUPCIONES
}


void habilita()
{
    
 //nivel de prioridad interrupcion CPU  //0 habilita interrupciones
_IPL3=0;
INTCON1bits.NSTDIS=0; //PARA PODER HACER EL CAMBIO DEBE STAR EN CERO HABILITADO EL ANIDAMIENTO
_IPL2=0;
_IPL1=0;
_IPL0=0;
_NSTDIS=0; //HABILITA ANINAMIENTO INTERRUPCIONES
}


