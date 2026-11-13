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
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
uint32_t pasos;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
//retardos usando el timer de debuuger
void delay_us_init()
{
	CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
    DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;
    pasos=( HAL_RCC_GetHCLKFreq()/1000000);//le el cristal pasa a us

}

//retardo por debbuger
void delay_us_dwt(uint32_t reta)
{

DWT->CYCCNT=0;
while( DWT->CYCCNT<=pasos*reta);//multiplica por us
}

void prueba()
{
    	parlante_GPIO_Port->BSRR=parlante_Pin;
		  delay_us_dwt(10);
		  //parlante_GPIO_Port->BRR=parlante_Pin;
		  parlante_GPIO_Port->BSRR=parlante_Pin<<16;
		  delay_us_dwt(10);

		  parlante_GPIO_Port->BSRR=parlante_Pin;
		  		  delay_us_dwt(10);
		  		  //parlante_GPIO_Port->BRR=parlante_Pin;
		  		  parlante_GPIO_Port->BSRR=parlante_Pin<<16;
		  		  delay_us_dwt(10);

		  		  parlante_GPIO_Port->BSRR=parlante_Pin;
				  delay_us_dwt(10);
				  //parlante_GPIO_Port->BRR=parlante_Pin;
				  parlante_GPIO_Port->BSRR=parlante_Pin<<16;
				  delay_us_dwt(10);
}


void Sound_play(uint32_t frec,uint32_t dura)
{
	uint32_t dela=500000/frec;//  la mitad de un mega
	uint32_t  repe=frec*dura/1000;// calcula cuantas veces se repite

		while(repe--)
	  {
	  parlante_GPIO_Port->BSRR=parlante_Pin;
	  delay_us_dwt(dela);
	  //parlante_GPIO_Port->BRR=parlante_Pin;
	  parlante_GPIO_Port->BSRR=parlante_Pin<<16;
	  delay_us_dwt(dela);
      }

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
  /* USER CODE BEGIN 2 */
  delay_us_init();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  Sound_play(660, 100);
	  HAL_Delay(75);
	  Sound_play( 660, 100);
	  HAL_Delay(75);
	  Sound_play( 660, 100);
	  HAL_Delay(150);
	  Sound_play( 660, 100);
	  HAL_Delay(150);
	  Sound_play( 660, 100);
	  HAL_Delay(50);
	  Sound_play( 770, 100);
	  HAL_Delay(150);
	  Sound_play( 380, 100);
	  HAL_Delay(275);
	  Sound_play( 510, 100);
	  HAL_Delay(287);
	  Sound_play( 380, 100);
	  HAL_Delay(225);
	  Sound_play( 320, 100);
	  HAL_Delay(200);
	  Sound_play( 440, 100);
	  HAL_Delay(250);
	  Sound_play( 480, 80);
	  HAL_Delay(150);
	  Sound_play( 450, 100);
	  HAL_Delay(165);
	  Sound_play( 430, 100);
	  HAL_Delay(75);
	  Sound_play( 380, 100);
	  HAL_Delay(150);
	  Sound_play( 660, 80);
	  HAL_Delay(100);
	  Sound_play( 760, 50);
	  HAL_Delay(100);
	  Sound_play( 860, 100);
	  HAL_Delay(75);
	  Sound_play( 700, 80);
	  HAL_Delay(150);
	  Sound_play( 760, 50);
	  HAL_Delay(75);
	  Sound_play( 660, 80);
	  HAL_Delay(175);
	  Sound_play( 520, 80);
	  HAL_Delay(150);
	  Sound_play( 580, 80);
	  HAL_Delay(75);
	  Sound_play( 480, 80);
	  HAL_Delay(75);
	  Sound_play( 510, 100);
	  HAL_Delay(175);
	  Sound_play( 380, 100);
	  HAL_Delay(275);
	  Sound_play( 320, 100);
	  HAL_Delay(200);
	  Sound_play( 440, 100);
	  HAL_Delay(250);
	  Sound_play( 480, 80);
	  HAL_Delay(150);
	  Sound_play( 450, 100);
	  HAL_Delay(165);
	  Sound_play( 430, 100);
	  HAL_Delay(75);
	  Sound_play( 380, 100);
	  HAL_Delay(150);
	  Sound_play( 660, 80);
	  HAL_Delay(100);
	  Sound_play( 760, 50);
	  HAL_Delay(100);
	  Sound_play(860,100);
	  HAL_Delay(75);
	  Sound_play(700,80);
	  HAL_Delay(150);
	  Sound_play(760,50);
	  HAL_Delay(75);
	  Sound_play(660,80);
	  HAL_Delay(175);
	  Sound_play(520,80);
	  HAL_Delay(150);
	  Sound_play(580,80);
	  HAL_Delay(75);
	  Sound_play(480,80);
	  HAL_Delay(75);
	  Sound_play(500,100);
	  HAL_Delay(250);
	  Sound_play(760,100);
	  HAL_Delay(150);
	  Sound_play(720,100);
	  HAL_Delay(50);
	  Sound_play(680,100);
	  HAL_Delay(75);
	  Sound_play(620,150);
	  HAL_Delay(75);
	  Sound_play(650,150);
	  HAL_Delay(150);
	  Sound_play(380,100);
	  HAL_Delay(150);
	  Sound_play(430,100);
	  HAL_Delay(75);
	  Sound_play(500,100);
	  HAL_Delay(75);
	  Sound_play(430,100);
	  HAL_Delay(150);
	  Sound_play(500,100);
	  HAL_Delay(75);
	  HAL_Delay(2000);





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

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV2;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
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
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(parlante_GPIO_Port, parlante_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : parlante_Pin */
  GPIO_InitStruct.Pin = parlante_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(parlante_GPIO_Port, &GPIO_InitStruct);

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
