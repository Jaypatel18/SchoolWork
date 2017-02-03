package edu.iastate.cs228.hw1;

/**
 * A badger eats rabbits and competes against a fox.
 * 
 * @author jbpatel
 */
public class Badger extends Living {
	private int age;

	/**
	 * Constructor
	 * 
	 * @param w
	 *            : world
	 * @param r
	 *            : row position
	 * @param c
	 *            : column position
	 * @param a
	 *            : age
	 */
	public Badger(World w, int r, int c, int a) {
		this.world = w;
		this.row = r;
		this.column = c;
		this.age = a;
	}

	/**
	 * A badger occupies the square.
	 */
	public State who() {
		return State.BADGER;
	}

	/**
	 * A badger dies of old age or hunger, or from an attack by a group of foxes
	 * when alone.
	 * 
	 * @param wNew
	 *            world of the next cycle
	 * @return Living life form occupying the square in the next cycle.
	 */
	public Living next(World wNew) {
		// See Living.java for an outline of the function.
		// See the project description for the survival rules for a fox.
		Living next = null;
		int newage = age + 1;
		int[] population = new int[5];
		census(population);
		int badger = population[0];
		int foxes = population[2];
		int rabbits = population[4];
		// Empty if badger is currently at age 4
		if (newage == 4)
			next = new Empty(wNew, row, column);
		// Fox, if there is only one Badger but there are more than one fox in
		// the neighborhood
		else if ((badger == 1) && (foxes > 1))
			next = new Fox(wNew, row, column, 0);
		// Empty, if Badgers and Foxes together out number Rabbits in the
		// neighborhood
		else if ((badger + foxes) > rabbits)
			next = new Empty(wNew, row, column);
		// Badger will live on
		else
			next = new Badger(wNew, row, column, age);
		return next;
	}
}
