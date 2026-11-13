/*
 * PID.h
 *
 *  Created on: Nov 2, 2024
 *      Author: ALCIDES_RAMOS
 */

#ifndef SRC_LIBRERIAS_PID_H_
#define SRC_LIBRERIAS_PID_H_
#include "main.h"
#include "math.h"

#define PID_muestreo  20e-3  //define tiempo d emuestreo
//colocar cosntantes
#define PID_kp 310.36
#define PID_ki 254.74
#define PID_kd 2.96

#define  PID_SET 0
/*
#define PID_kp 2.0
#define PID_ki 0.0
#define PID_kd 0.0
*/

//colocar rango PID
#define PID_MAX  4200
#define  PID_MIN  0



//para poder usarlas en el main sin definir
extern float kp,ki,kd;
extern float error,up,ui,error_,ud,ut;
extern float setpoint;


float PID_Control(float pid_in);


/*

 */


#endif /* SRC_LIBRERIAS_PID_H_ */
