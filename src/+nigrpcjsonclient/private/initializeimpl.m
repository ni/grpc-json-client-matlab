function session = initializeimpl(target)
library = libraryname();
func = 'GrpcJsonClient_Initialize';
[errorCode, ~, session] = calllib(library, func, target, []);
checkerror(session, errorCode);
end  % function initializeimpl
