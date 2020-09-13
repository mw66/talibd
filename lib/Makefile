
# do NOT use shared library:
# wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
#
# we need build static lib:
# https://sourceforge.net/p/ta-lib/code/HEAD/tree/trunk/ta-lib/
# https://www.ta-lib.org/d_api/d_api.html
# 2.3.1 Linux Static Libraries
# build the cmd version: use ta_libc_cmd.lib
# ignore build error: undefined reference to `TA_IMI'

lib:
	tar xzf ta-lib-code.tgz
	cd ta-lib-code/ta-lib/c/make/cmd/linux/g++ && make clean && make

dl:
	svn checkout https://svn.code.sf.net/p/ta-lib/code/trunk ta-lib-code
