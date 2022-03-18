function unlocker = lock(obj)
obj.locksession(-1);
unlocker = onCleanup(@() obj.unlocksession());
end  % function lock
