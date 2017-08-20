package graphalgorithms;

import graph.IGraph;
import graph.IGraph.Edge;
import graph.IGraph.Vertex;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Stack;


public class GraphAlogrithms
{
	private static ArrayList visited = new ArrayList();
	private static Stack s = new Stack();
	
	/**
	 * 
	 * Find the first node that has no incoming arrows
	 * @param g
	 * @return
	 */
    public static <V, E> List<Vertex<V>> TopologicalSort( IGraph<V, E> g)
    {
    	List<Vertex<V>> v = g.getVertices();
    	List<Edge<E>> e = g.getEdges();
    	Vertex t = null;
    	Vertex b = null;
    	
        
        /**
         * Error checking 
         * searching for vertex with in degree 0
         * Trying to find the vertex where it has the least number of vertices 
         */
        
        if(!g.isDirectedGraph() || g == null)
        {
        	return null;
        }
        
       for(int i = 0; i < v.size(); i++)
       {
    	   Vertex<V> curr = g.getVertices().get(i);
    	   t = curr;
    	  
    	   for(int j = 0; j < v.size(); j++)
    	   {
    		   Vertex<V> curr2 = g.getVertices().get(j);
    		   
    		   if(!curr2.equals(curr))
    		   {
    			   List<Vertex<V>> n = g.getNeighbors(curr2.getVertexName());
    			   for(int k = 0 ; k < n.size() ; k++)
    			   {
    				   if(curr.getVertexName().equals(curr2.getVertexName()))
    				   {
    					   t = null;
    					   break;
    				   }
    			   }
    		   }
    		   
    	   }
    	   
    	   if(t != null && (b == null) || curr.getVertexName().compareTo(b.getVertexName()) < 0)
    	   {
    		   b = curr;
    	   }
    	  
       }
       
       /**
        * If not discovered then do the recursive call and then do all over again with other nodes
        */
       while(visited.size() != v.size())
       {
    
    	   if(!visited.contains(t))
    	   {
    		   TSR(g,t);
    	   }
    	   
    	   /**
    	    * my if statement here looks a bit wrong
    	    */
    	   else
    	   {
    		   String mn = null;
    		   for(int l = 0 ; l < v.size() ;l ++)
    		   {
    			   Vertex<V> m = g.getVertices().get(l);
    			   
    			   if(!visited.contains(m))
    			   { 
    				   if(mn == null || mn.compareTo(m.getVertexName()) > 0) { mn = m.getVertexName(); }   
    				   
    			   }
    		   }
    		   TSR(g, g.getVertex(mn));
    	   }
    	   
       }
          
       /**
        * push it to the stack
        */
       visited.clear();
       while(!s.isEmpty())
       {
    	   visited.add(s.pop());
       }
       
    	return visited;
    }
    
    /**
     * Recursion method
     * Feed in the graph and vertex 
     * Get the neigh and save it in variable
     * Check if its empty
     * if its not then go through every neighbor
     * and if it hasn't been discovered then call the recursion method on that
     * push it on the stack and add it if its discovered or not
     */
    
    private static <V,E> void TSR (IGraph <V,E> g, Vertex <V> curr)
    {
    	List <Vertex<V>> n = g.getNeighbors(curr.getVertexName());
    	
    	if(!n.isEmpty())
    	{
    		for(Vertex<V> v : n)
    		{
    			if(!visited.contains(v))
    			{
    				TSR(g,v);
    			}
    		}
    	}
    	
    	s.push(g.getVertex(curr.getVertexName()));
    	visited.add(curr);
    	
    }
    
    /**
     * 
     * My AllTopo work but the only issue that I'm having right now is that its giving the same output
     * 7 (the number of vertices times) and it looks like it's coming from Topo but I can't figure out
     * where exactly 
     * @param g
     * @return
     */
    public static <V, E> List<List<Vertex<V>>> AllTopologicalSort( IGraph<V, E> g )
    {
    	List<Vertex<V>> v = g.getVertices();
    	ArrayList <Vertex<V>> at = new ArrayList <Vertex <V>> ();
    	List<List<Vertex<V>>> result = new ArrayList <List<Vertex<V>>>();
    	
    	for(int i =0;i <v.size();i++)
    	{
    		//find the neighbor
    		List  <Vertex <V>> temp = new ArrayList<Vertex<V>>();
    		
    		temp = g.getNeighbors(v.get(i).getVertexName());
    		
    		for(int j = 0 ; j <temp.size(); j++)
    		{
    			
    			if(!at.contains(temp.get(j)))
    			{
    				at.add(temp.get(j));
    			}
    		}
    		
    	}
    
    	/**
    	 * 
    	 * Helper method 
    	 */
    	ArrayList <Vertex <V>> starts = (ArrayList<Vertex<V>>) noVertex (g);
    	
//    	for(int k = 0 ; k < v.size(); k++)
//    	{
//    		if(!at.contains(v.get(k)))
//    		{
//    			starts.add(v.get(k));
//    		}
//    	
//    	}
//    	
    	/**
    	 * Doing the same thing that I did in Topo with the recursive call
    	 */
    	for(int l = 0 ; l < starts.size(); l++)
    	{
    		visited.clear();
    		s.clear();
    		Vertex <V> t = starts.get(l);
    		while(visited.size() != v.size())
    	       {
    	    	   
    	    	   if(!visited.contains(t))
    	    	   {
    	    		   TSR(g, t);
    	    	   }
    	    	   
    	    	   else
    	    	   {
    	    		   String mn = null;
    	    		   for(int n = 0 ; n < v.size() ;n ++)
    	    		   {
    	    			   Vertex<V> m = g.getVertices().get(n);
    	    			   
    	    			   if(!visited.contains(m))
    	    			   {
    	    				   if(mn == null || mn.compareTo(m.getVertexName()) > 0) { mn = m.getVertexName(); }
    	    				   
    	    			   }
    	    		   }
    	    		   TSR(g, g.getVertex(mn));
    	    	   }
    	    	   
    	       }
    		
    		/**
    		 * adding it to stack
    		 */
    		   visited.clear();
    	       while(!s.isEmpty())
    	       {
    	    	   visited.add(s.pop());
    	       }
    	       
    	       result.add(visited);
    	      
    	}
    
        return result; 
    }
    
    /**
     * 
     * This is the helper method that checks if there are any incoming vertex to the node
     * This is being used in allTopo only 
     * @param g
     * @return
     */
    public static <V, E>List<Vertex<V>> noVertex (IGraph<V, E> g)
    {
    	//vertex1
    	List<Vertex<V>> vx = g.getVertices();
    	//vertex2
    	List<Vertex<V>> vn = new ArrayList<Vertex<V>>();
    	//no incoming
    	List<Vertex<V>> ni = new ArrayList<Vertex<V>>();
    	
    	for(int i = 0; i < g.getVertices().size(); i++)
    	{
    		Vertex<V> v = vx.get(i);
    		vn = g.getNeighbors(v.getVertexName());
    	}
    	for(int i = 0 ; i < g.getVertices().size(); i++)
    	{
    		Vertex <V> v = vx.get(i);
    		if(!vn.contains(v))
    		{
    			ni.add(v);
    		}
    		
    	}
    	return ni;
    	
    }
    
    /**
     * 
     * From the help of TA, I was able to do this one, its not fully implemented. 
     * @param g
     * @return
     * 
     */
    public static <V, E extends IWeight> IGraph<V, E> Kruscal(IGraph<V, E> g )
    {
    	List <Edge<E>> me = new ArrayList <Edge<E>>();
    	List <Vertex<V>> mv = new ArrayList <Vertex<V>>();
    	HashMap <String, Integer> hm = new HashMap <String, Integer> ();
    	List<Vertex<V>> v = g.getVertices();
    	//sort it first
    	List <Edge<E>> o = new ArrayList<Edge<E>>();
    	o = sort(o);
    	//make 2 list one of edges and one of vertex type
    	
    	int i = 1;
    		
    		for(Vertex <V> e: v)
    		{
    			hm.put(e.getVertexName(),i);
    			i += 1;
    		}
    		
    	// loop through the edges and in the order of list 
    	// check if the 1 and 2 vertex values are equal if they are continue 
    	Edge <E> k;
    	String v1;
    	String v2;
    	
    		for(int l = 0 ; l < o.size();l++)
    		{
    			k = o.get(l);
    			v1 = k.getVertexName1();
    			v2 = k.getVertexName2();
    			
    			if(hm.get(v1) == hm.get(v2)){continue;}
    			
    			// add the edge to the edges
    	    	// if it doesn't contain the first vertex then you add it 
    	    	// do the same for both the vertex and that way you will have the list of vertices
    	    		
    			me.add(k);
    			if(!mv.contains(g.getVertex(k.getVertexName2())))
    			{
    				mv.add(g.getVertex(k.getVertexName2()));
    			}
    			if(!mv.contains(g.getVertex(k.getVertexName1())))
    			{
    				mv.add(g.getVertex(k.getVertexName1()));
    			}
    			//loop through the vertices and change the value of vertex2 to the value of vertex1
    			
    		}
    		
    	
    		
    		
    	//build the graph
    	
        return null; 
    }
    
    /**
     * 
     * I used this method in order to sort the 
     * @param lst
     * @return
     */
    private static <E extends IWeight> List <Edge <E>>sort (List <Edge<E>> lst)
    {
    	for (int i = 0; i < lst.size(); i++) 
		{
			int curr = i;
			while (curr > 0 && lst.get(curr - 1).getEdgeData().getWeight() > (lst.get(curr).getEdgeData().getWeight())) 
			{
				Edge<E> t= lst.get(i);
				lst.set(curr, lst.get(curr - 1));
				lst.set(curr - 1, t);
				curr--;
			}
		}
    	return lst;
    }
   
}
