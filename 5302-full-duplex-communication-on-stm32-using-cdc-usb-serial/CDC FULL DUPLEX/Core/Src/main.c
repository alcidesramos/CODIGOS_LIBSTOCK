/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "usb_device.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "uart.h"
#include "usb_cdc.h"
#include "printf_out.h"


#include "stdio.h"
#include "string.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart1;

/* USER CODE BEGIN PV */

uint8_t trama_rx[64];
uint8_t texto[100];
uint8_t captura[30];
uint8_t  valor;



/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART1_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
void m1derecha()
{
HAL_GPIO_WritePin(M11_GPIO_Port, M11_Pin, 0);
HAL_GPIO_WritePin(M12_GPIO_Port, M12_Pin, 1);
usb_uart_write("GIRANDO A LA DERECHA\r\n");


}

void m1izquierda()
{
HAL_GPIO_WritePin(M11_GPIO_Port, M11_Pin, 1);
HAL_GPIO_WritePin(M12_GPIO_Port, M12_Pin, 0);
usb_uart_write("GIRANDO A LA IZQUIERDA\r\n");

}


void m1stop()
{
	HAL_GPIO_WritePin(M11_GPIO_Port, M11_Pin, 0);
	HAL_GPIO_WritePin(M12_GPIO_Port, M12_Pin, 0);
	usb_uart_write("ESTOY QUIERO\r\n");

}
void procesarx()
{
	if (strstr(trama_rx,"M1DER")) m1derecha();
	else if (strstr(trama_rx,"M1IZQ")) m1izquierda();
	else if (strstr(trama_rx,"M1STOP")) m1stop();

	else if (strstr(trama_rx,"LED2="))
	 {
	 if (strstr(trama_rx,"ON"))  led2_GPIO_Port->BSRR=led2_Pin;  //pone un uno
	 else led2_GPIO_Port->BSRR=led2_Pin<<16; //pode un cero
	 }

	else if (strstr(trama_rx,"LED3="))
		 {
		 if (strstr(trama_rx,"ON"))  led3_GPIO_Port->BSRR=led3_Pin;  //pone un uno
		 else  HAL_GPIO_WritePin(led3_GPIO_Port, led3_Pin, 0);		 }

	else if (strstr(trama_rx,"LEDON="))
	{
		  strcpy(texto, strtok(trama_rx, "="));  //inicia captura de tokens
      	strcpy(texto, strtok(0, "/"));  //captura primer dato
         valor=atoi(texto);

         switch  (valor)
         {
         case 2:
        	 HAL_GPIO_WritePin(led2_GPIO_Port, led2_Pin, 1);

        	 break;

         case 3:
        	 HAL_GPIO_WritePin(led3_GPIO_Port, led3_Pin, 1);

        	 break;

         }//switch

	}//else if

	else if (strstr(trama_rx,"LEDOFF="))
		{
			  strcpy(texto, strtok(trama_rx, "="));  //inicia captura de tokens
	      	strcpy(texto, strtok(0, "/"));  //captura primer dato
	         valor=atoi(texto);

	         switch  (valor)
	         {
	         case 2:
	        	 HAL_GPIO_WritePin(led2_GPIO_Port, led2_Pin, 0);

	        	 break;

	         case 3:
	        	 HAL_GPIO_WritePin(led3_GPIO_Port, led3_Pin, 0);

	        	 break;

	         }//switch

		}//else if

    memset(trama_rx,0,64);
}
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART1_UART_Init();
  MX_USB_DEVICE_Init();
  /* USER CODE BEGIN 2 */
   uartx_write_text(&huart1, "HOLA\r\n");
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {


usb_uart_write("HOLA\r\n");



   //  uartx_read_text(&huart1, trama_rx, '*',50);
   // uartx_write_text(&huart1, trama_rx);

     procesarx();
    // usb_uart_write(trama_rx);

	  HAL_GPIO_TogglePin(led1_GPIO_Port, led1_Pin);
	  HAL_Delay(500);

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 25;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 9600;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, led1_Pin|led2_Pin|led3_Pin|M11_Pin
                          |M12_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : led1_Pin led2_Pin led3_Pin M11_Pin
                           M12_Pin */
  GPIO_InitStruct.Pin = led1_Pin|led2_Pin|led3_Pin|M11_Pin
                          |M12_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
