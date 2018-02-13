package pa4;

public class MilesToKilometer {

	public static void main(String[] args) {

		System.out.println("Miles\tKilometers");

		    int miles = 0;
		    double KiloMeters = 0;
		    
		    for (int i = 0; i <= 9; miles+=10, i++) {
		    	KiloMeters = (8*miles)/5;
		      System.out.println(miles + "\t" + KiloMeters);
		      
		    }
	}

}