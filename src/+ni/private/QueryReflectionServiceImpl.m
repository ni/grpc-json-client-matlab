function QueryReflectionServiceImpl(session)
library = LibraryName();
func = 'GrpcJsonClient_QueryReflectionService';
lock = Lock(session);
errorCode = calllib(library, func, session);
CheckError(session, errorCode);
end  % function QueryReflectionServiceImpl
