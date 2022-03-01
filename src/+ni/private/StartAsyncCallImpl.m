function tag = StartAsyncCallImpl(session, service, method, request)
library = LibraryName();
func = 'GrpcJsonClient_StartAsyncCall';
lock = Lock(session);
[errorCode, ~, ~, ~, ~, tag] = callllib(library, func, session, service, method, request, []);
CheckError(session, errorCode);
end  % function StartAsyncCallImpl
