function lock = Lock(session)
LockSessionImpl(session);
lock = onCleanup(@() UnlockSessionImpl(session));
end  % function Lock
