function session = locksessionimpl(session)
library = libraryname();
func = 'GrpcJsonClient_LockSession';
errorCode = calllib(library, func, session);
checkerror(session, errorCode);
end  % function locksessionimpl
