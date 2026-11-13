/*
 * File: suma.h
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

#ifndef RTW_HEADER_suma_h_
#define RTW_HEADER_suma_h_
#ifndef suma_COMMON_INCLUDES_
# define suma_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* suma_COMMON_INCLUDES_ */

#include "suma_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* External inputs (root inport signals with default storage) */
typedef struct {
  real32_T uno;                        /* '<Root>/uno' */
  real32_T dos;                        /* '<Root>/dos' */
} ExtU_suma_T;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real32_T salida;                     /* '<Root>/salida' */
} ExtY_suma_T;

/* Real-time Model Data Structure */
struct tag_RTM_suma_T {
  const char_T *errorStatus;
};

/* External inputs (root inport signals with default storage) */
extern ExtU_suma_T suma_U;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY_suma_T suma_Y;

/* Model entry point functions */
extern void suma_initialize(void);
extern void suma_step(void);
extern void suma_terminate(void);

/* Real-time Model object */
extern RT_MODEL_suma_T *const suma_M;

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
 * '<Root>' : 'suma'
 */
#endif                                 /* RTW_HEADER_suma_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
