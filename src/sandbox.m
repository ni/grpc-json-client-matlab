resourceName = 'VST2_01';

client = ni.grpcjsonclient.Session('localhost:31763');
client.queryreflectionservice();

request = jsonencode(struct('session_name', 'Demo', 'resource_name', resourceName));
response = client.blockingcall('nirfsa_grpc.NiRFSA', 'Init', request, 10000);
disp(response);
