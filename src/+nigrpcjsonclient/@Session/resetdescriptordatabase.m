function resetdescriptordatabase(obj)
%RESETDESCRIPTORDATABASE Resets the descriptor database to it's default state.
%   Use this method to force the session to request new file descriptors for services.
func = 'GrpcJsonClient_ResetDescriptorDatabase';
errorCode = calllib(obj.LIBRARY, func, obj.session);
obj.checkerror(errorCode);
end  % function resetdescriptordatabase
