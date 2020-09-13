import std.math;

import fluent.asserts;

import talib;


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

#define GET_MACRO(_0,_1,_2,_3,_4,_5,NAME,...) NAME
#define FOR_EACH(action,...) \
  GET_MACRO(_0,__VA_ARGS__,FE_5,FE_4,FE_3,FE_2,FE_1,FE_0)(action,__VA_ARGS__)


// to generate D code!

#define AS_IT_IS(X) , X
#define IN_PARAMS(...) FOR_EACH(AS_IT_IS,__VA_ARGS__)


#define DECL_ARRAY_TYPE(X) , double[] X

// e.g. #define MA_INS  int optInTimePeriod, TA_MAType optInMAType
#define DECL_PARAM(type, var) type var=default_ ## var
#define   TAKE_VAR(type, var)      var
#define SPLIT_THEN_DECL_PARAM(X) , SPLIT(DECL_PARAM, X)
#define SPLIT_THEN_TAKE_VAR(X)     SPLIT(TAKE_VAR,   X),

// end-index-aligned talib output
#define TAKE_ITEM_ADDR(X) ,__NL__ &(X[lookback])
#define OUT_PARAMS(...) FOR_EACH(TAKE_ITEM_ADDR,__VA_ARGS__)


#define  CHECK_OUTPUT_LENGTH(X) Assert.equal(inData.length, X.length);__NL__  /* same array length, end-aligned */
#define  INIT_OUTPUT(X) X[0..lookback] = 0;__NL__ /* double.init;  // clear all the content? */

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

+/

#define DECL_TA_FUNC(TA_FUNC, FUNC_INS, FUNC_OUTS, expected_lookback) __NL__\
bool TA_FUNC(double[] inData FOR_EACH(DECL_ARRAY_TYPE, FUNC_OUTS) FOR_EACH(SPLIT_THEN_DECL_PARAM, FUNC_INS)) { __NL__\
  FOR_EACH(CHECK_OUTPUT_LENGTH, FUNC_OUTS) __NL__\
  int begin, num; __NL__\
  int lookback = TA_FUNC##_Lookback(FOR_EACH(SPLIT_THEN_TAKE_VAR, FUNC_INS)); __NL__\
  Assert.equal(expected_lookback, lookback); __NL__\
  if (lookback > inData.length) { __NL__\
    return false; __NL__\
  } __NL__\
  FOR_EACH(INIT_OUTPUT, FUNC_OUTS) __NL__\
  auto r = talib.TA_FUNC(0, cast(int)(inData.length-1), inData.ptr, FOR_EACH(SPLIT_THEN_TAKE_VAR, FUNC_INS) &begin, &num OUT_PARAMS(FUNC_OUTS)); __NL__\
 __NL__\
  Assert.equal(lookback, begin);  /* RSI's start 0-data need to compare with prev close, so this assert holds; in contrast for TA_MA */ __NL__\
  Assert.equal(begin + num, cast(int)(inData.length)); __NL__\
 __NL__\
  return TA_SUCCESS == r; __NL__\
} __NL__ __NL__


// just define in & out variables
#define MA_INS  int MA_optInTimePeriod, TA_MAType optInMAType
#define MA_OUTS outMA
immutable int default_MA_optInTimePeriod = 20;
immutable TA_MAType default_optInMAType = TA_MAType_SMA;
DECL_TA_FUNC(TA_MA, MA_INS, MA_OUTS, MA_optInTimePeriod)



/+ manual wrapper
bool TA_RSI(double[] inData, double[] outRSI, int period=default_RSI_optInTimePeriod) {
  auto r = talib.TA_RSI(0, cast(int)(inData.length-1), inData.ptr, period, &begin, &num, &(outRSI[lookback]));
}
+/

// just define in & out variables
#define RSI_INS  int RSI_optInTimePeriod
#define RSI_OUTS outRSI
immutable int default_RSI_optInTimePeriod = 14;
DECL_TA_FUNC(TA_RSI, RSI_INS, RSI_OUTS, RSI_optInTimePeriod)


// https://school.stockcharts.com/doku.php?id=technical_indicators:moving_average_convergence_divergence_macd
// just define in & out variables
#define MACD_INS  int optInFastPeriod, int optInSlowPeriod, int optInSignalPeriod
#define MACD_OUTS outMACD, outMACDSignal, outMACDHist
immutable int default_optInFastPeriod = 12;
immutable int default_optInSlowPeriod = 26;
immutable int default_optInSignalPeriod = 9;
DECL_TA_FUNC(TA_MACD, MACD_INS, MACD_OUTS, optInSlowPeriod)
