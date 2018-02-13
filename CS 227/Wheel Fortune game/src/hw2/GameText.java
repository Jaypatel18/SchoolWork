package hw2;
/**
 * Class representing some hidden text for a letter-guessing game.
 * The <em>displayed text</em> is a character array in which all
 * alphabetic characters are initially replaced by the '*' character.
 * (Spaces and punctuation, if any, are always shown normally.
 * A character ch is considered alphabetic if 
 * <code>Character.isAlphabetic(ch)</code> returns true.)
 * Whenever the update() method is called with a letter that 
 * actually occurs in the hidden text, that character replaces
 * the '*' character in the hidden text.  All methods are 
 * case-insensitive and internally, all text and characters are converted to 
 * upper-case.
 */
public class GameText
{  
  /**
   * The hidden text.
   */
  private final String hidden;
  
  /**
   * The displayed text.
   */
  private char[] displayedText;
  
  /**
   * Constructs a GameText using the given string as the hidden text.
   * The hidden text is assumed NOT to contain the character '*'.
   * Internally the text is converted to upper case.
   * @param phrase
   *   the given hidden text
   */
  public GameText(String phrase)
  {
    hidden = phrase.toUpperCase();
    displayedText = new char[hidden.length()];
    
    for (int i = 0; i < hidden.length(); ++i)
    {
      char ch = phrase.charAt(i);
      if (Character.isAlphabetic(ch))
      {
        displayedText[i] = '*';
      }
      else
      {
        displayedText[i] = ch;
      }
    }
  }

  /**
   * Returns the actual hidden text stored in this object.
   * @return
   *   the hidden text
   */
  public String getHiddenText()
  {
    return hidden;
  } 
  
  /**
   * Returns the displayed form of the hidden text, in which only
   * the letters that have been identified by the update() method
   * are revealed.
   * @return
   *   displayed form of the hidden text
   */
  public char[] getDisplayedText()
  {
    return displayedText;
  }
    
  /**
   * Returns the number of alphabetic character positions that are 
   * currently not displayed (occupied by '*' characters).
   * @return
   *   number of characters positions not yet identified 
   */
  public int countHiddenLetters()
  {
    int count = 0;
    for (int i = 0; i < displayedText.length; ++i)
    {
      if (displayedText[i] == '*')
      {
        count += 1;
      }
    }
    return count;
  }

  /**
   * Returns the number of consonant positions that are 
   * currently not displayed (are occupied by '*' characters).
   * A consonant is defined as an alphabetic character other than
   * a vowel (A, E, I, O, or U). 
   * @return
   *   number of consonant positions not yet identified 
   */
  public int countHiddenConsonants()
  {
    int count = 0;
    for (int i = 0; i < displayedText.length; ++i)
    {
      if (displayedText[i] == '*' && !isVowel(hidden.charAt(i)))
      {
        count += 1;
      }
    }
    return count;
  }

  /**
   * Returns the number of times the given character occurs in the
   * hidden text. Does not modify the displayed text.  This method
   * is not case sensitive.
   * @param ch
   *   the character to check
   * @return
   *   number of occurrences of the given character in the hidden text
   */
  public int letterCount(char ch)
  {
    ch = Character.toUpperCase(ch);
    int count = 0;
    for (int i = 0; i < hidden.length(); ++i)
    {
      if (hidden.charAt(i) == ch)
      {
        ++count;
      }
    }
    return count;
  }
  
  /**
   * Updates the displayed text to reveal all occurrences of
   * the given character in the hidden text, if any.  Has no effect
   * if the character does not occur in the hidden text.
   * The given character is converted to upper case.
   * @param ch
   *   the character to be revealed
   */
  public void update(char ch)
  {
    ch = Character.toUpperCase(ch);
    for (int i = 0; i < hidden.length(); ++i)
    {
      if (hidden.charAt(i) == ch)
      {
        displayedText[i] = ch;
      }
    }
  }
  
  /**
   * Updates the displayed text to reveal all hidden letters.
   */
  public void updateAllRemaining()
  {
    for (int i = 0; i < hidden.length(); ++i)
    {
       displayedText[i] = hidden.charAt(i);
    }
  }
  
  /**
   * Determines whether the given character is a vowel
   * (A, E, I, O, or U).
   * @param ch
   *   given character
   * @return
   *   true if the character is a vowel, false otherwise
   */
  private boolean isVowel(char ch)
  {
    return "aeiouAEIOU".indexOf(ch) >= 0;
  }
}
