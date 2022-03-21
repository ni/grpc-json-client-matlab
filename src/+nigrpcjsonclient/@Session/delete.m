function delete(obj)
%DELETE Releases resources allocated by the session.
%   Any active RPCs are implicitly cancelled.
obj.close();
end  % function delete
