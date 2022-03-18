function close(obj)
%CLOSE Releases resources allocated by the session.
%   Any active RPCs are implicitly cancelled.
func = 'GrpcJsonClient_Close';
errorCode = calllib(obj.library, func, obj.session);
obj.checkerror(errorCode);
obj.session = 0;
end  % function close
