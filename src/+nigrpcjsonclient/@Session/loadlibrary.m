function name = loadlibrary()
name = 'grpc_json_client';
if ~libisloaded(name)
    directory = nigrpcjsonclient.getInstallationLocation('gRPC JSON Client Core Library');
    if exist(directory, 'dir')
        path = fullfile(directory, name);
        loadlibrary(path, path);
    else
        loadlibrary(name);
    end
end
end  % function LoadLibrary
