package hw1;

public class ParkingMeter {
	
	/** 
	 * Value of dime coin in cents. 
	 */ 
	 public static final int DIME_VALUE = 10; 
	 
	 /** 
	 * Value of nickel coin in cents. 
	 */ 
	 public static final int NICKEL_VALUE = 5; 
	 
	 /** 
	 * Value of quarter coin in cents. 
	 */ 
	 public static final int QUARTER_VALUE = 25; 
	 
private int MinutesForNickel;

private int MinutesForDime;

private int MinutesForQuarter;

private int MaxTime;

private int MaxCoins;

private int time; {   
	if (time < 0){
		time = 0;
	}
	if (time > MaxTime) {
		time = MaxTime;
	}
}	

private int coins; 

private int value;{
	if (value < 0) {
		value = 0;
	}
	
}



public ParkingMeter(int givenMinutesForNickel,
					int givenMinutesForDime, 
					int givenMinutesForQuarter, 
					int givenMaxTime, 
					int givenMaxCoins) {
	MinutesForNickel = givenMinutesForNickel;
	MinutesForDime = givenMinutesForDime;
	MinutesForQuarter = givenMinutesForQuarter;
	MaxTime = givenMaxTime;
	MaxCoins = givenMaxCoins;
	time = 0;
	coins = 0;
	value = 0;
	
	}

public void emptyCoins() {  // gives the values of emptycoins.
	coins = 0;
	value=0;
}

public int getCents() {  //It returns the price of cents
	int cents;
	cents =value ;
	return cents;
}

public String getDollarString() { // returns the dollarstring and gives the value of time
	int dollar;
	dollar = value/100;
	int cents;
	cents = value % 100;
	
	return String.format("%01d", dollar) + "." + String.format("%02d", cents);
} 

public String getHourMinuteString() { // gives the time in the format of hours and minutes.
	int hh;
	hh = time/60;
	int mm;
	mm = time % 60;
	
	return String.format("%02d", hh) + ":" + String.format("%02d", mm);
	
}
	
public int getMinutesRemaining() { // after inserting it gives how much time i remaining.
	return time;
	
}

public int getTotalCoins() { //this return the value of coins
	return coins;
}
 
public void insertDimes(int howMany) {  //this method is for if you insert time it will show minutes 
	
	if (howMany < 0) {  // also if its less than required then it gives error
		howMany = 0;
	}
	if (howMany>MaxCoins)
		howMany=MaxCoins;
	else {
		howMany=howMany;
	}
	value = value + (DIME_VALUE * howMany); //gives the value for coins and time
	coins = coins + howMany;
	if (coins>MaxCoins)
		coins=MaxCoins;
	else {
		coins=coins;
	}
	time = time + (MinutesForDime * howMany); //will give how much time is added and show the time
	if (time>MaxTime)
		time=MaxTime;
	else {
		time=time;
	}
	
	
		
	
}

public void insertNickels(int howMany) { // this method is for if you insert time it will show minutes 
	
	if (howMany < 0) { // also if its less than required then it gives error
		howMany = 0;
	}
	if (howMany>MaxCoins)
		howMany=MaxCoins;
	else {
		howMany=howMany;
	}

	value = value + (NICKEL_VALUE * howMany); //gives the value for coins and time
	coins = coins + howMany;
	if (coins>MaxCoins)
		coins=MaxCoins;
	else {
		coins=coins;
	}
	time = time + (MinutesForNickel * howMany); //will give how much time is added and show the time
	if (time>MaxTime)
		time=MaxTime;
	else {
		time=time;
	}
}

public void insertQuarters(int howMany) { // this method is for if you insert time it will show minutes 
	if (howMany < 0) { // also if its less than required then it gives error
		howMany = 0;
	}
	if (howMany>MaxCoins)
		howMany=MaxCoins;
	else {
		howMany=howMany;
	}

	value = value + (QUARTER_VALUE * howMany); //gives the value for coins and time
	coins = coins + howMany;
	if (coins>MaxCoins)
		coins=MaxCoins;
	else {
		coins=coins;
	}
	time = time + (MinutesForQuarter * howMany); //will give how much time is added and show the time
	if (time>MaxTime)
		time=MaxTime;
	else {
		time=time;
	}
}

public boolean isExpired() { //if its expired then it will show time as 0
	return (time == 0);
	
}

public void simulateTime(int minutes) { 
	if (minutes < 0) {
		minutes = 0;
	}
	time = time - minutes;
	time=Math.max(time, 0);
	
}

public String toString(){
	
	return "hw1.ParkingMeter [Time " + time + "/" + MaxTime + ", Coins " + coins + "/" + MaxCoins + ", Value " + value + "]"; 
}

}
