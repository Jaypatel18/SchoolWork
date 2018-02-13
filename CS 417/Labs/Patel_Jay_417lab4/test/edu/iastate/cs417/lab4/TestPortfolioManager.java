package edu.iastate.cs417.lab4;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.mockito.exceptions.base.MockitoAssertionError;
import org.mockito.exceptions.verification.VerificationInOrderFailure;
import org.mockito.exceptions.verification.junit.ArgumentsAreDifferent;

import edu.iastate.cs417.lab2.util.FileUtil;
import junit.framework.AssertionFailedError;

public class TestPortfolioManager {

	public static final double tolerance = .0005;
	Map<String,Double> currentPrices = new HashMap<String, Double>();
	StockServiceSessionFactory factory = null; 
	Portfolio holdings = null; 
	Portfolio Pninenine = null;
	Portfolio no = null;
	Portfolio fivefive = null;
	Portfolio to = null;
	Portfolio oneone = null;

	@Before
	public void setup()
	{
		currentPrices = PMTestUtil.loadPrices("current-prices.txt");
		holdings = PMTestUtil.loadPortfolio("portfolio-3.txt");
		Pninenine = PMTestUtil.loadPortfolio("portfolio-99.txt");
		no = PMTestUtil.loadPortfolio("Blank_Portfolio.txt");
		fivefive = PMTestUtil.loadPortfolio("portfolio-55.txt");
		to = PMTestUtil.loadPortfolio("portfolio-21.txt");
		oneone = PMTestUtil.loadPortfolio("portfolio-11.txt");
		
		MockSessionFactory mockFactory = new MockSessionFactory();
		mockFactory.setCurrentPrices(currentPrices);
		//just a reminder that the production code expects an unadorned factory. 
		factory = mockFactory;		
	}
	

	@Test
	public void test() 
	{
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(holdings);
		pm.setStockService(factory);
		double result = pm.getMarketValue();
		System.out.println("Portfolio value: "+result);
		assertEquals(92120.24, result, tolerance );
	}
	
	//add other tests to determine if the portfolio manager returns 
	//correct values and handles sessions correctly with various size
	//portfolios. 
	
	/**
	 * Test for portfolio 99 and if the value return is correct
	 */
	@Test
	public void test1() 
	{
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(Pninenine);
		pm.setStockService(factory);
		double result = pm.getMarketValue();
		System.out.println("Portfolio value: "+result);
		assertEquals(7141527.0, result, tolerance );
	}
	
	/**
	 * around 11 stocks total
	 */
	@Test
	public void test2() 
	{
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(oneone);
		pm.setStockService(factory);
		double result = pm.getMarketValue();
		System.out.println("Portfolio value: "+result);
		assertEquals(1003244.0, result, tolerance );
	}
	
	
	/**
	 * Around 57 stocks total
	 */
	@Test
	public void test3() 
	{
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(fivefive);
		pm.setStockService(factory);
		double result = pm.getMarketValue();
		System.out.println("Portfolio value: "+result);
		assertEquals(4416816.0, result, tolerance );
	}
	
	/**
	 * around 21 stocks total
	 */
	@Test
	public void test4() 
	{
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(to);
		pm.setStockService(factory);
		double result = pm.getMarketValue();
		System.out.println("Portfolio value: "+result);
		assertEquals(1780713.0, result, tolerance );
	}
	
	
	/**
	 * No stocks
	 */
	@Test
	public void test5() 
	{
		PortfolioManager pm = new PortfolioManager();
		pm.setPortfolio(no);
		pm.setStockService(factory);
		double result = pm.getMarketValue();
		System.out.println("Portfolio value: "+result);
		assertEquals(0.0, result, tolerance );
	}
	
	

}
