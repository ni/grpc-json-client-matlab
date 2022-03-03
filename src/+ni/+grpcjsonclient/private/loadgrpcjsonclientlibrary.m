function loadgrpcjsonclientlibrary()
library = libraryname();
if ~libisloaded(library)
    loadlibrary(library);
end
end  % function LoadLibrary
