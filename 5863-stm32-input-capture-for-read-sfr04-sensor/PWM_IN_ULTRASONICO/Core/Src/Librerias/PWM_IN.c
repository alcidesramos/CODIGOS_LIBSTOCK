/*
 * PWM_INUENCIA.C
 *
 *  Created on: Dec 25, 2024
 *      Author: ALCIDES_RAMOS
 */


#include <PWM_IN.h>

//incluir los timer usados
extern TIM_HandleTypeDef htim1;
extern TIM_HandleTypeDef htim2;


//configura entradas de PWM_INuencia a usar
PWM_INS PWM_IN1 = {&htim1, &(TIM1->CCR1),TIM_CHANNEL_1,TIM_FLAG_CC1};
PWM_INS PWM_IN2 = {&htim1, &(TIM1->CCR4),TIM_CHANNEL_4,TIM_FLAG_CC4};
PWM_INS PWM_IN3 = {&htim2, &(TIM2->CCR1),TIM_CHANNEL_1,TIM_FLAG_CC1};


void PWM_IN_init(PWM_INS *PWM_IN)
{
	PWM_IN->caida=1;//inicia promera lectira en cero
    HAL_TIM_IC_Start_IT(PWM_IN->htim, PWM_IN->channel);
}

//analiza si la interrpcion d ePWM_INuancia deseada se da
void PWM_IN_INT_Analiza(PWM_INS *PWM_IN)
{
	//  si la bandera del canal x del timer seleccionado esta activo
		if (__HAL_TIM_GET_FLAG(PWM_IN->htim, PWM_IN->PWM_IN_flag) ==1)
			{

			//si el flanco es de subida
					if (PWM_IN->caida == 1) {
						//CONFIGURA FLANCO DE SUBIDA
						__HAL_TIM_SET_CAPTUREPOLARITY(PWM_IN->htim, PWM_IN->channel,TIM_INPUTCHANNELPOLARITY_FALLING);
						PWM_IN->caida = 0;
						PWM_IN->pulso_s = *PWM_IN->ccr;//lee el contador;

					} //si

					//si capturo el flaco de bajada
					else {
						__HAL_TIM_SET_CAPTUREPOLARITY(PWM_IN->htim, PWM_IN->channel,TIM_INPUTCHANNELPOLARITY_RISING);
						PWM_IN->caida = 1;
						PWM_IN->pulso_b = *PWM_IN->ccr;//lee el contador;
						if (PWM_IN->pulso_b > PWM_IN->pulso_s)
							PWM_IN->pulso = (PWM_IN->pulso_b - PWM_IN->pulso_s);
						else
							PWM_IN->pulso = (PWM_IN->htim->Instance->ARR - PWM_IN->pulso_s) + PWM_IN->pulso_b;
					} //Fin else


	    		   	__HAL_TIM_CLEAR_FLAG(PWM_IN->htim, PWM_IN->PWM_IN_flag);//limpia la bandera


			}//fin if


}
void PWM_IN_Interrupt()
{
	//llama las PWM_INuancia deseadas a analizar
	// PWM_IN_INT_Analiza(&PWM_IN1);
    // PWM_IN_INT_Analiza(&PWM_IN2);


}


