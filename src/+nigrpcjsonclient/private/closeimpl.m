function closeimpl(session)
library = libraryname();
func = 'GrpcJsonClient_Close';
errorCode = calllib(library, func, session);
checkerror(session, errorCode);
end  % function closeimpl
