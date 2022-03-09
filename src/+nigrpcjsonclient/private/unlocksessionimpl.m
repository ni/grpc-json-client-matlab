function unlocksessionimpl(session)
library = libraryname();
func = 'GrpcJsonClient_UnlockSession';
errorCode = calllib(library, func, session);
checkerror(session, errorCode);
end  % function unlocksessionimpl
