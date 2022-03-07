function resetdescriptordatabaseimpl(session)
library = libraryname();
func = 'GrpcJsonClient_ResetDescriptorDatabase';
unlocker = lock(session);
errorCode = calllib(library, func, session);
checkerror(session, errorCode);
end  % function resetdescriptordatabaseimpl
