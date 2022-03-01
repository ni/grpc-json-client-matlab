resourceName = 'VST2_01';

client = ni.GrpcJsonClient('localhost:31763');
client.QueryReflectionService();

request = jsonencode(struct('session_name', 'Demo', 'resource_name', resourceName));
response = client.BlockingCall('nirfsa_grpc.NiRFSA', 'Init', request, 10000);
disp(response);
