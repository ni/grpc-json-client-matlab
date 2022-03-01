function message = GetErrorStringImpl(session, code)
library = LibraryName();
func = 'GrpcJsonClient_GetErrorString';
[errorCode, ~, ~, size] = calllib(library, func, session, code, [], 0);
CheckError(session, errorCode);
message = blanks(size);
[errorCode, ~, message] = calllib(library, func, session, code, message, size);
CheckError(session, errorCode);
end  % function GetErrorStringImpl
