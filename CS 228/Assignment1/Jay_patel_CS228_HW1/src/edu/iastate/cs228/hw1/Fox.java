package edu.iastate.cs228.hw1;


/**
 * A fox eats rabbits and competes against a badger. 
 * 
 * @author jbpatel
 */
public class Fox extends Living 
{
	private int age; 
	
	/**
	 * Constructor 
	 * @param w: world
	 * @param r: row position 
	 * @param c: column position
	 * @param a: age 
	 */
	public Fox (World w, int r, int c, int a) 
	{
		this.world = w;
		this.row = r;
		this.column = c;
		this.age =a;
	}
	
	/**
	 * A fox occupies the square. 	 
	 */
	public State who()
	{
		return State.FOX; 
	}
	
	/**
	 * A fox dies of old age or hunger or attack by one or more badgers. 
	 * @param wNew  world of the next cycle
	 * @return Living  life form occupying the square in the next cycle. 
	 */
	public Living next(World wNew)
	{
		// See Living.java for an outline of the function. 
		// See the project description for the survival rules for a fox. 
		Living next = null;
		//grow one year older when the next cycle starts
		int newage = age + 1;
		int [] population = new int [5];
		census(population);
		int badgers = population[0];
		int foxes = population[2];
		int rabbits = population[4];
		// Empty if the fox is currently at age 5
		if(newage == 5)
			next = new Empty(wNew,row,column);
		// otherwise, badger if there are at least as many badgers as foxes in the neighborhood
		else if(badgers >= foxes) 
			next = new Badger(wNew,row, column,0);
		//otherwise empty is badgers and foxes together outnumber rabbits in the neighborhood
		else if ((badgers + foxes) > rabbits)
			next = new Empty(wNew, row,column);
		// otherwise fox will live on
		else
			next = new Fox(wNew, row,column,age);
		return next; 
	}
}
