/*
 * timer.h
 *
 *  Created on: May 1, 2025
 *      Author: ALCIDES_RAMOS
 */
//DEFINA TIMER A USAR
#define TIM_INT  TIM3

#include "main.h"
#include "PID.h"
#include "adc_x.h"
#include "PWMB.h"

#ifndef LIBRERIAS_TIMER_H_
#define LIBRERIAS_TIMER_H_
extern uint16_t codigo;
extern float voltaje;
extern float setpoint;


void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	//mira si el timer desead
	 if (htim->Instance == TIM_INT)
	 {

 // HAL_GPIO_TogglePin(led_GPIO_Port, led_Pin);
		 ADC_Read_DMA(&hadc1);
			  float volt=adc_codigo[0]*3.3/4095.0;
			  voltaje=volt*8.1439;
		      setpoint=adc_codigo[1]*21/4095.0;
		      PID_Control(voltaje);
		     PWM_valor(&PWM1, ut);



	 }
  /* Prevent unused argument(s) compilation warning */
  UNUSED(htim);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_TIM_PeriodElapsedCallback could be implemented in the user file
   */
}


#endif /* LIBRERIAS_TIMER_H_ */
