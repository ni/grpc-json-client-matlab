function message = geterrorstring(obj, code)
%GETERRORSTRING Gets the corresponding generic error message for the specified error code.
%   geterror should generally be preferred over this function since it provides context specific
%   error messages.
func = 'GrpcJsonClient_GetErrorString';
[errorCode, ~, size] = calllib(obj.LIBRARY, func, obj.session, code, [], 0);
obj.checkerror(errorCode);
message = blanks(size);
[errorCode, message] = calllib(obj.LIBRARY, func, obj.session, code, message, size);
obj.checkerror(errorCode);
end  % function geterrorstring
