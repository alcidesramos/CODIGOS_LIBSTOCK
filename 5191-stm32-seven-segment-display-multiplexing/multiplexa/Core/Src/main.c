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
  *
\\  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
//#define display disport_GPIO_Port->ODR  //con registro

#define display disport_GPIO_Port->BSRR  //FORMA  ATOMICA


#define habilita  H1_GPIO_Port->BSRR
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
void display_dato(uint32_t dato)

{    dato=dato&0x000000ff;// toma solo la parte baja

    display=dato|(~dato<<16);
}

void apagatodo()
{
    // habilita=H1_Pin |H2_Pin |H3_Pin |H4_Pin;  //  CATODO SI APAGA CON 1
	 habilita=(H1_Pin |H2_Pin |H3_Pin |H4_Pin)<<16;  //ANODO SI APAGA CON CERO

}

void catodo_ODR()
{
	  apagatodo();
 	    display=0x76;//H  SACA DATO DESEADO modifica todo el puerto
 	 // display_dato(0x76);//H Saca el dato en forma atomica no modifica otros pines
 	//  habilita= H1_Pin;//si se habilita con 1
    	habilita=H1_Pin<<16;//si se habilita con 0
 //	  habilita= H1_Pin<<16 |(H2_Pin|H3_Pin|H4_Pin);//si se habilita con cero mismo GPIO
  	  HAL_Delay(5);//retardo de visualizacion

	  apagatodo();
	   display=0x3f;//O  SACA DATO DESEADO modifica todo el puerto
  	  //display_dato(0x3F);//H Saca el dato en forma atomica no modifica otros pines
  	// habilita= H2_Pin;//si se habilita con 1
	 habilita= H2_Pin<<16;//si se habilita con 0
  	//  habilita= H1_Pin|H3_Pin|H4_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion


   	  apagatodo();
	   display=0x38;//L  SACA DATO DESEADO modifica todo el puerto
  	  //display_dato(0x38);//H Saca el dato en forma atomica no modifica otros pines
  	// habilita= H3_Pin;//si se habilita con 1
	 habilita= H3_Pin<<16;//si se habilita con 0
  	//  habilita= H1_Pin|H2_Pin|H4_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion

	  apagatodo();
	  display=0x77;//A  SACA DATO DESEADO modifica todo el puerto
  	 // display_dato(0x77);//H Saca el dato en forma atomica no modifica otros pines
  	// habilita= H4_Pin;//si se habilita con 1
	  habilita= H4_Pin<<16;//si se habilita con 0
  	  //habilita= H1_Pin|H2_Pin|H3_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion

}

void catodo_ATO()
{
	  apagatodo();
 	    //display=0x76;//H  SACA DATO DESEADO modifica todo el puerto
 	  display_dato(0x76);//H Saca el dato en forma atomica no modifica otros pines
 	//  habilita= H1_Pin;//si se habilita con 1
    	habilita=H1_Pin<<16;//si se habilita con 0
 //	  habilita= H1_Pin<<16 |(H2_Pin|H3_Pin|H4_Pin);//si se habilita con cero mismo GPIO
  	  HAL_Delay(5);//retardo de visualizacion

	  apagatodo();
	 //  display=0x3f;//O  SACA DATO DESEADO modifica todo el puerto
  	 display_dato(0x3F);//H Saca el dato en forma atomica no modifica otros pines
  	// habilita= H2_Pin;//si se habilita con 1
	 habilita= H2_Pin<<16;//si se habilita con 0
  	//  habilita= H1_Pin|H3_Pin|H4_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion


   	  apagatodo();
	 //  display=0x38;//L  SACA DATO DESEADO modifica todo el puerto
  	  display_dato(0x38);//H Saca el dato en forma atomica no modifica otros pines
  	// habilita= H3_Pin;//si se habilita con 1
	 habilita= H3_Pin<<16;//si se habilita con 0
  	//  habilita= H1_Pin|H2_Pin|H4_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion

	  apagatodo();
	  //display=0x77;//A  SACA DATO DESEADO modifica todo el puerto
  	  display_dato(0x77);//H Saca el dato en forma atomica no modifica otros pines
  	// habilita= H4_Pin;//si se habilita con 1
	  habilita= H4_Pin<<16;//si se habilita con 0
  	  //habilita= H1_Pin|H2_Pin|H3_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion

}

void catodo_ATO_port()
{

        	  apagatodo();
		   	   // display=0x76;//H  SACA DATO DESEADO modifica todo el puerto
		   	  display_dato(0x76);//H Saca el dato en forma atomica no modifica otros pines
		   	//  habilita= H1_Pin;//si se habilita con 1
		//	   	habilita= H1_Pin<<16>;//si se habilita con 0
		   	  habilita= H1_Pin<<16 |(H2_Pin|H3_Pin|H4_Pin);//si se habilita con cero mismo GPIO
	 	   	  HAL_Delay(5);//retardo de visualizacion

	 		  apagatodo();
	   	   // display=0x3f;//O  SACA DATO DESEADO modifica todo el puerto
     	   	  display_dato(0x3F);//H Saca el dato en forma atomica no modifica otros pines
	 	   	// habilita= H2_Pin;//si se habilita con 1
	 		// habilita= H2_Pin<<16;//si se habilita con 0
     	   	 habilita= H2_Pin<<16 |(H1_Pin|H3_Pin|H4_Pin);//si se habilita con cero mismo GPIO
	  	   	  HAL_Delay(5);//retardo de visualizacion


	  	   	  apagatodo();
	   	   // display=0x38;//L  SACA DATO DESEADO modifica todo el puerto
     	   	  display_dato(0x38);//H Saca el dato en forma atomica no modifica otros pines
	 	   	// habilita= H3_Pin;//si se habilita con 1
	 		// habilita= H3_Pin<<16;//si se habilita con 0
     	   	 habilita= H3_Pin<<16 |(H1_Pin|H2_Pin|H4_Pin);//si se habilita con cero mismo GPIO
	  	   	  HAL_Delay(5);//retardo de visualizacion

	 		  apagatodo();
	   	   // display=0x77;//A  SACA DATO DESEADO modifica todo el puerto
     	   	  display_dato(0x77);//H Saca el dato en forma atomica no modifica otros pines
	 	   	// habilita= H4_Pin;//si se habilita con 1
	 		// habilita= H4_Pin<<16;//si se habilita con 0
     	   	 habilita= H4_Pin<<16 |(H1_Pin|H2_Pin|H3_Pin);//si se habilita con cero mismo GPIO
	  	   	  HAL_Delay(5);//retardo de visualizacion
}




void catodo_ATO_port_REAL()
{

        	  apagatodo();
		   	   // display=0x76;//H  SACA DATO DESEADO modifica todo el puerto
		   	  display_dato(0x76);//H Saca el dato en forma atomica no modifica otros pines
		   	//  habilita= H1_Pin;//si se habilita con 1
		//	   	habilita= H1_Pin<<16>;//si se habilita con 0
		   	  habilita= H1_Pin;//si se habilita con cero mismo GPIO
	 	   	  HAL_Delay(5);//retardo de visualizacion

	 		  apagatodo();
	   	   // display=0x3f;//O  SACA DATO DESEADO modifica todo el puerto
     	   	  display_dato(0x3F);//H Saca el dato en forma atomica no modifica otros pines
	 	   	// habilita= H2_Pin;//si se habilita con 1
	 		// habilita= H2_Pin<<16;//si se habilita con 0
     	   	 habilita= H2_Pin;//si se habilita con cero mismo GPIO
	  	   	  HAL_Delay(5);//retardo de visualizacion


	  	   	  apagatodo();
	   	   // display=0x38;//L  SACA DATO DESEADO modifica todo el puerto
     	   	  display_dato(0x38);//H Saca el dato en forma atomica no modifica otros pines
	 	   	// habilita= H3_Pin;//si se habilita con 1
	 		// habilita= H3_Pin<<16;//si se habilita con 0
     	   	 habilita= H3_Pin;//si se habilita con cero mismo GPIO
	  	   	  HAL_Delay(5);//retardo de visualizacion

	 		  apagatodo();
	   	   // display=0x77;//A  SACA DATO DESEADO modifica todo el puerto
     	   	  display_dato(0x77);//H Saca el dato en forma atomica no modifica otros pines
	 	   	// habilita= H4_Pin;//si se habilita con 1
	 		// habilita= H4_Pin<<16;//si se habilita con 0
     	   	 habilita= H4_Pin;//si se habilita con cero mismo GPIO
	  	   	  HAL_Delay(5);//retardo de visualizacion
}


void anodo_ODR()
{
     	 apagatodo();
	 	  display=~0x76;//H  SACA DATO DESEADO modifica todo el puerto
	 	  //display_dato(~0x76);//H Saca el dato en forma atomica no modifica otros pines
	 	  habilita= H1_Pin;//si se habilita con 1
	    //	habilita=H1_Pin<<16;//si se habilita con 0
	 //	  habilita= H1_Pin<<16 |(H2_Pin|H3_Pin|H4_Pin);//si se habilita con cero mismo GPIO
	  	  HAL_Delay(5);//retardo de visualizacion

		  apagatodo();
		 display=~0x3f;//O  SACA DATO DESEADO modifica todo el puerto
	  	// display_dato(~0x3F);//H Saca el dato en forma atomica no modifica otros pines
	  	 habilita= H2_Pin;//si se habilita con 1
		// habilita= H2_Pin<<16;//si se habilita con 0
	  	//  habilita= H1_Pin|H3_Pin|H4_Pin;//si se habilita con cero mismo GPIO
	   	  HAL_Delay(5);//retardo de visualizacion


	   	  apagatodo();
		  display=~0x38;//L  SACA DATO DESEADO modifica todo el puerto
	  	//  display_dato(~0x38);//H Saca el dato en forma atomica no modifica otros pines
	  	 habilita= H3_Pin;//si se habilita con 1
		 //habilita= H3_Pin<<16;//si se habilita con 0
	  	//  habilita= H1_Pin|H2_Pin|H4_Pin;//si se habilita con cero mismo GPIO
	   	  HAL_Delay(5);//retardo de visualizacion

		  apagatodo();
		  display=~0x77;//A  SACA DATO DESEADO modifica todo el puerto
	  	  //display_dato(~0x77);//H Saca el dato en forma atomica no modifica otros pines
	  	 habilita= H4_Pin;//si se habilita con 1
		//  habilita= H4_Pin<<16;//si se habilita con 0
	  	  //habilita= H1_Pin|H2_Pin|H3_Pin;//si se habilita con cero mismo GPIO
	   	  HAL_Delay(5);//retardo de visualizacion

}


void anodo_ATO()
{
	  apagatodo();
 	    //display=~0x76;//H  SACA DATO DESEADO modifica todo el puerto
 	  display_dato(~0x76);//H Saca el dato en forma atomica no modifica otros pines
 	  habilita= H1_Pin;//si se habilita con 1
    //	habilita=H1_Pin<<16;//si se habilita con 0
 //	  habilita= H1_Pin<<16 |(H2_Pin|H3_Pin|H4_Pin);//si se habilita con cero mismo GPIO
  	  HAL_Delay(5);//retardo de visualizacion

	  apagatodo();
	 //  display=~0x3f;//O  SACA DATO DESEADO modifica todo el puerto
  	 display_dato(~0x3F);//H Saca el dato en forma atomica no modifica otros pines
  	 habilita= H2_Pin;//si se habilita con 1
	// habilita= H2_Pin<<16;//si se habilita con 0
  	//  habilita= H1_Pin|H3_Pin|H4_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion


   	  apagatodo();
	 //  display=~0x38;//L  SACA DATO DESEADO modifica todo el puerto
  	  display_dato(~0x38);//H Saca el dato en forma atomica no modifica otros pines
  	 habilita= H3_Pin;//si se habilita con 1
	 //habilita= H3_Pin<<16;//si se habilita con 0
  	//  habilita= H1_Pin|H2_Pin|H4_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion

	  apagatodo();
	  //display=~0x77;//A  SACA DATO DESEADO modifica todo el puerto
  	  display_dato(~0x77);//H Saca el dato en forma atomica no modifica otros pines
  	 habilita= H4_Pin;//si se habilita con 1
	//  habilita= H4_Pin<<16;//si se habilita con 0
  	  //habilita= H1_Pin|H2_Pin|H3_Pin;//si se habilita con cero mismo GPIO
   	  HAL_Delay(5);//retardo de visualizacion

}

void anodo_ATO_port()
{
	     apagatodo();
	   	   // display=0x76;//H  SACA DATO DESEADO modifica todo el puerto
	   	  display_dato(~0x76);//H Saca el dato en forma atomica no modifica otros pines
	   	//  habilita= H1_Pin;//si se habilita con 1
	   	  //habilita= H1_Pin<<16 |(H2_Pin|H3_Pin|H4_Pin);//si se habilita con cero forma atomico
			habilita= H1_Pin; // si se habilita con uno forma atomico
 	   	  HAL_Delay(5);//retardo de visualizacion


	        apagatodo();
	   	 // display=0x3F;//0  SACA DATO DESEADO modifica todo el puerto
	   	  display_dato(~0x3f);//0 Saca el dato en forma atomica no modifica otros pines
	   	  habilita= H2_Pin;//si se habilita con uno forma atomico
	   	//habilita|=H2_Pin<<16;//si se habilita con cero
	   	//  habilita= H2_Pin<<16 |(H1_Pin|H3_Pin|H4_Pin);//si se habilita con cero forma atomica
	   	  HAL_Delay(5);//retardo de visualizacion



	        apagatodo();
	   	 // display=0x38;//L  SACA DATO DESEADO modifica todo el puerto
	   	  display_dato(~0x38);//L  Saca el dato en forma atomica no modifica otros pines
	  	  habilita= H3_Pin;  //si se habilita con 1
	  	//habilita|=H3_Pin<<16;//si se habilita con cero
	  	  // habilita= H3_Pin<<16 |(H1_Pin|H2_Pin|H4_Pin);//si se habilita con cero forma atomica
	  	  HAL_Delay(5);//retardo de visualizacion

	     apagatodo();
	   	 //display=0x77;//A  SACA DATO DESEADO modificsa todo el puerto
	   	 display_dato(~0x77);//A  Saca el dato en forma atomica no modifica otros pines
	   	  habilita|= H4_Pin;  //si se habilita con 1
	   	 //   habilita|=H4_Pin<<16;//si se habilita con cero
	   //	 habilita= H4_Pin<<16 |(H1_Pin|H2_Pin|H3_Pin);//si se habilita con cero mismo puerto
	   	  HAL_Delay(5);//retardo de visualizacion


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

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */


  while (1)
  {
catodo_ATO_port_REAL();

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
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, disport_Pin|GPIO_PIN_1|GPIO_PIN_2|H4_Pin
                          |H3_Pin|H2_Pin|H1_Pin|GPIO_PIN_3
                          |GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7, GPIO_PIN_RESET);

  /*Configure GPIO pins : disport_Pin PB1 PB2 H4_Pin
                           H3_Pin H2_Pin H1_Pin PB3
                           PB4 PB5 PB6 PB7 */
  GPIO_InitStruct.Pin = disport_Pin|GPIO_PIN_1|GPIO_PIN_2|H4_Pin
                          |H3_Pin|H2_Pin|H1_Pin|GPIO_PIN_3
                          |GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7;
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
