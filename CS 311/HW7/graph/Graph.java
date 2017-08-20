package cs311.graph;

import java.util.List;
import java.util.ArrayList;
/**
 * 
 * @author Jay Patel
 *
 * @param <V>
 * @param <E>
 */
public class Graph <V,E> implements IGraph <V,E>
{
	
	/**
	 * Starting off with a boolean as False.
	 * In order to store everything I made an ArrayList for both Vertex and Edge and each
	 * of them will store the data.
	 */
	private boolean direct = false;
	private List<Edge<E>> e = new ArrayList <Edge <E>> ();
	private List<Vertex<E>> v = new ArrayList <Vertex <E>> ();
	
	
	/**
	 * I have a boolean variable that is set to false, but in this case
	 * it would be true
	 */
	@Override
	public void setDirectedGraph() 
	{
		direct = true;
	}
	
	/**
	 * In this method, I am checking for some edge cases like if they are equal and also checking of other 
	 * Vertex, if there is nothing then it would make it
	 */
	@Override
	public void setUndirectedGraph() 
	{
		//get it checked!!!
		int count = 0;
		direct = false;
		Edge <E> a,b;
		//Edge <E> newones = new Edge <E>();
		for(int i = 0; i < e.size() - count; i++)
		{
			a = e.get(i);
			count++;
			if(!a.getVertexName1().equals(a.getVertexName2()))
			{ //checking for both the v equal
				for (int j = 0; j <= e.size(); j++ )
				{
					b = e.get(j);
					if(a.getVertexName1().equals(b.getVertexName2()) && a.getVertexName2().equals(b.getVertexName1()))
					{
							direct = true;
					}
				
				}
			}
			else
			{
				//newones = (a.getVertexName2(), a.getVertexName1(), a.getEdgeData());
				Edge <E> newones = new Edge<E>(a.getVertexName2(), a.getVertexName1(), a.getEdgeData());
				e.add(newones);
				break;
			}
		}
	
	}
	
	/**
	 * Checking for the directed Graph, since I have it as up on top, I just called it
	 */
	@Override
	public boolean isDirectedGraph() 
	{
		return direct;
	}

	/**
	 * Checking if there are any duplicate vertices and if there are not then add one
	 */
	@Override
	public void addVertex(String vertexName) throws DuplicateVertexException {
		
		
		//adding a new vertex
		if(getVertex(vertexName) == null ) 
		{
			v.add(new Vertex(vertexName, null));
		}
		else
		{
			throw new DuplicateEdgeException();
		}
		
	}
	
	/**
	 * Adding vertex checking if it is null then add it else throw exception
	 */
	@Override
	public void addVertex(String vertexName, Object vertexData) throws DuplicateVertexException {
		
		
		if(getVertex(vertexName) == null ) 
		{
			v.add( new Vertex (vertexName, null));
		}
		else
		{
			throw new DuplicateEdgeException();
		}
		
	}
	
	/**
	 * 
	 * Just using addEdge method since it pretty much does the same
	 * 
	 */
	@Override
	public void addEdge(String vertex1, String vertex2) throws DuplicateEdgeException, NoSuchVertexException 
	{
	
		addEdge(vertex1, vertex2, null);
	}
	
	/**
	 * 
	 * Checking for both the vertex if they are null and if they are then I just thrown an exception
	 * Also checking if the edge is null, if it is then I add it to the edge that I made up top
	 * else I through the error
	 * 
	 */
	@Override
	public void addEdge(String vertex1, String vertex2, Object  edgeData)
			throws DuplicateEdgeException, NoSuchVertexException 
	{
	
		
		if(getVertex(vertex1) == null || getVertex(vertex2) == null)
		{
			throw new NoSuchVertexException();
		}
		
		if(getEdge(vertex1, vertex2) == null)
		{
			e.add(new Edge (vertex1, vertex2, edgeData));
		}
		else
		{
			throw new DuplicateEdgeException();
		}
		
		
	}
	
	/**
	 * I am checking if the vertex a is null, if it is then I throw an error 
	 * if not then I return the vertex data
	 * 
	 */
	@Override
	public V getVertexData(String vertexName) throws NoSuchVertexException 
	{

		Vertex <V> a = getVertex(vertexName);
		
		if(a == null)
		{
			throw new NoSuchVertexException();
		}
		else
		{
			return a.getVertexData();
		}
		
		
	}
	
	/**
	 * Doing very similar from the above except I am just removing it in the 
	 * else statement and adding it back to the vertex
	 *  
	 */
	@Override
	public void setVertexData(String vertexName, Object vertexData) throws NoSuchVertexException 
	{
	
		
		Vertex <V> a = getVertex(vertexName);
		
		if(a == null)
		{
			throw new NoSuchVertexException();
		}
		
		else
		{
			v.remove(a);
			v.add(new Vertex (vertexName, vertexData));
		}
		
	}
	
	/**
	 * In this method, I am pretty much doing the same that I did before, all I am doing is checking for the 
	 * same edge cases and then returning the edge data
	 * 
	 */
	@Override
	public E getEdgeData(String vertex1, String vertex2) throws NoSuchVertexException, NoSuchEdgeException 
	{
		
		Edge <E> a = getEdge(vertex1, vertex2);
		
		if(getVertex(vertex1) == null || getVertex(vertex2) == null)
		{
			throw new NoSuchVertexException();
		}
		
		if(a == null)
		{
			throw new NoSuchEdgeException();
		}
		else
		{
			return a.getEdgeData();
		}
	}
	
	/**
	 * 
	 * In this method we are setting the edge data, I am using the same edge cases and the difference 
	 * that I have is I am removing the edge and adding it back
	 * 
	 */
	@Override
	public void setEdgeData(String vertex1, String vertex2, Object edgeData)
			throws NoSuchVertexException, NoSuchEdgeException 
	{
		
		if(getVertex(vertex1) == null || getVertex(vertex2) == null)
		{
			throw new NoSuchVertexException();
		}
		
		Edge <E> a = getEdge(vertex1, vertex2);
		
		if(a == null)
		{
			throw new NoSuchEdgeException();
		}
		else
		{
			e.remove(a);
			e.add(new Edge (vertex1, vertex2, edgeData));
		}
		
	}
	
	/**
	 * Returns the vertex data type based on the vertex.
	 */
	@Override
	public Vertex <V> getVertex(String VertexName) 
	{
		
		Vertex j;
		for(int i = 0; i < v.size(); i++)
		{
			j = v.get(i);
			if(j.getVertexName().equals(VertexName))
			{
				return j;
			}
		}
		return null;
	}
	
	/**
	 * Returns the edge data type based on the edge.
	 */
	@Override
	public Edge <E> getEdge(String vertexName1, String vertexName2) 
	{
		Edge <E> j;
		for(int i = 0; i < e.size(); i++)
		{
			j = e.get(i);
			
			if(j.getVertexName1().equals(vertexName2) && j.getVertexName2().equals(vertexName2))
			{
				return j;
			}
		}
		return null;
	}

	/**
	 * Returning the list name that I made before
	 */
	@Override
	public List getVertices() 
	{
		return v;
	}
	
	/**
	 * Returning the list name that I made before
	 */
	@Override
	public List <Edge<E>> getEdges() 
	{
		return e;
	}
	
	/**
	 * In this method, we are checking for neighbors, so if there are A and B where A is pointing to B
	 * we are checking for that basically. In order to do that, I am using isDirected that we have which made
	 * it easier to implement. 
	 */
	@Override
	public List <Vertex <V>> getNeighbors(String vertex) 
	{
		
		Edge <E> j;
		ArrayList <Vertex <V>> n = new ArrayList<> ();
		if(getVertex(vertex) == null) { return null;}
		
		for(int i = 0; i < e.size()-1; i++)
		{
			j = e.get(i);
			
			if(!n.contains(j))
			{
				if(j.getVertexName1().equals(vertex))
				{
					n.add(getVertex(j.getVertexName2()));
				}
			}
		}
		return n;
	}

}
