function loadgrpcjsonclientlibrary()
library = libraryname();
if ~libisloaded(library)
    directory = nigrpcjsonclient.getInstallationLocation('gRPC JSON Client Core Library');
    if exist(directory, 'dir')
        library = fullfile(directory, library);
        loadlibrary(library, library);
    else
        loadlibrary(library);
    end
end
end  % function LoadLibrary
