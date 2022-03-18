function resetdescriptordatabase(obj)
%RESETDESCRIPTORDATABASE Resets the descriptor database to it's default state.
%   Use this function to force the session to request new file descriptors for services.
func = 'GrpcJsonClient_ResetDescriptorDatabase';
unlocker = obj.lock();
errorCode = calllib(obj.library, func, obj.session);
obj.checkerror(errorCode);
end  % function resetdescriptordatabase
