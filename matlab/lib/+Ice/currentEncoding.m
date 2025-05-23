function r = currentEncoding()
    % currentEncoding  Returns the supported Ice encoding version.
    %
    % Returns (Ice.EncodingVersion) - The Ice encoding version.

    % Copyright (c) ZeroC, Inc.

    r = IceInternal.Util.callWithResult('Ice_currentEncoding');
end
