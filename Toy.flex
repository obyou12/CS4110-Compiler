//Toy Project

%% // ----------------------------------------------------

%class Toy
%standalone
%line
%column

Whitespace = [ \n\t]+
Comment = [\\]
Integers = [+-]?[0-9]+
Hexadecimals = [0][Xx][0-9]+[a-fA-F]+
Letter = [a-zA-Z]
Identifier = [:jletter:] [:jletterdigit:]*
DecIntegerLiteral = 0 | [1-9][0-9]*

%% // ----------------------------------------------------

// keywords
 	<YYINITIAL> "abstract"           { return symbol(sym.ABSTRACT); }
    <YYINITIAL> "boolean"            { return symbol(sym.BOOLEAN); }
    <YYINITIAL> "break"              { return symbol(sym.BREAK); }

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