service = 'helloworld.Greeter';

client = nigrpcjsonclient.Session('localhost:50051');

request = jsonencode(struct('name', 'MATLAB'));
response = client.blockingcall(service, 'SayHello', request, -1);
disp(response);
