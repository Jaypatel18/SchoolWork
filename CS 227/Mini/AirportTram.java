package mini1;

/**
 * In this program we are programing when and where the passengers get off and
 * get in.
 * 
 * @author Jay
 * 
 */
public class AirportTram {

	private int CurrStops; // current stop

	private int MaxStops; // num of stops

	private int totalPassenger; // total passengers

	private int CurrPassenger; // How many passenger on the train

	private int maxPassengers; // Max we can fit in the train

	private int count; // counts the number

	private int numStops; // how many stops it has to stop

	private int seg; // Take care of the segments

	private double AveragePassenger; // keep track of the average passengers

	private int intialStops;// keep track of the Stops where passengers want to stop.
	
	private int previousPassenger; // keep track of the passengers which got off from tram.

	private int totalOnTramPassengers; // Keep track of the passenger who are in tram right now.
 
	/**
	 * This is the constructor where I usually put everything as 0 i.e it should
	 * be default 0
	 * 
	 * @param givenNumberOfStops
	 * @param givenInitialStop
	 */

	public AirportTram(int givenNumberOfStops, int givenInitialStop) {
		MaxStops = givenNumberOfStops;
		CurrStops = givenInitialStop;
		CurrPassenger = 0;
		totalPassenger = 0;
		maxPassengers = 0;
		numStops = givenNumberOfStops;
		seg = 0;
		intialStops = givenInitialStop;
		previousPassenger = 0;
	}

	/***
	 * 
	 * In here you have to keep the capacity of the bus as 20.
	 */
	public static final int MAX_CAPACITY = 20;

	/**
	 * 
	 * In this method you just have to return AveragePassenger as I have already
	 * kept that in runSegment.
	 * 
	 * @return AveragePassenger
	 */
	public double getAveragePassengersPerSegment() {
		return AveragePassenger;
	}

	/**
	 * In this method, it keep track of the passengers which are in the tram.
	 * 
	 * @return CurrPassenger
	 */
	public int getCurrentPassengers() {
		return CurrPassenger;
	}

	/**
	 * In this method it keep track of the stops, how many stops they have.
	 * 
	 * @return CurrStops
	 */
	public int getCurrentStop() {
		return CurrStops;
	}

	/**
	 * In this method you have to keep track how many passengers are in the bus
	 * and how many passengers are allowed to sit in the tram.
	 * 
	 * @return maxPassengers
	 */
	public int getMaxPassengers() {
		return maxPassengers;

	}

	/**
	 * In this method you have to keep track of the people who are served in the
	 * tram.
	 * 
	 * @return totalPassenger
	 */
	public int getTotalPassengersServed() {
		return totalPassenger;
	}

	/**
	 * In this method you have to reset everything back to normal.
	 * 
	 * @param givenInitialStop
	 */
	public void restart(int givenInitialStop) {
		CurrPassenger = 0;
		totalPassenger = 0;
		CurrStops = givenInitialStop;
		maxPassengers = 0;
		seg = 0;
		intialStops = givenInitialStop;
		previousPassenger = 0;

	}

	/**
	 * In this method you have to keep track of each and every method of the
	 * code and help every method to be in this method.
	 * 
	 * @param passengersOff
	 * @param passengersAdded
	 */
	public void runSegment(int passengersOff, int passengersAdded) {
		if (CurrPassenger  - passengersOff < 0) {
			CurrPassenger = 0;
		}
		else {
			CurrPassenger = CurrPassenger- passengersOff;
		}
		
		if (CurrPassenger + passengersAdded  > MAX_CAPACITY) {
			totalPassenger = totalPassenger + MAX_CAPACITY - CurrPassenger;
			CurrPassenger = MAX_CAPACITY;

		} else {
			totalPassenger = totalPassenger + passengersAdded;
			CurrPassenger = CurrPassenger + passengersAdded;
			
		}
		maxPassengers = Math.max(CurrPassenger, maxPassengers);
		previousPassenger = CurrPassenger;
		totalOnTramPassengers = totalOnTramPassengers + CurrPassenger;

		seg = seg + 1;
		CurrStops = intialStops + seg;
		CurrStops = CurrStops % numStops;

		AveragePassenger = (double) totalOnTramPassengers / seg;

	}

}
