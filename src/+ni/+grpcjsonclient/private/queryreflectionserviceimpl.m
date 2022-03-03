function queryreflectionserviceimpl(session)
library = libraryname();
func = 'GrpcJsonClient_QueryReflectionService';
unlocker = lock(session);
errorCode = calllib(library, func, session);
checkerror(session, errorCode);
end  % function queryreflectionserviceimpl
