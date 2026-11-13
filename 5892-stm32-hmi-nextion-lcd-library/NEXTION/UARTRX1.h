/*
 * UART1RX1.h
 *
 *  Created on: Apr 9, 2025
 *      Author: ALCIDES_RAMOS
 */

#ifndef LIBRERIAS_UARTRX1_H_
#define LIBRERIAS_UARTRX1_H_

#include "main.h"



//define uart usar y tamaño trama
#define uartdatos1reg USART2   //define puerto serial a analizar
#define uartdatos1 huart2

#define trama_rx1  trama_rx1 // nombre de la trama a usar
# define trama1_size 100  //coloque el tamaño del buffer
extern UART_HandleTypeDef uartdatos1;


//en el void main antes del while(1) poner
/*
uartdat1_it_idle_dma_init();
 */

//en el while poner
      /*
      if(flag_rx1==1)
       {
		  procesa_rx();// este procedimeinto debe declararse en el main para procesar
		  flag_rx1=0;
		 uartdat1_it_idle_dma_init();
		 }

*/

//variabels asociadas al uart1
extern char flag_rx1;
extern uint16_t num_datos1;
extern uint8_t trama_rx1[];

void  uartdat1_it_idle_dma_init();
uint16_t  UART1_RX_INTERRUPT(UART_HandleTypeDef *huart,uint16_t sizex);

#endif /* LIBRERIAS_UARTRX1_H_ */
