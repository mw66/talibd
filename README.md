

# D wrapper for https://ta-lib.org/

# pre-req:
## ta-lib https://ta-lib.org/
### download, and build

https://ta-lib.org/hdr_dw.html

http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz

* build talib Linux Static Libraries
* please check https://github.com/mingwugmail/talibd/blob/master/lib/Makefile
```
$ cd lib && make
```

## DPP
NOTE: source/talib.d has been manually modified due to: 
https://github.com/atilaneves/dpp/issues/272


# Design:

* the output and the input data are of the same length, and are *end-aligned*!
* the output is front-padded with 0 instead of NaN, i.e the [lookback area](https://www.ta-lib.org/d_api/d_api.html#Output%20Size)

# Demo:

https://github.com/mingwugmail/talibd/blob/master/source/app.d

just type `make` to run it:
```
$ make
...


Run some tests
prices.length=755
test TA_MA
prices[$-1]=334.06 sma10[9]=236.502 sma10[$-1]=343.91 sma20[$-1]=342.521
test TA_RSI
prices[$-1]=334.06 rsi14[14]=80.4548 rsi14[$-1]=45.0602
test TA_MACD
prices[$-1]=334.06 macd[$-1]=1.86243 macdSignal[$-1]=4.30537 macdHist[$-1]=-2.44294

```
