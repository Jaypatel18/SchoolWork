package edu.iastate.cs228.hw3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Comparator;
import java.util.Scanner;
import java.util.Random;

/**
 * 
 * In this class we will figure out a lot of things like how many fruits we have in total, how many are sold, how much do we need to restock 
 * we need to figure out by quick sort, insertion sort, partition.
 * 
 * I used some extra helper method so that it will help me to write the code easily and help me to make my code my efficient.
 * In this class we use doublysortedlist where you need to make sure that all the parts are joint to each others.
 * 
 * @author Jay
 * 
 */

/**
 * IMPORTANT: In the case of any minor discrepancy between the comments before a
 * method and its description in the file proj3.pdf, use the version from the
 * file.
 *
 */

public class DoublySortedList {
	private int size; // number of different kinds of fruits
	private Node headN; // first node of the sorted linked list by fruit name
	private Node headB; // first node of the sorted linked list by bin number

	/**
	 * default constructor Here we just initilize everything to null or 0.
	 */
	public DoublySortedList() {
		size = 0;
		headN = null;
		headB = null;
	}

	/**
	 * Constructor over an inventory file consists of lines in the following
	 * format
	 * 
	 * <fruit> <quantity> <bin>
	 * 
	 * Throws an exception if the file is not found.
	 * 
	 * You are asked to carry out the following operations:
	 * 
	 * 1. Scan line by line to construct one Node object for each fruit. 2.
	 * Create the two doubly-linked lists, by name and by bin number,
	 * respectively, on the fly as the scan proceeds. 3. Perform insertion sort
	 * on the two lists. Use the provided BinComparator and NameComparator
	 * classes to generate comparator objects for the sort.
	 * 
	 * @inventoryFile name of the file
	 */
	public DoublySortedList(String inventoryFile) throws FileNotFoundException { 
		// In this method I have kept some lines which are commented just
		// for my reference to test this constructor

		File iFile = new File(inventoryFile);
		Scanner fileScanner = new Scanner(iFile);
		
		String fru;
		int qua;
		int BN;
		
		Node previous = null;
	
		if (fileScanner.hasNext()) {
			fru = fileScanner.next();
			qua = fileScanner.nextInt();
			BN = fileScanner.nextInt();
			
			headN = new Node(fru, qua, BN, null,null,null,null);
			headB = headN;
			size++;
			
			previous = headN;
		}
		
		while(fileScanner.hasNext()){
			
			fru = fileScanner.next();
			qua = fileScanner.nextInt();
			BN = fileScanner.nextInt();
			
			Node p = new Node(fru,qua,BN,null,previous,null,previous);
			
			previous.nextN = p;
			previous.nextB = p;
			previous = p;
			size++;
			
			if(!fileScanner.hasNext()){
				p.nextN = headN;
				p.nextB = headB;
				headN.previousN = p;
				headB.previousB = p;
			}
			
		// fruit = value[0], quantity = values[1] , bin = values [2];
		}	
		fileScanner.close();

		// We need to set the pointers of the last node back to heads
		// System.out.println(this.toString());
		// Now perform two nsertion sorts on the Nlist and Blist
		
		NameComparator comp = new NameComparator();
		BinComparator binComp = new BinComparator();
		insertionSort(true,  comp);
		// System.out.println(this.toString());
		insertionSort(false,  binComp);
		// System.out.println(this.toString());
	}

	/**
	 * 
	 * in this method you just have to return size as it will be almost all the
	 * method so basically we are initializing everywhere.
	 * 
	 * @return size
	 * 
	 */

	public int size() {
		return size;
	}

	/**
	 * Called by split() and also used for testing. The doubly sorted list has
	 * already been created.
	 * 
	 * @param size
	 * @param headN
	 * @param headB
	 */
	public DoublySortedList(int size, Node headN, Node headB) {
		this.size = size;
		this.headN = headN;
		this.headB = headB;
	}

	/**
	 * Add one type of fruits in given quantity (n).
	 * 
	 * 1. Search for the fruit. 2. If already stored in some node, simply
	 * increase the quantity by n 3. Otherwise, create a new node to store the
	 * fruit at the first available bin. add it to both linked lists by calling
	 * the helper methods insertN() and insertB(). 4. Modify the link headN
	 * and/or headB if the newly inserted node becomes the first of either DCL.
	 * (This is carried out by insertN() or insertB().)
	 * 
	 * The case n == 0 should result in no operation. The case n < 0 results in
	 * an exception thrown.
	 * 
	 * @param fruit
	 *            name of the fruit to be added
	 * @param n
	 *            quantity of the fruit
	 */
	public void add(String fruit, int n) throws IllegalArgumentException {
		if (headN != null) { // This will check it it is null or not if not then  it is going to see if it is equal to 0 and it
							 // is is then it is going to check  if it is smaller than 0 if it is then is
							 // going to show an Illegal exception
			if (n == 0)
				return;
			if (n < 0)
				throw new IllegalArgumentException("Cannot be smaller than 0");

			int binNum = 1; // It is going to keep track of the number of bins
			Node present = headN; // It is going to mark at the headN
			NameComparator NC = new NameComparator(); 
			// I created a new  comparator so that it will keep track of  the lists and  everything else.
			// after this it just see if it is is equal to fruit and if it is  then it will just add to n with the quanity of particular fruit
			// and then see if it is equal to the cursor which is headN of nList  it will increment the bin and check the other bins
			// again loop through and see if the list which I created and the  node is smaller than 0 and if it is the present node will be the
			// next node right  after the present node.
			// after adding the particular fruit in the bin it will increment by the corresponding size
			do {
				if (present.fruit.equals(fruit)) {
					present.quantity = present.quantity + n;
					return;
				}

				present = present.nextN;
			} while (present != headN);

			present = headB;
			while (present.bin == binNum) {
				binNum++;
				present = present.nextB;
			}

			Node s = new Node(fruit, n, binNum, null, null, null, null);
			insertB(s, present.previousB, present);

			present = headN;
			while (NC.compare(present, s) < 0 && present.nextN != headN) {
				present = present.nextN;
			}
			insertN(s, present.previousN, present);
		} else {
			headN = new Node(fruit, n, 1, null, null, null, null);
			headB = headN;
			headN.nextN = headN;
			headB.nextB = headB;
			headN.previousN = headN;
			headB.previousB = headB;
		}
		size++;

	}

	/**
	 * The fruit list is not sorted. For efficiency, you need to sort by name
	 * using quickSort. Maintain two arrays fruitName[] and fruitQuant[].
	 * 
	 * After sorting, add the fruits to the doubly-sorted list (see project
	 * description) using the linear time algorithm described in Section 3.2 of
	 * the notes.
	 * 
	 * @param fruitFile
	 *            list of fruits with quantities. one type of fruit followed by
	 *            its quantity per line.
	 */
	public void restock(String fruitFile) throws FileNotFoundException {
		// I did not add an extra error message seperately in this because is there will be an error it will added automatically as I already have the 
		// error message on the method itself
		
		// I have some helper method for this class which helps me to make it easier and simplifies the code
		int countFru = countFru(fruitFile); 		// In this it will see the file
		String[] fru = new String[countFru]; 		// It will see the fruits and put in the array of the Strings
		Integer[] qua = new Integer[countFru]; 		// In this it is going to count the total fruits an store in the variable/ array.

		TotalFruits(fruitFile, countFru, fru, qua); // This is the helper method where it totals the fruits so that it will help me in restocking again.

		quickSort(fru, qua, countFru); 				// This will sort the array of fru as well as the qua

		if (headN == null) {						// In here we are going to see if the present node known as headN is null 
													// if it is it is going to add the corresponing fruit and quantitiy with the bin only when it is empty.
			for (int i = 0; i < countFru; i++) {
				add(fru[i], qua[i]);
				if (i == (countFru - 1)) {
					return;
				}

			}
		}
		stockAgain(true, countFru, fru, qua); 		// This is the helper method where it helps me to stock at the correct place and in correct bin as 
													// well as quantity.
	}
	/**
	 * I created this method to help me in restock method 
	 * In this method it basically helps me to stock properly in particular bin as well as the fruit and increment the size as needed
	 * In this we need to use only one list nList as the bList we dont need in this class.
	 * 
	 * @param b
	 * @param countFru
	 * @param fru
	 * @param qua
	 */
	private void stockAgain(boolean b, int countFru, String[] fru, Integer[] qua) {

		Node curr = headN; 		  // The first cursor will be the headN
		int cursor = 0; 		  // this will keep the cursor at 0 and if need we can just incremnet
		boolean done = false;	  // if it is done incremention this will show false
		boolean InCurr = true; 	  // This will increment and will skip the  correspoding fruit if needed

		while ((cursor < countFru) && (!(done))) { // This is for the selling 
			if (!(b)) {
				InCurr = true;
				if (fru[cursor].compareTo(curr.fruit) < 0) { // check if the  fruit comes before the curr and  smaller
					// as I told you if we want to increment do this as there is  no fruit avaiable
					throw new IllegalArgumentException("Cannot be smaller than 0");
				}

				else if (curr.fruit.compareTo(fru[cursor]) == 0) { 
					// if the fruit is same as  curr  fruit
					if (qua[cursor] >= curr.quantity) { // this will be sell accordingly
						remove(curr);
					} else {
						curr.quantity = curr.quantity - qua[cursor];

					}
					cursor++; // again we need to increment as there is nothing avaiable right now
					curr = curr.nextN;
					InCurr = false;
				}

				// we need to see if the fruit is greater than curr
				else if (fru[cursor].compareTo(curr.fruit) > 0) {
					curr = curr.nextN;
					InCurr = false;
				}
				if (InCurr) { // in this we are checking if it is the last
					if (curr.nextN == headN.previousN) {
						curr = curr.nextN;

						if (curr.fruit.compareTo(fru[cursor]) == 0) {
							// again check as we did before aka if it is equal
							if (qua[cursor] >= curr.quantity) {
								remove(curr); // this will be sell accordingly
							} else {
								curr.quantity = curr.quantity - qua[cursor];
								// same as before to check the quantity of the
								// fruits
							}
							cursor++;
							// again we need to increment as there is nothing
							// available right now

							done = true;
							// because the fruit will not be longer available

						} else {
							done = true;
						}
					}
				}

			} else {
				
				while ((cursor < countFru) && (!(done))) { // again we need to restock as we are out 

					// again check as we did in the the first if statement
					// weather it is smaller and what comes first
					if (fru[cursor].compareTo(curr.fruit) < 0) {
						// now we need to add
						add(fru[cursor], qua[cursor]);
						// again increment and see the next option
						cursor++;
					}
					// again as we did before check if it is greater
					else if (fru[cursor].compareTo(curr.fruit) > 0) {
						curr = curr.nextN;
					}
					// in this statement we are checking if it is last in the
					// list
					if (curr.nextN == headN.previousN) {
						curr = curr.nextN;

						// again do as we did before check if it is equal
						if (curr.fruit.compareTo(fru[cursor]) == 0) {
							curr.quantity = curr.quantity + qua[cursor];
							// increment the cursor again
							cursor++;

							done = true; // as the fruit will no longer
											// available to sell
						} else {
							// this is because for remaining fruits
							for (int l = cursor; l < countFru; l++) {
								add(fru[l], qua[l]);
							}

							done = true;
						}
					}
				}
			}
		}

	}
	/**
	 * 
	 * In this helper method it is going to help me to compute the total number of fruits in the restock method and bulksell method
	 * 
	 * @param fruitFile
	 * @param countFru
	 * @param fru
	 * @param qua
	 * @throws FileNotFoundException
	 * @throws IllegalArgumentException
	 */
	private void TotalFruits(String fruitFile, int countFru, String[] fru, Integer[] qua) throws FileNotFoundException,
			IllegalArgumentException {

		File Ifile = new File(fruitFile); 			// This is the fileName which has the fruits in it
		Scanner checkfruits = new Scanner(Ifile);	// This will scan thorugh the file and see
		
		for (int k = 0; k < countFru; k++) { 		// This will loop through and see the next with integer and if it is 0 it will thrown an error
			fru[k] = checkfruits.next();
			qua[k] = checkfruits.nextInt();
			if (qua[k] < 0) {
				throw new IllegalArgumentException("It cannot be sold or it is negative");
			}
	
	}
		

	}
	/**
	 * 
	 * In this method it will count the fruit types and helps it correspondingly
	 * 
	 * @param fruitFile
	 * @return
	 * @throws FileNotFoundException
	 */
	private int countFru(String fruitFile) throws FileNotFoundException {
		File iFile = new File(fruitFile);
		Scanner sc = new Scanner(iFile);
		int num = 0;

		while (sc.hasNextLine()) { // This will loop through and check the next line and increment it respectively.
			sc.next();
			sc.next();
			num++;
		}
		sc.close();
		return num;
	}

	/**
	 * Remove a fruit from the inventory.
	 * 
	 * 1. Search for the fruit on the N-list. 2. If no existence, make no
	 * change. 3. Otherwise, call the private method remove() on the node that
	 * stores the fruit to remove it.
	 * 
	 * @param fruit
	 */
	public void remove(String fruit) { // In this method what I basically did is just wrote a loop where it will go to the end of 
									   //the size - 1 and then see  if we want to remove the corrrespodong fuit and if yes then remove 
										//at the current position and decrement the size, and move to next.

		Node curr = headN;
		for (int l = 0; l < size; l++){
			if (curr.fruit.compareTo(fruit) == 0) {
				remove(curr);
				
			}
		curr = curr.nextN;
		}
	}

	/**
	 * Remove all fruits stored in the bin. Essentially, remove the node. The
	 * steps are as follows: 1. Search for the node with the bin in the B-list.
	 * 2. No change if it is not found. 3. Otherwise, call remove() on the found
	 * node.
	 * 
	 * @param bin
	 *            >= 1 (otherwise, throw an exception)
	 */
	public void remove(int bin) throws IllegalArgumentException { // In this it is bascically similar to the the the what I did before but in this 
																  // I have to check if it smaller than 1 and if it is then it will throw an error
		      													  
		int min = 1;
		if (bin < min) {
			throw new IllegalArgumentException("Cannot be smaller than 1 or negative");

		}
		// Similar to the one I did before but instead of using nList we use bList
		Node curr = headB;
		for (int i = 0; i < size; i++) {
			if (curr.bin == bin) {
				remove(curr);
				
			}
			curr = curr.nextB;
		}

	}

	/**
	 * Sell n units of a fruit.
	 * 
	 * Search the N-list for the fruit. Return in the case no fruit is found.
	 * Otherwise, a Node node is located. Perform the following:
	 * 
	 * 1. if n >= node.quantity, call remove(node). 2. else, decrease
	 * node.quantity by n.
	 * 
	 * Throw an exception if n < 0.
	 * 
	 * @param fruit
	 * @param n
	 */
	public void sell(String fruit, int n) throws IllegalArgumentException {
		// In this method we basically check again wheather it is smaller than 0, if it is we need to throw an excption.
		if (n < 0) {
			throw new IllegalArgumentException("It cannot be negative");
		}
		
		//This is kind of similar to remove method as in this we need to keep track what we have sold  
		Node Curr = headN;

		for (int i = 0; i < size; i++) {
			if (Curr.fruit.compareTo(fruit) == 0) {
				if (n >= Curr.quantity) {
					remove(Curr);
					return;
				} else {
					Curr.quantity = Curr.quantity - n;
					return;
				}
			}
			Curr = Curr.nextN;
		}
	}

	/**
	 * Process an order for multiple fruits as follows.
	 * 
	 * 1. Sort the ordered fruits and their quantities by fruit name using the
	 * private method quickSort(). 2. Traverse the N-list. Whenever a node with
	 * the next needed fruit is encountered, let m be the total number of a type
	 * of fruit to be ordered, and do the following: a) if m < 0, throw an
	 * exception; b) if m == 0, ignore. c) if 0 < m < node.quantity, decrease
	 * node.quantity by n. d) if m >= node.quanity, call remove(node).
	 * 
	 * @param fruitFile
	 */
	public void bulkSell(String fruitFile) throws FileNotFoundException,
			IllegalArgumentException {
		 
		int cntFruits = countFru(fruitFile); 			// This variable if for the filename
		String[] fru = new String[cntFruits];			// This variable if for storing the fruits
		Integer[] qua = new Integer[cntFruits];		 	// This variable is for storing the quantiles
		TotalFruits(fruitFile, cntFruits, fru, qua); 	// This is the helper method I created that will help me for calculating the fruits

		quickSort(fru, qua, cntFruits);              	// This is again the helper method whcih will help me to sort
		for(int i = 0; i < cntFruits ; i ++){
			
				sell(fru[i],qua[i]);
			
				
		}
	}

	/**
	 * In this method we need to see if the fruit is there are no !
	 * @param fruit
	 * @return quantity of the fruit (zero if not on stock)
	 */
	public int inquire(String fruit) {
		Node cur = headN;
		
		// What I did in this method is see there is a fruit or no is it is then it should return the positon with the quantity.
		
		for (int i = 0; i < size; i++) {
			if (cur.fruit.equals(fruit)) {
				return cur.quantity;
			}
			cur = cur.nextN;
		}

		return 0;
	}

	/**
	 * Output a string that gets printed out as the inventory of fruits by
	 * names. The exact format is given in Section 5.1. Here is a sample:
	 *
	 * 
	 * fruit quantity bin --------------------------- apple 50 5 banana 20 9
	 * grape 100 8 pear 40 3
	 * 
	 */
	public String printInventoryN() {
		// In this  it is just going to print out the fruit quanntity and bin
		// I have helper method for this  where it figures out how many we have and what should be the output
		// This is only for nList
		Node cur = headN;
		String output = "fruit           quantity        bin";
		output+= "\n"+ "----------------------------------" + "\n";

		for (int i = 0; i < size(); i++) {
			output = output + cur.toString() + "\n";
			cur = cur.nextN;
		}
		return output;
	}

	/**
	 * Output a string that gets printed out as the inventory of fruits by
	 * storage bin. Use the same formatting rules for printInventoryN(). Below
	 * is a sample:
	 * 
	 * bin fruit quantity ---------------------------- 3 pear 40 5 apple 50 8
	 * grape 100 9 banana 20
	 * 
	 */
	public String printInventoryB() {
		// In this it is just goignt o print out the bin fruit an quantity
		// I also have helper method for this one as above where it figures out how many we have and what shoul be the final output
		// this is only for bList
		Node cur = headB;
		String output = "bin            fruit          quantity";
		output += "\n" + "--------------------------------------" + "\n";

		for (int i = 0; i < size(); i++) {
			output = output + BList(cur) + "\n";
			cur = cur.nextB;
		}

		return output;
	}
	/**
	 * 
	 * This is the helper method I created for InventoryB
	 * 
	 * @param n
	 * @return
	 */
	 private String BList(Node n){
		 String d ="";
		 d += n.bin;
		 String result ="";
		 result += d;
		 
		 int blank = 16 - d.length();
		 
		 for(int i = 0 ; i < blank ;i ++){
			 result+= " ";
		 }
		 result += n.fruit;
		 d = n.fruit;
		 
		 blank = 16- d.length();
		 for(int j = 0 ; j < blank; j++){
			 result+= " ";
		 }
		 result += n.quantity;
		 return result;
		 
	 }

	@Override
	/**
	 *  The returned string should be printed out according to the format in Section 5.1, 
	 *  exactly the same required for printInventoryN(). 
	 */
	public String toString() {
		// you can do this in two ways you can either call the method printInventory or the one I did here
		// I thought this would be easier as it is going to do bascially same as inverntory method in Node class
		// I wrote twice because I think in this case it would be slighly different that printInventory.
		String r = "fruit   	quantity   	bin\n";
		r = r + "------------------------\n";
		Node temp = headN;
		if (headN == null)
			return r;
		while (temp.nextN != headN) {
			r = r + temp.fruit;

			for (int i = 0; i < (16 - temp.fruit.length()); i++)
				r = r + " ";
			r = r + temp.quantity;

			for (int j = 0; j < (13 - String.valueOf(temp.quantity).length()); j++)
				r = r + " ";
			r = r + " " + temp.bin + "\n";
			temp = temp.nextN;
		}

		{
			r = r + temp.fruit;
			for (int k = 0; k < (16 - temp.fruit.length()); k++)
				r = r + " ";
			r = r + temp.quantity;
			for (int j = 0; j < (13 - String.valueOf(temp.quantity).length()); j++)
				r = r + " ";
			r = r + " " + temp.bin + "\n";

		}
		return r;

	}

	/**
	 * Relocate fruits to consecutive bins starting at bin 1. Need only operate
	 * on the B-list.
	 */
	//
	public void compactStorage() {
		
		// In this we are just relocating the fruits to the particular bins only using bList
		// In this we are just going to lop throught the size nad see if the corresponding bin is what we need !
		Node cur = headB;

		for (int i = 1; i <= size; i++) {
			cur.bin = i;
			cur = cur.nextB;
		}
	}

	/**
	 * Remove all nodes by setting headN = null and headB = null.
	 */
	public void clearStorage() {
		
		// In this we just clear everything so basically initialize to 0 or null.

		headN = null;
		headB = null;
		size = 0;
	}

	/**
	 * Split the list into two doubly-sorted lists DST1 and DST2. Let N be the
	 * total number of fruit types. Then DST1 will contain the first N/2 types
	 * fruits in the alphabetical order. DST2 will contain the remaining fruit
	 * types. The algorithm works as follows.
	 * 
	 * 1. Traverse the N-list to find the median of the fruits by name. 2. Split
	 * at the median into two lists: DST1 and DST2. 3. Traverse the B-list. For
	 * every node encountered add it to the B-list of DST1 or DST2 by comparing
	 * node.fruit with the name of the median fruit.
	 * 
	 * @return the two doubly-sorted lists DST1 and DST2 as a pair.
	 */
	public Pair<DoublySortedList> split() {

		if (size == 1) { // Only for one type, so if it one type
			DoublySortedList num1 = new DoublySortedList(1, headN, headB); // create a list to store
			DoublySortedList num2 = new DoublySortedList(0, null, null);  // created another a list to store
			
			// store both the list in one
			Pair connect = new Pair(num1, num2);

			return connect;
		}
		
		// Here we just see the nList and loop through the middle of the size and see what is the next element
		// and after that you need to join each other in such a way that all points are connected to some elements.
		Node CurrNList = headN;

		for (int i = 0; i < size / 2; i++) { // This is for the second list
			CurrNList = CurrNList.nextN;
		}

		CurrNList.previousN.nextN = headN; // this will create 2 types
		headN.previousN = CurrNList.previousN;
		headN.previousN.nextN = CurrNList;
		CurrNList.previousN = headN.previousN;

		Node no1 = headN; // This is for nList
		Node no2 = CurrNList;

		Node current = headB; // from here it will start bList

		Node B1 = null; // This is for bList
		Node B2 = null;

		Node temper1 = null; // keep track of the temp 
		Node temper2 = null;
		int min = 0;		// keep track of the lowest
		int max = 0;		// keep track of the highest

		for (int i = 0; i < size; i++) { // This will help to re arrange bList as we need to rearrange after certian time.
			if (current.fruit.compareTo(CurrNList.fruit) < 0) {
				if (B1 == null) {
					B1 = current;
					temper1 = current;
					min++;
				} else if (min != size / 2) {
					temper1.nextB = current;
					current.previousB = temper1;
					temper1 = current;
					min++;
				} else {
					temper1.nextB = current;
					current.previousB = temper1;
					current.nextB = B1;
					B1.previousB = current;
				}
			}
			
			// If the above case is wrong we will use the another type and do the same thing and write B2 instead of B1 list
			// and Increment the max all the time instead of min
			else {
				if (B2 == null) {
					B2 = current;
					temper2 = current;
					max++;
				} else if (max != (size - (size / 2))) {
					temper2.nextB = current;
					current.previousB = temper2;
					temper2 = current;
					max++;
				} else {
					temper2.nextB = current;
					current.previousB = temper2;
					current.nextB = B2;
					B2.previousB = current;
				}
			}
			current = current.nextB;
		}
		
		// Same as we did before.

		DoublySortedList list1 = new DoublySortedList(size / 2, no1, B1);         
		DoublySortedList list2 = new DoublySortedList(size - size / 2, no2, B2);

		Pair connect2 = new Pair(list1, list2);
		return connect2;
	}

	/**
	 * Perform insertion sort on the doubly linked list with head node using a
	 * comparator object, which is of either the NameComparator or the
	 * Bincomparator class.
	 * 
	 * Made a public method for testing by TA.
	 * 
	 * @param name
	 *            sort the N-list if true and the B-list otherwise.
	 * @param comp
	 */
	@SuppressWarnings("unused")
	public void insertionSort(boolean NList, Comparator<Node> comp) {
		// In this method we are just going to use Nlist and comparator to compare 
		Node i, j, t, q, qq; // created various nodes to keep track of various elements
		Node prevHead;		// created to keep track of the previous
		if (NList) {		
			i = headN;
			prevHead = headN;
			if ((i == null) || (i.nextN == null))
				return;
			i = i.nextN;

			while (i != headN) {	// Looping through and see if it not qual to the head and after that just see weather all the heads are 
				// connected to correspoding edges
				j = i;

				while ((j != headN) && (comp.compare(j.previousN, i) > 0)) {
					if (prevHead.equals(j.previousN)) {
						headN = j;
						prevHead = j;
					}
					t = j.previousN.previousN;
					q = j.nextN;
					qq = j.nextN.nextN;

					Node n1;
					Node n2;

					n1 = j.previousN;
					n2 = j.nextN;
					j.previousN = t;
					t.nextN = j;
					j.nextN = n1;
					n1.previousN = j;
					n1.nextN = n2;
					n2.previousN = n1;
				}
				i = i.nextN;
			}
		} 
		// in this case it is completely opposite you just have to look at hte bList and connect the edges to particular edges
		else {
			i = headB;
			prevHead = headB;

			if ((i == null) || (i.nextB == null))
				return;
			i = i.nextB;

			while (i != headB) {
				j = i;

				while ((j != headB) && (comp.compare(j.previousB, i) > 0)) {
					if (prevHead.equals(j.previousB)) {
						headB = j;
						prevHead = j;
					}

					t = j.previousB.previousB;
					q = j.nextB;
					qq = j.nextB.nextB;

					Node n1;
					Node n2;

					n1 = j.previousB;
					n2 = j.nextB;
					j.previousB = t;
					t.nextB = j;
					j.nextB = n1;
					n1.previousB = j;
					n1.nextB = n2;
					n2.previousB = n1;
				}
				i = i.nextB;
			}
		}
	}

	/**
	 * Sort an array of fruit names using quicksort. After sorting, bin[i] is
	 * the storage for fruit name[i].
	 * 
	 * Made a public method for testing by TA.
	 * 
	 * @param size
	 *            number of fruit names
	 * @param fruit
	 *            array of fruit names
	 * @param quant
	 *            array of fruit quantities
	 */
	public void quickSort(String fruit[], Integer quant[], int size) {
		// I created a helper method so that it will keep track of the fruit, quant and last and first      
		quickSorted(fruit, quant, 0, size - 1);
	}

	// --------------
	// helper methods
	// --------------
	/**
	 * I created this helper method so that I can use this method in varios classes like quicksort and bulksell and restock 
	 * in this method I bascially use the partiiton as mentioned in the discriptiona and see initizile them all.
	 * 
	 * @param fruit
	 * @param quant
	 * @param i
	 * @param j
	 */
	private void quickSorted(String[] fruit, Integer[] quant, int i, int j) {

		if (i >= j) {
			return;
		}
		int part = partition(fruit, quant, i, j); // this is from the partition method
		quickSorted(fruit, quant, i, part - 1);	   
		quickSorted(fruit, quant, part + 1, j);	   

	}

	/**
	 * Add a node between two nodes prev and next in the N-list. Update headN if
	 * the added node becomes the first node on the list in the alphabetical
	 * order of fruit name.
	 * 
	 * @param node
	 * @param prev
	 * @param next
	 */
	private void insertN(Node node, Node prev, Node next) {
		// In this method bascially we only use nList and check all the condition and updated the head if and only the node is
		// at the first and it is in alphabetical order
		if (prev == null && next == null) {
			headN = node;
		// in this case we just join each other
		} else if (next == headN && node.bin < next.bin) {
			prev.nextN = node;
			node.previousN = node;
			node.previousN = prev;
			node.nextN = next;
			headN = node;
		} else {
			prev.nextN = node;
			next.previousN = node;
			node.previousN = prev;
			node.nextN = next;
		}
	}

	/**
	 * Add a node between two nodes prev and next in the B-list. Update headB if
	 * the added node becomes the first node on the list in the order of bin
	 * number.
	 * 
	 * @param node
	 * @param prev
	 * @param next
	 */
	private void insertB(Node node, Node prev, Node next) {
		// This method basically only uses bList and check all the conditions and updates the head if and only of the node is the first node
		// and it should be in the order of bin number 
		if (prev == null && next == null) {
			headB = node;
			
		// in this case we just join each other 
		} else if (next == headB && node.bin < next.bin) {
			prev.nextB = node;
			node.previousB = node;
			node.previousB = prev;
			node.nextB = next;
			headB = node;
		} else {
			prev.nextB = node;
			next.previousB = node;
			node.previousB = prev;
			node.nextB = next;
		}
	}

	/**
	 * Remove node from both linked lists. Check if node is headN or headB, and
	 * reset the corresponding link if yes. If the both lists become empty, set
	 * headN and headB to null.
	 * 
	 * @param node
	 */
	private void remove(Node node) {
		
		// In this method if we are planning to remove something from the list we have to go to that particular node and remove it and decrement the size
		
		// In this statement I am checking weather the head of the nList is null or the next head is null
		
		if (size == 1) {
			headN = null;
			headB = null;
			return;
		}
		
		// checking if the head the node we are trying to remove of bList
		if (headB == node) {
			headB = node.nextB;
		}
		// same as before but of nList
		if (headN == node) {
			headN = node.nextN;
		}
		// joining all the edges to each other
		Node previous = node.previousB;
		Node next = node.nextB;
		next.previousB = previous;
		previous.nextB = next;
		previous = node.previousN;
		next = node.nextN;
		next.previousN = previous;
		previous.nextN = next;
		size--;
	}

	/**
	 * 
	 * @param name
	 *            name[first, last] is the subarray of fruit names
	 * @param bin
	 *            bin[first, last] is the subarray of bins storing the fruits.
	 * @param first
	 * @param last
	 */
	private static int partition(String fruit[], Integer quant[], int first,
			int last) {
		Random g = new Random();  // making a random so that the bigO is shorter
		int Temp;				// to store temp variables
		Temp = quant[0];
		quant[0] = quant[last];
		quant[last] = Temp;
		int p = g.nextInt((last - first) + 1);
		int i = first - 1;
		
		// looping through and seeing if it is smaller than the respective quant 
		for (int k = first; k < last; k++) {
			if (quant[k] <= quant[p]) {
				i++;
				int temp = quant[i];
				quant[i] = quant[k];
				quant[k] = temp;
				String fruits = fruit[i];
				fruit[i] = fruit[k];
				fruit[k] = fruits;
			}
		}
		// initilizing them to each other.
		int secTemp = quant[i + 1];
		quant[i + 1] = quant[last];
		quant[last] = secTemp;
		String temp = fruit[i + 1];
		fruit[i + 1] = fruit[last];
		fruit[last] = temp;

		return i + 1;
	}
// This is just for testing 
//	public static void main(String[] args){
//		String inverntoryFile = "inventory.txt";
//		try{
//			DoublySortedList DSL = new DoublySortedList(inverntoryFile);
//			
//		}
//		catch (Exception e){
//			e.printStackTrace();
//		}
//	}
}
