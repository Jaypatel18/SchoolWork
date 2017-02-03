package hw3;

import api.Card;
import api.Hand;

/**
 * Evaluator for a generalized full house.  The number of required
 * cards is equal to the hand size.  If the hand size is an odd number
 * n, then there must be (n / 2) + 1 cards of the matching rank and the
 * remaining (n / 2) cards must be of matching rank. In this case, when constructing
 * a hand, the larger group must be listed first even if of lower rank
 * than the smaller group</strong> (e.g. as [3 3 3 5 5] rather than [5 5 3 3 3]).
 * If the hand size is even, then half the cards must be of matching 
 * rank and the remaining half of matching rank.  Any group of cards,
 * all of which are the same rank, always satisfies this
 * evaluator.
 * 
 * The name of this evaluator is "Full House".
 */
//Note: You must edit this declaration to extend AbstractEvaluator
//or to extend some other class that extends AbstractEvaluator
public class FullHouseEvaluator extends AbstractEvaluator
{
  /**
   * Constructs the evaluator.
   * @param ranking
   *   ranking of this hand
   * @param handSize
   *   number of cards in a hand
   */
  public FullHouseEvaluator(int ranking, int handSize)
  {
    super("Full House", ranking, handSize, handSize);
  }

  @Override
  public boolean canSatisfy(Card[] values)
  {
    if (values.length != handSize())
    {
      return false;
    }
    if (values.length <= 2)
    {
      return true;
    }
    
    int mid = values.length / 2;
    int end = values.length - 1;

    // check the following:
    //   - all values up to the middle are the same
    //   - all values to the right of the middle are the same
    //   - if length is odd, middle value matches EITHER the left half or the right half
    if (values.length % 2 == 0)
    {
      // even hand size
      return sameNumber(values, 0, mid - 1) && 
             sameNumber(values, mid, end);
    }
    else
    {
      // odd hand size
      return sameNumber(values, 0, mid - 1) && 
             sameNumber(values, mid + 1, end) &&
             (sameNumber(values, mid - 1, mid) ||
              sameNumber(values, mid, mid + 1));
    }
  }
  
  @Override
  public Hand createHand(Card[] allCards, int[] subset)
  {
    Hand hand = super.createHand(allCards, subset);
    if (handSize() % 2 != 0 && hand != null)
    {
      // size of hand is odd, so the "big half" needs to come 
      // at the beginning
      Card[] cards = hand.getMainCards();
      int mid = cards.length / 2;
      if (cards[mid].getRank() != cards[mid - 1].getRank())
      {
        // smaller "half" is at beginning, so swap them around
        Card[] temp = new Card[cards.length];
        for (int i = mid; i < cards.length; ++i)
        {
          temp[i - mid] = cards[i];
        }
        for (int i = 0; i < mid; ++i)
        {
          temp[mid + i + 1] = cards[i];
        }
        return new Hand(temp, null, this);
      }
    }
    return hand;
  }
  
  /**
   * Returns true if the starting and ending ranks match.
   * @param arr
   *   given array of cards
   * @param start
   *   starting index to check
   * @param end
   *   ending index to check
   * @return
   *   true if the ranks are the same for cards at start and end
   */
  private boolean sameNumber(Card[] arr, int start, int end)
  {
    return arr[start].getRank() == arr[end].getRank();
  }
}
