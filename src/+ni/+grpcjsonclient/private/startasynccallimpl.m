function tag = startasynccallimpl(session, service, method, request)
library = libraryname();
func = 'GrpcJsonClient_StartAsyncCall';
unlocker = lock(session);
[errorCode, ~, ~, ~, ~, tag] = callllib(library, func, session, service, method, request, []);
checkerror(session, errorCode);
end  % function startasynccallimpl
