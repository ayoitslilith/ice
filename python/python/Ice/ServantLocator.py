# Copyright (c) ZeroC, Inc. All rights reserved.

class ServantLocator(object):
    """
    A servant locator is called by an object adapter to locate a servant that is not found in its active servant map.
    """

    def __init__(self):
        if type(self) == ServantLocator:
            raise RuntimeError("Ice.ServantLocator is an abstract class")

    def locate(self, curr):
        """
            Called before a request is dispatched if a servant cannot be found in the object adapter's active servant map.
            Note that the object adapter does not automatically insert the returned servant into its active servant map.
            This must be done by the servant locator implementation, if this is desired. locate can throw any
            user exception. If it does, that exception is marshaled back to the client. If the Slice definition for the
            corresponding operation includes that user exception, the client receives that user exception; otherwise, the
            client receives UnknownUserException.
            If locate throws any exception, the Ice run time does not call finished.
            If you call locate from your own code, you must also call finished
            when you have finished using the servant, provided that locate returned a non-null servant;
            otherwise, you will get undefined behavior if you use servant locators such as the Freeze Evictor.
        Arguments:
        curr -- Information about the current operation for which a servant is required.
        Returns a tuple containing the following:
        _retval -- The located servant, or null if no suitable servant has been found.
        cookie -- A "cookie" that will be passed to finished.
        Throws:
        UserException -- The implementation can raise a UserException and the run time will marshal it as the result of the invocation.
        """
        raise NotImplementedError("method 'locate' not implemented")

    def finished(self, curr, servant, cookie):
        """
            Called by the object adapter after a request has been made. This operation is only called if
            locate was called prior to the request and returned a non-null servant. This operation can be used
            for cleanup purposes after a request.
            finished can throw any user exception. If it does, that exception is marshaled back to the client.
            If the Slice definition for the corresponding operation includes that user exception, the client receives that
            user exception; otherwise, the client receives UnknownUserException.
            If both the operation and finished throw an exception, the exception thrown by
            finished is marshaled back to the client.
        Arguments:
        curr -- Information about the current operation call for which a servant was located by locate.
        servant -- The servant that was returned by locate.
        cookie -- The cookie that was returned by locate.
        Throws:
        UserException -- The implementation can raise a UserException and the run time will marshal it as the result of the invocation.
        """
        raise NotImplementedError("method 'finished' not implemented")

    def deactivate(self, category):
        """
            Called when the object adapter in which this servant locator is installed is destroyed.
        Arguments:
        category -- Indicates for which category the servant locator is being deactivated.
        """
        raise NotImplementedError("method 'deactivate' not implemented")
