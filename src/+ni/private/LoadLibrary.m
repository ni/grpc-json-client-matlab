function LoadLibrary()
library = LibraryName();
if ~libisloaded(library)
    loadlibrary(library);
end
end  % function LoadLibrary
