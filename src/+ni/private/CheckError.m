function CheckError(session, code)
if code == 0
    return
end
if session.isNull()
    message = GetErrorStringImpl(session, code);
else
    [code, message] = GetErrorImpl(session);
end
if code < 0
    error(message);
elseif code > 0
    warning(message);
end
end  % function CheckError
