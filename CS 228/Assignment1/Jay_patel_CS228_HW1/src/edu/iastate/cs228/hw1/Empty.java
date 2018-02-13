package edu.iastate.cs228.hw1;


/** 
 * Empty squares are competed by various forms of life.
 * 
 * @author jbpatel
 */
public class Empty extends Living 
{
	public Empty (World w, int r, int c) 
	{
		this.world = w;
		this.row = r;
		this.column = c;
	}
	
	public State who()
	{
		return State.EMPTY;
	}
	
	/**
	 * An empty square will be occupied by Badger, Fox, Rabbit, or Grass, 
	 * or remain empty. 
	 * @param wNew  world of the next life cycle.
	 * @return Living  life form in the next cycle.   
	 */
	public Living next(World wNew)
	{
		// See Living.java for an outline of the function. 
		// See the project description for corresponding survival rules.
		Living next = null;
		int [] population = new int[5];
		census (population);
		int badger = population[0];
		int foxes = population[2];
		int rabbits = population[4];
		int grasses = population[3];
		// Rabbit if more than one neighbor Rabbits
		if(rabbits > 1)
			next = new Rabbit(wNew , row, column ,0);
		// Otherwise,fox if more than one neighboring fox
		else if(foxes > 1)
			next = new Fox(wNew, row, column,0);
		// otherwise, Grass of at least one neighboring grass
		else if(grasses >= 1) 
			next = new Grass(wNew,row,column);
		// otherwise empty
		else
			next = new Empty(wNew, row, column);
		return next; 
	}
}
