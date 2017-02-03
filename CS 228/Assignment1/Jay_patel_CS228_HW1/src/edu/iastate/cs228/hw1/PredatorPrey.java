package edu.iastate.cs228.hw1;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 
 * The PredatorPrey class does the predator-prey simulation over a grid world
 * with squares occupied by badgers, foxes, rabbits, grass, or none.
 * 
 * @author jbpatel
 * 
 */
public class PredatorPrey {
	/**
	 * Update the new world from the old world in one cycle.
	 * 
	 * @param wOld
	 *            old world
	 * @param wNew
	 *            new world
	 */
	public static void updateWorld(World wOld, World wNew) {
		// For every life form (i.e., a Living object) in the grid wOld,
		// generate
		// a Living object in the grid wNew at the corresponding location such
		// that
		// the former life form changes into the latter life form.
		//
		// Employ the method next() of the Living class.
		for (int i = 0; i < wOld.getWidth(); i++) {
			for (int j = 0; j < wOld.getWidth(); j++) {
				wNew.grid[i][j] = wOld.grid[i][j].next(wNew);
			}
		}
	}
	/**
	 * Repeatedly generates worlds either randomly or from reading files. Over
	 * each world, carries out an input number of cycles of evolution.
	 * 
	 * @param args
	 * @throws FileNotFoundException
	 */
	public static void main(String[] args) throws FileNotFoundException {
		// Generate predator-prey simulations repeatedly like shown in the
		// sample run in the project description.
		//
		// 1. Enter 1 to generate a random world, 2 to read a world from an
		// input
		// file, and 3 to end the simulation. (An input file always ends with
		// the suffix .txt.)
		//
		// testUpdateWorld();
		System.out.println("The Predator-Prey Simulator");
		System.out.println("keys: 1 (random world) 2 (file input) 3 (exit)");
		System.out.println();
		int trial = 1;
		int key = -1;
		// open up standard input
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		while (true)
			try {
				int gridW = -1;
				String filename = null;
				World w = null;
				System.out.println("Trial " + trial++ + ": ");
				key = Integer.valueOf(br.readLine());
				// (Any number other than 1 and 2 could have ended the
				// simulation.
				if (key == 1) {
					System.out.println("Random world");
					System.out.println("Enter grid width: ");
					gridW = Integer.valueOf(br.readLine());
					w = new World(gridW);
					w.randomInit();
				} else if (key == 2) {
					System.out.println("World input from a file");
					System.out.println("File name: ");
					filename = br.readLine();
					w = new World(filename);
				} else
					System.exit(1);
				System.out.println("Enter the number of cycles: ");
				int cycles = -1;
				while (cycles < 1) {
					cycles = Integer.valueOf(br.readLine());
				}
				// 4. Print out initial and final worlds only. No intermediate
				// worlds should
				// appear in the standard output. (When debugging your program,
				// you can
				// print intermediate worlds.)
				//
				System.out.println("Initial world:");
				System.out.println();
				System.out.println(w.toString());
				System.out.println();

				int c = 0;
				World updated = w;
				while (c < cycles) {
					w = updated;
					updated = new World(w.getWidth());
					updateWorld(w, updated);
					c++;
				}

				System.out.println("Final world:");
				System.out.println();
				System.out.println(updated.toString());
			} catch (IOException ioe) {

			}

		// 2. Print out standard messages as given in the project description.
		//
		// 3. For convenience, you may define two worlds even and odd as below.
		// In an even numbered cycle (starting at zero), generate the world
		// odd from the world even; in an odd numbered cycle, generate even
		// from odd.

		// World even = new World (0); // the world after an even number of
		// cycles
		// World odd; // the world after an odd number of cycles

		// 4. Print out initial and final worlds only. No intermediate worlds
		// should
		// appear in the standard output.
		// (When debugging your program, you can
		// print intermediate worlds.)
		//

		// 5. You may save some randomly generated worlds as your own test
		// cases.
		//
		// 6. It is not necessary to handle file input & output exceptions for
		// this
		// project. Assume data in an input file to be correctly formated.

	}
}
