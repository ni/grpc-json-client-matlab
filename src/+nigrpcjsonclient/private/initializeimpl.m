function session = initializeimpl(target)
library = libraryname();
func = 'GrpcJsonClient_Initialize';
[errorCode, ~, session] = calllib(library, func, target, 0);
checkerror(session, errorCode);
end  % function initializeimpl
