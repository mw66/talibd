module talibd.talib_func;
import std.exception;
import std.math;
import fluent.asserts;
import talibd.talib;
/+
TA_RetCode TA_RSI( int startIdx,
                   int endIdx,
                   const double inReal[],
                   int optInTimePeriod,
                   int *outBegIdx,
                   int *outNBElement,
                   double outReal[] );
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
TA_RetCode TA_MA( int startIdx,
                  int endIdx,
                  const double inReal[],
                  int optInTimePeriod,
                  TA_MAType optInMAType,
                  int *outBegIdx,
                  int *outNBElement,
                  double outReal[] );
TA_LIB_API TA_RetCode TA_CDLPIERCING( int startIdx,
                                      int endIdx,
                                                 const double inOpen[],
                                                 const double inHigh[],
                                                 const double inLow[],
                                                 const double inClose[],
                                                 int *outBegIdx,
                                                 int *outNBElement,
                                                 int outInteger[] );
   lookbackTotal = LOOKBACK_CALL(CDLPIERCING)();
+/
immutable int default_MA_optInTimePeriod = 20;
immutable TA_MAType default_optInMAType = TA_MAType_SMA;

bool TA_MA(double[] inData , double[] outMA , int MA_optInTimePeriod=default_MA_optInTimePeriod, TA_MAType optInMAType=default_optInMAType) { 
 enforce(inData.length == outMA.length);
 
 
 int begin, num; 
 int lookback = TA_MA_Lookback(MA_optInTimePeriod,optInMAType,); 
 enforce(MA_optInTimePeriod-1 == lookback); 
 if (lookback > inData.length) { 
 return false; 
 } 
 
 outMA[0..lookback] = 0;
 
 auto r = talibd.talib.TA_MA(0, cast(int)(inData.length-1), inData.ptr, MA_optInTimePeriod,optInMAType, &begin, &num ,
 &(outMA[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 

/+ manual wrapper
bool TA_RSI(double[] inData, double[] outRSI, int period=default_RSI_optInTimePeriod) {
  auto r = talibd.talib.TA_RSI(0, cast(int)(inData.length-1), inData.ptr, period, &begin, &num, &(outRSI[lookback]));
}
+/
immutable int default_RSI_optInTimePeriod = 14;

bool TA_RSI(double[] inData , double[] outRSI , int RSI_optInTimePeriod=default_RSI_optInTimePeriod) { 
 enforce(inData.length == outRSI.length);
 
 
 int begin, num; 
 int lookback = TA_RSI_Lookback(RSI_optInTimePeriod,); 
 enforce(RSI_optInTimePeriod == lookback); 
 if (lookback > inData.length) { 
 return false; 
 } 
 
 outRSI[0..lookback] = 0;
 
 auto r = talibd.talib.TA_RSI(0, cast(int)(inData.length-1), inData.ptr, RSI_optInTimePeriod, &begin, &num ,
 &(outRSI[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 

immutable int default_optInFastPeriod = 12;
immutable int default_optInSlowPeriod = 26;
immutable int default_optInSignalPeriod = 9;

bool TA_MACD(double[] inData , double[] outMACD, double[] outMACDSignal, double[] outMACDHist , int optInFastPeriod=default_optInFastPeriod, int optInSlowPeriod=default_optInSlowPeriod, int optInSignalPeriod=default_optInSignalPeriod) { 
 enforce(inData.length == outMACD.length);
 enforce(inData.length == outMACDSignal.length);
 enforce(inData.length == outMACDHist.length);
 
 
 int begin, num; 
 int lookback = TA_MACD_Lookback(optInFastPeriod,optInSlowPeriod,optInSignalPeriod,); 
 enforce(optInSlowPeriod+optInSignalPeriod-2 == lookback); 
 if (lookback > inData.length) { 
 return false; 
 } 
 
 outMACD[0..lookback] = 0;
 outMACDSignal[0..lookback] = 0;
 outMACDHist[0..lookback] = 0;
 
 auto r = talibd.talib.TA_MACD(0, cast(int)(inData.length-1), inData.ptr, optInFastPeriod,optInSlowPeriod,optInSignalPeriod, &begin, &num ,
 &(outMACD[lookback]),
 &(outMACDSignal[lookback]),
 &(outMACDHist[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 

