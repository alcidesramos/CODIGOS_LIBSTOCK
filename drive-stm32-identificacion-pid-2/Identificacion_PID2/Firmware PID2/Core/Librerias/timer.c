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
#include "PID.h"
#include "uart.h"


#ifndef LIBRERIAS_TIMER_H_
#define LIBRERIAS_TIMER_H_
extern uint16_t codigo;
extern ADC_HandleTypeDef hadc1;
extern UART_HandleTypeDef huart1;

extern float frecuencia1;
extern float RPM;
extern float salida;
extern char texto[];

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	//mira si el timer desead
	 if (htim->Instance == TIM_INT)
	 {
  HAL_GPIO_TogglePin(Led_GPIO_Port, Led_Pin);
		 if (FREC1.frec_leida==0) frecuencia1=0;
		 	 	else
		 	 	frecuencia1=FREC1.frec_muestreo/FREC1.frec_leida;
		        RPM=frecuencia1*60/750;// 60/(48*131);
		        //coloca la leida en cero apra otra lectura
		 	 	FREC1.frec_leida=0;
		 	 	setpoint=ADC_Read(&hadc1)*222.0/4095.0;
		// 	float entrada =map(setpoint,0,222.0,0,4200);
               PID_Control(RPM);
		 	   PWM_valor(&PWM1,ut);

      //osciloscopio serial

	//sprintf(texto,"%.1f,%.1f\r",entrada,RPM);
	//uartx_write_text(&huart1, texto);

		 	  	  //para teleplot
		 	  //	sprintf(texto,">IN:%.1f\n",RPM);
		 	  	//uartx_write_text(&huart1, texto);


		 	  sprintf(texto,">SP:%.1f\n",setpoint);
		 	 uartx_write_text(&huart1, texto);

		 	   sprintf(texto,">OUT:%.1f\n",RPM);
				  uartx_write_text(&huart1, texto);



	 }
  /* Prevent unused argument(s) compilation warning */
  UNUSED(htim);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_TIM_PeriodElapsedCallback could be implemented in the user file
   */
}


#endif /* LIBRERIAS_TIMER_H_ */
