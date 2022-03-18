function [code, message] = geterror(obj)
func = 'GrpcJsonClient_GetError';
unlocker = obj.lock();
[errorCode, ~, ~, size] = calllib(obj.library, func, obj.session, 0, [], 0);
obj.checkerror(errorCode);
message = blanks(size);
[errorCode, code, message] = calllib(obj.library, func, obj.session, 0, message, size);
obj.checkerror(errorCode);
end  % function geterrorimpl
