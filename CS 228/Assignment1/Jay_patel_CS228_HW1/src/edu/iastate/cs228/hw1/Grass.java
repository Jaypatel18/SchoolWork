package edu.iastate.cs228.hw1;


/**
 * Grass remains if more than rabbits in the neighborhood;
 * otherwise, it is eaten. 
 * 
 * @author jbpatel
 *
 */
public class Grass extends Living 
{
	public Grass (World w, int r, int c) 
	{
		this.world = w;
		this.row = r;
		this.column = c;
	}
	
	public State who()
	{
		return State.GRASS;
	}
	
	/**
	 * Grass can be eaten out by rabbits in the neighborhood. 
	 */
	public Living next(World wNew)
	{
		// See Living.java for an outline of the function. 
		// See the project description for the survival rules for grass. 
		Living next = null;
		int [] population = new int [5];
		census(population);
		int badgers = population[0];
		int foxes = population[2];
		int rabbits = population[4];
		int grasses = population [3];
		//Empty is at least twice as many rabbits as grasses in the neighborhood
		if(grasses >= (2 * rabbits))
			next = new Empty(wNew, row, column);
		//otherwise, rabbits if there are more rabbbits than grasses in the neighbourhood
		else if(rabbits > grasses)
			next = new Rabbit(wNew,row,column,0);
		//otherwise grass
		else
			next = new Grass(wNew,row,column);
		return next; 
	}
}
