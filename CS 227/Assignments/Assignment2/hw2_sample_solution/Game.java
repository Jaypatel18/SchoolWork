package hw2;

/**
 * This class encapsulates all the logic for a multi-player game of 
 * "Wheel of Fortune".  Use the startRound() method to start a
 * new round of the game using a new hidden text. An instance
 * of this class can be used for multiple rounds by calling 
 * startRound() to initiate a new round, and the total winnings
 * for all rounds are stored internally in Player objects.  Players are indexed starting
 * at zero; when a player loses their turn, the "next" player is
 * the player with the next index.  (The index wraps around to zero when
 * the index reaches the number of players, i.e., if there are 
 * five players, then player 0 comes after player 4.)
 */
public class Game
{
  /**
   * Cost to buy a vowel.
   */
  public static final int VOWEL_COST = 250;
  
  /**
   * The players in this game.
   */
  private Player[] players;
  
  /**
   * The secret phrase.
   */
  private GameText phrase;
  
  /**
   * The wheel for this game.
   */
  private GameWheel wheel;
  
  /**
   * Index of the player whose turn it is.
   */
  private int turn;
  
  /**
   * Indicates whether the current player needs to spin the wheel 
   * before proceeding.
   */
  private boolean needsSpin;
  
  /**
   * Indicates whether the round is over.
   */
  private boolean roundOver;
  
  /**
   * Constructs a new game instance.  The number of players
   * is equal to the length of the given array of player names.
   * Note that no operations are valid until startRound() has been 
   * called.
   * @param playerNames
   *   array of names for the players
   */
  public Game(String[] playerNames)
  {
    this.wheel = new GameWheel();
    players = new Player[playerNames.length];
    for (int i = 0; i < playerNames.length; ++i)
    {
      players[i] = new Player(playerNames[i]);
    }
  }
  
  /**
   * Start a new round of the game using the given GameText.
   * All players (including winner of the previous round, if any)
   * start with a round balance of zero.
   * 
   * @param whoseTurn
   *   index of the player to start with
   * @param secretPhrase
   *   the GameText to use for this round
   */
  public void startRound(int whoseTurn, GameText secretPhrase)
  {
    phrase = secretPhrase;
    turn = whoseTurn;
    roundOver = false;
    needsSpin = true;
    for (int i = 0; i < players.length; ++i)
    {
      players[i].clearRoundBalance();
    }
    
  }
  
  /**
   * Returns the 0-based index of the player whose turn it is.
   * @return
   *   index of the current player
   */
  public int whoseTurn()
  {
    return turn;
  }
  
  /**
   * Returns whether the current player needs to spin the wheel.
   * @return
   *   true if the current player needs to spin the wheel, false
   *   otherwise
   */
  public boolean needsSpin()
  {
    return needsSpin;
  }
  
  /**
   * Returns the potential winnings in this round for the given
   * player.
   * @param player
   *   index of the player
   * @return
   *   round balance for the indicated player
   */
  public int getRoundBalance(int player)
  {
    return players[player].getRoundBalance();
  }

  /**
   * Returns the total winnings for the given
   * player.
   * @param player
   *   index of the player
   * @return
   *   game balance for the indicated player
   */
  public int getGameBalance(int player)
  {
    return players[player].getGameBalance();
  }

  /**
   * Returns the name of the given player.
   * @param player
   *   index of the player
   * @return
   *   name of the indicated player
   */
  public String getPlayerName(int player)
  {
    return players[player].getName();
  }
  
  /**
   * Returns the number of players in the game.
   * @return 
   *   number of players in this game
   */
  public int getNumPlayers()
  {
    return players.length;
  }
  
  /**
   * Returns the current value on the wheel for this game.
   * @return
   *   the current state of the wheel for this game
   */
  public int getWheelValue()
  {
    return wheel.getSegmentValue();
  }
  
  /**
   * Returns the current rotation of the wheel for this game.
   * @return
   *   current wheel rotation
   */
  public int getWheelRotation()
  {
    return wheel.getRotation();
  }
  
  /**
   * Returnds whether the current round is over.
   * @return
   *   true if the round is over, false otherwise
   */
  public boolean roundOver()
  {
    return roundOver;
  }
  
  /**
   * Returns an array showing the characters of the hidden text to be displayed.
   * Characters that have not been guessed yet are represented as '*'.
   * @return
   *   displayed form of the secret phrase
   */
  public char[] getDisplay()
  {
    return phrase.getDisplayedText();
  }
  
  /**
   * Returns the complete hidden text (with
   * all characters revealed).
   * @return
   *   solved form of the secret phrase
   */
  public String getAnswer()
  {
    return phrase.getHiddenText();
  }
  
  /**
   * Checks whether the given consonant occurs in the hidden text,
   * updates the displayed text accordingly, and adjusts the current 
   * player's balance by the number of occurrences times the 
   * wheel value. If the consonant does not occur
   * in the hidden text, it becomes the next player's turn.
   * @param ch
   *   a consonant
   * @return
   *   the number of times the given consonant appears in the hidden text
   */
  public int guessConsonant(char ch)
  {
    int count = phrase.letterCount(ch);

    if (count > 0)
    {
      phrase.update(ch);
      players[turn].addToRoundBalance(count * wheel.getSegmentValue());
    }
    else
    {
      turn = (turn + 1) % players.length;     
    }
    needsSpin = true;
    return count;
  }
  
  /**
   * Checks whether the given string matches the hidden text
   * (without regard to case).
   * If the guess matches, the following takes place:
   * <ul>
   *   <li> the current player's round balance is increased by
   *        the number of hidden consonants times the 
   *        wheel value 
   *   <li> the displayed text is updated to
   *        reveal all characters
   *   <li> the losing players' round balances are
   *        reduced to zero (the winning player's round balance
   *        is retained until the next call to startRound)
   *   <li> the winning player's round balance is
   *        added to their total balance
   *   <li> the round ends
   * </ul>
   * Otherwise, it becomes the next player's turn.
   * 
   * @param guess
   *   the player's guess
   * @return
   *   true if the guess matches the hidden text
   */
  public boolean guessPhrase(String guess)
  {
    if (guess.equalsIgnoreCase(phrase.getHiddenText()))
    {
      int consonants = phrase.countHiddenConsonants();
      players[turn].addToRoundBalance(consonants * wheel.getSegmentValue());
      players[turn].winRound();   
      phrase.updateAllRemaining();
      roundOver = true;

      // clear round balances for other players
      for (int i = 0; i < players.length; ++i)
      {
        if (i != turn)
        {
          players[i].clearRoundBalance();
        }
      }     
    }
    else
    {
      turn = (turn + 1) % players.length;
      needsSpin = true;
    }
    return roundOver;
  }
  
  /**
   * Checks whether the given vowel occurs in the hidden text,
   * updates the displayed text accordingly, and reduces the current 
   * player's balance by VOWEL_COST.  If the vowel does not occur
   * in the hidden text, it becomes the next player's turn.  This method
   * does not check whether the player has enough funds for a vowel.
   * @param ch
   *   a vowel
   * @return
   *   the number of times the given vowel appears in the hidden text
   */
  public int buyVowel(char ch)
  {
    players[turn].subtractFromRoundBalance(VOWEL_COST);
    int count = phrase.letterCount(ch);
    if (count > 0)
    {
      phrase.update(ch);
    }
    else
    {
      turn = (turn + 1) % players.length;      
    }
    needsSpin = true;
    return count;
  } 

  /**
   * Spins the wheel and updates the game state accordingly.
   * BANKRUPT or LOSE_A_TURN cause it to become the next 
   * player's turn, and additionally BANKRUPT reduces the current
   * player's round balance to zero.  The constant FREE_PLAY, which has
   * value zero, is not treated differently than any other turn. 
   * The outcome of the spin is not returned by this method , but is 
   * available by calling getSegmentValue() afterward.
   */
  public void spinWheel(int degrees)
  {
    wheel.spin(degrees);
    int state = wheel.getSegmentValue();
    if (state == GameWheel.BANKRUPT)
    {       
      players[turn].clearRoundBalance();
      turn = (turn + 1) % players.length;
      needsSpin = true;
    }
    else if (state == GameWheel.LOSE_A_TURN)
    {
      turn = (turn + 1) % players.length;
      needsSpin = true;
    }
    else
    {
      needsSpin = false;
    }
  }
  
}
