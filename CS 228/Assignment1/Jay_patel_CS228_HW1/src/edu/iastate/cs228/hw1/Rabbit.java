package edu.iastate.cs228.hw1;

/*
 * A rabbit eats grass and lives no more than three years.
 * 
 * @author jbpatel
 */
public class Rabbit extends Living {
	private int age;

	/**
	 * Creates a Rabbit object.
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
	public Rabbit(World w, int r, int c, int a) {
		this.world = w;
		this.row = r;
		this.column = c;
		this.age = a;
	}

	// Rabbit occupies the square.
	public State who() {
		return State.RABBIT;
	}

	/**
	 * A rabbit dies of old age or hunger, or it is eaten by a badger or a fox.
	 * 
	 * @param wNew
	 *            world of the next cycle
	 * @return Living new life form occupying the same square
	 */
	public Living next(World wNew) {
		// See Living.java for an outline of the function.
		// See the project description for the survival rules for a rabbit.
		Living next = null;
		// grow one year older when the next cycle starts.
		int newage = age + 1;
		int[] population = new int[5];
		census(population);
		int badgers = population[0];
		int foxes = population[2];
		int rabbits = population[4];
		int grasses = population[3];
		// Empty if the Rabbit's current age is 3;
		if (newage == 3)
			next = new Empty(wNew, row, column);
		// otherwise, Empty if there is no Grass in the neighborhood (the
		// rabbit needs food);
		else if (grasses < 1)
			next = new Empty(wNew, row, column);
		//otherwise, Empty if there are at least as many Foxes and Badgers combined as Rabbits in the neighborhood;
		else if ((foxes + badgers) >= rabbits)
			next = new Empty(wNew, row, column);
		// otherwise, Rabbit (the rabbit will live on).
		else
			next = new Rabbit(wNew, row, column, age);
		return next;
	}
}
