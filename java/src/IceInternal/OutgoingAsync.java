// **********************************************************************
//
// Copyright (c) 2003-2004 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

package IceInternal;

public abstract class OutgoingAsync
{
    public
    OutgoingAsync()
    {
    }

    public abstract void ice_exception(Ice.LocalException ex);

    public final void
    __finished(BasicStream is)
    {
	synchronized(_monitor)
	{
	    int status;
	    
	    try
	    {
		__is.swap(is);
		
		status = (int)__is.readByte();
		
		switch(status)
		{
		    case DispatchStatus._DispatchOK:
		    case DispatchStatus._DispatchUserException:
		    {
			__is.startReadEncaps();
			break;
		    }
		    
		    case DispatchStatus._DispatchObjectNotExist:
		    case DispatchStatus._DispatchFacetNotExist:
		    case DispatchStatus._DispatchOperationNotExist:
		    {
			Ice.Identity id = new Ice.Identity();
			id.__read(__is);

                        //
                        // For compatibility with the old FacetPath.
                        //
                        String[] facetPath = __is.readStringSeq();
                        String facet;
                        if(facetPath.length > 0)
                        {
			    if(facetPath.length > 1)
			    {
			        throw new Ice.MarshalException();
			    }
                            facet = facetPath[0];
                        }
			else
			{
			    facet = "";
			}

			String operation = __is.readString();

			Ice.RequestFailedException ex = null;
                        switch(status)
                        {
                        case DispatchStatus._DispatchObjectNotExist:
                        {
                            ex = new Ice.ObjectNotExistException();
                            break;
                        }

                        case DispatchStatus._DispatchFacetNotExist:
                        {
                            ex = new Ice.FacetNotExistException();
                            break;
                        }

                        case DispatchStatus._DispatchOperationNotExist:
                        {
                            ex = new Ice.OperationNotExistException();
                            break;
                        }

                        default:
                        {
                            assert(false);
                            break;
                        }
                        }

			ex.id = id;
			ex.facet = facet;
			ex.operation = operation;
			throw ex;
		    }

		    case DispatchStatus._DispatchUnknownException:
		    case DispatchStatus._DispatchUnknownLocalException:
		    case DispatchStatus._DispatchUnknownUserException:
		    {
			String unknown = __is.readString();

                        Ice.UnknownException ex = null;
                        switch(status)
                        {
                        case DispatchStatus._DispatchUnknownException:
                        {
                            ex = new Ice.UnknownException();
                            break;
                        }

                        case DispatchStatus._DispatchUnknownLocalException:
                        {
                            ex = new Ice.UnknownLocalException();
                            break;
                        }

                        case DispatchStatus._DispatchUnknownUserException:
                        {
                            ex = new Ice.UnknownUserException();
                            break;
                        }

                        default:
                        {
                            assert(false);
                            break;
                        }
                        }

			ex.unknown = unknown;
			throw ex;
		    }

		    default:
		    {
			throw new Ice.UnknownReplyStatusException();
		    }
		}
	    }
	    catch(Ice.LocalException ex)
	    {
		__finished(ex);
		return;
	    }
		
	    assert(status == DispatchStatus._DispatchOK || status == DispatchStatus._DispatchUserException);
	    
	    try
	    {
		__response(status == DispatchStatus._DispatchOK);
	    }
	    catch(Exception ex)
	    {
		warning(ex);
	    }
	    finally
	    {
		cleanup();
	    }
	}
    }

    public final void
    __finished(Ice.LocalException exc)
    {
	synchronized(_monitor)
	{
	    if(_reference != null)
	    {
		if(_reference.locatorInfo != null)
		{
		    _reference.locatorInfo.clearObjectCache(_reference);
		}
		
		boolean doRetry = false;
		
		//
		// A CloseConnectionException indicates graceful
		// server shutdown, and is therefore always repeatable
		// without violating "at-most-once". That's because by
		// sending a close connection message, the server
		// guarantees that all outstanding requests can safely
		// be repeated. Otherwise, we can also retry if the
		// operation mode is Nonmutating or Idempotent.
		//
		if(_mode == Ice.OperationMode.Nonmutating || _mode == Ice.OperationMode.Idempotent ||
		   exc instanceof Ice.CloseConnectionException)
		{
		    try
		    {
			ProxyFactory proxyFactory = _reference.instance.proxyFactory();
			if(proxyFactory != null)
			{
			    _cnt = proxyFactory.checkRetryAfterException(exc, _cnt);
			}
			else
			{
			    throw exc; // The communicator is already destroyed, so we cannot retry.
			}
			
			doRetry = true;
		    }
		    catch(Ice.LocalException ex)
		    {
		    }
		}
		
		if(doRetry)
		{
		    _connection = null;
		    __send();
		    return;
		}
	    }
	    
	    try
	    {
		ice_exception(exc);
	    }
	    catch(Exception ex)
	    {
		warning(ex);
	    }
	    finally
	    {
		cleanup();
	    }
	}
    }

    public final boolean
    __timedOut()
    {
	//
	// No synchronization necessary, because
	// _absoluteTimeoutMillis is declared volatile. We cannot
	// synchronize here because otherwise there might be deadlocks
	// when Ice.ConnectionI calls back on this object with this
	// function.
	//
	if(_absoluteTimeoutMillis > 0)
	{
	    return System.currentTimeMillis() >= _absoluteTimeoutMillis;
	}
	else
	{
	    return false;
	}
    }

    protected final void
    __prepare(Ice.ObjectPrx prx, String operation, Ice.OperationMode mode, java.util.Map context)
    {
	synchronized(_monitor)
	{
	    try
	    {
		//
		// We must first wait for other requests to finish.
		//
		while(_reference != null)
		{
		    try
		    {
			_monitor.wait();
		    }
		    catch(InterruptedException ex)
		    {
		    }
		}
		
		_reference = ((Ice.ObjectPrxHelperBase)prx).__reference();
		assert(_connection == null);
		_connection = _reference.getConnection();
		_cnt = 0;
		_mode = mode;
		assert(__is == null);
		__is = new BasicStream(_reference.instance);
		assert(__os == null);
		__os = new BasicStream(_reference.instance);
		
                //
                // If we are using a router, then add the proxy to the router info object.
                //
                if(_reference.routerInfo != null)
                {
                    _reference.routerInfo.addProxy(prx);
                }

		_connection.prepareRequest(__os);
		
		_reference.identity.__write(__os);

                //
                // For compatibility with the old FacetPath.
                //
                if(_reference.facet == null || _reference.facet.length() == 0)
                {
                    __os.writeStringSeq(null);
                }
                else
                {
                    String[] facetPath = { _reference.facet };
                    __os.writeStringSeq(facetPath);
                }

		__os.writeString(operation);

		__os.writeByte((byte)mode.value());

		if(context == null)
		{
		    __os.writeSize(0);
		}
		else
		{
		    final int sz = context.size();
		    __os.writeSize(sz);
		    if(sz > 0)
		    {
			java.util.Iterator i = context.entrySet().iterator();
			while(i.hasNext())
			{
			    java.util.Map.Entry entry = (java.util.Map.Entry)i.next();
			    __os.writeString((String)entry.getKey());
			    __os.writeString((String)entry.getValue());
			}
		    }
		}
		
		__os.startWriteEncaps();
	    }
	    catch(Ice.LocalException ex)
	    {
		cleanup();
		throw ex;
	    }
	}
    }

    protected final void
    __send()
    {
	synchronized(_monitor)
	{
	    try
	    {
		while(true)
		{
		    if(_connection == null)
		    {
			_connection = _reference.getConnection();
		    }
		    
		    if(_connection.timeout() >= 0)
		    {
			_absoluteTimeoutMillis = System.currentTimeMillis() + _connection.timeout();
		    }
		    else
		    {
			_absoluteTimeoutMillis = 0;
		    }
		    
		    try
		    {
			_connection.sendAsyncRequest(__os, this);
			
			//
			// Don't do anything after sendAsyncRequest() returned
			// without an exception.  I such case, there will be
			// callbacks, i.e., calls to the __finished()
			// functions. Since there is no mutex protection, we
			// cannot modify state here and in such callbacks.
			//
			return;
		    }
		    catch(Ice.LocalException ex)
		    {
			if(_reference.locatorInfo != null)
			{
			    _reference.locatorInfo.clearObjectCache(_reference);
			}
			
			ProxyFactory proxyFactory = _reference.instance.proxyFactory();
			if(proxyFactory != null)
			{
			    _cnt = proxyFactory.checkRetryAfterException(ex, _cnt);
			}
			else
			{
			    throw ex; // The communicator is already destroyed, so we cannot retry.
			}
		    }
		    
		    _connection = null;
		}
	    }
	    catch(Ice.LocalException ex)
	    {
		__finished(ex);
	    }
	}
    }

    protected abstract void __response(boolean ok);

    private final void
    warning(Exception ex)
    {
	if(_reference != null) // Don't print anything if cleanup() was already called.
	{
	    if(_reference.instance.properties().getPropertyAsIntWithDefault("Ice.Warn.AMICallback", 1) > 0)
	    {
		java.io.StringWriter sw = new java.io.StringWriter();
		java.io.PrintWriter pw = new java.io.PrintWriter(sw);
		IceUtil.OutputBase out = new IceUtil.OutputBase(pw);
		out.setUseTab(false);
		out.print("exception raised by AMI callback:\n");
		ex.printStackTrace(pw);
		pw.flush();
		_reference.instance.logger().warning(sw.toString());
	    }
	}
    }

    private final void
    cleanup()
    {
	_reference = null;
	_connection = null;
	if(__is != null)
	{
	    __is.destroy();
	    __is = null;
	}
	if(__os != null)
	{
	    __os.destroy();
	    __os = null;
	}

	_monitor.notify();
    }

    protected BasicStream __is;
    protected BasicStream __os;

    private Reference _reference;
    private Ice.ConnectionI _connection;
    private int _cnt;
    private Ice.OperationMode _mode;

    //
    // Must be volatile, because we don't want to lock the monitor
    // below in __timedOut(), to avoid deadlocks.
    //
    private volatile long _absoluteTimeoutMillis;

    private final java.lang.Object _monitor = new java.lang.Object();
}
