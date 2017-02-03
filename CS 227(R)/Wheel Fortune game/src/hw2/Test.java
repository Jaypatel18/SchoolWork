package hw2;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Test {

	public static void main(String[] args) throws FileNotFoundException {
		//GameWheel (Spin)
		GameWheel game = new GameWheel();
		System.out.println(game.getRotation());
		game.spin(600);
		System.out.println(game.getRotation());
		
		//GameWheel(getSegmnet)
		game.getSegmentValue();
		System.out.println(game.getSegmentValue());
		
		
//		char[] list = new char[3];
//		list[0]='s';
//		list[1]='a';
//		list[2]='y';
//		System.out.println(String.valueOf(list));
//		
		// GamePhraseList (getPhrase)
//		File file = new File("Phrase.txt");
//		GamePhraseList game =  new GamePhraseList("Phrase.txt");
//		System.out.println(game.getPhrase(4));
//		System.out.println(game.getSize());
//	}
		//GameText
		
//		GameText hidden = new GameText("HELLO, WORLD!");
//		 char[] displayed = hidden.getDisplayedText();
//		 System.out.println(new String(displayed));
//		 hidden.update('L');
//		 displayed = hidden.getDisplayedText();
//		 System.out.println(new String(displayed));
	}
}

