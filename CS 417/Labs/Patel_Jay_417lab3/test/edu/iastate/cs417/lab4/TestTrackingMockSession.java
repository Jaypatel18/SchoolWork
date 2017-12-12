package edu.iastate.cs417.lab4;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.mockito.exceptions.base.MockitoAssertionError;
import org.mockito.exceptions.verification.NoInteractionsWanted;
import org.mockito.exceptions.verification.VerificationInOrderFailure;
import org.mockito.exceptions.verification.WantedButNotInvoked;
import org.mockito.exceptions.verification.junit.ArgumentsAreDifferent;

import edu.iastate.cs417.lab2.util.FileUtil;
import junit.framework.AssertionFailedError;

public class TestTrackingMockSession {

	private static final int kSymbolCol = 0;
	private static final int kPriceCol = 1; 
	private static final int kQuantCol = 1; 
	
	Map<String,Double> currentPrices = new HashMap<String, Double>();
	StockServiceSessionFactory factory = null; 
	Portfolio holdings = null; 
	Portfolio Pninenine = null;

	@Before
	public void setup(){
		currentPrices = PMTestUtil.loadPrices("current-prices.txt");
		holdings = PMTestUtil.loadPortfolio("portfolio-3.txt");
		Pninenine = PMTestUtil.loadPortfolio("portfolio-99.txt");
		MockSessionFactory mockFactory = new MockSessionFactory();
		mockFactory.setCurrentPrices(currentPrices);
		//just a reminder that the production code expects an unadorned factory. 
		factory = mockFactory;		
	}
	
	/**
	 * Provided by the teacher
	 */
	@Test(expected=VerificationInOrderFailure.class)
	public void priceFirst(){
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(holdings);
		pm.setStockService(factory);	
		StockServiceSession session = factory.getNewSession();
		session.getCurrentPrice(holdings.getHoldings().get(0));
		session.login("Tom", "123");
		factory.getNewSession();
	}

	//Add additional tests to confirm that your mock object can detect 
	//      order errors, authentication errors,  too many request errors, etc. 
	
	/**
	 * No Price Calls
	 */
	@Test()
	public void Test1(){
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(Pninenine);
		pm.setStockService(factory);	
		StockServiceSession session = factory.getNewSession();
		session.login("Tom", "123");
		//session.getCurrentPrice(holdings.getHoldings().get(0));
		//factory.getNewSession();
	}
	
	/**
	 * invalid username
	 */
	@Test(expected=ArgumentsAreDifferent.class)
	public void Test2(){
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(Pninenine);
		pm.setStockService(factory);	
		StockServiceSession session = factory.getNewSession();
		session.login("Jay", "123");
		session.getCurrentPrice(holdings.getHoldings().get(0));
		factory.getNewSession();
	}
	
	/**
	 * invalid password
	 */
	@Test(expected=ArgumentsAreDifferent.class)
	public void Test3(){
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(Pninenine);
		pm.setStockService(factory);	
		StockServiceSession session = factory.getNewSession();
		session.login("Tom", "123878787");
		session.getCurrentPrice(holdings.getHoldings().get(0));
		factory.getNewSession();
	}
	
	/**
	 * checking for equal to 15
	 */
		@Test()
		public void Test4(){
			PortfolioManager pm = new PortfolioManager();
			pm.setPortfolio(Pninenine);
			pm.setStockService(factory);	
			StockServiceSession session = factory.getNewSession();
			session.login("Tom", "123");
			for(int i=0;i<15;i++)
			{
				session.getCurrentPrice(Pninenine.getHoldings().get(i));
			}
			factory.getNewSession();
			}
			

	
	/**
	 * checking for more than 15
	 */
	@Test(expected=RequestLimitExceededException.class)
	public void Test5(){
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(Pninenine);
		pm.setStockService(factory);	
		StockServiceSession session = factory.getNewSession();
		//session.getCurrentPrice(holdings.getHoldings().get(0));
		session.login("Tom", "123");
		for(int i=0;i<16;i++)
		{
			session.getCurrentPrice(Pninenine.getHoldings().get(i));
		}
		//factory.getNewSession();
	}
	
	/**
	 * calling get current price without login
	 */
	@Test(expected=WantedButNotInvoked.class)
	public void Test6()
	{
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(Pninenine);
		pm.setStockService(factory);	
		StockServiceSession session = factory.getNewSession();
		session.getCurrentPrice(Pninenine.getHoldings().get(0));
		factory.getNewSession();
	}
		
		/**
		 * calling it 10 times
		 */
	@Test()
	public void Test7(){
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(Pninenine);
		pm.setStockService(factory);	
		StockServiceSession session = factory.getNewSession();
		session.login("Tom", "123");
		for(int i=0;i<10;i++)
		{
			session.getCurrentPrice(Pninenine.getHoldings().get(i));
		}
		factory.getNewSession();
	}
		
		/**
		 * sequence
		 */
		@Test(expected=NoInteractionsWanted.class)
		public void Test8()
		{
			PortfolioManager pm = new PortfolioManager();
			pm.setPortfolio(Pninenine);
			pm.setStockService(factory);	
			StockServiceSession session = factory.getNewSession();
			session.getCurrentPrice(Pninenine.getHoldings().get(0));
			session.login("Tom", "123");
			session.getCurrentPrice(Pninenine.getHoldings().get(2));
			factory.getNewSession();
		}
			
		//Login with someone else name
//		@Test()
//		public void Test6(){
//			PortfolioManager pm = new PortfolioManager();
//			pm.setPortfolio(Pninenine);
//			pm.setStockService(factory);	
//			StockServiceSession session = factory.getNewSession();
//			session.getCurrentPrice(holdings.getHoldings().get(0));
//			session.login("Robert", "789");
//			factory.getNewSession();
//				
//	}
		
		
		/**
		 * add login multiple times
		 */
		@Test(expected=MockitoAssertionError.class)
		public void Test9()
		{
			PortfolioManager pm = new PortfolioManager();
			pm.setPortfolio(Pninenine);
			pm.setStockService(factory);	
			StockServiceSession session = factory.getNewSession();
			session.login("Tom", "123");
			session.getCurrentPrice(Pninenine.getHoldings().get(0));
			session.login("Tom", "123");
			session.login("Tom", "123");
			factory.getNewSession();
		}
				
			
}
