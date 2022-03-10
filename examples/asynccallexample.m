service = 'helloworld.Greeter';

client = nigrpcjsonclient.Session('localhost:50051');

request = jsonencode(struct('name', 'MATLAB'));
tag = client.startasynccall(service, 'SayHello', request, -1);

response = client.finishasynccall(tag, -1);
disp(response);
