service = 'nirfsa_grpc.NiRFSA';
resourceName = 'VST2_01';

client = nigrpcjsonclient.Session('localhost:31763');

request = jsonencode(struct('session_name', 'Demo', 'resource_name', resourceName));
response = client.blockingcall(service, 'Init', request, -1);
disp(response);
response = jsondecode(response);

request = jsonencode(struct('vi', response.vi));
response = client.blockingcall(service, 'Close', request, -1);
disp(response);
