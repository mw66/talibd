import talib;
import talibd;

// oo wrapper

class ExponentialMovingAverage {
  // this object does not own the prices data, only hold a (slice) view of it
  int _period;
  double[] _prices;
  double[] _ma;

  alias _ma this;  // so we can call ema.length, and ema[i], no need to forward such call

  public this(int period, double[] prices) {
    _period = period;
    _prices = prices;

    _ma = new double[_prices.length];
  }

  // every time the _prices is changed outside, call this method to update _ma
  public bool calc() {
    return TA_MA(_prices, _ma, _period, TA_MAType_EMA);
  }
}
