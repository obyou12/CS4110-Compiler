package lexer;
import syntax.*;

import java.io.*;
import java.util.Scanner;
import java_cup.runtime.*;

%% // ----------------------------------------------------

%public
%class Toy
//%standalone
//%line
//%column
%cup

%init{
// User added code.
// Add keyword identifiers to the trie table.
//File root = new File("input2.txt");

//File infile = new File("input2.txt");
//Scanner s;


// end user added code.
%init}




Whitespace = [ \n\t]+
Comment = [\\]
Hexadecimal = [0][xX][0-9a-fA-F]+
Letter = [a-zA-Z]
Digit = [0-9]
Identifier = {Letter}("_"|{Letter}|{Digit})*
Integer = [+-]?{Digit}+ | [+-]?{Hexadecimal}
 
//DecIntegerLiteral = 0 | [1-9][0-9]*

/*
hex       =  0[xX][0-9A-Fa-f]*+
letter    =  [a-zA-Z]
digit     =  [0-9]
newline   =  [\n]
ws        =  [ \t]+
//string    =  \"[^"\n]*\"
exponent  =  ((E|e)("+"|"-")?({digit}+))
float1    =  {digit}+"."{digit}+{exponent}?
float2    =  {digit}+{exponent}
double    =  ({float1}|{float2})
integer   =  {hex}|{digit}+
identifier=  {letter}({letter}|{digit}|"_")*
*/


%% // ----------------------------------------------------

// keywords

boolean            {System.out.println("boolean");}
//break              { return token(sym.BREAK); }

"=" 			   	{System.out.println("equal ");return new java_cup.runtime.Symbol(syntax.sym.EQUAL);}
"{"					{System.out.println("leftparen ");return new java_cup.runtime.Symbol(syntax.sym.LEFTPAREN);}
";"					{System.out.println("semicolon ");return new java_cup.runtime.Symbol(syntax.sym.SEMICOL);}
"}"					{System.out.println("leftparen ");return new java_cup.runtime.Symbol(syntax.sym.RIGHTPAREN);}
{Identifier}		{System.out.println("id "); return new java_cup.runtime.Symbol(syntax.sym.ID);}
{Whitespace}		{System.out.println("ws ");}


/*
<YYINITIAL> {
      /* identifiers */
      {Identifier}                   { return symbol(sym.IDENTIFIER); }

      /* literals */
      {DecIntegerLiteral}            { return symbol(sym.INTEGER_LITERAL); }
      \"                             { string.setLength(0); yybegin(STRING); }

      /* operators */
      "="                            { return symbol(sym.EQ); }
      "=="                           { return symbol(sym.EQEQ); }
      "+"                            { return symbol(sym.PLUS); }

      /* comments */
      {Comment}                      { /* ignore */ }

      /* whitespace */
      {Whitespace}                   { /* ignore */ }
    }
    
    {Letter}						 {System.out.prinln("Letter");}

.				{/* Do nothing */}
*/