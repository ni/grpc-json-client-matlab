function tag = startasynccall(obj, service, method, request, timeout)
%STARTASYNCCALL Starts an asynchronous call to a unary unary RPC.
%   The service argument must be the fully-qualified service name, for example:
%   'package.subpackage.service'. The timeout argument specifies the maximum time allowed for the
%   host to finish the call and return a response. The returned tag is a unique identifier that
%   should be passed to finishasynccall to complete the call.
%
%   See also finishasynccall
func = 'GrpcJsonClient_StartAsyncCall';
[errorCode, ~, ~, ~, tag] = calllib(...
    obj.LIBRARY, func, obj.session, service, method, request, timeout, 0);
obj.checkerror(errorCode);
end  % function startasynccall
