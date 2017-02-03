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
 * @author Jay constructors the evaluator
 * 
 */
public class FullHouseEvaluator extends AbstractEvaluator {
	private String name = "One Pair ";
	private int number = 3;
	// private int sequence = 1;
	ArrayList<Card> cards = new ArrayList<Card>();
	private int rank;
	private int hand;

	public FullHouseEvaluator(int ranking, int handSize) {
		/**
		 * Constructs the evaluator.
		 * 
		 * @param ranking
		 *            ranking of this hand
		 * @param handSize
		 *            number of cards in a hand
		 */
		// super(handSize, handSize);
		rank = ranking;
		hand = handSize;

	}

	public String getName() { // This method just return the name of the
								// evaluator
		/**
		 * @return
		 */
		return "One Pair";
	}

	public int getRanking() { // This method return the Ranking of the card.
		/**
		 * @return
		 */
		return 3;
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

	public boolean canSatisfy(Card[] mainCards) {
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
		for (int i = 0; i < mainCards.length - 1; ++i) {

			mainCards[i].compareTo(mainCards[i + 1]);
			if (mainCards[i].getRank() == mainCards[i + 1].getRank()) {
				return true;

			} else {
				/**
				 * @return
				 */
				return false;
			}
		}
		/**
		 * @return
		 */
		return false;
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
		return new Hand(cards, sideCards, new OnePairEvaluator(
				this.getRanking(), this.handSize()));
	}

	public Hand getBestHand(Card[] allCards) {
		ArrayList<int[]> sub = SubsetFinder.findSubsets(allCards.length - 1,
				required);
		ArrayList<int[]> list = new ArrayList<int[]>();
		ArrayList<Hand> subse = new ArrayList<Hand>();
		Hand best;
		Hand added;
		// final Card[] cards = allCards;
		for (int i = 0; i < list.size(); ++i) {
			int[] subset = list.get(i);

			// create an array with just the letters chosen by the subset
			Card[] result = new Card[required];
			int resultIndex = 0;
			for (int j = 0; j < subset.length; ++j) {
				// each element of the subset can be used as an index
				int index = subset[j];
				Card letter = allCards[index];

				// then put it in the result array
				result[resultIndex] = letter;
				resultIndex += 1;
			}
			if (canSatisfy(result)) {
				added = createHand(allCards, subset);
				subse.add(added);

			}
			// System.out.println(Arrays.toString(result));
		}

		best = subse.get(0);
		for (int i = 0; i < subse.size() - 1; i++) {
			if (subse.get(i).compareTo(subse.get(i + 1)) > 0)
				;
			best = subse.get(i + 1);
		}
		return best;
	}
}
