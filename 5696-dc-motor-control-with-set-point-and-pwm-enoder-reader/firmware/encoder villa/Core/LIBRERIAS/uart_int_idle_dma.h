/*
 * uart_int_idle.h
 *
 *  Created on: Dec 25, 2023
 *      Author: Alcides Ramos
 */
#include "main.h"

#ifndef LIBRERIAS_UART_INT_IDLE_H_
#define LIBRERIAS_UART_INT_IDLE_H_

#define uartdatosreg USART1   //define puerto serial a analizar
#define uartdatos huart1
# define trama_size 50  //coloque el tamaño del buffer


extern UART_HandleTypeDef uartdatos;

void uartdat_it_idle_dma_init();


#endif /* LIBRERIAS_UART_INT_IDLE_H_ */
