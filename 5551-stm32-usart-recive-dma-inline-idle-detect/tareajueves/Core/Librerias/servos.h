/*
 * servos.h
 *
 *  Created on: Apr 8, 2023
 *      Author: Alcides Ramos
 */

#ifndef LIBRERIAS_SERVOS_H_
#define LIBRERIAS_SERVOS_H_

#include "main.h"

//definiciones d elos servos


//TIMER
#define PWMTIM2 TIM2
#define PWMT2 htim2
//SERVO1

#define SERVO1_CH TIM_CHANNEL_3
#define SERVO1 TIM2->CCR3


//SERVO2
//#define SERVO2_CH TIM_CHANNEL_4
//#define SERVO2 TIM1->CCR4



//limites en  de los servos
#define ser_lim_inf_ms 	1.0
#define  ser_lim_sup_ms	2.0

//movimiento deseados del servo
#define  ser_inf		-90.0
#define  ser_sup 		90.0

void  SERVO_init(TIM_HandleTypeDef *servo,uint16_t canal);
void SERVO_ANG(uint32_t *canal,float posi);






#endif /* LIBRERIAS_SERVOS_H_ */
