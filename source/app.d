import std.algorithm;
import std.csv;
import std.math;
import std.stdio;
import std.typecons;

import fluent.asserts;
public import jdiutil;
import talibd;


void main() {
  writeln("Run some tests");
  string fn = "testdata/SPY.csv";
  auto file = File(fn, "r");
  auto r = file.byLine.joiner("\n");
  double[] prices;
  foreach (record; csvReader!(Tuple!(string, double, double, double, double, double, double,))(r, null)) {
    prices ~= record[$-1];
  }
  writeln(mixin(_S!"{prices.length}"));

  Assert.equal(prices.length, 755);

  writeln("test TA_MA");
  double[] sma10 = new double[prices.length];
  double[] sma20 = new double[prices.length];
  assert(isNaN(sma10[  0]));
  assert(isNaN(sma20[  0]));
  assert(isNaN(sma20[$-1]));

  TA_MA(prices, sma10, 10);
  TA_MA(prices, sma20);

  double maxRelDiff = 1e-05;
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
