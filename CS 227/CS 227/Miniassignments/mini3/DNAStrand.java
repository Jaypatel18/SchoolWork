package mini3;

public class DNAStrand extends java.lang.Object {
	// private int length;
	private String DNA;

	// private char pairs;
	// private DNAStrand a;

	public DNAStrand(String givenData) {
		DNA = givenData;
	}

	public int countMatchesWithLeftShift(DNAStrand other, int shift) {
		int countMatches = 0;
		int others = other.length();
		int DNAs = DNA.length();
		int min = Math.min(others - shift, DNAs);

		for (int i = shift; i < min + shift; i++) {
			int j = i - shift;

			if (this.matches(other.toString().charAt(i), this.toString()
					.charAt(j))) {
				countMatches++;
			}
		}
		return countMatches;
	}

	public int countMatchesWithRightShift(DNAStrand other, int shift) {
		int countMatches = 0;
		int others = other.length();
		int DNAs = DNA.length();
		int min = Math.min(DNAs - shift, others);

		for (int i = 0; i < min; i++) {
			int j = i + shift;

			if (i + shift < DNA.length()) {

				if (this.matches(other.toString().charAt(i), this.toString()
						.charAt(j))) {
					countMatches++;
				}
			}
		}
		return countMatches;
	}

	public DNAStrand createComplement() {
		DNAStrand a = new DNAStrand("");

		for (int i = 0; i < DNA.length(); i++) {
			if (DNA.toString().charAt(i) == 'A')
				a.DNA += 'T';
			else if (DNA.toString().charAt(i) == 'T')
				a.DNA += 'A';
			else if (DNA.toString().charAt(i) == 'C')
				a.DNA += 'G';
			else if (DNA.toString().charAt(i) == 'G')
				a.DNA += 'C';
			else {
				a.DNA += "*";
			}

		}
		return a;
	}

	public String findMatchesWithLeftShift(DNAStrand other, int shift) {

		String opposite = "";
		// this = "AGAGCAT"
		// other = "TCAT"

		// when coming into loop, we know that i=0 and shift=3
		// want to compare DNA[0] and other[3]
		for (int i = 0; i < DNA.length(); i++) {
			if (i + shift < other.length()
					&& matches(other.toString().charAt(i + shift),
							DNA.charAt((i)))) {
				opposite += ("" + DNA.charAt(i)).toUpperCase();

			} else {
				opposite += ("" + DNA.charAt(i)).toLowerCase();

			}
		}
		return opposite;
	}

	public String findMatchesWithRightShift(DNAStrand other, int shift) {

		String opposite = "";
		for (int i = 0; i < DNA.length(); i++) {
			if (i + shift < other.length()
					&& matches(other.toString().charAt(i -shift),
							DNA.charAt((i)))) {
				opposite += ("" + DNA.charAt(i)).toUpperCase();

			} else {
				opposite += ("" + DNA.charAt(i)).toLowerCase();

			}

		}
		return opposite;
	}

	public String toString() {
		return this.DNA;
	}

	public int findMaxPossibleMatches(DNAStrand other) {
		int max = 0;
		for (int i = 0; i < other.DNA.length(); i++) {
			int a = countMatchesWithLeftShift(other, i);
			int b = countMatchesWithRightShift(other, i);
			if (a > max) {
				max = a;
			}
			if (b > max) {
				max = b;
			}
		}

		return max;
	}

	public boolean isValid() {
		boolean valid = true;
		for (int i = 0; i < DNA.length(); i++) {
			if ((DNA.charAt(i) != 'A' && DNA.charAt(i) != 'C'
					&& DNA.charAt(i) != 'G' && DNA.charAt(i) != 'T')) {
				valid = false;

			}
		}
		return valid;
	}

	public int length() {
		return DNA.length();
	}

	public int letterCount(char ch) {
		int count = 0;
		for (int i = 0; i < DNA.length(); i++) {
			if (DNA.charAt(i) == ch) {
				count++;
			}
		}
		return count;
	}

	public boolean matches(char c1, char c2) {
		if (c1 == 'A' && (c2 == 'T')) {
			return true;
		}
		if (c1 == 'T' && (c2 == 'A')) {
			return true;
		}
		if (c1 == 'G' && (c2 == 'C')) {
			return true;
		}
		if (c1 == 'C' && (c2 == 'G')) {
			return true;
		} else {
			return false;
		}
	}

}