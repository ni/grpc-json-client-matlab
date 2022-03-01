function CloseImpl(session)
library = LibraryName();
func = 'GrpcJsonClient_Close';
errorCode = calllib(library, func, session);
CheckError(session, errorCode);
end  % function CloseImpl
