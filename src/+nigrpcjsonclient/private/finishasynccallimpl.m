function response = finishasynccallimpl(session, tag, timeout)
library = libraryname();
func = 'GrpcJsonClient_FinishAsyncCall';
unlocker = lock(session);
[errorCode, ~, size] = calllib(library, func, session, tag, timeout, [], 0);
checkerror(session, errorCode);
response = blanks(size);
[errorCode, response] = calllib(library, func, session, tag, timeout, response, size);
checkerror(session, errorCode);
end  % function finishasynccallimpl
