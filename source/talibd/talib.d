module talibd.talib;

public import core.stdc.stdio;


        import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;
        static import std.conv;

        struct Int128 { long lower; long upper; }
        struct UInt128 { ulong lower; ulong upper; }

        struct __locale_data { int dummy; }



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }

    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }


    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C)
{
    struct __mbstate_t
    {
        int __count;
        static union _Anonymous_0
        {
            uint __wch;
            char[4] __wchb;
        }
        _Anonymous_0 __value;
    }
    alias __FILE = _IO_FILE;
version (DigitalMars) {
    struct _IO_FILE
    {
        int _flags;
        char* _IO_read_ptr;
        char* _IO_read_end;
        char* _IO_read_base;
        char* _IO_write_base;
        char* _IO_write_ptr;
        char* _IO_write_end;
        char* _IO_buf_base;
        char* _IO_buf_end;
        char* _IO_save_base;
        char* _IO_backup_base;
        char* _IO_save_end;
        _IO_marker* _markers;
        _IO_FILE* _chain;
        int _fileno;
        int _flags2;
        c_long _old_offset;
        ushort _cur_column;
        byte _vtable_offset;
        char[1] _shortbuf;
        void* _lock;
        c_long _offset;
        void* __pad1;
        void* __pad2;
        void* __pad3;
        void* __pad4;
        c_ulong __pad5;
        int _mode;
        char[20] _unused2;
    }
}
    alias FILE = _IO_FILE;
    alias __sig_atomic_t = int;
    alias __socklen_t = uint;
    alias __intptr_t = c_long;
    alias __caddr_t = char*;
    alias __loff_t = c_long;
    alias __syscall_ulong_t = c_ulong;
    alias __syscall_slong_t = c_long;
    alias __ssize_t = c_long;
    alias __fsword_t = c_long;
    alias __fsfilcnt64_t = c_ulong;
    alias __fsfilcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    alias __fsblkcnt_t = c_ulong;
    alias __blkcnt64_t = c_long;
    alias __blkcnt_t = c_long;
    alias __blksize_t = c_long;
    alias __timer_t = void*;
    alias __clockid_t = int;
    alias __key_t = int;
    alias __daddr_t = int;
    alias __suseconds_t = c_long;
    alias __useconds_t = uint;
    alias __time_t = c_long;
    alias __id_t = uint;
    alias __rlim64_t = c_ulong;
    alias __rlim_t = c_ulong;
    alias __clock_t = c_long;
    struct __fsid_t
    {
        int[2] __val;
    }
    alias __pid_t = int;
    alias __off64_t = c_long;
    alias __off_t = c_long;
    alias __nlink_t = c_ulong;
    alias __mode_t = uint;
    alias __ino64_t = c_ulong;
    alias __ino_t = c_ulong;
    alias __gid_t = uint;
    alias __uid_t = uint;
    alias __dev_t = c_ulong;
    alias __uintmax_t = c_ulong;
    alias __intmax_t = c_long;
    alias __u_quad_t = c_ulong;
    alias __quad_t = c_long;
    alias __uint64_t = c_ulong;
    alias __int64_t = c_long;
    alias __uint32_t = uint;
    alias __int32_t = int;
    alias __uint16_t = ushort;
    alias __int16_t = short;
    alias __uint8_t = ubyte;
    alias __int8_t = byte;
    alias __u_long = c_ulong;
    alias __u_int = uint;
    alias __u_short = ushort;
    alias __u_char = ubyte;
    extern __gshared const(const(char)*)[0] sys_errlist;
    extern __gshared int sys_nerr;
    void _IO_free_backup_area(_IO_FILE*) @nogc nothrow;
    c_long _IO_seekpos(_IO_FILE*, c_long, int) @nogc nothrow;
    c_long _IO_seekoff(_IO_FILE*, c_long, int, int) @nogc nothrow;
    c_ulong _IO_sgetn(_IO_FILE*, void*, c_ulong) @nogc nothrow;
    c_long _IO_padn(_IO_FILE*, int, c_long) @nogc nothrow;
    int _IO_vfprintf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;
    int _IO_vfscanf(_IO_FILE*, const(char)*, va_list*, int*) @nogc nothrow;
    pragma(mangle, "_IO_ftrylockfile") int _IO_ftrylockfile_(_IO_FILE*) @nogc nothrow;
    pragma(mangle, "_IO_funlockfile") void _IO_funlockfile_(_IO_FILE*) @nogc nothrow;
    pragma(mangle, "_IO_flockfile") void _IO_flockfile_(_IO_FILE*) @nogc nothrow;
    int _IO_peekc_locked(_IO_FILE*) @nogc nothrow;
    int _IO_ferror(_IO_FILE*) @nogc nothrow;
    int _IO_feof(_IO_FILE*) @nogc nothrow;
    int _IO_putc(int, _IO_FILE*) @nogc nothrow;
    int _IO_getc(_IO_FILE*) @nogc nothrow;
    int __overflow(_IO_FILE*, int) @nogc nothrow;
    int __uflow(_IO_FILE*) @nogc nothrow;
    int __underflow(_IO_FILE*) @nogc nothrow;
    alias __io_close_fn = int function(void*);
    alias __io_seek_fn = int function(void*, c_long*, int);
    alias __io_write_fn = c_long function(void*, const(char)*, c_ulong);
    alias __io_read_fn = c_long function(void*, char*, c_ulong);
    struct _IO_FILE_plus;
    enum __codecvt_result
    {
        __codecvt_ok = 0,
        __codecvt_partial = 1,
        __codecvt_error = 2,
        __codecvt_noconv = 3,
    }
    enum __codecvt_ok = __codecvt_result.__codecvt_ok;
    enum __codecvt_partial = __codecvt_result.__codecvt_partial;
    enum __codecvt_error = __codecvt_result.__codecvt_error;
    enum __codecvt_noconv = __codecvt_result.__codecvt_noconv;
    struct _IO_marker
    {
        _IO_marker* _next;
        _IO_FILE* _sbuf;
        int _pos;
    }
    alias _IO_lock_t = void;
    struct _IO_jump_t;
    struct _G_fpos64_t
    {
        c_long __pos;
        __mbstate_t __state;
    }
    struct _G_fpos_t
    {
        c_long __pos;
        __mbstate_t __state;
    }
    void funlockfile(_IO_FILE*) @nogc nothrow;
    int ftrylockfile(_IO_FILE*) @nogc nothrow;
    void flockfile(_IO_FILE*) @nogc nothrow;
    char* ctermid(char*) @nogc nothrow;
    int pclose(_IO_FILE*) @nogc nothrow;
    _IO_FILE* popen(const(char)*, const(char)*) @nogc nothrow;
    int fileno_unlocked(_IO_FILE*) @nogc nothrow;
    int fileno(_IO_FILE*) @nogc nothrow;
    void perror(const(char)*) @nogc nothrow;
    int ferror_unlocked(_IO_FILE*) @nogc nothrow;
    int feof_unlocked(_IO_FILE*) @nogc nothrow;
    void clearerr_unlocked(_IO_FILE*) @nogc nothrow;
    TA_RetCode TA_GroupTableAlloc(TA_StringTable**) @nogc nothrow;
    TA_RetCode TA_GroupTableFree(TA_StringTable*) @nogc nothrow;
    TA_RetCode TA_FuncTableAlloc(const(char)*, TA_StringTable**) @nogc nothrow;
    TA_RetCode TA_FuncTableFree(TA_StringTable*) @nogc nothrow;
    alias TA_FuncHandle = uint;
    TA_RetCode TA_GetFuncHandle(const(char)*, const(uint)**) @nogc nothrow;
    alias TA_FuncFlags = int;
    int ferror(_IO_FILE*) @nogc nothrow;
    struct TA_FuncInfo
    {
        const(char)* name;
        const(char)* group;
        const(char)* hint;
        const(char)* camelCaseName;
        int flags;
        uint nbInput;
        uint nbOptInput;
        uint nbOutput;
        const(uint)* handle;
    }
    TA_RetCode TA_GetFuncInfo(const(uint)*, const(TA_FuncInfo)**) @nogc nothrow;
    alias TA_CallForEachFunc = void function(const(TA_FuncInfo)*, void*);
    TA_RetCode TA_ForEachFunc(void function(const(TA_FuncInfo)*, void*), void*) @nogc nothrow;
    struct TA_RealRange
    {
        double min;
        double max;
        int precision;
        double suggested_start;
        double suggested_end;
        double suggested_increment;
    }
    struct TA_IntegerRange
    {
        int min;
        int max;
        int suggested_start;
        int suggested_end;
        int suggested_increment;
    }
    struct TA_RealDataPair
    {
        double value;
        const(char)* string;
    }
    struct TA_IntegerDataPair
    {
        int value;
        const(char)* string;
    }
    struct TA_RealList
    {
        const(TA_RealDataPair)* data;
        uint nbElement;
    }
    struct TA_IntegerList
    {
        const(TA_IntegerDataPair)* data;
        uint nbElement;
    }
    alias TA_InputParameterType = _Anonymous_1;
    enum _Anonymous_1
    {
        TA_Input_Price = 0,
        TA_Input_Real = 1,
        TA_Input_Integer = 2,
    }
    enum TA_Input_Price = _Anonymous_1.TA_Input_Price;
    enum TA_Input_Real = _Anonymous_1.TA_Input_Real;
    enum TA_Input_Integer = _Anonymous_1.TA_Input_Integer;
    alias TA_OptInputParameterType = _Anonymous_2;
    enum _Anonymous_2
    {
        TA_OptInput_RealRange = 0,
        TA_OptInput_RealList = 1,
        TA_OptInput_IntegerRange = 2,
        TA_OptInput_IntegerList = 3,
    }
    enum TA_OptInput_RealRange = _Anonymous_2.TA_OptInput_RealRange;
    enum TA_OptInput_RealList = _Anonymous_2.TA_OptInput_RealList;
    enum TA_OptInput_IntegerRange = _Anonymous_2.TA_OptInput_IntegerRange;
    enum TA_OptInput_IntegerList = _Anonymous_2.TA_OptInput_IntegerList;
    alias TA_OutputParameterType = _Anonymous_3;
    enum _Anonymous_3
    {
        TA_Output_Real = 0,
        TA_Output_Integer = 1,
    }
    enum TA_Output_Real = _Anonymous_3.TA_Output_Real;
    enum TA_Output_Integer = _Anonymous_3.TA_Output_Integer;
    alias TA_InputFlags = int;
    int feof(_IO_FILE*) @nogc nothrow;
    void clearerr(_IO_FILE*) @nogc nothrow;
    int fsetpos(_IO_FILE*, const(_G_fpos_t)*) @nogc nothrow;
    int fgetpos(_IO_FILE*, _G_fpos_t*) @nogc nothrow;
    alias TA_OptInputFlags = int;
    c_long ftello(_IO_FILE*) @nogc nothrow;
    int fseeko(_IO_FILE*, c_long, int) @nogc nothrow;
    void rewind(_IO_FILE*) @nogc nothrow;
    alias TA_OutputFlags = int;
    c_long ftell(_IO_FILE*) @nogc nothrow;
    int fseek(_IO_FILE*, c_long, int) @nogc nothrow;
    c_ulong fwrite_unlocked(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fread_unlocked(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fwrite(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fread(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    int ungetc(int, _IO_FILE*) @nogc nothrow;
    int puts(const(char)*) @nogc nothrow;
    int fputs(const(char)*, _IO_FILE*) @nogc nothrow;
    struct TA_InputParameterInfo
    {
        TA_InputParameterType type;
        const(char)* paramName;
        int flags;
    }
    struct TA_OptInputParameterInfo
    {
        TA_OptInputParameterType type;
        const(char)* paramName;
        int flags;
        const(char)* displayName;
        const(void)* dataSet;
        double defaultValue;
        const(char)* hint;
        const(char)* helpFile;
    }
    struct TA_OutputParameterInfo
    {
        TA_OutputParameterType type;
        const(char)* paramName;
        int flags;
    }
    TA_RetCode TA_GetInputParameterInfo(const(uint)*, uint, const(TA_InputParameterInfo)**) @nogc nothrow;
    TA_RetCode TA_GetOptInputParameterInfo(const(uint)*, uint, const(TA_OptInputParameterInfo)**) @nogc nothrow;
    TA_RetCode TA_GetOutputParameterInfo(const(uint)*, uint, const(TA_OutputParameterInfo)**) @nogc nothrow;
    struct TA_ParamHolder
    {
        void* hiddenData;
    }
    TA_RetCode TA_ParamHolderAlloc(const(uint)*, TA_ParamHolder**) @nogc nothrow;
    TA_RetCode TA_ParamHolderFree(TA_ParamHolder*) @nogc nothrow;
    TA_RetCode TA_SetInputParamIntegerPtr(TA_ParamHolder*, uint, const(int)*) @nogc nothrow;
    TA_RetCode TA_SetInputParamRealPtr(TA_ParamHolder*, uint, const(double)*) @nogc nothrow;
    TA_RetCode TA_SetInputParamPricePtr(TA_ParamHolder*, uint, const(double)*, const(double)*, const(double)*, const(double)*, const(double)*, const(double)*) @nogc nothrow;
    TA_RetCode TA_SetOptInputParamInteger(TA_ParamHolder*, uint, int) @nogc nothrow;
    TA_RetCode TA_SetOptInputParamReal(TA_ParamHolder*, uint, double) @nogc nothrow;
    TA_RetCode TA_SetOutputParamIntegerPtr(TA_ParamHolder*, uint, int*) @nogc nothrow;
    TA_RetCode TA_SetOutputParamRealPtr(TA_ParamHolder*, uint, double*) @nogc nothrow;
    TA_RetCode TA_GetLookback(const(TA_ParamHolder)*, int*) @nogc nothrow;
    TA_RetCode TA_CallFunc(const(TA_ParamHolder)*, int, int, int*, int*) @nogc nothrow;
    const(char)* TA_FunctionDescriptionXML() @nogc nothrow;
    const(char)* TA_GetVersionString() @nogc nothrow;
    const(char)* TA_GetVersionMajor() @nogc nothrow;
    const(char)* TA_GetVersionMinor() @nogc nothrow;
    const(char)* TA_GetVersionBuild() @nogc nothrow;
    const(char)* TA_GetVersionDate() @nogc nothrow;
    const(char)* TA_GetVersionTime() @nogc nothrow;
    alias TA_Real = double;
    alias TA_Integer = int;
    struct TA_StringTable
    {
        uint size;
        const(char)** string;
        void* hiddenData;
    }
    struct TA_RetCodeInfo
    {
        const(char)* enumStr;
        const(char)* infoStr;
    }
    void TA_SetRetCodeInfo(TA_RetCode, TA_RetCodeInfo*) @nogc nothrow;
    TA_RetCode TA_Initialize() @nogc nothrow;
    TA_RetCode TA_Shutdown() @nogc nothrow;
    c_long getline(char**, c_ulong*, _IO_FILE*) @nogc nothrow;
    alias Int32 = int;
    alias UInt32 = uint;
    alias Int64 = c_long;
    alias UInt64 = c_ulong;
    c_long getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;
    c_long __getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;
    char* fgets(char*, int, _IO_FILE*) @nogc nothrow;
    int putw(int, _IO_FILE*) @nogc nothrow;
    int getw(_IO_FILE*) @nogc nothrow;
    int putchar_unlocked(int) @nogc nothrow;
    int putc_unlocked(int, _IO_FILE*) @nogc nothrow;
    int fputc_unlocked(int, _IO_FILE*) @nogc nothrow;
    int putchar(int) @nogc nothrow;
    pragma(mangle, "putc") int putc_(int, _IO_FILE*) @nogc nothrow;
    int fputc(int, _IO_FILE*) @nogc nothrow;
    int fgetc_unlocked(_IO_FILE*) @nogc nothrow;
    int getchar_unlocked() @nogc nothrow;
    int getc_unlocked(_IO_FILE*) @nogc nothrow;
    int getchar() @nogc nothrow;
    alias TA_RetCode = _Anonymous_4;
    enum _Anonymous_4
    {
        TA_SUCCESS = 0,
        TA_LIB_NOT_INITIALIZE = 1,
        TA_BAD_PARAM = 2,
        TA_ALLOC_ERR = 3,
        TA_GROUP_NOT_FOUND = 4,
        TA_FUNC_NOT_FOUND = 5,
        TA_INVALID_HANDLE = 6,
        TA_INVALID_PARAM_HOLDER = 7,
        TA_INVALID_PARAM_HOLDER_TYPE = 8,
        TA_INVALID_PARAM_FUNCTION = 9,
        TA_INPUT_NOT_ALL_INITIALIZE = 10,
        TA_OUTPUT_NOT_ALL_INITIALIZE = 11,
        TA_OUT_OF_RANGE_START_INDEX = 12,
        TA_OUT_OF_RANGE_END_INDEX = 13,
        TA_INVALID_LIST_TYPE = 14,
        TA_BAD_OBJECT = 15,
        TA_NOT_SUPPORTED = 16,
        TA_INTERNAL_ERROR = 5000,
        TA_UNKNOWN_ERR = 65535,
    }
    enum TA_SUCCESS = _Anonymous_4.TA_SUCCESS;
    enum TA_LIB_NOT_INITIALIZE = _Anonymous_4.TA_LIB_NOT_INITIALIZE;
    enum TA_BAD_PARAM = _Anonymous_4.TA_BAD_PARAM;
    enum TA_ALLOC_ERR = _Anonymous_4.TA_ALLOC_ERR;
    enum TA_GROUP_NOT_FOUND = _Anonymous_4.TA_GROUP_NOT_FOUND;
    enum TA_FUNC_NOT_FOUND = _Anonymous_4.TA_FUNC_NOT_FOUND;
    enum TA_INVALID_HANDLE = _Anonymous_4.TA_INVALID_HANDLE;
    enum TA_INVALID_PARAM_HOLDER = _Anonymous_4.TA_INVALID_PARAM_HOLDER;
    enum TA_INVALID_PARAM_HOLDER_TYPE = _Anonymous_4.TA_INVALID_PARAM_HOLDER_TYPE;
    enum TA_INVALID_PARAM_FUNCTION = _Anonymous_4.TA_INVALID_PARAM_FUNCTION;
    enum TA_INPUT_NOT_ALL_INITIALIZE = _Anonymous_4.TA_INPUT_NOT_ALL_INITIALIZE;
    enum TA_OUTPUT_NOT_ALL_INITIALIZE = _Anonymous_4.TA_OUTPUT_NOT_ALL_INITIALIZE;
    enum TA_OUT_OF_RANGE_START_INDEX = _Anonymous_4.TA_OUT_OF_RANGE_START_INDEX;
    enum TA_OUT_OF_RANGE_END_INDEX = _Anonymous_4.TA_OUT_OF_RANGE_END_INDEX;
    enum TA_INVALID_LIST_TYPE = _Anonymous_4.TA_INVALID_LIST_TYPE;
    enum TA_BAD_OBJECT = _Anonymous_4.TA_BAD_OBJECT;
    enum TA_NOT_SUPPORTED = _Anonymous_4.TA_NOT_SUPPORTED;
    enum TA_INTERNAL_ERROR = _Anonymous_4.TA_INTERNAL_ERROR;
    enum TA_UNKNOWN_ERR = _Anonymous_4.TA_UNKNOWN_ERR;
    enum _Anonymous_5
    {
        TA_COMPATIBILITY_DEFAULT = 0,
        TA_COMPATIBILITY_METASTOCK = 1,
    }
    enum TA_COMPATIBILITY_DEFAULT = _Anonymous_5.TA_COMPATIBILITY_DEFAULT;
    enum TA_COMPATIBILITY_METASTOCK = _Anonymous_5.TA_COMPATIBILITY_METASTOCK;
    alias TA_Compatibility = _Anonymous_5;
    enum _Anonymous_6
    {
        TA_MAType_SMA = 0,
        TA_MAType_EMA = 1,
        TA_MAType_WMA = 2,
        TA_MAType_DEMA = 3,
        TA_MAType_TEMA = 4,
        TA_MAType_TRIMA = 5,
        TA_MAType_KAMA = 6,
        TA_MAType_MAMA = 7,
        TA_MAType_T3 = 8,
    }
    enum TA_MAType_SMA = _Anonymous_6.TA_MAType_SMA;
    enum TA_MAType_EMA = _Anonymous_6.TA_MAType_EMA;
    enum TA_MAType_WMA = _Anonymous_6.TA_MAType_WMA;
    enum TA_MAType_DEMA = _Anonymous_6.TA_MAType_DEMA;
    enum TA_MAType_TEMA = _Anonymous_6.TA_MAType_TEMA;
    enum TA_MAType_TRIMA = _Anonymous_6.TA_MAType_TRIMA;
    enum TA_MAType_KAMA = _Anonymous_6.TA_MAType_KAMA;
    enum TA_MAType_MAMA = _Anonymous_6.TA_MAType_MAMA;
    enum TA_MAType_T3 = _Anonymous_6.TA_MAType_T3;
    alias TA_MAType = _Anonymous_6;
    alias TA_FuncUnstId = _Anonymous_7;
    enum _Anonymous_7
    {
        TA_FUNC_UNST_ADX = 0,
        TA_FUNC_UNST_ADXR = 1,
        TA_FUNC_UNST_ATR = 2,
        TA_FUNC_UNST_CMO = 3,
        TA_FUNC_UNST_DX = 4,
        TA_FUNC_UNST_EMA = 5,
        TA_FUNC_UNST_HT_DCPERIOD = 6,
        TA_FUNC_UNST_HT_DCPHASE = 7,
        TA_FUNC_UNST_HT_PHASOR = 8,
        TA_FUNC_UNST_HT_SINE = 9,
        TA_FUNC_UNST_HT_TRENDLINE = 10,
        TA_FUNC_UNST_HT_TRENDMODE = 11,
        TA_FUNC_UNST_KAMA = 12,
        TA_FUNC_UNST_MAMA = 13,
        TA_FUNC_UNST_MFI = 14,
        TA_FUNC_UNST_MINUS_DI = 15,
        TA_FUNC_UNST_MINUS_DM = 16,
        TA_FUNC_UNST_NATR = 17,
        TA_FUNC_UNST_PLUS_DI = 18,
        TA_FUNC_UNST_PLUS_DM = 19,
        TA_FUNC_UNST_RSI = 20,
        TA_FUNC_UNST_STOCHRSI = 21,
        TA_FUNC_UNST_T3 = 22,
        TA_FUNC_UNST_ALL = 23,
        TA_FUNC_UNST_NONE = -1,
    }
    enum TA_FUNC_UNST_ADX = _Anonymous_7.TA_FUNC_UNST_ADX;
    enum TA_FUNC_UNST_ADXR = _Anonymous_7.TA_FUNC_UNST_ADXR;
    enum TA_FUNC_UNST_ATR = _Anonymous_7.TA_FUNC_UNST_ATR;
    enum TA_FUNC_UNST_CMO = _Anonymous_7.TA_FUNC_UNST_CMO;
    enum TA_FUNC_UNST_DX = _Anonymous_7.TA_FUNC_UNST_DX;
    enum TA_FUNC_UNST_EMA = _Anonymous_7.TA_FUNC_UNST_EMA;
    enum TA_FUNC_UNST_HT_DCPERIOD = _Anonymous_7.TA_FUNC_UNST_HT_DCPERIOD;
    enum TA_FUNC_UNST_HT_DCPHASE = _Anonymous_7.TA_FUNC_UNST_HT_DCPHASE;
    enum TA_FUNC_UNST_HT_PHASOR = _Anonymous_7.TA_FUNC_UNST_HT_PHASOR;
    enum TA_FUNC_UNST_HT_SINE = _Anonymous_7.TA_FUNC_UNST_HT_SINE;
    enum TA_FUNC_UNST_HT_TRENDLINE = _Anonymous_7.TA_FUNC_UNST_HT_TRENDLINE;
    enum TA_FUNC_UNST_HT_TRENDMODE = _Anonymous_7.TA_FUNC_UNST_HT_TRENDMODE;
    enum TA_FUNC_UNST_KAMA = _Anonymous_7.TA_FUNC_UNST_KAMA;
    enum TA_FUNC_UNST_MAMA = _Anonymous_7.TA_FUNC_UNST_MAMA;
    enum TA_FUNC_UNST_MFI = _Anonymous_7.TA_FUNC_UNST_MFI;
    enum TA_FUNC_UNST_MINUS_DI = _Anonymous_7.TA_FUNC_UNST_MINUS_DI;
    enum TA_FUNC_UNST_MINUS_DM = _Anonymous_7.TA_FUNC_UNST_MINUS_DM;
    enum TA_FUNC_UNST_NATR = _Anonymous_7.TA_FUNC_UNST_NATR;
    enum TA_FUNC_UNST_PLUS_DI = _Anonymous_7.TA_FUNC_UNST_PLUS_DI;
    enum TA_FUNC_UNST_PLUS_DM = _Anonymous_7.TA_FUNC_UNST_PLUS_DM;
    enum TA_FUNC_UNST_RSI = _Anonymous_7.TA_FUNC_UNST_RSI;
    enum TA_FUNC_UNST_STOCHRSI = _Anonymous_7.TA_FUNC_UNST_STOCHRSI;
    enum TA_FUNC_UNST_T3 = _Anonymous_7.TA_FUNC_UNST_T3;
    enum TA_FUNC_UNST_ALL = _Anonymous_7.TA_FUNC_UNST_ALL;
    enum TA_FUNC_UNST_NONE = _Anonymous_7.TA_FUNC_UNST_NONE;
    enum _Anonymous_8
    {
        TA_RangeType_RealBody = 0,
        TA_RangeType_HighLow = 1,
        TA_RangeType_Shadows = 2,
    }
    enum TA_RangeType_RealBody = _Anonymous_8.TA_RangeType_RealBody;
    enum TA_RangeType_HighLow = _Anonymous_8.TA_RangeType_HighLow;
    enum TA_RangeType_Shadows = _Anonymous_8.TA_RangeType_Shadows;
    alias TA_RangeType = _Anonymous_8;
    alias TA_CandleSettingType = _Anonymous_9;
    enum _Anonymous_9
    {
        TA_BodyLong = 0,
        TA_BodyVeryLong = 1,
        TA_BodyShort = 2,
        TA_BodyDoji = 3,
        TA_ShadowLong = 4,
        TA_ShadowVeryLong = 5,
        TA_ShadowShort = 6,
        TA_ShadowVeryShort = 7,
        TA_Near = 8,
        TA_Far = 9,
        TA_Equal = 10,
        TA_AllCandleSettings = 11,
    }
    enum TA_BodyLong = _Anonymous_9.TA_BodyLong;
    enum TA_BodyVeryLong = _Anonymous_9.TA_BodyVeryLong;
    enum TA_BodyShort = _Anonymous_9.TA_BodyShort;
    enum TA_BodyDoji = _Anonymous_9.TA_BodyDoji;
    enum TA_ShadowLong = _Anonymous_9.TA_ShadowLong;
    enum TA_ShadowVeryLong = _Anonymous_9.TA_ShadowVeryLong;
    enum TA_ShadowShort = _Anonymous_9.TA_ShadowShort;
    enum TA_ShadowVeryShort = _Anonymous_9.TA_ShadowVeryShort;
    enum TA_Near = _Anonymous_9.TA_Near;
    enum TA_Far = _Anonymous_9.TA_Far;
    enum TA_Equal = _Anonymous_9.TA_Equal;
    enum TA_AllCandleSettings = _Anonymous_9.TA_AllCandleSettings;
    pragma(mangle, "getc") int getc_(_IO_FILE*) @nogc nothrow;
    TA_RetCode TA_ACOS(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ACOS(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_ACOS_Lookback() @nogc nothrow;
    TA_RetCode TA_AD(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_AD(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_AD_Lookback() @nogc nothrow;
    TA_RetCode TA_ADD(int, int, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ADD(int, int, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_ADD_Lookback() @nogc nothrow;
    TA_RetCode TA_ADOSC(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ADOSC(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int, int, int*, int*, double*) @nogc nothrow;
    int TA_ADOSC_Lookback(int, int) @nogc nothrow;
    TA_RetCode TA_ADX(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ADX(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_ADX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_ADXR(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ADXR(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_ADXR_Lookback(int) @nogc nothrow;
    TA_RetCode TA_APO(int, int, const(double)*, int, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_APO(int, int, const(float)*, int, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    int TA_APO_Lookback(int, int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_AROON(int, int, const(double)*, const(double)*, int, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_AROON(int, int, const(float)*, const(float)*, int, int*, int*, double*, double*) @nogc nothrow;
    int TA_AROON_Lookback(int) @nogc nothrow;
    TA_RetCode TA_AROONOSC(int, int, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_AROONOSC(int, int, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_AROONOSC_Lookback(int) @nogc nothrow;
    TA_RetCode TA_ASIN(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ASIN(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_ASIN_Lookback() @nogc nothrow;
    TA_RetCode TA_ATAN(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ATAN(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_ATAN_Lookback() @nogc nothrow;
    TA_RetCode TA_ATR(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ATR(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_ATR_Lookback(int) @nogc nothrow;
    TA_RetCode TA_AVGPRICE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_AVGPRICE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_AVGPRICE_Lookback() @nogc nothrow;
    TA_RetCode TA_BBANDS(int, int, const(double)*, int, double, double, TA_MAType, int*, int*, double*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_BBANDS(int, int, const(float)*, int, double, double, TA_MAType, int*, int*, double*, double*, double*) @nogc nothrow;
    int TA_BBANDS_Lookback(int, double, double, TA_MAType) @nogc nothrow;
    TA_RetCode TA_BETA(int, int, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_BETA(int, int, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_BETA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_BOP(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_BOP(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_BOP_Lookback() @nogc nothrow;
    TA_RetCode TA_CCI(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_CCI(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_CCI_Lookback(int) @nogc nothrow;
    TA_RetCode TA_CDL2CROWS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDL2CROWS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDL2CROWS_Lookback() @nogc nothrow;
    TA_RetCode TA_CDL3BLACKCROWS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDL3BLACKCROWS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDL3BLACKCROWS_Lookback() @nogc nothrow;
    TA_RetCode TA_CDL3INSIDE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDL3INSIDE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDL3INSIDE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDL3LINESTRIKE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDL3LINESTRIKE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDL3LINESTRIKE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDL3OUTSIDE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDL3OUTSIDE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDL3OUTSIDE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDL3STARSINSOUTH(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDL3STARSINSOUTH(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDL3STARSINSOUTH_Lookback() @nogc nothrow;
    TA_RetCode TA_CDL3WHITESOLDIERS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDL3WHITESOLDIERS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDL3WHITESOLDIERS_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLABANDONEDBABY(int, int, const(double)*, const(double)*, const(double)*, const(double)*, double, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLABANDONEDBABY(int, int, const(float)*, const(float)*, const(float)*, const(float)*, double, int*, int*, int*) @nogc nothrow;
    int TA_CDLABANDONEDBABY_Lookback(double) @nogc nothrow;
    TA_RetCode TA_CDLADVANCEBLOCK(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLADVANCEBLOCK(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLADVANCEBLOCK_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLBELTHOLD(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLBELTHOLD(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLBELTHOLD_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLBREAKAWAY(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLBREAKAWAY(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLBREAKAWAY_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLCLOSINGMARUBOZU(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLCLOSINGMARUBOZU(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLCLOSINGMARUBOZU_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLCONCEALBABYSWALL(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLCONCEALBABYSWALL(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLCONCEALBABYSWALL_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLCOUNTERATTACK(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLCOUNTERATTACK(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLCOUNTERATTACK_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLDARKCLOUDCOVER(int, int, const(double)*, const(double)*, const(double)*, const(double)*, double, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLDARKCLOUDCOVER(int, int, const(float)*, const(float)*, const(float)*, const(float)*, double, int*, int*, int*) @nogc nothrow;
    int TA_CDLDARKCLOUDCOVER_Lookback(double) @nogc nothrow;
    TA_RetCode TA_CDLDOJI(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLDOJI(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLDOJI_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLDOJISTAR(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLDOJISTAR(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLDOJISTAR_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLDRAGONFLYDOJI(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLDRAGONFLYDOJI(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLDRAGONFLYDOJI_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLENGULFING(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLENGULFING(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLENGULFING_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLEVENINGDOJISTAR(int, int, const(double)*, const(double)*, const(double)*, const(double)*, double, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLEVENINGDOJISTAR(int, int, const(float)*, const(float)*, const(float)*, const(float)*, double, int*, int*, int*) @nogc nothrow;
    int TA_CDLEVENINGDOJISTAR_Lookback(double) @nogc nothrow;
    TA_RetCode TA_CDLEVENINGSTAR(int, int, const(double)*, const(double)*, const(double)*, const(double)*, double, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLEVENINGSTAR(int, int, const(float)*, const(float)*, const(float)*, const(float)*, double, int*, int*, int*) @nogc nothrow;
    int TA_CDLEVENINGSTAR_Lookback(double) @nogc nothrow;
    TA_RetCode TA_CDLGAPSIDESIDEWHITE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLGAPSIDESIDEWHITE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLGAPSIDESIDEWHITE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLGRAVESTONEDOJI(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLGRAVESTONEDOJI(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLGRAVESTONEDOJI_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHAMMER(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHAMMER(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHAMMER_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHANGINGMAN(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHANGINGMAN(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHANGINGMAN_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHARAMI(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHARAMI(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHARAMI_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHARAMICROSS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHARAMICROSS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHARAMICROSS_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHIGHWAVE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHIGHWAVE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHIGHWAVE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHIKKAKE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHIKKAKE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHIKKAKE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHIKKAKEMOD(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHIKKAKEMOD(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHIKKAKEMOD_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLHOMINGPIGEON(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLHOMINGPIGEON(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLHOMINGPIGEON_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLIDENTICAL3CROWS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLIDENTICAL3CROWS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLIDENTICAL3CROWS_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLINNECK(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLINNECK(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLINNECK_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLINVERTEDHAMMER(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLINVERTEDHAMMER(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLINVERTEDHAMMER_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLKICKING(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLKICKING(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLKICKING_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLKICKINGBYLENGTH(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLKICKINGBYLENGTH(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLKICKINGBYLENGTH_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLLADDERBOTTOM(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLLADDERBOTTOM(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLLADDERBOTTOM_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLLONGLEGGEDDOJI(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLLONGLEGGEDDOJI(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLLONGLEGGEDDOJI_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLLONGLINE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLLONGLINE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLLONGLINE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLMARUBOZU(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLMARUBOZU(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLMARUBOZU_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLMATCHINGLOW(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLMATCHINGLOW(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLMATCHINGLOW_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLMATHOLD(int, int, const(double)*, const(double)*, const(double)*, const(double)*, double, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLMATHOLD(int, int, const(float)*, const(float)*, const(float)*, const(float)*, double, int*, int*, int*) @nogc nothrow;
    int TA_CDLMATHOLD_Lookback(double) @nogc nothrow;
    TA_RetCode TA_CDLMORNINGDOJISTAR(int, int, const(double)*, const(double)*, const(double)*, const(double)*, double, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLMORNINGDOJISTAR(int, int, const(float)*, const(float)*, const(float)*, const(float)*, double, int*, int*, int*) @nogc nothrow;
    int TA_CDLMORNINGDOJISTAR_Lookback(double) @nogc nothrow;
    TA_RetCode TA_CDLMORNINGSTAR(int, int, const(double)*, const(double)*, const(double)*, const(double)*, double, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLMORNINGSTAR(int, int, const(float)*, const(float)*, const(float)*, const(float)*, double, int*, int*, int*) @nogc nothrow;
    int TA_CDLMORNINGSTAR_Lookback(double) @nogc nothrow;
    TA_RetCode TA_CDLONNECK(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLONNECK(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLONNECK_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLPIERCING(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLPIERCING(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLPIERCING_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLRICKSHAWMAN(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLRICKSHAWMAN(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLRICKSHAWMAN_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLRISEFALL3METHODS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLRISEFALL3METHODS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLRISEFALL3METHODS_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLSEPARATINGLINES(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLSEPARATINGLINES(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLSEPARATINGLINES_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLSHOOTINGSTAR(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLSHOOTINGSTAR(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLSHOOTINGSTAR_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLSHORTLINE(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLSHORTLINE(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLSHORTLINE_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLSPINNINGTOP(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLSPINNINGTOP(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLSPINNINGTOP_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLSTALLEDPATTERN(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLSTALLEDPATTERN(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLSTALLEDPATTERN_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLSTICKSANDWICH(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLSTICKSANDWICH(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLSTICKSANDWICH_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLTAKURI(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLTAKURI(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLTAKURI_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLTASUKIGAP(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLTASUKIGAP(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLTASUKIGAP_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLTHRUSTING(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLTHRUSTING(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLTHRUSTING_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLTRISTAR(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLTRISTAR(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLTRISTAR_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLUNIQUE3RIVER(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLUNIQUE3RIVER(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLUNIQUE3RIVER_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLUPSIDEGAP2CROWS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLUPSIDEGAP2CROWS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLUPSIDEGAP2CROWS_Lookback() @nogc nothrow;
    TA_RetCode TA_CDLXSIDEGAP3METHODS(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_CDLXSIDEGAP3METHODS(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_CDLXSIDEGAP3METHODS_Lookback() @nogc nothrow;
    TA_RetCode TA_CEIL(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_CEIL(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_CEIL_Lookback() @nogc nothrow;
    TA_RetCode TA_CMO(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_CMO(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_CMO_Lookback(int) @nogc nothrow;
    TA_RetCode TA_CORREL(int, int, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_CORREL(int, int, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_CORREL_Lookback(int) @nogc nothrow;
    TA_RetCode TA_COS(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_COS(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_COS_Lookback() @nogc nothrow;
    TA_RetCode TA_COSH(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_COSH(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_COSH_Lookback() @nogc nothrow;
    TA_RetCode TA_DEMA(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_DEMA(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_DEMA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_DIV(int, int, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_DIV(int, int, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_DIV_Lookback() @nogc nothrow;
    TA_RetCode TA_DX(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_DX(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_DX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_EMA(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_EMA(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_EMA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_EXP(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_EXP(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_EXP_Lookback() @nogc nothrow;
    TA_RetCode TA_FLOOR(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_FLOOR(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_FLOOR_Lookback() @nogc nothrow;
    TA_RetCode TA_HT_DCPERIOD(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_HT_DCPERIOD(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_HT_DCPERIOD_Lookback() @nogc nothrow;
    TA_RetCode TA_HT_DCPHASE(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_HT_DCPHASE(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_HT_DCPHASE_Lookback() @nogc nothrow;
    TA_RetCode TA_HT_PHASOR(int, int, const(double)*, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_HT_PHASOR(int, int, const(float)*, int*, int*, double*, double*) @nogc nothrow;
    int TA_HT_PHASOR_Lookback() @nogc nothrow;
    TA_RetCode TA_HT_SINE(int, int, const(double)*, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_HT_SINE(int, int, const(float)*, int*, int*, double*, double*) @nogc nothrow;
    int TA_HT_SINE_Lookback() @nogc nothrow;
    TA_RetCode TA_HT_TRENDLINE(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_HT_TRENDLINE(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_HT_TRENDLINE_Lookback() @nogc nothrow;
    TA_RetCode TA_HT_TRENDMODE(int, int, const(double)*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_HT_TRENDMODE(int, int, const(float)*, int*, int*, int*) @nogc nothrow;
    int TA_HT_TRENDMODE_Lookback() @nogc nothrow;
    TA_RetCode TA_KAMA(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_KAMA(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_KAMA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_LINEARREG(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_LINEARREG(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_LINEARREG_Lookback(int) @nogc nothrow;
    TA_RetCode TA_LINEARREG_ANGLE(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_LINEARREG_ANGLE(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_LINEARREG_ANGLE_Lookback(int) @nogc nothrow;
    TA_RetCode TA_LINEARREG_INTERCEPT(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_LINEARREG_INTERCEPT(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_LINEARREG_INTERCEPT_Lookback(int) @nogc nothrow;
    TA_RetCode TA_LINEARREG_SLOPE(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_LINEARREG_SLOPE(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_LINEARREG_SLOPE_Lookback(int) @nogc nothrow;
    TA_RetCode TA_LN(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_LN(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_LN_Lookback() @nogc nothrow;
    TA_RetCode TA_LOG10(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_LOG10(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_LOG10_Lookback() @nogc nothrow;
    TA_RetCode TA_MA(int, int, const(double)*, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MA(int, int, const(float)*, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    int TA_MA_Lookback(int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_MACD(int, int, const(double)*, int, int, int, int*, int*, double*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_MACD(int, int, const(float)*, int, int, int, int*, int*, double*, double*, double*) @nogc nothrow;
    int TA_MACD_Lookback(int, int, int) @nogc nothrow;
    TA_RetCode TA_MACDEXT(int, int, const(double)*, int, TA_MAType, int, TA_MAType, int, TA_MAType, int*, int*, double*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_MACDEXT(int, int, const(float)*, int, TA_MAType, int, TA_MAType, int, TA_MAType, int*, int*, double*, double*, double*) @nogc nothrow;
    int TA_MACDEXT_Lookback(int, TA_MAType, int, TA_MAType, int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_MACDFIX(int, int, const(double)*, int, int*, int*, double*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_MACDFIX(int, int, const(float)*, int, int*, int*, double*, double*, double*) @nogc nothrow;
    int TA_MACDFIX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MAMA(int, int, const(double)*, double, double, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_MAMA(int, int, const(float)*, double, double, int*, int*, double*, double*) @nogc nothrow;
    int TA_MAMA_Lookback(double, double) @nogc nothrow;
    TA_RetCode TA_MAVP(int, int, const(double)*, const(double)*, int, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MAVP(int, int, const(float)*, const(float)*, int, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    int TA_MAVP_Lookback(int, int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_MAX(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MAX(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MAX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MAXINDEX(int, int, const(double)*, int, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_MAXINDEX(int, int, const(float)*, int, int*, int*, int*) @nogc nothrow;
    int TA_MAXINDEX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MEDPRICE(int, int, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MEDPRICE(int, int, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_MEDPRICE_Lookback() @nogc nothrow;
    TA_RetCode TA_MFI(int, int, const(double)*, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MFI(int, int, const(float)*, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MFI_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MIDPOINT(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MIDPOINT(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MIDPOINT_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MIDPRICE(int, int, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MIDPRICE(int, int, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MIDPRICE_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MIN(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MIN(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MIN_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MININDEX(int, int, const(double)*, int, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_MININDEX(int, int, const(float)*, int, int*, int*, int*) @nogc nothrow;
    int TA_MININDEX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MINMAX(int, int, const(double)*, int, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_MINMAX(int, int, const(float)*, int, int*, int*, double*, double*) @nogc nothrow;
    int TA_MINMAX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MINMAXINDEX(int, int, const(double)*, int, int*, int*, int*, int*) @nogc nothrow;
    TA_RetCode TA_S_MINMAXINDEX(int, int, const(float)*, int, int*, int*, int*, int*) @nogc nothrow;
    int TA_MINMAXINDEX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MINUS_DI(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MINUS_DI(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MINUS_DI_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MINUS_DM(int, int, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MINUS_DM(int, int, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MINUS_DM_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MOM(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MOM(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_MOM_Lookback(int) @nogc nothrow;
    TA_RetCode TA_MULT(int, int, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_MULT(int, int, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_MULT_Lookback() @nogc nothrow;
    TA_RetCode TA_NATR(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_NATR(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_NATR_Lookback(int) @nogc nothrow;
    TA_RetCode TA_OBV(int, int, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_OBV(int, int, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_OBV_Lookback() @nogc nothrow;
    TA_RetCode TA_PLUS_DI(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_PLUS_DI(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_PLUS_DI_Lookback(int) @nogc nothrow;
    TA_RetCode TA_PLUS_DM(int, int, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_PLUS_DM(int, int, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_PLUS_DM_Lookback(int) @nogc nothrow;
    TA_RetCode TA_PPO(int, int, const(double)*, int, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_PPO(int, int, const(float)*, int, int, TA_MAType, int*, int*, double*) @nogc nothrow;
    int TA_PPO_Lookback(int, int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_ROC(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ROC(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_ROC_Lookback(int) @nogc nothrow;
    TA_RetCode TA_ROCP(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ROCP(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_ROCP_Lookback(int) @nogc nothrow;
    TA_RetCode TA_ROCR(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ROCR(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_ROCR_Lookback(int) @nogc nothrow;
    TA_RetCode TA_ROCR100(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ROCR100(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_ROCR100_Lookback(int) @nogc nothrow;
    TA_RetCode TA_RSI(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_RSI(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_RSI_Lookback(int) @nogc nothrow;
    TA_RetCode TA_SAR(int, int, const(double)*, const(double)*, double, double, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SAR(int, int, const(float)*, const(float)*, double, double, int*, int*, double*) @nogc nothrow;
    int TA_SAR_Lookback(double, double) @nogc nothrow;
    TA_RetCode TA_SAREXT(int, int, const(double)*, const(double)*, double, double, double, double, double, double, double, double, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SAREXT(int, int, const(float)*, const(float)*, double, double, double, double, double, double, double, double, int*, int*, double*) @nogc nothrow;
    int TA_SAREXT_Lookback(double, double, double, double, double, double, double, double) @nogc nothrow;
    TA_RetCode TA_SIN(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SIN(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_SIN_Lookback() @nogc nothrow;
    TA_RetCode TA_SINH(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SINH(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_SINH_Lookback() @nogc nothrow;
    TA_RetCode TA_SMA(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SMA(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_SMA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_SQRT(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SQRT(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_SQRT_Lookback() @nogc nothrow;
    TA_RetCode TA_STDDEV(int, int, const(double)*, int, double, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_STDDEV(int, int, const(float)*, int, double, int*, int*, double*) @nogc nothrow;
    int TA_STDDEV_Lookback(int, double) @nogc nothrow;
    TA_RetCode TA_STOCH(int, int, const(double)*, const(double)*, const(double)*, int, int, TA_MAType, int, TA_MAType, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_STOCH(int, int, const(float)*, const(float)*, const(float)*, int, int, TA_MAType, int, TA_MAType, int*, int*, double*, double*) @nogc nothrow;
    int TA_STOCH_Lookback(int, int, TA_MAType, int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_STOCHF(int, int, const(double)*, const(double)*, const(double)*, int, int, TA_MAType, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_STOCHF(int, int, const(float)*, const(float)*, const(float)*, int, int, TA_MAType, int*, int*, double*, double*) @nogc nothrow;
    int TA_STOCHF_Lookback(int, int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_STOCHRSI(int, int, const(double)*, int, int, int, TA_MAType, int*, int*, double*, double*) @nogc nothrow;
    TA_RetCode TA_S_STOCHRSI(int, int, const(float)*, int, int, int, TA_MAType, int*, int*, double*, double*) @nogc nothrow;
    int TA_STOCHRSI_Lookback(int, int, int, TA_MAType) @nogc nothrow;
    TA_RetCode TA_SUB(int, int, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SUB(int, int, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_SUB_Lookback() @nogc nothrow;
    TA_RetCode TA_SUM(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_SUM(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_SUM_Lookback(int) @nogc nothrow;
    TA_RetCode TA_T3(int, int, const(double)*, int, double, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_T3(int, int, const(float)*, int, double, int*, int*, double*) @nogc nothrow;
    int TA_T3_Lookback(int, double) @nogc nothrow;
    TA_RetCode TA_TAN(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TAN(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_TAN_Lookback() @nogc nothrow;
    TA_RetCode TA_TANH(int, int, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TANH(int, int, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_TANH_Lookback() @nogc nothrow;
    TA_RetCode TA_TEMA(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TEMA(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_TEMA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_TRANGE(int, int, const(double)*, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TRANGE(int, int, const(float)*, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_TRANGE_Lookback() @nogc nothrow;
    TA_RetCode TA_TRIMA(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TRIMA(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_TRIMA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_TRIX(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TRIX(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_TRIX_Lookback(int) @nogc nothrow;
    TA_RetCode TA_TSF(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TSF(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_TSF_Lookback(int) @nogc nothrow;
    TA_RetCode TA_TYPPRICE(int, int, const(double)*, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_TYPPRICE(int, int, const(float)*, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_TYPPRICE_Lookback() @nogc nothrow;
    TA_RetCode TA_ULTOSC(int, int, const(double)*, const(double)*, const(double)*, int, int, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_ULTOSC(int, int, const(float)*, const(float)*, const(float)*, int, int, int, int*, int*, double*) @nogc nothrow;
    int TA_ULTOSC_Lookback(int, int, int) @nogc nothrow;
    TA_RetCode TA_VAR(int, int, const(double)*, int, double, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_VAR(int, int, const(float)*, int, double, int*, int*, double*) @nogc nothrow;
    int TA_VAR_Lookback(int, double) @nogc nothrow;
    TA_RetCode TA_WCLPRICE(int, int, const(double)*, const(double)*, const(double)*, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_WCLPRICE(int, int, const(float)*, const(float)*, const(float)*, int*, int*, double*) @nogc nothrow;
    int TA_WCLPRICE_Lookback() @nogc nothrow;
    TA_RetCode TA_WILLR(int, int, const(double)*, const(double)*, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_WILLR(int, int, const(float)*, const(float)*, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_WILLR_Lookback(int) @nogc nothrow;
    TA_RetCode TA_WMA(int, int, const(double)*, int, int*, int*, double*) @nogc nothrow;
    TA_RetCode TA_S_WMA(int, int, const(float)*, int, int*, int*, double*) @nogc nothrow;
    int TA_WMA_Lookback(int) @nogc nothrow;
    TA_RetCode TA_SetUnstablePeriod(TA_FuncUnstId, uint) @nogc nothrow;
    uint TA_GetUnstablePeriod(TA_FuncUnstId) @nogc nothrow;
    TA_RetCode TA_SetCompatibility(TA_Compatibility) @nogc nothrow;
    TA_Compatibility TA_GetCompatibility() @nogc nothrow;
    TA_RetCode TA_SetCandleSettings(TA_CandleSettingType, TA_RangeType, int, double) @nogc nothrow;
    TA_RetCode TA_RestoreCandleDefaultSettings(TA_CandleSettingType) @nogc nothrow;
    int fgetc(_IO_FILE*) @nogc nothrow;
    int vsscanf(const(char)*, const(char)*, va_list*) @nogc nothrow;
    int vscanf(const(char)*, va_list*) @nogc nothrow;
    int vfscanf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;
    int sscanf(const(char)*, const(char)*, ...) @nogc nothrow;
    int scanf(const(char)*, ...) @nogc nothrow;
    int fscanf(_IO_FILE*, const(char)*, ...) @nogc nothrow;
    int dprintf(int, const(char)*, ...) @nogc nothrow;
    int vdprintf(int, const(char)*, va_list*) @nogc nothrow;
    int vsnprintf(char*, c_ulong, const(char)*, va_list*) @nogc nothrow;
    int snprintf(char*, c_ulong, const(char)*, ...) @nogc nothrow;
    int vsprintf(char*, const(char)*, va_list*) @nogc nothrow;
    int vprintf(const(char)*, va_list*) @nogc nothrow;
    int vfprintf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;
    int sprintf(char*, const(char)*, ...) @nogc nothrow;
    int printf(const(char)*, ...) @nogc nothrow;
    int fprintf(_IO_FILE*, const(char)*, ...) @nogc nothrow;
    void setlinebuf(_IO_FILE*) @nogc nothrow;
    void setbuffer(_IO_FILE*, char*, c_ulong) @nogc nothrow;
    int setvbuf(_IO_FILE*, char*, int, c_ulong) @nogc nothrow;
    void setbuf(_IO_FILE*, char*) @nogc nothrow;
    alias size_t = c_ulong;
    _IO_FILE* open_memstream(char**, c_ulong*) @nogc nothrow;
    _IO_FILE* fmemopen(void*, c_ulong, const(char)*) @nogc nothrow;
    _IO_FILE* fdopen(int, const(char)*) @nogc nothrow;
    _IO_FILE* freopen(const(char)*, const(char)*, _IO_FILE*) @nogc nothrow;
    _IO_FILE* fopen(const(char)*, const(char)*) @nogc nothrow;
    int fflush_unlocked(_IO_FILE*) @nogc nothrow;
    int fflush(_IO_FILE*) @nogc nothrow;
    int fclose(_IO_FILE*) @nogc nothrow;
    char* tempnam(const(char)*, const(char)*) @nogc nothrow;
    char* tmpnam_r(char*) @nogc nothrow;
    char* tmpnam(char*) @nogc nothrow;
    _IO_FILE* tmpfile() @nogc nothrow;
    int renameat(int, const(char)*, int, const(char)*) @nogc nothrow;
    int rename(const(char)*, const(char)*) @nogc nothrow;
    int remove(const(char)*) @nogc nothrow;
    extern __gshared _IO_FILE* stderr;
    extern __gshared _IO_FILE* stdout;
    extern __gshared _IO_FILE* stdin;
    alias fpos_t = _G_fpos_t;
    alias ssize_t = c_long;
    alias off_t = c_long;



    static if(!is(typeof(MAX_INPUT))) {
        private enum enumMixinStr_MAX_INPUT = `enum MAX_INPUT = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_MAX_INPUT); }))) {
            mixin(enumMixinStr_MAX_INPUT);
        }
    }




    static if(!is(typeof(NAME_MAX))) {
        private enum enumMixinStr_NAME_MAX = `enum NAME_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_NAME_MAX); }))) {
            mixin(enumMixinStr_NAME_MAX);
        }
    }




    static if(!is(typeof(PATH_MAX))) {
        private enum enumMixinStr_PATH_MAX = `enum PATH_MAX = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_PATH_MAX); }))) {
            mixin(enumMixinStr_PATH_MAX);
        }
    }




    static if(!is(typeof(PIPE_BUF))) {
        private enum enumMixinStr_PIPE_BUF = `enum PIPE_BUF = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_PIPE_BUF); }))) {
            mixin(enumMixinStr_PIPE_BUF);
        }
    }




    static if(!is(typeof(XATTR_NAME_MAX))) {
        private enum enumMixinStr_XATTR_NAME_MAX = `enum XATTR_NAME_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_XATTR_NAME_MAX); }))) {
            mixin(enumMixinStr_XATTR_NAME_MAX);
        }
    }




    static if(!is(typeof(XATTR_SIZE_MAX))) {
        private enum enumMixinStr_XATTR_SIZE_MAX = `enum XATTR_SIZE_MAX = 65536;`;
        static if(is(typeof({ mixin(enumMixinStr_XATTR_SIZE_MAX); }))) {
            mixin(enumMixinStr_XATTR_SIZE_MAX);
        }
    }




    static if(!is(typeof(XATTR_LIST_MAX))) {
        private enum enumMixinStr_XATTR_LIST_MAX = `enum XATTR_LIST_MAX = 65536;`;
        static if(is(typeof({ mixin(enumMixinStr_XATTR_LIST_MAX); }))) {
            mixin(enumMixinStr_XATTR_LIST_MAX);
        }
    }




    static if(!is(typeof(RTSIG_MAX))) {
        private enum enumMixinStr_RTSIG_MAX = `enum RTSIG_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_RTSIG_MAX); }))) {
            mixin(enumMixinStr_RTSIG_MAX);
        }
    }




    static if(!is(typeof(_STDC_PREDEF_H))) {
        private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); }))) {
            mixin(enumMixinStr__STDC_PREDEF_H);
        }
    }




    static if(!is(typeof(_STDIO_H))) {
        private enum enumMixinStr__STDIO_H = `enum _STDIO_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDIO_H); }))) {
            mixin(enumMixinStr__STDIO_H);
        }
    }






    static if(!is(typeof(MAX_CANON))) {
        private enum enumMixinStr_MAX_CANON = `enum MAX_CANON = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_MAX_CANON); }))) {
            mixin(enumMixinStr_MAX_CANON);
        }
    }




    static if(!is(typeof(LINK_MAX))) {
        private enum enumMixinStr_LINK_MAX = `enum LINK_MAX = 127;`;
        static if(is(typeof({ mixin(enumMixinStr_LINK_MAX); }))) {
            mixin(enumMixinStr_LINK_MAX);
        }
    }
    static if(!is(typeof(ARG_MAX))) {
        private enum enumMixinStr_ARG_MAX = `enum ARG_MAX = 131072;`;
        static if(is(typeof({ mixin(enumMixinStr_ARG_MAX); }))) {
            mixin(enumMixinStr_ARG_MAX);
        }
    }




    static if(!is(typeof(NGROUPS_MAX))) {
        private enum enumMixinStr_NGROUPS_MAX = `enum NGROUPS_MAX = 65536;`;
        static if(is(typeof({ mixin(enumMixinStr_NGROUPS_MAX); }))) {
            mixin(enumMixinStr_NGROUPS_MAX);
        }
    }




    static if(!is(typeof(NR_OPEN))) {
        private enum enumMixinStr_NR_OPEN = `enum NR_OPEN = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_NR_OPEN); }))) {
            mixin(enumMixinStr_NR_OPEN);
        }
    }
    static if(!is(typeof(ULLONG_MAX))) {
        private enum enumMixinStr_ULLONG_MAX = `enum ULLONG_MAX = ( LLONG_MAX * 2ULL + 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_ULLONG_MAX); }))) {
            mixin(enumMixinStr_ULLONG_MAX);
        }
    }




    static if(!is(typeof(LLONG_MAX))) {
        private enum enumMixinStr_LLONG_MAX = `enum LLONG_MAX = 0x7fffffffffffffffLL;`;
        static if(is(typeof({ mixin(enumMixinStr_LLONG_MAX); }))) {
            mixin(enumMixinStr_LLONG_MAX);
        }
    }




    static if(!is(typeof(LLONG_MIN))) {
        private enum enumMixinStr_LLONG_MIN = `enum LLONG_MIN = ( - 0x7fffffffffffffffLL - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_LLONG_MIN); }))) {
            mixin(enumMixinStr_LLONG_MIN);
        }
    }




    static if(!is(typeof(MB_LEN_MAX))) {
        private enum enumMixinStr_MB_LEN_MAX = `enum MB_LEN_MAX = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_MB_LEN_MAX); }))) {
            mixin(enumMixinStr_MB_LEN_MAX);
        }
    }






    static if(!is(typeof(_LIBC_LIMITS_H_))) {
        private enum enumMixinStr__LIBC_LIMITS_H_ = `enum _LIBC_LIMITS_H_ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LIBC_LIMITS_H_); }))) {
            mixin(enumMixinStr__LIBC_LIMITS_H_);
        }
    }
    static if(!is(typeof(__GLIBC_MINOR__))) {
        private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 27;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); }))) {
            mixin(enumMixinStr___GLIBC_MINOR__);
        }
    }






    static if(!is(typeof(__GLIBC__))) {
        private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC__); }))) {
            mixin(enumMixinStr___GLIBC__);
        }
    }




    static if(!is(typeof(_IOFBF))) {
        private enum enumMixinStr__IOFBF = `enum _IOFBF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__IOFBF); }))) {
            mixin(enumMixinStr__IOFBF);
        }
    }




    static if(!is(typeof(_IOLBF))) {
        private enum enumMixinStr__IOLBF = `enum _IOLBF = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__IOLBF); }))) {
            mixin(enumMixinStr__IOLBF);
        }
    }




    static if(!is(typeof(_IONBF))) {
        private enum enumMixinStr__IONBF = `enum _IONBF = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__IONBF); }))) {
            mixin(enumMixinStr__IONBF);
        }
    }




    static if(!is(typeof(BUFSIZ))) {
        private enum enumMixinStr_BUFSIZ = `enum BUFSIZ = _IO_BUFSIZ;`;
        static if(is(typeof({ mixin(enumMixinStr_BUFSIZ); }))) {
            mixin(enumMixinStr_BUFSIZ);
        }
    }




    static if(!is(typeof(__GNU_LIBRARY__))) {
        private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
        static if(is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); }))) {
            mixin(enumMixinStr___GNU_LIBRARY__);
        }
    }




    static if(!is(typeof(SEEK_SET))) {
        private enum enumMixinStr_SEEK_SET = `enum SEEK_SET = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_SET); }))) {
            mixin(enumMixinStr_SEEK_SET);
        }
    }




    static if(!is(typeof(SEEK_CUR))) {
        private enum enumMixinStr_SEEK_CUR = `enum SEEK_CUR = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_CUR); }))) {
            mixin(enumMixinStr_SEEK_CUR);
        }
    }




    static if(!is(typeof(SEEK_END))) {
        private enum enumMixinStr_SEEK_END = `enum SEEK_END = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_END); }))) {
            mixin(enumMixinStr_SEEK_END);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_GETS))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
        }
    }




    static if(!is(typeof(P_tmpdir))) {
        private enum enumMixinStr_P_tmpdir = `enum P_tmpdir = "/tmp";`;
        static if(is(typeof({ mixin(enumMixinStr_P_tmpdir); }))) {
            mixin(enumMixinStr_P_tmpdir);
        }
    }




    static if(!is(typeof(__USE_FORTIFY_LEVEL))) {
        private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); }))) {
            mixin(enumMixinStr___USE_FORTIFY_LEVEL);
        }
    }




    static if(!is(typeof(__USE_ATFILE))) {
        private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ATFILE); }))) {
            mixin(enumMixinStr___USE_ATFILE);
        }
    }




    static if(!is(typeof(__USE_MISC))) {
        private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_MISC); }))) {
            mixin(enumMixinStr___USE_MISC);
        }
    }




    static if(!is(typeof(_ATFILE_SOURCE))) {
        private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); }))) {
            mixin(enumMixinStr__ATFILE_SOURCE);
        }
    }




    static if(!is(typeof(stdin))) {
        private enum enumMixinStr_stdin = `enum stdin = stdin;`;
        static if(is(typeof({ mixin(enumMixinStr_stdin); }))) {
            mixin(enumMixinStr_stdin);
        }
    }




    static if(!is(typeof(stdout))) {
        private enum enumMixinStr_stdout = `enum stdout = stdout;`;
        static if(is(typeof({ mixin(enumMixinStr_stdout); }))) {
            mixin(enumMixinStr_stdout);
        }
    }




    static if(!is(typeof(stderr))) {
        private enum enumMixinStr_stderr = `enum stderr = stderr;`;
        static if(is(typeof({ mixin(enumMixinStr_stderr); }))) {
            mixin(enumMixinStr_stderr);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K8))) {
        private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); }))) {
            mixin(enumMixinStr___USE_XOPEN2K8);
        }
    }




    static if(!is(typeof(__USE_ISOC99))) {
        private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC99); }))) {
            mixin(enumMixinStr___USE_ISOC99);
        }
    }




    static if(!is(typeof(__USE_ISOC95))) {
        private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC95); }))) {
            mixin(enumMixinStr___USE_ISOC95);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K))) {
        private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); }))) {
            mixin(enumMixinStr___USE_XOPEN2K);
        }
    }




    static if(!is(typeof(__USE_POSIX199506))) {
        private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199506); }))) {
            mixin(enumMixinStr___USE_POSIX199506);
        }
    }




    static if(!is(typeof(__USE_POSIX199309))) {
        private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199309); }))) {
            mixin(enumMixinStr___USE_POSIX199309);
        }
    }




    static if(!is(typeof(__USE_POSIX2))) {
        private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX2); }))) {
            mixin(enumMixinStr___USE_POSIX2);
        }
    }




    static if(!is(typeof(__USE_POSIX))) {
        private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX); }))) {
            mixin(enumMixinStr___USE_POSIX);
        }
    }




    static if(!is(typeof(_POSIX_C_SOURCE))) {
        private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_C_SOURCE);
        }
    }




    static if(!is(typeof(_POSIX_SOURCE))) {
        private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_SOURCE);
        }
    }




    static if(!is(typeof(__USE_POSIX_IMPLICITLY))) {
        private enum enumMixinStr___USE_POSIX_IMPLICITLY = `enum __USE_POSIX_IMPLICITLY = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX_IMPLICITLY); }))) {
            mixin(enumMixinStr___USE_POSIX_IMPLICITLY);
        }
    }




    static if(!is(typeof(__USE_ISOC11))) {
        private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC11); }))) {
            mixin(enumMixinStr___USE_ISOC11);
        }
    }




    static if(!is(typeof(_DEFAULT_SOURCE))) {
        private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); }))) {
            mixin(enumMixinStr__DEFAULT_SOURCE);
        }
    }
    static if(!is(typeof(_FEATURES_H))) {
        private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__FEATURES_H); }))) {
            mixin(enumMixinStr__FEATURES_H);
        }
    }




    static if(!is(typeof(CHAR_MAX))) {
        private enum enumMixinStr_CHAR_MAX = `enum CHAR_MAX = 0x7f;`;
        static if(is(typeof({ mixin(enumMixinStr_CHAR_MAX); }))) {
            mixin(enumMixinStr_CHAR_MAX);
        }
    }




    static if(!is(typeof(CHAR_MIN))) {
        private enum enumMixinStr_CHAR_MIN = `enum CHAR_MIN = SCHAR_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_CHAR_MIN); }))) {
            mixin(enumMixinStr_CHAR_MIN);
        }
    }




    static if(!is(typeof(CHAR_BIT))) {
        private enum enumMixinStr_CHAR_BIT = `enum CHAR_BIT = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_CHAR_BIT); }))) {
            mixin(enumMixinStr_CHAR_BIT);
        }
    }




    static if(!is(typeof(ULONG_MAX))) {
        private enum enumMixinStr_ULONG_MAX = `enum ULONG_MAX = ( 0x7fffffffffffffffL * 2UL + 1UL );`;
        static if(is(typeof({ mixin(enumMixinStr_ULONG_MAX); }))) {
            mixin(enumMixinStr_ULONG_MAX);
        }
    }




    static if(!is(typeof(UINT_MAX))) {
        private enum enumMixinStr_UINT_MAX = `enum UINT_MAX = ( 0x7fffffff * 2U + 1U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_MAX); }))) {
            mixin(enumMixinStr_UINT_MAX);
        }
    }




    static if(!is(typeof(USHRT_MAX))) {
        private enum enumMixinStr_USHRT_MAX = `enum USHRT_MAX = ( 0x7fff * 2 + 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_USHRT_MAX); }))) {
            mixin(enumMixinStr_USHRT_MAX);
        }
    }




    static if(!is(typeof(UCHAR_MAX))) {
        private enum enumMixinStr_UCHAR_MAX = `enum UCHAR_MAX = ( 0x7f * 2 + 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_UCHAR_MAX); }))) {
            mixin(enumMixinStr_UCHAR_MAX);
        }
    }




    static if(!is(typeof(LONG_MIN))) {
        private enum enumMixinStr_LONG_MIN = `enum LONG_MIN = ( - 0x7fffffffffffffffL - 1L );`;
        static if(is(typeof({ mixin(enumMixinStr_LONG_MIN); }))) {
            mixin(enumMixinStr_LONG_MIN);
        }
    }




    static if(!is(typeof(INT_MIN))) {
        private enum enumMixinStr_INT_MIN = `enum INT_MIN = ( - 0x7fffffff - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_MIN); }))) {
            mixin(enumMixinStr_INT_MIN);
        }
    }




    static if(!is(typeof(SHRT_MIN))) {
        private enum enumMixinStr_SHRT_MIN = `enum SHRT_MIN = ( - 0x7fff - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SHRT_MIN); }))) {
            mixin(enumMixinStr_SHRT_MIN);
        }
    }




    static if(!is(typeof(SCHAR_MIN))) {
        private enum enumMixinStr_SCHAR_MIN = `enum SCHAR_MIN = ( - 0x7f - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SCHAR_MIN); }))) {
            mixin(enumMixinStr_SCHAR_MIN);
        }
    }




    static if(!is(typeof(LONG_MAX))) {
        private enum enumMixinStr_LONG_MAX = `enum LONG_MAX = 0x7fffffffffffffffL;`;
        static if(is(typeof({ mixin(enumMixinStr_LONG_MAX); }))) {
            mixin(enumMixinStr_LONG_MAX);
        }
    }




    static if(!is(typeof(INT_MAX))) {
        private enum enumMixinStr_INT_MAX = `enum INT_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_MAX); }))) {
            mixin(enumMixinStr_INT_MAX);
        }
    }




    static if(!is(typeof(SHRT_MAX))) {
        private enum enumMixinStr_SHRT_MAX = `enum SHRT_MAX = 0x7fff;`;
        static if(is(typeof({ mixin(enumMixinStr_SHRT_MAX); }))) {
            mixin(enumMixinStr_SHRT_MAX);
        }
    }




    static if(!is(typeof(SCHAR_MAX))) {
        private enum enumMixinStr_SCHAR_MAX = `enum SCHAR_MAX = 0x7f;`;
        static if(is(typeof({ mixin(enumMixinStr_SCHAR_MAX); }))) {
            mixin(enumMixinStr_SCHAR_MAX);
        }
    }






    static if(!is(typeof(NULL))) {
        private enum enumMixinStr_NULL = `enum NULL = ( cast( void * ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_NULL); }))) {
            mixin(enumMixinStr_NULL);
        }
    }






    static if(!is(typeof(__GNUC_VA_LIST))) {
        private enum enumMixinStr___GNUC_VA_LIST = `enum __GNUC_VA_LIST = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GNUC_VA_LIST); }))) {
            mixin(enumMixinStr___GNUC_VA_LIST);
        }
    }
    static if(!is(typeof(LDBL_DECIMAL_DIG))) {
        private enum enumMixinStr_LDBL_DECIMAL_DIG = `enum LDBL_DECIMAL_DIG = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_DECIMAL_DIG); }))) {
            mixin(enumMixinStr_LDBL_DECIMAL_DIG);
        }
    }




    static if(!is(typeof(DBL_DECIMAL_DIG))) {
        private enum enumMixinStr_DBL_DECIMAL_DIG = `enum DBL_DECIMAL_DIG = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_DECIMAL_DIG); }))) {
            mixin(enumMixinStr_DBL_DECIMAL_DIG);
        }
    }




    static if(!is(typeof(FLT_DECIMAL_DIG))) {
        private enum enumMixinStr_FLT_DECIMAL_DIG = `enum FLT_DECIMAL_DIG = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_DECIMAL_DIG); }))) {
            mixin(enumMixinStr_FLT_DECIMAL_DIG);
        }
    }




    static if(!is(typeof(LDBL_TRUE_MIN))) {
        private enum enumMixinStr_LDBL_TRUE_MIN = `enum LDBL_TRUE_MIN = 3.64519953188247460252840593361941982e-4951L;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_TRUE_MIN); }))) {
            mixin(enumMixinStr_LDBL_TRUE_MIN);
        }
    }




    static if(!is(typeof(DBL_TRUE_MIN))) {
        private enum enumMixinStr_DBL_TRUE_MIN = `enum DBL_TRUE_MIN = ((double)4.94065645841246544176568792868221372e-324L);`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_TRUE_MIN); }))) {
            mixin(enumMixinStr_DBL_TRUE_MIN);
        }
    }




    static if(!is(typeof(FLT_TRUE_MIN))) {
        private enum enumMixinStr_FLT_TRUE_MIN = `enum FLT_TRUE_MIN = 1.40129846432481707092372958328991613e-45F;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_TRUE_MIN); }))) {
            mixin(enumMixinStr_FLT_TRUE_MIN);
        }
    }




    static if(!is(typeof(LDBL_MIN))) {
        private enum enumMixinStr_LDBL_MIN = `enum LDBL_MIN = 3.36210314311209350626267781732175260e-4932L;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_MIN); }))) {
            mixin(enumMixinStr_LDBL_MIN);
        }
    }




    static if(!is(typeof(DBL_MIN))) {
        private enum enumMixinStr_DBL_MIN = `enum DBL_MIN = ((double)2.22507385850720138309023271733240406e-308L);`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_MIN); }))) {
            mixin(enumMixinStr_DBL_MIN);
        }
    }




    static if(!is(typeof(FLT_MIN))) {
        private enum enumMixinStr_FLT_MIN = `enum FLT_MIN = 1.17549435082228750796873653722224568e-38F;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_MIN); }))) {
            mixin(enumMixinStr_FLT_MIN);
        }
    }




    static if(!is(typeof(LDBL_EPSILON))) {
        private enum enumMixinStr_LDBL_EPSILON = `enum LDBL_EPSILON = 1.08420217248550443400745280086994171e-19L;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_EPSILON); }))) {
            mixin(enumMixinStr_LDBL_EPSILON);
        }
    }




    static if(!is(typeof(DBL_EPSILON))) {
        private enum enumMixinStr_DBL_EPSILON = `enum DBL_EPSILON = ((double)2.22044604925031308084726333618164062e-16L);`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_EPSILON); }))) {
            mixin(enumMixinStr_DBL_EPSILON);
        }
    }




    static if(!is(typeof(FLT_EPSILON))) {
        private enum enumMixinStr_FLT_EPSILON = `enum FLT_EPSILON = 1.19209289550781250000000000000000000e-7F;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_EPSILON); }))) {
            mixin(enumMixinStr_FLT_EPSILON);
        }
    }




    static if(!is(typeof(LDBL_MAX))) {
        private enum enumMixinStr_LDBL_MAX = `enum LDBL_MAX = 1.18973149535723176502126385303097021e+4932L;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_MAX); }))) {
            mixin(enumMixinStr_LDBL_MAX);
        }
    }




    static if(!is(typeof(DBL_MAX))) {
        private enum enumMixinStr_DBL_MAX = `enum DBL_MAX = ((double)1.79769313486231570814527423731704357e+308L);`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_MAX); }))) {
            mixin(enumMixinStr_DBL_MAX);
        }
    }




    static if(!is(typeof(FLT_MAX))) {
        private enum enumMixinStr_FLT_MAX = `enum FLT_MAX = 3.40282346638528859811704183484516925e+38F;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_MAX); }))) {
            mixin(enumMixinStr_FLT_MAX);
        }
    }




    static if(!is(typeof(LDBL_MAX_10_EXP))) {
        private enum enumMixinStr_LDBL_MAX_10_EXP = `enum LDBL_MAX_10_EXP = 4932;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_MAX_10_EXP); }))) {
            mixin(enumMixinStr_LDBL_MAX_10_EXP);
        }
    }




    static if(!is(typeof(DBL_MAX_10_EXP))) {
        private enum enumMixinStr_DBL_MAX_10_EXP = `enum DBL_MAX_10_EXP = 308;`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_MAX_10_EXP); }))) {
            mixin(enumMixinStr_DBL_MAX_10_EXP);
        }
    }




    static if(!is(typeof(FLT_MAX_10_EXP))) {
        private enum enumMixinStr_FLT_MAX_10_EXP = `enum FLT_MAX_10_EXP = 38;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_MAX_10_EXP); }))) {
            mixin(enumMixinStr_FLT_MAX_10_EXP);
        }
    }




    static if(!is(typeof(LDBL_MAX_EXP))) {
        private enum enumMixinStr_LDBL_MAX_EXP = `enum LDBL_MAX_EXP = 16384;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_MAX_EXP); }))) {
            mixin(enumMixinStr_LDBL_MAX_EXP);
        }
    }




    static if(!is(typeof(DBL_MAX_EXP))) {
        private enum enumMixinStr_DBL_MAX_EXP = `enum DBL_MAX_EXP = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_MAX_EXP); }))) {
            mixin(enumMixinStr_DBL_MAX_EXP);
        }
    }




    static if(!is(typeof(FLT_MAX_EXP))) {
        private enum enumMixinStr_FLT_MAX_EXP = `enum FLT_MAX_EXP = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_MAX_EXP); }))) {
            mixin(enumMixinStr_FLT_MAX_EXP);
        }
    }




    static if(!is(typeof(LDBL_MIN_10_EXP))) {
        private enum enumMixinStr_LDBL_MIN_10_EXP = `enum LDBL_MIN_10_EXP = (-4931);`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_MIN_10_EXP); }))) {
            mixin(enumMixinStr_LDBL_MIN_10_EXP);
        }
    }




    static if(!is(typeof(DBL_MIN_10_EXP))) {
        private enum enumMixinStr_DBL_MIN_10_EXP = `enum DBL_MIN_10_EXP = (-307);`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_MIN_10_EXP); }))) {
            mixin(enumMixinStr_DBL_MIN_10_EXP);
        }
    }




    static if(!is(typeof(FLT_MIN_10_EXP))) {
        private enum enumMixinStr_FLT_MIN_10_EXP = `enum FLT_MIN_10_EXP = (-37);`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_MIN_10_EXP); }))) {
            mixin(enumMixinStr_FLT_MIN_10_EXP);
        }
    }




    static if(!is(typeof(LDBL_MIN_EXP))) {
        private enum enumMixinStr_LDBL_MIN_EXP = `enum LDBL_MIN_EXP = (-16381);`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_MIN_EXP); }))) {
            mixin(enumMixinStr_LDBL_MIN_EXP);
        }
    }




    static if(!is(typeof(DBL_MIN_EXP))) {
        private enum enumMixinStr_DBL_MIN_EXP = `enum DBL_MIN_EXP = (-1021);`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_MIN_EXP); }))) {
            mixin(enumMixinStr_DBL_MIN_EXP);
        }
    }




    static if(!is(typeof(FLT_MIN_EXP))) {
        private enum enumMixinStr_FLT_MIN_EXP = `enum FLT_MIN_EXP = (-125);`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_MIN_EXP); }))) {
            mixin(enumMixinStr_FLT_MIN_EXP);
        }
    }




    static if(!is(typeof(LDBL_DIG))) {
        private enum enumMixinStr_LDBL_DIG = `enum LDBL_DIG = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_DIG); }))) {
            mixin(enumMixinStr_LDBL_DIG);
        }
    }




    static if(!is(typeof(DBL_DIG))) {
        private enum enumMixinStr_DBL_DIG = `enum DBL_DIG = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_DIG); }))) {
            mixin(enumMixinStr_DBL_DIG);
        }
    }




    static if(!is(typeof(FLT_DIG))) {
        private enum enumMixinStr_FLT_DIG = `enum FLT_DIG = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_DIG); }))) {
            mixin(enumMixinStr_FLT_DIG);
        }
    }




    static if(!is(typeof(DECIMAL_DIG))) {
        private enum enumMixinStr_DECIMAL_DIG = `enum DECIMAL_DIG = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_DECIMAL_DIG); }))) {
            mixin(enumMixinStr_DECIMAL_DIG);
        }
    }




    static if(!is(typeof(LDBL_MANT_DIG))) {
        private enum enumMixinStr_LDBL_MANT_DIG = `enum LDBL_MANT_DIG = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_LDBL_MANT_DIG); }))) {
            mixin(enumMixinStr_LDBL_MANT_DIG);
        }
    }




    static if(!is(typeof(DBL_MANT_DIG))) {
        private enum enumMixinStr_DBL_MANT_DIG = `enum DBL_MANT_DIG = 53;`;
        static if(is(typeof({ mixin(enumMixinStr_DBL_MANT_DIG); }))) {
            mixin(enumMixinStr_DBL_MANT_DIG);
        }
    }




    static if(!is(typeof(FLT_MANT_DIG))) {
        private enum enumMixinStr_FLT_MANT_DIG = `enum FLT_MANT_DIG = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_MANT_DIG); }))) {
            mixin(enumMixinStr_FLT_MANT_DIG);
        }
    }




    static if(!is(typeof(FLT_RADIX))) {
        private enum enumMixinStr_FLT_RADIX = `enum FLT_RADIX = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_RADIX); }))) {
            mixin(enumMixinStr_FLT_RADIX);
        }
    }




    static if(!is(typeof(FLT_ROUNDS))) {
        private enum enumMixinStr_FLT_ROUNDS = `enum FLT_ROUNDS = ( __builtin_flt_rounds ( ) );`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_ROUNDS); }))) {
            mixin(enumMixinStr_FLT_ROUNDS);
        }
    }




    static if(!is(typeof(FLT_EVAL_METHOD))) {
        private enum enumMixinStr_FLT_EVAL_METHOD = `enum FLT_EVAL_METHOD = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_FLT_EVAL_METHOD); }))) {
            mixin(enumMixinStr_FLT_EVAL_METHOD);
        }
    }
    static if(!is(typeof(TA_REAL_DEFAULT))) {
        private enum enumMixinStr_TA_REAL_DEFAULT = `enum TA_REAL_DEFAULT = ( - 4e+37 );`;
        static if(is(typeof({ mixin(enumMixinStr_TA_REAL_DEFAULT); }))) {
            mixin(enumMixinStr_TA_REAL_DEFAULT);
        }
    }






    static if(!is(typeof(TA_INTEGER_DEFAULT))) {
        private enum enumMixinStr_TA_INTEGER_DEFAULT = `enum TA_INTEGER_DEFAULT = ( ( - 0x7fffffff - 1 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_TA_INTEGER_DEFAULT); }))) {
            mixin(enumMixinStr_TA_INTEGER_DEFAULT);
        }
    }




    static if(!is(typeof(TA_REAL_MAX))) {
        private enum enumMixinStr_TA_REAL_MAX = `enum TA_REAL_MAX = ( 3e+37 );`;
        static if(is(typeof({ mixin(enumMixinStr_TA_REAL_MAX); }))) {
            mixin(enumMixinStr_TA_REAL_MAX);
        }
    }




    static if(!is(typeof(TA_REAL_MIN))) {
        private enum enumMixinStr_TA_REAL_MIN = `enum TA_REAL_MIN = ( - 3e+37 );`;
        static if(is(typeof({ mixin(enumMixinStr_TA_REAL_MIN); }))) {
            mixin(enumMixinStr_TA_REAL_MIN);
        }
    }




    static if(!is(typeof(TA_INTEGER_MAX))) {
        private enum enumMixinStr_TA_INTEGER_MAX = `enum TA_INTEGER_MAX = ( 0x7fffffff );`;
        static if(is(typeof({ mixin(enumMixinStr_TA_INTEGER_MAX); }))) {
            mixin(enumMixinStr_TA_INTEGER_MAX);
        }
    }




    static if(!is(typeof(TA_INTEGER_MIN))) {
        private enum enumMixinStr_TA_INTEGER_MIN = `enum TA_INTEGER_MIN = ( ( - 0x7fffffff - 1 ) + 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_TA_INTEGER_MIN); }))) {
            mixin(enumMixinStr_TA_INTEGER_MIN);
        }
    }
    static if(!is(typeof(__64BIT__))) {
        private enum enumMixinStr___64BIT__ = `enum __64BIT__ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___64BIT__); }))) {
            mixin(enumMixinStr___64BIT__);
        }
    }
    static if(!is(typeof(TA_OUT_LOWER_LIMIT))) {
        private enum enumMixinStr_TA_OUT_LOWER_LIMIT = `enum TA_OUT_LOWER_LIMIT = 0x00001000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_LOWER_LIMIT); }))) {
            mixin(enumMixinStr_TA_OUT_LOWER_LIMIT);
        }
    }




    static if(!is(typeof(TA_OUT_UPPER_LIMIT))) {
        private enum enumMixinStr_TA_OUT_UPPER_LIMIT = `enum TA_OUT_UPPER_LIMIT = 0x00000800;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_UPPER_LIMIT); }))) {
            mixin(enumMixinStr_TA_OUT_UPPER_LIMIT);
        }
    }




    static if(!is(typeof(TA_OUT_ZERO))) {
        private enum enumMixinStr_TA_OUT_ZERO = `enum TA_OUT_ZERO = 0x00000400;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_ZERO); }))) {
            mixin(enumMixinStr_TA_OUT_ZERO);
        }
    }




    static if(!is(typeof(TA_OUT_NEGATIVE))) {
        private enum enumMixinStr_TA_OUT_NEGATIVE = `enum TA_OUT_NEGATIVE = 0x00000200;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_NEGATIVE); }))) {
            mixin(enumMixinStr_TA_OUT_NEGATIVE);
        }
    }




    static if(!is(typeof(TA_OUT_POSITIVE))) {
        private enum enumMixinStr_TA_OUT_POSITIVE = `enum TA_OUT_POSITIVE = 0x00000100;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_POSITIVE); }))) {
            mixin(enumMixinStr_TA_OUT_POSITIVE);
        }
    }




    static if(!is(typeof(TA_OUT_PATTERN_STRENGTH))) {
        private enum enumMixinStr_TA_OUT_PATTERN_STRENGTH = `enum TA_OUT_PATTERN_STRENGTH = 0x00000080;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_PATTERN_STRENGTH); }))) {
            mixin(enumMixinStr_TA_OUT_PATTERN_STRENGTH);
        }
    }




    static if(!is(typeof(TA_OUT_PATTERN_BULL_BEAR))) {
        private enum enumMixinStr_TA_OUT_PATTERN_BULL_BEAR = `enum TA_OUT_PATTERN_BULL_BEAR = 0x00000040;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_PATTERN_BULL_BEAR); }))) {
            mixin(enumMixinStr_TA_OUT_PATTERN_BULL_BEAR);
        }
    }




    static if(!is(typeof(TA_OUT_PATTERN_BOOL))) {
        private enum enumMixinStr_TA_OUT_PATTERN_BOOL = `enum TA_OUT_PATTERN_BOOL = 0x00000020;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_PATTERN_BOOL); }))) {
            mixin(enumMixinStr_TA_OUT_PATTERN_BOOL);
        }
    }




    static if(!is(typeof(TA_OUT_HISTO))) {
        private enum enumMixinStr_TA_OUT_HISTO = `enum TA_OUT_HISTO = 0x00000010;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_HISTO); }))) {
            mixin(enumMixinStr_TA_OUT_HISTO);
        }
    }




    static if(!is(typeof(TA_OUT_DOT))) {
        private enum enumMixinStr_TA_OUT_DOT = `enum TA_OUT_DOT = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_DOT); }))) {
            mixin(enumMixinStr_TA_OUT_DOT);
        }
    }




    static if(!is(typeof(TA_OUT_DASH_LINE))) {
        private enum enumMixinStr_TA_OUT_DASH_LINE = `enum TA_OUT_DASH_LINE = 0x00000004;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_DASH_LINE); }))) {
            mixin(enumMixinStr_TA_OUT_DASH_LINE);
        }
    }




    static if(!is(typeof(TA_OUT_DOT_LINE))) {
        private enum enumMixinStr_TA_OUT_DOT_LINE = `enum TA_OUT_DOT_LINE = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_DOT_LINE); }))) {
            mixin(enumMixinStr_TA_OUT_DOT_LINE);
        }
    }




    static if(!is(typeof(TA_OUT_LINE))) {
        private enum enumMixinStr_TA_OUT_LINE = `enum TA_OUT_LINE = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OUT_LINE); }))) {
            mixin(enumMixinStr_TA_OUT_LINE);
        }
    }




    static if(!is(typeof(TA_OPTIN_ADVANCED))) {
        private enum enumMixinStr_TA_OPTIN_ADVANCED = `enum TA_OPTIN_ADVANCED = 0x01000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OPTIN_ADVANCED); }))) {
            mixin(enumMixinStr_TA_OPTIN_ADVANCED);
        }
    }




    static if(!is(typeof(TA_OPTIN_IS_CURRENCY))) {
        private enum enumMixinStr_TA_OPTIN_IS_CURRENCY = `enum TA_OPTIN_IS_CURRENCY = 0x00400000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OPTIN_IS_CURRENCY); }))) {
            mixin(enumMixinStr_TA_OPTIN_IS_CURRENCY);
        }
    }




    static if(!is(typeof(TA_OPTIN_IS_DEGREE))) {
        private enum enumMixinStr_TA_OPTIN_IS_DEGREE = `enum TA_OPTIN_IS_DEGREE = 0x00200000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OPTIN_IS_DEGREE); }))) {
            mixin(enumMixinStr_TA_OPTIN_IS_DEGREE);
        }
    }




    static if(!is(typeof(TA_OPTIN_IS_PERCENT))) {
        private enum enumMixinStr_TA_OPTIN_IS_PERCENT = `enum TA_OPTIN_IS_PERCENT = 0x00100000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_OPTIN_IS_PERCENT); }))) {
            mixin(enumMixinStr_TA_OPTIN_IS_PERCENT);
        }
    }




    static if(!is(typeof(TA_IN_PRICE_TIMESTAMP))) {
        private enum enumMixinStr_TA_IN_PRICE_TIMESTAMP = `enum TA_IN_PRICE_TIMESTAMP = 0x00000040;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_IN_PRICE_TIMESTAMP); }))) {
            mixin(enumMixinStr_TA_IN_PRICE_TIMESTAMP);
        }
    }




    static if(!is(typeof(TA_IN_PRICE_OPENINTEREST))) {
        private enum enumMixinStr_TA_IN_PRICE_OPENINTEREST = `enum TA_IN_PRICE_OPENINTEREST = 0x00000020;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_IN_PRICE_OPENINTEREST); }))) {
            mixin(enumMixinStr_TA_IN_PRICE_OPENINTEREST);
        }
    }




    static if(!is(typeof(TA_IN_PRICE_VOLUME))) {
        private enum enumMixinStr_TA_IN_PRICE_VOLUME = `enum TA_IN_PRICE_VOLUME = 0x00000010;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_IN_PRICE_VOLUME); }))) {
            mixin(enumMixinStr_TA_IN_PRICE_VOLUME);
        }
    }




    static if(!is(typeof(TA_IN_PRICE_CLOSE))) {
        private enum enumMixinStr_TA_IN_PRICE_CLOSE = `enum TA_IN_PRICE_CLOSE = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_IN_PRICE_CLOSE); }))) {
            mixin(enumMixinStr_TA_IN_PRICE_CLOSE);
        }
    }




    static if(!is(typeof(TA_IN_PRICE_LOW))) {
        private enum enumMixinStr_TA_IN_PRICE_LOW = `enum TA_IN_PRICE_LOW = 0x00000004;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_IN_PRICE_LOW); }))) {
            mixin(enumMixinStr_TA_IN_PRICE_LOW);
        }
    }




    static if(!is(typeof(TA_IN_PRICE_HIGH))) {
        private enum enumMixinStr_TA_IN_PRICE_HIGH = `enum TA_IN_PRICE_HIGH = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_IN_PRICE_HIGH); }))) {
            mixin(enumMixinStr_TA_IN_PRICE_HIGH);
        }
    }




    static if(!is(typeof(TA_IN_PRICE_OPEN))) {
        private enum enumMixinStr_TA_IN_PRICE_OPEN = `enum TA_IN_PRICE_OPEN = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_IN_PRICE_OPEN); }))) {
            mixin(enumMixinStr_TA_IN_PRICE_OPEN);
        }
    }




    static if(!is(typeof(TA_FUNC_FLG_CANDLESTICK))) {
        private enum enumMixinStr_TA_FUNC_FLG_CANDLESTICK = `enum TA_FUNC_FLG_CANDLESTICK = 0x10000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_FUNC_FLG_CANDLESTICK); }))) {
            mixin(enumMixinStr_TA_FUNC_FLG_CANDLESTICK);
        }
    }




    static if(!is(typeof(TA_FUNC_FLG_UNST_PER))) {
        private enum enumMixinStr_TA_FUNC_FLG_UNST_PER = `enum TA_FUNC_FLG_UNST_PER = 0x08000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_FUNC_FLG_UNST_PER); }))) {
            mixin(enumMixinStr_TA_FUNC_FLG_UNST_PER);
        }
    }




    static if(!is(typeof(TA_FUNC_FLG_VOLUME))) {
        private enum enumMixinStr_TA_FUNC_FLG_VOLUME = `enum TA_FUNC_FLG_VOLUME = 0x04000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_FUNC_FLG_VOLUME); }))) {
            mixin(enumMixinStr_TA_FUNC_FLG_VOLUME);
        }
    }




    static if(!is(typeof(TA_FUNC_FLG_OVERLAP))) {
        private enum enumMixinStr_TA_FUNC_FLG_OVERLAP = `enum TA_FUNC_FLG_OVERLAP = 0x01000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TA_FUNC_FLG_OVERLAP); }))) {
            mixin(enumMixinStr_TA_FUNC_FLG_OVERLAP);
        }
    }






    static if(!is(typeof(_BITS_G_CONFIG_H))) {
        private enum enumMixinStr__BITS_G_CONFIG_H = `enum _BITS_G_CONFIG_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_G_CONFIG_H); }))) {
            mixin(enumMixinStr__BITS_G_CONFIG_H);
        }
    }




    static if(!is(typeof(_G_va_list))) {
        private enum enumMixinStr__G_va_list = `enum _G_va_list = va_list;`;
        static if(is(typeof({ mixin(enumMixinStr__G_va_list); }))) {
            mixin(enumMixinStr__G_va_list);
        }
    }




    static if(!is(typeof(_G_HAVE_MMAP))) {
        private enum enumMixinStr__G_HAVE_MMAP = `enum _G_HAVE_MMAP = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__G_HAVE_MMAP); }))) {
            mixin(enumMixinStr__G_HAVE_MMAP);
        }
    }




    static if(!is(typeof(_G_HAVE_MREMAP))) {
        private enum enumMixinStr__G_HAVE_MREMAP = `enum _G_HAVE_MREMAP = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__G_HAVE_MREMAP); }))) {
            mixin(enumMixinStr__G_HAVE_MREMAP);
        }
    }




    static if(!is(typeof(_G_IO_IO_FILE_VERSION))) {
        private enum enumMixinStr__G_IO_IO_FILE_VERSION = `enum _G_IO_IO_FILE_VERSION = 0x20001;`;
        static if(is(typeof({ mixin(enumMixinStr__G_IO_IO_FILE_VERSION); }))) {
            mixin(enumMixinStr__G_IO_IO_FILE_VERSION);
        }
    }




    static if(!is(typeof(_G_HAVE_ST_BLKSIZE))) {
        private enum enumMixinStr__G_HAVE_ST_BLKSIZE = `enum _G_HAVE_ST_BLKSIZE = defined ( _STATBUF_ST_BLKSIZE );`;
        static if(is(typeof({ mixin(enumMixinStr__G_HAVE_ST_BLKSIZE); }))) {
            mixin(enumMixinStr__G_HAVE_ST_BLKSIZE);
        }
    }




    static if(!is(typeof(_G_BUFSIZ))) {
        private enum enumMixinStr__G_BUFSIZ = `enum _G_BUFSIZ = 8192;`;
        static if(is(typeof({ mixin(enumMixinStr__G_BUFSIZ); }))) {
            mixin(enumMixinStr__G_BUFSIZ);
        }
    }




    static if(!is(typeof(__GLIBC_USE_LIB_EXT2))) {
        private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); }))) {
            mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
        }
    }




    static if(!is(typeof(_BITS_LIBIO_H))) {
        private enum enumMixinStr__BITS_LIBIO_H = `enum _BITS_LIBIO_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_LIBIO_H); }))) {
            mixin(enumMixinStr__BITS_LIBIO_H);
        }
    }




    static if(!is(typeof(_IO_fpos_t))) {
        private enum enumMixinStr__IO_fpos_t = `enum _IO_fpos_t = _G_fpos_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_fpos_t); }))) {
            mixin(enumMixinStr__IO_fpos_t);
        }
    }




    static if(!is(typeof(_IO_fpos64_t))) {
        private enum enumMixinStr__IO_fpos64_t = `enum _IO_fpos64_t = _G_fpos64_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_fpos64_t); }))) {
            mixin(enumMixinStr__IO_fpos64_t);
        }
    }




    static if(!is(typeof(_IO_size_t))) {
        private enum enumMixinStr__IO_size_t = `enum _IO_size_t = size_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_size_t); }))) {
            mixin(enumMixinStr__IO_size_t);
        }
    }




    static if(!is(typeof(_IO_ssize_t))) {
        private enum enumMixinStr__IO_ssize_t = `enum _IO_ssize_t = __ssize_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_ssize_t); }))) {
            mixin(enumMixinStr__IO_ssize_t);
        }
    }




    static if(!is(typeof(_IO_off_t))) {
        private enum enumMixinStr__IO_off_t = `enum _IO_off_t = __off_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_off_t); }))) {
            mixin(enumMixinStr__IO_off_t);
        }
    }




    static if(!is(typeof(_IO_off64_t))) {
        private enum enumMixinStr__IO_off64_t = `enum _IO_off64_t = __off64_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_off64_t); }))) {
            mixin(enumMixinStr__IO_off64_t);
        }
    }




    static if(!is(typeof(_IO_pid_t))) {
        private enum enumMixinStr__IO_pid_t = `enum _IO_pid_t = __pid_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_pid_t); }))) {
            mixin(enumMixinStr__IO_pid_t);
        }
    }




    static if(!is(typeof(_IO_uid_t))) {
        private enum enumMixinStr__IO_uid_t = `enum _IO_uid_t = __uid_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_uid_t); }))) {
            mixin(enumMixinStr__IO_uid_t);
        }
    }




    static if(!is(typeof(_IO_iconv_t))) {
        private enum enumMixinStr__IO_iconv_t = `enum _IO_iconv_t = _G_iconv_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_iconv_t); }))) {
            mixin(enumMixinStr__IO_iconv_t);
        }
    }




    static if(!is(typeof(_IO_HAVE_ST_BLKSIZE))) {
        private enum enumMixinStr__IO_HAVE_ST_BLKSIZE = `enum _IO_HAVE_ST_BLKSIZE = defined ( _STATBUF_ST_BLKSIZE );`;
        static if(is(typeof({ mixin(enumMixinStr__IO_HAVE_ST_BLKSIZE); }))) {
            mixin(enumMixinStr__IO_HAVE_ST_BLKSIZE);
        }
    }




    static if(!is(typeof(_IO_BUFSIZ))) {
        private enum enumMixinStr__IO_BUFSIZ = `enum _IO_BUFSIZ = 8192;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_BUFSIZ); }))) {
            mixin(enumMixinStr__IO_BUFSIZ);
        }
    }




    static if(!is(typeof(_IO_va_list))) {
        private enum enumMixinStr__IO_va_list = `enum _IO_va_list = va_list;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_va_list); }))) {
            mixin(enumMixinStr__IO_va_list);
        }
    }




    static if(!is(typeof(_IO_wint_t))) {
        private enum enumMixinStr__IO_wint_t = `enum _IO_wint_t = wint_t;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_wint_t); }))) {
            mixin(enumMixinStr__IO_wint_t);
        }
    }






    static if(!is(typeof(_IO_UNIFIED_JUMPTABLES))) {
        private enum enumMixinStr__IO_UNIFIED_JUMPTABLES = `enum _IO_UNIFIED_JUMPTABLES = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_UNIFIED_JUMPTABLES); }))) {
            mixin(enumMixinStr__IO_UNIFIED_JUMPTABLES);
        }
    }




    static if(!is(typeof(EOF))) {
        private enum enumMixinStr_EOF = `enum EOF = ( - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_EOF); }))) {
            mixin(enumMixinStr_EOF);
        }
    }




    static if(!is(typeof(_IOS_INPUT))) {
        private enum enumMixinStr__IOS_INPUT = `enum _IOS_INPUT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_INPUT); }))) {
            mixin(enumMixinStr__IOS_INPUT);
        }
    }




    static if(!is(typeof(_IOS_OUTPUT))) {
        private enum enumMixinStr__IOS_OUTPUT = `enum _IOS_OUTPUT = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_OUTPUT); }))) {
            mixin(enumMixinStr__IOS_OUTPUT);
        }
    }




    static if(!is(typeof(_IOS_ATEND))) {
        private enum enumMixinStr__IOS_ATEND = `enum _IOS_ATEND = 4;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_ATEND); }))) {
            mixin(enumMixinStr__IOS_ATEND);
        }
    }




    static if(!is(typeof(_IOS_APPEND))) {
        private enum enumMixinStr__IOS_APPEND = `enum _IOS_APPEND = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_APPEND); }))) {
            mixin(enumMixinStr__IOS_APPEND);
        }
    }




    static if(!is(typeof(_IOS_TRUNC))) {
        private enum enumMixinStr__IOS_TRUNC = `enum _IOS_TRUNC = 16;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_TRUNC); }))) {
            mixin(enumMixinStr__IOS_TRUNC);
        }
    }




    static if(!is(typeof(_IOS_NOCREATE))) {
        private enum enumMixinStr__IOS_NOCREATE = `enum _IOS_NOCREATE = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_NOCREATE); }))) {
            mixin(enumMixinStr__IOS_NOCREATE);
        }
    }




    static if(!is(typeof(_IOS_NOREPLACE))) {
        private enum enumMixinStr__IOS_NOREPLACE = `enum _IOS_NOREPLACE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_NOREPLACE); }))) {
            mixin(enumMixinStr__IOS_NOREPLACE);
        }
    }




    static if(!is(typeof(_IOS_BIN))) {
        private enum enumMixinStr__IOS_BIN = `enum _IOS_BIN = 128;`;
        static if(is(typeof({ mixin(enumMixinStr__IOS_BIN); }))) {
            mixin(enumMixinStr__IOS_BIN);
        }
    }




    static if(!is(typeof(_IO_MAGIC))) {
        private enum enumMixinStr__IO_MAGIC = `enum _IO_MAGIC = 0xFBAD0000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_MAGIC); }))) {
            mixin(enumMixinStr__IO_MAGIC);
        }
    }




    static if(!is(typeof(_OLD_STDIO_MAGIC))) {
        private enum enumMixinStr__OLD_STDIO_MAGIC = `enum _OLD_STDIO_MAGIC = 0xFABC0000;`;
        static if(is(typeof({ mixin(enumMixinStr__OLD_STDIO_MAGIC); }))) {
            mixin(enumMixinStr__OLD_STDIO_MAGIC);
        }
    }




    static if(!is(typeof(_IO_MAGIC_MASK))) {
        private enum enumMixinStr__IO_MAGIC_MASK = `enum _IO_MAGIC_MASK = 0xFFFF0000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_MAGIC_MASK); }))) {
            mixin(enumMixinStr__IO_MAGIC_MASK);
        }
    }




    static if(!is(typeof(_IO_USER_BUF))) {
        private enum enumMixinStr__IO_USER_BUF = `enum _IO_USER_BUF = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_USER_BUF); }))) {
            mixin(enumMixinStr__IO_USER_BUF);
        }
    }




    static if(!is(typeof(_IO_UNBUFFERED))) {
        private enum enumMixinStr__IO_UNBUFFERED = `enum _IO_UNBUFFERED = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_UNBUFFERED); }))) {
            mixin(enumMixinStr__IO_UNBUFFERED);
        }
    }




    static if(!is(typeof(_IO_NO_READS))) {
        private enum enumMixinStr__IO_NO_READS = `enum _IO_NO_READS = 4;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_NO_READS); }))) {
            mixin(enumMixinStr__IO_NO_READS);
        }
    }




    static if(!is(typeof(_IO_NO_WRITES))) {
        private enum enumMixinStr__IO_NO_WRITES = `enum _IO_NO_WRITES = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_NO_WRITES); }))) {
            mixin(enumMixinStr__IO_NO_WRITES);
        }
    }




    static if(!is(typeof(_IO_EOF_SEEN))) {
        private enum enumMixinStr__IO_EOF_SEEN = `enum _IO_EOF_SEEN = 0x10;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_EOF_SEEN); }))) {
            mixin(enumMixinStr__IO_EOF_SEEN);
        }
    }




    static if(!is(typeof(_IO_ERR_SEEN))) {
        private enum enumMixinStr__IO_ERR_SEEN = `enum _IO_ERR_SEEN = 0x20;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_ERR_SEEN); }))) {
            mixin(enumMixinStr__IO_ERR_SEEN);
        }
    }




    static if(!is(typeof(_IO_DELETE_DONT_CLOSE))) {
        private enum enumMixinStr__IO_DELETE_DONT_CLOSE = `enum _IO_DELETE_DONT_CLOSE = 0x40;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_DELETE_DONT_CLOSE); }))) {
            mixin(enumMixinStr__IO_DELETE_DONT_CLOSE);
        }
    }




    static if(!is(typeof(_IO_LINKED))) {
        private enum enumMixinStr__IO_LINKED = `enum _IO_LINKED = 0x80;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_LINKED); }))) {
            mixin(enumMixinStr__IO_LINKED);
        }
    }




    static if(!is(typeof(_IO_IN_BACKUP))) {
        private enum enumMixinStr__IO_IN_BACKUP = `enum _IO_IN_BACKUP = 0x100;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_IN_BACKUP); }))) {
            mixin(enumMixinStr__IO_IN_BACKUP);
        }
    }




    static if(!is(typeof(_IO_LINE_BUF))) {
        private enum enumMixinStr__IO_LINE_BUF = `enum _IO_LINE_BUF = 0x200;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_LINE_BUF); }))) {
            mixin(enumMixinStr__IO_LINE_BUF);
        }
    }




    static if(!is(typeof(_IO_TIED_PUT_GET))) {
        private enum enumMixinStr__IO_TIED_PUT_GET = `enum _IO_TIED_PUT_GET = 0x400;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_TIED_PUT_GET); }))) {
            mixin(enumMixinStr__IO_TIED_PUT_GET);
        }
    }




    static if(!is(typeof(_IO_CURRENTLY_PUTTING))) {
        private enum enumMixinStr__IO_CURRENTLY_PUTTING = `enum _IO_CURRENTLY_PUTTING = 0x800;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_CURRENTLY_PUTTING); }))) {
            mixin(enumMixinStr__IO_CURRENTLY_PUTTING);
        }
    }




    static if(!is(typeof(_IO_IS_APPENDING))) {
        private enum enumMixinStr__IO_IS_APPENDING = `enum _IO_IS_APPENDING = 0x1000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_IS_APPENDING); }))) {
            mixin(enumMixinStr__IO_IS_APPENDING);
        }
    }




    static if(!is(typeof(_IO_IS_FILEBUF))) {
        private enum enumMixinStr__IO_IS_FILEBUF = `enum _IO_IS_FILEBUF = 0x2000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_IS_FILEBUF); }))) {
            mixin(enumMixinStr__IO_IS_FILEBUF);
        }
    }




    static if(!is(typeof(_IO_BAD_SEEN))) {
        private enum enumMixinStr__IO_BAD_SEEN = `enum _IO_BAD_SEEN = 0x4000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_BAD_SEEN); }))) {
            mixin(enumMixinStr__IO_BAD_SEEN);
        }
    }




    static if(!is(typeof(_IO_USER_LOCK))) {
        private enum enumMixinStr__IO_USER_LOCK = `enum _IO_USER_LOCK = 0x8000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_USER_LOCK); }))) {
            mixin(enumMixinStr__IO_USER_LOCK);
        }
    }




    static if(!is(typeof(_IO_FLAGS2_MMAP))) {
        private enum enumMixinStr__IO_FLAGS2_MMAP = `enum _IO_FLAGS2_MMAP = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_FLAGS2_MMAP); }))) {
            mixin(enumMixinStr__IO_FLAGS2_MMAP);
        }
    }




    static if(!is(typeof(_IO_FLAGS2_NOTCANCEL))) {
        private enum enumMixinStr__IO_FLAGS2_NOTCANCEL = `enum _IO_FLAGS2_NOTCANCEL = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_FLAGS2_NOTCANCEL); }))) {
            mixin(enumMixinStr__IO_FLAGS2_NOTCANCEL);
        }
    }




    static if(!is(typeof(_IO_FLAGS2_USER_WBUF))) {
        private enum enumMixinStr__IO_FLAGS2_USER_WBUF = `enum _IO_FLAGS2_USER_WBUF = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_FLAGS2_USER_WBUF); }))) {
            mixin(enumMixinStr__IO_FLAGS2_USER_WBUF);
        }
    }




    static if(!is(typeof(_IO_SKIPWS))) {
        private enum enumMixinStr__IO_SKIPWS = `enum _IO_SKIPWS = std.conv.octal!1;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_SKIPWS); }))) {
            mixin(enumMixinStr__IO_SKIPWS);
        }
    }




    static if(!is(typeof(_IO_LEFT))) {
        private enum enumMixinStr__IO_LEFT = `enum _IO_LEFT = std.conv.octal!2;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_LEFT); }))) {
            mixin(enumMixinStr__IO_LEFT);
        }
    }




    static if(!is(typeof(_IO_RIGHT))) {
        private enum enumMixinStr__IO_RIGHT = `enum _IO_RIGHT = std.conv.octal!4;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_RIGHT); }))) {
            mixin(enumMixinStr__IO_RIGHT);
        }
    }




    static if(!is(typeof(_IO_INTERNAL))) {
        private enum enumMixinStr__IO_INTERNAL = `enum _IO_INTERNAL = std.conv.octal!10;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_INTERNAL); }))) {
            mixin(enumMixinStr__IO_INTERNAL);
        }
    }




    static if(!is(typeof(_IO_DEC))) {
        private enum enumMixinStr__IO_DEC = `enum _IO_DEC = std.conv.octal!20;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_DEC); }))) {
            mixin(enumMixinStr__IO_DEC);
        }
    }




    static if(!is(typeof(_IO_OCT))) {
        private enum enumMixinStr__IO_OCT = `enum _IO_OCT = std.conv.octal!40;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_OCT); }))) {
            mixin(enumMixinStr__IO_OCT);
        }
    }




    static if(!is(typeof(_IO_HEX))) {
        private enum enumMixinStr__IO_HEX = `enum _IO_HEX = std.conv.octal!100;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_HEX); }))) {
            mixin(enumMixinStr__IO_HEX);
        }
    }




    static if(!is(typeof(_IO_SHOWBASE))) {
        private enum enumMixinStr__IO_SHOWBASE = `enum _IO_SHOWBASE = std.conv.octal!200;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_SHOWBASE); }))) {
            mixin(enumMixinStr__IO_SHOWBASE);
        }
    }




    static if(!is(typeof(_IO_SHOWPOINT))) {
        private enum enumMixinStr__IO_SHOWPOINT = `enum _IO_SHOWPOINT = std.conv.octal!400;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_SHOWPOINT); }))) {
            mixin(enumMixinStr__IO_SHOWPOINT);
        }
    }




    static if(!is(typeof(_IO_UPPERCASE))) {
        private enum enumMixinStr__IO_UPPERCASE = `enum _IO_UPPERCASE = std.conv.octal!1000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_UPPERCASE); }))) {
            mixin(enumMixinStr__IO_UPPERCASE);
        }
    }




    static if(!is(typeof(_IO_SHOWPOS))) {
        private enum enumMixinStr__IO_SHOWPOS = `enum _IO_SHOWPOS = std.conv.octal!2000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_SHOWPOS); }))) {
            mixin(enumMixinStr__IO_SHOWPOS);
        }
    }




    static if(!is(typeof(_IO_SCIENTIFIC))) {
        private enum enumMixinStr__IO_SCIENTIFIC = `enum _IO_SCIENTIFIC = std.conv.octal!4000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_SCIENTIFIC); }))) {
            mixin(enumMixinStr__IO_SCIENTIFIC);
        }
    }




    static if(!is(typeof(_IO_FIXED))) {
        private enum enumMixinStr__IO_FIXED = `enum _IO_FIXED = std.conv.octal!10000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_FIXED); }))) {
            mixin(enumMixinStr__IO_FIXED);
        }
    }




    static if(!is(typeof(_IO_UNITBUF))) {
        private enum enumMixinStr__IO_UNITBUF = `enum _IO_UNITBUF = std.conv.octal!20000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_UNITBUF); }))) {
            mixin(enumMixinStr__IO_UNITBUF);
        }
    }




    static if(!is(typeof(_IO_STDIO))) {
        private enum enumMixinStr__IO_STDIO = `enum _IO_STDIO = std.conv.octal!40000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_STDIO); }))) {
            mixin(enumMixinStr__IO_STDIO);
        }
    }




    static if(!is(typeof(_IO_DONT_CLOSE))) {
        private enum enumMixinStr__IO_DONT_CLOSE = `enum _IO_DONT_CLOSE = std.conv.octal!100000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_DONT_CLOSE); }))) {
            mixin(enumMixinStr__IO_DONT_CLOSE);
        }
    }




    static if(!is(typeof(_IO_BOOLALPHA))) {
        private enum enumMixinStr__IO_BOOLALPHA = `enum _IO_BOOLALPHA = std.conv.octal!200000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_BOOLALPHA); }))) {
            mixin(enumMixinStr__IO_BOOLALPHA);
        }
    }




    static if(!is(typeof(_IO_file_flags))) {
        private enum enumMixinStr__IO_file_flags = `enum _IO_file_flags = _flags;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_file_flags); }))) {
            mixin(enumMixinStr__IO_file_flags);
        }
    }






    static if(!is(typeof(_IO_stdin))) {
        private enum enumMixinStr__IO_stdin = `enum _IO_stdin = ( cast( _IO_FILE * ) ( & _IO_2_1_stdin_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr__IO_stdin); }))) {
            mixin(enumMixinStr__IO_stdin);
        }
    }




    static if(!is(typeof(_IO_stdout))) {
        private enum enumMixinStr__IO_stdout = `enum _IO_stdout = ( cast( _IO_FILE * ) ( & _IO_2_1_stdout_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr__IO_stdout); }))) {
            mixin(enumMixinStr__IO_stdout);
        }
    }




    static if(!is(typeof(_IO_stderr))) {
        private enum enumMixinStr__IO_stderr = `enum _IO_stderr = ( cast( _IO_FILE * ) ( & _IO_2_1_stderr_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr__IO_stderr); }))) {
            mixin(enumMixinStr__IO_stderr);
        }
    }
    static if(!is(typeof(_POSIX_THREAD_KEYS_MAX))) {
        private enum enumMixinStr__POSIX_THREAD_KEYS_MAX = `enum _POSIX_THREAD_KEYS_MAX = 128;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_KEYS_MAX); }))) {
            mixin(enumMixinStr__POSIX_THREAD_KEYS_MAX);
        }
    }




    static if(!is(typeof(PTHREAD_KEYS_MAX))) {
        private enum enumMixinStr_PTHREAD_KEYS_MAX = `enum PTHREAD_KEYS_MAX = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_PTHREAD_KEYS_MAX); }))) {
            mixin(enumMixinStr_PTHREAD_KEYS_MAX);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_DESTRUCTOR_ITERATIONS))) {
        private enum enumMixinStr__POSIX_THREAD_DESTRUCTOR_ITERATIONS = `enum _POSIX_THREAD_DESTRUCTOR_ITERATIONS = 4;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_DESTRUCTOR_ITERATIONS); }))) {
            mixin(enumMixinStr__POSIX_THREAD_DESTRUCTOR_ITERATIONS);
        }
    }




    static if(!is(typeof(PTHREAD_DESTRUCTOR_ITERATIONS))) {
        private enum enumMixinStr_PTHREAD_DESTRUCTOR_ITERATIONS = `enum PTHREAD_DESTRUCTOR_ITERATIONS = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_PTHREAD_DESTRUCTOR_ITERATIONS); }))) {
            mixin(enumMixinStr_PTHREAD_DESTRUCTOR_ITERATIONS);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_THREADS_MAX))) {
        private enum enumMixinStr__POSIX_THREAD_THREADS_MAX = `enum _POSIX_THREAD_THREADS_MAX = 64;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_THREADS_MAX); }))) {
            mixin(enumMixinStr__POSIX_THREAD_THREADS_MAX);
        }
    }




    static if(!is(typeof(AIO_PRIO_DELTA_MAX))) {
        private enum enumMixinStr_AIO_PRIO_DELTA_MAX = `enum AIO_PRIO_DELTA_MAX = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_AIO_PRIO_DELTA_MAX); }))) {
            mixin(enumMixinStr_AIO_PRIO_DELTA_MAX);
        }
    }




    static if(!is(typeof(PTHREAD_STACK_MIN))) {
        private enum enumMixinStr_PTHREAD_STACK_MIN = `enum PTHREAD_STACK_MIN = 16384;`;
        static if(is(typeof({ mixin(enumMixinStr_PTHREAD_STACK_MIN); }))) {
            mixin(enumMixinStr_PTHREAD_STACK_MIN);
        }
    }




    static if(!is(typeof(DELAYTIMER_MAX))) {
        private enum enumMixinStr_DELAYTIMER_MAX = `enum DELAYTIMER_MAX = 2147483647;`;
        static if(is(typeof({ mixin(enumMixinStr_DELAYTIMER_MAX); }))) {
            mixin(enumMixinStr_DELAYTIMER_MAX);
        }
    }




    static if(!is(typeof(TTY_NAME_MAX))) {
        private enum enumMixinStr_TTY_NAME_MAX = `enum TTY_NAME_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_TTY_NAME_MAX); }))) {
            mixin(enumMixinStr_TTY_NAME_MAX);
        }
    }




    static if(!is(typeof(LOGIN_NAME_MAX))) {
        private enum enumMixinStr_LOGIN_NAME_MAX = `enum LOGIN_NAME_MAX = 256;`;
        static if(is(typeof({ mixin(enumMixinStr_LOGIN_NAME_MAX); }))) {
            mixin(enumMixinStr_LOGIN_NAME_MAX);
        }
    }




    static if(!is(typeof(HOST_NAME_MAX))) {
        private enum enumMixinStr_HOST_NAME_MAX = `enum HOST_NAME_MAX = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_HOST_NAME_MAX); }))) {
            mixin(enumMixinStr_HOST_NAME_MAX);
        }
    }




    static if(!is(typeof(MQ_PRIO_MAX))) {
        private enum enumMixinStr_MQ_PRIO_MAX = `enum MQ_PRIO_MAX = 32768;`;
        static if(is(typeof({ mixin(enumMixinStr_MQ_PRIO_MAX); }))) {
            mixin(enumMixinStr_MQ_PRIO_MAX);
        }
    }




    static if(!is(typeof(SEM_VALUE_MAX))) {
        private enum enumMixinStr_SEM_VALUE_MAX = `enum SEM_VALUE_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_SEM_VALUE_MAX); }))) {
            mixin(enumMixinStr_SEM_VALUE_MAX);
        }
    }




    static if(!is(typeof(_BITS_POSIX1_LIM_H))) {
        private enum enumMixinStr__BITS_POSIX1_LIM_H = `enum _BITS_POSIX1_LIM_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_POSIX1_LIM_H); }))) {
            mixin(enumMixinStr__BITS_POSIX1_LIM_H);
        }
    }




    static if(!is(typeof(_POSIX_AIO_LISTIO_MAX))) {
        private enum enumMixinStr__POSIX_AIO_LISTIO_MAX = `enum _POSIX_AIO_LISTIO_MAX = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_AIO_LISTIO_MAX); }))) {
            mixin(enumMixinStr__POSIX_AIO_LISTIO_MAX);
        }
    }




    static if(!is(typeof(_POSIX_AIO_MAX))) {
        private enum enumMixinStr__POSIX_AIO_MAX = `enum _POSIX_AIO_MAX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_AIO_MAX); }))) {
            mixin(enumMixinStr__POSIX_AIO_MAX);
        }
    }




    static if(!is(typeof(_POSIX_ARG_MAX))) {
        private enum enumMixinStr__POSIX_ARG_MAX = `enum _POSIX_ARG_MAX = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_ARG_MAX); }))) {
            mixin(enumMixinStr__POSIX_ARG_MAX);
        }
    }




    static if(!is(typeof(_POSIX_CHILD_MAX))) {
        private enum enumMixinStr__POSIX_CHILD_MAX = `enum _POSIX_CHILD_MAX = 25;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_CHILD_MAX); }))) {
            mixin(enumMixinStr__POSIX_CHILD_MAX);
        }
    }




    static if(!is(typeof(_POSIX_DELAYTIMER_MAX))) {
        private enum enumMixinStr__POSIX_DELAYTIMER_MAX = `enum _POSIX_DELAYTIMER_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_DELAYTIMER_MAX); }))) {
            mixin(enumMixinStr__POSIX_DELAYTIMER_MAX);
        }
    }




    static if(!is(typeof(_POSIX_HOST_NAME_MAX))) {
        private enum enumMixinStr__POSIX_HOST_NAME_MAX = `enum _POSIX_HOST_NAME_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_HOST_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_HOST_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_LINK_MAX))) {
        private enum enumMixinStr__POSIX_LINK_MAX = `enum _POSIX_LINK_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_LINK_MAX); }))) {
            mixin(enumMixinStr__POSIX_LINK_MAX);
        }
    }




    static if(!is(typeof(_POSIX_LOGIN_NAME_MAX))) {
        private enum enumMixinStr__POSIX_LOGIN_NAME_MAX = `enum _POSIX_LOGIN_NAME_MAX = 9;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_LOGIN_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_LOGIN_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_MAX_CANON))) {
        private enum enumMixinStr__POSIX_MAX_CANON = `enum _POSIX_MAX_CANON = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MAX_CANON); }))) {
            mixin(enumMixinStr__POSIX_MAX_CANON);
        }
    }




    static if(!is(typeof(_POSIX_MAX_INPUT))) {
        private enum enumMixinStr__POSIX_MAX_INPUT = `enum _POSIX_MAX_INPUT = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MAX_INPUT); }))) {
            mixin(enumMixinStr__POSIX_MAX_INPUT);
        }
    }




    static if(!is(typeof(_POSIX_MQ_OPEN_MAX))) {
        private enum enumMixinStr__POSIX_MQ_OPEN_MAX = `enum _POSIX_MQ_OPEN_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MQ_OPEN_MAX); }))) {
            mixin(enumMixinStr__POSIX_MQ_OPEN_MAX);
        }
    }




    static if(!is(typeof(_POSIX_MQ_PRIO_MAX))) {
        private enum enumMixinStr__POSIX_MQ_PRIO_MAX = `enum _POSIX_MQ_PRIO_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MQ_PRIO_MAX); }))) {
            mixin(enumMixinStr__POSIX_MQ_PRIO_MAX);
        }
    }




    static if(!is(typeof(_POSIX_NAME_MAX))) {
        private enum enumMixinStr__POSIX_NAME_MAX = `enum _POSIX_NAME_MAX = 14;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_NGROUPS_MAX))) {
        private enum enumMixinStr__POSIX_NGROUPS_MAX = `enum _POSIX_NGROUPS_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_NGROUPS_MAX); }))) {
            mixin(enumMixinStr__POSIX_NGROUPS_MAX);
        }
    }




    static if(!is(typeof(_POSIX_OPEN_MAX))) {
        private enum enumMixinStr__POSIX_OPEN_MAX = `enum _POSIX_OPEN_MAX = 20;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_OPEN_MAX); }))) {
            mixin(enumMixinStr__POSIX_OPEN_MAX);
        }
    }




    static if(!is(typeof(_POSIX_PATH_MAX))) {
        private enum enumMixinStr__POSIX_PATH_MAX = `enum _POSIX_PATH_MAX = 256;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_PATH_MAX); }))) {
            mixin(enumMixinStr__POSIX_PATH_MAX);
        }
    }




    static if(!is(typeof(_POSIX_PIPE_BUF))) {
        private enum enumMixinStr__POSIX_PIPE_BUF = `enum _POSIX_PIPE_BUF = 512;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_PIPE_BUF); }))) {
            mixin(enumMixinStr__POSIX_PIPE_BUF);
        }
    }




    static if(!is(typeof(_POSIX_RE_DUP_MAX))) {
        private enum enumMixinStr__POSIX_RE_DUP_MAX = `enum _POSIX_RE_DUP_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_RE_DUP_MAX); }))) {
            mixin(enumMixinStr__POSIX_RE_DUP_MAX);
        }
    }




    static if(!is(typeof(_POSIX_RTSIG_MAX))) {
        private enum enumMixinStr__POSIX_RTSIG_MAX = `enum _POSIX_RTSIG_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_RTSIG_MAX); }))) {
            mixin(enumMixinStr__POSIX_RTSIG_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SEM_NSEMS_MAX))) {
        private enum enumMixinStr__POSIX_SEM_NSEMS_MAX = `enum _POSIX_SEM_NSEMS_MAX = 256;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SEM_NSEMS_MAX); }))) {
            mixin(enumMixinStr__POSIX_SEM_NSEMS_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SEM_VALUE_MAX))) {
        private enum enumMixinStr__POSIX_SEM_VALUE_MAX = `enum _POSIX_SEM_VALUE_MAX = 32767;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SEM_VALUE_MAX); }))) {
            mixin(enumMixinStr__POSIX_SEM_VALUE_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SIGQUEUE_MAX))) {
        private enum enumMixinStr__POSIX_SIGQUEUE_MAX = `enum _POSIX_SIGQUEUE_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SIGQUEUE_MAX); }))) {
            mixin(enumMixinStr__POSIX_SIGQUEUE_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SSIZE_MAX))) {
        private enum enumMixinStr__POSIX_SSIZE_MAX = `enum _POSIX_SSIZE_MAX = 32767;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SSIZE_MAX); }))) {
            mixin(enumMixinStr__POSIX_SSIZE_MAX);
        }
    }




    static if(!is(typeof(_POSIX_STREAM_MAX))) {
        private enum enumMixinStr__POSIX_STREAM_MAX = `enum _POSIX_STREAM_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_STREAM_MAX); }))) {
            mixin(enumMixinStr__POSIX_STREAM_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SYMLINK_MAX))) {
        private enum enumMixinStr__POSIX_SYMLINK_MAX = `enum _POSIX_SYMLINK_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SYMLINK_MAX); }))) {
            mixin(enumMixinStr__POSIX_SYMLINK_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SYMLOOP_MAX))) {
        private enum enumMixinStr__POSIX_SYMLOOP_MAX = `enum _POSIX_SYMLOOP_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SYMLOOP_MAX); }))) {
            mixin(enumMixinStr__POSIX_SYMLOOP_MAX);
        }
    }




    static if(!is(typeof(_POSIX_TIMER_MAX))) {
        private enum enumMixinStr__POSIX_TIMER_MAX = `enum _POSIX_TIMER_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TIMER_MAX); }))) {
            mixin(enumMixinStr__POSIX_TIMER_MAX);
        }
    }




    static if(!is(typeof(_POSIX_TTY_NAME_MAX))) {
        private enum enumMixinStr__POSIX_TTY_NAME_MAX = `enum _POSIX_TTY_NAME_MAX = 9;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TTY_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_TTY_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_TZNAME_MAX))) {
        private enum enumMixinStr__POSIX_TZNAME_MAX = `enum _POSIX_TZNAME_MAX = 6;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TZNAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_TZNAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_CLOCKRES_MIN))) {
        private enum enumMixinStr__POSIX_CLOCKRES_MIN = `enum _POSIX_CLOCKRES_MIN = 20000000;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_CLOCKRES_MIN); }))) {
            mixin(enumMixinStr__POSIX_CLOCKRES_MIN);
        }
    }




    static if(!is(typeof(SSIZE_MAX))) {
        private enum enumMixinStr_SSIZE_MAX = `enum SSIZE_MAX = 0x7fffffffffffffffL;`;
        static if(is(typeof({ mixin(enumMixinStr_SSIZE_MAX); }))) {
            mixin(enumMixinStr_SSIZE_MAX);
        }
    }




    static if(!is(typeof(_BITS_POSIX2_LIM_H))) {
        private enum enumMixinStr__BITS_POSIX2_LIM_H = `enum _BITS_POSIX2_LIM_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_POSIX2_LIM_H); }))) {
            mixin(enumMixinStr__BITS_POSIX2_LIM_H);
        }
    }




    static if(!is(typeof(_POSIX2_BC_BASE_MAX))) {
        private enum enumMixinStr__POSIX2_BC_BASE_MAX = `enum _POSIX2_BC_BASE_MAX = 99;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_BASE_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_BASE_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_BC_DIM_MAX))) {
        private enum enumMixinStr__POSIX2_BC_DIM_MAX = `enum _POSIX2_BC_DIM_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_DIM_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_DIM_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_BC_SCALE_MAX))) {
        private enum enumMixinStr__POSIX2_BC_SCALE_MAX = `enum _POSIX2_BC_SCALE_MAX = 99;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_SCALE_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_SCALE_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_BC_STRING_MAX))) {
        private enum enumMixinStr__POSIX2_BC_STRING_MAX = `enum _POSIX2_BC_STRING_MAX = 1000;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_STRING_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_STRING_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_COLL_WEIGHTS_MAX))) {
        private enum enumMixinStr__POSIX2_COLL_WEIGHTS_MAX = `enum _POSIX2_COLL_WEIGHTS_MAX = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_COLL_WEIGHTS_MAX); }))) {
            mixin(enumMixinStr__POSIX2_COLL_WEIGHTS_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_EXPR_NEST_MAX))) {
        private enum enumMixinStr__POSIX2_EXPR_NEST_MAX = `enum _POSIX2_EXPR_NEST_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_EXPR_NEST_MAX); }))) {
            mixin(enumMixinStr__POSIX2_EXPR_NEST_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_LINE_MAX))) {
        private enum enumMixinStr__POSIX2_LINE_MAX = `enum _POSIX2_LINE_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_LINE_MAX); }))) {
            mixin(enumMixinStr__POSIX2_LINE_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_RE_DUP_MAX))) {
        private enum enumMixinStr__POSIX2_RE_DUP_MAX = `enum _POSIX2_RE_DUP_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_RE_DUP_MAX); }))) {
            mixin(enumMixinStr__POSIX2_RE_DUP_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_CHARCLASS_NAME_MAX))) {
        private enum enumMixinStr__POSIX2_CHARCLASS_NAME_MAX = `enum _POSIX2_CHARCLASS_NAME_MAX = 14;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_CHARCLASS_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX2_CHARCLASS_NAME_MAX);
        }
    }




    static if(!is(typeof(BC_BASE_MAX))) {
        private enum enumMixinStr_BC_BASE_MAX = `enum BC_BASE_MAX = 99;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_BASE_MAX); }))) {
            mixin(enumMixinStr_BC_BASE_MAX);
        }
    }




    static if(!is(typeof(BC_DIM_MAX))) {
        private enum enumMixinStr_BC_DIM_MAX = `enum BC_DIM_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_DIM_MAX); }))) {
            mixin(enumMixinStr_BC_DIM_MAX);
        }
    }




    static if(!is(typeof(BC_SCALE_MAX))) {
        private enum enumMixinStr_BC_SCALE_MAX = `enum BC_SCALE_MAX = 99;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_SCALE_MAX); }))) {
            mixin(enumMixinStr_BC_SCALE_MAX);
        }
    }




    static if(!is(typeof(BC_STRING_MAX))) {
        private enum enumMixinStr_BC_STRING_MAX = `enum BC_STRING_MAX = 1000;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_STRING_MAX); }))) {
            mixin(enumMixinStr_BC_STRING_MAX);
        }
    }




    static if(!is(typeof(COLL_WEIGHTS_MAX))) {
        private enum enumMixinStr_COLL_WEIGHTS_MAX = `enum COLL_WEIGHTS_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_COLL_WEIGHTS_MAX); }))) {
            mixin(enumMixinStr_COLL_WEIGHTS_MAX);
        }
    }




    static if(!is(typeof(EXPR_NEST_MAX))) {
        private enum enumMixinStr_EXPR_NEST_MAX = `enum EXPR_NEST_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_EXPR_NEST_MAX); }))) {
            mixin(enumMixinStr_EXPR_NEST_MAX);
        }
    }




    static if(!is(typeof(LINE_MAX))) {
        private enum enumMixinStr_LINE_MAX = `enum LINE_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr_LINE_MAX); }))) {
            mixin(enumMixinStr_LINE_MAX);
        }
    }




    static if(!is(typeof(CHARCLASS_NAME_MAX))) {
        private enum enumMixinStr_CHARCLASS_NAME_MAX = `enum CHARCLASS_NAME_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr_CHARCLASS_NAME_MAX); }))) {
            mixin(enumMixinStr_CHARCLASS_NAME_MAX);
        }
    }




    static if(!is(typeof(RE_DUP_MAX))) {
        private enum enumMixinStr_RE_DUP_MAX = `enum RE_DUP_MAX = ( 0x7fff );`;
        static if(is(typeof({ mixin(enumMixinStr_RE_DUP_MAX); }))) {
            mixin(enumMixinStr_RE_DUP_MAX);
        }
    }




    static if(!is(typeof(_BITS_STDIO_LIM_H))) {
        private enum enumMixinStr__BITS_STDIO_LIM_H = `enum _BITS_STDIO_LIM_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDIO_LIM_H); }))) {
            mixin(enumMixinStr__BITS_STDIO_LIM_H);
        }
    }




    static if(!is(typeof(L_tmpnam))) {
        private enum enumMixinStr_L_tmpnam = `enum L_tmpnam = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_L_tmpnam); }))) {
            mixin(enumMixinStr_L_tmpnam);
        }
    }




    static if(!is(typeof(TMP_MAX))) {
        private enum enumMixinStr_TMP_MAX = `enum TMP_MAX = 238328;`;
        static if(is(typeof({ mixin(enumMixinStr_TMP_MAX); }))) {
            mixin(enumMixinStr_TMP_MAX);
        }
    }




    static if(!is(typeof(FILENAME_MAX))) {
        private enum enumMixinStr_FILENAME_MAX = `enum FILENAME_MAX = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_FILENAME_MAX); }))) {
            mixin(enumMixinStr_FILENAME_MAX);
        }
    }




    static if(!is(typeof(L_ctermid))) {
        private enum enumMixinStr_L_ctermid = `enum L_ctermid = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_L_ctermid); }))) {
            mixin(enumMixinStr_L_ctermid);
        }
    }




    static if(!is(typeof(FOPEN_MAX))) {
        private enum enumMixinStr_FOPEN_MAX = `enum FOPEN_MAX = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_FOPEN_MAX); }))) {
            mixin(enumMixinStr_FOPEN_MAX);
        }
    }




    static if(!is(typeof(_BITS_TYPES_H))) {
        private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_H);
        }
    }




    static if(!is(typeof(__S16_TYPE))) {
        private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
        static if(is(typeof({ mixin(enumMixinStr___S16_TYPE); }))) {
            mixin(enumMixinStr___S16_TYPE);
        }
    }




    static if(!is(typeof(__U16_TYPE))) {
        private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
        static if(is(typeof({ mixin(enumMixinStr___U16_TYPE); }))) {
            mixin(enumMixinStr___U16_TYPE);
        }
    }




    static if(!is(typeof(__S32_TYPE))) {
        private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___S32_TYPE); }))) {
            mixin(enumMixinStr___S32_TYPE);
        }
    }




    static if(!is(typeof(__U32_TYPE))) {
        private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___U32_TYPE); }))) {
            mixin(enumMixinStr___U32_TYPE);
        }
    }




    static if(!is(typeof(__SLONGWORD_TYPE))) {
        private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); }))) {
            mixin(enumMixinStr___SLONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__ULONGWORD_TYPE))) {
        private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); }))) {
            mixin(enumMixinStr___ULONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__SQUAD_TYPE))) {
        private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); }))) {
            mixin(enumMixinStr___SQUAD_TYPE);
        }
    }




    static if(!is(typeof(__UQUAD_TYPE))) {
        private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); }))) {
            mixin(enumMixinStr___UQUAD_TYPE);
        }
    }




    static if(!is(typeof(__SWORD_TYPE))) {
        private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SWORD_TYPE); }))) {
            mixin(enumMixinStr___SWORD_TYPE);
        }
    }




    static if(!is(typeof(__UWORD_TYPE))) {
        private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UWORD_TYPE); }))) {
            mixin(enumMixinStr___UWORD_TYPE);
        }
    }




    static if(!is(typeof(__SLONG32_TYPE))) {
        private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); }))) {
            mixin(enumMixinStr___SLONG32_TYPE);
        }
    }




    static if(!is(typeof(__ULONG32_TYPE))) {
        private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); }))) {
            mixin(enumMixinStr___ULONG32_TYPE);
        }
    }




    static if(!is(typeof(__S64_TYPE))) {
        private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___S64_TYPE); }))) {
            mixin(enumMixinStr___S64_TYPE);
        }
    }




    static if(!is(typeof(__U64_TYPE))) {
        private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___U64_TYPE); }))) {
            mixin(enumMixinStr___U64_TYPE);
        }
    }




    static if(!is(typeof(__STD_TYPE))) {
        private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
        static if(is(typeof({ mixin(enumMixinStr___STD_TYPE); }))) {
            mixin(enumMixinStr___STD_TYPE);
        }
    }




    static if(!is(typeof(__FILE_defined))) {
        private enum enumMixinStr___FILE_defined = `enum __FILE_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___FILE_defined); }))) {
            mixin(enumMixinStr___FILE_defined);
        }
    }




    static if(!is(typeof(____FILE_defined))) {
        private enum enumMixinStr_____FILE_defined = `enum ____FILE_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_____FILE_defined); }))) {
            mixin(enumMixinStr_____FILE_defined);
        }
    }




    static if(!is(typeof(____mbstate_t_defined))) {
        private enum enumMixinStr_____mbstate_t_defined = `enum ____mbstate_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_____mbstate_t_defined); }))) {
            mixin(enumMixinStr_____mbstate_t_defined);
        }
    }




    static if(!is(typeof(_BITS_TYPESIZES_H))) {
        private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); }))) {
            mixin(enumMixinStr__BITS_TYPESIZES_H);
        }
    }




    static if(!is(typeof(__SYSCALL_SLONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_ULONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
        }
    }




    static if(!is(typeof(__DEV_T_TYPE))) {
        private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); }))) {
            mixin(enumMixinStr___DEV_T_TYPE);
        }
    }




    static if(!is(typeof(__UID_T_TYPE))) {
        private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___UID_T_TYPE); }))) {
            mixin(enumMixinStr___UID_T_TYPE);
        }
    }




    static if(!is(typeof(__GID_T_TYPE))) {
        private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___GID_T_TYPE); }))) {
            mixin(enumMixinStr___GID_T_TYPE);
        }
    }




    static if(!is(typeof(__INO_T_TYPE))) {
        private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_TYPE); }))) {
            mixin(enumMixinStr___INO_T_TYPE);
        }
    }




    static if(!is(typeof(__INO64_T_TYPE))) {
        private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); }))) {
            mixin(enumMixinStr___INO64_T_TYPE);
        }
    }




    static if(!is(typeof(__MODE_T_TYPE))) {
        private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); }))) {
            mixin(enumMixinStr___MODE_T_TYPE);
        }
    }




    static if(!is(typeof(__NLINK_T_TYPE))) {
        private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); }))) {
            mixin(enumMixinStr___NLINK_T_TYPE);
        }
    }




    static if(!is(typeof(__FSWORD_T_TYPE))) {
        private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); }))) {
            mixin(enumMixinStr___FSWORD_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_TYPE))) {
        private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); }))) {
            mixin(enumMixinStr___OFF_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF64_T_TYPE))) {
        private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); }))) {
            mixin(enumMixinStr___OFF64_T_TYPE);
        }
    }




    static if(!is(typeof(__PID_T_TYPE))) {
        private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___PID_T_TYPE); }))) {
            mixin(enumMixinStr___PID_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM_T_TYPE))) {
        private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM64_T_TYPE))) {
        private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM64_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT_T_TYPE))) {
        private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT64_T_TYPE))) {
        private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT64_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT64_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__ID_T_TYPE))) {
        private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ID_T_TYPE); }))) {
            mixin(enumMixinStr___ID_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCK_T_TYPE))) {
        private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCK_T_TYPE);
        }
    }




    static if(!is(typeof(__TIME_T_TYPE))) {
        private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); }))) {
            mixin(enumMixinStr___TIME_T_TYPE);
        }
    }




    static if(!is(typeof(__USECONDS_T_TYPE))) {
        private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___USECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__DADDR_T_TYPE))) {
        private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); }))) {
            mixin(enumMixinStr___DADDR_T_TYPE);
        }
    }




    static if(!is(typeof(__KEY_T_TYPE))) {
        private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); }))) {
            mixin(enumMixinStr___KEY_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCKID_T_TYPE))) {
        private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCKID_T_TYPE);
        }
    }




    static if(!is(typeof(__TIMER_T_TYPE))) {
        private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); }))) {
            mixin(enumMixinStr___TIMER_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKSIZE_T_TYPE))) {
        private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___BLKSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__FSID_T_TYPE))) {
        private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
        static if(is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); }))) {
            mixin(enumMixinStr___FSID_T_TYPE);
        }
    }




    static if(!is(typeof(__SSIZE_T_TYPE))) {
        private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___SSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__CPU_MASK_TYPE))) {
        private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); }))) {
            mixin(enumMixinStr___CPU_MASK_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_MATCHES_OFF64_T))) {
        private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); }))) {
            mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
        }
    }




    static if(!is(typeof(__INO_T_MATCHES_INO64_T))) {
        private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); }))) {
            mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
        }
    }




    static if(!is(typeof(__RLIM_T_MATCHES_RLIM64_T))) {
        private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T); }))) {
            mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
        }
    }




    static if(!is(typeof(__FD_SETSIZE))) {
        private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr___FD_SETSIZE); }))) {
            mixin(enumMixinStr___FD_SETSIZE);
        }
    }




    static if(!is(typeof(__WORDSIZE))) {
        private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE); }))) {
            mixin(enumMixinStr___WORDSIZE);
        }
    }




    static if(!is(typeof(__WORDSIZE_TIME64_COMPAT32))) {
        private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32); }))) {
            mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
        }
    }




    static if(!is(typeof(__SYSCALL_WORDSIZE))) {
        private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); }))) {
            mixin(enumMixinStr___SYSCALL_WORDSIZE);
        }
    }
    static if(!is(typeof(_SYS_CDEFS_H))) {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); }))) {
            mixin(enumMixinStr__SYS_CDEFS_H);
        }
    }
    static if(!is(typeof(__THROW))) {
        private enum enumMixinStr___THROW = `enum __THROW = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROW); }))) {
            mixin(enumMixinStr___THROW);
        }
    }




    static if(!is(typeof(__THROWNL))) {
        private enum enumMixinStr___THROWNL = `enum __THROWNL = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROWNL); }))) {
            mixin(enumMixinStr___THROWNL);
        }
    }
    static if(!is(typeof(__ptr_t))) {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___ptr_t); }))) {
            mixin(enumMixinStr___ptr_t);
        }
    }
    static if(!is(typeof(__flexarr))) {
        private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
        static if(is(typeof({ mixin(enumMixinStr___flexarr); }))) {
            mixin(enumMixinStr___flexarr);
        }
    }




    static if(!is(typeof(__glibc_c99_flexarr_available))) {
        private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_c99_flexarr_available); }))) {
            mixin(enumMixinStr___glibc_c99_flexarr_available);
        }
    }
    static if(!is(typeof(__attribute_malloc__))) {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_malloc__); }))) {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }






    static if(!is(typeof(__attribute_pure__))) {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_pure__); }))) {
            mixin(enumMixinStr___attribute_pure__);
        }
    }




    static if(!is(typeof(__attribute_const__))) {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_const__); }))) {
            mixin(enumMixinStr___attribute_const__);
        }
    }




    static if(!is(typeof(__attribute_used__))) {
        private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_used__); }))) {
            mixin(enumMixinStr___attribute_used__);
        }
    }




    static if(!is(typeof(__attribute_noinline__))) {
        private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_noinline__); }))) {
            mixin(enumMixinStr___attribute_noinline__);
        }
    }




    static if(!is(typeof(__attribute_deprecated__))) {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_deprecated__); }))) {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }
    static if(!is(typeof(__attribute_warn_unused_result__))) {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_warn_unused_result__); }))) {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }






    static if(!is(typeof(__always_inline))) {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___always_inline); }))) {
            mixin(enumMixinStr___always_inline);
        }
    }






    static if(!is(typeof(__extern_inline))) {
        private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_inline); }))) {
            mixin(enumMixinStr___extern_inline);
        }
    }




    static if(!is(typeof(__extern_always_inline))) {
        private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_always_inline); }))) {
            mixin(enumMixinStr___extern_always_inline);
        }
    }




    static if(!is(typeof(__fortify_function))) {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if(is(typeof({ mixin(enumMixinStr___fortify_function); }))) {
            mixin(enumMixinStr___fortify_function);
        }
    }




    static if(!is(typeof(__restrict_arr))) {
        private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
        static if(is(typeof({ mixin(enumMixinStr___restrict_arr); }))) {
            mixin(enumMixinStr___restrict_arr);
        }
    }
    static if(!is(typeof(__HAVE_GENERIC_SELECTION))) {
        private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); }))) {
            mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
        }
    }

}


struct __va_list_tag;
