function response = blockingcallimpl(session, service, method, request, timeout)
library = libraryname();
func = 'GrpcJsonClient_BlockingCall';
unlocker = lock(session);
[errorCode, ~, ~, ~, tag, ~, size] = calllib(...
    library, func, session, service, method, request, timeout, 0, [], 0);
checkerror(session, errorCode);
response = blanks(size);
[errorCode, ~, ~, ~, ~, response] = calllib(...
    library, func, session, [], [], [], 0, tag, response, size);
checkerror(session, errorCode);
end  % function blockingcallimpl
