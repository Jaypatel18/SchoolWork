package hw3;

import java.util.Arrays;

import api.Card;
import api.Hand;

/**
 * Evaluator for a hand consisting of a "straight" in which the
 * card ranks are consecutive numbers.  The number of required 
 * cards is equal to the hand size.  An ace (card of rank 1) 
 * may be treated as the highest possible card or as the lowest
 * (not both).  To evaluate a straight containing an ace it is
 * necessary to know what the highest card rank will be in a
 * given game; therefore, this value must be specified when the
 * evaluator is constructed.  In a hand created by this
 * evaluator the cards are listed in descending order with high 
 * card first, e.g. [10 9 8 7 6] or [A K Q J 10], with
 * one exception: In case of an ace-low straight, the ace
 * must appear last, as in [5 4 3 2 A]
 * 
 * The name of this evaluator is "Straight".
 */
public class StraightEvaluator extends AbstractEvaluator
{
  /**
   * Maximum rank of cards for which this evaluator will be used.
   */
  private int maxCardRank;

  /**
   * Constructs the evaluator. Note that the maximum rank of
   * the cards to be used must be specified in order to 
   * correctly evaluate a straight with ace high.
   * @param ranking
   *   ranking of this hand
   * @param handSize
   *   number of cards in a hand
   * @param maxCardRank
   *   largest rank of any card to be used
   */
  public StraightEvaluator(int ranking, int totalCards, int maxCardRank)
  {
    super("Straight", ranking, totalCards, totalCards);
    this.maxCardRank = maxCardRank;
  }

  /**
   * Constructs the evaluator using the given name. Note that the 
   * maximum rank of the cards to be used must be specified in order to 
   * correctly evaluate a straight with ace high.  This constructor
   * may only be called by subclasses.
   * @param name
   *   name for this evaluator
   * @param ranking
   *   ranking of this hand
   * @param handSize
   *   number of cards in a hand
   * @param maxCardRank
   *   largest rank of any card to be used
   */
  protected StraightEvaluator(String name, int ranking, int totalCards, int maxCardRank)
  {
    super(name, ranking, totalCards, totalCards);
    this.maxCardRank = maxCardRank;
  }

  
  @Override
  public boolean canSatisfy(Card[] mainCards)
  {
    if (mainCards.length != handSize())
    {
      return false;
    }
    
    // first ignore a possible ace at beginning
    if (isDescending(mainCards, 1, mainCards.length - 1))
    {
      if (mainCards[0].getRank() == 1)
      {
        // it's an ace, so it could be high or low
        if (mainCards[1].getRank() == maxCardRank || mainCards[mainCards.length - 1].getRank() == 2)
        {
          return true;
        }
      }
      else
      {
        // not an ace, just make sure its rank is one higher than next card
        return mainCards[0].getRank() == mainCards[1].getRank() + 1;
      }
    }
    
    return false;

  }
  
  @Override
  public Hand createHand(Card[] allCards, int[] subset)
  {
    Hand result = super.createHand(allCards, subset);
    if (result != null && handSize() >= 2)
    {
      // If this is an ace-low straight, reorder the cards to 
      // put the ace at the end.
      Card[] mainCards = result.getMainCards();
      if (mainCards[0].getRank() == 1 &&
          mainCards[1].getRank() != maxCardRank &&
          mainCards[mainCards.length - 1].getRank() == 2)       
      {
        Card temp = mainCards[0];
        for (int i = 0; i < mainCards.length - 1; ++i)
        {
          mainCards[i] = mainCards[i + 1];
        }
        mainCards[mainCards.length - 1] = temp;
        return new Hand(mainCards, result.getSideCards(), this);
      }
    }
    return result;
  }
  
  /**
   * Determines whether the cards in the range first through last
   * are of consecutive descending ranks.
   * @param cards
   *   given array of cards
   * @param first
   *   starting index (inclusive)
   * @param last
   *   ending index (inclusive)
   * @return
   *   true if the ranks are consecutive and decreasing
   */
  protected boolean isDescending(Card[] cards, int first, int last)
  {
    for (int i = first; i < last; ++i)
    {
      if (cards[i].getRank() != (cards[i + 1].getRank() + 1))
      {
        return false;
      }
    }
    return true;
  }
  
  
}
