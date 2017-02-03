package hw2;

/**
 * In this class we are suppose to write the code where it chooses whether the
 * game is over or not or and also there are default guesses in this game so if
 * you guess letter correct before it gets over you win or else you loose the
 * game.
 * 
 * @author Jay
 * 
 */

public class Game extends java.lang.Object {

	private HideableChar[] show;
	private String letterEstimatedSoFar;
	private String[] mystery;
	private int maxWrongGuess;
	private int numOfWrongGuss;
	public static final int DEFAULT_MAX_WRONG_GUESSES = 7;
	private String secretword;

	/**
	 * 
	 * 
	 * 
	 * 
	 * @param word
	 */
	public Game(java.lang.String word) {

		letterEstimatedSoFar = "";
		secretword = word;
		maxWrongGuess = DEFAULT_MAX_WRONG_GUESSES;
		mystery = new String[word.length()];
		for (int i = 0; i < mystery.length; i++) {
			// this loop will go less than the size o
			// of mystery and then it will choose at index i;
			mystery[i] = Character.toString(word.charAt(i));
			// this does exactly the same
			// which I wrote above.
		}
		show = new HideableChar[word.length()];
		for (int i = 0; i < word.length(); i++) {
			// here in this loop it will go less than length of word an then it
			// will
			// iterate ++ at index i;

			show[i] = new HideableChar(word.charAt(i));
		}
	}
	/**
	 * 
	 * 
	 * 
	 * @param word
	 * @param maxGuesses
	 */
	public Game(java.lang.String word, int maxGuesses) {
		letterEstimatedSoFar = "";
		secretword = word;
		maxWrongGuess = maxGuesses;
		mystery = new String[word.length()];
		for (int i = 0; i < mystery.length; i++) {
			// this loop will go less than the size o
			// of mystery and then it will choose at index i;
			mystery[i] = Character.toString(word.charAt(i));
			// this does exactly the same
			// which I wrote above.
		}
		show = new HideableChar[word.length()];
		for (int i = 0; i < word.length(); i++) {
			// here in this loop it will go less than length of word an then it
			// will
			// iterate ++ at index i;

			show[i] = new HideableChar(word.charAt(i));
		}
	}

	public boolean gameOver() {
		if (numOfWrongGuss >= maxWrongGuess) {
			// in this statement game will get over when the numOfWrong
			// is equal to maxWrong

			return true;
		} else {
			// here it will just return false if its vice versa.
			/**
			 * @return
			 */
			return false;

		}
	}

	public HideableChar[] getDisplayedWord() {
		// wordDisplay = HideableChar(secretPhrase.length);
		// in beginning this all should be hidden

		return show;

	}

	/**
	 * @return
	 */

	public int getMaxGuesses() { // in this method there are total default
									// guesses so
		// its not over player can play the game and if the guesses are wrong
		// and the
		// number of wrong guesses are over then you loose the game
		// so I did this way so that it works properly.
		return maxWrongGuess; // this will just return max, as i mentioned before the
					// statement max =0
	}

	public String getSecretWord() {
		// this method will just return get secretWord as i mentioned that
		// variable in other method called guessLetter.
		return secretword;
	}

	public boolean guessLetter(char ch) {
		if (gameOver()) { // in this method if it is game over then it
			// do nothing or else it will guess the letter and if the letter is
			// correct it
			// player will will or else you the player loose
			// this is what this method does
			/**
			 * @return
			 */
			return false;
		}
		boolean result = false;
		this.letterEstimatedSoFar += ch;
		if (letterEstimatedSoFar.contains(("" + ch).toUpperCase())) {
			numOfWrongGuss++;
			/**
			 * @return
			 */
			return false;
		}

		String secretPhrase = " ";
		for (int i = 0; i < (secretPhrase).length(); i++) {
			if (secretPhrase.charAt(i) == ch) {
				result = true;
				show[i].unHide();
				return result;
			} else {
				result = false;

			}
			if (!result)
				numOfWrongGuss++;

		}

		/**
		 * @return
		 */
		return result;
	}

	public String lettersGuessed() { // in this method this just return letter
										// guesses so far
		// as mentioned the variable in other method called guessLetter.
		/**
		 * @return
		 */
		/**
		 * @return
		 */
		return letterEstimatedSoFar;

	}

	public int numWrongGuesses() { // in this method this just return number of
									// wrong guesses so far
		// as mentioned the variable in other method called guessLetter.
		/**
		 * @return
		 */
		/**
		 * @return
		 */
		return numOfWrongGuss;
	}

	public boolean won() { // In this method it wins if there are number of guesses left
		for (int i = 0; i < show.length; i++) {
			if (show[i].isHidden()) {
				return false;

			}
		}
		if (numOfWrongGuss <= 7) { 
			return true;
		} else {
			return false;
		}

	}
}
