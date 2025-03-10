% Copyright (c) ZeroC, Inc.

classdef EncapsDecoder11_InstanceData < handle
    methods
        function obj = EncapsDecoder11_InstanceData(p)
            if ~isempty(p)
                obj.previous = p;
                p.next = obj;
            end
            obj.slices = {};
            obj.indirectionTables = {};
            obj.sliceFlags = uint8(0);
            obj.indirectPatchList = [];
        end
    end
    properties
        sliceType
        skipFirstSlice
        slices
        indirectionTables
        sliceFlags
        sliceSize
        typeId
        typeIdIndex
        compactId
        indirectPatchList
        previous
        next
    end
end
