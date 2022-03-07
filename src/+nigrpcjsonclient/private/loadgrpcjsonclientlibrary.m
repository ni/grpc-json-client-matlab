function loadgrpcjsonclientlibrary()
library = libraryname();
directory = nigrpcjsonclient.getInstallationLocation('gRPC JSON Client Core Library');
header = fullfile(directory, 'grpc_json_client.h');
if ~libisloaded(library)
    loadlibrary(library, header);
end
end  % function LoadLibrary
