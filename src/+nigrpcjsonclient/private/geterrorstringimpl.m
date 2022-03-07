function message = geterrorstringimpl(session, code)
library = libraryname();
func = 'GrpcJsonClient_GetErrorString';
[errorCode, ~, ~, size] = calllib(library, func, session, code, [], 0);
checkerror(session, errorCode);
message = blanks(size);
[errorCode, ~, message] = calllib(library, func, session, code, message, size);
checkerror(session, errorCode);
end  % function geterrorstringimpl
