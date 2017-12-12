package edu.iastate.cs417.lab4;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.atMost;
import static org.mockito.Mockito.atLeast;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.inOrder;


import org.mockito.InOrder;
import org.mockito.Mockito;
import org.mockito.exceptions.verification.VerificationInOrderFailure;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.mockito.verification.VerificationMode;

import edu.iastate.cs417.lab2.util.FileUtil;
import junit.framework.AssertionFailedError;

public class TrackingMockSession implements ValidatingStockServiceSession {

	private int maxSessionRequests;
	private long maxSessionDuration;
	private StockServiceSession delegate; 
	private Map<String,Double> currentPrices = null; 

	
	public TrackingMockSession(int maxRequests, long maxDuration, Map<String,Double> prices) {
		maxSessionRequests = maxRequests;
		maxSessionDuration = maxDuration;
		delegate = mock(StockServiceSession.class);
		currentPrices = prices;
		configureMock();
	}

	@Override
	public boolean login(String username, String password) {
		return delegate.login(username, password);
	}

	@Override
	public double getCurrentPrice(Stock stock) 
			throws RequestLimitExceededException
	{
		return delegate.getCurrentPrice(stock);
	}

	@Override
	public boolean validate() 
	{
		//this method examines the Mockito history of the mockito object
		//to determine if the way it was called conforms to the protocol
		//described in the lab instructions.
		//this is where you put "verify() and InOrder()" stuff.
		
		boolean checker = true;
		InOrder io = inOrder(delegate);
		
		InOrder io2 = inOrder(delegate);
		io.verify(delegate).login("Tom", "123");
		
		io.verify(delegate,atLeast(1)).getCurrentPrice(any(Stock.class));
		
		Mockito.verifyNoMoreInteractions(delegate);
		
		verify(delegate, times(1)).login("Tom", "123");
		
		verify(delegate,atMost(15)).getCurrentPrice(any(Stock.class));
		
		try {
			io2.verify(delegate,atLeast(1)).getCurrentPrice(any(Stock.class));
			io2.verify(delegate).login(any(String.class), any(String.class));
			checker = false;}
		
		catch (VerificationInOrderFailure e){return true;}
		
		return checker;
	
	}
	

	private void configureMock() 
	{
		//this method configures the Mockito object so that it
		//expects login and getCurrentPrice calls and it knows how to 
		//return appropriate responses to both. 
		//this is where you put "when(...)" stuff. 
		boolean one = true;
		when(delegate.login("Tom", "123")).thenReturn(one);
		

		when(delegate.getCurrentPrice(any(Stock.class))).thenAnswer(new Answer <Double>() {
			private int count = 0;
			
			@Override
			public Double answer(InvocationOnMock invocation) throws Throwable {
				if(count>14) throw new RequestLimitExceededException();
				{   count++;
					Object[] args = invocation.getArguments();
					Stock arg = (Stock) args[0];
					Double rval = null;
					try {
						FileReader fReader = new FileReader("current-prices.txt");
						
						BufferedReader rReader = new BufferedReader(fReader);
						
						String line = null;
						
						while ((line = rReader.readLine()) != null)
						{
							if(line.contains(arg.symbol)){
								
								rval = Double.parseDouble(line.substring(arg.symbol.length()));
								
								break;
							}
						}
						rReader.close();
					}
					catch (NumberFormatException e){e.printStackTrace();}
					
					catch (IOException e){e.printStackTrace();}
					
					if(rval == null) throw new RequestLimitExceededException();
					
						return rval;				
		}
	
	}	
		});
	}
}
