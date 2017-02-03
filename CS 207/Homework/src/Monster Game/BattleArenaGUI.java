package pa5;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.AdjustmentEvent;
import java.awt.event.AdjustmentListener;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTextArea;

public class BattleArenaGUI extends JFrame {

	private BattleArenaGUI() throws InterruptedException, IOException {
		monster[] monsters = new monster[4];
		monsters[0] = new monster("Flame", "fire", 30, 5);
		monsters[1] = new monster("Wave", "Water", 15, 20);
		monsters[2] = new monster("Wind", "air", 25, 10);
		monsters[3] = new monster("Rock", "EARTH", 20, 15);

		// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		// IF YOU WOULD LIKE TO TEST YOUR monster CLASS WITH THE SAME SITUATION
		// EVERYTIME, ENTER A SEED INTO THIS RANDOM OBJECT AS SHOWN
		// final Random rand = new Random(42);
		// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		final Random rand = new Random();

		final monster[] pair = getOpponents(rand, monsters);

		JFrame frame = new JFrame("monster Battle Arena");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanelWithBackground leftImage = new JPanelWithBackground(pair[0]
				.getName().toLowerCase() + ".jpg");
		JPanelWithBackground rightImage = new JPanelWithBackground(pair[1]
				.getName().toLowerCase() + ".jpg");

		final JTextArea leftText = new JTextArea();
		leftText.setEditable(false);
		Font font = new Font("Verdana", Font.BOLD, 25);
		leftText.setFont(font);

		final JTextArea rightText = new JTextArea();
		rightText.setEditable(false);
		rightText.setFont(font);

		JSplitPane left = new JSplitPane(JSplitPane.VERTICAL_SPLIT, leftImage,
				leftText);
		left.setResizeWeight(.85);
		left.setEnabled(false);

		JSplitPane right = new JSplitPane(JSplitPane.VERTICAL_SPLIT,
				rightImage, rightText);
		right.setResizeWeight(.85);
		right.setEnabled(false);

		JSplitPane upperPanel = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,
				left, right);
		upperPanel.setResizeWeight(.5);
		upperPanel.setEnabled(false);

		final JTextArea gameText = new JTextArea();
		gameText.setEditable(false);
		gameText.setFont(font);
		JScrollPane gamePane = new JScrollPane(gameText);
		gamePane.getVerticalScrollBar().addAdjustmentListener(
				new AdjustmentListener() {
					public void adjustmentValueChanged(AdjustmentEvent e) {
						e.getAdjustable().setValue(
								e.getAdjustable().getMaximum());
					}
				});

		JSplitPane framePanel = new JSplitPane(JSplitPane.VERTICAL_SPLIT,
				upperPanel, gamePane);
		framePanel.setResizeWeight(.55);
		framePanel.setEnabled(false);

		frame.getContentPane().add(framePanel);

		frame.pack();
		frame.setSize(950, 1000);
		frame.setVisible(true);

		runAuto(gameText, leftText, rightText, rand, pair);
	}

	public static void main(String[] args) throws IOException,
			InterruptedException {
		new BattleArenaGUI();
	}

	private static monster[] getOpponents(Random rand, monster[] monsters) {
		int[] indices = { -1, -1 };
		while (indices[0] == indices[1]) {
			indices[0] = rand.nextInt(monsters.length);
			indices[1] = rand.nextInt(monsters.length);
		}
		monster[] pair = { monsters[indices[0]], monsters[indices[1]] };
		return pair;
	}

	private static boolean turn(JTextArea gameText, Random rand,
			monster[] pair, boolean firstPlayer) {
		boolean knockout = false;
		if (firstPlayer)
			knockout = takeAction(gameText, rand.nextInt(10), pair[0], pair[1]);
		else
			knockout = takeAction(gameText, rand.nextInt(10), pair[1], pair[0]);

		return knockout;
	}

	private static boolean takeAction(JTextArea gameText, int roll,
			monster player, monster opponent) {
		switch (roll) {
		case 0:
			gameText.append(player.getName() + " heals!\n");
			player.heal();
			return false;
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
			gameText.append(player.getName() + " attacks " + opponent.getName()
					+ "!\n");
			return player.attack(opponent);
		case 8:
			gameText.append(player.getName() + " levels up!\n");
			player.levelUp();
			return false;
		}
		gameText.append(player.getName() + " does nothing.\n");
		return false;
	}

	private static void runAuto(JTextArea gameText, JTextArea leftText,
			JTextArea rightText, Random rand, monster[] pair)
			throws InterruptedException {
		boolean firstPlayer = true;
		boolean knockout = false;
		while (true) {
			Thread.sleep(1000);
			knockout = turn(gameText, rand, pair, firstPlayer);
			firstPlayer = !firstPlayer;
			leftText.setText(pair[0].toString());
			rightText.setText(pair[1].toString());
			if (knockout && !firstPlayer) {
				gameText.append(pair[0].getName() + " knocks out "
						+ pair[1].getName() + "! " + pair[0].getName()
						+ " wins!\n");
				return;
			} else if (knockout && firstPlayer) {
				gameText.append(pair[1].getName() + " knocks out "
						+ pair[0].getName() + "! " + pair[1].getName()
						+ " wins!\n");
				return;
			}
		}
	}

	@SuppressWarnings("serial")
	class JPanelWithBackground extends JPanel {

		private Image image;

		public JPanelWithBackground(String fileName) throws IOException {
			image = ImageIO.read(new File(fileName));
		}

		public void paintComponent(Graphics g) {
			super.paintComponent(g);

			g.drawImage(image, 0, 0, this.getWidth(), this.getHeight(), null);
		}
	}
}