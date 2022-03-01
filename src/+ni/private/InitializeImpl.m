function session = InitializeImpl(target)
library = LibraryName();
func = 'GrpcJsonClient_Initialize';
[errorCode, ~, session] = calllib(library, func, target, []);
CheckError(session, errorCode);
end  % function InitializeImpl
