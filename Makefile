
DUB=dub # /usr/bin/dub

SRC=source/talibd


all:
	make -B $(SRC)/talib_func.d
	$(DUB) test --build=unittest


DPP=~/.dub/packages/dpp-0.4.2/dpp/bin/d++
DPPFLAGS = --preprocess-only --hard-fail --include-path=/home/linuxbrew/.linuxbrew/Cellar/ta-lib/0.4.0/include/ta-lib --keep-d-files --compiler=ldmd2 #dmd #ldc2 #
talib:
	$(DPP) $(DPPFLAGS) $(SRC)/talib.dpp

NEW_LINE=______
$(SRC)/talib_func.d: $(SRC)/talib_func.h
	cpp -std=c2x -P $< | sed 's/$(NEW_LINE)/\n/g' > $@

clean:
	$(DUB) clean
