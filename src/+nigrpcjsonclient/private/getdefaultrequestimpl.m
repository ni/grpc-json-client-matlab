function request = getdefaultrequestimpl(session, service, method, timeout)
library = libraryname();
func = 'GrpcJsonClient_GetDefaultRequest';
unlocker = lock(session);
[errorCode, ~, ~, ~, size] = calllib(library, func, session, service, method, timeout, [], 0);
checkerror(session, errorCode);
request = blanks(size);
[errorCode, ~, ~, request] = calllib(library, func, session, service, method, 0, request, size);
checkerror(session, errorCode);
end
