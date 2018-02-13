package edu.iastate.cs228.hw5;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * 
 * An implementation of a map based on a splay tree.
 * 
 * @author Jay
 * 
 */
public class SplayTreeMap<K extends Comparable<? super K>, V> {
	/**
	 * 
	 * The key-value pairs in this Map.
	 * 
	 */
	private SplayTreeSet<MapEntry<K, V>> entrySet = new SplayTreeSet<MapEntry<K, V>>();

	/**
	 * Default constructor. Creates a new, empty, SplayTreeMap
	 */
	public SplayTreeMap() {
		entrySet = new SplayTreeSet<MapEntry<K, V>>();
	}

	/**
	 * Simple copy constructor used only for testing. This method is fully
	 * implemented and should not be modified.
	 */
	public SplayTreeMap(SplayTreeSet<MapEntry<K, V>> set) {
		entrySet = set;    // just initilizating to set.
	}

	/**
	 * 
	 * @return the number of key-value mappings in this map.
	 */
	public int size() {
		return entrySet.size(); // this will give the size of the entryset
	}

	/**
	 * 
	 * @return the value to which key is mapped, or null if this map contains no
	 *         mapping for key.
	 * 
	 */
	public V get(K key) {
		Node<MapEntry<K, V>> NMP = entrySet.findEntry(new MapEntry<K, V>(key,
				null)); // this is creating a new mapentry
		if (NMP != null) { //checking it is not null
			return NMP.getData().value; // seeting the new map to its value
		}
		return null;
	}

	/**
	 * 
	 * @return true if this map contains a mapping for key.
	 * 
	 */
	public boolean containsKey(K key) {
		if (key == null) { // checking if it is null
			return false; 	
		}
		return entrySet.findEntry(new MapEntry<K,V> (key,null)) != null;  // returning the findEntry with mapentry
	}

	/**
	 * 
	 * Associates value with key in this map.
	 * 
	 * @return the previous value associated with key, or null if there was no
	 *         mapping for key.
	 * 
	 */
	public V put(K key, V value) { 
		Node <MapEntry<K,V>> NMP = entrySet.findEntry(new MapEntry <K,V> (key,null)); // making a new map 
		V temp = null; 
		if(NMP != null){	// checking if it is not null
			temp = NMP.getData().value; // putting it in the value
			NMP.getData().value = value; // initializing in the values
		}
		else{
			entrySet.add(new MapEntry <K,V>(key,value));
		}
		return temp;
	}

	/**
	 * 
	 * Removes the mapping for key from this map if it is present.
	 * 
	 * @return the previous value associated with key, or null if there was no
	 *         mapping for key.
	 * 
	 */
	public V remove(K key) { // doing kind of same like put
		Node <MapEntry <K,V>> NMP = entrySet.findEntry(new MapEntry <K,V> (key,null));
		V val = null;
		if(NMP != null){
			val = NMP.getData().value;
			entrySet.unlinkNode(NMP); // we are unlinking from here
		}
		return val;
	}

	/**
	 * 
	 * @return a SplayTreeSet storing the keys contained in this map.
	 * 
	 */
	public SplayTreeSet<K> keySet() { // in this method it is going to loop through and add the mapEmtry to key and iter through it and then it will add the last element after the loop is ended
		SplayTreeSet<K> tree = new SplayTreeSet <K> ();
		Iterator<MapEntry<K,V>> iter = entrySet.iterator();
		MapEntry<K,V> MP = entrySet.root.getData();
		while(iter.hasNext()){
			tree.add(MP.key);
			MP = iter.next();
		}
		tree.add(MP.key);
		return tree;
	}

	/**
	 * 
	 * @return an ArrayList storing the values contained in this map. The values
	 *         in the ArrayList should be arranged in ascending order of the
	 *         corresponding keys.
	 * 
	 */
	public ArrayList<V> values() { // In  this class I am going to do the same as I did it in before method 
		//after while ends it will end the last element
		ArrayList<V> l = new ArrayList<V>();
		Iterator<MapEntry <K,V>> iter = entrySet.iterator();
		MapEntry<K,V> MP = entrySet.root.getData();
		
		while(iter.hasNext()){
			l.add(MP.value);
			MP = iter.next();
		}
		l.add(MP.value);
		return l;
	}

}