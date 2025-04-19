import talib


# lib/ta-lib-code/ta-lib/c/src/ta_func/ta_CDLMORNINGSTAR.c
# /* Generated */        optInPenetration = 3.000000e-1;
# need optInPenetration

NEED_OPTIN_FUNCS = set([
  "CDLABANDONEDBABY",
  "CDLDARKCLOUDCOVER",
  "CDLEVENINGDOJISTAR",
  "CDLEVENINGSTAR",
  "CDLMATHOLD",
  "CDLMORNINGDOJISTAR",
  "CDLMORNINGSTAR",
])


def gen_talib_cdl_funcs():
  max_macro_n = 5

  fnames = talib.get_functions()
  fnames = [name for name in fnames if name[:3] == "CDL"]

  for i, name in enumerate(fnames):  # loop to call all CDL functions
    if i % max_macro_n == 0:
      # print("#define CDL_FUNCS_%s \\" % (i // max_macro_n))
      pass

    # tail = "\n" if (i % max_macro_n == (max_macro_n-1)) or (i == len(fnames)-1) else ", \\"

    tail = ")"
    decl = "DECL_TA_CDL_FUNC"
    if name in NEED_OPTIN_FUNCS:
      decl += "_1"
    print(decl + "(" + name + tail)

  # print()


if __name__ == "__main__":
  gen_talib_cdl_funcs()

