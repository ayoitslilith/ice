// Copyright (c) ZeroC, Inc.

const eq = function (e1, e2) {
    if (e1 === e2) {
        return true; // If identity compare equals members are equal.
    } else if (e1 === null || e1 === undefined || e2 === null || e2 === undefined) {
        return false;
    } else if (e1.prototype !== e2.prototype) {
        return false;
    } else if (typeof e1.equals == "function") {
        return e1.equals(e2);
    } else if (e1 instanceof Array || e1 instanceof Uint8Array) {
        return ArrayUtil.equals(e1, e2, eq);
    }
    return false;
};

export class ArrayUtil {
    static clone(arr) {
        if (arr === undefined) {
            return arr;
        } else if (arr === null) {
            return [];
        } else {
            return arr.slice();
        }
    }

    static equals(v1, v2, valuesEqual) {
        if (v1.length != v2.length) {
            return false;
        }

        const equalFn = valuesEqual || eq;
        for (let i = 0; i < v1.length; ++i) {
            if (!equalFn.call(equalFn, v1[i], v2[i])) {
                return false;
            }
        }

        return true;
    }
}

ArrayUtil.eq = eq;
