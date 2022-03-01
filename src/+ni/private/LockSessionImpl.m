function session = LockSessionImpl(session)
library = LibraryName();
func = 'GrpcJsonClient_LockSession';
errorCode = calllib(library, func, session);
CheckError(session, errorCode);
end  % function LockSessionImpl
