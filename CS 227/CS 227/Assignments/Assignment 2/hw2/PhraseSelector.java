package hw2;
/**
 * 
 * @author Jay
 * 
 */
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class PhraseSelector extends java.lang.Object {

	private ArrayList<String> namesList;
	/**
	 * 
	 * 
	 * 
	 * @param givenFilename
	 * @throws FileNotFoundException
	 */
	public PhraseSelector(java.lang.String givenFilename) throws FileNotFoundException {
		// in this constructor I used while loop so that it will throws everything in 
		// in the next line thats why I used nextLine.
		File myFile = new File("words.txt");
		Scanner stdin = new Scanner(myFile);
		namesList = new ArrayList<String>();
		while (stdin.hasNextLine()) {
			namesList.add(stdin.nextLine());
		}
		stdin.close();

	}

	public String selectWord(java.util.Random rand) {
		// in this method I use random because user can put any random number
		// and then I used the % because if the size is bigger then it will use %and 
		// then it will not be more than the size of the list.
		// namesList.get(rand.nextInt());
		
		Random rand1 = new Random();
//		return namesList.get(rand.nextInt()% namesList.size());
		/**
		 * @return 
		 */
		return namesList.get(rand.nextInt(namesList.size()-1));
		
		

	}

}
