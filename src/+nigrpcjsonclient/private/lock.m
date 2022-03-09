function unlocker = lock(session)
locksessionimpl(session, -1);
unlocker = onCleanup(@() unlocksessionimpl(session));
end  % function lock
