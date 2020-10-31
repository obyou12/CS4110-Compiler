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
boolean            	{System.out.print("boolean ");}
break				{System.out.print("break ");}
class				{System.out.print("class ");}
double				{System.out.print("double ");}
else				{System.out.print("else ");}
extends				{System.out.print("extends ");}
false				{System.out.print("booleanconstant ");}
for					{System.out.print("for ");}
if					{System.out.print("if ");}
implements			{System.out.print("implements ");}
int					{System.out.print("int ");}
interface			{System.out.print("interace ");}
new					{System.out.print("new ");}
newarray			{System.out.print("newarray ");}
null				{System.out.print("null ");}
println				{System.out.print("println ");}
readln				{System.out.print("readln ");}
return				{System.out.print("return ");}
String 				{System.out.print("string ");}
this				{System.out.print("this ");}
true				{System.out.print("booleanconstant ");}
void				{System.out.print("void ");}
while				{System.out.print("while ");}

"+"					{System.out.print("plus ");}
"-"					{System.out.print("minus ");}
"*"					{System.out.print("mult ");}
"/"					{System.out.print("div ");}
"%"					{System.out.print("mod ");}
"<"					{System.out.print("less ");}
"<="				{System.out.print("lesseq ");}
">"					{System.out.print("greater ");}
">="				{System.out.print("greatereq ");}
"=" 			   	{System.out.print("equal ");}
"!="				{System.out.print("noteq ");}
"&&"				{System.out.print("and ");}
"||"				{System.out.print("or ");}
"!"					{System.out.print("not ");}
assignop			{System.out.print("asssignop ");}
";"					{System.out.print("semicolon ");}
","					{System.out.print("comma ");}
"."					{System.out.print("period ");}
"("					{System.out.print("leftparen ");}
")"					{System.out.print("rightparen ");}
"["					{System.out.print("leftbracket ");}
"]"					{System.out.print("rightbracket ");}
"{"					{System.out.print("leftbrace ");}
"}"					{System.out.print("rightbrace ");}

{Double}			{System.out.print("doubleconstant ");}
{Integer}			{System.out.print("intconstant ");}
{String}			{System.out.print("stringconstant ");}
{Identifier}		{System.out.printf("id "); trie.insert(yytext());}
{Comment}			{/* Do nothing */}
{Newline}			{System.out.println();}
{Whitespace}		{/* Do nothing */}
