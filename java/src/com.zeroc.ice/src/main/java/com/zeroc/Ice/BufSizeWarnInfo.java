// Copyright (c) ZeroC, Inc.

package com.zeroc.Ice;

class BufSizeWarnInfo {
    // Whether send size warning has been emitted
    public boolean sndWarn;

    // The send size for which the warning wwas emitted
    public int sndSize;

    // Whether receive size warning has been emitted
    public boolean rcvWarn;

    // The receive size for which the warning wwas emitted
    public int rcvSize;
}
