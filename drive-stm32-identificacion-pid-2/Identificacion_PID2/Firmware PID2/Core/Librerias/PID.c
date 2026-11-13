/*
 * PID.c
 *
 *  Created on: Nov 2, 2024
 *      Author: ALCIDES_RAMOS
 */


#include "PID.h"

//constantes pid
float t_mues=PID_muestreo;  //colocar el tiempo de muestro
float kp=PID_kp,ki=PID_ki,kd=PID_kd;
float setpoint=PID_SET;
//DEFINE RANGOS DE OPERACION DEL PID

float error,up,ui=0.0,error_=0.0,ud,ut;

float PID_Control(float pid_in)
 {

//  se coloca en 1 segundo pero se ajusta o siny¿toniza acorde a los datos obtenidos
//Calculando el error
  error=setpoint-pid_in;

     up=kp*error;    // salida proporcional

     ui+=ki*t_mues*error;      // Salida integral

     ud=kd*(error-error_)/(float)t_mues;  //salida derivativa

       ut=up+ui+ud;    // salida total

       //UBICA LA SALIDA EN LOS VALORES ADECUADOS
       if (ut>PID_MAX) ut=(float)PID_MAX;
       if (ut<PID_MIN) ut=(float)PID_MIN;

      error_=error;

    return(ut);
 }

