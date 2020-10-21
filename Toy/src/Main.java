import lexer.*;
import syntax.*;
import java.io.*;

public class Main {
	public static void main( String[] args ) throws IOException{
		// get the file for the lexer, if no inputed file, use the default one.
				
				File infile = new File("input.txt");
				FileReader reader;
				try {
					infile = new File(args[0]);
					System.out.println("Using file: " + infile + "\n");
					reader = new FileReader(infile);
				} catch(IndexOutOfBoundsException e) {
					System.out.println("No inputed file detected, using default file:\n" + infile + "\n");
					reader = new FileReader(infile);
				}
				
				parser p = new parser(infile);
				System.out.println("********** Start of Syntax Analysis **********");
				try {
					p.parse();
					System.out.println("[accept]");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("[reject]"); 
				}
				
				System.out.println("\n********** End of syntax analysis **********");
			}
}

