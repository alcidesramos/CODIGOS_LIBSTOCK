/*
 * servos.c
 *
 *  Created on: Apr 8, 2023
 *      Author: Alcides Ramos
 */


#include "servos.h"


//incluir los timer usados
extern TIM_HandleTypeDef htim3;
extern TIM_HandleTypeDef htim4;


//Configurar Servos Usados
SERVOS SERVO1 = {&htim3, &(TIM3->CCR1),TIM_CHANNEL_1};
SERVOS SERVO2 = {&htim3, &(TIM3->CCR4),TIM_CHANNEL_4};
SERVOS SERVO3 = {&htim4, &(TIM4->CCR1),TIM_CHANNEL_1};




void   SERVO_init(SERVOS *servo)
{
HAL_TIM_PWM_Start(servo->htim, servo->channel);

}


void SERVO_ANG(SERVOS *servo,float posi)

{
     float calcu;
      calcu=(ser_lim_sup_ms - ser_lim_inf_ms) / (ser_sup - ser_inf);
	  calcu=calcu*(posi-ser_inf);
	  calcu=(calcu+ser_lim_inf_ms)*1000.0;// para pasarlo a microsegundo
	  *servo->ccr = calcu;

}


void SERVO_MICRO(SERVOS *servo,float micro)

{
     *servo->ccr = micro;
}


void SERVO_MILI(SERVOS *servo,float milis)

{
     float calcu;
      calcu=milis*1000.0;// para pasarlo a microsegundo
	  *servo->ccr = calcu;
}
