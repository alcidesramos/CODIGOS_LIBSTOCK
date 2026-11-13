/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: prueba.c
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

#include "prueba.h"
#include "prueba_types.h"
#include "rtwtypes.h"
#include "stm_adc_ll.h"
#include <stddef.h>

/* Block states (default storage) */
DW_prueba_T prueba_DW;

/* Real-time model */
static RT_MODEL_prueba_T prueba_M_;
RT_MODEL_prueba_T *const prueba_M = &prueba_M_;

/* Forward declaration for local functions */
static void prueba_SystemCore_setup(stm32cube_blocks_AnalogInput__T *obj);
static void prueba_SystemCore_setup_it(stm32cube_blocks_UARTWrite_pr_T *obj);
static void prueba_SystemCore_setup_i(stm32cube_blocks_UARTRead_pru_T *obj);
static void rate_monotonic_scheduler(void);

/*
 * Set which subrates need to run this base step (base rate always runs).
 * This function must be called prior to calling the model step function
 * in order to remember which rates need to run this base step.  The
 * buffering of events allows for overlapping preemption.
 */
void prueba_SetEventsForThisBaseStep(boolean_T *eventFlags)
{
  /* Task runs when its counter is zero, computed via rtmStepTask macro */
  eventFlags[1] = ((boolean_T)rtmStepTask(prueba_M, 1));
}

/*
 *         This function updates active task flag for each subrate
 *         and rate transition flags for tasks that exchange data.
 *         The function assumes rate-monotonic multitasking scheduler.
 *         The function must be called at model base rate so that
 *         the generated code self-manages all its subrates and rate
 *         transition flags.
 */
static void rate_monotonic_scheduler(void)
{
  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   */
  (prueba_M->Timing.TaskCounters.TID[1])++;
  if ((prueba_M->Timing.TaskCounters.TID[1]) > 4) {/* Sample time: [0.5s, 0.0s] */
    prueba_M->Timing.TaskCounters.TID[1] = 0;
  }
}

static void prueba_SystemCore_setup(stm32cube_blocks_AnalogInput__T *obj)
{
  uint16_T module;
  uint16_T triggerType;
  uint32_T noConv;
  ADC_Type_T adcStructLoc;
  obj->isSetupComplete = false;
  obj->isInitialized = 1;
  adcStructLoc.dmaPeripheralPtr = NULL;
  adcStructLoc.dmastream = 0;
  adcStructLoc.InternalBufferPtr = (void *)(NULL);
  adcStructLoc.peripheralPtr = ADC1;
  adcStructLoc.InjectedNoOfConversion = 0U;
  adcStructLoc.InternalBufferSize = 1U;
  module = ADC_NORMAL_MODE;
  triggerType = ADC_TRIGGER_AND_READ;
  noConv = LL_ADC_REG_SEQ_SCAN_DISABLE;
  adcStructLoc.RegularNoOfConversion = 1U;
  obj->ADCHandle = ADC_Handle_Init(&adcStructLoc, module, 1, triggerType, noConv);
  enableADC(obj->ADCHandle);
  startADCConversionForExternalTrigger(obj->ADCHandle, 1);
  obj->isSetupComplete = true;
}

static void prueba_SystemCore_setup_it(stm32cube_blocks_UARTWrite_pr_T *obj)
{
  UART_Type_T b;
  obj->isSetupComplete = false;
  obj->isInitialized = 1;
  b.txdmaPeripheralPtr = NULL;
  b.txdmastream = 0;
  b.buffer.txBufferPtr = (void*)(&obj->UARTInternalBuffer[0]);
  b.peripheralPtr = USART1;
  b.mode = UART_TX_INTERRUPT_MODE;
  b.enableRxOrTx = 2U;
  b.buffer.txBufferSize = 128U;
  obj->UARTHandle = MW_UART_Initialize(&b);
  obj->isSetupComplete = true;
}

static void prueba_SystemCore_setup_i(stm32cube_blocks_UARTRead_pru_T *obj)
{
  UART_Type_T b;
  obj->isSetupComplete = false;
  obj->isInitialized = 1;
  b.rxdmaPeripheralPtr = NULL;
  b.rxdmastream = 0;
  b.buffer.rxBufferPtr = (void*)(&obj->UARTInternalBuffer[0]);
  b.peripheralPtr = USART1;
  b.mode = UART_RX_INTERRUPT_MODE;
  b.enableRxOrTx = 1.0;
  b.disableDMAIntOnError = false;
  b.buffer.rxBufferSize = 128U;
  obj->UARTHandle = MW_UART_Initialize(&b);
  obj->isSetupComplete = true;
}

/* Model step function for TID0 */
void prueba_step0(void)                /* Sample time: [0.1s, 0.0s] */
{
  GPIO_TypeDef * portNameLoc;
  uint16_T triggerType;
  int32_T pinWriteLoc;
  uint32_T dataBytesToRead;
  uint32_T sentLength;
  uint16_T data;
  uint16_T uartWriteData;

  {                                    /* Sample time: [0.1s, 0.0s] */
    rate_monotonic_scheduler();
  }

  /* MATLABSystem: '<S5>/Analog to Digital Converter' */
  triggerType = ADC_TRIGGER_AND_READ;
  regularReadADCNormal(prueba_DW.obj_g.ADCHandle, triggerType, &data);

  /* MATLABSystem: '<Root>/UART//USART Write' incorporates:
   *  MATLABSystem: '<S5>/Analog to Digital Converter'
   */
  uartWriteData = data;
  MW_UART_TransmitUsingInterrupt(prueba_DW.obj_h.UARTHandle, &uartWriteData, 2U,
    0U, &sentLength);

  /* MATLABSystem: '<Root>/UART//USART Read' */
  dataBytesToRead = getBytesToBeReadFromBuffer(prueba_DW.obj.UARTHandle, 2U, 0U);
  if (dataBytesToRead > 0U) {
    sentLength = dataBytesToRead - /*MW:OvSatOk*/ dataBytesToRead % 2U;
    if (sentLength > dataBytesToRead) {
      sentLength = 0U;
    }

    MW_UART_ReceiveUsingBuffer(prueba_DW.obj.UARTHandle, &uartWriteData,
      sentLength, &dataBytesToRead);
  } else {
    getReadErrorStatus(prueba_DW.obj.UARTHandle);
  }

  /* MATLABSystem: '<S7>/Digital Port Write' incorporates:
   *  MATLABSystem: '<Root>/UART//USART Read'
   *  MATLABSystem: '<S5>/Analog to Digital Converter'
   *  RelationalOperator: '<Root>/GreaterThan'
   */
  portNameLoc = GPIOA;
  if (uartWriteData > data) {
    pinWriteLoc = 2;
  } else {
    pinWriteLoc = 0;
  }

  LL_GPIO_SetOutputPin(portNameLoc, (uint32_T)pinWriteLoc);
  LL_GPIO_ResetOutputPin(portNameLoc, ~(uint32_T)pinWriteLoc & 2U);

  /* End of MATLABSystem: '<S7>/Digital Port Write' */
}

/* Model step function for TID1 */
void prueba_step1(void)                /* Sample time: [0.5s, 0.0s] */
{
  GPIO_TypeDef * portNameLoc;
  real_T rtb_PulseGenerator;
  int32_T pinWriteLoc;

  /* DiscretePulseGenerator: '<Root>/Pulse Generator' */
  rtb_PulseGenerator = (prueba_DW.clockTickCounter <
                        prueba_P.PulseGenerator_Duty) &&
    (prueba_DW.clockTickCounter >= 0) ? prueba_P.PulseGenerator_Amp : 0.0;
  if (prueba_DW.clockTickCounter >= prueba_P.PulseGenerator_Period - 1.0) {
    prueba_DW.clockTickCounter = 0;
  } else {
    prueba_DW.clockTickCounter++;
  }

  /* End of DiscretePulseGenerator: '<Root>/Pulse Generator' */

  /* MATLABSystem: '<S9>/Digital Port Write' */
  portNameLoc = GPIOC;
  if (rtb_PulseGenerator != 0.0) {
    pinWriteLoc = 8192;
  } else {
    pinWriteLoc = 0;
  }

  LL_GPIO_SetOutputPin(portNameLoc, (uint32_T)pinWriteLoc);
  LL_GPIO_ResetOutputPin(portNameLoc, ~(uint32_T)pinWriteLoc & 8192U);

  /* End of MATLABSystem: '<S9>/Digital Port Write' */
}

/* Model initialize function */
void prueba_initialize(void)
{
  /* Start for MATLABSystem: '<S5>/Analog to Digital Converter' */
  prueba_DW.obj_g.isInitialized = 0;
  prueba_DW.obj_g.matlabCodegenIsDeleted = false;
  prueba_SystemCore_setup(&prueba_DW.obj_g);

  /* Start for MATLABSystem: '<Root>/UART//USART Write' */
  prueba_DW.obj_h.isInitialized = 0;
  prueba_DW.obj_h.matlabCodegenIsDeleted = false;
  prueba_SystemCore_setup_it(&prueba_DW.obj_h);

  /* Start for MATLABSystem: '<Root>/UART//USART Read' */
  prueba_DW.obj.isInitialized = 0;
  prueba_DW.obj.matlabCodegenIsDeleted = false;
  prueba_SystemCore_setup_i(&prueba_DW.obj);
}

/* Model terminate function */
void prueba_terminate(void)
{
  uint16_T mode;

  /* Terminate for MATLABSystem: '<S5>/Analog to Digital Converter' */
  if (!prueba_DW.obj_g.matlabCodegenIsDeleted) {
    prueba_DW.obj_g.matlabCodegenIsDeleted = true;
    if ((prueba_DW.obj_g.isInitialized == 1) && prueba_DW.obj_g.isSetupComplete)
    {
      mode = ADC_NORMAL_MODE;
      ADC_Handle_Deinit(prueba_DW.obj_g.ADCHandle, mode, 1);
    }
  }

  /* End of Terminate for MATLABSystem: '<S5>/Analog to Digital Converter' */

  /* Terminate for MATLABSystem: '<Root>/UART//USART Write' */
  if (!prueba_DW.obj_h.matlabCodegenIsDeleted) {
    prueba_DW.obj_h.matlabCodegenIsDeleted = true;
    if ((prueba_DW.obj_h.isInitialized == 1) && prueba_DW.obj_h.isSetupComplete)
    {
      MW_UART_DeInit(prueba_DW.obj_h.UARTHandle);
    }
  }

  /* End of Terminate for MATLABSystem: '<Root>/UART//USART Write' */

  /* Terminate for MATLABSystem: '<Root>/UART//USART Read' */
  if (!prueba_DW.obj.matlabCodegenIsDeleted) {
    prueba_DW.obj.matlabCodegenIsDeleted = true;
    if ((prueba_DW.obj.isInitialized == 1) && prueba_DW.obj.isSetupComplete) {
      MW_UART_DeInit(prueba_DW.obj.UARTHandle);
    }
  }

  /* End of Terminate for MATLABSystem: '<Root>/UART//USART Read' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
