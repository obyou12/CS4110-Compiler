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
boolean            	{return new java_cup.runtime.Symbol(syntax.sym.BOOLEAN);}
break				{return new java_cup.runtime.Symbol(syntax.sym.BREAK);}
class				{return new java_cup.runtime.Symbol(syntax.sym.CLASS);}
double				{return new java_cup.runtime.Symbol(syntax.sym.DOUBLE);}
else				{return new java_cup.runtime.Symbol(syntax.sym.ELSE);}
extends				{return new java_cup.runtime.Symbol(syntax.sym.EXTENDS);}
false				{return new java_cup.runtime.Symbol(syntax.sym.BOOLEANCONSTANT);}
for					{return new java_cup.runtime.Symbol(syntax.sym.FOR);}
if					{return new java_cup.runtime.Symbol(syntax.sym.IF);}
implements			{return new java_cup.runtime.Symbol(syntax.sym.IMPLEMENTS);}
int					{return new java_cup.runtime.Symbol(syntax.sym.INT);}
interface			{return new java_cup.runtime.Symbol(syntax.sym.INTERFACE);}
new					{return new java_cup.runtime.Symbol(syntax.sym.NEW);}
newarray			{return new java_cup.runtime.Symbol(syntax.sym.NEWARRAY);}
null				{return new java_cup.runtime.Symbol(syntax.sym.NULL);}
println				{return new java_cup.runtime.Symbol(syntax.sym.PRINTLN);}
readln				{return new java_cup.runtime.Symbol(syntax.sym.READLN);}
return				{return new java_cup.runtime.Symbol(syntax.sym.RETURN);}
string 				{return new java_cup.runtime.Symbol(syntax.sym.STRING);}
this				{return new java_cup.runtime.Symbol(syntax.sym.THIS);}
true				{return new java_cup.runtime.Symbol(syntax.sym.BOOLEANCONSTANT);}
void				{return new java_cup.runtime.Symbol(syntax.sym.VOID);}
while				{return new java_cup.runtime.Symbol(syntax.sym.WHILE);}

"+"					{return new java_cup.runtime.Symbol(syntax.sym.PLUS);}
"-"					{return new java_cup.runtime.Symbol(syntax.sym.MINUS);}
"*"					{return new java_cup.runtime.Symbol(syntax.sym.MULT);}
"/"					{return new java_cup.runtime.Symbol(syntax.sym.DIV);}
"%"					{return new java_cup.runtime.Symbol(syntax.sym.MOD);}
"<"					{return new java_cup.runtime.Symbol(syntax.sym.LESS);}
"<="				{return new java_cup.runtime.Symbol(syntax.sym.LESSEQ);}
">"					{return new java_cup.runtime.Symbol(syntax.sym.GREATER);}
">="				{return new java_cup.runtime.Symbol(syntax.sym.GREATEREQ);}
"=" 			   	{return new java_cup.runtime.Symbol(syntax.sym.EQUAL);}
"!="				{return new java_cup.runtime.Symbol(syntax.sym.NOTEQ);}
"&&"				{return new java_cup.runtime.Symbol(syntax.sym.AND);}
"||"				{return new java_cup.runtime.Symbol(syntax.sym.OR);}
"!"					{return new java_cup.runtime.Symbol(syntax.sym.NOT);}
";"					{return new java_cup.runtime.Symbol(syntax.sym.SEMICOLON);}
","					{return new java_cup.runtime.Symbol(syntax.sym.COMMA);}
"."					{return new java_cup.runtime.Symbol(syntax.sym.PERIOD);}
"("					{return new java_cup.runtime.Symbol(syntax.sym.LEFTPAREN);}
")"					{return new java_cup.runtime.Symbol(syntax.sym.RIGHTPAREN);}
"["					{return new java_cup.runtime.Symbol(syntax.sym.LEFTBRACKET);}
"]"					{return new java_cup.runtime.Symbol(syntax.sym.RIGHTBRACKET);}
"{"					{return new java_cup.runtime.Symbol(syntax.sym.LEFTBRACE);}
"}"					{return new java_cup.runtime.Symbol(syntax.sym.RIGHTBRACE);}

{Double}			{return new java_cup.runtime.Symbol(syntax.sym.DOUBLECONSTANT);}
{Integer}			{return new java_cup.runtime.Symbol(syntax.sym.INTCONSTANT);}
{String}			{return new java_cup.runtime.Symbol(syntax.sym.STRINGCONSTANT);}
{Identifier}		{trie.insert(yytext()); return new java_cup.runtime.Symbol(syntax.sym.ID);}
{Comment}			{/* Do nothing */}
{Newline}			{System.out.println();}
{Whitespace}		{/* Do nothing */}