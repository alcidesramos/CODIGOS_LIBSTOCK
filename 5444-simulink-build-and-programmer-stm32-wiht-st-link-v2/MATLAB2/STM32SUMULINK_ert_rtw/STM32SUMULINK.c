/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: STM32SUMULINK.c
 *
 * Code generated for Simulink model 'STM32SUMULINK'.
 *
 * Model version                  : 1.0
 * Simulink Coder version         : 9.9 (R2023a) 19-Nov-2022
 * C/C++ source code generated on : Mon Aug 28 09:46:37 2023
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "STM32SUMULINK.h"
#include "rtwtypes.h"

/* Block states (default storage) */
DW_STM32SUMULINK_T STM32SUMULINK_DW;

/* Real-time model */
static RT_MODEL_STM32SUMULINK_T STM32SUMULINK_M_;
RT_MODEL_STM32SUMULINK_T *const STM32SUMULINK_M = &STM32SUMULINK_M_;

/* Model step function */
void STM32SUMULINK_step(void)
{
  GPIO_TypeDef * portNameLoc;
  real_T rtb_PulseGenerator;
  int32_T pinWriteLoc;

  /* DiscretePulseGenerator: '<Root>/Pulse Generator' */
  rtb_PulseGenerator = (STM32SUMULINK_DW.clockTickCounter <
                        STM32SUMULINK_P.PulseGenerator_Duty) &&
    (STM32SUMULINK_DW.clockTickCounter >= 0) ?
    STM32SUMULINK_P.PulseGenerator_Amp : 0.0;
  if (STM32SUMULINK_DW.clockTickCounter >= STM32SUMULINK_P.PulseGenerator_Period
      - 1.0) {
    STM32SUMULINK_DW.clockTickCounter = 0;
  } else {
    STM32SUMULINK_DW.clockTickCounter++;
  }

  /* End of DiscretePulseGenerator: '<Root>/Pulse Generator' */

  /* MATLABSystem: '<S3>/Digital Port Write' */
  portNameLoc = GPIOC;
  if (rtb_PulseGenerator != 0.0) {
    pinWriteLoc = 8192;
  } else {
    pinWriteLoc = 0;
  }

  LL_GPIO_SetOutputPin(portNameLoc, (uint32_T)pinWriteLoc);
  LL_GPIO_ResetOutputPin(portNameLoc, ~(uint32_T)pinWriteLoc & 8192U);

  /* End of MATLABSystem: '<S3>/Digital Port Write' */
}

/* Model initialize function */
void STM32SUMULINK_initialize(void)
{
  /* (no initialization code required) */
}

/* Model terminate function */
void STM32SUMULINK_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
