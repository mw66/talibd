module talibd.oo;

import talibd.talib;
import talibd.talib_func;

// oo wrapper

class PriceViewer {
  // this object does not own the prices data, only hold a (slice) view of it
  double[] _prices;
}

class ExponentialMovingAverage : PriceViewer {
  int _period;
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

alias EMA = ExponentialMovingAverage;


// https://school.stockcharts.com/doku.php?id=technical_indicators:macd-histogram
class MovingAverageConvergenceDivergence : PriceViewer {
  double[] macd;
  double[] macdSignal;
  double[] macdHist;

  public this(double[] prices) {
    _prices = prices;
    macd       = new double[_prices.length];
    macdSignal = new double[_prices.length];
    macdHist   = new double[_prices.length];
  }

  public bool calc() {
    return TA_MACD(_prices, macd, macdSignal, macdHist);
  }
}

alias MACD = MovingAverageConvergenceDivergence;

class RSI : PriceViewer {
  double[] rsi;
  public this(double[] prices) {
    _prices = prices;
    rsi     = new double[_prices.length];  // NOTE: keep all TA array the same length as the price array
  }
}
