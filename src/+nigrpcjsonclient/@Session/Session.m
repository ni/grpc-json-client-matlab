classdef Session < handle
    %SESSION A session to a gRPC service via a JSON-based client.
    %   This class is an extension of the gRPC JSON Core Library project located at 
    %   https://github.com/ni/grpc-json-client. Visit the project page at
    %   https://github.com/ni/grpc-json-client-matlab for additional resources and documentation.
    %
    %SESSION Methods:
    %   RESETDESCRIPTORDATABASE - Resets the descriptor database to it's default state.
    %   FILLDESCRIPTORDATABASE - Queries the host for the file descriptors of all services 
    %   exposed by the reflection service.
    %   STARTASYNCCALL - Starts an asynchronous call to a unary unary RPC.
    %   FINISHASYNCCALL - Finishes an asynchronous call started by startasynccall.
    %   BLOCKINGCALL - Performs a blocking unary unary RPC call.
    %   LOCKSESSION - Locks the session for exclusive use by the caller.
    %   UNLOCKSESSION - Unlocks the session.
    %   GETDEFAULTREQUEST - Returns the default request string for the specified method.
    
    properties (Access = private, Constant)
        LIBRARY = nigrpcjsonclient.Session.loadlibrary()
    end

    properties (Access = private)
        session  % the unique session handle for this object
    end

    methods (Access = public)
        function obj = Session(target)
            %SESSION Initializes a session to the target with an insecure channel.
            %   The target is typically the URI of the host. For example: "localhost:50051' or 
            %   'server.domain.com:50051'.
            obj.initialize(target);
        end

        resetdescriptordatabase(obj)
        filldescriptordatabase(obj, timeout)
        tag = startasynccall(obj, service, method, request, timeout)
        response = finishasynccall(obj, tag, timeout)
        response = blockingcall(obj, service, method, request, timeout)
        hasLock = locksession(obj, timeout, hasLock)
        hasLock = unlocksession(obj, hasLock)
        request = getdefaultrequest(obj, service, method, timeout)
        delete(obj)
    end

    methods (Access = private)
        initialize(obj, target)
        unlocker = lock(obj)
        checkerror(obj, code)
        [code, message] = geterror(obj)
        message = geterrorstring(obj, code)
        close(obj)
    end

    methods (Access = private, Static)
        name = loadlibrary()
    end
end
