function [code, message] = geterror(obj)
%GETERROR Gets and clears error information from the session.
%   Sessions store the most recent error or warning that occurs.
%
%   See also geterrorstring
func = 'GrpcJsonClient_GetError';
unlocker = obj.lock();
[errorCode, ~, ~, size] = calllib(obj.LIBRARY, func, obj.session, 0, [], 0);
obj.checkerror(errorCode);
message = blanks(size);
[errorCode, code, message] = calllib(obj.LIBRARY, func, obj.session, 0, message, size);
obj.checkerror(errorCode);
end  % function geterror
