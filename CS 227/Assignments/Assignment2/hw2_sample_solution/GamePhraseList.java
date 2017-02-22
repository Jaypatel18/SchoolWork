package hw2;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * This class encapsulates a list of strings representing phrases or words for use in 
 * a letter-guessing game. The list is initialized from a file.
 */
public class GamePhraseList
{
  /**
   * The list of phrases.
   */
  private ArrayList<String> phrases;

  /**
   * Constructs a GamePhraseList that will select phrases from the given file.
   * @param givenFilename
   *   the name of the file
   * @throws FileNotFoundException
   *   if the named file cannot be opened or read
   */
  public GamePhraseList(String givenFilename) throws FileNotFoundException
  {
    phrases = new ArrayList<String>();
    FileInputStream file = new FileInputStream(givenFilename);
    Scanner in = new Scanner(file);
    while (in.hasNextLine())
    {
      phrases.add(in.nextLine());
    }
    in.close();
  }

  /**
   * Returns the nth phrase from the file, where the first line of the file
   * is numbered zero.  Caller must ensure that n is greater than or equal to
   * zero and smaller than the number of phrases.
   * @param n
   *   number indicating which phrase from the file is to be returned
   * @return 
   *    the nth phrase
   */
  public String getPhrase(int n)
  {
    return phrases.get(n);
  }
  
  /**
   * Returns the number of strings in this phrase list.
   * @return
   *   number of strings in this list
   */
  public int getSize()
  {
    return phrases.size();
  }

}
