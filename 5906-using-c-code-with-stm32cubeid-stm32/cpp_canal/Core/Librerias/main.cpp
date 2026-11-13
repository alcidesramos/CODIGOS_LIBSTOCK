/*
 * mian.cpp
 *
 *  Created on: Jun 18, 2025
 *      Author: ALCIDES_RAMOS
 */

// includes  de c++


//includes de c
#include "main.h"
#include "stdio.h"
#include "stdint.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
//include de c librerias de tercero
#include "uart.h"
#include "operaciones.h"

//define


//perifericos usados, sacados del main.c
extern UART_HandleTypeDef huart1;


//variables
int resultado;
char texto[100];
Calculadora calc;

//procedimientos


// acciones en el main
extern "C" void cpp_main(void)
{
uartx_write_text(&huart1, "Inciciando\r\n");
}



//acciones del while
extern "C" void cpp_while(void)
{
	uartx_write_text(&huart1, "suscribete al canal\r\n\r\n");



	      resultado = calc.suma(3, 4);
	      sprintf(texto,"Sum=%u\r\n\r\n",resultado);
	      uartx_write_text(&huart1, texto);

	      resultado = calc.multiplica(3, 4);
	        sprintf(texto,"Mul=%u\r\n\r\n",resultado);
	            uartx_write_text(&huart1, texto);

	HAL_Delay(600);
}
