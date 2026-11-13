/*
 * extint.c
 *
 *  Created on: May 2, 2023
 *      Author: Alcides Ramos
 */


#include "main.h"

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	HAL_GPIO_TogglePin(led3_GPIO_Port, led3_Pin);
  /* Prevent unused argument(s) compilation warning */
  UNUSED(GPIO_Pin);
  /* NOTE: This function Should not be modified, when the callback is needed,
           the HAL_GPIO_EXTI_Callback could be implemented in the user file
   */
}

