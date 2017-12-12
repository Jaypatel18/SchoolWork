package edu.iastate.cs417.lab5;

import static org.hamcrest.CoreMatchers.containsString;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Content;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.junit.Before;
import org.junit.Test;

public class Lab5Defects 
{
	
	/**
	 * Bug 1: 
	 * When you enter go to http://localhost:8080/lab5host/postupdate.html
	 * and enter something lets say "xyz" to planet
	 * and then go to http://localhost:8080/lab5host/postupdate.html again and enter a 
	 * new value the previous value "xyz" is still there instead of new value
	 * Hence a Caching issue.
	 * Test post update clear
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	
	@Test 
	public void bug1() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnResponse();
		int sc;
		sc = ret.getStatusLine().getStatusCode();
		assertEquals(sc,200);
		ByteArrayOutputStream b = new ByteArrayOutputStream();
		ret.getEntity().writeTo(b);
		String rs = b.toString();
		String one = "Jay";
		String two = "human";
		String three = "earth";
		
		assertThat(rs,containsString(one));
		assertThat(rs,containsString(two));
		assertThat(rs,containsString(three));
		
		
		String url2 = "http://localhost:8080/lab5host/command/update.jsp";
		HttpResponse retrn = Request.Post(url2).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "Saturn").
						build()).execute().returnResponse();
		int sc2;
		sc2 = retrn.getStatusLine().getStatusCode();
		assertEquals(sc2,200);
		ByteArrayOutputStream ba = new ByteArrayOutputStream();
		ret.getEntity().writeTo(ba);
		String rs2 = ba.toString();
		String one1 = "Jay";
		String two2 = "human";
		String three3 = "Saturn";
		
		assertThat(rs2,containsString(one1));
		assertThat(rs2,containsString(two2));
		assertThat(rs2,containsString(three3));
		
	}
	
	@Before
	public void clear1() throws ClientProtocolException, IOException 
	{
		String url = "http://localhost:8080/lab5host/command/clear.jsp";
		Content ret = Request.Get(url).execute().returnContent();
	}
	
	/**
	 * Do a post request to result set
	 * Result Set post
	 */
	@Test
	public void bug2() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		Content retrn = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnContent();
		
		String url1 = "http://localhost:8080/lab5host/query.jsp?planet=earth";
		HttpResponse retrn2 = Request.Get(url1).execute().returnResponse();
		Header[] rep2 = retrn2.getHeaders("planet");
		//String tok = rep2[0].getValue();
			
		String url2 = "http://localhost:8080/lab5host/resultset.jsp";
		HttpResponse retrn3 = Request.Post(url2).bodyForm
				(Form.form().add("planet", "earth").
						build()).execute().returnResponse();
		//String ok = ret3.toString();
		int sc;
		sc = retrn2.getStatusLine().getStatusCode();
		assertEquals(404,sc);
	}


	/**
	 * This is for Query Post request
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	@Before
	public void clear2() throws ClientProtocolException, IOException 
	{
		String url = "http://localhost:8080/lab5host/command/clear.jsp";
		Content ret = Request.Get(url).execute().returnContent();
	}
	
	@Test
	public void bug3() throws ClientProtocolException, IOException
	{
		String url = "http://localhost:8080/lab5host/command/update.jsp";
		Content ret = Request.Post(url).bodyForm
				(Form.form().add("name", "Jay").
						add("species", "human").add("planet", "earth").
						build()).execute().returnContent();
		
		String url2 = "http://localhost:8080/lab5host/query.jsp";
		HttpResponse ret2 = Request.Post(url2).bodyForm
				(Form.form().add("planet", "earth").
						build()).execute().returnResponse();
		
		int sc;
		sc = ret2.getStatusLine().getStatusCode();
		assertEquals(404,sc);

	}

}
