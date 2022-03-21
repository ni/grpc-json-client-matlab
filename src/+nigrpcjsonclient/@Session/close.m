function close(obj)
%CLOSE Releases resources allocated by the session.
%   Any active RPCs are implicitly cancelled.
func = 'GrpcJsonClient_Close';
errorCode = calllib(obj.LIBRARY, func, obj.session);
obj.checkerror(errorCode);
obj.session = 0;  % set session handle back to null in case user manually called delete()
end  % function close
