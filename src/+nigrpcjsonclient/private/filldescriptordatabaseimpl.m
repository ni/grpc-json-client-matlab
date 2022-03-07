function filldescriptordatabaseimpl(session, timeout)
library = libraryname();
func = 'GrpcJsonClient_FillDescriptorDatabase';
unlocker = lock(session);
errorCode = calllib(library, func, session, timeout);
checkerror(session, errorCode);
end  % function filldescriptordatabaseimpl
