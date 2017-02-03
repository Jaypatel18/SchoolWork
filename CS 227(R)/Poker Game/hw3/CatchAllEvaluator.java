package hw3;

import api.Card;

/**
 * Evaluator satisfied by any set of cards.  The number of
 * required cards is equal to the hand size.
 * 
 * The name of this evaluator is "Catch All".
 */
public class CatchAllEvaluator extends AbstractEvaluator
{
  /**
   * Constructs the evaluator.
   * @param ranking
   *   ranking of this hand
   * @param handSize
   *   number of cards in a hand
   */
  public CatchAllEvaluator(int ranking, int handSize)
  {
    super("Catch All", ranking, handSize, handSize);
  }

  @Override
  public boolean canSatisfy(Card[] mainCards)
  {
    if (mainCards.length != cardsRequired())
    {
      return false;
    }
    return true;
  }
  

}
