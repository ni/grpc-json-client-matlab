function unlocker = lock(session)
locksessionimpl(session);
unlocker = onCleanup(@() unlocksessionimpl(session));
end  % function lock
