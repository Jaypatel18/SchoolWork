package edu.iastate.cs417.lab5;

import static org.junit.Assert.*;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Content;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import static org.hamcrest.CoreMatchers.containsString;
import org.junit.Test;

public class TestLab5 
{

	/**
	 * ##########FOR GROUP1 from Test Plan##########
	 */
	
	/**
	 * Will show the entire HTML body
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@Test
	public void test0() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		Content ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnContent();
		//System.out.println(ret.asString());
		String rs = ret.toString();
		String one = "Jay";
		String two = "human";
		String three = "earth";
		
		assertThat(rs, containsString(one));
		assertThat(rs, containsString(two));
		assertThat(rs, containsString(three));
		
	}
	
	/**
	 * This test is for Post Get
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@Test
	public void Test1() throws ClientProtocolException, IOException
	{
		System.out.println("Group1");
		String url = "http://localhost:8080/lab5host/command/update.jsp?name=Jay&species=human&planet=earth";
		HttpResponse ret = Request.Get(url).execute().returnResponse();
		//System.out.println("Group1");
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,404);
	}
	
	/**
	 * This test is for Post Update
	 * from lecture 16
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@Test
	public void test2() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,200);
	}

	
	/**
	 * This test is for where name is null 
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 * 
	 */
	@Test
	public void Test3() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", null).
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,422);
	}
	
	/**
	 * This test is for where species is null 
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 * 
	 */
	@Test
	public void Test4() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", null).add("planet", "earth").
						build()).execute().returnResponse();
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,422);
	}
	
	/**
	 * This test is for where planet is null 
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@Test
	public void Test5() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", null).
						build()).execute().returnResponse();
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,422);
	}
	
	
	/**
	 * This test is for Test post update with name space
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@Test
	public void Test6() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "         ").
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,422);
	}
	
	/**
	 * Test post update with species space
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@Test
	public void Test7() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "         ").add("planet", "earth").
						build()).execute().returnResponse();
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,422);
	}
	
	/**
	 * This test is for Test post update with planet space
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@Test
	public void Test8() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "        ").
						build()).execute().returnResponse();
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,422);
	}
	
	
	
	/**
	 * ##########FOR GROUP2 from test plan##########
	 */
	
	/**
	 * This test is for Clear
	 * When it gets clear it actually gets clear
	 */
	@Test 
	public void Test9() throws ClientProtocolException, IOException
	{
		int counter = 0;
		String url = "http://localhost:8080/lab5host/command/clear.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		 //System.out.println("Group2");
		 String regex = "<\\/td> <\\/tr>";
		 Pattern pat = Pattern.compile(regex);
		 Matcher m = pat.matcher(ret.toString());
		 while(m.find())
		 {
			 counter++;
		 }
		 assertEquals(0,counter);
		
	}
	
	
	/**
	 * ##########FOR GROUP3 from test plan##########
	 */

	
	/**
	 * This test is for when the planet is not what it is suppose to
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	@Test
	public void Test10() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		//System.out.println("Group3");
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,200);
		
		String url2 = "http://localhost:8080/lab5host/query.jsp?planet=saturn";
		HttpResponse ret2 = Request.Get(url2).execute().returnResponse();
		int sc2;
		sc2 = ret2.getStatusLine().getStatusCode();
		assertEquals(sc2,404);
		
	}
	
	/**
	 * This test is for Query like in PDF
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	@Test
	public void Test11() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		//System.out.println("Group3");
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,200);
		
		String url2 = "http://localhost:8080/lab5host/query.jsp?planet=earth";
		HttpResponse ret2 = Request.Get(url2).execute().returnResponse();
		//getting just the string of planet
		//note that the token would be different everytime you run
		String plant = "planet";
		Header[] pat = ret2.getHeaders(plant);
		//System.out.println(pat[0].getValue());
		assertNotNull(pat);		
		
	}
	
	
	
	/**
	 * ##########FOR GROUP4 from test plan##########
	 */
	
	/**
	 * This test is for a garbage string
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	@Test
	public void Test12() throws ClientProtocolException, IOException
	{
		String url_q = "http://localhost:8080/lab5host/resultset.jsp?token="+"hibyehibyehibyehibye";
		org.apache.http.client.fluent.Response re = Request.Get(url_q).execute();
		HttpResponse re3 = re.returnResponse();
		
		int sc;
		sc = re3.getStatusLine().getStatusCode();
		assertEquals(404,sc);
		
	}
	
	/**
	 * This test is for has to be in sequence:
	 * update
	 * query
	 * token etc.
	 * Test Query Result Code
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	
	@Test 
	public void Test13() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		System.out.println("Group4");
		//System.out.println(ret.toString());
		//System.out.println(ret.getStatusLine());
		//System.out.println(ret.getEntity());
		
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,200);
		
		String url2 = "http://localhost:8080/lab5host/query.jsp?planet=earth";
		HttpResponse ret2 = Request.Get(url2).execute().returnResponse();
		System.out.println(ret2.toString());
		String plant = "planet";
		Header[] pat = ret2.getHeaders(plant);
		String area = pat[0].getValue();
		System.out.println(area);
		String url_q = "http://localhost:8080/lab5host/resultset.jsp?token="+area;
		Content no = Request.Get(url_q).execute().returnContent();
		String rs = no.toString();
		String one = "Jay";
		String two = "human";
		String three = "earth";
		
		assertThat(rs, containsString(one));
		assertThat(rs, containsString(two));
		assertThat(rs, containsString(three));
		
	}
	
	
	
}
