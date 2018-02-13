package hw3;

import java.util.ArrayList;
import java.util.Arrays;

import util.SubsetFinder;
import api.Card;
import api.Hand;
import api.IEvaluator;

/**
 * 
 * @author Jay
 * 
 *         Evaluator for a hand containing (at least) three cards of the same
 *         rank. The number of cards required is three.
 * 
 *         The name of this evaluator is "Three of a Kind".
 */

public class ThreeOfAKindEvaluator extends AbstractEvaluator {
	// private static final int HandSize = 0;
	/**
	 * Constructs the evaluator.
	 * 
	 * @param ranking
	 *            ranking of this hand
	 * @param handSize
	 *            number of cards in a hand
	 */

	private String names = " ";
	private int ranks = 0;
	private int hand = 0;
	private int rank = 0;

	public ThreeOfAKindEvaluator(int ranking, int handSize) {
		rank = ranking;
		hand = handSize;
	}

	public String getName() { // This method just return the name of the
								// evaluator
		/**
		 * @return
		 */
		return "Three of a kind";
	}

	public int getRanking() { // This method return the Ranking of the card.
		/**
		 * @return
		 */
		return ranks;
	}

	public int cardsRequired() { // This method will retunr the card whicha are
		// required in this evaluator
		/**
		 * @return
		 */
		return 3;
	}

	public int handSize() { // This method just return the hand as we need the
							// size ofthe hand.
		/**
		 * @return
		 */
		return hand;
	}

	public boolean canSatisfy(Card[] mainCards) {
		// In this method we need to figure it out that if the cards satisfy the
		// hirechary
		// also if t does we need to return true as it is boolean canSatisy.
		Arrays.sort(mainCards);
		if (mainCards.length == cardsRequired()) {
			//for (int i = 0; i < mainCards.length - 1; ++i) {
				if (mainCards[0].compareToIgnoreSuit(mainCards[1]) == 0 &&
					mainCards[1].compareToIgnoreSuit(mainCards[2]) == 0) {
						return true;
					}
				else {
					return false;
				}
			
		}else {
					return false;
				}
		
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

	// public Hand createHand(Card[] allCards, int[] subset) {
	// // In this method what we have to do is we need to create hand and the
	// // return type should be hand, we need to figure if it satisfy the
	// // hirechary
	// // or not if it does then we need to make an array of cards and
	// // basically
	// // we need to store so that we create a hand
	//
	// Card[] mainCards = new Card[cardsRequired()];
	// Card[] sideCards = new Card[allCards.length - mainCards.length];
	// int i = 0;
	// if (allCards.length == handSize()) {
	// for (int j = 0; i < subset.length; i++) {
	// if (i < subset.length) {
	// mainCards[i] = allCards[subset[i]];
	// } else if (i < (HandSize)) {
	// sideCards[i] = allCards[i];
	// i++;
	// }
	// }
	// if (canSatisfy(mainCards)) {
	// return new Hand(mainCards, sideCards,
	// new ThreeOfAKindEvaluator(this.getRanking(),
	// this.handSize()));
	// }
	// }
	// return null;
	// }

	public Hand getBestHand(Card[] allCards) {
		// In this method we need to create a bestHand and the return type
		// should be hand
		// In this hand we basically need to do generate all possible hands
		// and list all hand compare all of them and then sort
		// list of hand will go through all of the cards and then it will
		// find what is the highest rank.

		if (allCards.length < cardsRequired()) {
			return null;
		}
		int[] index = new int[cardsRequired()];
		for (int i = 0; i < allCards.length; i++) {
			if (allCards[i].compareToIgnoreSuit(allCards[i + cardsRequired()
					- 1]) == 0) {
				for (int j = 0; j < index.length; j++) {
					index[j] = i + j;
					return createHand(allCards, index);
				}
			}
		}

		return null;
	}
}
