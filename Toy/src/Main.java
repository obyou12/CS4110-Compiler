import lexer.*;
import syntax.*;
import java.io.*;

public class Main {
	public static void main(String[] args) throws IOException{
		File file = new File("input.txt"); // default file
		FileReader reader;
		
		try {
			file = new File(args[0]);
			System.out.println("File: " + file + "\n");
				reader = new FileReader(file);
		} 
		catch(IndexOutOfBoundsException e) {
			System.out.println("No inputed file detected, using default file:\n" + file + "\n");
			reader = new FileReader(file);
		}
				
		parser p = new parser(file); // parses through input file
		System.out.println("Parsing:");
		
		try {
			p.parse();
			System.out.println("\nSuccessful Parse");
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("\nUnsuccessful Parse"); 
		}
				
		System.out.println("-End of Parse");
		
		p.getToy().outputTrie(); // output Trie table
	}		
}

