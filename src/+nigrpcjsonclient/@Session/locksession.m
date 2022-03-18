function hasLock = locksession(obj, timeout)
%LOCKSESSION Locks the session for exclusive use by the calling thread.
%   Use this function to prevent other threads from accessing the session simultaneously,
%   potentially causing race conditions. Threads that do not own the session will block until the
%   specified timeout is reached. Returns true if the thread successfully acquires the lock;
%   otherwise false. The lock is recursive.
%
%   See also unlocksession
func = 'GrpcJsonClient_LockSession';
[errorCode, hasLock] = calllib(obj.library, func, obj.session, timeout, 0);
obj.checkerror(errorCode);
hasLock = logical(hasLock);
end  % function locksession
