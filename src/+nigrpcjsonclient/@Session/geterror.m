function [code, message] = geterror(obj)
func = 'GrpcJsonClient_GetError';
unlocker = obj.lock();
[errorCode, ~, ~, size] = calllib(obj.LIBRARY, func, obj.session, 0, [], 0);
obj.checkerror(errorCode);
message = blanks(size);
[errorCode, code, message] = calllib(obj.LIBRARY, func, obj.session, 0, message, size);
obj.checkerror(errorCode);
end  % function geterror
