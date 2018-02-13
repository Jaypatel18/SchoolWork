package hw3;

import java.util.ArrayList;
import java.util.Arrays;

import util.SubsetFinder;
import api.Card;
import api.Hand;
import api.IEvaluator;

/**
 * 
 * 
 * @author Jay Evaluator for a hand consisting of a "straight" in which the card
 *         ranks are consecutive numbers. The number of required cards is equal
 *         to the hand size. An ace (card of rank 1) may be treated as the
 *         highest possible card or as the lowest (not both). To evaluate a
 *         straight containing an ace it is necessary to know what the highest
 *         card rank will be in a given game; therefore, this value must be
 *         specified when the evaluator is constructed. In a hand created by
 *         this evaluator the cards are listed in descending order with high
 *         card first, e.g. [10 9 8 7 6] or [A K Q J 10], with one exception: In
 *         case of an ace-low straight, the ace must appear last, as in [5 4 3 2
 *         A]
 * 
 *         The name of this evaluator is "Straight".
 */
public class StraightEvaluator extends AbstractEvaluator {
	/**
	 * Constructs the evaluator. Note that the maximum rank of the cards to be
	 * used must be specified in order to correctly evaluate a straight with ace
	 * high.
	 * 
	 * @param ranking
	 *            ranking of this hand
	 * @param handSize
	 *            number of cards in a hand
	 * @param maxCardRank
	 *            largest rank of any card to be used
	 */
	private String nams = " ";
	private int nums = 0;
	private int ranks;
	private Hand fingure;
	private int maxCardR;
	private int handSize;

	public StraightEvaluator(int ranking, int handSize, int maxCardRank) {
		super();
		ranks = ranking;
		maxCardR = maxCardRank;
		this.handSize = handSize;
	}

	public String getName() { // This method just return the name of the
								// evaluator
		/**
		 * @return
		 */
		return " Straight";
	}

	public int getRanking() { // This method return the Ranking of the card.
		/**
		 * @return
		 */
		return nums;
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
		return handSize;
	}

	public boolean canSatisfy(Card[] mainCards) {
		//boolean aces = true;
		// In this method we need to figure it out that if the cards satisfy the
		// hirechary
		// also if t does we need to return true as it is boolean canSatisy.
		Arrays.sort(mainCards);
		if (mainCards.length != cardsRequired()) {
			/**
			 * @return
			 */
			return false;
		}
		for (int i = 0; i < cardsRequired() - 1; ++i) {
			if (mainCards[i].getRank() - mainCards[i + 1].getRank() !=1) {
				return false;
			} 
		}
		return true;
	}
	



	public boolean canSubsetSatisfy(Card[] allCards) {
		// In this method we need to figure it out whether the allCards
		// and subset satisfy the hirechary of the cards
		// thats why I used the index so that i can keep the track of all cards
		// and if it satisy the hirechary that retunr true as it is boolean type
		SubsetFinder find = new SubsetFinder();
		ArrayList<int[]> list = find.findSubsets(allCards.length, 2);
		for (int i = 0; i < list.size(); i++) {
			Card[] myCard = new Card[2];
			myCard[0] = allCards[list.get(i)[0]];
			myCard[1] = allCards[list.get(i)[1]];
			if (canSatisfy(myCard)) {
				/**
				 * @return
				 */
				return true;
			}
		}
		/**
		 * @return
		 */
		return false;
	}

//	public Hand createHand(Card[] allCards, int[] subset) {
//		// In this method what we have to do is we need to create hand and the
//		// return type should be hand, we need to figure if it satisfy the
//		// hirechary
//		// or not if it does then we need to make an array of cards and
//		// basically
//		// we need to store so that we create a hand
//		Card[] cards = new Card[subset.length];
//		for (int i = 0; i < cards.length; i++) {
//			cards[i] = allCards[subset[i]];
//		}
//		if (!canSatisfy(cards)) {
//			/**
//			 * @return
//			 */
//			return null;
//		}
//		Card[] sideCards = new Card[allCards.length - subset.length];
//		int index = 0;
//		for (int i = 0; i < allCards.length; i++) {
//			boolean isInside = false;
//			for (int j = 0; j < subset.length; j++) {
//				if (i == subset[j]) {
//					isInside = true;
//				}
//			}
//			if (!isInside) {
//				sideCards[index] = allCards[i];
//				index++;
//			}
//			isInside = false;
//		}
//		Arrays.sort(allCards);
//		Arrays.sort(sideCards);
//
//		/**
//		 * @return
//		 */
//		return new Hand(cards, sideCards, new StraightEvaluator(
//				this.getRanking(), this.handSize(), this.cardsRequired()));
//	}

	public Hand getBestHand(Card[] allCards) { // wrong output
		// In this method we need to create a bestHand and the return type
		// should be hand
		// In this hand we basically need to do generate all possible hands
		// and list all hand compare all of them and then sort
		// list of hand will go through all of the cards and then it will
		// find what is the highest rank.
		Hand hands = null;
		IEvaluator eve = new StraightEvaluator(ranks, handSize, maxCardR);
		ArrayList<int[]> sub = new ArrayList<int[]>();
		sub = SubsetFinder.findSubsets(allCards.length, cardsRequired());
		for (int i = 0; i < sub.size(); i++) {
			Hand fingure = eve.createHand(allCards, sub.get(i));
			if (hands == null || fingure != null
					&& fingure.compareTo(hands) < 0) {
				hands = fingure;
			}
		}
		return hands;
	}

}
