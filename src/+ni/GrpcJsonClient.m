classdef GrpcJsonClient < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = 'private')
        session
    end

    methods
        function obj = GrpcJsonClient(target)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            LoadLibrary();
            obj.session = InitializeImpl(target);
        end

        function QueryReflectionService(obj)
            QueryReflectionServiceImpl(obj.session);
        end

        function tag = StartAsyncCall(obj, service, method, request)
            tag = StartAsyncCallImpl(obj.session, service, method, request);
        end

        function response = FinishAsyncCall(obj, tag, timeout)
            response = FinishAsyncCallImpl(obj.session, tag, timeout);
        end

        function response = BlockingCall(obj, service, method, request, timeout)
            response = BlockingCallImpl(obj.session, service, method, request, timeout);
        end

        function LockSession(obj)
            LockSessionImpl(obj.session);
        end

        function UnlockSession(obj)
            UnlockSessionImpl(obj.session);
        end

        function delete(obj)
            CloseImpl(obj.session);
        end
    end
end
