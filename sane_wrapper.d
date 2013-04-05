
/++
Convenience wrapper for SANE API functions.

These allow the SANE API to be used in a manner that is more nature to D by
providing things likes exception handling, ranges, and length-delimited strings.
+/
module sane_wrapper;

import sane;
import std.conv;
import std.c.string;
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
    const(SANE_Device)* device = device_list_c[device_list_size];
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