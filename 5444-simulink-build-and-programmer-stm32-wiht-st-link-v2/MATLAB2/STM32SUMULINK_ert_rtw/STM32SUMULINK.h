/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: STM32SUMULINK.h
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

#ifndef RTW_HEADER_STM32SUMULINK_h_
#define RTW_HEADER_STM32SUMULINK_h_
#ifndef STM32SUMULINK_COMMON_INCLUDES_
#define STM32SUMULINK_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "main.h"
#endif                                 /* STM32SUMULINK_COMMON_INCLUDES_ */

#include "STM32SUMULINK_types.h"
#include <stddef.h>
#include "MW_target_hardware_resources.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

/* Block states (default storage) for system '<Root>' */
typedef struct {
  int32_T clockTickCounter;            /* '<Root>/Pulse Generator' */
} DW_STM32SUMULINK_T;

/* Parameters (default storage) */
struct P_STM32SUMULINK_T_ {
  real_T PulseGenerator_Amp;           /* Expression: 1
                                        * Referenced by: '<Root>/Pulse Generator'
                                        */
  real_T PulseGenerator_Period;     /* Computed Parameter: PulseGenerator_Period
                                     * Referenced by: '<Root>/Pulse Generator'
                                     */
  real_T PulseGenerator_Duty;         /* Computed Parameter: PulseGenerator_Duty
                                       * Referenced by: '<Root>/Pulse Generator'
                                       */
  real_T PulseGenerator_PhaseDelay;    /* Expression: 0
                                        * Referenced by: '<Root>/Pulse Generator'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_STM32SUMULINK_T {
  const char_T * volatile errorStatus;
};

/* Block parameters (default storage) */
extern P_STM32SUMULINK_T STM32SUMULINK_P;

/* Block states (default storage) */
extern DW_STM32SUMULINK_T STM32SUMULINK_DW;

/* Model entry point functions */
extern void STM32SUMULINK_initialize(void);
extern void STM32SUMULINK_step(void);
extern void STM32SUMULINK_terminate(void);

/* Real-time Model object */
extern RT_MODEL_STM32SUMULINK_T *const STM32SUMULINK_M;
extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'STM32SUMULINK'
 * '<S1>'   : 'STM32SUMULINK/Digital Port Write'
 * '<S2>'   : 'STM32SUMULINK/Digital Port Write/ECSoC'
 * '<S3>'   : 'STM32SUMULINK/Digital Port Write/ECSoC/ECSimCodegen'
 */
#endif                                 /* RTW_HEADER_STM32SUMULINK_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
