function session = UnlockSessionImpl(session)
library = LibraryName();
func = 'GrpcJsonClient_UnlockSession';
errorCode = calllib(library, func, session);
CheckError(session, errorCode);
end  % function UnlockSessionImpl
