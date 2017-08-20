package cs311.graphalgorithms;

import java.util.List;

import cs311.graph.Graph;
import cs311.graph.IGraph;
import cs311.graph.IGraph.*;
/**
@author Chandler Davis
*/		
public class test
{
	
	public static <V, E> void main(String[] args)
	{
		System.out.println("Running Topological Tests...\n");
		//testTopological();
		
		System.out.println("\n\n ------------------ \n"
				+ "Running AllTopological Tests... \n");
	
		//testAllTopological();
		
		System.out.println("\n\n ----------------- \n"
				+ "Running Kruskal's Tests... \n");
		
		testKruskals();
		
		System.out.println("\n\n ---------------------- \n"
				+ "\tDone! \n");
	}
	
	
	private static <V, E> void testTopological()
	{
		Graph<V,E> graph1 = new Graph<>();
		
		graph1.addVertex("B");
		graph1.addVertex("H");
		graph1.addVertex("J");
		graph1.addVertex("E");
		graph1.addVertex("A");
		graph1.addVertex("I");
		graph1.addVertex("C");
		graph1.addVertex("F");
		graph1.addVertex("G");
		graph1.addVertex("D");
		
		System.out.print("Unsorted: ");
		System.out.println(graph1.getVertices());
		
		graph1.setDirectedGraph();
		graph1.addEdge("A", "B");
		graph1.addEdge("A", "F");
		graph1.addEdge("B", "H");
		graph1.addEdge("D", "C");
		graph1.addEdge("D", "E");
		graph1.addEdge("D", "I");
		graph1.addEdge("E", "I");
		graph1.addEdge("G", "A");
		graph1.addEdge("G", "B");
		graph1.addEdge("G", "C");
		graph1.addEdge("I", "C");
		graph1.addEdge("J", "E");
		
		
		System.out.print("Sorted: ");
		
		
		System.out.println(GraphAlogrithms.TopologicalSort(graph1));
		
		System.out.println();

		Graph<V, E> graph2 = new Graph<>();
		
		graph2.addVertex("D");
		graph2.addVertex("A");
		graph2.addVertex("E");
		graph2.addVertex("B");
		graph2.addVertex("C");
		
		System.out.print("Unsorted: ");
		System.out.println(graph2.getVertices());
		
		graph2.setDirectedGraph();
		graph2.addEdge("A", "C");
		graph2.addEdge("A", "D");
		graph2.addEdge("A", "B");
		graph2.addEdge("A", "E");
		graph2.addEdge("D", "E");
		graph2.addEdge("C", "E");
		graph2.addEdge("B", "D");
		graph2.addEdge("C", "D");
		
		System.out.print("Sorted: ");
		System.out.println(GraphAlogrithms.TopologicalSort(graph2));
		
	}
	
	
	private static <V, E> void testAllTopological()
	{
		Graph<V, E> graph1 = new Graph<>();
		
		graph1.addVertex("B");
		graph1.addVertex("H");
		graph1.addVertex("J");
		graph1.addVertex("E");
		graph1.addVertex("A");
		graph1.addVertex("I");
		graph1.addVertex("C");
		graph1.addVertex("F");
		graph1.addVertex("G");
		graph1.addVertex("D");
		
		System.out.print("Unsorted: ");
		System.out.println(graph1.getVertices());
		
		graph1.setDirectedGraph();
		graph1.addEdge("A", "B");
		graph1.addEdge("A", "F");
		graph1.addEdge("B", "H");
		graph1.addEdge("D", "C");
		graph1.addEdge("D", "E");
		graph1.addEdge("D", "I");
		graph1.addEdge("E", "I");
		graph1.addEdge("G", "A");
		graph1.addEdge("G", "B");
		graph1.addEdge("G", "C");
		graph1.addEdge("I", "C");
		graph1.addEdge("J", "E");
		
		
		System.out.println("Sorted: ");
		
		for(List<Vertex<V>> list : GraphAlogrithms.AllTopologicalSort(graph1))
		{
			System.out.println("   " + list);
		}
		
		System.out.println();

		Graph<V, E> graph2 = new Graph<>();
		
		graph2.addVertex("D");
		graph2.addVertex("A");
		graph2.addVertex("E");
		graph2.addVertex("B");
		graph2.addVertex("C");
		
		System.out.print("Unsorted: ");
		System.out.println(graph2.getVertices());
		
		graph2.setDirectedGraph();
		graph2.addEdge("A", "C");
		graph2.addEdge("A", "D");
		graph2.addEdge("A", "B");
		graph2.addEdge("A", "E");
		graph2.addEdge("D", "E");
		graph2.addEdge("C", "E");
		graph2.addEdge("B", "D");
		graph2.addEdge("C", "D");
		
		System.out.println("Sorted: ");
		
		for(List<Vertex<V>> list : GraphAlogrithms.AllTopologicalSort(graph2))
		{
			System.out.println("   " + list);
		}
	}
	

	private static void testKruskals()
	{
		Graph<Integer, Weight> graph = new Graph<>();
		
		graph.addVertex("0");
		graph.addVertex("1");
		graph.addVertex("2");
		graph.addVertex("3");
		graph.addVertex("4");
		graph.addVertex("5");
		graph.addVertex("6");
		graph.addVertex("7");
		graph.addVertex("8");
		
		graph.addEdge("0", "1", new Weight(4.0));
		graph.addEdge("0", "7", new Weight(8.0));
		graph.addEdge("1", "2", new Weight(8.0));
		graph.addEdge("1", "7", new Weight(11.0));
		graph.addEdge("2", "8", new Weight(2.0));
		graph.addEdge("2", "3", new Weight(7.0));
		graph.addEdge("2", "5", new Weight(4.0));
		graph.addEdge("3", "4", new Weight(9.0));
		graph.addEdge("3", "5", new Weight(14.0));
		graph.addEdge("4", "5", new Weight(10.0));
		graph.addEdge("5", "6", new Weight(2.0));
		graph.addEdge("6", "7", new Weight(1.0));
		graph.addEdge("6", "8", new Weight(6.0));
		graph.addEdge("7", "8", new Weight(7.0));
		
		System.out.println("All Edges: " + graph.getEdges());
		
		IGraph<Integer, Weight> mst = GraphAlogrithms.Kruscal(graph);
		
		System.out.println("MST Edges: " + mst.getEdges());
		
	}

	

}