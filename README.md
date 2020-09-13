

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
NOTE: source/talibd.d has been manually modified due to: 
https://github.com/atilaneves/dpp/issues/272


# Design:

* the output and the input data are of the same length, and are *end-aligned*!
* the output is front-padded with 0 instead of NaN, i.e the [lookback area](// https://www.ta-lib.org/d_api/d_api.html#Output%20Size)
