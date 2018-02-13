
package mini3;

import java.util.ArrayList;
import java.util.List;

import maze.MazeCell;
import maze.Status;

/**
 * Utility class for searching a maze described by a collection
 * of MazeCell objects.
 */
public class Searcher
{
  /**
   * Recursively searches a given MazeCell and all of its unexplored 
   * neighbors.  Returns true if the current cell is the goal or if
   * the goal is found in a search initiated from this cell by 
   * searching a neighbor.  Returns false if the goal is not found.
   * If the goal is found, then when this method returns, the given
   * ArrayList will contain a path from the current cell to the goal.
   * @param current
   *   the current cell at which a search is being initiated 
   * @param solution
   *   an empty array list
   * @return
   *   true if the goal was found through this search, false otherwise
   */
  public static boolean search(MazeCell current, ArrayList<MazeCell> solution)
  {
	  if(current.getStatus() == Status.GOAL) {
		  solution.add(current);
		  return true;
	  }
	  else {
		  for(int i = 0; i < current.getNeighbors().size(); i++) {
			  MazeCell n = current.getNeighbors().get(i);
			  if(n.getStatus() == Status.UNEXPLORED || n.getStatus() == Status.GOAL) {
				  if(n.getStatus() == Status.UNEXPLORED)
					  n.setStatus(Status.EXPLORING);
				  boolean found = search(n, solution);
				  if(found) {
					  solution.add(current);
					  current.setStatus(Status.SUCCEEDED);
					  return true;
				  }
			  }
		  }
		  current.setStatus(Status.FAILED);
		  return false;
	  }
  }
}
