function tag = startasynccallimpl(session, service, method, request, timeout)
library = libraryname();
func = 'GrpcJsonClient_StartAsyncCall';
unlocker = lock(session);
[errorCode, ~, ~, ~, tag] = calllib(library, func, session, service, method, request, timeout, 0);
checkerror(session, errorCode);
end  % function startasynccallimpl
