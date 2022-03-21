function initialize(obj, target)
%INITIALIZE Initializes a session to the target with an insecure channel.
%   The target is typically the URI of the host. For example: "localhost:50051' or 
%   'server.domain.com:50051'.
func = 'GrpcJsonClient_Initialize';
[errorCode, ~, obj.session] = calllib(obj.LIBRARY, func, target, 0);
obj.checkerror(errorCode);
end  % function initialize
