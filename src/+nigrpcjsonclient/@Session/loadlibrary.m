function name = loadlibrary()
%LOADLIBRARY Loads the core library into memory.
name = 'grpc_json_client';
if ~libisloaded(name)
    directory = nigrpcjsonclient.getInstallationLocation('gRPC JSON Client Core Library');
    if exist(directory, 'dir')
        path = fullfile(directory, name);
        loadlibrary(path, path);
    else
        % this branch falls back to the default search order if the DLL isn't found in the expected
        % installation directory
        loadlibrary(name);
    end
end
end  % function LoadLibrary
