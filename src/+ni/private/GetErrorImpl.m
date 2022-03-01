function [code, message] = GetErrorImpl(session)
library = LibraryName();
func = 'GrpcJsonClient_GetError';
lock = Lock(session);
[errorCode, ~, ~, ~, size] = calllib(library, func, session, 0, [], 0);
CheckError(session, errorCode);
message = blanks(size);
[errorCode, ~, code, message] = calllib(library, func, session, 0, message, size);
CheckError(session, errorCode);
end  % function GetErrorImpl
