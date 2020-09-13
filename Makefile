
all:
	make -B source/talibd.d
	dub build
	./talibd

DPP=~/.dub/packages/dpp-0.4.2/dpp/bin/d++
DPPFLAGS = --preprocess-only --hard-fail --include-path=/home/linuxbrew/.linuxbrew/Cellar/ta-lib/0.4.0/include/ta-lib --keep-d-files --compiler=ldmd2 #dmd #ldc2 #
talib:
	$(DPP) $(DPPFLAGS) source/talib.dpp

source/talibd.d: source/talibd.h
	cpp -P $< | sed 's/__NL__/\n/g' > $@

clean:
	dub clean
