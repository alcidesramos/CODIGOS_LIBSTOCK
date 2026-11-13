/*
 * servos.c
 *
 *  Created on: Apr 8, 2023
 *      Author: Alcides Ramos
 */


#include "servos.h"

void  SERVO_init(TIM_HandleTypeDef *servo,uint16_t canal)
{

HAL_TIM_PWM_Start(servo, canal);

}



void SERVO_ANG(uint32_t *canal,float posi)

{
     float calcu;
      calcu=(ser_lim_sup_ms - ser_lim_inf_ms) / (ser_sup - ser_inf);
	  calcu=calcu*(posi-ser_inf);
	  calcu=(calcu+ser_lim_inf_ms)*1000.0;// para pasarlo a microsegundo
	  *canal=calcu;

}
