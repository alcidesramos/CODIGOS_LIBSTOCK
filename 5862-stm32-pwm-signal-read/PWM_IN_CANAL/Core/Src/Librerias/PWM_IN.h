/*
 * PWM_IN.H
 *
 *  Created on: Dec 25, 2024
 *      Author: ALCIDES_RAMOS
 */

//como se usa

/*
 en el  PWM_IN.c
 incluya los timer a usar
 extern TIM_HandleTypeDef htim1;

 configure cada entrada de trecuencia
 //configura entradas de PWM_INuencia a usar timer y canal
PWM_INS PWM_IN1 = {&htim1, &(TIM1->CCR1),TIM_CHANNEL_1,TIM_FLAG_CC1};


 */

/*
 en el archivo  de inetrrupcion.c
 incluya
#include "PWM_IN.h"
en cada interrupcion del timer analice el canal o canales deseado
    	 PWM_IN_INT_Analiza(&PWM_IN1);
     	PWM_IN_INT_Analiza(&PWM_IN2);

 */

/*
 en el main.c
 //incluya  PWM_IN.h
   #include "PWM_IN.h"

 antes del while inicie los modulos de PWM_INuencia
  PWM_IN_init(&PWM_IN1);
  PWM_IN_init(&PWM_IN2);

 //en el  while  declare las varibles de pulso a usar
  uint32_t pulso1,pulso2,pulso3;

 //lea los ancho de pulso
 pulso1=PWM_IN1.pulso;
	  pulso2=PWM_IN2.pulso;
	  pulso3=PWM_IN3.pulso;

	  //limpia los pulso por si no se dan inetrrpciones
	  PWM_IN1.pulso=0;
	  PWM_IN2.pulso=0;
	  PWM_IN3.pulso=0;



 */
#ifndef LIBRERIAS_PWM_IN_
#define LIBRERIAS_PWM_IN_

#include "main.h"


//estructura de PWM_IN
typedef struct {
    TIM_HandleTypeDef *htim;
    volatile uint32_t *ccr;
    uint32_t channel;
    uint32_t PWM_IN_flag;
    uint32_t pulso,pulso_s,pulso_b;
    uint8_t caida;

} PWM_INS;


//canales PWM_IN a usar
extern PWM_INS PWM_IN1;
extern PWM_INS PWM_IN2;
extern PWM_INS PWM_IN3;
extern PWM_INS PWM_IN4;
extern PWM_INS PWM_IN5;
extern PWM_INS PWM_IN6;
extern PWM_INS PWM_IN7;
extern PWM_INS PWM_IN8;
extern PWM_INS PWM_IN9;
extern PWM_INS PWM_IN10;
extern PWM_INS PWM_IN11;
extern PWM_INS PWM_IN12;
extern PWM_INS PWM_IN13;
extern PWM_INS PWM_IN14;
extern PWM_INS PWM_IN15;
extern PWM_INS PWM_IN16;
extern PWM_INS PWM_IN17;
extern PWM_INS PWM_IN18;
extern PWM_INS PWM_IN19;
extern PWM_INS PWM_IN20;

void PWM_IN_init(PWM_INS *PWM_IN);
void PWM_IN_INT_Analiza(PWM_INS *PWM_IN);
void PWM_IN_Interrupt();
#endif /* LIBRERIAS_PWM_INUENCIA_H_ */
