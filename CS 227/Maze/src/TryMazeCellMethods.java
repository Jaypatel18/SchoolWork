import java.util.ArrayList;

import maze.Maze;
import maze.MazeCell;


public class TryMazeCellMethods
{
  public static void main(String[] args)
  {
    // Create the maze from the string description
    Maze maze = new Maze(RunSearcher.MAZE2);   

    // Get and examine the start cell
    MazeCell c = maze.getStart();
    System.out.println("Start cell: " + c);
    System.out.println("Start cell status: " + c.getStatus());

    // Take a look at its neighbors
    ArrayList<MazeCell> neighbors = c.getNeighbors();
    System.out.println("Start cell neighbor list: " + neighbors);
    c = neighbors.get(0);
    System.out.println("Status for " + c + ": " + c.getStatus());
    
    // Look at the neighbor's neighbors
    neighbors = c.getNeighbors();
    System.out.println("Neighbor list for " + c + ": " + neighbors);
    System.out.println("Status for neighbors: ");
    for (MazeCell mc : neighbors)
    {
      System.out.println("  Status for " + mc + ": " + mc.getStatus());
    }
  }
}
