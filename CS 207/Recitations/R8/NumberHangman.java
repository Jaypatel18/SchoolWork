package R8;

import java.util.Random;
import java.util.Scanner;
public class NumberHangman {
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

	public static void main(String[] args) {
		Random r = new Random();
		int secretnumber = r.nextInt (100);
		boolean gameover = false;
		int guessLeft =6;
		
		while ((!gameover)&& guessLeft > 0){
			printHangman(guessLeft);
			Scanner Stdin = new Scanner (System.in);
			System.out.println ("Guessn left are: " +guessLeft);
			System.out.println("PLease enter the integer");
			int Guesspick = Stdin.nextInt();
			if (Guesspick == secretnumber) {
				System.out.println ("correct guess");
				gameover = true;
			} else if (Guesspick < secretnumber) {
				System.out.println ("Wrong guess. your guess should be greater.");
				guessLeft = guessLeft - 1;
			} else if (Guesspick > secretnumber) {
				System.out.println ("Wrong guess.your guess should be smaller.");
				guessLeft = guessLeft - 1;
			}
		}
		System.out.println("The secret number is: " + secretnumber);
	}

			
			
		
	}

