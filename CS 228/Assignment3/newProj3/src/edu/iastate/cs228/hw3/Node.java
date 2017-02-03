package edu.iastate.cs228.hw3;
/**
 * In this class I am writing a protected method so that in DSL I can write 
 * easily in printInventory
 * 
 * And also this class keeps track of all the nodes which will help me in DSL 
 * to write the doublylist
 * 
 * Also I am creating a helper method which will help me in the printInventoryMethod in DoublySortedList
 * 
 * @author Jay
 *
 */

public class Node 
{
    public String fruit;   		// name of the fruit (singular form) 
    public int quantity; 		// this will give the quantity
    public int bin; 			// number of storage bin 
    
    public Node nextN;			 // this will represent the next node 
    public Node previousN;		// this will represent the previous node
    public Node nextB; 			// this will represent the next to next node
    public Node previousB; 		// this will represent previous to previous node
    
    /**
     * 
     * @param fruit			name of this type of fruit 
     * @param quantity		e.g., number of units (i.e., # apples, # bunches of grapes, etc.)
     * @param bin			number of the storage bin for the fruit
     * @param nextN         next node in the N-list sorted by name 
     * @param previousN 	previous node in the N-list 
     * @param nextB			next node in the B-list sorted by storage bin number 
     * @param previousB		previous node in the B list 
     */
    public Node(String fruit, int quantity, int bin, 
    		Node nextN, Node previousN, Node nextB, Node previousB)
    {
      this.fruit = fruit;
      this.quantity = quantity; 
      this.bin = bin;
      this.nextN = nextN;
      this.previousN = previousN; 
      this.nextB = nextB; 
      this.previousB = previousB; 
    }
    
    /**
     * Write out the fruit name, quantity, and bin number stored at the node.
     */
    public String toString() 
    {
    	
    	String d = fruit;
    	String result = "";
    	result += d;
    	int blank  = 16 - fruit.length();
    	
    	for(int i = 0 ; i < blank ; i ++){
    		result+= " ";
    		
    	}
    	
    	result += quantity;
    	d = "" +quantity;
    	
    	blank = 16 - d.length();
    	for(int j = 0 ; j < blank ; j++){
    		result+= " ";
    		
    	}
    	result += bin;
    	
    	return result;
    }
}
