/*
 * bits.c
 *
 *  Created on: Jul 25, 2023
 *      Author: alcid
 */

#include "bits.h"

///inicia en la posicon cero

//ejemplo PON_UNO(&variable, 4);// coloca un 1 en  la psicion 4 d ela variable
 void PON_UNO (uint32_t  *registro, uint8_t bit1)
{
    *registro |= (1 << bit1);
}
void PON_CERO (uint32_t  *registro, uint8_t bit1)
{

    *registro &= ~ (1 << bit1);
}

//para variables
//ejemplo if (LEEBIT(&variable, 1)==1)  mira si el bit1=1
uint8_t LEEBIT (uint32_t  *registro, uint8_t bit1)
{

    if ((*registro & (1 << bit1))>0) return (1);
    else return (0);
}
