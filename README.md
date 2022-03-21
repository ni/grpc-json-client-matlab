# gRPC JSON Client for MATLAB

MATLAB implementation of the [gRPC JSON Client](https://github.com/ni/grpc-json-client) API.

## Installation

Visit the [releases](https://github.com/ni/grpc-json-client-matlab/releases) page to download the
latest MATLAB Toolbox (.mltbx).

The Toolbox will automatically download and install the latest
[gRPC JSON Client](https://github.com/ni/grpc-json-client) release binaries.

## Restrictions

- Currently only unary gRPC calls are supported
- The target server must have reflection enabled for the desired services

## Usage

The
[greeter_server_with_reflection.py](https://github.com/grpc/grpc/blob/master/examples/python/helloworld/greeter_server_with_reflection.py)
example was used as the server in the following code snippets.

### Opening a Session

The Toolbox installs the `nigrpcjsonclient` package into the MATLAB path. Create a new client
session via the `Session` class.

```MATLAB
>> client = nigrpcjsonclient.Session('localhost:50051');
```

### Blocking Calls

Blocking calls return when the RPC completes or a timeout is reached, whichever comes first.

```MATLAB
>> response = client.blockingcall('helloworld.Greeter', 'SayHello', '{"name":"MATLAB"}', 100)

response =

    '{"message":"Hello, MATLAB!"}'
```

### Asynchronous Calls

Asynchronous calls are started with a call to `startasynccall` and finished with a call to
`finishasynccall`. `startasynccall` returns a tag that is used by the library to uniquely identify
the RPC.

```MATLAB
>> tag = client.startasynccall('helloworld.Greeter', 'SayHello', '{"name":"MATLAB"}', -1);
>> response = client.finishasynccall(tag, 100)

response =

    '{"message":"Hello, MATLAB!"}'
```

A tag is no longer valid after the call has finished but may reused by a subsequent call to
`startasynccall`.

### Timeouts

Timeout values are expressed in milliseconds. To specify an indefinite timeout, pass a negative
number as the timeout argument (by convention `-1` is used).

### Locking Sessions
In advanced situations where parallel worker threads are used, it may be desireable to obtain
exclusive access to a session. Doing so can prevent race conditions in cached variables (such as
error codes and error messages) in the the core library. To lock and unlock sessions in a thread,
call the `locksession` and `unlocksession` methods respectively.

```MATLAB
>> hasLock = client.locksession(-1);
>> % do some work...
>> client.unlocksession();
```

Note that exclusive access to a session does not imply exclusive access to a service.

***Tip:*** To prevent deadlock that can occur by failing to unlock a session after an error occurs,
it is typically a good idea to create a
[cleanup object](https://www.mathworks.com/help/matlab/ref/oncleanup.html) then clear it when
necessary.

### Constructing Requests

When constructing a JSON request string, an omitted field is set to the default value for that
field's type. See the
[Default Values](https://developers.google.com/protocol-buffers/docs/proto3#default) section of the
Protocol Buffers Language Guide for information on the default value for each type.

To automate creating requests, use the `getdefaultrequest` utility method:

```MATLAB
>> request = client.getdefaultrequest('helloworld.Greeter', 'SayHello', -1)

request =

    '{"name":""}'
```

Some fields (like Oneof) default to "not set" and therefore aren't emitted in the return value. See
[JSON Mapping](https://developers.google.com/protocol-buffers/docs/proto3#json) for more
information.

### Closing Sessions

The `nigrpcjsonclient.Session` class subclasses the
[handle class](https://www.mathworks.com/help/matlab/ref/handle-class.html). The session will
automatically close when all references to the object are cleared. To explicitely close the
session, clear the object from the workspace.
```MATLAB
>> clear client
```
