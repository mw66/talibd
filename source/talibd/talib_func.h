module talibd.talib_func;

import std.exception;
import std.math;

import fluent.asserts;

import talibd.talib;


// NEW_LINE will be processed in the Makefile
#define NEW_LINE ______

#define HEAD(x, ...) x
#define TAIL(x, ...) __VA_ARGS__

// C Preprocessor to split “int x” into int & x
// https://stackoverflow.com/a/23400746
#define LPAREN (
#define RPAREN )
#define COMMA ,

#define CAT(L, R) CAT_(L, R)
#define CAT_(L, R) L ## R
#define EXPAND(...) __VA_ARGS__

#define SPLIT(OP, D) EXPAND(OP CAT(SPLIT_, D) RPAREN)

#define SPLIT_int LPAREN int COMMA
#define SPLIT_char LPAREN char COMMA
#define SPLIT_float LPAREN float COMMA
#define SPLIT_double LPAREN double COMMA
// split user-defined types
#define SPLIT_TA_MAType LPAREN TA_MAType COMMA


// iterate over arguments in variadic macros
// https://stackoverflow.com/a/11994395

// Make a FOREACH macro
#define FE_0(WHAT)
#define FE_1(WHAT, X) WHAT(X)
#define FE_2(WHAT, X, ...) WHAT(X)FE_1(WHAT, __VA_ARGS__)
#define FE_3(WHAT, X, ...) WHAT(X)FE_2(WHAT, __VA_ARGS__)
#define FE_4(WHAT, X, ...) WHAT(X)FE_3(WHAT, __VA_ARGS__)
#define FE_5(WHAT, X, ...) WHAT(X)FE_4(WHAT, __VA_ARGS__)
//... repeat as needed

// NOTE: __VA_OPT__ is c++20 feature to skip `action` on empty arguments: ref:NO_HLC_INS
#define GET_MACRO(_0,_1,_2,_3,_4,_5,NAME,...) NAME
#define FOR_EACH(action,...) \
  __VA_OPT__(GET_MACRO(_0,__VA_ARGS__,FE_5,FE_4,FE_3,FE_2,FE_1,FE_0)(action,__VA_ARGS__))


// to generate D code!

#define AS_IT_IS(X) , X
#define IN_PARAMS(...) FOR_EACH(AS_IT_IS,__VA_ARGS__)


// type: double, or int
#define DECL_ARRAY_TYPE_double(X) , double[] X
#define DECL_ARRAY_TYPE_int(X) ,       int[] X

#define CAST_CONST_DOUBLE_PTR(x) x // cast(const(double)*)(x)
// e.g. #define MA_INS  int optInTimePeriod, TA_MAType optInMAType
#define DECL_PARAM(type, var) type var=default_ ## var
#define   TAKE_VAR(type, var)      var
#define          ADD_PTR(var)      CAST_CONST_DOUBLE_PTR(var.ptr),
#define SPLIT_THEN_DECL_PARAM(X) , SPLIT(DECL_PARAM, X)
#define SPLIT_THEN_TAKE_VAR(X)     SPLIT(TAKE_VAR,   X),

// end-index-aligned talib output
#define TAKE_ITEM_ADDR(X) ,______ &(X[lookback])
#define OUT_PARAMS(...) FOR_EACH(TAKE_ITEM_ADDR,__VA_ARGS__)


#define  CHECK_OUTPUT_LENGTH(X) enforce(inData.length == X.length);______  /* same array length, end-aligned */
#define  INIT_OUTPUT(X) X[0..lookback] = 0;______ /* double.init;  // clear all the content? */

/+
TA_RetCode TA_RSI( int    startIdx,
                   int    endIdx,
                   const double inReal[],
                   int           optInTimePeriod, /* From 2 to 100000 */
                   int          *outBegIdx,
                   int          *outNBElement,
                   double        outReal[] );

extern(C) {
    alias TA_RetCode = _Anonymous_4;
    enum _Anonymous_4
    {
        TA_SUCCESS = 0,
        TA_LIB_NOT_INITIALIZE = 1,
        TA_BAD_PARAM = 2,
        TA_ALLOC_ERR = 3,
        TA_GROUP_NOT_FOUND = 4,
        TA_FUNC_NOT_FOUND = 5,
        TA_INVALID_HANDLE = 6,
        TA_INVALID_PARAM_HOLDER = 7,
        TA_INVALID_PARAM_HOLDER_TYPE = 8,
        TA_INVALID_PARAM_FUNCTION = 9,
        TA_INPUT_NOT_ALL_INITIALIZE = 10,
        TA_OUTPUT_NOT_ALL_INITIALIZE = 11,
        TA_OUT_OF_RANGE_START_INDEX = 12,
        TA_OUT_OF_RANGE_END_INDEX = 13,
        TA_INVALID_LIST_TYPE = 14,
        TA_BAD_OBJECT = 15,
        TA_NOT_SUPPORTED = 16,
        TA_INTERNAL_ERROR = 5000,
        TA_UNKNOWN_ERR = 65535,
    }
TA_RetCode TA_RSI(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
}

TA_RetCode TA_MA( int    startIdx,
                  int    endIdx,
                  const double inReal[],
                  int           optInTimePeriod, /* From 1 to 100000 */
                  TA_MAType     optInMAType,
                  int          *outBegIdx,
                  int          *outNBElement,
                  double        outReal[] );


// lib/ta-lib-code/ta-lib/c/include/ta_func.h
// lib/ta-lib-code/ta-lib/c/src/ta_func/ta_CDLPIERCING.c
TA_LIB_API TA_RetCode TA_CDLPIERCING( int    startIdx,
                                      int    endIdx,
                                                 const double inOpen[],
                                                 const double inHigh[],
                                                 const double inLow[],
                                                 const double inClose[],
                                                 int          *outBegIdx,
                                                 int          *outNBElement,
                                                 int           outInteger[] );
   lookbackTotal = LOOKBACK_CALL(CDLPIERCING)();
+/

// FUNC_IN_PARAS: e.g. optInTimePeriod, optInMAType for TA_MA
// FUNC_OUTS: output array, e.g. outMA for TA_MA
// FUNC_HLC_INS: if not empty, will be HLC, and inData is inOpen; when only inClose is needed, pass NO_HLC_INS as FUNC_HLC_INS (e.g. for TA_MA)
#define NO_HLC_INS
#define    HLC_INS inHigh, inLow, inClose

// e.g. TA_MA
#define CHECK_NORMAL_LOOKBACK(TA_FUNC, FUNC_IN_PARAS, expected_lookback) \
  int lookback = TA_FUNC##_Lookback(FOR_EACH(SPLIT_THEN_TAKE_VAR, FUNC_IN_PARAS)); ______\
  enforce(expected_lookback == lookback); ______\
  if (lookback > inData.length) { ______\
    return false; ______\
  } ______ \


// from lib/ta-lib-rt/ta-lib-rt/c/include/ta_defs.h
#define LOOKBACK_CALL(x)        TA_##x##_Lookback

// e.g. TA_CDLPIERCING
/* expand to:
 int lookback = TA_CDL3WHITESOLDIERS_Lookback(); 
 int lookback = TA_CDLABANDONEDBABY_Lookback(optInPenetration,); 
 */
#define CHECK_CDL_LOOKBACK(TA_FUNC, FUNC_IN_PARAS) \
  int lookback = LOOKBACK_CALL(TA_FUNC)(FOR_EACH(SPLIT_THEN_TAKE_VAR, FUNC_IN_PARAS)); ______ \
  if (lookback > inData.length) { ______\
    return false; ______\
  } ______ \


#define DECL_TA_FUNC(TA_FUNC, FUNC_HLC_INS, FUNC_IN_PARAS, func_outs_type, FUNC_OUTS, check_lookback) ______\
bool TA_FUNC(double[] inData FOR_EACH(DECL_ARRAY_TYPE_double, FUNC_HLC_INS) FOR_EACH(DECL_ARRAY_TYPE_##func_outs_type, FUNC_OUTS) FOR_EACH(SPLIT_THEN_DECL_PARAM, FUNC_IN_PARAS)) { ______\
  FOR_EACH(CHECK_OUTPUT_LENGTH, FUNC_OUTS) ______\
 ______\
  int begin, num; ______ \
  check_lookback \
 ______\
  FOR_EACH(INIT_OUTPUT, FUNC_OUTS) ______\
  auto r = talibd.talib.TA_FUNC(0, cast(int)(inData.length-1), CAST_CONST_DOUBLE_PTR(inData.ptr), \
		  FOR_EACH(ADD_PTR,  FUNC_HLC_INS)  \
		  FOR_EACH(SPLIT_THEN_TAKE_VAR, FUNC_IN_PARAS) \
		  &begin, &num OUT_PARAMS(FUNC_OUTS)); ______\
 ______\
  enforce(lookback == begin);  /* RSI's start 0-data need to compare with prev close, so this assert holds; in contrast for TA_MA */ ______\
  enforce(begin + num == cast(int)(inData.length)); ______\
 ______\
  return TA_SUCCESS == r; ______\
} ______ ______


// just define in & out variables
#define MA_INS  int MA_optInTimePeriod, TA_MAType optInMAType
#define MA_OUTS outMA
immutable int default_MA_optInTimePeriod = 20;
immutable TA_MAType default_optInMAType = TA_MAType_SMA;
// https://www.ta-lib.org/d_api/d_api.html#Output%20Size
// The lookback function indicates how many inputs are consume before the first output can be calculated.
// Example: A simple moving average (SMA) of period 10 will have a lookback of 9.
DECL_TA_FUNC(TA_MA, NO_HLC_INS, MA_INS, double, MA_OUTS, CHECK_NORMAL_LOOKBACK(TA_MA, MA_INS, MA_optInTimePeriod-1))

#define EMPTY_INS
#define CDL_OUTS outInteger
/* manually gen one
DECL_TA_FUNC(TA_CDLPIERCING, HLC_INS, EMPTY_INS, int, CDL_OUTS, CHECK_CDL_LOOKBACK(CDLPIERCING, EMPTY_INS))
*/


#define DECL_TA_CDL_FUNC(fname) \
        DECL_TA_FUNC(TA_##fname, HLC_INS, EMPTY_INS, int, CDL_OUTS, CHECK_CDL_LOOKBACK(fname, EMPTY_INS))


#if 0
/+ source/gen_talib_cdl_funcs.py NEED_OPTIN_FUNCS
# lib/ta-lib-code/ta-lib/c/src/ta_func/ta_CDLMORNINGSTAR.c
# /* Generated */        optInPenetration = 3.000000e-1;
# need optInPenetration
+/
#endif

#define ONE_INS double        optInPenetration
immutable double default_optInPenetration = 0.3;
#define DECL_TA_CDL_FUNC_1(fname) \
        DECL_TA_FUNC(TA_##fname, HLC_INS, ONE_INS, int, CDL_OUTS, CHECK_CDL_LOOKBACK(fname, ONE_INS))


#include "cdl_funcs.h"

/+ manual wrapper
bool TA_RSI(double[] inData, double[] outRSI, int period=default_RSI_optInTimePeriod) {
  auto r = talibd.talib.TA_RSI(0, cast(int)(inData.length-1), inData.ptr, period, &begin, &num, &(outRSI[lookback]));
}
+/

// just define in & out variables
#define RSI_INS  int RSI_optInTimePeriod
#define RSI_OUTS outRSI
immutable int default_RSI_optInTimePeriod = 14;
DECL_TA_FUNC(TA_RSI, NO_HLC_INS, RSI_INS, double, RSI_OUTS, CHECK_NORMAL_LOOKBACK(TA_RSI, RSI_INS, RSI_optInTimePeriod))


// https://school.stockcharts.com/doku.php?id=technical_indicators:moving_average_convergence_divergence_macd
// https://school.stockcharts.com/doku.php?id=technical_indicators:macd-histogram
// just define in & out variables
#define MACD_INS  int optInFastPeriod, int optInSlowPeriod, int optInSignalPeriod
#define MACD_OUTS outMACD, outMACDSignal, outMACDHist
immutable int default_optInFastPeriod = 12;
immutable int default_optInSlowPeriod = 26;
immutable int default_optInSignalPeriod = 9;
DECL_TA_FUNC(TA_MACD, NO_HLC_INS, MACD_INS, double, MACD_OUTS, CHECK_NORMAL_LOOKBACK(TA_MACD, MACD_INS, optInSlowPeriod+optInSignalPeriod-2))
