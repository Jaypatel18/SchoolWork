package hw1;

/**
 * This class encapsulates the logic and state for a simplified game of American
 * football.
 * 
 * @author Jay
 */
public class GameState {
	/**
	 * This will help to keep track of the location
	 */

	private int location;
	/**
	 * This is basically score of team0
	 */

	private int score0;
	/**
	 * This is get down, so it will return current down
	 */

	private int down;
	/**
	 * This is basically offense team
	 */

	private int offense;
	/**
	 * This is basically score of team1
	 */

	private int score1;
	/**
	 * This will say how many yards you finished
	 */

	private int numOfYards;

	/**
	 * Number of points awarded for a touch down.
	 */
	public static final int TOUCHDOWN_POINTS = 6;

	/**
	 * Number of points awarded for a successful extra point attempt after a
	 * touch down.
	 */
	public static final int EXTRA_POINTS = 1;

	/**
	 * Number of points awarded for a field goal.
	 */
	public static final int FIELD_GOAL_POINTS = 3;

	/**
	 * Total length of the field from goal line to goal line, in yards.
	 */
	public static final int FIELD_LENGTH = 100;

	/**
	 * Initial position of the offensive team after receiving a kickoff.
	 */
	public static final int STARTING_POSITION = 70;

	/**
	 * In the constructor I wrote all the variables on what value they will
	 * start.
	 * 
	 * @param success
	 * 
	 */
	public GameState() { //
		offense = 0;
		location = STARTING_POSITION;
		down = 1;
		score0 = 0;
		score1 = 0;
		numOfYards = 10;
	}

	/**
	 * In this method it records the result of an extra point attempt, and then
	 * it it adds the EXTRA_POINTS if the attempt was successful
	 * 
	 * @param success
	 */
	public void extraPoint(boolean success) {

		if (success) {
			if (offense == 0) {
				score0 += EXTRA_POINTS;
			} else {
				score1 += EXTRA_POINTS;
			}
		}
		location = STARTING_POSITION;
		down = 1;
		numOfYards = 10;
		offense = 1 - offense;

	}

	/**
	 * This method basically does the same thing like extra point but in this
	 * method we need to add FIELD_GOAL if the goal was successful
	 * 
	 * @param success
	 */
	public void fieldGoal(boolean success) {
		if (success) {
			if (offense == 0) {
				score0 += FIELD_GOAL_POINTS;
			} else {
				score1 += FIELD_GOAL_POINTS;
			}
			offense = 1 - offense;
			numOfYards = 10;
			location = STARTING_POSITION;
		} else {
			offense = 1 - offense;
			numOfYards = 10;
			location = FIELD_LENGTH - location;
		}

	}

	/**
	 * In this method it returns the down basically down is always 4
	 * 
	 * @return down
	 */
	public int getDown() {
		return down;
	}

	/**
	 * In this method it returns the location of the ball as the number of the
	 * yards
	 * 
	 * @return location
	 */
	public int getLocation() {
		return location;
	}

	/**
	 * In this method it return the index for the team currently playing
	 * offense.
	 * 
	 * @return offense
	 */
	public int getOffense() {
		return offense;
	}

	/**
	 * In this method it returns what team got how many scores
	 * 
	 * @param whichTeam
	 * @return score1
	 */
	public int getScore(int whichTeam) {
		if (whichTeam == 0) {
			return score0;
		} else {
			return score1;
		}
	}

	/**
	 * In this method it return the number of yards the offense must advance the
	 * ball too get a first down.
	 * 
	 * @return numOfYards
	 */
	public int getYardsToFirstDown() {
		return numOfYards;
	}

	/**
	 * In this method we need to record the result of the kick
	 * 
	 * @param yards
	 */
	public void punt(int yards) {
		int newLocation;
		if (yards > location) {
			location = FIELD_LENGTH;
		} else {
			newLocation = location - yards;
			location = FIELD_LENGTH - newLocation;
		}
		offense = 1 - offense;
		down = 1;
		numOfYards = 10;
	}

	/**
	 * In this method we need to record the result of advancing the ball the
	 * given number of the yards, so it will be resulting in the various types
	 * of down and touch down
	 * 
	 * @param yards
	 */
	public void runOrPass(int yards) {
		location -= yards;
		if (location < 0) {
			if (offense == 1)
				score1 += TOUCHDOWN_POINTS;

			if (offense == 0)
				score0 += TOUCHDOWN_POINTS;
		} else if (yards >= numOfYards) {
			down = 1;
			numOfYards = 10;
		} else if (down == 4) {
			if (offense == 1) {
				offense = 0;
			} else {
				offense = 1;
			}
			down = 1;
			numOfYards = 10;
			location = FIELD_LENGTH - location;
		} else {
			down += 1;
			numOfYards -= yards;
		}

		if (location > FIELD_LENGTH) {
			location = FIELD_LENGTH;
		}
	}

}