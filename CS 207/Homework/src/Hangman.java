package R8;

import java.util.Random;
import java.util.Scanner;
public class Hangman {
	public static void main(String[] args) {
		Scanner Stdin=new Scanner(System.in);
		System.out.println("Welcome to hangMan");
		System.out.println("Player 1, Please enter a math. Player 2, Please close your eyes");
		String math = Stdin.next();
		System.out.println("Clearing Screen");
		for(int i=0; i<100;i++){
			System.out.println("");
		}
		String currentword = createPartialWord(math);
		int guessLeft = 6;
		boolean endloop = false;
		
		
		while ((!endloop) && (guessLeft > 0)){
			System.out.println("The current Partial math is: " + currentword );
			System.out.println("The current Hangman picture is");
			printHangman(guessLeft);
			System.out.println("Player 2, You have " + (guessLeft) + " remaining guesses");
			System.out.println("Would you like to guess the secret math or guess a character?");
			System.out.println("Type \"word\" for word, type \"char\" for character");
			String choose = Stdin.next();
			if(choose.equals("word")){
				System.out.println("choose your guess for secret word");
				String guessmath = Stdin.next();
				if(guessmath.equals(math)){
					System.out.println("Correct guess, Player 2 wins. Game Over");
					System.out.println("Here is the current Hangman");
					printHangman(guessLeft);
					endloop = true;
				}else{
					System.out.println("Incorrect guess, Player 1 wins. Game Over");
					System.out.println("The secret word is " + math);
					System.out.println("Here is  the current Hangman");
					printHangman(guessLeft);
					endloop = true;
					
				}
			}else if(choose.equals("char")){
				System.out.println("Please choose a character");
				char playerguess = Stdin.next().charAt(0);
				if (math.indexOf(playerguess)==-1) {
				System.out.println("oops, That charcter does not appear in secret word");
				guessLeft = guessLeft - 1;
				}else {
					System.out.println ("Good, your character apperas in the secret word.");
				}
				String partialmath = currentword;
				currentword= updatePartialmath(currentword,math,playerguess);
				if(currentword.equals(math)){
					endloop = true;
					System.out.println("Correct guess, Player 2 wins. Game Over");
				}else if(guessLeft ==0){
					endloop = true;
					System.out.println("Incorrect guess, Player 1 wins. Game Over");
					printHangman(guessLeft);
					
				}
                               
				
				
			}
			
			}
		
	}
	
	
	public static void printHangman(int guessLeft) {
		String HEAD = " ";
		String BODY = " ";
		String LEGS = " ";
		String LEFTARM = " ";
		String RIGHTARM = " ";
		System.out.println("_____");
		System.out.println("|   |");
		if (guessLeft < 6) {
			HEAD = "()";
		}
		System.out.println("|   " + HEAD);
		if (guessLeft < 5) {
			BODY = "||";
		}
		if (guessLeft < 4) {
			LEFTARM = "\\";
		}
		if (guessLeft < 3) {
			RIGHTARM = "/";
		}
		System.out.println("|  " + LEFTARM + BODY + RIGHTARM);
		if (guessLeft < 2) {
			LEGS = "/";
		}
		if (guessLeft < 1) {
			LEGS += "\\";
		}
		System.out.println("|   " + LEGS);
		System.out.println("|_____\n\n\n\n");
	}
	
	public static String createPartialWord(String secretWord){
		String secret = "";
		for(int i=0;i<secretWord.length();i++){
			secret = secret + "-";			
		}
		return secret;
	}
	
	public static String updatePartialmath(String partial, String secret, char c){
		for(int i=0;i<secret.length();i++){
			if (secret.charAt(i)== c){
				partial =  replaceChar(partial,c,i);	
			}	
		}
		return partial;
	}
	
	public static String replaceChar(String word, char c, int i){
		word = word.substring(0,i) + c + word.substring(i+1,word.length());
		return word;
		
	}


}

				