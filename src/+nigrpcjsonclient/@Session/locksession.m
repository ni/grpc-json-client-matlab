function hasLock = locksession(obj, timeout, hasLock)
%LOCKSESSION Locks the session for exclusive use by the caller.
%   Use this method to prevent multiple threads from accessing the session simultaneously,
%   potentially causing race conditions. The hasLock argument is optional (default false) and
%   specifies whether the caller currently owns the lock. Omit the argument or pass false to try
%   acquiring the lock. This method returns true if the lock is successfully acquired; otherwise
%   false. Callers that do not own the lock will block until the specified timeout is reached.
%
%   See also unlocksession
func = 'GrpcJsonClient_LockSession';
if exist('hasLock', 'var')
    hasLockOption = logical(hasLock);
else
    hasLockOption = false;
end
[errorCode, hasLock] = calllib(obj.LIBRARY, func, obj.session, timeout, hasLockOption);
obj.checkerror(errorCode);
hasLock = logical(hasLock);
end  % function locksession
