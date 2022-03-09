function hasLock = locksessionimpl(session, timeout)
library = libraryname();
func = 'GrpcJsonClient_LockSession';
[errorCode, hasLock] = calllib(library, func, session, timeout, 0);
checkerror(session, errorCode);
hasLock = logical(hasLock);
end  % function locksessionimpl
