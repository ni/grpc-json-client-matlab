function unlocker = lock(obj)
%LOCK Locks the session and returns an onCleanup object that unlocks the session when the object
%goes out of scope.
%
%   See also onCleanup 
obj.locksession(-1);
unlocker = onCleanup(@() obj.unlocksession());
end  % function lock
