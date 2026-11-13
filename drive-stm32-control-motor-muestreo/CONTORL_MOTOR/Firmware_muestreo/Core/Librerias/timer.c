/*
 * timer.h
 *
 *  Created on: May 1, 2025
 *      Author: ALCIDES_RAMOS
 */
//DEFINA TIMER A USAR
#define TIM_INT  TIM3

#include "main.h"
#include "Frecuencia.h"
#include "PWMB.h"
#include "adc_x.h"
#include "MAP_.h"

#ifndef LIBRERIAS_TIMER_H_
#define LIBRERIAS_TIMER_H_
extern uint16_t codigo;
extern ADC_HandleTypeDef hadc1;
extern float frecuencia1;

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	//mira si el timer desead
	 if (htim->Instance == TIM_INT)
	 {
  HAL_GPIO_TogglePin(Led_GPIO_Port, Led_Pin);
		 if (FREC1.frec_leida==0) frecuencia1=0;
		 	 	else
		 	 	frecuencia1=FREC1.frec_muestreo/FREC1.frec_leida;
		 	 //coloca la leida en cero apra otra lectura
		 	 	FREC1.frec_leida=0;
		 	  codigo=ADC_Read(&hadc1);
		 	  codigo =map(codigo,0,4095,1300,4200);
		 	  PID_Control(codigo);
		 	  	  PWM_valor(&PWM1,codigo);




	 }
  /* Prevent unused argument(s) compilation warning */
  UNUSED(htim);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_TIM_PeriodElapsedCallback could be implemented in the user file
   */
}


#endif /* LIBRERIAS_TIMER_H_ */
