function hasLock = unlocksession(obj, hasLock)
%UNLOCKSESSION Unlocks the session.
%   The hasLock argument is optional (default true) and specifies whether the caller currently owns
%   the lock. Omit the argument or pass true to release the lock. This method always returns false.
%
%   See also locksession
func = 'GrpcJsonClient_UnlockSession';
if exist('hasLock', 'var')
    hasLockOption = logical(hasLock);
else
    hasLockOption = true;
end
[errorCode, hasLock] = calllib(obj.LIBRARY, func, obj.session, hasLockOption);
obj.checkerror(errorCode);
hasLock = logical(hasLock);
end  % function unlocksession
