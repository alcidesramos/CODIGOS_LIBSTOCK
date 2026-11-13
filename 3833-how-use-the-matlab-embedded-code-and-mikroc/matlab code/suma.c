/*
 * File: suma.c
 *
 * Code generated for Simulink model 'suma'.
 *
 * Model version                  : 1.1
 * Simulink Coder version         : 9.3 (R2020a) 18-Nov-2019
 * C/C++ source code generated on : Sun Jul  5 00:16:40 2020
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Microchip->PIC18
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "suma.h"
#include "suma_private.h"

/* External inputs (root inport signals with default storage) */
ExtU_suma_T suma_U;

/* External outputs (root outports fed by signals with default storage) */
ExtY_suma_T suma_Y;

/* Real-time model */
RT_MODEL_suma_T suma_M_;
RT_MODEL_suma_T *const suma_M = &suma_M_;

/* Model step function */
void suma_step(void)
{
  /* Outport: '<Root>/salida' incorporates:
   *  Inport: '<Root>/dos'
   *  Inport: '<Root>/uno'
   *  Sum: '<Root>/Add'
   */
  suma_Y.salida = suma_U.uno + suma_U.dos;
}

/* Model initialize function */
void suma_initialize(void)
{
  /* (no initialization code required) */
}

/* Model terminate function */
void suma_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
