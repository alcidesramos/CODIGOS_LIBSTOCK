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

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
uint32_t a;

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

   //ACTIVO EL CONTADOR PARA DEBBUGER
      CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
       DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

   GPIOB->ODR=0x0f0f;
   HAL_Delay(1000);

   while (1)
  {  // encender un led

       DWT->CYCCNT=0;  //LIMPI EL CONTADOR
     //  HAL_GPIO_TogglePin(B5_GPIO_Port, B5_Pin);// 46 cicLo
      // HAL_Delay(200);

/*
       //afectando otros bit
         DWT->CYCCNT=0;  //LIMPI EL CONTADOR
         GPIOB->ODR=1<<5; // 4 CICLO
         HAL_Delay(100);
         DWT->CYCCNT=0;  //LIMPI EL CONTADOR
         B5_GPIO_Port->ODR=0;    //4 CICLO
         HAL_Delay(100);
*/

/*
       //afectando otros bit
       DWT->CYCCNT=0;  //LIMPI EL CONTADOR
       B5_GPIO_Port->ODR=B5_Pin; // 4 CICLO
       HAL_Delay(100);
       B5_GPIO_Port->ODR=0;    //4 CICLO
       HAL_Delay(100);
*/


/*
    //sin afectar otro bit usando xor
      DWT->CYCCNT=0;
       GPIOB->ODR= GPIOB->ODR ^ B5_Pin; // 11 CICLO
      HAL_Delay(200);
    // GPIOB->ODR^=B5_Pin;  // 11 CICLOS
*/


/*
   	 //SIN AFECTAR otro bit forma atomica

        DWT->CYCCNT=0;  //LIMPI EL CONTADOR
          GPIOB->BSRR=B5_Pin;
           HAL_Delay(100);
           DWT->CYCCNT=0;  //LIMPI EL CONTADOR
           B5_GPIO_Port->BRR=B5_Pin;
           HAL_Delay(100);
*/



    /*   // FORMA ATOMICA USANDO SOLO REGISTRO BSRR
	      GPIOB->BSRR=B5_Pin;//coloca 1
	      //GPIOB->BSRR=1<<5;
		  HAL_Delay(100);
		  GPIOB->BSRR=B5_Pin<<16;//COLOCA EL CERO
		  //  GPIOB->BSRR=1<<(16+5);//  si va a coloca cero lo desplaza 16 veces + el bit deseasdo
		  HAL_Delay(100);
*/


//  COLOCAR UN BIT ESPECIFICO EN UNO  (15)

		  //MODO ATOMICO
	 // B15_GPIO_Port->BSRR=B15_Pin;


		   //NO ATOMICO

		  //B15_GPIO_Port->ODR |=B15_Pin;
	//	  GPIOB->ODR |=1<<15;

         //colocar un bit en cero  (11)
		   //MODO ATOMICO
//			B11_GPIO_Port->BRR=B11_Pin;


		  //no atpmica
		//   GPIOB->ODR &=~(1<<11);

		  //INVERTIR UN BIT (14)
		  //GPIOB->ODR ^=1<<14;





       // CARGA DE UN DATO FORMA ATOMICA
          a=0B10101010101010101;
          DWT->CYCCNT=0;  //LIMPI EL CONTADOR
          GPIOB->BSRR=a|(~a<<16);///14 ciclos cargar un dato de forma atomica
         // DWT->CYCCNT=0;  //LIMPI EL CONTADOR





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
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
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
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, B0_Pin|B1_Pin|B2_Pin|B10_Pin
                          |B11_Pin|B12_Pin|B13_Pin|B14_Pin
                          |B15_Pin|B3_Pin|B4_Pin|B5_Pin
                          |B6_Pin|B7_Pin|B8_Pin|B9_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : B0_Pin B1_Pin B2_Pin B10_Pin
                           B11_Pin B12_Pin B13_Pin B14_Pin
                           B15_Pin B3_Pin B4_Pin B5_Pin
                           B6_Pin B7_Pin B8_Pin B9_Pin */
  GPIO_InitStruct.Pin = B0_Pin|B1_Pin|B2_Pin|B10_Pin
                          |B11_Pin|B12_Pin|B13_Pin|B14_Pin
                          |B15_Pin|B3_Pin|B4_Pin|B5_Pin
                          |B6_Pin|B7_Pin|B8_Pin|B9_Pin;
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
