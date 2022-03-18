function initialize(obj, target)
func = 'GrpcJsonClient_Initialize';
[errorCode, ~, obj.session] = calllib(obj.library, func, target, 0);
obj.checkerror(errorCode);
end  % function initializeimpl
