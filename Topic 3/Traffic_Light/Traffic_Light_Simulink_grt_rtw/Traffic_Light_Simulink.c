/*
 * Traffic_Light_Simulink.c
 *
 * Code generation for model "Traffic_Light_Simulink".
 *
 * Model version              : 1.4
 * Simulink Coder version : 8.14 (R2018a) 06-Feb-2018
 * C source code generated on : Mon Jan 16 21:55:53 2023
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "Traffic_Light_Simulink.h"
#include "Traffic_Light_Simulink_private.h"

/* Named constants for Chart: '<Root>/Chart' */
#define Traffic_Ligh_IN_NO_ACTIVE_CHILD ((uint8_T)0U)
#define Traffic_Light_Simulink_IN_GO   ((uint8_T)1U)
#define Traffic_Light_Simulink_IN_STOP ((uint8_T)3U)
#define Traffic_Light__IN_PrepareToStop ((uint8_T)2U)

/* Block states (default storage) */
DW_Traffic_Light_Simulink_T Traffic_Light_Simulink_DW;

/* External outputs (root outports fed by signals with default storage) */
ExtY_Traffic_Light_Simulink_T Traffic_Light_Simulink_Y;

/* Real-time model */
RT_MODEL_Traffic_Light_Simuli_T Traffic_Light_Simulink_M_;
RT_MODEL_Traffic_Light_Simuli_T *const Traffic_Light_Simulink_M =
  &Traffic_Light_Simulink_M_;

/* Model step function */
void Traffic_Light_Simulink_step(void)
{
  /* Chart: '<Root>/Chart' */
  /* Gateway: Chart */
  if (Traffic_Light_Simulink_DW.temporalCounter_i1 < 15U) {
    Traffic_Light_Simulink_DW.temporalCounter_i1++;
  }

  /* During: Chart */
  if (Traffic_Light_Simulink_DW.is_active_c3_Traffic_Light_Simu == 0U) {
    /* Entry: Chart */
    Traffic_Light_Simulink_DW.is_active_c3_Traffic_Light_Simu = 1U;

    /* Entry Internal: Chart */
    /* Transition: '<S1>:2' */
    Traffic_Light_Simulink_DW.is_c3_Traffic_Light_Simulink =
      Traffic_Light_Simulink_IN_STOP;
    Traffic_Light_Simulink_DW.temporalCounter_i1 = 0U;

    /* Outport: '<Root>/Out1' */
    /* Entry 'STOP': '<S1>:1' */
    Traffic_Light_Simulink_Y.Out1 = 1.0;

    /* Outport: '<Root>/Out3' */
    Traffic_Light_Simulink_Y.Out3 = 0.0;

    /* Outport: '<Root>/Out2' */
    Traffic_Light_Simulink_Y.Out2 = 0.0;
  } else {
    switch (Traffic_Light_Simulink_DW.is_c3_Traffic_Light_Simulink) {
     case Traffic_Light_Simulink_IN_GO:
      /* Outport: '<Root>/Out1' */
      Traffic_Light_Simulink_Y.Out1 = 0.0;

      /* Outport: '<Root>/Out3' */
      Traffic_Light_Simulink_Y.Out3 = 0.0;

      /* Outport: '<Root>/Out2' */
      Traffic_Light_Simulink_Y.Out2 = 1.0;

      /* During 'GO': '<S1>:4' */
      if (Traffic_Light_Simulink_DW.temporalCounter_i1 >= 3) {
        /* Transition: '<S1>:7' */
        Traffic_Light_Simulink_DW.is_c3_Traffic_Light_Simulink =
          Traffic_Light_Simulink_IN_STOP;
        Traffic_Light_Simulink_DW.temporalCounter_i1 = 0U;

        /* Outport: '<Root>/Out1' */
        /* Entry 'STOP': '<S1>:1' */
        Traffic_Light_Simulink_Y.Out1 = 1.0;

        /* Outport: '<Root>/Out3' */
        Traffic_Light_Simulink_Y.Out3 = 0.0;

        /* Outport: '<Root>/Out2' */
        Traffic_Light_Simulink_Y.Out2 = 0.0;
      }
      break;

     case Traffic_Light__IN_PrepareToStop:
      /* Outport: '<Root>/Out1' */
      Traffic_Light_Simulink_Y.Out1 = 0.0;

      /* Outport: '<Root>/Out3' */
      Traffic_Light_Simulink_Y.Out3 = 1.0;

      /* Outport: '<Root>/Out2' */
      Traffic_Light_Simulink_Y.Out2 = 0.0;

      /* During 'PrepareToStop': '<S1>:3' */
      if (Traffic_Light_Simulink_DW.temporalCounter_i1 >= 10) {
        /* Transition: '<S1>:6' */
        Traffic_Light_Simulink_DW.is_c3_Traffic_Light_Simulink =
          Traffic_Light_Simulink_IN_GO;
        Traffic_Light_Simulink_DW.temporalCounter_i1 = 0U;

        /* Outport: '<Root>/Out1' */
        /* Entry 'GO': '<S1>:4' */
        Traffic_Light_Simulink_Y.Out1 = 0.0;

        /* Outport: '<Root>/Out3' */
        Traffic_Light_Simulink_Y.Out3 = 0.0;

        /* Outport: '<Root>/Out2' */
        Traffic_Light_Simulink_Y.Out2 = 1.0;
      }
      break;

     default:
      /* Outport: '<Root>/Out1' */
      Traffic_Light_Simulink_Y.Out1 = 1.0;

      /* Outport: '<Root>/Out3' */
      Traffic_Light_Simulink_Y.Out3 = 0.0;

      /* Outport: '<Root>/Out2' */
      Traffic_Light_Simulink_Y.Out2 = 0.0;

      /* During 'STOP': '<S1>:1' */
      if (Traffic_Light_Simulink_DW.temporalCounter_i1 >= 10) {
        /* Transition: '<S1>:5' */
        Traffic_Light_Simulink_DW.is_c3_Traffic_Light_Simulink =
          Traffic_Light__IN_PrepareToStop;
        Traffic_Light_Simulink_DW.temporalCounter_i1 = 0U;

        /* Outport: '<Root>/Out1' */
        /* Entry 'PrepareToStop': '<S1>:3' */
        Traffic_Light_Simulink_Y.Out1 = 0.0;

        /* Outport: '<Root>/Out3' */
        Traffic_Light_Simulink_Y.Out3 = 1.0;

        /* Outport: '<Root>/Out2' */
        Traffic_Light_Simulink_Y.Out2 = 0.0;
      }
      break;
    }
  }

  /* End of Chart: '<Root>/Chart' */

  /* Matfile logging */
  rt_UpdateTXYLogVars(Traffic_Light_Simulink_M->rtwLogInfo,
                      (&Traffic_Light_Simulink_M->Timing.taskTime0));

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.2s, 0.0s] */
    if ((rtmGetTFinal(Traffic_Light_Simulink_M)!=-1) &&
        !((rtmGetTFinal(Traffic_Light_Simulink_M)-
           Traffic_Light_Simulink_M->Timing.taskTime0) >
          Traffic_Light_Simulink_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(Traffic_Light_Simulink_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++Traffic_Light_Simulink_M->Timing.clockTick0)) {
    ++Traffic_Light_Simulink_M->Timing.clockTickH0;
  }

  Traffic_Light_Simulink_M->Timing.taskTime0 =
    Traffic_Light_Simulink_M->Timing.clockTick0 *
    Traffic_Light_Simulink_M->Timing.stepSize0 +
    Traffic_Light_Simulink_M->Timing.clockTickH0 *
    Traffic_Light_Simulink_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void Traffic_Light_Simulink_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)Traffic_Light_Simulink_M, 0,
                sizeof(RT_MODEL_Traffic_Light_Simuli_T));
  rtmSetTFinal(Traffic_Light_Simulink_M, -1);
  Traffic_Light_Simulink_M->Timing.stepSize0 = 0.2;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    Traffic_Light_Simulink_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(Traffic_Light_Simulink_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(Traffic_Light_Simulink_M->rtwLogInfo, (NULL));
    rtliSetLogT(Traffic_Light_Simulink_M->rtwLogInfo, "tout");
    rtliSetLogX(Traffic_Light_Simulink_M->rtwLogInfo, "");
    rtliSetLogXFinal(Traffic_Light_Simulink_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(Traffic_Light_Simulink_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(Traffic_Light_Simulink_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(Traffic_Light_Simulink_M->rtwLogInfo, 0);
    rtliSetLogDecimation(Traffic_Light_Simulink_M->rtwLogInfo, 1);
    rtliSetLogY(Traffic_Light_Simulink_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(Traffic_Light_Simulink_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(Traffic_Light_Simulink_M->rtwLogInfo, (NULL));
  }

  /* states (dwork) */
  (void) memset((void *)&Traffic_Light_Simulink_DW, 0,
                sizeof(DW_Traffic_Light_Simulink_T));

  /* external outputs */
  (void) memset((void *)&Traffic_Light_Simulink_Y, 0,
                sizeof(ExtY_Traffic_Light_Simulink_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(Traffic_Light_Simulink_M->rtwLogInfo, 0.0,
    rtmGetTFinal(Traffic_Light_Simulink_M),
    Traffic_Light_Simulink_M->Timing.stepSize0, (&rtmGetErrorStatus
    (Traffic_Light_Simulink_M)));

  /* SystemInitialize for Chart: '<Root>/Chart' */
  Traffic_Light_Simulink_DW.temporalCounter_i1 = 0U;
  Traffic_Light_Simulink_DW.is_active_c3_Traffic_Light_Simu = 0U;
  Traffic_Light_Simulink_DW.is_c3_Traffic_Light_Simulink =
    Traffic_Ligh_IN_NO_ACTIVE_CHILD;
}

/* Model terminate function */
void Traffic_Light_Simulink_terminate(void)
{
  /* (no terminate code required) */
}
