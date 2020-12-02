package lexer;
import syntax.*;

import java.io.*;
import java.util.Scanner;
import java_cup.runtime.*;

%% // ----------------------------------------------------

%public
%class Toy
%unicode
%cup

%init{

%init}

// directly turned into code
%{
TrieTable trie = new TrieTable();

public void outputTrie() {
	trie.output();
}
%}

Newline = \r | \n | \r\n
Whitespace = [ \n\t]+
Multi_Comment = [/][*][^*]*[*]+([^*/][^*]*[*]+)*[/][\r\n]?
Line_Comment = "//".*[\r\n]?
Comment = {Multi_Comment} | {Line_Comment}
Double_regular = [-+]?{Digit}+\.{Digit}*
Exponential = [-+]?{Digit}+\.{Digit}*([eE][-+]?{Digit}+)  
Double = {Double_regular} | {Exponential}
String = \"([^\"\\\\]|\\\\.)*\" | \"[^\n\"]*\"
Hexadecimal = [0][xX][0-9a-fA-F]+
Letter = [a-zA-Z]
Digit = [0-9]
Identifier = {Letter}("_"|{Letter}|{Digit})*
Integer = [+-]?{Digit}+ | [+-]?{Hexadecimal}

%% // ----------------------------------------------------

// keywords
boolean            	{System.out.print("boolean "); return new java_cup.runtime.Symbol(syntax.sym.BOOLEAN);}
break				{System.out.print("break "); return new java_cup.runtime.Symbol(syntax.sym.BREAK);}
class				{System.out.print("class "); return new java_cup.runtime.Symbol(syntax.sym.CLASS);}
double				{System.out.print("double "); return new java_cup.runtime.Symbol(syntax.sym.DOUBLE);}
else				{System.out.print("else "); return new java_cup.runtime.Symbol(syntax.sym.ELSE);}
extends				{System.out.print("extends "); return new java_cup.runtime.Symbol(syntax.sym.EXTENDS);}
false				{System.out.print("booleanconstant "); return new java_cup.runtime.Symbol(syntax.sym.BOOLEANCONSTANT);}
for					{System.out.print("for "); return new java_cup.runtime.Symbol(syntax.sym.FOR);}
if					{System.out.print("if "); return new java_cup.runtime.Symbol(syntax.sym.IF);}
implements			{System.out.print("implements "); return new java_cup.runtime.Symbol(syntax.sym.IMPLEMENTS);}
int					{System.out.print("int "); return new java_cup.runtime.Symbol(syntax.sym.INT);}
interface			{System.out.print("interace "); return new java_cup.runtime.Symbol(syntax.sym.INTERFACE);}
new					{System.out.print("new "); return new java_cup.runtime.Symbol(syntax.sym.NEW);}
newarray			{System.out.print("newarray "); return new java_cup.runtime.Symbol(syntax.sym.NEWARRAY);}
null				{System.out.print("null "); return new java_cup.runtime.Symbol(syntax.sym.NULL);}
println				{System.out.print("println "); return new java_cup.runtime.Symbol(syntax.sym.PRINTLN);}
readln				{System.out.print("readln "); return new java_cup.runtime.Symbol(syntax.sym.READLN);}
return				{System.out.print("return "); return new java_cup.runtime.Symbol(syntax.sym.RETURN);}
String 				{System.out.print("string "); return new java_cup.runtime.Symbol(syntax.sym.STRING);}
this				{System.out.print("this "); return new java_cup.runtime.Symbol(syntax.sym.THIS);}
true				{System.out.print("booleanconstant "); return new java_cup.runtime.Symbol(syntax.sym.BOOLEANCONSTANT);}
void				{System.out.print("void "); return new java_cup.runtime.Symbol(syntax.sym.VOID);}
while				{System.out.print("while "); return new java_cup.runtime.Symbol(syntax.sym.WHILE);}

"+"					{System.out.print("plus "); return new java_cup.runtime.Symbol(syntax.sym.PLUS);}
"-"					{System.out.print("minus "); return new java_cup.runtime.Symbol(syntax.sym.MINUS);}
"*"					{System.out.print("mult ");} return new java_cup.runtime.Symbol(syntax.sym.MULT);}
"/"					{System.out.print("div ");} return new java_cup.runtime.Symbol(syntax.sym.DIV);}
"%"					{System.out.print("mod ");} return new java_cup.runtime.Symbol(syntax.sym.MOD);}
"<"					{System.out.print("less ");} return new java_cup.runtime.Symbol(syntax.sym.LESS);}
"<="				{System.out.print("lesseq ");} return new java_cup.runtime.Symbol(syntax.sym.LESSEQ);}
">"					{System.out.print("greater ");} return new java_cup.runtime.Symbol(syntax.sym.GREATER);}
">="				{System.out.print("greatereq ");} return new java_cup.runtime.Symbol(syntax.sym.GREATEREQ);}
"=" 			   	{System.out.print("equal "); return new java_cup.runtime.Symbol(syntax.sym.EQUAL);}
"!="				{System.out.print("noteq ");} return new java_cup.runtime.Symbol(syntax.sym.NOTEQ);}
"&&"				{System.out.print("and ");} return new java_cup.runtime.Symbol(syntax.sym.AND);}
"||"				{System.out.print("or ");} return new java_cup.runtime.Symbol(syntax.sym.OR);}
"!"					{System.out.print("not ");} return new java_cup.runtime.Symbol(syntax.sym.NOT);}
assignop			{System.out.print("assignop ");} return new java_cup.runtime.Symbol(syntax.sym.ASSIGNOP);}
";"					{System.out.print("semicolon "); return new java_cup.runtime.Symbol(syntax.sym.SEMICOLON);}
","					{System.out.print("comma ");} return new java_cup.runtime.Symbol(syntax.sym.COMMA);}
"."					{System.out.print("period ");} return new java_cup.runtime.Symbol(syntax.sym.PERIOD);}
"("					{System.out.print("leftparen ");} return new java_cup.runtime.Symbol(syntax.sym.LEFTPAREN);}
")"					{System.out.print("rightparen ");} return new java_cup.runtime.Symbol(syntax.sym.RIGHTPAREN);}
"["					{System.out.print("leftbracket ");} return new java_cup.runtime.Symbol(syntax.sym.LEFTBRACET);}
"]"					{System.out.print("rightbracket ");} return new java_cup.runtime.Symbol(syntax.sym.RIGHTBRACKET);}
"{"					{System.out.print("leftbrace ");} return new java_cup.runtime.Symbol(syntax.sym.LEFTBRACE);}
"}"					{System.out.print("rightbrace ");} return new java_cup.runtime.Symbol(syntax.sym.RIGHTBRACE);}

{Double}			{System.out.print("doubleconstant "); return new java_cup.runtime.Symbol(syntax.sym.DOUBLECONSTANT);}
{Integer}			{System.out.print("intconstant "); return new java_cup.runtime.Symbol(syntax.sym.INTCONSTANT);}
{String}			{System.out.print("stringconstant "); return new java_cup.runtime.Symbol(syntax.sym.STRINGCONSTANT);}
{Identifier}		{System.out.printf("id "); trie.insert(yytext()); return new java_cup.runtime.Symbol(syntax.sym.ID);}
{Comment}			{/* Do nothing */}
{Newline}			{System.out.println();}
{Whitespace}		{/* Do nothing */}