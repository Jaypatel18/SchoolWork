package hw3;
import java.util.ArrayList;
import java.util.Arrays;

import util.SubsetFinder;
import api.Card;
import api.Hand;
import api.IEvaluator;

/**
 * The class AbstractEvaluator includes common code for all evaluator types.
 * All methods are implemented here except canSatisfy.  Most of the concrete
 * evaluator types extend this class directly. However, the classes OnePairEvaluator,
 * ThreeOfAKindEvaluator, and FourOfAKindEvaluator extend a common abstract
 * class OfAKindEvaluator. Also, StraightFlushEvaluator extends
 * StraightEvaluator.  Since the StraightEvaluator constructor
 * doesn't take a name argument, there a second protected constructor
 * for StraightEvaluator that allows the name to be set when called
 * from StraightFlushEvaluator.
 * 
 * The only method that is overridden in the eight concrete subclasses
 * is canSatisfy, with two exceptions:  The method createHand is 
 * overridden in FullHouseEvaluator and in StraightEvaluator to 
 * take care of the two cases described on p. 5 of the pdf.
 */
public abstract class AbstractEvaluator implements IEvaluator
{
  /**
   * Name of this evalutor.
   */
  private String name;
  
  /**
   * Ranking of this evaluator.
   */
  private int ranking;
  
  /**
   * Number of cards required for this evaluator's canSatisfy method.
   */
  private int cardsRequired;
  
  /**
   * Total number of cards in a hand produced by this evaluator.
   */
  private int handSize;
  
  /**
   * Constructs an evaluator with the given data.  This constructor can
   * only be invoked by subclasses.
   * 
   * @param name
   *   name for this evaluator
   * @param ranking
   *   ranking for this evaluator
   * @param cardsRequired
   *   number of main cards needed
   * @param handSize
   *   total number of cards in a hand
   */
  protected AbstractEvaluator(String name, int ranking, int cardsRequired, int handSize)
  {
    this.name = name;
    this.ranking = ranking;
    this.cardsRequired = cardsRequired;
    this.handSize = handSize;
  }
  
  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public int getRanking()
  {
    return ranking;
  }

  @Override
  public int cardsRequired()
  {
    return cardsRequired;
  }

  @Override
  public int handSize()
  {
    return handSize;
  }

  @Override
  public boolean canSubsetSatisfy(Card[] allCards)
  {
    if (allCards.length < cardsRequired())
    {
      return false;
    }

    // for each subset of required size, if canSatisfy is true
    // for that set of cards, then return true
    ArrayList<int[]> subsets = SubsetFinder.findSubsets(allCards.length, cardsRequired());
    for (int[] subset : subsets)
    {
      Card[] mainCards = createCardArrayFromSubset(allCards, subset);
      if (canSatisfy(mainCards))
      {
        return true;
      }
    }
    
    // did not find one...
    return false;
  }
  
  @Override
  public Hand createHand(Card[] allCards, int[] subset)
  {
    // need to have enough cards in total, and the selected 
    // subset needs to be the right size
    if (allCards.length < handSize() || subset.length != cardsRequired())
    {
      return null;
    }
    
    Card[] mainCards = createCardArrayFromSubset(allCards, subset);
    if (canSatisfy(mainCards))
    {
      Card[] sideCards = createCardArrayFromNonSubset(allCards, subset);
      return new Hand(mainCards, sideCards, this);
    }
    else
    {
      return null;
    }
  }
    
  @Override
  public Hand getBestHand(Card[] allCards)
  {
    if (allCards.length < handSize())
    {
      // not enough cards given
      return null;
    }    
    
    // for each subset of required size, create a Hand and keep it if
    // it's the best one so far
    Hand best = null;
    ArrayList<int[]> subsets = SubsetFinder.findSubsets(allCards.length, cardsRequired());
    for (int[] subset : subsets)
    {
      Hand result = createHand(allCards, subset);
      if (best == null || result != null && result.compareTo(best) < 0)
      {
        best = result;
      }
    }
    
    return best;
  }

  
  /**
   * Creates a card array consisting of just the cards whose indices
   * are in the given set of integers.  
   * @param allCards
   *   given array of cards
   * @param subset
   *   set of integers between 0 and allCards.length in increasing order
   * @return
   *   array of selected cards
   */
  private Card[] createCardArrayFromSubset(Card[] allCards, int[] subset)
  {
    Card[] result = new Card[subset.length];
    int index = 0;
    for (int i = 0; i < subset.length; ++i)
    {
      result[index] = allCards[subset[i]];
      index += 1;
    }
    return result;
  }
 
  /**
   * Creates a card array consisting of just the cards whose indices
   * are NOT in the given set of integers.  
   * @param allCards
   *   given array of cards
   * @param subset
   *   set of integers between 0 and allCards.length in increasing order
   * @return
   *   array of cards with indices not in the given subset
   */
  private Card[] createCardArrayFromNonSubset(Card[] allCards, int[] subset)
  {
    Card[] result = new Card[allCards.length - subset.length];
    int resultIndex = 0;
    int subsetIndex = 0;
    
    // Note, we're counting on the fact that the ints in the subset
    // are in increasing order, so to check whether a given index i
    // is in the subset, we don't have to iterate over the whole
    // subset, just check the current subsetIndex.
    for (int i = 0; i < allCards.length; ++i)
    {
      if (subsetIndex < subset.length && i == subset[subsetIndex])
      {
        // i is in the subset, so skip that card
        subsetIndex += 1;
      }
      else
      {
        // i is not in the subset, so keep that card
        result[resultIndex] = allCards[i];
        resultIndex += 1;
      }
    }
    return result;
  }

}
