function filldescriptordatabase(obj, timeout)
%FILLDESCRIPTORDATABASE Queries the host for the file descriptors of all services exposed by the
%reflection service.
func = 'GrpcJsonClient_FillDescriptorDatabase';
errorCode = calllib(obj.LIBRARY, func, obj.session, timeout);
obj.checkerror(errorCode);
end  % function filldescriptordatabase
