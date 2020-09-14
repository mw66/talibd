
all:
	make -B source/talib_func.d
	dub build -q
	./talibd

DPP=~/.dub/packages/dpp-0.4.2/dpp/bin/d++
DPPFLAGS = --preprocess-only --hard-fail --include-path=/home/linuxbrew/.linuxbrew/Cellar/ta-lib/0.4.0/include/ta-lib --keep-d-files --compiler=ldmd2 #dmd #ldc2 #
talib:
	$(DPP) $(DPPFLAGS) source/talib.dpp

source/talib_func.d: source/talib_func.h
	cpp -P $< | sed 's/__NL__/\n/g' > $@

clean:
	dub clean
