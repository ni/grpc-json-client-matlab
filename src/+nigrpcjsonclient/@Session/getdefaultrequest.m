function request = getdefaultrequest(obj, service, method, timeout)
%GETDEFAULTREQUEST Returns the default request string for the specified method.
%   Some gRPC fields (such as oneof) default to an empty value and are thus unpopulated.
func = 'GrpcJsonClient_GetDefaultRequest';
[errorCode, ~, ~, ~, size] = calllib( ...
    obj.LIBRARY, func, obj.session, service, method, timeout, [], 0);
obj.checkerror(errorCode);
request = blanks(size);
[errorCode, ~, ~, request] = calllib( ...
    obj.LIBRARY, func, obj.session, service, method, 0, request, size);
obj.checkerror(errorCode);
end  % function getdefaultrequest
