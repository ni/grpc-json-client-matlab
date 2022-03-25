function response = blockingcall(obj, service, method, request, timeout)
%BLOCKINGCALL Performs a blocking unary unary RPC call.
%   This method is equivalent to calling startasynccall followed by finishasynccall but with a
%   global timeout.
%
%   See also startasynccall, finishasynccall
func = 'GrpcJsonClient_BlockingCall';
[errorCode, ~, ~, ~, tag, ~, size] = calllib( ...
    obj.LIBRARY, func, obj.session, service, method, request, timeout, 0, [], 0);
obj.checkerror(errorCode);
response = blanks(size);
[errorCode, ~, ~, ~, ~, response] = calllib( ...
    obj.LIBRARY, func, obj.session, [], [], [], 0, tag, response, size);
obj.checkerror(errorCode);
end  % function blockingcall
