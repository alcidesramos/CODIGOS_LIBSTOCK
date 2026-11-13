/*
 * PWM_IN.C
 *
 *  Created on: Jul 20, 2023
 *      Author: alcides ramos
 */
/*  colocar variables en main
extern uint16_t frec1,frec2,frec3,frec4;
float frecuencia1,frecuencia2;


//iniciar
 Frec1_Init();

 //   y en el while
   frecuencia1=1000000/frec1;
    frecuencia2=1000000/frec4;

   //limpia las frecuecnia usadas;
   frec1=0;

  sprintf(texto,"frec1=%.1f    %.1f\r\n\r\n",frecuencia1,frecuencia2);
  uartx_write_text(&huart1, texto);
  HAL_Delay(1000);




//y en el archivo stm32f4xx_it.c debe quedar asi este procedimiento

void TIM1_CC_IRQHandler(void)
{

#include "Frecuencia.h"  //debe incluirlo
Frec1_Interrupt();
HAL_TIM_IRQHandler(&htim1);

  }
  */

#include "Frecuencia.h"


extern  TIM_HandleTypeDef htim1;
uint16_t cap1=0,cap2=0,cap3=0,cap4=0;
uint32_t frec1;
uint32_t frec1_1,frec1_2;
uint32_t frecmuestreo;

void  Frec1_Init()
{
	//inicia el TIM1_PWM_IN con interrupcion de flanco y canales desados
     // frecmuestreo=HAL_RCC_GetHCLKFreq()/((TIM1->PSC+1();//le el cristal pasa a us
	frecmuestreo=SystemCoreClock/((TIM1->PSC)+1);
	//frecmuestreo=(TIM1->PSC)+1;

	  HAL_TIM_IC_Start_IT(&htim1,TIM_CHANNEL_1);

}

//se debe incluir   #include "PWM_IN.h"  en la int
void Frec1_Interrupt()
{
	//SI EL EL CANAL 1
	if (__HAL_TIM_GET_FLAG(&htim1, TIM_FLAG_CC1) ==1)
	{

    	if (cap1 == 0)
		{
			//CONFIGURA FLANCO DE SUBIDA
			cap1=1;
			frec1_1 = TIM1->CCR1;

		}

		else if (cap1 == 1)
		{
					//CONFIGURA FLANCO DE SUBIDA
					cap1= 0;
					frec1_2 = TIM1->CCR1;

					if (frec1_2 > frec1_1)
					frec1 = (frec1_2 - frec1_1);
					else
     			    frec1 =(TIM1->ARR - frec1_1) + frec1_2;
		}

    	__HAL_TIM_CLEAR_FLAG(&htim1, TIM_FLAG_CC1);//limpia la bandera

	} //fin si es el canal 1


	}






//COLOCAR  LOS MISMOS PROCEDIMEINTOS PERO ASOCIADOS A OTROS TIMERS SI ES NECESRIO
