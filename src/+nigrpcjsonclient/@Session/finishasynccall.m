function response = finishasynccall(obj, tag, timeout)
%FINISHASYNCCALL Finishes an asynchronous call started by startasynccall.
%   If the client hasn't received a response before the timeout specified in startasynccall expires,
%   this method may block for the remaining time. The timeout argument specifies the maximum time
%   this method waits for the the call to complete.
%
%   See also startasynccall
func = 'GrpcJsonClient_FinishAsyncCall';
[errorCode, ~, size] = calllib(obj.LIBRARY, func, obj.session, tag, timeout, [], 0);
obj.checkerror(errorCode);
response = blanks(size);
[errorCode, response] = calllib(obj.LIBRARY, func, obj.session, tag, 0, response, size);
obj.checkerror(errorCode);
end  % function finishasynccall
