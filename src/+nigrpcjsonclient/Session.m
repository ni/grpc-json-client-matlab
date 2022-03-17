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
    %   LOCKSESSION - Locks the session for exclusive use by the calling thread.
    %   UNLOCKSESSION - Unlocks the session.
    
    properties (Access = 'private')
        session
    end

    methods
        function obj = Session(target)
            %SESSION Initializes a session to the target with an insecure channel.
            %   The target is typically the URI of the host. For example: "localhost:50051' or 
            %   'server.domain.com:50051'.
            loadgrpcjsonclientlibrary();
            obj.session = initializeimpl(target);
        end

        function resetdescriptordatabase(obj)
            %RESETDESCRIPTORDATABASE Resets the descriptor database to it's default state.
            %   Use this function to force the session to request new file descriptors for services.
            resetdescriptordatabaseimpl(obj.session);
        end

        function filldescriptordatabase(obj, timeout)
            %FILLDESCRIPTORDATABASE Queries the host for the file descriptors of all services
            %exposed by the reflection service.
            filldescriptordatabaseimpl(obj.session, timeout);
        end

        function tag = startasynccall(obj, service, method, request, timeout)
            %STARTASYNCCALL Starts an asynchronous call to a unary unary RPC.
            %   The returned tag is a unique identifier that should be passed to finishasynccall to
            %   complete the call. The service argument must be the fully-qualified service name,
            %   for example: "package.subpackage.service".
            %
            %   See also finishasynccall
            tag = startasynccallimpl(obj.session, service, method, request, timeout);
        end

        function response = finishasynccall(obj, tag, timeout)
            %FINISHASYNCCALL Finishes an asynchronous call started by startasynccall.
            %
            %   See also startasynccall
            response = finishasynccallimpl(obj.session, tag, timeout);
        end

        function response = blockingcall(obj, service, method, request, timeout)
            %BLOCKINGCALL Performs a blocking unary unary RPC call.
            %   This function is equivalent to calling startasynccall followed by finishasynccall
            %   but with a global timeout.
            %
            %   See also startasynccall, finishasynccall
            response = blockingcallimpl(obj.session, service, method, request, timeout);
        end

        function hasLock = locksession(obj, timeout)
            %LOCKSESSION Locks the session for exclusive use by the calling thread.
            %   Use this function to prevent other threads from accessing the session
            %   simultaneously, potentially causing race conditions. Threads that do not own the
            %   session will block until the specified timeout is reached. Returns true if the
            %   thread successfully acquires the lock; otherwise false. The lock is recursive.
            %
            %   See also unlocksession
            hasLock = locksessionimpl(obj.session, timeout);
        end

        function unlocksession(obj)
            %UNLOCKSESSION Unlocks the session.
            %   Call this method the same number of times as locksession to prevent deadlock.
            %
            %   See also locksession
            unlocksessionimpl(obj.session);
        end

        function request = getdefaultrequest(obj, service, method, timeout)
            %GETDEFAULTREQUEST Returns the default request string for the specified method.
            %   Some gRPC fields (such as oneof) default to an empty value and are thus unpopulated.
            request = getdefaultrequestimpl(obj.session, service, method, timeout);
        end

        function delete(obj)
            closeimpl(obj.session);
        end
    end
end
