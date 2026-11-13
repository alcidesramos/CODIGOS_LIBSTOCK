/*
 * PWM.H
 *
 *  Created on: Apr 8, 2023
 *      Author: Alcides Ramos
 */

#include "main.h"

#ifndef LIBRERIAS_PWM_H_
#define LIBRERIAS_PWM_H_

//info relacionada a los servos


#define PWMT	 htim2   // timer usado
#define PWMTIM 	 TIM2  //registro timar usado


//canales pwm a usar

///pwm1
#define PWM1_CH     TIM_CHANNEL_1   //canal de pwm1
#define PWM1 		PWMTIM->CCR1  //registro del timer usado y canal

///pwm2
#define PWM2_CH 	TIM_CHANNEL_2  //canal pwm2
#define PWW2 		PWMTIM->CCR2  //registro cilco util canal2 y



void PWM_init(TIM_HandleTypeDef *serv,uint16_t canal);
void pwm_valor(uint32_t *canal,float valor);



#endif /* LIBRERIAS_PWM_H_ */
