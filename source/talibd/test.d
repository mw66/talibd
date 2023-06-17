module talibd.test;

import std.algorithm;
import std.csv;
import std.experimental.logger;
import std.math;
import std.stdio;
import std.typecons;

import fluent.asserts;
public import jdiutil;

public import talibd.talib;       // raw D interface of C
public import talibd.talib_func;  // simplified D func
public import talibd.oo;          // D wrapper


alias logger = std.experimental.logger;


unittest {

  // NOTE: in talibd, SMA lookback and TA_RSI lookback has different relation to default_RSI_optInTimePeriod:
  // The lookback function indicates how many inputs are consume before the first output can be calculated.
  // Example: A simple moving average (SMA) of period 10 will have a lookback of 9.
  int rsiLb = TA_RSI_Lookback(default_RSI_optInTimePeriod);
  int maLb  = TA_MA_Lookback( default_RSI_optInTimePeriod, TA_MAType_SMA);
  Assert.equal(default_RSI_optInTimePeriod, rsiLb);
  Assert.equal(default_RSI_optInTimePeriod, maLb+1);

  {
  int lb = TA_RSI_Lookback(5);
  Assert.equal(lb, 5);  // lookback is 5!
  }

  {
  int lb = TA_MA_Lookback(5, TA_MAType_SMA);
  Assert.equal(lb, 4);  // lookback is 4, so we must have ma.length = 5 to write the 1st value
  }

  // lookback must be the valid output array index
  // output_sma[lookback] and output_rsi[lookback] contain the 1st output value
  {
  double[4] price;
  double[4] ma;  // not long enough to write the 1st output
  bool ok = TA_MA(price, ma, 5);
  Assert.equal(ok, false);
  }

  {
  double[5] price;
  double[5] ma;  // now long enough to write the 1st output
  bool ok = TA_MA(price, ma, 5);
  Assert.equal(ok, true);
  }
}


unittest {

void main() {
  writeln("read test data");
  string fn = "testdata/SPY.csv";
  auto file = File(fn, "r");
  auto lines = file.byLine.joiner("\n");
  double[] prices;
  foreach (record; csvReader!(Tuple!(string, double, double, double, double, double, double,))(lines, null)) {
    prices ~= record[$-1];
  }
  writeln(mixin(_S!"{prices.length}"));

  Assert.equal(prices.length, 755);

  double maxRelDiff = 1e-05;

  {
  logger.trace("test talib C interface");

  int begin, num, end;
  double[] dailyCloses = prices;
  // The lookback function indicates how many inputs are consume before the first output can be calculated.
  // Example: A simple moving average (SMA) of period 10 will have a lookback of 9.
  int rsiLb = TA_RSI_Lookback(default_RSI_optInTimePeriod);
  int maLb  = TA_MA_Lookback( default_RSI_optInTimePeriod, TA_MAType_SMA);
  Assert.equal(default_RSI_optInTimePeriod, rsiLb);
  Assert.equal(default_RSI_optInTimePeriod, maLb+1);

  // call raw talib
  double[] dailyRSI;
  dailyRSI    = new double[dailyCloses.length];
  auto r = TA_RSI(0, cast(int)(dailyCloses.length-1), dailyCloses.ptr, default_RSI_optInTimePeriod, &begin, &num,   dailyRSI.ptr);
  // NOTE: talib output index starts from 0!
  // https://ta-lib.org/d_api/d_api.html#Direct%20call%20to%20a%20TA%20Function
  Assert.equal(default_RSI_optInTimePeriod, begin);  // RSI's start 0-data need to compare with prev close, so this assert holds; in contrast for TA_MA
//Assert.equal(DEFAULT_MA_PERIOD,  begin+1);
  logger.trace(mixin(_S!"{r; begin; num; dailyRSI[0]; dailyRSI[num-3]; dailyRSI[num-1]; dailyRSI[num]}"));

  // end-index-aligned talib output
  dailyRSI    = new double[dailyCloses.length];
  dailyRSI[]  = 0;
       r = TA_RSI(0, cast(int)(dailyCloses.length-1), dailyCloses.ptr, default_RSI_optInTimePeriod, &begin, &num, &(dailyRSI[default_RSI_optInTimePeriod]));
  logger.trace(mixin(_S!"{r; begin; num; dailyRSI[0]; dailyRSI[default_RSI_optInTimePeriod-1]; dailyRSI[default_RSI_optInTimePeriod]; dailyRSI[$-3]; dailyRSI[$-1];}"));
  assert( isZero(dailyRSI[0]));
  assert( isZero(dailyRSI[default_RSI_optInTimePeriod-1]));
  assert(!isZero(dailyRSI[default_RSI_optInTimePeriod]));
  assert(!isZero(dailyRSI[$-1]));

  // test talibd
  bool ok = TA_RSI(dailyCloses, dailyRSI);
  assert(ok);
  assert( isZero(dailyRSI[0]));
  assert( isZero(dailyRSI[default_RSI_optInTimePeriod-1]));
  assert(!isZero(dailyRSI[default_RSI_optInTimePeriod]));
  assert(!isZero(dailyRSI[$-1]));
  }

  {  // raw api test
  writeln("test TA_MA");
  double[] sma10 = new double[prices.length];
  double[] sma20 = new double[prices.length];
  assert(isNaN(sma10[  0]));
  assert(isNaN(sma20[  0]));
  assert(isNaN(sma20[$-1]));

  TA_MA(prices, sma10, 10);
  TA_MA(prices, sma20);

  writeln(mixin(_S!"{prices[$-1]; sma10[9]; sma10[$-1]; sma20[$-1]}"));
  assert(approxEqual(prices[$-1], 334.06, maxRelDiff));
  assert(approxEqual( sma20[$-1], 342.52, maxRelDiff));

  assert(approxEqual( sma10[  0],      0, maxRelDiff));
  assert(approxEqual( sma10[  8],      0, maxRelDiff));
  assert(approxEqual( sma10[  9], 236.50, maxRelDiff));  // 1st non-zero value!
  assert(approxEqual( sma10[$-1], 343.91, maxRelDiff));

  writeln("test TA_RSI");
  double[] rsi14 = new double[prices.length];
  TA_RSI(prices, rsi14);
  writeln(mixin(_S!"{prices[$-1]; rsi14[14]; rsi14[$-1]}"));
  assert(approxEqual(rsi14[ 13],       0, maxRelDiff));
  assert(approxEqual(rsi14[ 14], 80.4548, maxRelDiff));  // 1st non-zero value!
  assert(approxEqual(rsi14[$-1],   45.06, maxRelDiff));
  }

  {  // oo test
  writeln("test TA_MACD");
  auto macd = new MACD(prices);
  macd.calc();
  writeln(mixin(_S!"{prices[$-1]; macd.macd[$-1]; macd.macdSignal[$-1]; macd.macdHist[$-1]}"));
  assert(approxEqual(macd.macd      [$-1],  1.86243, maxRelDiff));
  assert(approxEqual(macd.macdSignal[$-1],  4.30537, maxRelDiff));
  assert(approxEqual(macd.macdHist  [$-1], -2.44294, maxRelDiff));
  }

  {  // oo test
  auto ema13 = new ExponentialMovingAverage(13, prices);
  ema13.calc();
  writeln(mixin(_S!"{prices[$-1]; ema13[11]; ema13[12]; ema13[$-1]}"));
  assert(approxEqual(ema13[ 11],       0, maxRelDiff));
  assert(approxEqual(ema13[ 12], 236.762, maxRelDiff));  // 1st non-zero value!
  assert(approxEqual(ema13[$-1], 340.794, maxRelDiff));
  }
}

main();

}
