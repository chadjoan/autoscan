
/++
Convenience wrapper for SANE API functions.

These allow the SANE API to be used in a manner that is more nature to D by
providing things likes exception handling, ranges, and length-delimited strings.
+/
module sane_wrapper;

import sane;
import std.conv;
import std.string;
import std.traits;
import std.range;
import std.stdio;
import std.c.string;
import std.exception;
import core.exception;

/++
This exception is thrown whenever a SANE function returns a non-successful
status flag (anything that isn't SANE_STATUS_GOOD).
+/
abstract class SaneException : Exception
{
    SANE_Status status;

    this(SANE_Status status)
    {
        this.status = status;
        auto msg_cstr = sane_strstatus(status);
        auto msg_len = strlen(msg_cstr);
        super(msg_cstr[0..msg_len].idup);
    }

    @disable this(string msg);
}

class SaneExceptionUnsupported  : SaneException { this() { super(SANE_STATUS_UNSUPPORTED); } } ///
class SaneExceptionCancelled    : SaneException { this() { super(SANE_STATUS_CANCELLED); } }   ///
class SaneExceptionDeviceBusy   : SaneException { this() { super(SANE_STATUS_DEVICE_BUSY); } } ///
class SaneExceptionInvalidData  : SaneException { this() { super(SANE_STATUS_INVAL); } }       ///
class SaneExceptionEndOfFile    : SaneException { this() { super(SANE_STATUS_EOF); } }         ///
class SaneExceptionJammed       : SaneException { this() { super(SANE_STATUS_JAMMED); } }      ///
class SaneExceptionFeederEmpty  : SaneException { this() { super(SANE_STATUS_NO_DOCS); } }     ///
class SaneExceptionCoverOpen    : SaneException { this() { super(SANE_STATUS_COVER_OPEN); } }  ///
class SaneExceptionIoError      : SaneException { this() { super(SANE_STATUS_IO_ERROR); } }    ///
class SaneExceptionAccessDenied : SaneException { this() { super(SANE_STATUS_ACCESS_DENIED); } } ///

void saneThrowOnError(SANE_Status s)
{
    final switch(s)
    {
        case SANE_STATUS_GOOD: break;
        case SANE_STATUS_UNSUPPORTED:   throw new SaneExceptionUnsupported();
        case SANE_STATUS_CANCELLED:     throw new SaneExceptionCancelled();
        case SANE_STATUS_DEVICE_BUSY:   throw new SaneExceptionDeviceBusy();
        case SANE_STATUS_INVAL:         throw new SaneExceptionInvalidData();
        case SANE_STATUS_EOF:           throw new SaneExceptionEndOfFile();
        case SANE_STATUS_JAMMED:        throw new SaneExceptionJammed();
        case SANE_STATUS_NO_DOCS:       throw new SaneExceptionFeederEmpty();
        case SANE_STATUS_COVER_OPEN:    throw new SaneExceptionCoverOpen();
        case SANE_STATUS_IO_ERROR:      throw new SaneExceptionIoError();
        case SANE_STATUS_NO_MEM:        throw new OutOfMemoryError();
        case SANE_STATUS_ACCESS_DENIED: throw new SaneExceptionAccessDenied();
    }
}

struct SaneDevice
{
    SANE_Device c;

    @property string name() const { return to!string(c.name); }
    @property string vendor() const { return to!string(c.vendor); }
    @property string model() const { return to!string(c.model); }
    @property string type() const { return to!string(c.type); }
}

static assert(SaneDevice.sizeof == SANE_Device.sizeof);

/++ Returns: The version code. +/
SANE_Int saneInit(SANE_Auth_Callback authorize)
{
    SANE_Int saneVersion;
    saneThrowOnError(sane_init(&saneVersion,authorize));
    return saneVersion;
}

alias sane_exit saneExit;

auto saneGetDevices(SANE_Bool localOnly)
{
    const(SaneDevice*)[] deviceList = null;

    const(SANE_Device**) device_list_c;
    saneThrowOnError(sane_get_devices(&device_list_c, localOnly));

    size_t device_list_size = 0;
    const(SANE_Device)* device = null;
    while ( true )
    {
        device = device_list_c[device_list_size];
        if ( device == null )
            break;
        device_list_size++;
    }
    deviceList = cast(const(SaneDevice*)[])device_list_c[0 .. device_list_size];

    return deviceList;
}

struct SaneHandle
{
    SANE_Handle c;
    alias c this;

    @property SaneOptionRange options() { return SaneOptionRange(c); }
}

SaneHandle saneOpen(string name)
{
    SaneHandle result;
    saneThrowOnError(sane_open(toStringz(name), &result.c));
    return result;
}

alias sane_close saneClose;

struct CStringRange(CStrType)
{
    private const(CStrType)[] source = null;

    @property bool empty() const { return source is null || source.length == 0; }
    void popFront() { if ( !empty ) source = source[1..$]; }
    void popBack()  { if ( !empty ) source = source[0..$-1]; }
    @property string front() const { return to!string(source[0]); }
    @property string back() const { return to!string(source[$-1]); }

    @property typeof(this) save() { return CStringRange!CStrType(source); }

    @property size_t length() const { return source.length; }

    string opIndex(size_t index) const { return to!string(source[index]); }

    static if ( isMutable!(typeof(source[0])) ) // TODO: untested. at all.
    {
        string opIndexAssign(string val, size_t index)
            { source[index] = toStringz(val); return val; }
    }

    this(const(CStrType)[] source)
    {
        this.source = source;
    }
}

static assert(isInputRange!(CStringRange!(char*)));
static assert(isForwardRange!(CStringRange!(char*)));
static assert(isBidirectionalRange!(CStringRange!(char*)));
static assert(isRandomAccessRange!(CStringRange!(char*)));
static assert(isRandomAccessRange!(CStringRange!(const char*)));
static assert(isRandomAccessRange!(CStringRange!SANE_String_Const));

enum SaneConsequences
{
    SANE_INFO_INEXACT        = sane.SANE_INFO_INEXACT,
    SANE_INFO_RELOAD_OPTIONS = sane.SANE_INFO_RELOAD_OPTIONS,
    SANE_INFO_RELOAD_PARAMS  = sane.SANE_INFO_RELOAD_PARAMS,
}

/+
string consequencesToString(SANE_Int consequences)
{
    string[] result = new string[0];
    if ( consequences & SANE_INFO_INEXACT )
        result ~= "SANE_INFO_INEXACT";
    if ( consequences & SANE_INFO_RELOAD_OPTIONS )
        result ~= "SANE_INFO_RELOAD_OPTIONS";
    if ( consequences & SANE_INFO_RELOAD_PARAMS )
        result ~= "SANE_INFO_RELOAD_PARAMS";

    if ( result.length == 0 )
        return "0";
    else
        return result.join(" | ");
}+/

string fixedToString(SANE_Fixed fpNum)
{
    return to!string(SANE_UNFIX(fpNum));
}

struct SaneOption
{
    const(SANE_Option_Descriptor*) descriptor; /// The underlying C language type.
    private SANE_Handle handle;
    private SANE_Int index;

    this( const(SANE_Option_Descriptor*) descriptor, SANE_Handle h, SANE_Int n)
    {
        this.descriptor = descriptor;
        this.handle = h;
        this.index = n;
    }

    @property string name() const { return to!string(descriptor.name); }   /// name of this option (command-line name)
    @property string title() const { return to!string(descriptor.title); } /// title of this option (single-line)
    @property string desc() const { return to!string(descriptor.desc); }   /// description of this option (multi-line)
    @property SANE_Value_Type type() const { return descriptor.type; }     /// how are values interpreted?
    @property SANE_Unit unit() const { return descriptor.unit; } /// what is the (physical) unit?
    @property SANE_Int size() const { return descriptor.size; }  ///
    @property SANE_Capability cap() const { return descriptor.cap; }    /// capabilities

    @property SANE_Constraint_Type constraintType() const { return descriptor.constraint_type; }

    @property auto constraintStringList() const
    {
        assert(constraintType == SANE_CONSTRAINT_STRING_LIST);
        size_t listLength = 0;
        SANE_String_Const str = null;
        while ( true )
        {
            str = descriptor.constraint.string_list[listLength];
            if ( str is null )
                break;
            listLength++;
        }

        return CStringRange!SANE_String_Const(descriptor.constraint.string_list[0 .. listLength]);
    }

    @property const(SANE_Word[]) constraintWordList() const
    {
        assert(constraintType == SANE_CONSTRAINT_WORD_LIST);

        // According to the spec, the first word in the word list always
        //   contains the length of the word list.
        return descriptor.constraint.word_list[1 .. descriptor.constraint.word_list[0]];
    }

    @property const(SANE_Range*) constraintRange() const
    {
        assert(constraintType == SANE_CONSTRAINT_RANGE);
        return descriptor.constraint.range;
    }

    // Intended to invalidate things based on the results of the *i parameter
    //   in the sane_control_option calls.
    // Very stub like for now.
    private void handleConsequences(SANE_Info consequences)
    {
        writefln("handleConsequences(%s): stub",sane.toString(consequences));
    }

    private void verifyGettability(SANE_Int typeToCheck)()
    {
        assert(type == typeToCheck);
        assert(~cap & SANE_CAP_INACTIVE, format("Option %s is inactive.",name));
    }

    private void verifySettability(SANE_Int typeToCheck)()
    {
        verifyGettability!typeToCheck();
    }

    private auto getter(T, SANE_Int typeToCheck)()
    {
        verifyGettability!typeToCheck();
        T result;
        saneThrowOnError(sane_control_option(
            handle, index, SANE_ACTION_GET_VALUE, &result, null));
        return result;
    }

    @property auto asBool()   { return getter!(SANE_Bool,  SANE_TYPE_BOOL)(); }
    @property auto asInt()    { return getter!(SANE_Int,   SANE_TYPE_INT)();  }
    @property auto asFixed()  { return getter!(SANE_Fixed, SANE_TYPE_FIXED)(); }

    @property auto asString()
    {
        verifyGettability!SANE_TYPE_STRING();
        char[] buf = new char[size];
        saneThrowOnError(sane_control_option(
            handle, index, SANE_ACTION_GET_VALUE, buf.ptr, null));
        return assumeUnique(buf[0..strlen(buf.ptr)]);
    }
    // It is not possible to "get" a SANE_TYPE_BUTTON
    // It is not possible to "get" a SANE_TYPE_GROUP

    private auto setter(T, SANE_Int typeToCheck)(T val)
    {
        verifySettability!typeToCheck();
        T result = val;
        SANE_Info consequences;
        saneThrowOnError(sane_control_option(
            handle, index, SANE_ACTION_SET_VALUE, &result, &consequences));
        handleConsequences(consequences);
        return result;
    }

    @property auto asBool(SANE_Bool val)   { return setter!(SANE_Bool,   SANE_TYPE_BOOL)(val); }
    @property auto asInt(SANE_Int val)     { return setter!(SANE_Int,    SANE_TYPE_INT)(val); }
    @property auto asFixed(SANE_Fixed val) { return setter!(SANE_Fixed,  SANE_TYPE_FIXED)(val); }
    @property auto asString(string val)
    {
        verifySettability!SANE_TYPE_STRING();
        // TODO: This could use optimizing.
        // Right now we create a new string do a copy because the sane_control_option
        //   function might alter the string and it does not obey copy-on-write.
        char[] mutableVal = new char[val.length+1];
        mutableVal[0..$-1] = val[];
        mutableVal[$-1] = '\0';
        SANE_Info consequences;
        saneThrowOnError(sane_control_option(
            handle, index, SANE_ACTION_SET_VALUE, mutableVal.ptr, &consequences));
        handleConsequences(consequences);
        return assumeUnique(mutableVal[0..strlen(mutableVal.ptr)]);
    }

    void pushButton()
    {
        verifySettability!SANE_TYPE_BUTTON();
        SANE_Info consequences;
        saneThrowOnError(sane_control_option(
            handle, index, SANE_ACTION_SET_VALUE, null, &consequences));
        handleConsequences(consequences);
    }

    // TODO: SANE_TYPE_GROUP interfacing?

    /+
    private string constraintToString()
    {
        final switch ( constraintType )
        {
            case SANE_CONSTRAINT_NONE: return "";
            case SANE_CONSTRAINT_STRING_LIST:
        }
    }+/

    private string stringWithConstraintToString()
    {
        if ( constraintType == SANE_CONSTRAINT_NONE )
            return asString;

        if ( constraintType == SANE_CONSTRAINT_STRING_LIST )
        {
            string result = "";
            string selected = asString;
            foreach ( possibility; constraintStringList )
            {
                if ( selected == possibility )
                    result ~= "[" ~ selected ~ "],";
                else
                    result ~= possibility~",";
            }

            if ( result.length < 1 )
                return "["~selected~"]?";
            else
                return result[0..$-1];
        }

        assert(0);
    }

    string toString()
    {
        if ( cap & SANE_CAP_INACTIVE )
            return "INACTIVE";

        final switch(type)
        {
            case SANE_TYPE_BOOL:   return to!string(asBool);
            case SANE_TYPE_INT:    return to!string(asInt);
            case SANE_TYPE_FIXED:  return fixedToString(asFixed);
            case SANE_TYPE_STRING: return stringWithConstraintToString();
            case SANE_TYPE_BUTTON: return "BUTTON";
            case SANE_TYPE_GROUP:  return "GROUP";
        }
        return null;
    }
}

/+
struct SaneOptionRange
{

}
+/

private SaneOption getOption(SANE_Handle h, SANE_Int index)
{
    auto cStyleOptionDesc = sane_get_option_descriptor(h, index);
    assert(cStyleOptionDesc !is null);
    return SaneOption(cStyleOptionDesc, h, index);
}

struct SaneOptionRange
{
    private SANE_Handle handle = null;
    private SANE_Int nOptions = 0;
    private SANE_Int frontIndex = 0;
    private SANE_Int backIndex = 0;

    @property nothrow bool empty() const { return handle is null || frontIndex > backIndex; }

    void popFront() { if ( !empty ) frontIndex++; }
    void popBack()  { if ( !empty ) backIndex--; }

    @property SaneOption front()
        { assert(!empty); return getOption(handle, frontIndex); }

    @property SaneOption back()
        { assert(!empty); return getOption(handle, backIndex); }

    @property auto save()
    {
        typeof(this) result;
        result.handle = this.handle;
        result.nOptions = this.nOptions;
        result.frontIndex = this.frontIndex;
        result.backIndex = this.backIndex;
        return result;
    }

    @property SANE_Int length() const { return (backIndex - frontIndex)+1; }

    SaneOption opIndex(SANE_Int relativeOptionNumber)
        { return getOption(handle, relativeOptionNumber + frontIndex); }

    this(SANE_Handle h)
    {
        assert(h !is null);
        this.handle = h;
        //auto opt = getOption(handle, 0);
        SANE_Info successfulness;
        saneThrowOnError(sane_control_option(h,0,
            SANE_ACTION_GET_VALUE, &nOptions, &successfulness));
        // TODO: don't ignore successfulness
        frontIndex = 1;
        backIndex = nOptions-1;
    }
}

static assert(isRandomAccessRange!(SaneOptionRange));
