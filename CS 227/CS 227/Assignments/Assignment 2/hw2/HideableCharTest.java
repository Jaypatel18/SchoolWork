package hw2;
/**
 * 
 * 
 * 
 */
import static org.junit.Assert.assertEquals;

import java.io.FileNotFoundException;
import org.junit.Test;
/**
 * 
 * 
 * @author Jay
 *
 */
public class HideableCharTest {

	@Test
	public void getDisplayedChar() throws FileNotFoundException {
		HideableChar names = new HideableChar(' ');
		names.getDisplayedChar();
		String messa = ("It displays the character");
		assertEquals(messa, false ,names.isHidden());
	}


	@Test
		public void getHiddenChar() throws FileNotFoundException {
		HideableChar names = new HideableChar('d');
		names.getHiddenChar();
		String messag = ("It should display hidden character");
		assertEquals(messag, "d" ,names.getHiddenChar());
	}

	@Test
	public void hide() throws FileNotFoundException {
		HideableChar names = new HideableChar('a');
		names.hide();
		String messag = ("After hide,the state should be hidden");
		assertEquals(messag, true, names.isHidden());

	}

	@Test
	public void isHidden() throws FileNotFoundException {
		HideableChar names = new HideableChar('t');
		names.isHidden();
		String message = ("After hide,the state should be ishidden");
		assertEquals(message, true, names.isHidden());

	}

	@Test
	public void matches() throws FileNotFoundException {
		HideableChar names = new HideableChar('t');
		names.hide();
		String messages = ("It should point out the matches");
		assertEquals(messages, true, names.isHidden());

	}
	@Test
	public void unHide () throws FileNotFoundException {
		HideableChar names = new HideableChar('a');
		String mess = ("a");
	    names.unHide();
		assertEquals( false, names.isHidden());
		names.getDisplayedChar();
		
		
	}

}
