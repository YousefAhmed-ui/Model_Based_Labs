/*
 * File: last.c
 *
 * Code generated for Simulink model 'last'.
 *
 * Model version                  : 1.4
 * Simulink Coder version         : 8.14 (R2018a) 06-Feb-2018
 * C/C++ source code generated on : Sun Jan  8 21:45:19 2023
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 *    3. ROM efficiency
 * Validation result: Not run
 */

#include "last.h"
#include "last_private.h"

/* Real-time model */
RT_MODEL_last_T last_M_;
RT_MODEL_last_T *const last_M = &last_M_;

/* Model step function */
void last_step(void)
{
  /* Chart: '<Root>/Led ' */
  Led_ON(LED_ID_1);
}

/* Model initialize function */
void last_initialize(void)
{
  /* Registration code */

  /* initialize error status */
  rtmSetErrorStatus(last_M, (NULL));
}

/* Model terminate function */
void last_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
