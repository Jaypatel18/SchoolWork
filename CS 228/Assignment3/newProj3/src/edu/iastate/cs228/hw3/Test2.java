package edu.iastate.cs228.hw3;

import java.io.FileNotFoundException;

public class Test2 {

	public static void main(String[] args) throws FileNotFoundException {
		// TODO Auto-generated method stub
		
		DoublySortedList test = new DoublySortedList("ttt.txt");
		
		
		//test.add("grape",1000);
		
		//test.remove("grape");
		//test.remove(9);
		//test.sell("apple", 100);
		//test.sell("banana", 20);
		//test.compactStorage();
		test.bulkSell("bulksell.txt"); //ERROR
		
		//test.restock("restock0.txt"); //ERROR
		
		//test.split();
		//System.out.println(test.inquire("pear"));
		
//		test.add("grape", 5);
		System.out.println(test.printInventoryN());
		System.out.println(test.printInventoryB());
		
		

	}

}
