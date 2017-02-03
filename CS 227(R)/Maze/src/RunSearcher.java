

import java.util.ArrayList;

import maze.Maze;
import maze.MazeCell;
import maze.MazePanel;
import mini3.Searcher;

public class RunSearcher
{
  public static final String[] MAZE1 = {
    "#######",
    "#  #$ #",
    "# ### #",
    "#   # #",
    "# ### #",
    "#     #",
    "#S#####",
};

  public static final String[] MAZE2 = {
    "#########",
    "#  #$ # #",
    "# ### # #",
    "#   # # #",
    "# ###   #",
    "#     ###",
    "#S#######",
};
  
  public static final String[] MAZE3 = {
    "#######",
    "#  #  #",
    "# ### #",
    "#   # #",
    "# ### #",
    "#     #",
    "#S#####",
};
  
  public static final String[] MAZE4 = {
    "#######",
    "#     #",
    "# ### #",
    "#     #",
    "# ### #",
    "#     #",
    "#S#####",
};

  // maze posted by Anthoni Weise on Piazza, slightly modified 
  // so the solution is unique
  public static final String[] MAZE5= {
  "#############################",
  "#                           S",
  "### #### # ## # ### # # ## ##",
  "# #    # #    #     ##  ##  #",
  "# ###### ###########   #   ##",
  "#        #           ### ## #",
  "########### # #### # # #    #",
  "#           #    # #   # ####",
  "# # # # ### # ## # ##### #  #",
  "#   ### # # #    #    ## #  #",
  "## #  # # # ######### ## ## #",
  "#  ## # # #       # # ##    #",
  "##    # #   ### # # # ##    #",
  "#  ###### # # # # #   #### ##",
  "# #   #       # # ###### ####",
  "# # #### #### ###      #   ##",
  "#   #  # #      ###### # #  #",
  "#   # ## ######    # #    # #",
  "#   #  #       ###   # #### #",
  "#   # ########## ##### #    #",
  "### #                  ######",
  "# ###### # ###########      #",
  "#        #        # ####### #",
  "# ################# #     # #",
  "#                 # ### ### #",
  "# # # ######### #     #     #",
  "## # #   #   # ## ## ########",
  "#      #   #      #         #",
  "#$###########################",
};

public static void main(String[] args)
{
  // Create the maze from the string description
  Maze maze = new Maze(MAZE2);   
  
  // Start the UI, using a 400 millisecond delay between frames
  MazePanel.start(maze, 400);
  
  // Create empty array list to store the path
  ArrayList<MazeCell> path = new ArrayList<MazeCell>();
  
  // Search beginning at the designated start cell
  Searcher.search(maze.getStart(), path);
  
  // Optionally, print the path to check it
  System.out.println(path);
}

  
  
  
}
