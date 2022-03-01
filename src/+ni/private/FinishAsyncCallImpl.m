function response = FinishAsyncCallImpl(session, tag, timeout)
library = LibraryName();
func = 'GrpcJsonClient_FinishAsyncCall';
lock = Lock(session);
[errorCode, ~, ~, ~, size] = calllib(library, func, session, tag, timeout, [], 0);
CheckError(session, errorCode);
response = blanks(size);
[errorCode, ~, ~, response] = calllib(library, func, session, tag, timeout, response, size);
CheckError(session, errorCode);
end  % function FinishAsyncCallImpl
