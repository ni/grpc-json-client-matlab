function checkerror(session, code)
if code == 0
    return
end
if session.isNull()
    message = geterrorstringimpl(session, code);
else
    [code, message] = geterrorimpl(session);
end
if code < 0
    error(message);
elseif code > 0
    warning(message);
end
end  % function checkerror
