package hw2;

/**
 * 
 * 
 * @author Jay
 * 
 */
public class HideableChar extends java.lang.Object {
	private boolean isHidden;
	private String data;
	private String temp;

	/**
	 * 
	 * @param
	 * 
	 */
	public HideableChar(char ch) {
		data = "" + ch;
		if (Character.isAlphabetic(ch)) {
			isHidden = true;
		} else {
			isHidden = false;
		}
	}

	public String getDisplayedChar() {
		// in this method it returns null if the
		// object is in Hidden State or else it sets that to data as that is my
		// instance variable and then it returns the temporary.
		
		if (isHidden) {
			// System.out.println("Hello");
			return null;
		}

		else {

			String temp = "" + data;
			return temp;
		}

		/**
		 * @return
		 */
		
	}

	public String getHiddenChar() {
		// in this method it just sets to data and then it returns temp as its
		// my private variable
		String temp = "" + data;

		/**
		 * @return
		 */
		return temp;

	}

	public void hide() {
		// in this method if it is hidden then it just return true or else
		// it does nothing.
		isHidden = true;

	}

	public boolean isHidden() {
		// in this method if it is hidden then it just return true or else
		// it does nothing.
		/**
		 * @return
		 */
		return isHidden;
	}

	public boolean matches(char ch) {
		// in this method if the data which is my variable is equal to input
		// then it returns true or else it returns false;
		String input = "" + ch;
		if (data.equals(input)) {
			return true;
		} else {
			return false;
		}
	}

	public void unHide() {
		// in this method its all opposite of hide so if it is hidden in this
		// method
		// it returns false;
		isHidden = false;
	}
}
