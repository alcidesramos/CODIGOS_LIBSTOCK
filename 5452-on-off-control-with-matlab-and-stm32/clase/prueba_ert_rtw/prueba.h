/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: prueba.h
 *
 * Code generated for Simulink model 'prueba'.
 *
 * Model version                  : 1.1
 * Simulink Coder version         : 9.9 (R2023a) 19-Nov-2022
 * C/C++ source code generated on : Wed Sep  6 11:09:00 2023
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_prueba_h_
#define RTW_HEADER_prueba_h_
#ifndef prueba_COMMON_INCLUDES_
#define prueba_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "main.h"
#include "stm_uart.h"
#endif                                 /* prueba_COMMON_INCLUDES_ */

#include "prueba_types.h"
#include <stddef.h>
#include "MW_target_hardware_resources.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmStepTask
#define rtmStepTask(rtm, idx)          ((rtm)->Timing.TaskCounters.TID[(idx)] == 0)
#endif

#ifndef rtmTaskCounter
#define rtmTaskCounter(rtm, idx)       ((rtm)->Timing.TaskCounters.TID[(idx)])
#endif

/* Block states (default storage) for system '<Root>' */
typedef struct {
  stm32cube_blocks_UARTRead_pru_T obj; /* '<Root>/UART//USART Read' */
  stm32cube_blocks_UARTWrite_pr_T obj_h;/* '<Root>/UART//USART Write' */
  stm32cube_blocks_AnalogInput__T obj_g;/* '<S5>/Analog to Digital Converter' */
  int32_T clockTickCounter;            /* '<Root>/Pulse Generator' */
} DW_prueba_T;

/* Parameters (default storage) */
struct P_prueba_T_ {
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
struct tag_RTM_prueba_T {
  const char_T * volatile errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    struct {
      uint8_T TID[2];
    } TaskCounters;
  } Timing;
};

/* Block parameters (default storage) */
extern P_prueba_T prueba_P;

/* Block states (default storage) */
extern DW_prueba_T prueba_DW;

/* External function called from main */
extern void prueba_SetEventsForThisBaseStep(boolean_T *eventFlags);

/* Model entry point functions */
extern void prueba_initialize(void);
extern void prueba_step0(void);
extern void prueba_step1(void);
extern void prueba_terminate(void);

/* Real-time Model object */
extern RT_MODEL_prueba_T *const prueba_M;
extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<Root>/Data Type Conversion1' : Unused code path elimination
 * Block '<Root>/Data Type Conversion' : Eliminate redundant data type conversion
 */

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
 * '<Root>' : 'prueba'
 * '<S1>'   : 'prueba/Analog to Digital Converter'
 * '<S2>'   : 'prueba/Digital Port Write'
 * '<S3>'   : 'prueba/Digital Port Write1'
 * '<S4>'   : 'prueba/Analog to Digital Converter/ECSoC'
 * '<S5>'   : 'prueba/Analog to Digital Converter/ECSoC/ECSimCodegen'
 * '<S6>'   : 'prueba/Digital Port Write/ECSoC'
 * '<S7>'   : 'prueba/Digital Port Write/ECSoC/ECSimCodegen'
 * '<S8>'   : 'prueba/Digital Port Write1/ECSoC'
 * '<S9>'   : 'prueba/Digital Port Write1/ECSoC/ECSimCodegen'
 */
#endif                                 /* RTW_HEADER_prueba_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
