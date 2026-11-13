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

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define display ADP_GPIO_Port->ODR
#define  leds  GPIOB->ODR

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
/* USER CODE BEGIN PFP */
void chao()
{
	 display=0x39;  //c
	       HAL_Delay(600);
	       display=118;
	       HAL_Delay(600);
	              display=0b01110111;
	              HAL_Delay(600);
	                     display=0b00111111;
	                     HAL_Delay(600);


}


void baja()
{

    display=0x4F;  //3
   HAL_Delay(600);
   display=0x5B;  //2
   HAL_Delay(600);
    display=0x06;//1
     HAL_Delay(600);

}

void luces1()
{
leds=~leds;
HAL_Delay(200);
leds=~leds;
HAL_Delay(200);
leds=~leds;
HAL_Delay(200);
leds=~leds;
HAL_Delay(200);

}

void luces2()
{
leds=0;//apaga
HAL_Delay(200);
GPIOB->BSRR=LED1_Pin;
HAL_Delay(200);
GPIOB->BSRR=LED2_Pin;
HAL_Delay(200);
GPIOB->BSRR=LED3_Pin;
HAL_Delay(200);
GPIOB->BSRR=LED4_Pin;
HAL_Delay(200);
}

void luces3(uint16_t velosu,uint16_t veloba)
{
leds=0;//apaga
HAL_Delay(velosu);
GPIOB->BSRR=LED1_Pin;
HAL_Delay(velosu);
GPIOB->BSRR=LED2_Pin;
HAL_Delay(velosu);
GPIOB->BSRR=LED3_Pin;
HAL_Delay(velosu);
GPIOB->BSRR=LED4_Pin;
HAL_Delay(velosu);

//apaga sntido inverso
GPIOB->BSRR |=LED4_Pin<<16;
HAL_Delay(veloba);
GPIOB->BSRR |=LED3_Pin<<16;
HAL_Delay(veloba);
GPIOB->BSRR|=LED2_Pin<<16;
HAL_Delay(veloba);
GPIOB->BSRR |=LED1_Pin<<16;
HAL_Delay(veloba);

}

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

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
  /* USER CODE BEGIN 2 */

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	   HAL_GPIO_TogglePin(LED_GPIO_Port, LED_Pin);
	   HAL_Delay(500);
         luces1();
         luces3(200,100);
         luces3(100,200);
         luces3(80,500);



         chao();
	     chao();
	     baja();




	  /*
	   HAL_GPIO_WritePin(ADP_GPIO_Port, ADP_Pin, 0);
	   HAL_GPIO_WritePin(ADP_GPIO_Port, BDP_Pin, 1);
	   HAL_GPIO_WritePin(ADP_GPIO_Port, CDP_Pin, 1);
	   HAL_GPIO_WritePin(ADP_GPIO_Port, DDP_Pin, 0);
	   HAL_GPIO_WritePin(ADP_GPIO_Port, EDP_Pin, 0);
	   HAL_GPIO_WritePin(ADP_GPIO_Port, FDP_Pin, 0);
	   HAL_GPIO_WritePin(ADP_GPIO_Port, GDP_Pin, 0);
	   HAL_GPIO_WritePin(ADP_GPIO_Port, PDP_Pin, 0);
*/
	   //         PGFEDCBA
     // GPIOA->ODR=0B0000110;



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
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV2;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
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
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, ADP_Pin|BDP_Pin|CDP_Pin|DDP_Pin
                          |EDP_Pin|FDP_Pin|GDP_Pin|PDP_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, LED1_Pin|LED2_Pin|LED3_Pin|LED4_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : LED_Pin */
  GPIO_InitStruct.Pin = LED_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LED_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : ADP_Pin BDP_Pin CDP_Pin DDP_Pin
                           EDP_Pin FDP_Pin GDP_Pin PDP_Pin */
  GPIO_InitStruct.Pin = ADP_Pin|BDP_Pin|CDP_Pin|DDP_Pin
                          |EDP_Pin|FDP_Pin|GDP_Pin|PDP_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : LED1_Pin LED2_Pin LED3_Pin LED4_Pin */
  GPIO_InitStruct.Pin = LED1_Pin|LED2_Pin|LED3_Pin|LED4_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

}



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
