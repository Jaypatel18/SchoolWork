package pa5;

import java.util.*;

public class monster {
	private String Name;
	private String Element;
	private int attackPower;
	private int Defense;
	private int Level = 1;
	private double Health = 100;
	private int maxHealth = 100;

	public monster(String givenName, String givenElement, int givenAttack,
			int givenDefense) {
		Name = givenName;
		Element = givenElement;
		attackPower = givenAttack;
		Defense = givenDefense;

	}

	public String getName() {
		return Name;
	}

	public String getElement() {
		return Element;
	}

	public int getLevel() {
		return Level;
	}

	public double getHealth() {
		return Health;
	}

	public void heal() {
		if (Health != maxHealth)
			Health = maxHealth;
	}

	public void levelUp() {
		if (Level <= 10) {
			Level++;
			maxHealth = (Level * 10);
			attackPower = attackPower * 2;
			Defense = Defense * 2;
		}
	}

	public boolean doDamage(double amountOfDamage) {
		if ((amountOfDamage - Defense) >= 0) {
			Health = Health - (amountOfDamage - Defense);
		}
		if (Health <= 0) {
			return true;
		}
		return false;

	}

	public boolean attack(monster opponent) {
		int damage = 0;
		String Defender = opponent.getElement();
		String Attacker = getElement();
		String Fire = "Fire";
		String Water = "Water";
		String Air = "Air";
		String Earth = "Earth";
		if (Defender == Fire && Attacker == Water || Defender == Air && Attacker == Earth) {

			damage = attackPower * 2;
			return opponent.doDamage(damage);
		}
		else if (Defender == Water && Attacker == Fire || Defender == Earth && Attacker == Air) {

			damage = attackPower * 2;
			return opponent.doDamage(damage);
		}
		else{
			damage = attackPower;
			return opponent.doDamage(damage);
		}
		
	}

	public String toString() {
		return getName() + "Level: " + getLevel() + "Health: " + getHealth();
	}

}
