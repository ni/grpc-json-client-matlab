service = 'nirfsa_grpc.NiRFSA';
resourceName = 'VST2_01';

client = nigrpcjsonclient.Session('localhost:31763');

request = jsonencode(struct('session_name', 'Demo', 'resource_name', resourceName));
initTag = client.startasynccall(service, 'Init', request, -1);

request = jsonencode(struct('vi', struct('name', 'Demo')));
closeTag = client.startasynccall(service, 'Close', request, -1);

response = client.finishasynccall(initTag, -1);
disp(response);

response = client.finishasynccall(closeTag, -1);
disp(response);
