function checkerror(obj, code)
%CHECKERROR Delegates error handling to geterror or geterrorstring.
if ~code  % return early if zero
    return
end
if obj.session
    [code, message] = obj.geterror();
else
    % geterrorstring supports null sessions
    message = geterrorstring(obj.session, code);
end
errId = ['nigrpcjsonclient:' char(errorcode(code))];
if code < 0
    error(errId, message);
elseif code > 0
    warning(errId, message);
end
end  % function checkerror
