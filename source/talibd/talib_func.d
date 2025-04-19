module talibd.talib_func;
import std.exception;
import std.math;
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
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outMA[0..lookback] = 0;
 
 auto r = talibd.talib.TA_MA(0, cast(int)(inData.length-1), inData.ptr, MA_optInTimePeriod,optInMAType, &begin, &num ,
 &(outMA[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 

immutable double default_optInPenetration = 0.3;

bool TA_CDL2CROWS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDL2CROWS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDL2CROWS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDL3BLACKCROWS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDL3BLACKCROWS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDL3BLACKCROWS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDL3INSIDE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDL3INSIDE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDL3INSIDE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDL3LINESTRIKE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDL3LINESTRIKE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDL3LINESTRIKE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDL3OUTSIDE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDL3OUTSIDE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDL3OUTSIDE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDL3STARSINSOUTH(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDL3STARSINSOUTH_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDL3STARSINSOUTH(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDL3WHITESOLDIERS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDL3WHITESOLDIERS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDL3WHITESOLDIERS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLABANDONEDBABY(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger , double optInPenetration=default_optInPenetration) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLABANDONEDBABY_Lookback(optInPenetration,); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLABANDONEDBABY(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, optInPenetration, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLADVANCEBLOCK(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLADVANCEBLOCK_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLADVANCEBLOCK(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLBELTHOLD(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLBELTHOLD_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLBELTHOLD(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLBREAKAWAY(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLBREAKAWAY_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLBREAKAWAY(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLCLOSINGMARUBOZU(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLCLOSINGMARUBOZU_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLCLOSINGMARUBOZU(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLCONCEALBABYSWALL(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLCONCEALBABYSWALL_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLCONCEALBABYSWALL(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLCOUNTERATTACK(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLCOUNTERATTACK_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLCOUNTERATTACK(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLDARKCLOUDCOVER(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger , double optInPenetration=default_optInPenetration) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLDARKCLOUDCOVER_Lookback(optInPenetration,); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLDARKCLOUDCOVER(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, optInPenetration, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLDOJI(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLDOJI_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLDOJI(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLDOJISTAR(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLDOJISTAR_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLDOJISTAR(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLDRAGONFLYDOJI(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLDRAGONFLYDOJI_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLDRAGONFLYDOJI(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLENGULFING(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLENGULFING_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLENGULFING(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLEVENINGDOJISTAR(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger , double optInPenetration=default_optInPenetration) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLEVENINGDOJISTAR_Lookback(optInPenetration,); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLEVENINGDOJISTAR(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, optInPenetration, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLEVENINGSTAR(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger , double optInPenetration=default_optInPenetration) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLEVENINGSTAR_Lookback(optInPenetration,); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLEVENINGSTAR(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, optInPenetration, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLGAPSIDESIDEWHITE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLGAPSIDESIDEWHITE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLGAPSIDESIDEWHITE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLGRAVESTONEDOJI(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLGRAVESTONEDOJI_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLGRAVESTONEDOJI(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHAMMER(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHAMMER_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHAMMER(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHANGINGMAN(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHANGINGMAN_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHANGINGMAN(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHARAMI(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHARAMI_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHARAMI(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHARAMICROSS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHARAMICROSS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHARAMICROSS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHIGHWAVE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHIGHWAVE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHIGHWAVE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHIKKAKE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHIKKAKE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHIKKAKE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHIKKAKEMOD(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHIKKAKEMOD_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHIKKAKEMOD(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLHOMINGPIGEON(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLHOMINGPIGEON_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLHOMINGPIGEON(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLIDENTICAL3CROWS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLIDENTICAL3CROWS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLIDENTICAL3CROWS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLINNECK(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLINNECK_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLINNECK(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLINVERTEDHAMMER(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLINVERTEDHAMMER_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLINVERTEDHAMMER(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLKICKING(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLKICKING_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLKICKING(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLKICKINGBYLENGTH(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLKICKINGBYLENGTH_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLKICKINGBYLENGTH(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLLADDERBOTTOM(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLLADDERBOTTOM_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLLADDERBOTTOM(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLLONGLEGGEDDOJI(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLLONGLEGGEDDOJI_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLLONGLEGGEDDOJI(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLLONGLINE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLLONGLINE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLLONGLINE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLMARUBOZU(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLMARUBOZU_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLMARUBOZU(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLMATCHINGLOW(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLMATCHINGLOW_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLMATCHINGLOW(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLMATHOLD(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger , double optInPenetration=default_optInPenetration) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLMATHOLD_Lookback(optInPenetration,); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLMATHOLD(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, optInPenetration, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLMORNINGDOJISTAR(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger , double optInPenetration=default_optInPenetration) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLMORNINGDOJISTAR_Lookback(optInPenetration,); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLMORNINGDOJISTAR(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, optInPenetration, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLMORNINGSTAR(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger , double optInPenetration=default_optInPenetration) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLMORNINGSTAR_Lookback(optInPenetration,); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLMORNINGSTAR(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, optInPenetration, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLONNECK(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLONNECK_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLONNECK(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLPIERCING(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLPIERCING_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLPIERCING(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLRICKSHAWMAN(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLRICKSHAWMAN_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLRICKSHAWMAN(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLRISEFALL3METHODS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLRISEFALL3METHODS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLRISEFALL3METHODS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLSEPARATINGLINES(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLSEPARATINGLINES_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLSEPARATINGLINES(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLSHOOTINGSTAR(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLSHOOTINGSTAR_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLSHOOTINGSTAR(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLSHORTLINE(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLSHORTLINE_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLSHORTLINE(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLSPINNINGTOP(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLSPINNINGTOP_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLSPINNINGTOP(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLSTALLEDPATTERN(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLSTALLEDPATTERN_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLSTALLEDPATTERN(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLSTICKSANDWICH(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLSTICKSANDWICH_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLSTICKSANDWICH(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLTAKURI(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLTAKURI_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLTAKURI(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLTASUKIGAP(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLTASUKIGAP_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLTASUKIGAP(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLTHRUSTING(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLTHRUSTING_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLTHRUSTING(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLTRISTAR(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLTRISTAR_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLTRISTAR(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLUNIQUE3RIVER(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLUNIQUE3RIVER_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLUNIQUE3RIVER(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLUPSIDEGAP2CROWS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLUPSIDEGAP2CROWS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLUPSIDEGAP2CROWS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
 enforce(lookback == begin); 
 enforce(begin + num == cast(int)(inData.length)); 
 
 return TA_SUCCESS == r; 
} 
 


bool TA_CDLXSIDEGAP3METHODS(double[] inData , double[] inHigh, double[] inLow, double[] inClose , int[] outInteger ) { 
 enforce(inData.length == outInteger.length);
 
 
 int begin, num; 
 int lookback = TA_CDLXSIDEGAP3METHODS_Lookback(); 
 if (lookback >= inData.length) { 
 return false; 
 } 
 
 outInteger[0..lookback] = 0;
 
 auto r = talibd.talib.TA_CDLXSIDEGAP3METHODS(0, cast(int)(inData.length-1), inData.ptr, inHigh.ptr,inLow.ptr,inClose.ptr, &begin, &num ,
 &(outInteger[lookback])); 
 
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
 if (lookback >= inData.length) { 
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
 if (lookback >= inData.length) { 
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
 

