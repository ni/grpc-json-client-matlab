function unlocksession(obj)
%UNLOCKSESSION Unlocks the session.
%   Call this method the same number of times as locksession to prevent deadlock.
%
%   See also locksession
func = 'GrpcJsonClient_UnlockSession';
errorCode = calllib(obj.LIBRARY, func, obj.session);
obj.checkerror(errorCode);
end  % function unlocksession
