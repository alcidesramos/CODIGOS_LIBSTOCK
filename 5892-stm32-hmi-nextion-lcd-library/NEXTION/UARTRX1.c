/*
 * UARTRX1.C
 *
 *  Created on: Apr 9, 2025
 *      Author: ALCIDES_RAMOS
 */

#ifndef LIBRERIAS_UARTRX1_C_
#define LIBRERIAS_UARTRX1_C_
#include "UARTRX1.h"

uint8_t trama_rx1[trama1_size];
char flag_rx1=0;
uint16_t num_datos1;

void  uartdat1_it_idle_dma_init()
{
    memset(trama_rx1,0,trama1_size-1);//limpia el  buffer

// en STM32G y stmH
   // uint8_t dummy = uartdatos1reg->RDR;
    //uartdatos1reg->ICR = USART_ICR_ORECF;  // Escribir 1 en ORECF para limpiar ORE

   //  en STM32F
    uartdatos1reg->SR &= ~( UART_FLAG_RXNE | UART_FLAG_ORE);
   	uint8_t  dummy = uartdatos1reg->DR;

    HAL_UARTEx_ReceiveToIdle_DMA(&uartdatos1, (uint8_t*)trama_rx1, trama1_size);//inica la recepcion por idle
}

uint16_t  UART1_RX_INTERRUPT(UART_HandleTypeDef *huart,uint16_t sizex)
{
	if ((flag_rx1==0)&& (huart->Instance == uartdatos1reg))//si es el uart de datos
		{
		HAL_UART_DMAStop(&uartdatos1);  //para la recepcion temporarmente
	//	num_datos1=Size;
		  flag_rx1=1;
		  return(sizex);
	    }
}

#endif /* LIBRERIAS_UARTRX1_C_ */




/*
void procesa_rx()
{
	if (strstr(trama_rx1,"V00=1")) PIN_OFF(LED);
	else if (strstr(trama_rx1,"V00=0")) PIN_ON(LED);

	else if (strstr(trama_rx1,"V01="))
	    {
	        strcpy(procesa, strtok(trama_rx1, "="));  //inicia captura de tokens desde el =
	        strcpy(procesa, strtok(0, "$"));  //captura hasta el /
	        //pasa la cadena a  numero
	       uint16_t ancho=atoi(procesa);
	       PWM_valor(&PWM1, ancho);

	    }

}

*/

