package edu.iastate.cs228.hw5;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.NoSuchElementException;

/**
 * 
 * Splay tree implementation of the Set interface. The contains() and remove()
 * methods of AbstractSet are overridden to search the tree without using the
 * iterator.
 * 
 * @author Jay
 * 
 */
public class SplayTreeSet<E extends Comparable<? super E>> extends
		AbstractSet<E> {
	// The root of the tree containing this set's items
	Node<E> root;

	// The total number of elements stored in this set
	int size;

	/**
	 * Default constructor. Creates a new, empty, SplayTreeSet
	 */
	public SplayTreeSet() {
		
		root = null;
	}

	/**
	 * Shallow copy constructor. This method is fully implemented and should not
	 * be modified.
	 */
	public SplayTreeSet(Node<E> root, int size) {
		this.root = root;
		this.size = size;
	}

	/**
	 * Gets the root of this tree. Used only for testing. This method is fully
	 * implemented and should not be modified.
	 * 
	 * @return the root of this tree.
	 */
	public Node<E> getRoot() {
		return root;
	}

	/**
	 * Determines whether the set contains an element. Splays at the node that
	 * stores the element. If the element is not found, splays at the last node
	 * on the search path.
	 * 
	 * @param obj
	 *            element to be determined whether to exist in the tree
	 * @return true if the element is contained in the tree and false otherwise
	 */
	@Override
	public boolean contains(Object obj) {
		 
		 	E key = (E) obj; 				//create a obj
			Node keyNode = findEntry(key); 	// call findEntry
			if (keyNode == null) {  		// check whether its null it is is then splay the last element or else splay keyNode
				splay(last);
			} else {
				splay(keyNode);
			}
			return keyNode != null;
	}

	/**
	 * Inserts an element into the splay tree. In case the element was not
	 * contained, this creates a new node and splays the tree at the new node.
	 * If the element exists in the tree already, it splays at the node
	 * containing the element.
	 * 
	 * @param key
	 *            element to be inserted
	 * @return true if insertion is successful and false otherwise
	 */
	@Override
	public boolean add(E key) {
	
		if (root == null) {
			root = new Node<E>(key, null, null);  
			++size;
			return true;
		}

		Node <E> current = root;
		while (true) {
			int comp = current.getData().compareTo(key);
			if (comp == 0) {
				// key is already in the tree
				splay(current);
				return false;
			} else if (comp > 0) {
				if (current.getLeft() != null) {
					current = current.getLeft();
				} else {
					Node<E> newNode = new Node<E>(key);
					newNode.setParent(current);
					current.setLeft(newNode);
					++size;
					splay(newNode);
					return true;
				}
			} else {
				if (current.getRight() != null) {
					current = current.getRight();
				} else {
					Node<E> newNode = new Node<E>(key);
					newNode.setParent(current);
					current.setRight(newNode);
					++size;
					splay(newNode);
					return true;
				}
			}
		}
	}

	/**
	 * Removes the node that stores an element. Splays at its parent node after
	 * removal (No splay if the removed node was the root.) If the node was not
	 * found, the last node encountered on the search path is splayed to the
	 * root.
	 * 
	 * @param obj
	 *            element to be removed from the tree
	 * @return true if the object is removed and false if it was not contained
	 *         in the tree.
	 */
	@Override
	public boolean remove(Object obj) {
	
		E key = (E) obj;
		Node<E> n = findEntry(key);
		if (n == null) {
			splay(last);
			return false;
		}
		Node<E> parent = n.getParent();
		boolean isRoot = (n == root);
		unlinkNode(n);
		if (!isRoot)
			splay(parent);
		return true;
	}

	private Node<E> last = null;

	/**
	 * Returns the node containing key, or null if the key is not found in the
	 * tree. Called by contains().
	 * 
	 * @param key
	 * @return the node containing key, or null if not found
	 */
	protected Node<E> findEntry(E key) {
	
		Node<E> current = root;
		while (current != null) {
			int comp = current.getData().compareTo(key);
			if (comp == 0) {
				return current;
			} else if (comp > 0) {
				current = current.getLeft();
				last = current;
			} else {
				current = current.getRight();
				last = current;
			}
		}
		return null;
	}

	/**
	 * Returns the successor of the given node.
	 * 
	 * @param n
	 * @return the successor of the given node in this tree, or null if there is
	 *         no successor
	 */
	protected Node<E> successor(Node<E> n) {
	
		if (n == null) {
			return null;
		} else if (n.getRight() != null) {
			// leftmost entry in right subtree
			Node<E> current = n.getRight();
			while (current.getLeft() != null) {
				current = current.getLeft();
			}
			return current;
		} else {
			// we need to go up the tree to the closest ancestor that is
			// a left child; its parent must be the successor
			Node<E> current = n.getParent();
			Node<E> child = n;
			while (current != null && current.getRight() == child) {
				child = current;
				current = current.getParent();
			}
			// either current is null, or child is left child of current
			return current;
		}
	}

	/**
	 * Removes the given node, preserving the binary search tree property of the
	 * tree.
	 * 
	 * @param n
	 *            node to be removed
	 */
	protected void unlinkNode(Node<E> n) {
		
		if (n.getLeft() != null && n.getRight() != null) {
			Node<E> s = successor(n);
			n.setData((E) s.getData());
			n = s; // causes s to be deleted in code below
		}

		// n has at most one child
		Node<E> replacement = null;
		if (n.getLeft() != null) {
			replacement = n.getLeft();
		} else if (n.getRight() != null) {
			replacement = n.getRight();
		}

		// link replacement into tree in place of node n
		// (replacement may be null)
		if (n.getParent() == null) {
			root = replacement;
		} else {
			if (n == n.getParent().getLeft()) {
				n.getParent().setLeft(replacement);
			} else {
				n.getParent().setRight(replacement);
			}
		}

		if (replacement != null) {
			replacement.setParent(n.getParent());
		}

		--size;
	}

	@Override
	public Iterator<E> iterator() {
		return new SplayTreeIterator();
	}

	@Override
	public int size() {
	
		return size;
	}

	/**
	 * Returns a representation of this tree as a multi-line string as explained
	 * in the project description.
	 */
	@Override
	public String toString() {
	
		StringBuilder sb = new StringBuilder();
		toStringRec(root, sb, 0);
		return sb.toString();
	}

	private void toStringRec(Node<E> n, StringBuilder sb, int depth) {
		for (int i = 0; i < depth; ++i) {
			sb.append("    ");
		}
		if (n == null) {
			sb.append("null");
			sb.append("\n");
			return;
		}
		sb.append(n.getData().toString());
		sb.append("\n");
		if (n.getLeft() != null || n.getRight() != null) {
			toStringRec(n.getLeft(), sb, depth + 1);
			toStringRec(n.getRight(), sb, depth + 1);
		}
	}

	/**
	 * Splay at the current node. This consists of a sequence of zig, zigZig, or
	 * zigZag operations until the current node is moved to the root of the
	 * tree.
	 * 
	 * @param current
	 *            node at which to splay.
	 */
	protected void splay(Node<E> current) {
	
		while (current != root) {
			if (current.getParent() == root) {
				zig(current);
			} else {
				zig2(current);
			}
		}
	}

	private void zig2(Node<E> current) {
		Node<E> x = current;
		Node<E> y, z, zParent;
		Node<E> T1, T2, T3, T4;

		y = x.getParent();
		z = y.getParent();
		zParent = z.getParent();

		boolean yIsLeftChild = (y == z.getLeft());
		boolean xIsLeftChild = (x == y.getLeft());
		if (xIsLeftChild && yIsLeftChild) {
			zigZig(current);
		} else if (!xIsLeftChild && yIsLeftChild) {
			zigZag(current);
		} else if (xIsLeftChild && !yIsLeftChild) {
			zigZag(current);
		} else {
			zigZig(current);
		}
	}

	/**
	 * Performs the zig operation on a node.
	 * 
	 * @param current
	 *            node at which to perform the zig operation.
	 */
	protected void zig(Node<E> current) {
	
		Node<E> x = current;
		Node<E> y = x.getParent();
		boolean xIsLeftChild = (x == y.getLeft());
		Node<E> T1, T2, T3, T4, W;
		if (xIsLeftChild) {
			W = x.getLeft();
			T3 = x.getRight();
			T4 = y.getRight();
			x.setLeft(W);
			if (W != null)
				W.setParent(x);
			x.setRight(y);
			y.setParent(x);
			y.setLeft(T3);
			if (T3 != null)
				T3.setParent(y);
			y.setRight(T4);
			if (T4 != null)
				T4.setParent(y);
		} else {
			T1 = y.getLeft();
			T2 = x.getLeft();
			W = x.getRight();

			x.setLeft(y);
			y.setParent(x);
			x.setRight(W);
			if (W != null)
				W.setParent(x);
			y.setLeft(T1);
			if (T1 != null)
				T1.setParent(y);
			y.setRight(T2);
			if (T2 != null)
				T2.setParent(y);
		}
		root = x;
		x.setParent(null);
	}

	/**
	 * Performs the zig-zig operation on a node.
	 * 
	 * @param current
	 *            node at which to perform the zig-zig operation.
	 */
	protected void zigZig(Node<E> current) {
	
		Node<E> x = current;
		Node<E> y, z, zParent;
		Node<E> T1, T2, T3, T4;

		y = x.getParent();
		z = y.getParent();
		zParent = z.getParent();

		boolean yIsLeftChild = (y == z.getLeft());
		boolean xIsLeftChild = (x == y.getLeft());

		if (xIsLeftChild && yIsLeftChild) {
			T1 = x.getLeft();
			T2 = x.getRight();
			T3 = y.getRight();
			T4 = z.getRight();

			x.setLeft(T1);
			if (T1 != null)
				T1.setParent(x);
			x.setRight(y);
			y.setParent(x);
			y.setLeft(T2);
			if (T2 != null)
				T2.setParent(y);
			y.setRight(z);
			z.setParent(y);
			z.setLeft(T3);
			if (T3 != null)
				T3.setParent(z);
			z.setRight(T4);
			if (T4 != null)
				T4.setParent(z);
		} else {
			T1 = z.getLeft();
			T2 = y.getLeft();
			T3 = x.getLeft();
			T4 = x.getRight();

			x.setLeft(y);
			y.setParent(x);
			x.setRight(T4);
			if (T4 != null)
				T4.setParent(x);
			y.setLeft(z);
			z.setParent(y);
			y.setRight(T3);
			if (T3 != null)
				T3.setParent(y);
			z.setLeft(T1);
			if (T1 != null)
				T1.setParent(z);
			z.setRight(T2);
			if (T2 != null)
				T2.setParent(z);
		}
		if (root == z) {
			root = x; // x is now the new root
			x.setParent(null);
		} else {
			if (zParent.getLeft() == z) { /*
										 * Link x to the left branch of z's
										 * parent
										 */
				x.setParent(zParent);
				zParent.setLeft(x);
			} else { /* Link x to the right branch of z's parent */
				x.setParent(zParent);
				zParent.setRight(x);
			}
		}
	}

	/**
	 * Performs the zig-zag operation on a node.
	 * 
	 * @param current
	 *            node to perform the zig-zag operation on
	 */
	protected void zigZag(Node<E> current) {
		
		Node<E> x = current;
		Node<E> y, z, zParent;
		Node<E> T1, T2, T3, T4;

		y = x.getParent();
		z = y.getParent();
		zParent = z.getParent();

		boolean yIsLeftChild = (y == z.getLeft());
		boolean xIsLeftChild = (x == y.getLeft());

		if (!xIsLeftChild && yIsLeftChild) {
			T1 = y.getLeft();
			T2 = x.getLeft();
			T3 = x.getRight();
			T4 = z.getRight();

			x.setLeft(y);
			y.setParent(x);
			x.setRight(z);
			z.setParent(x);
			y.setLeft(T1);
			if (T1 != null)
				T1.setParent(y);
			y.setRight(T2);
			if (T2 != null)
				T2.setParent(y);
			z.setLeft(T3);
			if (T3 != null)
				T3.setParent(z);
			z.setRight(T4);
			if (T3 != null)
				T4.setParent(z);
		} else {
			T1 = z.getLeft();
			T2 = x.getLeft();
			T3 = x.getRight();
			T4 = y.getRight();

			x.setLeft(z);
			z.setParent(x);
			x.setRight(y);
			y.setParent(x);
			y.setLeft(T3);
			if (T3 != null)
				T3.setParent(y);
			y.setRight(T4);
			if (T4 != null)
				T4.setParent(y);
			z.setLeft(T1);
			if (T1 != null)
				T1.setParent(z);
			z.setRight(T2);
			if (T2 != null)
				T2.setParent(z);
		}
		if (root == z) {
			root = x; // x is now the new root
			x.setParent(null);
		} else {
			if (zParent.getLeft() == z) { /*
										 * Link x to the left branch of z's
										 * parent
										 */
				x.setParent(zParent);
				zParent.setLeft(x);
			} else { /* Link x to the right branch of z's parent */
				x.setParent(zParent);
				zParent.setRight(x);
			}
		}
	}

	/**
	 * 
	 * Iterator implementation for this splay tree. The elements are returned in
	 * ascending order according to their natural ordering.
	 * 
	 */
	private class SplayTreeIterator implements Iterator<E> {
		Node<E> cursor;

		Node<E> pending;

		public SplayTreeIterator() {
			
			cursor = root;
			if (cursor != null) {
				while (cursor.getLeft() != null) {
					cursor = cursor.getLeft();
				}
			}
		}

		@Override
		public boolean hasNext() {
			return cursor != null;
		}

		@Override
		public E next() {
		
			if (!hasNext())
				throw new NoSuchElementException();
			pending = cursor;
			cursor = successor(cursor);
			return pending.getData();
		}

		@Override
		public void remove() {

			if (pending == null)
				throw new IllegalStateException();

			if (pending.getLeft() != null && pending.getRight() != null) {
				cursor = pending;
			}
			unlinkNode(pending);
			pending = null;
		}
	}

//	public static void main(String[] args) {
//		SplayTreeSet set = new SplayTreeSet();
//		int key = 10;
//		set.add(key);
//		key = 21;
//		set.add(key);
//		key = 45;
//		set.add(key);
//		key = 81;
//		set.add(key);
//		key = 95;
//		set.add(key);
//		System.out.println(set.toString());
//		set.contains(45);
//		System.out.println(set.toString());
//	}
}