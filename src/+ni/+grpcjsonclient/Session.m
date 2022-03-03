classdef Session < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = 'private')
        session
    end

    methods
        function obj = Session(target)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            loadgrpcjsonclientlibrary();
            obj.session = initializeimpl(target);
        end

        function queryreflectionservice(obj)
            queryreflectionserviceimpl(obj.session);
        end

        function tag = startasynccall(obj, service, method, request)
            tag = startasynccallimpl(obj.session, service, method, request);
        end

        function response = finishasynccall(obj, tag, timeout)
            response = finishasynccallimpl(obj.session, tag, timeout);
        end

        function response = blockingcall(obj, service, method, request, timeout)
            response = blockingcallimpl(obj.session, service, method, request, timeout);
        end

        function locksession(obj)
            locksessionimpl(obj.session);
        end

        function unlocksession(obj)
            unlocksessionimpl(obj.session);
        end

        function delete(obj)
            closeimpl(obj.session);
        end
    end
end
