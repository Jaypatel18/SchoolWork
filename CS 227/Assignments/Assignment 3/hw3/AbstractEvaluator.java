package hw3;

import java.util.ArrayList;
import java.util.Arrays;

import util.SubsetFinder;
import api.Card;
import api.Hand;
import api.IEvaluator;

/**
 * The class AbstractEvaluator includes common code for all evaluator types.
 * 
 * @author Jay
 * constructors the evaluator
 * 
 */
public abstract class AbstractEvaluator implements IEvaluator {
	protected String name;
	protected int rank;
	protected int hand;
	protected int required;

	public AbstractEvaluator() {
		// we are suppose to control

	}

	public String getName() { // This method just return the name of the
								// evaluator
		/**
		 * @return
		 */
		return name;
	}

	public int getRanking() { // This method return the Ranking of the card.
		/**
		 * @return
		 */
		return rank;
	}

	public int cardsRequired() { // This method will retunr the card whicha are
		// required in this evaluator
		/**
		 * @return
		 */
		return 2;
	}

	public int handSize() { // This method just return the hand as we need the
							// size ofthe hand.
		/**
		 * @return
		 */
		return hand;
	}

	abstract public boolean canSatisfy(Card[] mainCards);

	abstract public boolean canSubsetSatisfy(Card[] allCards);

	public Hand createHand(Card[] allCards, int[] subset) {
		// In this method what we have to do is we need to create hand and the
		// return type should be hand, we need to figure if it satisfy the
		// hirechary
		// or not if it does then we need to make an array of cards and
		// basically
		// we need to store so that we create a hand
		Card[] cards = new Card[subset.length];
		for (int i = 0; i < cards.length; i++) {
			cards[i] = allCards[subset[i]];
		}
		if (!canSatisfy(cards)) {
			/**
			 * @return
			 */
			return null;
		}
		Card[] sideCards = new Card[allCards.length - subset.length];
		int index = 0;
		for (int i = 0; i < allCards.length; i++) {
			boolean isInside = false;
			for (int j = 0; j < subset.length; j++) {
				if (i == subset[j]) {
					isInside = true;
				}
			}
			if (!isInside) {
				sideCards[index] = allCards[i];
				index++;
			}
			isInside = false;
		}
		Arrays.sort(allCards);
		Arrays.sort(sideCards);
		/**
		 * @return
		 */
		return new Hand(cards, sideCards, this);
	}

	 abstract public Hand getBestHand(Card[] allCards);
		 
	 
//		 ArrayList<int[]> sub = SubsetFinder.findSubsets(allCards.length-1, required);
//		 ArrayList<int[]> list = new ArrayList<int[]>();
//		 ArrayList<Hand> subse = new ArrayList<Hand> ();
//		 Hand best;
//		 Hand added;
//		 //final Card[] cards = allCards;
//		 for (int i = 0; i < list.size(); ++i)
//	    {
//	      int[] subset = list.get(i);
//	      
//	      // create an array with just the letters chosen by the subset
//	      Card[] result = new Card[required];
//	      int resultIndex = 0;
//	      for (int j = 0; j < subset.length; ++j)
//	      {
//	        // each element of the subset can be used as an index
//	        int index = subset[j];
//	        Card letter = allCards[index];
//	        
//	        // then put it in the result array
//	        result[resultIndex] = letter;
//	        resultIndex += 1;
//	      }
//	      if(canSatisfy(result)){
//	    	  added = createHand(allCards, subset);
//	    	  subse.add(added);
//	    	  
//	      }
//	      //System.out.println(Arrays.toString(result));
//	    }
//		 
//		 best = subse.get(0);
//		 for(int i=0;i<subse.size()-1;i++){
//			 if(subse.get(i).compareTo(subse.get(i+1))>0);
//			 best = subse.get(i+1);
//		 }
//		 return best;
//	}
//	 
	 
}
