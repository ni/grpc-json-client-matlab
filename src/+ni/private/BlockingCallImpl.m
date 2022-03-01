function response = BlockingCallImpl(session, service, method, request, timeout)
library = LibraryName();
func = 'GrpcJsonClient_BlockingCall';
lock = Lock(session);
[errorCode, ~, ~, ~, ~, tag, ~, size] = calllib(library, func, session, service, method, request, [], timeout, [], 0);
CheckError(session, errorCode);
response = blanks(size);
[errorCode, ~, ~, ~, ~, ~, response] = calllib(library, func, session, [], [], [], tag, timeout, response, size);
CheckError(session, errorCode);
end  % function BlockingCallImpl
