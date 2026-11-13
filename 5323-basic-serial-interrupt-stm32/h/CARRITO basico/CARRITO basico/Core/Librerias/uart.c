/*
 * uart.c
 *
 *  Created on: 15/11/2021
 *      Author: Alcides Ramos
 */

#include "uart.h"
#include "stdio.h"
#include "string.h"
char dato_rx[1];
extern UART_HandleTypeDef huart1;
extern uint8_t trama_rx[];
uint16_t contador_rx=0;
char flag_rx=0;
void uartx_write(UART_HandleTypeDef *huart,uint8_t ch)
{
HAL_UART_Transmit(huart, &ch, 1, 0xffff);

}

void uartx_write_text(UART_HandleTypeDef *huart, uint8_t *info)
{

while(*info)  uartx_write(huart,*info++);

}


uint8_t uartx_read(UART_HandleTypeDef *huart)
{
	uint8_t dato_rx_=0;
	HAL_UART_Receive(huart,&dato_rx_, 1,HAL_MAX_DELAY);
	return(dato_rx_);
}



void uartx_read_text(UART_HandleTypeDef *huart,uint8_t  *info,const uint8_t final,uint8_t cuanto)
{
uint8_t dato_rx=0;//  los datos leidos son de 8 bits
char i=0;
    memset(info,0,cuanto);//limpia el buffer
	while(dato_rx!=final)// lee hasta que llegue el final
	{
	dato_rx =uartx_read(huart);
	*info=dato_rx;//  va almacenado en el buffer
    info++;
	i++;// incrementa contador
	if (i>cuanto-1) break;// si llegan n elementosa sale
	}
}
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	char dato_leido;
	dato_leido=dato_rx[0];
	trama_rx[contador_rx]=dato_leido;
	contador_rx++;
	if(contador_rx>=100){
		contador_rx=0;
	}
	if(dato_leido=='*'){
		contador_rx=0;
		flag_rx=1;
		//HAL_GPIO_TogglePin(led3_GPIO_Port, led3_Pin);
		//uartx_write_text(&huart1,trama_rx);

	}
	//HAL_GPIO_TogglePin(led3_GPIO_Port, led3_Pin);
	HAL_UART_Receive_IT(&huart1, dato_rx, 1);

  /* Prevent unused argument(s) compilation warning */
  UNUSED(huart);
  /* NOTE: This function should not be modified, when the callback is needed,
           the HAL_UART_RxCpltCallback could be implemented in the user file
   */
}


