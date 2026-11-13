//COMO USAR



//en el uart_int_dma.h   definir puerto a usar
/*
 // si tiene otra variable para la trama definala sino no.
 #define trama_rx  Trama_RX // nombre de la trama a usar
#define uartdatosreg USART1   //define puerto serial a analizar
#define uartdatos huart1
*/


//DECLARAR EN EL MAIN.C

//variables recepcion por idle
/*
//variables recepcion por idle
uint8_t trama_rx[trama_size];
char flag_rx=0;
uint16_t num_datos;
//para procesarx
  char procesa[30];
  char dato;
*/



//en el void main antes del while(1) poner
/*
uartdat_it_idle_dma_init();
 */

//en el while poner
      /*
      if(flag_rx==1)
       {
		  procesarx();
		  flag_rx=0;
		 uartdat_it_idle_dma_init();
		 }

*/
// y debe haber un procedimiento llamado procesarx()  en el main
//que procesa los datos recibidos



/* USER CODE END Includes */
#include <uart_int_idle_dma.h>
#include "main.h"
#include "string.h"

extern char flag_rx;
extern uint16_t num_datos;
extern uint8_t trama_rx[];



void  uartdat_it_idle_dma_init()
{
    memset(trama_rx,0,trama_size);//limpia el  buffer
  //  uartdatosreg->SR &= ~(UART_FLAG_RXNE | UART_FLAG_ORE); //LIMPIA BANDERAS
    HAL_UARTEx_ReceiveToIdle_DMA(&uartdatos, (uint8_t*)trama_rx, trama_size);//inica la recepcion por idle
}


//procedimiento de  idle para recepcion serial
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size)
{
		if (huart->Instance == uartdatosreg)//si es uuartdatps sino cambiar
	{
	  num_datos=Size;
	  flag_rx=1;

}



}
