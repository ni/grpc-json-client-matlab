classdef ErrorCode < int32
    enumeration
        BufferSizeOutOfRangeWarning (1)
        None (0)
        UnknownError (-1)
        RemoteProcedureCallError (-2)
        ReflectionServiceError (-3)
        ServiceNotFoundError (-4)
        MethodNotFoundError (-5),
        SerializationError (-6)
        DeserializationError (-7)
        InvalidArgumentError (-8)
        TimeoutError (-9)
        BufferSizeOutOfRangeError (-10)
    end
end
