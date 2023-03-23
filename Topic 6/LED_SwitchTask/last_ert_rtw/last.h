/*
 * File: last.h
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

#ifndef RTW_HEADER_last_h_
#define RTW_HEADER_last_h_
#include <stddef.h>
#ifndef last_COMMON_INCLUDES_
# define last_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* last_COMMON_INCLUDES_ */

#include "last_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* user code (top of header file) */
#include"led.h"

/* Real-time Model Data Structure */
struct tag_RTM_last_T {
  const char_T * volatile errorStatus;
};

/* Model entry point functions */
extern void last_initialize(void);
extern void last_step(void);
extern void last_terminate(void);

/* Real-time Model object */
extern RT_MODEL_last_T *const last_M;

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
 * '<Root>' : 'last'
 * '<S1>'   : 'last/Led '
 */
#endif                                 /* RTW_HEADER_last_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
