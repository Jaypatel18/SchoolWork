package R7;

public class StringMethods {
	public static String stringReverse(String Word) {
		int n = Word.length();
		String Reversestring = "";
		for (int i = n - 1; i >= 0; i--) {
			char c = Word.charAt(i);
			Reversestring = Reversestring + c;

		}
		return Reversestring;
	}

	public static int FirstVowel(String word) {
		for (int i = 0; i <= word.length() - 1; i++) {
			if (word.charAt(i) == 'a' || word.charAt(i) == 'o'
					|| word.charAt(i) == 'e' || word.charAt(i) == 'i'
					|| word.charAt(i) == 'u') {
				return i;
			}
		}
		return -1;
	}

	public static String pigLatin(String word) {
		int vowelPos = FirstVowel(word);
		if (vowelPos == -1)
			return word + "ay";
		String PigLatin = word.substring(vowelPos, word.length());
		PigLatin = PigLatin + word.substring(0, vowelPos);
		PigLatin = PigLatin + "ay";
		return PigLatin;
	}

	public static void main(String[] args) {

		System.out.println(pigLatin("quiet"));
	}

}
