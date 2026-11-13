//COMO USAR

//DECLARAR EN EL MAIN.C

//variables recepcion por idle
/*
#define buff_size 100  //colocar tamaño buffer recepcion
uint16_t buff_RX=buff_size;
uint8_t trama_rx[buff_size];
*/

//en el void main antes del while(1) poner
/*
 memset(trama_rx,0,buff_RX);//limpia trama de recepcion por idle
  HAL_UARTEx_ReceiveToIdle_IT(&huart1, (uint8_t*)trama_rx, buff_RX);//inica la recepcion por idle

 */

// y debe haber un procedimiento llamado procesarx()  en el main
//que procesa los datos recibidos

//en el main.h  entre un begin y un end poner
//void procesarx();

//ejemplo
 /* USER CODE BEGIN Includes */
//void procesarx();


/* USER CODE END Includes */
#include "main.h"
#include "string.h"
extern uint16_t buff_RX;
extern uint8_t trama_rx[];
extern UART_HandleTypeDef huart1;//COLOCAR EL UART A USAR
extern char flag_rx;


//procedimiento de  idle para recepcion serial
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size)
{


		if (huart->Instance == USART1)//si es uart1 sino cambiar
	{
	  flag_rx=1;


}



}
