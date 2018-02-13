package edu.iastate.cs228.hw1;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;
import java.util.Random;

/**
 * 
 * The world is represented as a square grid of size width X width.
 * 
 * @author jbpatel
 * 
 */
public class World {
	private int width; // grid size: width X width

	public Living[][] grid;

	/**
	 * Default constructor reads from a file
	 */
	public World(String inputFileName) throws FileNotFoundException {
		// Assumption: The input file is in correct format.
		//
		// You may create the grid world in the following steps:
		//
		// Reads the first line to determine the width of the grid.
		//
		File file = new File(inputFileName);
		Scanner scanner = new Scanner(new FileInputStream(file));
		String line = scanner.nextLine();
		String[] parts = line.split(" ");
		width = parts.length;
		scanner.close();
		scanner = null;
		scanner = new Scanner(new FileInputStream(file)); // reset of beginning
		//
		// Creates a grid object.
		//
		grid = new Living[width][width];
		// 3) Fills in the grid according to the input file.
		//
		int i = 0, j = 0;
		while (scanner.hasNext()) {
			line = scanner.nextLine();
			parts = line.split(" ");
			j = 0;
			for (String part : parts) {
				grid[i][j] = generateLiving(part, this, i, j, 0);
				j++;
			}
			i++;
		}
		// Be sure to close the input file when you are done.
		scanner.close();
	}

	/**
	 * Constructor that builds a w X w grid without initializing it.
	 * 
	 * @param width
	 *            the grid
	 */
	public World(int w) {
		width = w;
		grid = new Living[w][w];
	}

	public int getWidth() {
		return width; // to be modified
	}

	/**
	 * Initialize the world by randomly assigning to every square of the grid
	 * one of BADGER, FOX, RABBIT, GRASS, or EMPTY.
	 */
	public void randomInit() {
		Random generator = new Random();
		int min = 1, max = 5;
		for (int i = 0; i < width; i++) {
			for (int j = 0; j < width; j++) {
				int randomNum = generator.nextInt((max - min) + 1) + min;
				Living living = generateLiving(randomNum, this, i, j, 0);
				grid[i][j] = living;
			}
		}
	}

	private Living generateLiving(int random, World world, int i, int j, int age) {
		Living living = null;
		switch (random) {
		case 1:
			Badger badger = new Badger(this, i, j, 0);
			living = badger;
			break;
		case 2:
			Fox fox = new Fox(this, i, j, 0);
			living = fox;
			break;
		case 3:
			Rabbit rabbit = new Rabbit(this, i, j, 0);
			living = rabbit;
			break;
		case 4:
			Grass grass = new Grass(this, i, j);
			living = grass;
			break;
		case 5:
			Empty empty = new Empty(this, i, j);
			living = empty;
			break;
		default:
			break;
		}
		return living;
	}

	private Living generateLiving(String s, World world, int i, int j, int age) {
		Living living = null;
		if (s.equals("B")) {
			Badger badger = new Badger(this, i, j, 0);
			living = badger;
		} else if (s.equals("F")) {
			Fox fox = new Fox(this, i, j, 0);
			living = fox;
		} else if (s.equals("R")) {
			Rabbit rabbit = new Rabbit(this, i, j, 0);
			living = rabbit;
		} else if (s.equals("G")) {
			Grass grass = new Grass(this, i, j);
			living = grass;
		} else if (s.equals("E")) {
			Empty empty = new Empty(this, i, j);
			living = empty;
		} else {
			// assumption is valid input file,
			// so never come here
		}
		return living;
	}

	/**
	 * Write the world grid as a string according to the output format.
	 */
	@Override
	public String toString() {
		String world = "";
		for (int i = 0; i < width; i++) {
			for (int j = 0; j < width; j++)
				world += grid[i][j].who().name().charAt(0) + " ";
			world += "\n";
		}
		return world;
	}

	/**
	 * Write the world grid to an output file. Useful for a randomly generated
	 * world.
	 * 
	 * @throws FileNotFoundException
	 */
	public void write(String outputFileName) throws FileNotFoundException,
			IOException {
		// 1. Open the file.
		File file = new File(outputFileName);
		FileWriter fw = new FileWriter(file.getAbsoluteFile());
		BufferedWriter bw = new BufferedWriter(fw);
		// Write to the file. The five life forms are represented by
		// characters
		// B, E, F, G, R. Leave one blank space in between. Examples are given
		// in
		// the project description.
		//
		bw.write(this.toString());
		// Close the file.
		bw.close();
	}
}
