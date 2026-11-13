//COMO USAR

//colocar buffer dma e interrpcion serial en el configuraodr grafico

//DECLARAR EN EL MAIN.C

//variables recepcion por dma
/*
#define buff_size 100  //colocar tamaño buffer recepcion
uint16_t buff_DMA_RX=buff_size;
uint8_t trama_rx[buff_size];
extern volatile char flag_rx;
extern volatile uint16_t num_datos;

*/



//en el void main antes del while(1) poner
/*
 memset(trama_rx,0,buff_DMA_RX);//limpia trama de recepcion por dma
	  USART1->SR &= ~(USART_SR_RXNE | USART_SR_ORE);
	// Limpiar la bandera RXNE leyendo el registro DR
	uint8_t dummy = USART1->DR;

  HAL_UARTEx_ReceiveToIdle_DMA(&huart1, (uint8_t*)trama_rx, buff_DMA_RX);//inica la recepcion por dma

 */

//procesar en el main así
/*
 	if(flag_rx==1)
    	{
    flag_rx=0;
    procesarx();//llama al procedimiento que procesa la info que esta en el main
   	memset(trama_rx,0,buff_DMA_RX);
   	HAL_UARTEx_ReceiveToIdle_DMA(&huart1, (uint8_t*)trama_rx, buff_DMA_RX);//vuelve activar recepcion
    	}
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
#include "huskeycam.h"

volatile char flag_rx=0;
volatile uint16_t num_datos;


extern UART_HandleTypeDef huart1;//COLOCAR EL UART A USAR



//procedimiento de  idle por dma recepcion serial
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size)
{


		if (huart->Instance == huskeycam)//si es uart1 sino cambiar
	{
    num_datos=Size;
    flag_rx=1;
   }



}
