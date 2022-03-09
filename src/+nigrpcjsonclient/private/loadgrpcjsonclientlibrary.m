function loadgrpcjsonclientlibrary()
library = libraryname();
if ~libisloaded(library)
    directory = nigrpcjsonclient.getInstallationLocation('gRPC JSON Client Core Library');
    if exist(directory, 'dir')
        header = fullfile(directory, 'grpc_json_client.h');
        loadlibrary(library, header);
    else
        loadlibrary(library);
    end
end
end  % function LoadLibrary
