function [code, message] = geterrorimpl(session)
library = libraryname();
func = 'GrpcJsonClient_GetError';
unlocker = lock(session);
[errorCode, ~, ~, ~, size] = calllib(library, func, session, 0, [], 0);
checkerror(session, errorCode);
message = blanks(size);
[errorCode, ~, code, message] = calllib(library, func, session, 0, message, size);
checkerror(session, errorCode);
end  % function geterrorimpl
