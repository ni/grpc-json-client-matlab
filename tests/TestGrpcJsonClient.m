classdef TestGrpcJsonClient < matlab.unittest.TestCase

    properties(Constant)
        service = 'ni.grpc_json_client.TestingService';
        echo = 'UnaryUnaryEcho';
    end

    properties(Access = private)
        client
    end

    methods(TestMethodSetup)
        % Setup for each test
        function initializeClient(testCase)
            testCase.client = nigrpcjsonclient.Session('localhost:50051');
        end
    end

    methods(Test)
        % Test methods
        function resetDescriptorDatabaseSucceeds(testCase)
            testCase.client.resetdescriptordatabase();
        end

        function fillDescriptorDatabaseSucceeds(testCase)
            testCase.client.filldescriptordatabase(-1)
        end

        function asyncCallSucceeds(testCase)
            request = jsonencode(struct('delay', 0, 'string_field', 'Hello World!'));
            tag = testCase.client.startasynccall(testCase.service, testCase.echo, request, -1);
            response = testCase.client.finishasynccall(tag, -1);
            testCase.verifyEqual(response, request);
        end

        function blockingCallSucceeds(testCase)
            request = jsonencode(struct('delay', 0, 'string_field', 'Hello World!'));
            response = testCase.client.blockingcall(testCase.service, testCase.echo, request, -1);
            testCase.verifyEqual(response, request);
        end

        function lockAndUnlockSessionWithoutHasLockSucceeds(testCase)
            testCase.client.locksession(-1);
            testCase.client.unlocksession();
        end

        function lockAndUnlockSessionWithHasLockSucceeds(testCase)
            hasLock = testCase.client.locksession(-1);
            testCase.verifyTrue(hasLock);
            hasLock = testCase.client.unlocksession(hasLock);
            testCase.verifyFalse(hasLock);
        end

        function getDefaultRequestSucceeds(testCase)
            request = testCase.client.getdefaultrequest(testCase.service, testCase.echo, -1);
            expected = '{"delay":0}';
            testCase.verifyEqual(request, expected);
        end

        function throwErrorSucceeds(testCase)
            func = @() testCase.client.blockingcall('', '', '', -1);
            testCase.verifyError(func, 'nigrpcjsonclient:ServiceNotFoundError');
        end
    end

end
