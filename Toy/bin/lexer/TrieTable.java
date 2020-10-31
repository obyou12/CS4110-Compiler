package lexer;

import java.util.Arrays;

public class TrieTable {
	private static final int ALPHABET_LENGTH = 52;
	private static final int MAX_TRANSITION = 3000;
	private int[] switchTable = new int[ALPHABET_LENGTH];
	private char[] symbolTable = new char[MAX_TRANSITION];
	private int[] next = new int[MAX_TRANSITION];
	
	// last index in symbolTable.
	private int last = 0;
	
	public TrieTable() {
		Arrays.fill(switchTable, -1);
		Arrays.fill(next, -1);
	}
	
	public void insert(String str) {
		// number to delete from character ASCII value to get switchTable index
		int n; 
		
		if(Character.isUpperCase(str.charAt(0))) {
			n = 65;
		}
		else {
			n = 71;
		}
		
		// checks switchTable to see if there is an index for the symbolTable
		if(switchTable[((int)str.charAt(0)) - n] < 0) {
			switchTable[((int)str.charAt(0)) - n] = last;
			create(str.substring(1), last);
		} 
		else {
			add(str.substring(1), switchTable[((int)str.charAt(0)) - n]);
		}
	}
	
	// add remaining characters of the string
	private void add(String str, int index) {
		int i = 0;
		
		boolean exit = false;
		while(!exit) {
			// if the current character of the string is the same as the one in the symbolTable array
			if(i < str.length() && symbolTable[index] == str.charAt(i)) { 
				if(i < str.length()) {
					index++;
					i++;
				} 
				else {
					exit = true;
				}
			} 
			// checks if identifier already exists
			else if(i == str.length() && symbolTable[index] == '@') { 
				exit = true;
			} 
			// checks from next if there is anywhere else to go
			else if (next[index] > 0) {
				index = next[index];
			}
			 // else create new identifier
			else {
				next[index] = last;
				create(str.substring(i), last);
				exit = true;
			}
		}
	}
	
	// create new identifier
	private void create(String str, int index) {
		for(int i =0; i < str.length(); i++) {
			symbolTable[index] = str.charAt(i);
			index++;
		}
		symbolTable[index] = '@';
		last = index + 1;
	}
	
	// Outputs the Trie Table
	public void output() {
		System.out.println("\n\nTrie Table:");
		
		// output the switchTable
		int lines = 15; 
		int a = 0, b = 0, n = 0;
		while(a < ALPHABET_LENGTH) {
			n = 0;
			System.out.printf("%8s","");
			// output the letters
			while(a < ALPHABET_LENGTH && n < lines) {
				if(a < 26) {
					System.out.printf("%5s", (char) (a + 65));
				}
				else {
					System.out.printf("%5s", (char) (a + 71));
				}
				a++;
				n++;
			}
			
			System.out.print("\nswitch: ");
			n = 0;
			while(b < ALPHABET_LENGTH && n < lines) {
				System.out.printf("%5d", switchTable[b]);
				b++;
				n++;
			}
			System.out.println("\n");
			
		}
		
		// output symbolTable
		int perLine = 18; // how many items per line
		int j = 0, k = 0, l = 0, m = 0;
		System.out.println("Symbol Table:");
		while(l < last) {
			
			// output the index numbers
			System.out.printf("%8s", "");
			for(m = 0; m < perLine; m++) {
				System.out.printf("%4d", j);		
				j++;
			}
			
			// output the symbolTable
			System.out.print("\nsymbol: ");
			for(m = 0; m < perLine; m++) {
				System.out.printf("%4s", symbolTable[k]);
				k++;
			}
			
			// output the next index
			System.out.print("\nnext:   ");
			for(m = 0; m < perLine; m++) {
				if(next[l]!= -1)
					System.out.printf("%4d", next[l]);
				else
					System.out.printf("%4s", "");
				l++;
			}
			System.out.println("\n");
		}
	}
}
